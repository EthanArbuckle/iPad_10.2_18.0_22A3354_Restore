uint64_t type metadata accessor for Application()
{
  return objc_opt_self(_TtC9StocksApp11Application);
}

uint64_t sub_100005734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(v6);
  return Configurable.setting<A>(_:defaultValue:)(a1, a2, ObjectType, a6);
}

void sub_100005788(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100047F78)
  {
    v2 = type metadata accessor for DispatchWorkItemFlags(255);
    v3 = type metadata accessor for Array(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100047F78);
  }
}

uint64_t sub_1000057DC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[6];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = "\b";
  v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[3] = *(_QWORD *)(result - 8) + 64;
    v4[4] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[5] = &unk_1000387D0;
    result = swift_updateClassMetadata2(a1, 256, 6, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

void sub_10000587C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_1000096BC();

}

uint64_t type metadata accessor for StubGizmoSyncManager()
{
  return objc_opt_self(_TtC9StocksApp20StubGizmoSyncManager);
}

void sub_1000058E8(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_100008EE0(v4);

}

uint64_t type metadata accessor for ManagerAssembly()
{
  return objc_opt_self(_TtC9StocksApp15ManagerAssembly);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC9StocksApp11AppDelegate);
}

void sub_10000597C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100049550)
  {
    v2 = type metadata accessor for TaskPriority(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, &qword_100049550);
  }
}

uint64_t sub_1000059D0(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

void sub_100005A08(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!qword_100048958)
  {
    sub_10000D358(255, &qword_100048930, (uint64_t (*)(uint64_t))sub_100010338, sub_10001035C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for Publishers.RemoveDuplicates);
    v3 = v2;
    v4 = type metadata accessor for PriceChangeDisplay(255);
    v5 = sub_100010378();
    v6 = type metadata accessor for Publishers.MapKeyPath(a1, v3, v4, v5);
    if (!v7)
      atomic_store(v6, (unint64_t *)&qword_100048958);
  }
}

void *sub_100005AA0()
{
  uint64_t v0;
  void *result;
  uint64_t v2;
  _QWORD v3[6];

  result = *(void **)(v0 + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler);
  if (result)
  {
    objc_msgSend(result, "tickleWithQualityOfService:data:completion:", 9, 1, 0);
    v2 = type metadata accessor for MainActor(0);
    __chkstk_darwin(v2);
    v3[2] = v0;
    return (void *)sub_10001B26C(sub_1000100C0, (uint64_t)v3, (uint64_t)"StocksApp/StocksTodayAgent.swift", 32, 2u, 146);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100005B48()
{
  uint64_t v0;

  swift_retain(v0);
  asyncMain(block:)(sub_10001BF40, v0);
  return swift_release(v0);
}

void sub_100005B74(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_100047FC8)
  {
    v2 = type metadata accessor for AppEvent(255);
    v3 = sub_10000B308(&qword_100047FD0, 255, (uint64_t (*)(uint64_t))&type metadata accessor for AppEvent, (uint64_t)&protocol conformance descriptor for AppEvent);
    v4 = type metadata accessor for _SetStorage(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_100047FC8);
  }
}

uint64_t type metadata accessor for DebugAssembly()
{
  return objc_opt_self(_TtC9StocksApp13DebugAssembly);
}

char *sub_100005C10(char *result, int64_t a2, char a3, char *a4)
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
      sub_10000F6A0(0, &qword_100048718, (uint64_t (*)(uint64_t))sub_10000F650);
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
    sub_10000F748(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ActivityAssembly()
{
  return objc_opt_self(_TtC9StocksApp16ActivityAssembly);
}

uint64_t type metadata accessor for StocksUserActivityIntentDeserializer()
{
  return objc_opt_self(_TtC9StocksApp36StocksUserActivityIntentDeserializer);
}

void sub_100005D68(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t TupleTypeMetadata2;
  uint64_t v5;

  if (!qword_100048D20[0])
  {
    v2 = type metadata accessor for URL(255);
    sub_10000FD20(255, (unint64_t *)&qword_100049170, (uint64_t)&type metadata for String, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Optional);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2(a1, v2, v3, "url sourceApplication ", 0);
    if (!v5)
      atomic_store(TupleTypeMetadata2, qword_100048D20);
  }
}

uint64_t type metadata accessor for StocksUserActivityIntentSerializer()
{
  return objc_opt_self(_TtC9StocksApp34StocksUserActivityIntentSerializer);
}

uint64_t type metadata accessor for SettingsAssembly()
{
  return objc_opt_self(_TtC9StocksApp16SettingsAssembly);
}

unint64_t sub_100005E30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100049590;
  if (!qword_100049590)
  {
    v1 = objc_opt_self(FCBundleSubscription);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100049590);
  }
  return result;
}

void sub_100005E6C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100048940)
  {
    v2 = type metadata accessor for Watchlist(255);
    v3 = type metadata accessor for CurrentValueSubject(a1, v2, &type metadata for Never, &protocol witness table for Never);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100048940);
  }
}

uint64_t sub_100005ED0(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[4];

  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = &unk_100038328;
    v4[2] = &unk_100038340;
    v4[3] = (char *)&value witness table for Builtin.BridgeObject + 64;
    result = swift_updateClassMetadata2(a1, 256, 4, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_100005F5C(uint64_t a1, uint64_t a2)
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

uint64_t sub_100005FA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = ProxyContainer.public.getter();
  sub_10000FCC8(0, &qword_100049228, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  v2 = RegistrationContainer.register<A>(_:name:factory:)(v1, 0, 0, sub_100027F04, 0, v1);
  swift_release(v2);
  return swift_release(v0);
}

id sub_100006004()
{
  char *v0;
  objc_class *ObjectType;
  char *v2;
  char *v3;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC9StocksApp11AppDelegate_mainScene] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___containerManager] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___container] = 0;
  v2 = &v0[OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___resolver];
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_QWORD *)v2 + 4) = 0;
  v3 = &v0[OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___menuManager];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___tracker] = 0;
  v5.receiver = v0;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, "init");
}

uint64_t sub_1000060F0(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  uint64_t v5;

  sub_10000C36C(0, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

uint64_t sub_100006134()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  _BYTE v10[15];
  char v11;

  v0 = type metadata accessor for Access(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v10[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Domain(0);
  __chkstk_darwin(v4);
  v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *, _QWORD))(v7 + 104))(v6, enum case for Domain.standard(_:));
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for Access.public(_:), v0);
  v11 = 0;
  sub_100010578();
  swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
  result = Setting.init(_:defaultValue:domain:access:)(0xD000000000000028, 0x80000001000357F0, &v11, v6, v3);
  static Settings.Debug.clearCacheOnNextLaunch = result;
  return result;
}

_QWORD *sub_10000624C(_QWORD *a1, unint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *result;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;

  v4 = (uint64_t *)(v3 + *a1);
  v5 = *v4;
  if (*v4)
  {
    v6 = *v4;
LABEL_5:
    swift_unknownObjectRetain(v5);
    return (_QWORD *)v6;
  }
  sub_10000C58C((uint64_t)v16);
  v9 = v17;
  v10 = v18;
  sub_10000C1E8(v16, v17);
  v11 = sub_10000C3D0(0, a2, a3, 0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v15, v11, v11, v9, v10);
  v6 = v15[0];
  if (v15[0])
  {
    v13 = v15[1];
    sub_10000778C(v16);
    v14 = *v4;
    *v4 = v6;
    v4[1] = v13;
    swift_unknownObjectRetain(v6);
    swift_unknownObjectRelease(v14);
    v5 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_100006324(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[12] = a1;
  v2[13] = v1;
  v3 = type metadata accessor for MainActor(0);
  v2[14] = v3;
  v2[15] = static MainActor.shared.getter(v3);
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v2[16] = v4;
  v2[17] = v5;
  return swift_task_switch(sub_100009E8C, v4, v5);
}

uint64_t sub_100006394()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___containerManager;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___containerManager);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___containerManager);
  }
  else
  {
    v3 = sub_10000AC24();
    v4 = *(_QWORD *)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    swift_retain(v3);
    swift_release(v4);
    v2 = 0;
  }
  swift_retain(v2);
  return v3;
}

uint64_t type metadata accessor for PrivateDataPollingManager()
{
  return objc_opt_self(_TtC9StocksApp25PrivateDataPollingManager);
}

void sub_1000064C0()
{
  uint64_t v0;
  uint64_t ObjectType;
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
  id v12;
  void *v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;

  ObjectType = swift_getObjectType(v0);
  if (objc_msgSend((id)objc_opt_self(TFCapabilities), "isInternalBuild"))
  {
    if (qword_100047868 != -1)
      swift_once(&qword_100047868, sub_100006134);
    v3 = static Settings.Debug.clearCacheOnNextLaunch;
    v4 = sub_10000B308(&qword_100047E18, v2, (uint64_t (*)(uint64_t))type metadata accessor for AppDelegate, (uint64_t)&unk_100037C40);
    Configurable.setting<A>(_:)(v3, ObjectType, v4);
    if (LOBYTE(v14[0]) == 1)
    {
      LOBYTE(v14[0]) = 0;
      v6 = sub_10000B308((unint64_t *)&unk_100047FE0, v5, (uint64_t (*)(uint64_t))type metadata accessor for AppDelegate, (uint64_t)&unk_100037C00);
      Updatable.save<A>(setting:value:)(v3, v14, ObjectType, v6);
      sub_10000C20C((uint64_t)v14);
      v7 = v15;
      v8 = v16;
      sub_10000C1E8(v14, v15);
      v9 = type metadata accessor for DebugCacheRegistry(0);
      v10 = dispatch thunk of ResolverType.resolve<A>(_:)(v9, v9, v7, v8);
      if (v10)
      {
        v11 = v10;
        DebugCacheRegistry.clearCache()();
        swift_release(v11);
        sub_10000778C(v14);
        v12 = objc_msgSend((id)objc_opt_self(NSDistributedNotificationCenter), "defaultCenter");
        v13 = (void *)static NSNotificationName.stocksDidClearSharedCache.getter();
        objc_msgSend(v12, "postNotificationName:object:", v13, 0);

      }
      else
      {
        __break(1u);
      }
    }
  }
}

uint64_t sub_100006704@<X0>(uint64_t (*a1)(uint64_t)@<X1>, unint64_t *a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v8 = a1(0);
  v9 = swift_allocObject(v8, 16, 7);
  a4[3] = v8;
  result = sub_100008EA0(a2, a1, a3);
  a4[4] = result;
  *a4 = v9;
  return result;
}

uint64_t sub_100006774(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  v3 = a1[3];
  v4 = a1[4];
  sub_10000C1E8(a1, v3);
  v5 = a2[3];
  v6 = a2[4];
  sub_10000C1E8(a2, v5);
  v7 = type metadata accessor for WidgetContentInvalidationManager(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v7, v7, v5, v6);
  if (result)
  {
    v9 = result;
    v10 = sub_100008EA0(&qword_100048A20, type metadata accessor for WidgetContentInvalidationManager, (uint64_t)&unk_1000383F0);
    dispatch thunk of StockPriceDataManagerType.addWidgetObserver(_:)(v9, v10, v3, v4);
    return swift_release(v9);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100006820(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v7;

  sub_10000C36C(0, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(a2, a1, v7);
  return a2;
}

_QWORD *sub_10000687C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[2];

  v3 = a1[3];
  v4 = a1[4];
  sub_10000C1E8(a1, v3);
  v5 = a2[3];
  v6 = a2[4];
  sub_10000C1E8(a2, v5);
  v7 = sub_10000C3D0(0, &qword_1000488C0, (uint64_t)&protocol descriptor for GizmoSyncManagerType, 0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v15, v7, v7, v5, v6);
  v9 = v15[0];
  if (v15[0])
  {
    dispatch thunk of WatchlistManagerType.addObserver(_:)(v15[0], *(_QWORD *)(v15[1] + 8), v3, v4);
    swift_unknownObjectRelease(v9);
    v10 = a2[3];
    v11 = a2[4];
    sub_10000C1E8(a2, v10);
    v12 = type metadata accessor for WidgetContentInvalidationManager(0);
    result = (_QWORD *)dispatch thunk of ResolverType.resolve<A>(_:)(v12, v12, v10, v11);
    if (result)
    {
      v13 = result;
      v14 = sub_100008EA0(&qword_100048A28, type metadata accessor for WidgetContentInvalidationManager, (uint64_t)&unk_1000383C0);
      dispatch thunk of WatchlistManagerType.addObserver(_:)(v13, v14, v3, v4);
      return (_QWORD *)swift_release(v13);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000069B0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  v1 = type metadata accessor for CallbackScope(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v12[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  ProxyContainer.callback.getter(v12, v3);
  v7 = v13;
  v8 = v14;
  sub_10000C1E8(v12, v13);
  v9 = type metadata accessor for DebugDataSource(0);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, enum case for CallbackScope.any(_:), v1);
  swift_retain(v6);
  dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)(v9, v5, sub_100019EB0, v6, v9, v7, v8);
  swift_release(v6);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  return sub_10000778C(v12);
}

uint64_t sub_100006ABC()
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
  uint64_t v12;

  v1 = v0;
  v2 = type metadata accessor for ContainerScope(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___container;
  v7 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___container);
  if (v7)
  {
    v8 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___container);
  }
  else
  {
    v9 = sub_100006394();
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for ContainerScope.application(_:), v2);
    v8 = ContainerManager.container(for:)(v5);
    swift_release(v9);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v10 = *(_QWORD *)(v1 + v6);
    *(_QWORD *)(v1 + v6) = v8;
    swift_retain(v8);
    swift_release(v10);
    v7 = 0;
  }
  swift_retain(v7);
  return v8;
}

void sub_100006BB8(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a1;
  sub_10000A468(v8, v9, v10);

}

uint64_t sub_100006C3C(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t *);
  uint64_t v10;
  _BYTE v11[24];

  result = swift_beginAccess(a2 + 16, v11, 0, 0);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(v5 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain(*(_QWORD *)(a2 + 16));
    v7 = (uint64_t *)(v5 + 40);
    do
    {
      v9 = (void (*)(uint64_t *))*(v7 - 1);
      v8 = *v7;
      v10 = a1;
      swift_retain(v8);
      v9(&v10);
      swift_release(v8);
      v7 += 2;
      --v6;
    }
    while (v6);
    return swift_bridgeObjectRelease(v5);
  }
  return result;
}

id sub_100006D54()
{
  char *v0;
  char *v1;
  objc_class *ObjectType;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  objc_super v18;
  char v19;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType(v0);
  *(_QWORD *)&v0[qword_100048BD0] = 0;
  v3 = &v0[qword_100048BD8];
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_QWORD *)v3 + 4) = 0;
  *(_QWORD *)&v0[qword_100048BE0] = 0;
  *(_QWORD *)&v0[qword_100048BE8] = 0;
  *(_QWORD *)&v0[qword_100048BF0] = 0;
  *(_QWORD *)&v0[qword_100048BF8] = 0;
  v4 = &v0[qword_100048C00];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(_QWORD *)&v0[qword_100048C08] = 0;
  v5 = &v0[qword_100048C10];
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  *(_QWORD *)&v0[qword_100048C18] = 0;
  *(_QWORD *)&v0[qword_100048C20] = 0;
  *(_QWORD *)&v0[qword_100048C28] = 0;
  v6 = &v0[qword_100048C30];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &v0[qword_100048C38];
  sub_100005D68(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = qword_100048C40;
  v19 = 0;
  sub_1000104D4(0);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  v11 = v1;
  *(_QWORD *)&v1[v9] = StateMachine.init(state:)(&v19);
  v11[qword_100048C48] = 0;
  v12 = &v11[qword_100048C50];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  v13 = &v11[qword_100048C58];
  *(_OWORD *)v13 = 0u;
  *((_OWORD *)v13 + 1) = 0u;
  *((_QWORD *)v13 + 4) = 0;
  v14 = &v11[qword_100048C60];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v15 = &v11[qword_100048C68];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  *(_QWORD *)&v11[qword_100048C70] = 0;
  v16 = qword_100048C78;
  *(_QWORD *)&v11[v16] = sub_10002198C((uint64_t)&_swiftEmptyArrayStorage);

  v18.receiver = v11;
  v18.super_class = ObjectType;
  return objc_msgSendSuper2(&v18, "init");
}

void sub_100006F48(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;

  v1 = *(void **)(a1 + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler);
  if (v1)
  {
    v2 = (void *)objc_opt_self(UIApplication);
    v3 = v1;
    v4 = objc_msgSend(v2, "sharedApplication");
    v5 = objc_msgSend(v4, "applicationState");

    objc_msgSend(v3, "setSuspended:", v5 == 0);
  }
  else
  {
    __break(1u);
  }
}

void sub_100006FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void **aBlock;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void *v22;
  void *v23;
  uint64_t v24;

  sub_100010258(0, &qword_100049598, (uint64_t)&type metadata for Bool, (uint64_t (*)(_QWORD, uint64_t, void *, void *))&type metadata accessor for CheckedContinuation);
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  __chkstk_darwin(v6);
  v11 = (char *)&aBlock - v10;
  v12 = *(void **)(a2 + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_dropbox);
  v23 = sub_100010148;
  v24 = a3;
  aBlock = _NSConcreteStackBlock;
  v20 = 1107296256;
  v21 = sub_100005F5C;
  v22 = &unk_100043308;
  v13 = _Block_copy(&aBlock);
  v14 = v24;
  swift_retain(a3);
  swift_release(v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  v15 = *(unsigned __int8 *)(v8 + 80);
  v16 = (v15 + 16) & ~v15;
  v17 = swift_allocObject(&unk_100043340, v16 + v9, v15 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v17 + v16, v11, v7);
  v23 = sub_100010150;
  v24 = v17;
  aBlock = _NSConcreteStackBlock;
  v20 = 1107296256;
  v21 = sub_10000FC2C;
  v22 = &unk_100043358;
  v18 = _Block_copy(&aBlock);
  swift_release(v24);
  objc_msgSend(v12, "depositWithAccessor:completion:", v13, v18);
  _Block_release(v18);
  _Block_release(v13);
}

int main(int argc, const char **argv, const char **envp)
{
  int v3;
  char **v4;
  uint64_t v5;
  objc_class *ObjCClassFromMetadata;
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = static CommandLine.argc.getter(*(_QWORD *)&argc, argv, envp);
  v4 = (char **)static CommandLine.unsafeArgv.getter();
  v5 = type metadata accessor for Application();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v5);
  v7 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v7)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v9 = v8;
    v7 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  v10 = type metadata accessor for AppDelegate();
  v11 = (objc_class *)swift_getObjCClassFromMetadata(v10);
  v12 = NSStringFromClass(v11);
  if (!v12)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v14 = v13;
    v12 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v14);
  }
  UIApplicationMain(v3, v4, v7, v12);

  return 0;
}

void *sub_100007268(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *result;
  id v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  sub_10000597C(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = *(void **)&v2[OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler];
  if (result)
  {
    v9 = objc_msgSend(result, "mergedData");
    v10 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
    type metadata accessor for MainActor(0);
    v11 = v2;
    v12 = swift_retain(a2);
    v13 = static MainActor.shared.getter(v12);
    v14 = (_QWORD *)swift_allocObject(&unk_100043278, 64, 7);
    v14[2] = v13;
    v14[3] = &protocol witness table for MainActor;
    v14[4] = v11;
    v14[5] = v9;
    v14[6] = a1;
    v14[7] = a2;
    v15 = sub_1000320C8((uint64_t)v7, (uint64_t)&unk_100049560, (uint64_t)v14);
    return (void *)swift_release(v15);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100007388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(v7);
  return SceneStateMonitor.sceneDidBecomeActive(with:sourceApplication:sceneID:)(a1, a2, a3, a4, a5, ObjectType, a7);
}

void sub_1000073F4(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  NSSet v12;
  id v13;
  char v14;

  v7 = *a1;
  v8 = objc_msgSend(*a1, "purchasedTagIDs");
  if (!v8)
  {
    if (!a2)
      goto LABEL_11;
    goto LABEL_7;
  }
  v9 = v8;
  v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v8, &type metadata for String, &protocol witness table for String);

  if (a2)
  {
    if (v10)
    {
      swift_bridgeObjectRetain_n(a2, 2);
      v11 = sub_10000F950(a2, v10);
      swift_bridgeObjectRelease_n(a2, 2);
      swift_bridgeObjectRelease(v10);
      if ((v11 & 1) != 0)
        goto LABEL_11;
    }
LABEL_7:
    v12.super.isa = Set._bridgeToObjectiveC()().super.isa;
    goto LABEL_10;
  }
  if (!v10)
    goto LABEL_11;
  swift_bridgeObjectRelease(v10);
  v12.super.isa = 0;
LABEL_10:
  objc_msgSend(v7, "setPurchasedTagIDs:", v12.super.isa);

  os_unfair_lock_lock((os_unfair_lock_t)(a3 + 20));
  *(_BYTE *)(a3 + 16) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 20));
LABEL_11:
  v13 = objc_msgSend(v7, "bundleSubscription");
  sub_100005E30();
  v14 = static NSObject.== infix(_:_:)(a4);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(v7, "setBundleSubscription:", a4);
    os_unfair_lock_lock((os_unfair_lock_t)(a3 + 20));
    *(_BYTE *)(a3 + 16) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 20));
  }
}

void sub_1000075C4()
{
  uint64_t v0;

  swift_getObjectType(v0);
  SceneStateMonitor.sceneDidBecomeActive()();
}

uint64_t sub_1000076BC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000077E8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000077AC((uint64_t)v12, *a3);
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
      sub_1000077AC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000778C(v12);
  return v7;
}

uint64_t sub_10000778C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000077AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000077E8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_1000079A0(a5, a6);
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

uint64_t sub_1000079A0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100007A34(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_10001BDF8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10001BDF8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100007A34(uint64_t a1, unint64_t a2)
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
      v5 = sub_100007BA8(v4, 0);
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

_QWORD *sub_100007BA8(uint64_t a1, uint64_t a2)
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
  sub_100007C0C();
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

void sub_100007C0C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_100048B18)
  {
    v0 = type metadata accessor for _ContiguousArrayStorage(0, &type metadata for UInt8);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_100048B18);
  }
}

void sub_100007C60()
{
  id v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  int v11;
  uint64_t v12;

  v0 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v1 = objc_msgSend(v0, "connectedScenes");
  v2 = sub_1000059D0(0, &qword_100048B20, UIScene_ptr);
  v3 = sub_10000F84C();
  v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v1, v2, v3);

  sub_10001BB18(v4);
  v6 = v5;

  v7 = swift_bridgeObjectRelease(v4);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v10 = 67109120;
    v11 = v6 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v10 + 4);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "sceneDidBecomeActive isLikelyEligible: %{BOOL}d", v10, 8u);
    swift_slowDealloc(v10, -1, -1);
  }

  sub_100008508();
}

id sub_100007DD0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v18[24];
  _BYTE v19[40];
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v2 = v1;
  sub_10001C6CC((uint64_t)&v20);
  v4 = v21;
  v5 = v22;
  sub_10000C1E8(&v20, v21);
  v6 = dispatch thunk of WelcomeFlowProviderType.shouldShowWelcome()(v4, v5);
  sub_10000778C(&v20);
  if ((v6 & 1) != 0)
    return 0;
  v7 = (void *)sub_10001C4A4();
  v8 = objc_msgSend(v7, "isStateRestorationFeatureEnabled");
  swift_unknownObjectRelease(v7);
  if (!v8)
    return 0;
  v9 = (void *)sub_10001C4A4();
  v10 = objc_msgSend(v9, "isStateRestorationAllowed");
  swift_unknownObjectRelease(v9);
  v11 = 0;
  if (v10 && a1)
  {
    v12 = a1;
    v11 = objc_msgSend(v12, "stateRestorationActivity");
    v13 = v11;
    sub_10001C55C((uint64_t)&v20);
    v14 = v21;
    v15 = v22;
    sub_100021940((uint64_t)&v20, v21);
    dispatch thunk of StateRestorationActivityProvider.stateRestorationActivity.setter(v11, v14, v15);
    sub_10000C6A0(&v20, (uint64_t)v19);
    v16 = v2 + qword_100048C00;
    swift_beginAccess(v16, v18, 33, 0);
    sub_100006820((uint64_t)v19, v16, &qword_100048DC8, &qword_100048DD0, (uint64_t)&protocol descriptor for StateRestorationActivityProvider);
    swift_endAccess(v18);

  }
  return v11;
}

uint64_t sub_100007F54(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t Strong;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t result;
  uint64_t v17;
  _BYTE v18[24];
  _BYTE v19[24];

  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = a2 + 16;
  swift_beginAccess(v9, v19, 0, 0);
  Strong = swift_weakLoadStrong(v9);
  if (Strong)
  {
    v11 = Strong;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16))(v8, Strong + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_logger, v5);
    v12 = swift_release(v11);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, a3, v15, 2u);
      swift_slowDealloc(v15, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  }
  swift_beginAccess(v9, v18, 0, 0);
  result = swift_weakLoadStrong(v9);
  if (result)
  {
    v17 = result;
    sub_100009BAC(0);
    return swift_release(v17);
  }
  return result;
}

void sub_1000080C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = v0;
  v2 = type metadata accessor for ContainerScope(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = qword_100048BD0;
  v7 = *(_QWORD *)(v0 + qword_100048BD0);
  if (v7)
    goto LABEL_4;
  v8 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v9 = objc_msgSend(v8, "delegate");

  if (v9)
  {
    v10 = type metadata accessor for AppDelegate();
    swift_dynamicCastClassUnconditional(v9, v10, 0, 0, 0);
    v11 = sub_100006394();
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for ContainerScope.scene(_:), v2);
    v12 = ContainerManager.container(for:)(v5);
    swift_release(v11);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_unknownObjectRelease(v9);
    v13 = *(_QWORD *)(v1 + v6);
    *(_QWORD *)(v1 + v6) = v12;
    swift_retain(v12);
    swift_release(v13);
    v7 = 0;
LABEL_4:
    swift_retain(v7);
    return;
  }
  __break(1u);
}

uint64_t sub_100008230()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t);
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
  uint64_t v30;
  _QWORD v31[3];
  uint64_t v32;
  uint64_t v33;

  v30 = type metadata accessor for CallbackScope(0);
  v0 = *(_QWORD *)(v30 - 8);
  __chkstk_darwin(v30);
  v2 = (char *)&v31[-1] - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Scope(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v31[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = ProxyContainer.public.getter(v5);
  v9 = sub_1000084BC(0, &qword_100048618, (uint64_t)&protocol descriptor for StocksUserActivityIntentSerializerType);
  v10 = RegistrationContainer.register<A>(_:name:factory:)(v9, 0, 0, sub_10000FE8C, 0, v9);
  swift_release(v8);
  v11 = enum case for Scope.singleton(_:);
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v12(v7, enum case for Scope.singleton(_:), v3);
  v13 = Definition.inScope(_:)(v7);
  swift_release(v13);
  swift_release(v10);
  v14 = *(uint64_t (**)(char *, uint64_t))(v4 + 8);
  v15 = v14(v7, v3);
  v16 = ProxyContainer.public.getter(v15);
  v17 = sub_1000084BC(0, &qword_100048620, (uint64_t)&protocol descriptor for StocksUserActivityIntentDeserializerType);
  v18 = RegistrationContainer.register<A>(_:name:factory:)(v17, 0, 0, sub_10000FE70, 0, v17);
  swift_release(v16);
  v12(v7, v11, v3);
  v19 = Definition.inScope(_:)(v7);
  swift_release(v19);
  swift_release(v18);
  v20 = v14(v7, v3);
  v21 = ProxyContainer.private.getter(v20);
  v22 = type metadata accessor for AppIntentsDependencyStartupTask(0);
  v23 = RegistrationContainer.register<A>(_:name:factory:)(v22, 0, 0, sub_100019934, 0, v22);
  swift_release(v23);
  v24 = swift_release(v21);
  ProxyContainer.callback.getter(v31, v24);
  v25 = v32;
  v26 = v33;
  sub_10000C1E8(v31, v32);
  v27 = type metadata accessor for StartupTaskManager(0);
  v28 = v30;
  (*(void (**)(char *, _QWORD, uint64_t))(v0 + 104))(v2, enum case for CallbackScope.any(_:), v30);
  dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)(v27, v2, sub_1000199EC, 0, v27, v25, v26);
  (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v28);
  return sub_10000778C(v31);
}

uint64_t sub_1000084BC(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = a3;
    result = swift_getExistentialTypeMetadata(1, 0, 1, &v5);
    atomic_store(result, a2);
  }
  return result;
}

void sub_100008508()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v1 = v0;
  v2 = swift_retain_n(v0, 2);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = swift_slowAlloc(32, -1);
    *(_DWORD *)v5 = 136446210;
    v7 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_queuedInvalidation);
    v14 = v6;
    v8 = 1702195828;
    if ((v7 & 1) == 0)
      v8 = 0x65736C6166;
    v9 = 0xE400000000000000;
    if ((v7 & 1) == 0)
      v9 = 0xE500000000000000;
    if (v7 == 2)
      v10 = 7104878;
    else
      v10 = v8;
    if (v7 == 2)
      v11 = 0xE300000000000000;
    else
      v11 = v9;
    v13 = sub_1000076BC(v10, v11, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v5 + 4);
    swift_release_n(v1, 2);
    swift_bridgeObjectRelease(v11);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Processing queued invalidation, queued=%{public}s", v5, 0xCu);
    swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);
  }
  else
  {
    swift_release_n(v1, 2);
  }

  v12 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_queuedInvalidation);
  if (v12 != 2)
  {
    *(_BYTE *)(v1 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_queuedInvalidation) = 2;
    sub_100009BAC(v12 & 1);
  }
}

void sub_1000086DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *Strong;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[3];
  _BYTE v20[24];

  v5 = a3 + 16;
  sub_10000C36C(0, &qword_100047EF8, &qword_100047F00, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v7 = swift_allocObject(v6, 152, 7);
  *(_OWORD *)(v7 + 16) = xmmword_100037BD0;
  *(_QWORD *)(v7 + 56) = &type metadata for String;
  v8 = sub_10000FD64();
  *(_QWORD *)(v7 + 64) = v8;
  *(_QWORD *)(v7 + 32) = a1;
  *(_QWORD *)(v7 + 40) = a2;
  swift_beginAccess(v5, v20, 0, 0);
  v19[0] = swift_unknownObjectWeakLoadStrong(v5);
  sub_10000BBFC(0, &qword_100048E80, (uint64_t (*)(uint64_t))&type metadata accessor for DebugWindow, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  v10 = v9;
  swift_bridgeObjectRetain(a2);
  v11 = String.init<A>(describing:)(v19, v10);
  *(_QWORD *)(v7 + 96) = &type metadata for String;
  *(_QWORD *)(v7 + 104) = v8;
  *(_QWORD *)(v7 + 72) = v11;
  *(_QWORD *)(v7 + 80) = v12;
  swift_beginAccess(v5, v19, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v14 = Strong;
    v15 = objc_msgSend(Strong, "isKeyWindow", v19[0]);

  }
  else
  {
    v15 = 0;
  }
  *(_QWORD *)(v7 + 136) = &type metadata for Bool;
  *(_QWORD *)(v7 + 144) = &protocol witness table for Bool;
  *(_BYTE *)(v7 + 112) = v15;
  sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
  v16 = (void *)static OS_os_log.default.getter();
  v17 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("Application finished bootstrapping, sceneSession=%{public}@, window=%@, windowIsKey=%d", 86, 2, &_mh_execute_header, v16, v17, v7);
  swift_bridgeObjectRelease(v7);

  type metadata accessor for TrackingConsent(0);
  v18 = (void *)static TrackingConsent.shared.getter();
  TrackingConsent.allow()();

}

uint64_t sub_1000088A8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int v19;
  uint64_t v20;

  v1 = *(_QWORD *)(v0 + 152);
  swift_release(*(_QWORD *)(v0 + 120));
  v2 = *(unsigned __int8 *)(v0 + 192);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 20));
  v3 = *(unsigned __int8 *)(v1 + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 20));
  if (v3)
    v4 = 0xE700000000000000;
  else
    v4 = 0xEA00000000007365;
  swift_bridgeObjectRetain(v4);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = 0x6572756C696166;
    if (v2)
      v8 = 0x73736563637573;
    if (v3)
      v9 = v8;
    else
      v9 = 0x676E616863206F6ELL;
    v19 = v2;
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v20 = v11;
    *(_DWORD *)v10 = 136446210;
    swift_bridgeObjectRetain(v4);
    *(_QWORD *)(v0 + 48) = sub_1000076BC(v9, v4, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56, v10 + 4);
    swift_bridgeObjectRelease_n(v4, 3);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Finished updating today data with result: %{public}s", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    v12 = v10;
    v2 = v19;
    swift_slowDealloc(v12, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v4, 2);
  }
  v14 = *(_QWORD *)(v0 + 152);
  v13 = *(_QWORD *)(v0 + 160);
  if ((v2 & v3) == 1)
  {
    sub_100010258(0, (unint64_t *)&qword_100048908, (uint64_t)&type metadata for () + 8, (uint64_t (*)(_QWORD, uint64_t, void *, void *))&type metadata accessor for PassthroughSubject);
    v16 = v15;
    v17 = sub_100032574();
    Subject<>.send()(v16, v17);
  }
  swift_release(v14);
  swift_release(v13);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100008AFC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t Strong;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint8_t *v23;
  uint8_t *v24;
  void *v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD aBlock[5];
  uint64_t v46;
  char v47[24];

  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v44 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v41 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  v42 = *(_QWORD *)(v4 - 8);
  v43 = v4;
  __chkstk_darwin(v4);
  v40 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = type metadata accessor for DispatchTime(0);
  v6 = *(_QWORD *)(v39 - 8);
  v7 = __chkstk_darwin(v39);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v38 - v10;
  v12 = type metadata accessor for Logger(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess(a1 + 16, v47, 0, 0);
  Strong = swift_weakLoadStrong(a1 + 16);
  if (Strong)
  {
    v17 = Strong;
    v18 = a1;
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, Strong + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_logger, v12);
    v19 = swift_release(v17);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(2, -1);
      v38 = v2;
      v23 = v22;
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Attempting widget update for stock list loading", v22, 2u);
      v24 = v23;
      v2 = v38;
      swift_slowDealloc(v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    a1 = v18;
  }
  sub_1000059D0(0, &qword_100048910, OS_dispatch_queue_ptr);
  v25 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()(v25);
  + infix(_:_:)(v9, 1.0);
  v26 = *(void (**)(char *, uint64_t))(v6 + 8);
  v27 = v39;
  v26(v9, v39);
  aBlock[4] = sub_10001BB10;
  v46 = a1;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100010C34;
  aBlock[3] = &unk_100042BF8;
  v28 = _Block_copy(aBlock);
  v29 = v46;
  swift_retain(a1);
  v30 = swift_release(v29);
  v31 = v40;
  static DispatchQoS.unspecified.getter(v30);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v32 = sub_100008EA0(&qword_100047F70, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  sub_100005788(0);
  v34 = v33;
  v35 = sub_100008EA0(&qword_100047F80, (uint64_t (*)(uint64_t))sub_100005788, (uint64_t)&protocol conformance descriptor for [A]);
  v36 = v41;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v34, v35, v2, v32);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v11, v31, v36, v28);
  _Block_release(v28);

  (*(void (**)(char *, uint64_t))(v44 + 8))(v36, v2);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v31, v43);
  return ((uint64_t (*)(char *, uint64_t))v26)(v11, v27);
}

uint64_t sub_100008EA0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100008EE0(void *a1)
{
  uint64_t v1;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
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
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  void *v71;
  unsigned int v72;
  void *v73;
  unsigned __int8 v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  objc_class *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  _QWORD v94[3];
  uint64_t v95;
  uint64_t v96;

  v3 = type metadata accessor for StocksActivity(0);
  v83 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v85 = (char *)&v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000BBFC(0, &qword_100048D18, (uint64_t (*)(uint64_t))sub_100005D68, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  v6 = __chkstk_darwin(v5);
  v86 = (uint64_t)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v88 = (uint64_t)&v82 - v8;
  v9 = type metadata accessor for Date(0);
  v91 = *(_QWORD *)(v9 - 8);
  v92 = v9;
  __chkstk_darwin(v9);
  v11 = (char *)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for UUID(0);
  v89 = *(_QWORD *)(v12 - 8);
  v90 = v12;
  __chkstk_darwin(v12);
  v14 = (char *)&v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for Session.Kind(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v82 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = v1;
  v20 = *(_QWORD *)(v1 + qword_100048C18);
  v84 = v3;
  v93 = a1;
  if (v20
    || (v21 = objc_opt_self(UIWindowScene),
        (v22 = (objc_class *)swift_dynamicCastObjCClass(a1, v21)) == 0))
  {
    LODWORD(v87) = 0;
  }
  else
  {
    v87 = v22;
    sub_10000C36C(0, &qword_100047EF8, &qword_100047F00, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    v24 = swift_allocObject(v23, 72, 7);
    v25 = v24;
    *(_OWORD *)(v24 + 16) = xmmword_100037BB0;
    v26 = *(_QWORD *)(v1 + qword_100048C30 + 8);
    if (v26)
    {
      v27 = *(_QWORD *)(v1 + qword_100048C30);
      v28 = *(_QWORD *)(v1 + qword_100048C30 + 8);
    }
    else
    {
      v28 = 0xE300000000000000;
      v27 = 7104878;
    }
    *(_QWORD *)(v24 + 56) = &type metadata for String;
    *(_QWORD *)(v24 + 64) = sub_10000FD64();
    *(_QWORD *)(v25 + 32) = v27;
    *(_QWORD *)(v25 + 40) = v28;
    sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
    v82 = v93;
    v29 = swift_bridgeObjectRetain(v26);
    v30 = (void *)static OS_os_log.default.getter(v29);
    v31 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Application running deferred bootstrapping on foreground, sceneSession=%{public}@", 81, 2, &_mh_execute_header, v30, v31, v25);
    swift_bridgeObjectRelease(v25);

    v32 = *(void **)(v19 + qword_100048C20);
    v33 = v32;
    sub_10000DEF8(v87, v32);

    LODWORD(v87) = 1;
  }
  sub_10000C58C((uint64_t)v94);
  v34 = v95;
  v35 = v96;
  sub_10000C1E8(v94, v95);
  v36 = type metadata accessor for IdentificationResetManager(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v36, v36, v34, v35);
  if (!result)
  {
    __break(1u);
    goto LABEL_26;
  }
  v38 = result;
  sub_10000778C(v94);
  IdentificationResetManager.resetIdentifierIfNeeded()();
  sub_10000C58C((uint64_t)v94);
  v39 = v19;
  v40 = v95;
  v41 = v96;
  sub_10000C1E8(v94, v95);
  v42 = type metadata accessor for SessionManager(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v42, v42, v40, v41);
  if (!result)
  {
LABEL_26:
    __break(1u);
    return result;
  }
  v43 = result;
  sub_10000778C(v94);
  v44 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v16 + 104))(v18, enum case for Session.Kind.userEvents(_:), v15);
  v45 = UUID.init()(v44);
  v46 = UUID.uuidString.getter(v45);
  v48 = v47;
  v49 = (*(uint64_t (**)(char *, uint64_t))(v89 + 8))(v14, v90);
  Date.init()(v49);
  SessionManager.start(for:identifier:startDate:timestampJitter:)(v18, v46, v48, v11, 0);
  swift_bridgeObjectRelease(v48);
  (*(void (**)(char *, uint64_t))(v91 + 8))(v11, v92);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  sub_10000C41C((uint64_t)v94);
  v50 = v95;
  v51 = v96;
  sub_10000C1E8(v94, v95);
  dispatch thunk of SceneStateManagerType.willEnterForeground()(v50, v51);
  sub_10000778C(v94);
  v52 = v93;
  v53 = objc_msgSend(v93, "session");
  v54 = objc_msgSend(v53, "persistentIdentifier");

  v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
  v57 = v56;

  v58 = (uint64_t *)(v39 + qword_100048C78);
  swift_beginAccess(v39 + qword_100048C78, v94, 32, 0);
  v59 = *v58;
  if (*(_QWORD *)(v59 + 16) && (v60 = sub_10002586C(v55, v57), (v61 & 1) != 0))
  {
    v62 = v60;
    v63 = *(_QWORD *)(v59 + 56);
    sub_100005D68(0);
    v65 = v64;
    v66 = *(_QWORD *)(v64 - 8);
    v67 = v63 + *(_QWORD *)(v66 + 72) * v62;
    v68 = v88;
    sub_100020E3C(v67, v88);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v66 + 56))(v68, 0, 1, v65);
  }
  else
  {
    sub_100005D68(0);
    v68 = v88;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 56))(v88, 1, 1, v69);
  }
  v70 = (char)v87;
  swift_bridgeObjectRelease(v57);
  swift_endAccess(v94);
  if ((v70 & 1) != 0 || objc_msgSend(v52, "activationState") != (id)2)
  {
    sub_10000F608(v68, (uint64_t)&qword_100048D18, (uint64_t)sub_100005D68, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
    swift_release(v38);
    return swift_release(v43);
  }
  v71 = (void *)sub_10001C4A4();
  v72 = objc_msgSend(v71, "isStateRestorationFeatureEnabled");
  swift_unknownObjectRelease(v71);
  if (!v72)
  {
    v75 = v86;
    sub_10002169C(v68, v86, (uint64_t)&qword_100048D18, (uint64_t)sub_100005D68, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
LABEL_22:
    swift_release(v38);
    swift_release(v43);
    sub_10000F608(v75, (uint64_t)&qword_100048D18, (uint64_t)sub_100005D68, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
    v81 = v68;
    return sub_10000F608(v81, (uint64_t)&qword_100048D18, (uint64_t)sub_100005D68, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
  }
  v73 = (void *)sub_10001C4A4();
  v74 = objc_msgSend(v73, "isStateRestorationAllowed");
  swift_unknownObjectRelease(v73);
  v75 = v86;
  sub_10002169C(v68, v86, (uint64_t)&qword_100048D18, (uint64_t)sub_100005D68, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
  if ((v74 & 1) != 0)
    goto LABEL_22;
  sub_100005D68(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v76 - 8) + 48))(v75, 1, v76) != 1)
    goto LABEL_22;
  sub_10000F608(v75, (uint64_t)&qword_100048D18, (uint64_t)sub_100005D68, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
  v94[0] = sub_10001C3EC(&qword_100048BF0, (uint64_t (*)(_QWORD))sub_100021288);
  v77 = v85;
  static StocksActivity.main.getter();
  sub_100021288(0);
  v79 = v78;
  v80 = sub_100008EA0((unint64_t *)&qword_100048410, (uint64_t (*)(uint64_t))sub_100021288, (uint64_t)&protocol conformance descriptor for StackNavigator<A>);
  Navigator.navigateWithoutAnimation(to:)(v77, v79, v80);
  swift_release(v38);
  swift_release(v43);
  (*(void (**)(char *, uint64_t))(v83 + 8))(v77, v84);
  swift_release(v94[0]);
  v81 = v68;
  return sub_10000F608(v81, (uint64_t)&qword_100048D18, (uint64_t)sub_100005D68, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
}

_QWORD *sub_1000096BC()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *result;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
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
  uint64_t (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  char *v63;
  uint64_t v64;
  char v65[24];
  _QWORD v66[3];
  uint64_t v67;
  uint64_t v68;

  v1 = v0;
  sub_10000BBFC(0, &qword_1000488D0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v2);
  v63 = (char *)&v58 - v3;
  v4 = type metadata accessor for Date(0);
  v61 = *(_QWORD **)(v4 - 8);
  v62 = (_QWORD *)v4;
  __chkstk_darwin(v4);
  v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v60 - 8);
  __chkstk_darwin(v60);
  v9 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Session.Kind(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C58C((uint64_t)v66);
  v15 = v67;
  v14 = v68;
  sub_10000C1E8(v66, v67);
  v16 = type metadata accessor for IdentificationResetManager(0);
  result = (_QWORD *)dispatch thunk of ResolverType.resolve<A>(_:)(v16, v16, v15, v14);
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = result;
  sub_10000778C(v66);
  v59 = v18;
  IdentificationResetManager.resetIdentifierIfNeeded()();
  sub_10000C58C((uint64_t)v66);
  v19 = v67;
  v20 = v68;
  sub_10000C1E8(v66, v67);
  v21 = type metadata accessor for SessionManager(0);
  result = (_QWORD *)dispatch thunk of ResolverType.resolve<A>(_:)(v21, v21, v19, v20);
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v22 = result;
  sub_10000778C(v66);
  v23 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, enum case for Session.Kind.userEvents(_:), v10);
  v24 = UUID.init()(v23);
  v25 = UUID.uuidString.getter(v24);
  v27 = v26;
  v28 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v60);
  Date.init()(v28);
  SessionManager.start(for:identifier:startDate:timestampJitter:)(v13, v25, v27, v6, 0);
  swift_bridgeObjectRelease(v27);
  ((void (*)(char *, _QWORD *))v61[1])(v6, v62);
  v29 = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v61 = v22;
  v30 = SessionManager.tracker.getter(v29);
  v31 = type metadata accessor for AppSessionResumeEvent(0);
  v32 = sub_100008EA0((unint64_t *)&unk_100048E30, (uint64_t (*)(uint64_t))&type metadata accessor for AppSessionResumeEvent, (uint64_t)&protocol conformance descriptor for AppSessionResumeEvent);
  Tracker.submit<A>(_:onlyIfTimed:completion:)(v31, 0, 0, 0, v31, v32);
  swift_release(v30);
  sub_10000C41C((uint64_t)v66);
  v33 = v67;
  v34 = v68;
  sub_10000C1E8(v66, v67);
  dispatch thunk of SceneStateManagerType.didBecomeActive()(v33, v34);
  sub_10000778C(v66);
  sub_10000C41C((uint64_t)v66);
  v36 = v67;
  v35 = v68;
  v62 = sub_10000C1E8(v66, v67);
  v37 = v1;
  v38 = v1 + qword_100048C38;
  swift_beginAccess(v1 + qword_100048C38, v65, 0, 0);
  sub_100005D68(0);
  v40 = v39;
  v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 48);
  v42 = 1;
  LODWORD(v33) = v41(v38, 1, v39);
  v43 = type metadata accessor for URL(0);
  v44 = *(_QWORD *)(v43 - 8);
  if (!(_DWORD)v33)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v63, v38, v43);
    v42 = 0;
  }
  v45 = (uint64_t)v63;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v44 + 56))(v63, v42, 1, v43);
  if (v41(v38, 1, v40))
  {
    v46 = 0;
    v47 = 0;
  }
  else
  {
    v48 = (uint64_t *)(v38 + *(int *)(v40 + 48));
    v46 = *v48;
    v47 = v48[1];
    swift_bridgeObjectRetain(v47);
  }
  v49 = v35;
  v50 = *(_QWORD *)(v37 + qword_100048C30 + 8);
  v51 = v61;
  if (v50)
  {
    v52 = *(_QWORD *)(v37 + qword_100048C30);
    v53 = *(_QWORD *)(v37 + qword_100048C30 + 8);
  }
  else
  {
    v53 = 0xE300000000000000;
    v52 = 7104878;
  }
  swift_bridgeObjectRetain(v50);
  dispatch thunk of SceneStateManagerType.didBecomeActive(with:sourceApplication:sceneID:)(v45, v46, v47, v52, v53, v36, v49);
  swift_bridgeObjectRelease(v53);
  swift_bridgeObjectRelease(v47);
  sub_10000F608(v45, (uint64_t)&qword_1000488D0, (uint64_t)&type metadata accessor for URL, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
  sub_10000778C(v66);
  sub_10000C58C((uint64_t)v66);
  v54 = v67;
  v55 = v68;
  sub_10000C1E8(v66, v67);
  v56 = sub_10000C3D0(0, &qword_100047EE0, (uint64_t)&protocol descriptor for CommandCenterType, 0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(&v64, v56, v56, v54, v55);
  v57 = v64;
  if (v64)
  {
    swift_release(v59);
    swift_release(v51);
    swift_unknownObjectRelease(v57);
    return (_QWORD *)sub_10000778C(v66);
  }
LABEL_15:
  __break(1u);
  return result;
}

void sub_100009BAC(char a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint8_t *v18;
  os_log_type_t v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  BOOL v24;
  char v25;
  uint8_t *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;

  v2 = v1;
  v4 = ((uint64_t (*)(void))Logger.logObject.getter)();
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 67109120;
    v28 = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v6 + 4);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Invalidating widget content onlyIfActive=%{BOOL}d", v6, 8u);
    swift_slowDealloc(v6, -1, -1);
  }

  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_hasCompletedColdLaunch) != 1)
  {
    v15 = ((uint64_t (*)(void))Logger.logObject.getter)();
    v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v22))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      v20 = "Enqueueing invalidation because stock list hasn't loaded yet";
      v21 = v15;
      v19 = v22;
      goto LABEL_10;
    }
LABEL_11:

    v23 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_queuedInvalidation);
    v24 = v23 == 2;
    v25 = v23 & a1;
    if (v24)
      v25 = a1;
    *(_BYTE *)(v2 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_queuedInvalidation) = v25 & 1;
    return;
  }
  v7 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v8 = objc_msgSend(v7, "connectedScenes");
  v9 = sub_1000059D0(0, &qword_100048B20, UIScene_ptr);
  v10 = sub_10000F84C();
  v11 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v8, v9, v10);

  sub_10001BB18(v11);
  v13 = v12;

  v14 = swift_bridgeObjectRelease(v11);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter();
  v17 = os_log_type_enabled(v15, v16);
  if ((v13 & 1) == 0 && (a1 & 1) != 0)
  {
    if (v17)
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      v19 = v16;
      v20 = "Enqueueing invalidation due to not being the active app";
      v21 = v15;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v21, v19, v20, v18, 2u);
      swift_slowDealloc(v18, -1, -1);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (v17)
  {
    v26 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Reloading widget timelines", v26, 2u);
    swift_slowDealloc(v26, -1, -1);
  }

  type metadata accessor for WidgetCenter(0);
  v27 = static WidgetCenter.shared.getter();
  dispatch thunk of WidgetCenter.reloadAllTimelines()();
  swift_release(v27);
}

uint64_t sub_100009E8C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v20;
  id v21;
  unint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  _QWORD *v33;
  char *v34;
  NSObject *v35;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  os_log_type_t v47;
  uint64_t v48;

  v3 = v1 + 96;
  v2 = *(_QWORD *)(v1 + 96);
  *(_QWORD *)(v1 + 144) = OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_logger;
  v4 = Logger.logObject.getter(a1);
  v5 = static os_log_type_t.default.getter();
  v45 = (_QWORD *)(v1 + 80);
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    *(_DWORD *)v6 = 136446210;
    v48 = v7;
    if (v2)
      v8 = 1702195828;
    else
      v8 = 0x65736C6166;
    if (v2)
      v9 = 0xE400000000000000;
    else
      v9 = 0xE500000000000000;
    *(_QWORD *)(v1 + 72) = sub_1000076BC(v8, v9, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 72, v1 + 80, v6 + 4);
    swift_bridgeObjectRelease(v9);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Running operation. isDirty: %{public}s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    v10 = v7;
    v3 = v1 + 96;
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }

  if (v2)
  {
    v11 = *(_QWORD *)(v1 + 96);
    sub_10000F6EC(0);
    v13 = swift_allocObject(v12, 24, 7);
    *(_QWORD *)(v1 + 152) = v13;
    *(_DWORD *)(v13 + 20) = 0;
    *(_BYTE *)(v13 + 16) = 0;
    v14 = swift_allocObject(&unk_1000432C8, 24, 7);
    v15 = v14;
    *(_QWORD *)(v1 + 160) = v14;
    *(_QWORD *)(v14 + 16) = &_swiftEmptyArrayStorage;
    if ((v11 & 1) != 0)
    {
      v16 = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 104) + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_purchaseController), "allPurchasedTagIDs");
      if (v16)
      {
        v17 = v16;
        v18 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v16, &type metadata for String, &protocol witness table for String);

      }
      else
      {
        v18 = 0;
      }
      v20 = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 104) + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_bundleSubscriptionManager), "cachedSubscription");
      v21 = objc_msgSend(v20, "copy");

      _bridgeAnyObjectToAny(_:)((_QWORD *)(v3 - 80), v21);
      swift_unknownObjectRelease(v21);
      v22 = sub_100005E30();
      swift_dynamicCast(v3 - 32, v3 - 80, (char *)&type metadata for Any + 8, v22, 7);
      v23 = *(void **)(v1 + 64);
      swift_bridgeObjectRetain_n(v18, 2);
      v24 = v23;
      v25 = Logger.logObject.getter(v24);
      v26 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v25, v26))
      {
        v47 = v26;
        v44 = (_QWORD *)(v3 - 8);
        v27 = swift_slowAlloc(32, -1);
        *(_DWORD *)v27 = 134218496;
        v46 = v3;
        if (v18)
        {
          v28 = *(_QWORD *)(v18 + 16);
          swift_bridgeObjectRelease(v18);
        }
        else
        {
          v28 = 0;
        }
        *(_QWORD *)(v3 - 40) = v28;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v3 - 40, v3 - 32, v27 + 4);
        swift_bridgeObjectRelease(v18);
        *(_WORD *)(v27 + 12) = 2048;
        v29 = -[NSObject bundleChannelIDs](v24, "bundleChannelIDs");
        v30 = v18;
        v31 = objc_msgSend(v29, "count");

        *v45 = v31;
        v18 = v30;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v45, v44, v27 + 14);

        *(_WORD *)(v27 + 22) = 2048;
        v32 = -[NSObject subscriptionState](v24, "subscriptionState");

        *v44 = v32;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v44, v46, v27 + 24);

        _os_log_impl((void *)&_mh_execute_header, v25, v47, "Preparing to update purchases. purchased: %ld, bundle channels: %ld, subscriptionState: %lu", (uint8_t *)v27, 0x20u);
        swift_slowDealloc(v27, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n(v18, 2);
        v25 = v24;
      }

      v33 = (_QWORD *)swift_allocObject(&unk_1000432F0, 40, 7);
      v33[2] = v18;
      v33[3] = v13;
      v33[4] = v24;
      v34 = *(char **)(v15 + 16);
      v35 = v24;
      swift_retain(v13);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v34);
      *(_QWORD *)(v15 + 16) = v34;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v34 = sub_100005C10(0, *((_QWORD *)v34 + 2) + 1, 1, v34);
        *(_QWORD *)(v15 + 16) = v34;
      }
      v38 = *((_QWORD *)v34 + 2);
      v37 = *((_QWORD *)v34 + 3);
      if (v38 >= v37 >> 1)
        v34 = sub_100005C10((char *)(v37 > 1), v38 + 1, 1, v34);
      *((_QWORD *)v34 + 2) = v38 + 1;
      v39 = &v34[16 * v38];
      *((_QWORD *)v39 + 4) = sub_10001013C;
      *((_QWORD *)v39 + 5) = v33;
      *(_QWORD *)(v15 + 16) = v34;

    }
    v40 = *(_QWORD *)(v1 + 104);
    v41 = static MainActor.shared.getter(v14);
    *(_QWORD *)(v1 + 168) = v41;
    v42 = swift_task_alloc(32);
    *(_QWORD *)(v1 + 176) = v42;
    *(_QWORD *)(v42 + 16) = v40;
    *(_QWORD *)(v42 + 24) = v15;
    v43 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to withCheckedContinuation<A>(isolation:function:_:)
                                     + 1));
    *(_QWORD *)(v1 + 184) = v43;
    *v43 = v1;
    v43[1] = sub_1000101B8;
    return withCheckedContinuation<A>(isolation:function:_:)(v1 + 192, v41, &protocol witness table for MainActor, 0xD000000000000017, 0x80000001000378C0, sub_10003256C, v42, &type metadata for Bool);
  }
  else
  {
    swift_release(*(_QWORD *)(v1 + 120));
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_10000A468(void *a1, void *a2, void *a3)
{
  char *v3;
  char *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t ObjectType;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  id v88;
  id v89;
  void *v90;
  uint64_t v91;
  char *v92;
  id v93;
  void *v94[2];
  __int128 v95;
  uint64_t v96;
  unint64_t v97;
  id v98;
  uint64_t v99;
  objc_class *v100;
  _QWORD v101[2];
  _QWORD v102[3];
  uint64_t v103;
  uint64_t v104;

  v4 = v3;
  v8 = type metadata accessor for SceneConnectionOptions(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)v94 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_opt_self(UIWindowScene);
  v13 = (objc_class *)swift_dynamicCastObjCClass(a1, v12);
  sub_10000C36C(0, &qword_100047EF8, &qword_100047F00, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v100 = v13;
  if (!v13)
  {
    v64 = swift_allocObject(v14, 112, 7);
    *(_OWORD *)(v64 + 16) = xmmword_100037BC0;
    v65 = objc_msgSend(a2, "persistentIdentifier");
    v66 = static String._unconditionallyBridgeFromObjectiveC(_:)(v65);
    v68 = v67;

    *(_QWORD *)(v64 + 56) = &type metadata for String;
    v69 = sub_10000FD64();
    *(_QWORD *)(v64 + 64) = v69;
    *(_QWORD *)(v64 + 32) = v66;
    *(_QWORD *)(v64 + 40) = v68;
    v70 = a1;
    v71 = objc_msgSend(v70, "description");
    v72 = static String._unconditionallyBridgeFromObjectiveC(_:)(v71);
    v74 = v73;

    *(_QWORD *)(v64 + 96) = &type metadata for String;
    *(_QWORD *)(v64 + 104) = v69;
    *(_QWORD *)(v64 + 72) = v72;
    *(_QWORD *)(v64 + 80) = v74;
    v75 = sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
    v100 = (objc_class *)static OS_os_log.default.getter(v75);
    v76 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Application attempting to connect to unsupported scene type, sceneSession=%{public}@, scene=%@", 94, 2, &_mh_execute_header, v100, v76, v64);
    swift_bridgeObjectRelease(v64);

    return;
  }
  v99 = v8;
  v96 = v14;
  v15 = swift_allocObject(v14, 72, 7);
  v95 = xmmword_100037BB0;
  *(_OWORD *)(v15 + 16) = xmmword_100037BB0;
  v98 = a1;
  v16 = objc_msgSend(a2, "persistentIdentifier");
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  v19 = v18;

  *(_QWORD *)(v15 + 56) = &type metadata for String;
  v97 = sub_10000FD64();
  *(_QWORD *)(v15 + 64) = v97;
  *(_QWORD *)(v15 + 32) = v17;
  *(_QWORD *)(v15 + 40) = v19;
  v20 = (void *)sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
  v21 = (void *)static OS_os_log.default.getter(v20);
  v22 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("Application connecting to scene, sceneSession=%{public}@", 56, 2, &_mh_execute_header, v21, v22, v15);
  swift_bridgeObjectRelease(v15);

  v23 = objc_msgSend(a2, "persistentIdentifier");
  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
  v26 = v25;

  v27 = (uint64_t *)&v4[qword_100048C30];
  v28 = *(_QWORD *)&v4[qword_100048C30 + 8];
  *v27 = v24;
  v27[1] = v26;
  swift_bridgeObjectRelease(v28);
  v29 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  LODWORD(v24) = objc_msgSend(v29, "isRunningPerformanceTest");

  if ((_DWORD)v24)
  {
    sub_10000C58C((uint64_t)v102);
    v30 = v103;
    v31 = v104;
    sub_10000C1E8(v102, v103);
    v32 = sub_1000059D0(0, &qword_100047EF0, SNTestRunner_ptr);
    v33 = (void *)dispatch thunk of ResolverType.resolve<A>(_:)(v32, v32, v30, v31);
    if (!v33)
    {
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    v34 = v33;
    objc_msgSend(v33, "runExtendedLaunchTest");

    sub_10000778C(v102);
  }
  v94[1] = v20;
  v35 = -[objc_class sizeRestrictions](v100, "sizeRestrictions");
  if (v35)
  {
    v36 = v35;
    static MainMetrics.minimumWindowSize.getter();
    objc_msgSend(v36, "setMinimumSize:");

  }
  v37 = *(void **)&v4[qword_100048C20];
  *(_QWORD *)&v4[qword_100048C20] = a3;

  v38 = *(void **)&v4[qword_100048C28];
  *(_QWORD *)&v4[qword_100048C28] = a2;
  v94[0] = a3;
  v39 = a3;

  v40 = a2;
  sub_10000C41C((uint64_t)v102);
  v41 = v103;
  v42 = v104;
  sub_10000C1E8(v102, v103);
  UISceneConnectionOptions.connectionOptions.getter();
  dispatch thunk of SceneStateManagerType.sceneWillConnectToSession(withOptions:)(v11, v41, v42);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v99);
  sub_10000778C(v102);
  v43 = sub_100007DD0(a2);
  if (!v43)
    goto LABEL_10;
  v44 = v43;
  sub_10000C58C((uint64_t)v102);
  v45 = v103;
  v46 = v104;
  sub_10000C1E8(v102, v103);
  v47 = sub_10000C3D0(0, (unint64_t *)&unk_100048EA8, (uint64_t)&protocol descriptor for ScrollRestorationManagerType, 0);
  dispatch thunk of ResolverType.resolve<A>(_:)(v101, v47, v47, v45, v46);
  v48 = v101[0];
  if (!v101[0])
  {
    __break(1u);
    goto LABEL_18;
  }
  v49 = v101[1];
  sub_10000778C(v102);
  ObjectType = swift_getObjectType(v48);
  v51 = v44;
  dispatch thunk of ScrollRestorationManagerType.userActivity.setter(v44, ObjectType, v49);

  swift_unknownObjectRelease(v48);
LABEL_10:
  v52 = v98;
  v53 = objc_msgSend(v98, "activationState");
  if ((unint64_t)v53 < 2)
  {
    v54 = swift_allocObject(v96, 72, 7);
    *(_OWORD *)(v54 + 16) = v95;
    v55 = objc_msgSend(v40, "persistentIdentifier");
    v56 = static String._unconditionallyBridgeFromObjectiveC(_:)(v55);
    v58 = v57;

    v59 = v97;
    *(_QWORD *)(v54 + 56) = &type metadata for String;
    *(_QWORD *)(v54 + 64) = v59;
    *(_QWORD *)(v54 + 32) = v56;
    *(_QWORD *)(v54 + 40) = v58;
    v61 = (void *)static OS_os_log.default.getter(v60);
    v62 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Application scene bootstrapping due to not launching in background, sceneSession=%{public}@", 91, 2, &_mh_execute_header, v61, v62, v54);
    swift_bridgeObjectRelease(v54);

    sub_10000DEF8(v100, v94[0]);
LABEL_16:
    __chkstk_darwin(v63);
    v92 = v4;
    v93 = v52;
    v86 = firstly<A>(closure:)(sub_100021410, &v94[-4], (char *)&type metadata for () + 8);
    v87 = (_QWORD *)swift_allocObject(&unk_100042EB0, 40, 7);
    v87[2] = v39;
    v87[3] = v4;
    v87[4] = v52;
    v88 = v52;
    v89 = v39;
    v90 = (void *)zalgo.getter(v4);
    v91 = Promise.then<A>(on:closure:)(v90, sub_100021474, v87, (char *)&type metadata for () + 8);

    swift_release(v91);
    swift_release(v86);
    swift_release(v87);

    return;
  }
  if (v53 == (id)-1 || v53 == (id)2)
  {
    v77 = swift_allocObject(v96, 72, 7);
    *(_OWORD *)(v77 + 16) = v95;
    v78 = objc_msgSend(v40, "persistentIdentifier");
    v79 = static String._unconditionallyBridgeFromObjectiveC(_:)(v78);
    v81 = v80;

    v82 = v97;
    *(_QWORD *)(v77 + 56) = &type metadata for String;
    *(_QWORD *)(v77 + 64) = v82;
    *(_QWORD *)(v77 + 32) = v79;
    *(_QWORD *)(v77 + 40) = v81;
    v84 = (void *)static OS_os_log.default.getter(v83);
    v85 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Application scene deferring bootstrapping due to launching in background or unattached state, sceneSession=%{public}@", 117, 2, &_mh_execute_header, v84, v85, v77);
    swift_bridgeObjectRelease(v77);

    goto LABEL_16;
  }
LABEL_19:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000005BLL, 0x8000000100035290, "StocksApp/SceneDelegate.swift", 29, 2, 147, 0);
  __break(1u);
}

uint64_t sub_10000AC24()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  objc_class *v11;
  id v12;
  objc_class *v13;
  id v14;
  objc_class *v15;
  id v16;
  objc_class *v17;
  id v18;
  objc_class *v19;
  id v20;
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
  objc_class *v31;
  id v32;
  objc_class *v33;
  id v34;
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

  sub_10000C36C(0, &qword_100047E20, &qword_100047E28, (uint64_t)&protocol descriptor for BundleAssemblyType, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v1 = swift_allocObject(v0, 672, 7);
  *(_OWORD *)(v1 + 16) = xmmword_100037B90;
  v2 = objc_msgSend(objc_allocWithZone((Class)SXSwiftFrameWorkAssembly), "init");
  v3 = type metadata accessor for BridgedBundleAssembly(0);
  swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  v4 = BridgedBundleAssembly.init(_:)(v2);
  *(_QWORD *)(v1 + 56) = v3;
  *(_QWORD *)(v1 + 64) = &protocol witness table for BridgedBundleAssembly;
  *(_QWORD *)(v1 + 32) = v4;
  v5 = objc_msgSend(objc_allocWithZone((Class)NUSwiftApplicationFrameworkAssembly), "init");
  swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  v6 = BridgedBundleAssembly.init(_:)(v5);
  *(_QWORD *)(v1 + 96) = v3;
  *(_QWORD *)(v1 + 104) = &protocol witness table for BridgedBundleAssembly;
  *(_QWORD *)(v1 + 72) = v6;
  v7 = objc_msgSend(objc_allocWithZone((Class)SNAssembly), "init");
  swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  v8 = BridgedBundleAssembly.init(_:)(v7);
  *(_QWORD *)(v1 + 136) = v3;
  *(_QWORD *)(v1 + 144) = &protocol witness table for BridgedBundleAssembly;
  *(_QWORD *)(v1 + 112) = v8;
  v9 = (objc_class *)type metadata accessor for Assembly(0);
  v10 = objc_msgSend(objc_allocWithZone(v9), "init");
  *(_QWORD *)(v1 + 176) = v9;
  *(_QWORD *)(v1 + 184) = sub_10000B308(&qword_100047E30, 255, (uint64_t (*)(uint64_t))&type metadata accessor for Assembly, (uint64_t)&protocol conformance descriptor for Assembly);
  *(_QWORD *)(v1 + 152) = v10;
  v11 = (objc_class *)type metadata accessor for Assembly(0);
  v12 = objc_msgSend(objc_allocWithZone(v11), "init");
  *(_QWORD *)(v1 + 216) = v11;
  *(_QWORD *)(v1 + 224) = sub_10000B308(&qword_100047E38, 255, (uint64_t (*)(uint64_t))&type metadata accessor for Assembly, (uint64_t)&protocol conformance descriptor for Assembly);
  *(_QWORD *)(v1 + 192) = v12;
  v13 = (objc_class *)type metadata accessor for Assembly(0);
  v14 = objc_msgSend(objc_allocWithZone(v13), "init");
  *(_QWORD *)(v1 + 256) = v13;
  *(_QWORD *)(v1 + 264) = sub_10000B308(&qword_100047E40, 255, (uint64_t (*)(uint64_t))&type metadata accessor for Assembly, (uint64_t)&protocol conformance descriptor for Assembly);
  *(_QWORD *)(v1 + 232) = v14;
  v15 = (objc_class *)type metadata accessor for Assembly(0);
  v16 = objc_msgSend(objc_allocWithZone(v15), "init");
  *(_QWORD *)(v1 + 296) = v15;
  *(_QWORD *)(v1 + 304) = sub_10000B308(&qword_100047E48, 255, (uint64_t (*)(uint64_t))&type metadata accessor for Assembly, (uint64_t)&protocol conformance descriptor for Assembly);
  *(_QWORD *)(v1 + 272) = v16;
  v17 = (objc_class *)type metadata accessor for Assembly(0);
  v18 = objc_msgSend(objc_allocWithZone(v17), "init");
  *(_QWORD *)(v1 + 336) = v17;
  *(_QWORD *)(v1 + 344) = sub_10000B308(&qword_100047E50, 255, (uint64_t (*)(uint64_t))&type metadata accessor for Assembly, (uint64_t)&protocol conformance descriptor for Assembly);
  *(_QWORD *)(v1 + 312) = v18;
  v19 = (objc_class *)type metadata accessor for Assembly(0);
  v20 = objc_msgSend(objc_allocWithZone(v19), "init");
  *(_QWORD *)(v1 + 376) = v19;
  *(_QWORD *)(v1 + 384) = sub_10000B308(&qword_100047E58, 255, (uint64_t (*)(uint64_t))&type metadata accessor for Assembly, (uint64_t)&protocol conformance descriptor for Assembly);
  *(_QWORD *)(v1 + 352) = v20;
  v21 = type metadata accessor for Assembly(0);
  swift_allocObject(v21, *(unsigned int *)(v21 + 48), *(unsigned __int16 *)(v21 + 52));
  v22 = Assembly.init()();
  *(_QWORD *)(v1 + 416) = v21;
  *(_QWORD *)(v1 + 424) = sub_10000B308(&qword_100047E60, 255, (uint64_t (*)(uint64_t))&type metadata accessor for Assembly, (uint64_t)&protocol conformance descriptor for Assembly);
  *(_QWORD *)(v1 + 392) = v22;
  v23 = type metadata accessor for Assembly(0);
  swift_allocObject(v23, *(unsigned int *)(v23 + 48), *(unsigned __int16 *)(v23 + 52));
  v24 = Assembly.init()();
  *(_QWORD *)(v1 + 456) = v23;
  *(_QWORD *)(v1 + 464) = sub_10000B308(&qword_100047E68, 255, (uint64_t (*)(uint64_t))&type metadata accessor for Assembly, (uint64_t)&protocol conformance descriptor for Assembly);
  *(_QWORD *)(v1 + 432) = v24;
  v25 = type metadata accessor for Assembly(0);
  swift_allocObject(v25, *(unsigned int *)(v25 + 48), *(unsigned __int16 *)(v25 + 52));
  v26 = Assembly.init()();
  *(_QWORD *)(v1 + 496) = v25;
  *(_QWORD *)(v1 + 504) = sub_10000B308(&qword_100047E70, 255, (uint64_t (*)(uint64_t))&type metadata accessor for Assembly, (uint64_t)&protocol conformance descriptor for Assembly);
  *(_QWORD *)(v1 + 472) = v26;
  v27 = type metadata accessor for Assembly(0);
  swift_allocObject(v27, *(unsigned int *)(v27 + 48), *(unsigned __int16 *)(v27 + 52));
  v28 = Assembly.init()();
  *(_QWORD *)(v1 + 536) = v27;
  *(_QWORD *)(v1 + 544) = sub_10000B308(&qword_100047E78, 255, (uint64_t (*)(uint64_t))&type metadata accessor for Assembly, (uint64_t)&protocol conformance descriptor for Assembly);
  *(_QWORD *)(v1 + 512) = v28;
  v29 = type metadata accessor for FrameworkAssembly(0);
  swift_allocObject(v29, *(unsigned int *)(v29 + 48), *(unsigned __int16 *)(v29 + 52));
  v30 = FrameworkAssembly.init()();
  *(_QWORD *)(v1 + 576) = v29;
  *(_QWORD *)(v1 + 584) = sub_10000B308(&qword_100047E80, 255, (uint64_t (*)(uint64_t))&type metadata accessor for FrameworkAssembly, (uint64_t)&protocol conformance descriptor for FrameworkAssembly);
  *(_QWORD *)(v1 + 552) = v30;
  v31 = (objc_class *)type metadata accessor for FrameworkAssembly(0);
  v32 = objc_msgSend(objc_allocWithZone(v31), "init");
  *(_QWORD *)(v1 + 616) = v31;
  *(_QWORD *)(v1 + 624) = &protocol witness table for FrameworkAssembly;
  *(_QWORD *)(v1 + 592) = v32;
  v33 = (objc_class *)type metadata accessor for FrameworkAssembly(0);
  v34 = objc_msgSend(objc_allocWithZone(v33), "init");
  *(_QWORD *)(v1 + 656) = v33;
  *(_QWORD *)(v1 + 664) = sub_10000B308(&qword_100047E88, 255, (uint64_t (*)(uint64_t))&type metadata accessor for FrameworkAssembly, (uint64_t)&protocol conformance descriptor for FrameworkAssembly);
  *(_QWORD *)(v1 + 632) = v34;
  sub_10000C36C(0, &qword_100047E90, &qword_100047E98, (uint64_t)&protocol descriptor for AssemblyType, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v36 = swift_allocObject(v35, 192, 7);
  *(_OWORD *)(v36 + 16) = xmmword_100037BA0;
  v37 = type metadata accessor for ActivityAssembly();
  v38 = swift_allocObject(v37, 16, 7);
  *(_QWORD *)(v36 + 56) = v37;
  *(_QWORD *)(v36 + 64) = sub_10000B308(&qword_100047EA0, 255, (uint64_t (*)(uint64_t))type metadata accessor for ActivityAssembly, (uint64_t)"ũ");
  *(_QWORD *)(v36 + 32) = v38;
  v39 = type metadata accessor for DebugAssembly();
  v40 = swift_allocObject(v39, 16, 7);
  *(_QWORD *)(v36 + 96) = v39;
  *(_QWORD *)(v36 + 104) = sub_10000B308(&qword_100047EA8, 255, (uint64_t (*)(uint64_t))type metadata accessor for DebugAssembly, (uint64_t)&unk_1000381F8);
  *(_QWORD *)(v36 + 72) = v40;
  v41 = type metadata accessor for ManagerAssembly();
  v42 = swift_allocObject(v41, 16, 7);
  *(_QWORD *)(v36 + 136) = v41;
  *(_QWORD *)(v36 + 144) = sub_10000B308(&qword_100047EB0, 255, (uint64_t (*)(uint64_t))type metadata accessor for ManagerAssembly, (uint64_t)&unk_10003827C);
  *(_QWORD *)(v36 + 112) = v42;
  v43 = type metadata accessor for SettingsAssembly();
  v44 = swift_allocObject(v43, 16, 7);
  *(_QWORD *)(v36 + 176) = v43;
  *(_QWORD *)(v36 + 184) = sub_10000B308(&qword_100047EB8, 255, (uint64_t (*)(uint64_t))type metadata accessor for SettingsAssembly, (uint64_t)"ݪ");
  *(_QWORD *)(v36 + 152) = v44;
  v45 = type metadata accessor for SingletonPool(0);
  swift_allocObject(v45, *(unsigned int *)(v45 + 48), *(unsigned __int16 *)(v45 + 52));
  v46 = SingletonPool.init()();
  v47 = type metadata accessor for ContainerManager(0);
  swift_allocObject(v47, *(unsigned int *)(v47 + 48), *(unsigned __int16 *)(v47 + 52));
  return ContainerManager.init(singletonPool:bundleAssemblies:assemblies:)(v46, v1, v36);
}

uint64_t sub_10000B308(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000B348(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
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
  void (*v45)(uint64_t, _QWORD, uint64_t);
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t (*v61)();
  uint64_t v62;
  uint64_t result;
  uint64_t v64;
  void *v65;
  uint64_t (*v66)();
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  void *v73;
  uint64_t (*v74)();
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t ObjectType;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  _QWORD v91[5];
  _QWORD aBlock[3];
  void *v93;
  uint64_t (*v94)();
  uint64_t v95;

  v2 = v1;
  v80 = a1;
  ObjectType = swift_getObjectType(v1);
  v3 = type metadata accessor for StartupTaskExecutionPhase(0);
  v82 = *(_QWORD *)(v3 - 8);
  v83 = v3;
  __chkstk_darwin(v3);
  v81 = (char *)&v79 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = type metadata accessor for EventTriggerBehavior(0);
  v88 = *(_QWORD *)(v90 - 8);
  __chkstk_darwin(v90);
  v89 = (char *)&v79 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v87 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  v85 = *(_QWORD *)(v9 - 8);
  v86 = v9;
  __chkstk_darwin(v9);
  v11 = (char *)&v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Container.Environment(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C36C(0, &qword_100047EF8, &qword_100047F00, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v17 = swift_allocObject(v16, 72, 7);
  *(_OWORD *)(v17 + 16) = xmmword_100037BB0;
  v18 = sub_100006394();
  ContainerManager.containerEnvironment.getter();
  swift_release(v18);
  v19 = sub_10000B308((unint64_t *)&unk_100047F60, 255, (uint64_t (*)(uint64_t))&type metadata accessor for Container.Environment, (uint64_t)&protocol conformance descriptor for Container.Environment);
  v20 = dispatch thunk of CustomStringConvertible.description.getter(v12, v19);
  v22 = v21;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  *(_QWORD *)(v17 + 56) = &type metadata for String;
  *(_QWORD *)(v17 + 64) = sub_10000FD64();
  *(_QWORD *)(v17 + 32) = v20;
  *(_QWORD *)(v17 + 40) = v22;
  v23 = sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
  v24 = (void *)static OS_os_log.default.getter(v23);
  v25 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("Application will finish launching with container environment=%{public}@", 71, 2, &_mh_execute_header, v24, v25, v17);
  swift_bridgeObjectRelease(v17);

  type metadata accessor for Logging(0);
  v26 = static Settings.NewsFeedModule.Layout.enableLogDebugging.getter();
  v28 = sub_10000B308(&qword_100047E18, v27, (uint64_t (*)(uint64_t))type metadata accessor for AppDelegate, (uint64_t)&unk_100037C40);
  Configurable.setting<A>(_:)(v26, ObjectType, v28);
  swift_release(v26);
  static Logging.debuggingEnabled.setter(LOBYTE(aBlock[0]));
  sub_1000059D0(0, &qword_100048910, OS_dispatch_queue_ptr);
  v29 = (void *)static OS_dispatch_queue.global(qualityOfService:)(9);
  v94 = sub_100010C1C;
  v95 = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100010C34;
  v93 = &unk_100042718;
  v30 = _Block_copy(aBlock);
  static DispatchQoS.unspecified.getter();
  v91[0] = &_swiftEmptyArrayStorage;
  v31 = sub_10000B308(&qword_100047F70, 255, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  sub_10000BBFC(0, (unint64_t *)&qword_100047F78, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  v33 = v32;
  v34 = sub_100012EC0(&qword_100047F80, (unint64_t *)&qword_100047F78, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  dispatch thunk of SetAlgebra.init<A>(_:)(v91, v33, v34, v6, v31);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v8, v30);
  _Block_release(v30);

  (*(void (**)(char *, uint64_t))(v87 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v85 + 8))(v11, v86);
  sub_1000064C0();
  objc_msgSend((id)objc_opt_self(FCTaskScheduler), "pushHighPriorityTaskInFlight");
  type metadata accessor for Tracker(0);
  v35 = static Tracker.appEventManager.getter();
  sub_10000BBFC(0, &qword_100047F88, (uint64_t (*)(uint64_t))&type metadata accessor for AppEvent, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v37 = v36;
  v38 = type metadata accessor for AppEvent(0);
  v39 = *(_QWORD *)(v38 - 8);
  v40 = *(_QWORD *)(v39 + 72);
  v41 = *(unsigned __int8 *)(v39 + 80);
  v42 = (v41 + 32) & ~v41;
  v43 = swift_allocObject(v37, v42 + 2 * v40, v41 | 7);
  *(_OWORD *)(v43 + 16) = xmmword_100037BC0;
  v44 = v43 + v42;
  v45 = *(void (**)(uint64_t, _QWORD, uint64_t))(v39 + 104);
  v45(v44, enum case for AppEvent.stockListDidLoad(_:), v38);
  v45(v44 + v40, enum case for AppEvent.forYouFeedDidLoad(_:), v38);
  v46 = sub_100011D5C(v43);
  swift_setDeallocating(v43);
  swift_arrayDestroy(v44, 2, v38);
  swift_deallocClassInstance(v43, 32, 7);
  sub_10000BBFC(0, (unint64_t *)&unk_100047F90, (uint64_t (*)(uint64_t))&type metadata accessor for EventTriggerBehavior, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v47 = v88;
  v49 = swift_allocObject(v48, ((*(unsigned __int8 *)(v88 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80))+ 3 * *(_QWORD *)(v88 + 72), *(unsigned __int8 *)(v88 + 80) | 7);
  *(_OWORD *)(v49 + 16) = xmmword_100037BD0;
  v50 = static EventTriggerBehavior.onlyOnce.getter();
  v51 = static EventTriggerBehavior.eager.getter(v50);
  static EventTriggerBehavior.all.getter(v51);
  aBlock[0] = v49;
  v52 = sub_10000B308((unint64_t *)&unk_1000489B0, 255, (uint64_t (*)(uint64_t))&type metadata accessor for EventTriggerBehavior, (uint64_t)&protocol conformance descriptor for EventTriggerBehavior);
  sub_10000BBFC(0, (unint64_t *)&unk_100047FA0, (uint64_t (*)(uint64_t))&type metadata accessor for EventTriggerBehavior, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  v54 = v53;
  v55 = sub_100012EC0((unint64_t *)&qword_1000489C0, (unint64_t *)&unk_100047FA0, (uint64_t (*)(uint64_t))&type metadata accessor for EventTriggerBehavior);
  v56 = v89;
  v57 = v54;
  v58 = v90;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v57, v55, v90, v52);
  v59 = swift_allocObject(&unk_100042750, 24, 7);
  *(_QWORD *)(v59 + 16) = v2;
  v2;
  dispatch thunk of EventManager.trigger(on:behavior:block:)(v46, v56, sub_100012F08, v59);
  swift_release(v35);
  swift_bridgeObjectRelease(v46);
  swift_release(v59);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v56, v58);
  sub_10000C20C((uint64_t)aBlock);
  v60 = v93;
  v61 = v94;
  sub_10000C1E8(aBlock, (uint64_t)v93);
  v62 = type metadata accessor for AppSessionManager(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v62, v62, v60, v61);
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  v64 = result;
  sub_10000778C(aBlock);
  AppSessionManager.startAppSession()();
  sub_10000C20C((uint64_t)aBlock);
  v65 = v93;
  v66 = v94;
  sub_10000C1E8(aBlock, (uint64_t)v93);
  v67 = type metadata accessor for StartupTaskManager(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v67, v67, v65, v66);
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v68 = result;
  sub_10000778C(aBlock);
  if (v80)
    v69 = Dictionary<>.applicationStateLaunchOptions.getter();
  else
    v69 = 0;
  v71 = v81;
  v70 = v82;
  v72 = v83;
  (*(void (**)(char *, _QWORD, uint64_t))(v82 + 104))(v81, enum case for StartupTaskExecutionPhase.willFinishLaunching(_:), v83);
  StartupTaskManager.startAllTasks(launchOptions:phase:)(v69, v71);
  swift_bridgeObjectRelease(v69);
  (*(void (**)(char *, uint64_t))(v70 + 8))(v71, v72);
  sub_10000C20C((uint64_t)aBlock);
  v73 = v93;
  v74 = v94;
  sub_10000C1E8(aBlock, (uint64_t)v93);
  v75 = sub_10000C3D0(0, &qword_100047FB0, (uint64_t)&protocol descriptor for StocksTabiWorkServiceUnloaderServiceType, 1);
  result = (uint64_t)dispatch thunk of ResolverType.resolve<A>(_:)(v91, v75, v75, v73, v74);
  if (v91[3])
  {
    sub_1000060F0((uint64_t)v91, &qword_100047FB8, &qword_100047FB0, (uint64_t)&protocol descriptor for StocksTabiWorkServiceUnloaderServiceType);
    sub_10000778C(aBlock);
    v76 = sub_1000059D0(0, &qword_100047FC0, UINavigationBar_ptr);
    v77 = objc_msgSend((id)swift_getObjCClassFromMetadata(v76), "appearance");
    v78 = objc_msgSend(objc_allocWithZone((Class)UIImage), "init");
    objc_msgSend(v77, "setShadowImage:", v78);

    swift_release(v64);
    swift_release(v68);
    return 1;
  }
LABEL_10:
  __break(1u);
  return result;
}

void sub_10000BBFC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_10000BC54(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
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
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t result;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[3];
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[3];
  uint64_t v58;
  uint64_t v59;

  v3 = v2;
  v6 = type metadata accessor for StartupTaskExecutionPhase(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C36C(0, &qword_100047EF8, &qword_100047F00, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v11 = swift_allocObject(v10, 72, 7);
  *(_OWORD *)(v11 + 16) = xmmword_100037BB0;
  v12 = objc_msgSend(a1, "applicationState");
  if (!v12)
  {
    v13 = 0xE600000000000000;
    v14 = 0x657669746361;
    goto LABEL_7;
  }
  if (v12 == (id)1)
  {
    v13 = 0xE800000000000000;
    v14 = 0x6576697463616E69;
    goto LABEL_7;
  }
  if (v12 == (id)2)
  {
    v13 = 0xEA0000000000646ELL;
    v14 = 0x756F72676B636162;
LABEL_7:
    *(_QWORD *)(v11 + 56) = &type metadata for String;
    *(_QWORD *)(v11 + 64) = sub_10000FD64();
    *(_QWORD *)(v11 + 32) = v14;
    *(_QWORD *)(v11 + 40) = v13;
    v15 = sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
    v16 = (void *)static OS_os_log.default.getter(v15);
    v17 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Application did finish launching with application state=%{public}@", 66, 2, &_mh_execute_header, v16, v17, v11);
    swift_bridgeObjectRelease(v11);

    sub_10000C20C((uint64_t)v57);
    v18 = v58;
    v19 = v59;
    sub_10000C1E8(v57, v58);
    v20 = type metadata accessor for StartupTaskManager(0);
    v21 = dispatch thunk of ResolverType.resolve<A>(_:)(v20, v20, v18, v19);
    if (v21)
    {
      v22 = v21;
      sub_10000778C(v57);
      if (a2)
        v23 = Dictionary<>.applicationStateLaunchOptions.getter(a2);
      else
        v23 = 0;
      (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for StartupTaskExecutionPhase.didFinishLaunching(_:), v6);
      StartupTaskManager.startAllTasks(launchOptions:phase:)(v23, v9);
      swift_bridgeObjectRelease(v23);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      sub_10000C20C((uint64_t)v57);
      v24 = v58;
      v25 = v59;
      sub_10000C1E8(v57, v58);
      v26 = type metadata accessor for RemoteNotificationManager(0);
      v27 = dispatch thunk of ResolverType.resolve<A>(_:)(v26, v26, v24, v25);
      if (v27)
      {
        v28 = v27;
        sub_10000778C(v57);
        v29 = swift_allocObject(&unk_100042700, 24, 7);
        *(_QWORD *)(v29 + 16) = a1;
        v30 = a1;
        RemoteNotificationManager.whenActive(block:)(sub_100010074, v29);
        swift_release(v29);
        sub_10000C20C((uint64_t)v54);
        v31 = v55;
        v32 = v56;
        sub_10000C1E8(v54, v55);
        v33 = sub_10000C3D0(0, &qword_100047F40, (uint64_t)&protocol descriptor for ApplicationStateManagerType, 1);
        dispatch thunk of ResolverType.resolve<A>(_:)(&v51, v33, v33, v31, v32);
        if (v52)
        {
          sub_10000C6A0(&v51, (uint64_t)v57);
          sub_10000778C(v54);
          v34 = v58;
          v35 = v59;
          sub_10000C1E8(v57, v58);
          if (a2)
            a2 = Dictionary<>.applicationStateLaunchOptions.getter(a2);
          dispatch thunk of ApplicationStateManagerType.applicationDidFinishLaunching(withOptions:)(a2, v34, v35);
          swift_bridgeObjectRelease(a2);
          sub_10000C20C((uint64_t)v54);
          v36 = v55;
          v37 = v56;
          sub_10000C1E8(v54, v55);
          v38 = sub_10001043C();
          v39 = dispatch thunk of ResolverType.resolve<A>(_:)(v38, v38, v36, v37);
          if (v39)
          {
            v40 = (void *)v39;
            sub_10000778C(v54);
            objc_msgSend(v40, "prepareForUseWithApplicationDelegate:", v3);
            v41 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
            v42 = type metadata accessor for Application();
            v43 = swift_dynamicCastClass(v41, v42);
            if (!v43)
            {
              swift_unknownObjectRelease(v40);
              swift_release(v22);
              swift_release(v28);

              goto LABEL_20;
            }
            sub_10000C20C((uint64_t)&v51);
            v44 = v52;
            v45 = v53;
            sub_10000C1E8(&v51, v52);
            v46 = sub_10000C3D0(0, (unint64_t *)&qword_100047F50, (uint64_t)&protocol descriptor for KeyboardInputMonitorType, 1);
            dispatch thunk of ResolverType.resolve<A>(_:)(&v49, v46, v46, v44, v45);
            if (v50)
            {
              sub_10000C6A0(&v49, (uint64_t)v54);
              sub_10000778C(&v51);
              sub_100010534((uint64_t)v54, (uint64_t)&v51);
              v47 = v43 + OBJC_IVAR____TtC9StocksApp11Application_keyboardInputMonitor;
              swift_beginAccess(v43 + OBJC_IVAR____TtC9StocksApp11Application_keyboardInputMonitor, &v49, 33, 0);
              sub_100006820((uint64_t)&v51, v47, (unint64_t *)&qword_100047F58, (unint64_t *)&qword_100047F50, (uint64_t)&protocol descriptor for KeyboardInputMonitorType);
              swift_endAccess(&v49);
              swift_unknownObjectRelease(v40);
              swift_release(v22);
              swift_release(v28);

              sub_10000778C(v54);
LABEL_20:
              sub_10000778C(v57);
              return v43 != 0;
            }
            goto LABEL_25;
          }
LABEL_24:
          __break(1u);
LABEL_25:
          __break(1u);
          goto LABEL_26;
        }
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_23;
  }
LABEL_26:
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000005BLL, 0x8000000100035290, "StocksApp/UIApplication+Stocks.swift", 36, 2, 22, 0);
  __break(1u);
  return result;
}

_QWORD *sub_10000C1E8(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000C20C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v5;
  _BYTE v6[24];
  __int128 v7;
  uint64_t v8;
  _BYTE v9[24];

  v3 = v1 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___resolver;
  swift_beginAccess(v1 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___resolver, v9, 0, 0);
  sub_10000C308(v3, (uint64_t)&v7);
  if (v8)
    return sub_10000C6A0(&v7, a1);
  sub_1000060F0((uint64_t)&v7, (unint64_t *)&unk_100047ED0, (unint64_t *)&unk_100048DB0, (uint64_t)&protocol descriptor for ResolverType);
  v5 = sub_100006ABC();
  Container.resolver.getter();
  swift_release(v5);
  sub_100010534(a1, (uint64_t)&v7);
  swift_beginAccess(v3, v6, 33, 0);
  sub_100006820((uint64_t)&v7, v3, (unint64_t *)&unk_100047ED0, (unint64_t *)&unk_100048DB0, (uint64_t)&protocol descriptor for ResolverType);
  return swift_endAccess(v6);
}

uint64_t sub_10000C308(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_10000C36C(0, (unint64_t *)&unk_100047ED0, (unint64_t *)&unk_100048DB0, (uint64_t)&protocol descriptor for ResolverType, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_10000C36C(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    v8 = sub_10000C3D0(255, a3, a4, 1);
    v9 = a5(a1, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

uint64_t sub_10000C3D0(uint64_t a1, unint64_t *a2, uint64_t a3, char a4)
{
  uint64_t result;
  uint64_t v6;

  result = *a2;
  if (!*a2)
  {
    v6 = a3;
    result = swift_getExistentialTypeMetadata(a4 & 1, 0, 1, &v6);
    atomic_store(result, a2);
  }
  return result;
}

_QWORD *sub_10000C41C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[24];

  v3 = v1 + qword_100048C58;
  swift_beginAccess(v1 + qword_100048C58, v13, 0, 0);
  sub_10000C6B8(v3, (uint64_t)&v10, &qword_100048E18, &qword_100048E20, (uint64_t)&protocol descriptor for SceneStateManagerType);
  if (v11)
    return (_QWORD *)sub_10000C6A0(&v10, a1);
  sub_1000060F0((uint64_t)&v10, &qword_100048E18, &qword_100048E20, (uint64_t)&protocol descriptor for SceneStateManagerType);
  sub_10000C58C((uint64_t)&v10);
  v5 = v11;
  v6 = v12;
  sub_10000C1E8(&v10, v11);
  v7 = sub_10000C3D0(0, &qword_100048E20, (uint64_t)&protocol descriptor for SceneStateManagerType, 1);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(&v8, v7, v7, v5, v6);
  if (v9)
  {
    sub_10000C6A0(&v8, a1);
    sub_10000778C(&v10);
    sub_100010534(a1, (uint64_t)&v10);
    swift_beginAccess(v3, &v8, 33, 0);
    sub_100006820((uint64_t)&v10, v3, &qword_100048E18, &qword_100048E20, (uint64_t)&protocol descriptor for SceneStateManagerType);
    return (_QWORD *)swift_endAccess(&v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000C58C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[24];
  __int128 v8;
  uint64_t v9;
  _BYTE v10[24];

  v3 = v1 + qword_100048BD8;
  swift_beginAccess(v1 + qword_100048BD8, v10, 0, 0);
  sub_10000C6B8(v3, (uint64_t)&v8, (unint64_t *)&unk_100047ED0, (unint64_t *)&unk_100048DB0, (uint64_t)&protocol descriptor for ResolverType);
  if (v9)
    return sub_10000C6A0(&v8, a1);
  sub_1000060F0((uint64_t)&v8, (unint64_t *)&unk_100047ED0, (unint64_t *)&unk_100048DB0, (uint64_t)&protocol descriptor for ResolverType);
  sub_1000080C4();
  v6 = v5;
  Container.resolver.getter();
  swift_release(v6);
  sub_100010534(a1, (uint64_t)&v8);
  swift_beginAccess(v3, v7, 33, 0);
  sub_100006820((uint64_t)&v8, v3, (unint64_t *)&unk_100047ED0, (unint64_t *)&unk_100048DB0, (uint64_t)&protocol descriptor for ResolverType);
  return swift_endAccess(v7);
}

uint64_t sub_10000C6A0(__int128 *a1, uint64_t a2)
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

uint64_t sub_10000C6B8(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v7;

  sub_10000C36C(0, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a2, a1, v7);
  return a2;
}

uint64_t sub_10000C714(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
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
  void *v19;
  uint64_t v20;
  _QWORD v21[5];

  v3 = a1[3];
  v4 = a1[4];
  sub_10000C1E8(a1, v3);
  v5 = a2[3];
  v6 = a2[4];
  sub_10000C1E8(a2, v5);
  v7 = type metadata accessor for PrivateDataPollingManager();
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v7, v7, v5, v6);
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  v9 = result;
  v10 = sub_100008EA0(&qword_100048A08, (uint64_t (*)(uint64_t))type metadata accessor for PrivateDataPollingManager, (uint64_t)&unk_10003808C);
  dispatch thunk of SceneStateManagerType.add(monitor:)(v21, v9, v10, v3, v4);
  swift_release(v9);
  sub_10000778C(v21);
  v11 = a2[3];
  v12 = a2[4];
  sub_10000C1E8(a2, v11);
  v13 = type metadata accessor for WidgetContentInvalidationManager(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v13, v13, v11, v12);
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v14 = result;
  v15 = sub_100008EA0(&qword_100048A10, type metadata accessor for WidgetContentInvalidationManager, (uint64_t)&unk_100038358);
  dispatch thunk of SceneStateManagerType.add(monitor:)(v21, v14, v15, v3, v4);
  swift_release(v14);
  sub_10000778C(v21);
  v16 = a2[3];
  v17 = a2[4];
  sub_10000C1E8(a2, v16);
  v18 = type metadata accessor for StocksTodayAgent(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v18, v18, v16, v17);
  if (result)
  {
    v19 = (void *)result;
    v20 = sub_100008EA0(&qword_100048A18, type metadata accessor for StocksTodayAgent, (uint64_t)&unk_1000387F0);
    dispatch thunk of SceneStateManagerType.add(monitor:)(v21, v19, v20, v3, v4);

    return sub_10000778C(v21);
  }
LABEL_7:
  __break(1u);
  return result;
}

_QWORD *sub_10000C8DC(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t KeyPath;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
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
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _OWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  _QWORD *v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  id v126[3];
  uint64_t v127;

  v4 = v3;
  v125 = a1;
  v111 = *v4;
  v124 = type metadata accessor for EventTriggerBehavior(0);
  v122 = *(_QWORD *)(v124 - 8);
  __chkstk_darwin(v124);
  v123 = (char *)&v97 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for AppEvent(0);
  v120 = *(_QWORD *)(v8 - 8);
  v121 = v8;
  __chkstk_darwin(v8);
  v119 = (char *)&v97 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for NewsEnvironment(0);
  v117 = *(_QWORD *)(v10 - 8);
  v118 = v10;
  __chkstk_darwin(v10);
  v116 = (char *)&v97 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for NewsProvider(0);
  v113 = *(_QWORD *)(v12 - 8);
  v114 = v12;
  __chkstk_darwin(v12);
  v112 = (char *)&v97 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for FeatureState(0);
  v109 = *(_QWORD *)(v14 - 8);
  v110 = v14;
  __chkstk_darwin(v14);
  v108 = (char *)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D41C(0, &qword_100048900, (uint64_t (*)(uint64_t))sub_1000102B4, sub_10001031C);
  v106 = v16;
  v107 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v105 = (char *)&v97 - v17;
  sub_10000BBFC(0, &qword_100048928, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.SchedulerOptions, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v18);
  v20 = (char *)&v97 - v19;
  sub_10000D358(0, &qword_100048930, (uint64_t (*)(uint64_t))sub_100010338, sub_10001035C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for Publishers.RemoveDuplicates);
  v22 = v21;
  v98 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v24 = (char *)&v97 - v23;
  sub_100005A08(0);
  v26 = v25;
  v99 = *(_QWORD *)(v25 - 8);
  __chkstk_darwin(v25);
  v28 = (char *)&v97 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000103E0(0);
  v100 = v29;
  v101 = *(_QWORD *)(v29 - 8);
  __chkstk_darwin(v29);
  v31 = (char *)&v97 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D41C(0, &qword_100048978, v32, sub_100010404);
  v103 = v33;
  v104 = *(_QWORD *)(v33 - 8);
  v34 = __chkstk_darwin(v33);
  v36 = (char *)&v97 - v35;
  v127 = a3;
  static Logger.widgetRefresh.getter(v34);
  *((_BYTE *)v4 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_hasCompletedColdLaunch) = 0;
  *((_BYTE *)v4 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_queuedInvalidation) = 2;
  v102 = (char *)v4 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_cancellables;
  *(_QWORD *)((char *)v4 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_cancellables) = &_swiftEmptySetSingleton;
  v37 = a2;
  v115 = a2;
  v38 = a2[3];
  v39 = a2[4];
  sub_10000C1E8(v37, v38);
  WatchlistManagerType.activeWatchlistChanges.getter(v38, v39);
  KeyPath = swift_getKeyPath(&unk_1000382A8);
  v41 = sub_100010378();
  Publisher.map<A>(_:)(KeyPath, v22, v41);
  swift_release(KeyPath);
  (*(void (**)(char *, uint64_t))(v98 + 8))(v24, v22);
  v42 = sub_100010420();
  v43 = sub_100008EA0(&qword_100048988, (uint64_t (*)(uint64_t))&type metadata accessor for PriceChangeDisplay, (uint64_t)&protocol conformance descriptor for PriceChangeDisplay);
  Publisher<>.removeDuplicates()(v26, v42, v43);
  (*(void (**)(char *, uint64_t))(v99 + 8))(v28, v26);
  v44 = sub_1000059D0(0, &qword_100048910, OS_dispatch_queue_ptr);
  v126[0] = (id)((uint64_t (*)(void))static OS_dispatch_queue.main.getter)();
  v45 = type metadata accessor for OS_dispatch_queue.SchedulerOptions(0);
  v46 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56);
  v46(v20, 1, 1, v45);
  v47 = sub_100010404();
  v48 = sub_10000D4B8();
  v49 = v100;
  Publisher.receive<A>(on:options:)(v126, v20, v100, v44, v47, v48);
  sub_10000D3C8((uint64_t)v20);

  (*(void (**)(char *, uint64_t))(v101 + 8))(v31, v49);
  v50 = swift_allocObject(&unk_100042BA0, 24, 7);
  swift_weakInit(v50 + 16, v4);
  v51 = sub_10001B5E4(&qword_100048990, &qword_100048978, (uint64_t (*)(uint64_t))sub_1000103E0, sub_100010404);
  v52 = v103;
  v53 = Publisher<>.sink(receiveValue:)(sub_10000FDE0, v50, v103, v51);
  swift_release(v50);
  (*(void (**)(char *, uint64_t))(v104 + 8))(v36, v52);
  v54 = v102;
  swift_beginAccess(v102, v126, 33, 0);
  AnyCancellable.store(in:)(v54);
  swift_endAccess(v126);
  v55 = swift_release(v53);
  v126[0] = (id)static OS_dispatch_queue.main.getter(v55);
  v46(v20, 1, 1, v45);
  sub_1000102B4();
  v57 = v56;
  v58 = sub_10001031C();
  v59 = v105;
  Publisher.receive<A>(on:options:)(v126, v20, v57, v44, v58, v48);
  sub_10000D3C8((uint64_t)v20);

  v60 = swift_allocObject(&unk_100042BA0, 24, 7);
  swift_weakInit(v60 + 16, v4);
  v61 = sub_10001B5E4(&qword_100048998, &qword_100048900, (uint64_t (*)(uint64_t))sub_1000102B4, sub_10001031C);
  v62 = v106;
  v63 = Publisher<>.sink(receiveValue:)(sub_10001B5DC, v60, v106, v61);
  swift_release(v60);
  (*(void (**)(char *, uint64_t))(v107 + 8))(v59, v62);
  swift_beginAccess(v54, v126, 33, 0);
  AnyCancellable.store(in:)(v54);
  swift_endAccess(v126);
  v64 = swift_release(v63);
  v65 = static Settings.UserPreferences.showCurrency.getter(v64);
  v66 = swift_allocObject(&unk_100042BA0, 24, 7);
  swift_weakInit(v66 + 16, v4);
  v67 = sub_100008EA0((unint64_t *)&unk_1000489A0, type metadata accessor for WidgetContentInvalidationManager, (uint64_t)&unk_100038418);
  v68 = v111;
  Configurable.setting<A>(_:_:)(v65, sub_10001B624, v66, v111, v67);
  swift_release(v65);
  v69 = swift_release(v66);
  v70 = static Settings.Features.showYahooNewsAttribution.getter(v69);
  v71 = swift_allocObject(&unk_100042BA0, 24, 7);
  swift_weakInit(v71 + 16, v4);
  v72 = v108;
  Configurable.setting<A>(_:_:)(v70, sub_10001B62C, v71, v68, v67);
  swift_release(v70);
  swift_release(v71);
  v73 = (*(uint64_t (**)(char *, uint64_t))(v109 + 8))(v72, v110);
  v74 = static Settings.News.newsProvider.getter(v73);
  v75 = swift_allocObject(&unk_100042BA0, 24, 7);
  swift_weakInit(v75 + 16, v4);
  v76 = v112;
  Configurable.setting<A>(_:_:)(v74, sub_10001B634, v75, v68, v67);
  swift_release(v74);
  swift_release(v75);
  v77 = (*(uint64_t (**)(char *, uint64_t))(v113 + 8))(v76, v114);
  v78 = static Settings.News.appleNewsEnvironment.getter(v77);
  v79 = swift_allocObject(&unk_100042BA0, 24, 7);
  swift_weakInit(v79 + 16, v4);
  v80 = v116;
  Configurable.setting<A>(_:_:)(v78, sub_10001B63C, v79, v68, v67);
  swift_release(v78);
  swift_release(v79);
  (*(void (**)(char *, uint64_t))(v117 + 8))(v80, v118);
  v82 = v119;
  v81 = v120;
  v83 = v121;
  (*(void (**)(char *, _QWORD, uint64_t))(v120 + 104))(v119, enum case for AppEvent.stockListDidLoad(_:), v121);
  sub_10000BBFC(0, (unint64_t *)&unk_100047F90, (uint64_t (*)(uint64_t))&type metadata accessor for EventTriggerBehavior, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v84 = v122;
  v86 = (_OWORD *)swift_allocObject(v85, ((*(unsigned __int8 *)(v122 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v122 + 80))+ 2 * *(_QWORD *)(v122 + 72), *(unsigned __int8 *)(v122 + 80) | 7);
  v86[1] = xmmword_100037BC0;
  v87 = static EventTriggerBehavior.eager.getter(v86);
  static EventTriggerBehavior.onlyOnce.getter(v87);
  v126[0] = v86;
  v88 = sub_100008EA0((unint64_t *)&unk_1000489B0, (uint64_t (*)(uint64_t))&type metadata accessor for EventTriggerBehavior, (uint64_t)&protocol conformance descriptor for EventTriggerBehavior);
  sub_10000BBFC(0, (unint64_t *)&unk_100047FA0, (uint64_t (*)(uint64_t))&type metadata accessor for EventTriggerBehavior, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  v90 = v89;
  v91 = sub_10000FC68();
  v93 = v123;
  v92 = v124;
  dispatch thunk of SetAlgebra.init<A>(_:)(v126, v90, v91, v124, v88);
  v94 = swift_allocObject(&unk_100042BA0, 24, 7);
  swift_weakInit(v94 + 16, v4);
  swift_retain(v94);
  v95 = v125;
  dispatch thunk of EventManager.trigger(on:behavior:block:)(v82, v93, sub_10000FDD8, v94);
  swift_release(v95);
  swift_release(v94);
  swift_release(v127);
  (*(void (**)(char *, uint64_t))(v84 + 8))(v93, v92);
  (*(void (**)(char *, uint64_t))(v81 + 8))(v82, v83);
  swift_release(v94);
  sub_10000778C(v115);
  return v4;
}

void sub_10000D358(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (!*a2)
  {
    v9 = a3(255);
    v10 = a4();
    v11 = a5(a1, v9, v10);
    if (!v12)
      atomic_store(v11, a2);
  }
}

uint64_t sub_10000D3C8(uint64_t a1)
{
  uint64_t v2;

  sub_10000BBFC(0, &qword_100048928, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.SchedulerOptions, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10000D41C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void))
{
  unint64_t v7;
  uint64_t v8;
  _QWORD v9[4];

  if (!*a2)
  {
    v9[0] = a3(255);
    v9[1] = sub_1000059D0(255, &qword_100048910, OS_dispatch_queue_ptr);
    v9[2] = a4();
    v9[3] = sub_10000D4B8();
    v7 = type metadata accessor for Publishers.ReceiveOn(a1, v9);
    if (!v8)
      atomic_store(v7, a2);
  }
}

unint64_t sub_10000D4B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100048920;
  if (!qword_100048920)
  {
    v1 = sub_1000059D0(255, &qword_100048910, OS_dispatch_queue_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue, v1);
    atomic_store(result, (unint64_t *)&qword_100048920);
  }
  return result;
}

uint64_t sub_10000D510(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
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
  void (*v39)(char *, uint64_t, uint64_t);
  char *v40;
  uint64_t v41;
  uint64_t (*v42)(char *, uint64_t);
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
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t, uint64_t);
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
  uint64_t v94;
  char *v95;
  void (*v96)(char *, uint64_t, uint64_t);
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD v103[3];
  uint64_t v104;
  uint64_t v105;

  v102 = a1;
  v1 = type metadata accessor for Container.TestSuite(0);
  v100 = *(_QWORD *)(v1 - 8);
  v101 = v1;
  __chkstk_darwin(v1);
  v99 = (char *)&v94 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Scope(0);
  v97 = *(_QWORD *)(v3 - 8);
  v98 = v3;
  __chkstk_darwin(v3);
  v95 = (char *)&v94 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CallbackScope(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v94 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  ProxyContainer.callback.getter(v103, v7);
  v11 = v104;
  v10 = v105;
  sub_10000C1E8(v103, v104);
  v12 = sub_10000C3D0(0, &qword_100048888, (uint64_t)&protocol descriptor for WatchlistManagerType, 1);
  v13 = enum case for CallbackScope.any(_:);
  v96 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v96(v9, enum case for CallbackScope.any(_:), v5);
  dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)(v12, v9, sub_10000687C, 0, v12, v11, v10);
  v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  v15 = sub_10000778C(v103);
  ProxyContainer.callback.getter(v103, v15);
  v16 = v104;
  v17 = v105;
  sub_10000C1E8(v103, v104);
  v18 = sub_10000C3D0(0, (unint64_t *)&unk_100048890, (uint64_t)&protocol descriptor for StockPriceDataManagerType, 1);
  v19 = v96;
  v96(v9, v13, v5);
  dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)(v18, v9, sub_100006774, 0, v18, v16, v17);
  v14(v9, v5);
  v20 = sub_10000778C(v103);
  ProxyContainer.callback.getter(v103, v20);
  v21 = v104;
  v22 = v105;
  sub_10000C1E8(v103, v104);
  v23 = sub_10000C3D0(0, &qword_100048E20, (uint64_t)&protocol descriptor for SceneStateManagerType, 1);
  v19(v9, v13, v5);
  dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)(v23, v9, sub_10000C714, 0, v23, v21, v22);
  v14(v9, v5);
  v24 = sub_10000778C(v103);
  ProxyContainer.callback.getter(v103, v24);
  v25 = v104;
  v26 = v105;
  sub_10000C1E8(v103, v104);
  v27 = sub_10000DEA8(0, &qword_1000488A0, &protocolRef_TSAppMonitorType);
  v19(v9, v13, v5);
  dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)(v27, v9, sub_10000DD3C, 0, v27, v25, v26);
  v14(v9, v5);
  v28 = sub_10000778C(v103);
  v29 = ProxyContainer.public.getter(v28);
  v30 = sub_10000C3D0(0, &qword_1000488A8, (uint64_t)&protocol descriptor for AppIntentExecutionTypeProviderType, 1);
  v31 = RegistrationContainer.register<A>(_:name:factory:)(v30, 0, 0, sub_10001A8C0, 0, v30);
  swift_release(v31);
  v32 = swift_release(v29);
  v33 = ProxyContainer.public.getter(v32);
  v34 = sub_10000C3D0(0, &qword_1000488B0, (uint64_t)&protocol descriptor for SceneProviderType, 1);
  v35 = RegistrationContainer.register<A>(_:name:factory:)(v34, 0, 0, sub_10001A92C, 0, v34);
  swift_release(v33);
  v36 = enum case for Scope.containerSingleton(_:);
  v38 = v97;
  v37 = v98;
  v39 = *(void (**)(char *, uint64_t, uint64_t))(v97 + 104);
  v40 = v95;
  v39(v95, enum case for Scope.containerSingleton(_:), v98);
  v41 = Definition.inScope(_:)(v40);
  swift_release(v41);
  swift_release(v35);
  v42 = *(uint64_t (**)(char *, uint64_t))(v38 + 8);
  v43 = v42(v40, v37);
  v44 = ProxyContainer.public.getter(v43);
  v45 = type metadata accessor for Database.CacheSize(0);
  v46 = RegistrationContainer.register<A>(_:name:factory:)(v45, 0, 0, &j___s5TeaDB8DatabaseC9CacheSizeO10StocksCoreE10stocksFullAEvgZ, 0, v45);
  swift_release(v46);
  v47 = swift_release(v44);
  v48 = ProxyContainer.public.getter(v47);
  v49 = sub_10000DEA8(0, (unint64_t *)&qword_1000488B8, &protocolRef_TUStateRestoreControllerType);
  v50 = RegistrationContainer.register<A>(_:name:factory:)(v49, 0, 0, sub_10001A984, 0, v49);
  swift_release(v48);
  v39(v40, v36, v37);
  v51 = Definition.inScope(_:)(v40);
  swift_release(v51);
  swift_release(v50);
  v52 = v42(v40, v37);
  v53 = ProxyContainer.public.getter(v52);
  v54 = type metadata accessor for SceneStateManagerBridge(0);
  v55 = RegistrationContainer.register<A>(_:name:factory:)(v54, 0, 0, sub_10001AACC, 0, v54);
  swift_release(v53);
  v56 = enum case for Scope.singleton(_:);
  v39(v40, enum case for Scope.singleton(_:), v37);
  v96 = v39;
  v57 = Definition.inScope(_:)(v40);
  swift_release(v57);
  swift_release(v55);
  v58 = v42(v40, v37);
  v59 = ProxyContainer.public.getter(v58);
  v60 = type metadata accessor for PrivateDataPollingManager();
  v61 = RegistrationContainer.register<A>(_:name:factory:)(v60, 0, 0, sub_10001AB50, 0, v60);
  swift_release(v59);
  v39(v40, v56, v37);
  v62 = Definition.inScope(_:)(v40);
  swift_release(v62);
  swift_release(v61);
  v63 = v42(v40, v37);
  v64 = ProxyContainer.private.getter(v63);
  v65 = type metadata accessor for AppActivationURLHandler(0);
  v66 = RegistrationContainer.register<A>(_:name:factory:)(v65, 0, 0, sub_10001ABEC, 0, v65);
  swift_release(v66);
  v67 = swift_release(v64);
  v68 = ProxyContainer.private.getter(v67);
  v69 = sub_10000C3D0(0, &qword_1000488C0, (uint64_t)&protocol descriptor for GizmoSyncManagerType, 0);
  v70 = RegistrationContainer.register<A>(_:name:factory:)(v69, 0, 0, sub_10001AC20, 0, v69);
  swift_release(v68);
  v72 = v99;
  v71 = v100;
  v73 = v101;
  (*(void (**)(char *, _QWORD, uint64_t))(v100 + 104))(v99, enum case for Container.TestSuite.performance(_:), v101);
  v74 = Definition.whenTesting(_:_:)(v72, sub_10001AD38, 0);
  swift_release(v70);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v72, v73);
  v75 = v37;
  v76 = v37;
  v77 = v96;
  v96(v40, v56, v76);
  v78 = Definition.inScope(_:)(v40);
  swift_release(v78);
  swift_release(v74);
  v79 = v42(v40, v75);
  v80 = ProxyContainer.private.getter(v79);
  v81 = type metadata accessor for WidgetContentInvalidationManager(0);
  v82 = RegistrationContainer.register<A>(_:name:factory:)(v81, 0, 0, sub_10001AD98, 0, v81);
  swift_release(v80);
  v77(v40, v56, v75);
  v83 = Definition.inScope(_:)(v40);
  swift_release(v83);
  swift_release(v82);
  v84 = v42(v40, v75);
  v85 = ProxyContainer.private.getter(v84);
  v86 = type metadata accessor for StocksTodayAgent(0);
  v87 = RegistrationContainer.register<A>(_:name:factory:)(v86, 0, 0, sub_10001AEE8, 0, v86);
  swift_release(v85);
  v77(v40, v56, v75);
  v88 = Definition.inScope(_:)(v40);
  swift_release(v88);
  swift_release(v87);
  v89 = v42(v40, v75);
  v90 = ProxyContainer.private.getter(v89);
  v91 = sub_1000059D0(0, &qword_1000488C8, FCFileCoordinatedTodayDropbox_ptr);
  v92 = RegistrationContainer.register<A>(_:name:factory:)(v91, 0, 0, sub_10001B3F8, 0, v91);
  swift_release(v92);
  return swift_release(v90);
}

_QWORD *sub_10000DD3C(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  _QWORD *result;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;

  v4 = type metadata accessor for AppMonitor(0);
  result = (_QWORD *)swift_dynamicCastClass(a1, v4);
  if (result)
  {
    v6 = result;
    v7 = a2[3];
    v8 = a2[4];
    sub_10000C1E8(a2, v7);
    v9 = sub_10000C3D0(0, &qword_100048E20, (uint64_t)&protocol descriptor for SceneStateManagerType, 1);
    swift_unknownObjectRetain(a1);
    result = dispatch thunk of ResolverType.resolve<A>(_:)(&v13, v9, v9, v7, v8);
    if (v14)
    {
      sub_10000C6A0(&v13, (uint64_t)v15);
      v10 = v16;
      v11 = v17;
      sub_10000C1E8(v15, v16);
      v12 = sub_100008EA0(&qword_100048A00, (uint64_t (*)(uint64_t))&type metadata accessor for AppMonitor, (uint64_t)&protocol conformance descriptor for AppMonitor);
      swift_unknownObjectRetain(a1);
      dispatch thunk of SceneStateManagerType.add(monitor:)(&v13, v6, v12, v10, v11);
      swift_unknownObjectRelease_n(a1, 2);
      sub_10000778C(&v13);
      return (_QWORD *)sub_10000778C(v15);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t type metadata accessor for WidgetContentInvalidationManager(uint64_t a1)
{
  uint64_t result;

  result = qword_100048A78;
  if (!qword_100048A78)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for WidgetContentInvalidationManager);
  return result;
}

uint64_t sub_10000DEA8(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = *a3 | 1;
    result = swift_getExistentialTypeMetadata(0, 0, 1, &v5);
    atomic_store(result, a2);
  }
  return result;
}

void sub_10000DEF8(objc_class *a1, void *a2)
{
  uint64_t v2;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
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
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  UIWindow *v38;
  Class isa;
  objc_class *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  _QWORD *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t ObjectType;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  Class v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  int v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  char *v85;
  void (**v86)(_QWORD, _QWORD, _QWORD);
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  void *v95;
  void *v96;
  uint64_t v97;
  id v98;
  char *v99;
  uint64_t v100;
  int v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void (*v113)(char *, uint64_t);
  uint64_t v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  char v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  Swift::Bool v131;
  Class v132;
  unint64_t v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  uint64_t v142;
  _QWORD *v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  objc_class *v157;
  id v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  uint64_t v163;
  uint64_t v164;
  char *v165;
  uint64_t *v166;
  id v167;
  char *v168;
  id v169;
  id v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  id v174;
  void *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  __int128 v179;
  char *v180;
  uint64_t v181;
  uint64_t v182;
  char *v183;
  uint64_t v184;
  unint64_t v185;
  void *v186;
  char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  char *v192;
  uint64_t v193;
  char *v194;
  char *v195;
  uint64_t v196;
  uint64_t v197;
  char *v198;
  uint64_t v199;
  void *v200;
  UIWindow v201;
  id v202;
  __int128 v203;
  uint64_t v204;
  __int128 v205;
  uint64_t v206;
  uint64_t v207;
  __int128 v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  CGSize_optional v217;

  v200 = a2;
  v201.super.super.super.isa = a1;
  v197 = type metadata accessor for URL(0);
  v196 = *(_QWORD *)(v197 - 8);
  __chkstk_darwin(v197);
  v195 = (char *)&v179 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000BBFC(0, &qword_100048D18, (uint64_t (*)(uint64_t))sub_100005D68, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v4);
  v198 = (char *)&v179 - v5;
  v199 = type metadata accessor for Container.TestSuite(0);
  v202 = *(id *)(v199 - 8);
  v6 = __chkstk_darwin(v199);
  v8 = (char *)&v179 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v179 - v9;
  v11 = type metadata accessor for Container.Environment(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v179 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for SidebarConfiguration(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v179 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for ThemingStyle(0);
  v20 = __chkstk_darwin(v19);
  v23 = v2;
  if (*(_QWORD *)(v2 + qword_100048C18))
  {
    v24 = static os_log_type_t.error.getter(v20);
    sub_10000C36C(0, &qword_100047EF8, &qword_100047F00, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    v26 = swift_allocObject(v25, 72, 7);
    v27 = v26;
    *(_OWORD *)(v26 + 16) = xmmword_100037BB0;
    v28 = *(_QWORD *)(v2 + qword_100048C30 + 8);
    if (v28)
    {
      v29 = *(_QWORD *)(v2 + qword_100048C30);
      v30 = *(_QWORD *)(v23 + qword_100048C30 + 8);
    }
    else
    {
      v30 = 0xE300000000000000;
      v29 = 7104878;
    }
    *(_QWORD *)(v26 + 56) = &type metadata for String;
    *(_QWORD *)(v26 + 64) = sub_10000FD64();
    *(_QWORD *)(v27 + 32) = v29;
    *(_QWORD *)(v27 + 40) = v30;
    sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
    v53 = swift_bridgeObjectRetain(v28);
    v202 = (id)static OS_os_log.default.getter(v53);
    os_log(_:dso:log:type:_:)("Attempted to create window and bootstrap application but we already have a window, sceneSession=%{public}@", 106, 2, &_mh_execute_header, v202, v24, v27);
    swift_bridgeObjectRelease(v27);

    return;
  }
  v193 = qword_100048C18;
  v187 = (char *)&v179 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v188 = v22;
  v189 = v20;
  v180 = v18;
  v181 = v16;
  v182 = v15;
  v190 = v12;
  v191 = v11;
  v192 = v8;
  v194 = v14;
  v183 = v10;
  sub_10000C58C((uint64_t)&v214);
  v31 = v215;
  v32 = v216;
  sub_10000C1E8(&v214, v215);
  v33 = sub_10000C3D0(0, &qword_100048E40, (uint64_t)&protocol descriptor for HeartbeatEventServiceType, 0);
  dispatch thunk of ResolverType.resolve<A>(_:)(&v211, v33, v33, v31, v32);
  if (!v211)
  {
    __break(1u);
    goto LABEL_59;
  }
  v34 = v2;
  swift_unknownObjectRelease(v211);
  sub_10000778C(&v214);
  sub_10000C58C((uint64_t)&v214);
  v35 = v215;
  v36 = v216;
  sub_10000C1E8(&v214, v215);
  v37 = type metadata accessor for DebugWindow(0);
  v38 = (UIWindow *)swift_allocObject(&unk_100042DE8, 24, 7);
  isa = v201.super.super.super.isa;
  v38[2].super.super.super.isa = v201.super.super.super.isa;
  v40 = isa;
  v41 = (void *)dispatch thunk of ResolverType.resolve<A>(_:with:)(v37, sub_10000FFE8, v38, v37, v35, v36);
  swift_release(v38);
  if (!v41)
  {
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  sub_10000778C(&v214);
  v42 = sub_100008EA0((unint64_t *)&unk_100048E48, type metadata accessor for SceneDelegate, (uint64_t)&unk_100038550);
  v43 = swift_unknownObjectRetain(v23);
  DebugWindow.debugDelegate.setter(v43, v42);
  v44 = *(void **)(v23 + v193);
  *(_QWORD *)(v23 + v193) = v41;
  v186 = v41;
  v201.super.super.super.isa = (Class)v41;

  sub_10000C36C(0, &qword_100047EF8, &qword_100047F00, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v46 = v45;
  v47 = swift_allocObject(v45, 72, 7);
  v48 = (_QWORD *)v47;
  v179 = xmmword_100037BB0;
  *(_OWORD *)(v47 + 16) = xmmword_100037BB0;
  v49 = (uint64_t *)(v23 + qword_100048C30);
  v50 = *(_QWORD *)(v23 + qword_100048C30 + 8);
  if (v50)
  {
    v51 = *v49;
    v52 = *(_QWORD *)(v23 + qword_100048C30 + 8);
  }
  else
  {
    v52 = 0xE300000000000000;
    v51 = 7104878;
  }
  *(_QWORD *)(v47 + 56) = &type metadata for String;
  v54 = sub_10000FD64();
  v48[8] = v54;
  v48[4] = v51;
  v48[5] = v52;
  v55 = sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
  v56 = swift_bridgeObjectRetain(v50);
  v57 = (void *)static OS_os_log.default.getter(v56);
  v58 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("Application did create window for window scene, sceneSession=%{public}@", 71, 2, &_mh_execute_header, v57, v58, v48);
  swift_bridgeObjectRelease(v48);

  sub_10000C58C((uint64_t)&v211);
  v59 = v212;
  v60 = v213;
  sub_10000C1E8(&v211, v212);
  v61 = sub_10000C3D0(0, &qword_1000488B0, (uint64_t)&protocol descriptor for SceneProviderType, 1);
  dispatch thunk of ResolverType.resolve<A>(_:)(&v208, v61, v61, v59, v60);
  if (!v209)
    goto LABEL_60;
  sub_10000C6A0(&v208, (uint64_t)&v214);
  sub_10000778C(&v211);
  v62 = v215;
  v63 = v216;
  sub_10000C1E8(&v214, v215);
  dispatch thunk of SceneProviderType.register(_:)(v40, v62, v63);
  v64 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v65 = objc_msgSend(v64, "userInterfaceIdiom");

  if (!v65)
  {
    v66 = *(void **)(v23 + v193);
    if (v66)
      objc_msgSend(v66, "setOverrideUserInterfaceStyle:", 2);
  }
  v67 = sub_10000624C(&qword_100048C60, &qword_100048E98, (uint64_t)&protocol descriptor for ToolbarManagerType);
  v69 = v68;
  ObjectType = swift_getObjectType(v67);
  dispatch thunk of ToolbarManagerType.registerScene(_:)(v40, ObjectType, v69);
  swift_unknownObjectRelease(v67);
  sub_10000C58C((uint64_t)&v208);
  v71 = v209;
  v72 = v210;
  sub_10000C1E8(&v208, v209);
  v73 = sub_10000C3D0(0, &qword_100048E58, (uint64_t)&protocol descriptor for BaseStylerType, 1);
  dispatch thunk of ResolverType.resolve<A>(_:)(&v205, v73, v73, v71, v72);
  v74 = v206;
  if (!v206)
    goto LABEL_61;
  v184 = v46;
  v185 = v54;
  v193 = v55;
  v75 = v207;
  sub_10000C1E8(&v205, v206);
  v76 = v201.super.super.super.isa;
  v77 = -[objc_class traitCollection](v201.super.super.super.isa, "traitCollection");
  v212 = v74;
  v213 = v75;
  sub_10000F58C(&v211);
  dispatch thunk of DynamicStylerType.dynamic(for:)(v77, v74, *(_QWORD *)(v75 + 8));

  sub_10000778C(&v205);
  sub_10000778C(&v208);
  dispatch thunk of BaseStylerType.style(window:)(v76, v74, v75);
  dispatch thunk of BaseStylerType.theme.getter(&v208, v74, v75);
  v78 = v209;
  v79 = v210;
  sub_10000C1E8(&v208, v209);
  v80 = v187;
  dispatch thunk of Theming.style.getter(v78, v79);
  v81 = (*(uint64_t (**)(char *, uint64_t))(v188 + 88))(v80, v189);
  if (v81 == enum case for ThemingStyle.light(_:))
  {
    v82 = 1;
    v83 = v200;
    v84 = v199;
    v85 = v194;
    v86 = (void (**)(_QWORD, _QWORD, _QWORD))v202;
  }
  else
  {
    v83 = v200;
    v84 = v199;
    v85 = v194;
    v86 = (void (**)(_QWORD, _QWORD, _QWORD))v202;
    if (v81 != enum case for ThemingStyle.dark(_:))
    {
LABEL_64:
      _diagnoseUnexpectedEnumCase<A>(type:)(v189, v189);
      __break(1u);
      goto LABEL_65;
    }
    v82 = 2;
  }
  -[objc_class setTs_accessibilityInterfaceStyleIntent:](v76, "setTs_accessibilityInterfaceStyleIntent:", v82, v179);
  sub_10000778C(&v208);
  if (v83)
  {
    v87 = objc_msgSend(v83, "userActivities");
    v88 = sub_1000059D0(0, &qword_100048E70, NSUserActivity_ptr);
    v89 = sub_10000F224(&qword_100048E78, &qword_100048E70, NSUserActivity_ptr);
    v90 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v87, v88, v89);

    v91 = (void *)sub_10000F264(v90, &qword_100048E70, NSUserActivity_ptr);
    swift_bridgeObjectRelease(v90);
    if (v91)
    {
      v92 = swift_allocObject(&unk_100042E60, 24, 7);
      swift_unknownObjectWeakInit(v92 + 16, v34);
      v93 = swift_allocObject(&unk_100042E88, 32, 7);
      *(_QWORD *)(v93 + 16) = v92;
      *(_QWORD *)(v93 + 24) = v91;
      swift_retain(v92);
      v94 = v91;
      v95 = (void *)sub_10000F44C();
      v96 = (void *)((uint64_t (*)(void))zalgoIfMain.getter)();
      Bootstrapper.afterBootstrap(on:run:)(v96, sub_1000213FC, v93);
      swift_release(v92);
      swift_release(v93);

      v85 = v194;
      v97 = sub_10001C3EC(&qword_100048BE8, (uint64_t (*)(_QWORD))&type metadata accessor for StocksV2UserActivityDeserializer);
      v98 = v94;
      v99 = v180;
      v100 = SidebarConfiguration.init(_:userActivity:)(v97, v98);
      v101 = SidebarConfiguration.shouldCollapseSidebar.getter(v100);

      (*(void (**)(char *, uint64_t))(v181 + 8))(v99, v182);
    }
    else
    {
      v101 = 0;
    }
    v86 = (void (**)(_QWORD, _QWORD, _QWORD))v202;
  }
  else
  {
    v101 = 0;
  }
  v102 = type metadata accessor for ContainerEnviromentProvider(0);
  swift_allocObject(v102, *(unsigned int *)(v102 + 48), *(unsigned __int16 *)(v102 + 52));
  v103 = ContainerEnviromentProvider.init()();
  v104 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v105 = objc_msgSend((id)objc_opt_self(NSProcessInfo), "processInfo");
  ContainerEnviromentProvider.enviroment(for:processInfo:)(v104, v105);
  swift_release(v103);

  v106 = v190;
  v107 = v191;
  v108 = (*(uint64_t (**)(char *, uint64_t))(v190 + 88))(v85, v191);
  if (v108 == enum case for Container.Environment.testing(_:))
  {
    LODWORD(v202) = v101;
    (*(void (**)(char *, uint64_t))(v106 + 96))(v85, v107);
    v109 = v183;
    ((void (**)(char *, char *, uint64_t))v86)[2](v183, v85, v84);
    ((void (**)(char *, _QWORD, uint64_t))v86)[13](v192, enum case for Container.TestSuite.performance(_:), v84);
    v110 = sub_100008EA0(&qword_100048E68, (uint64_t (*)(uint64_t))&type metadata accessor for Container.TestSuite, (uint64_t)&protocol conformance descriptor for Container.TestSuite);
    dispatch thunk of RawRepresentable.rawValue.getter(&v208, v84, v110);
    dispatch thunk of RawRepresentable.rawValue.getter(&v205, v84, v110);
    v111 = *((_QWORD *)&v208 + 1);
    v112 = *((_QWORD *)&v205 + 1);
    if (v208 == v205)
    {
      swift_bridgeObjectRelease_n(*((_QWORD *)&v208 + 1), 2);
      v113 = (void (*)(char *, uint64_t))v86[1];
      v113(v192, v84);
LABEL_34:
      v122 = swift_allocObject(v184, 72, 7);
      *(_OWORD *)(v122 + 16) = v179;
      v123 = v49[1];
      if (v123)
      {
        v124 = *v49;
        v125 = v49[1];
      }
      else
      {
        v125 = 0xE300000000000000;
        v124 = 7104878;
      }
      v133 = v185;
      *(_QWORD *)(v122 + 56) = &type metadata for String;
      *(_QWORD *)(v122 + 64) = v133;
      *(_QWORD *)(v122 + 32) = v124;
      *(_QWORD *)(v122 + 40) = v125;
      v134 = swift_bridgeObjectRetain(v123);
      v135 = (void *)static OS_os_log.default.getter(v134);
      v136 = static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)("Application starting bootstrapping with onboarding disabled for performance testing, sceneSession=%{public}@", 108, 2, &_mh_execute_header, v135, v136, v122);
      swift_bridgeObjectRelease(v122);

      v137 = (void *)sub_10000F44C();
      v132 = v201.super.super.super.isa;
      Bootstrapper.startBootstrapping(window:shouldOnboard:shouldCollapseSidebar:)(v201, 0, v202 & 1);

      v113(v109, v84);
      v113(v85, v84);
      goto LABEL_40;
    }
    v121 = _stringCompareWithSmolCheck(_:_:expecting:)(v208, *((_QWORD *)&v208 + 1), v205, *((_QWORD *)&v205 + 1), 0);
    swift_bridgeObjectRelease(v111);
    swift_bridgeObjectRelease(v112);
    v113 = (void (*)(char *, uint64_t))v86[1];
    v113(v192, v84);
    if ((v121 & 1) != 0)
    {
      v109 = v183;
      goto LABEL_34;
    }
    v113(v183, v84);
    v113(v85, v84);
    LOBYTE(v101) = (_BYTE)v202;
  }
  else if (v108 != enum case for Container.Environment.normal(_:))
  {
LABEL_65:
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000005BLL, 0x8000000100035290, "StocksApp/SceneDelegate.swift", 29, 2, 340, 0);
    __break(1u);
    return;
  }
  sub_10001C6CC((uint64_t)&v208);
  v114 = v209;
  v115 = v210;
  sub_10000C1E8(&v208, v209);
  v116 = dispatch thunk of WelcomeFlowProviderType.shouldShowWelcome()(v114, v115);
  sub_10000778C(&v208);
  v117 = swift_allocObject(v184, 112, 7);
  *(_OWORD *)(v117 + 16) = xmmword_100037BC0;
  *(_QWORD *)(v117 + 56) = &type metadata for Bool;
  *(_QWORD *)(v117 + 64) = &protocol witness table for Bool;
  *(_BYTE *)(v117 + 32) = v116 & 1;
  v118 = v49[1];
  if (v118)
  {
    v119 = *v49;
    v120 = v49[1];
  }
  else
  {
    v120 = 0xE300000000000000;
    v119 = 7104878;
  }
  v126 = v185;
  *(_QWORD *)(v117 + 96) = &type metadata for String;
  *(_QWORD *)(v117 + 104) = v126;
  *(_QWORD *)(v117 + 72) = v119;
  *(_QWORD *)(v117 + 80) = v120;
  v127 = swift_bridgeObjectRetain(v118);
  v128 = (void *)static OS_os_log.default.getter(v127);
  v129 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("Application starting bootstrapping, shouldOnboard=%d, sceneSession=%{public}@", 77, 2, &_mh_execute_header, v128, v129, v117);
  swift_bridgeObjectRelease(v117);

  v130 = (void *)sub_10000F44C();
  v217.value.width = static MainMetrics.defaultWindowWindowSize.getter();
  v217.is_nil = LOBYTE(v217.value.width);
  v131 = v101 & 1;
  v132 = v201.super.super.super.isa;
  Bootstrapper.startBootstrapping(window:shouldOnboard:shouldCollapseSidebar:defaultWindowSize:)(v201, v116 & 1, v131, v217);

LABEL_40:
  v138 = (void *)sub_10000F44C();
  v139 = v49[1];
  if (v139)
  {
    v140 = *v49;
    v141 = v49[1];
  }
  else
  {
    v141 = 0xE300000000000000;
    v140 = 7104878;
  }
  v142 = swift_allocObject(&unk_100042E10, 24, 7);
  swift_unknownObjectWeakInit(v142 + 16, v132);
  v143 = (_QWORD *)swift_allocObject(&unk_100042E38, 40, 7);
  v143[2] = v140;
  v143[3] = v141;
  v143[4] = v142;
  swift_bridgeObjectRetain(v139);
  v144 = swift_retain(v142);
  v145 = (void *)zalgoIfMain.getter(v144);
  Bootstrapper.afterBootstrap(on:run:)(v145, sub_10000FFDC, v143);

  swift_release(v142);
  swift_release(v143);

  sub_10000C58C((uint64_t)&v205);
  v146 = v206;
  v147 = v207;
  sub_10000C1E8(&v205, v206);
  v148 = sub_10000C3D0(0, &qword_100048E60, (uint64_t)&protocol descriptor for AgreedToTermsAndConditionsProvider, 1);
  dispatch thunk of ResolverType.resolve<A>(_:)(&v203, v148, v148, v146, v147);
  if (!v204)
    goto LABEL_62;
  sub_10000C6A0(&v203, (uint64_t)&v208);
  sub_10000778C(&v205);
  v149 = v209;
  v150 = v210;
  sub_10000C1E8(&v208, v209);
  if ((dispatch thunk of AgreedToTermsAndConditionsProvider.agreedToTermsAndConditions()(v149, v150) & 1) != 0)
  {
    type metadata accessor for TrackingConsent(0);
    v151 = (void *)static TrackingConsent.shared.getter();
    TrackingConsent.allow()();

  }
  sub_10000C58C((uint64_t)&v205);
  v152 = v206;
  v153 = v207;
  sub_10000C1E8(&v205, v206);
  v154 = type metadata accessor for SessionObserver(0);
  v155 = dispatch thunk of ResolverType.resolve<A>(_:)(v154, v154, v152, v153);
  if (!v155)
    goto LABEL_63;
  v156 = (void *)v155;
  sub_10000778C(&v205);
  v157 = v132;
  SessionObserver.window.setter(v186);
  if (v83
    && (v158 = objc_msgSend(v83, "URLContexts"),
        v159 = sub_1000059D0(0, &qword_100048DF8, UIOpenURLContext_ptr),
        v160 = sub_10000F224(&qword_100048E00, &qword_100048DF8, UIOpenURLContext_ptr),
        v161 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v158, v159, v160),
        v158,
        v162 = (void *)sub_10000F264(v161, &qword_100048DF8, UIOpenURLContext_ptr),
        swift_bridgeObjectRelease(v161),
        v162))
  {
    sub_100005D68(0);
    v164 = v163;
    v165 = v198;
    v166 = (uint64_t *)&v198[*(int *)(v163 + 48)];
    v167 = objc_msgSend(v162, "URL");
    v168 = v195;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(char *, char *, uint64_t))(v196 + 32))(v165, v168, v197);
    v169 = objc_msgSend(v162, "options");
    v170 = objc_msgSend(v169, "sourceApplication");

    if (v170)
    {
      v171 = static String._unconditionallyBridgeFromObjectiveC(_:)(v170);
      v173 = v172;

    }
    else
    {
      v174 = objc_msgSend(v83, "sourceApplication");
      if (v174)
      {
        v175 = v174;
        v171 = static String._unconditionallyBridgeFromObjectiveC(_:)(v174);
        v173 = v176;

      }
      else
      {

        v171 = 0;
        v173 = 0;
      }
    }
    *v166 = v171;
    v166[1] = v173;
    v177 = (uint64_t)v198;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v164 - 8) + 56))(v198, 0, 1, v164);
    v178 = v34 + qword_100048C38;
    swift_beginAccess(v178, &v205, 33, 0);
    sub_100021374(v177, v178);
    swift_endAccess(&v205);
  }
  else
  {

  }
  sub_10000778C(&v208);
  sub_10000778C(&v211);
  sub_10000778C(&v214);
}

uint64_t sub_10000F224(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1000059D0(255, a2, a3);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000F264(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v6 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v7 = a1;
    else
      v7 = a1 & 0xFFFFFFFFFFFFFF8;
    v8 = __CocoaSet.startIndex.getter(v7);
    v10 = v9;
    v11 = __CocoaSet.endIndex.getter(v7);
    v13 = static __CocoaSet.Index.== infix(_:_:)(v8, v10, v11, v12);
    swift_bridgeObjectRelease(v11);
    if ((v13 & 1) != 0)
      goto LABEL_6;
    goto LABEL_10;
  }
  result = sub_10000F388(a1);
  if ((v17 & 1) == 0)
  {
    v10 = v16;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v16)
    {
      v8 = result;
      if (result == 1 << *(_BYTE *)(a1 + 32))
      {
LABEL_6:
        sub_100021404(v8, v10, v6 != 0);
        return 0;
      }
LABEL_10:
      sub_100020F00(v8, v10, v6 != 0, a1, a2, a3);
      v14 = v18;
      sub_100021404(v8, v10, v6 != 0);
      return v14;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000F388(uint64_t a1)
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
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
  v2 = 64;
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

uint64_t type metadata accessor for SceneDelegate(uint64_t a1)
{
  uint64_t result;

  result = qword_100048C80;
  if (!qword_100048C80)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SceneDelegate);
  return result;
}

uint64_t sub_10000F44C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  v1 = qword_100048BE0;
  v2 = *(void **)(v0 + qword_100048BE0);
  if (v2)
  {
    v3 = *(id *)(v0 + qword_100048BE0);
LABEL_5:
    v11 = v2;
    return (uint64_t)v3;
  }
  v4 = v0;
  sub_10000C58C((uint64_t)v12);
  v5 = v13;
  v6 = v14;
  sub_10000C1E8(v12, v13);
  v7 = type metadata accessor for Bootstrapper(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v7, v7, v5, v6);
  if (result)
  {
    v9 = (void *)result;
    sub_10000778C(v12);
    v10 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v9;
    v3 = v9;

    v2 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000F500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  return Configurable.setting<A>(_:)(a1, *v5, a5);
}

uint64_t sub_10000F50C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  return Configurable.setting<A>(_:defaultValue:)(a1, a2, *v6, a6);
}

uint64_t sub_10000F518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  return Configurable.setting<A>(_:defaultValue:_:)(a1, a2, a3, a4, *v8, a8);
}

Swift::Void __swiftcall AppMonitor.sceneWillEnterForeground()()
{
  AppMonitor.trigger(event:)(1);
}

uint64_t sub_10000F52C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000F534(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000F53C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000F544(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000F54C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000F55C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000F56C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000F57C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

_QWORD *sub_10000F58C(_QWORD *a1)
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

unint64_t sub_10000F5C8()
{
  unint64_t result;

  result = qword_100048730;
  if (!qword_100048730)
  {
    result = swift_getFunctionTypeMetadata0(0x4000000, (char *)&type metadata for () + 8);
    atomic_store(result, (unint64_t *)&qword_100048730);
  }
  return result;
}

uint64_t sub_10000F608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, void *))
{
  uint64_t v5;

  v5 = a4(0, a2, a3, &type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

unint64_t sub_10000F650()
{
  unint64_t result;
  unint64_t v1;

  result = qword_100048720;
  if (!qword_100048720)
  {
    v1 = sub_10000F8E8();
    result = swift_getFunctionTypeMetadata1(67108865, v1, (char *)&type metadata for () + 8);
    atomic_store(result, (unint64_t *)&qword_100048720);
  }
  return result;
}

void sub_10000F6A0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = a3(255);
    v6 = type metadata accessor for _ContiguousArrayStorage(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

void sub_10000F6EC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100049580)
  {
    type metadata accessor for os_unfair_lock_s(255);
    v3 = type metadata accessor for ManagedBuffer(a1, &type metadata for Bool, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100049580);
  }
}

uint64_t sub_10000F748(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_10000F5C8();
      swift_arrayInitWithCopy(a3);
      return v7;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

unint64_t sub_10000F84C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100048B28;
  if (!qword_100048B28)
  {
    v1 = sub_1000059D0(255, &qword_100048B20, UIScene_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100048B28);
  }
  return result;
}

void sub_10000F8A4(uint64_t a1, unint64_t *a2, uint64_t a3)
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

unint64_t sub_10000F8E8()
{
  unint64_t result;
  char *v1;

  result = qword_100048728;
  if (!qword_100048728)
  {
    v1 = (char *)&OBJC_PROTOCOL___FCMutableTodayPrivateData.isa + 1;
    result = swift_getExistentialTypeMetadata(0, 0, 1, &v1);
    atomic_store(result, (unint64_t *)&qword_100048728);
  }
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_10000F8A4(a1, &qword_1000479D0, (uint64_t)&unk_100042538);
}

uint64_t sub_10000F950(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  Swift::Int v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  BOOL v23;
  uint64_t v24;
  unint64_t i;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;
  _QWORD v32[9];

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v29 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(result + 56);
  v30 = (unint64_t)(v4 + 63) >> 6;
  v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v31 = v3;
      v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v10);
    v12 = v3 + 1;
    if (!v11)
    {
      v12 = v3 + 2;
      if (v3 + 2 >= v30)
        return 1;
      v11 = *(_QWORD *)(v29 + 8 * v12);
      if (!v11)
      {
        v12 = v3 + 3;
        if (v3 + 3 >= v30)
          return 1;
        v11 = *(_QWORD *)(v29 + 8 * v12);
        if (!v11)
        {
          v12 = v3 + 4;
          if (v3 + 4 >= v30)
            return 1;
          v11 = *(_QWORD *)(v29 + 8 * v12);
          if (!v11)
            break;
        }
      }
    }
LABEL_25:
    v6 = (v11 - 1) & v11;
    v31 = v12;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    v14 = result;
    v15 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * v9);
    v17 = *v15;
    v16 = v15[1];
    Hasher.init(_seed:)(v32, *(_QWORD *)(a2 + 40));
    swift_bridgeObjectRetain(v16);
    String.hash(into:)(v32, v17, v16);
    v18 = Hasher._finalize()();
    v19 = -1 << *(_BYTE *)(a2 + 32);
    v20 = v18 & ~v19;
    if (((*(_QWORD *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      goto LABEL_41;
    v21 = *(_QWORD *)(a2 + 48);
    v22 = (_QWORD *)(v21 + 16 * v20);
    v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v24 = ~v19;
      for (i = v20 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v21 + 16 * v26);
        v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          goto LABEL_7;
      }
LABEL_41:
      swift_bridgeObjectRelease(v16);
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease(v16);
    result = v14;
    v3 = v31;
  }
  v13 = v3 + 5;
  if (v3 + 5 >= v30)
    return 1;
  v11 = *(_QWORD *)(v29 + 8 * v13);
  if (v11)
  {
    v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v12 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v12);
    ++v13;
    if (v11)
      goto LABEL_25;
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_10000FBF0(uint64_t a1)
{
  uint64_t v2;

  sub_10000597C(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000FC2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

unint64_t sub_10000FC68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000489C0;
  if (!qword_1000489C0)
  {
    sub_10000BBFC(255, (unint64_t *)&unk_100047FA0, (uint64_t (*)(uint64_t))&type metadata accessor for EventTriggerBehavior, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000489C0);
  }
  return result;
}

void sub_10000FCC8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = type metadata accessor for Group(255);
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

void sub_10000FD20(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

unint64_t sub_10000FD64()
{
  unint64_t result;

  result = qword_100047F10;
  if (!qword_100047F10)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100047F10);
  }
  return result;
}

uint64_t sub_10000FDA8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_10000FDB4(uint64_t a1)
{
  _QWORD *v1;

  return SceneStateMonitor.sceneWillConnectToSession(withOptions:)(a1, *v1);
}

void sub_10000FDBC()
{
  SceneStateMonitor.sceneWillEnterForeground()();
}

uint64_t sub_10000FDC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  return SceneStateMonitor.sceneDidBecomeActive(with:sourceApplication:sceneID:)(a1, a2, a3, a4, a5, *v7, a7);
}

uint64_t sub_10000FDD0(uint64_t a1)
{
  _QWORD *v1;

  return WatchlistManagerObserver.watchlistManagerWatchlistsDidChange(_:)(a1, *v1);
}

uint64_t sub_10000FDD8()
{
  uint64_t v0;

  return sub_100008AFC(v0);
}

uint64_t sub_10000FDE0(uint64_t a1)
{
  uint64_t v1;

  return sub_10000FDE8(a1, v1);
}

uint64_t sub_10000FDE8(uint64_t a1, uint64_t a2)
{
  return sub_100007F54(a1, a2, "Attempting widget update for active watchlist displayState changes");
}

uint64_t sub_10000FDF4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[5];
  v2 = v0[6];
  sub_10000C1E8(v0 + 2, v1);
  v3 = dispatch thunk of PrivateDataPollingServiceType.pollForChangesIfNeeded()(v1, v2);
  return swift_release(v3);
}

uint64_t sub_10000FE34(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_10000B308(&qword_1000490B0, a2, (uint64_t (*)(uint64_t))type metadata accessor for StubGizmoSyncManager, (uint64_t)"ѫ");
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10000FE70@<X0>(uint64_t *a1@<X8>)
{
  return sub_100006704((uint64_t (*)(uint64_t))type metadata accessor for StocksUserActivityIntentDeserializer, &qword_100048630, (uint64_t)&unk_100037D38, a1);
}

uint64_t sub_10000FE8C@<X0>(uint64_t *a1@<X8>)
{
  return sub_100006704((uint64_t (*)(uint64_t))type metadata accessor for StocksUserActivityIntentSerializer, &qword_100048638, (uint64_t)&unk_100037D60, a1);
}

void sub_10000FEB0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD v5[22];

  v2 = qword_10004A9D0;
  v5[0] = "\b";
  v5[1] = &unk_100038500;
  v5[2] = "\b";
  v5[3] = "\b";
  v5[4] = "\b";
  v5[5] = "\b";
  v5[6] = &unk_100038500;
  v5[7] = "\b";
  v5[8] = &unk_100038500;
  v5[9] = "\b";
  v5[10] = "\b";
  v5[11] = "\b";
  v5[12] = &unk_100038518;
  sub_10000BBFC(319, &qword_100048D18, (uint64_t (*)(uint64_t))sub_100005D68, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  if (v4 <= 0x3F)
  {
    v5[13] = *(_QWORD *)(v3 - 8) + 64;
    v5[14] = (char *)&value witness table for Builtin.NativeObject + 64;
    v5[15] = &unk_100038530;
    v5[16] = &unk_100038518;
    v5[17] = &unk_100038500;
    v5[18] = &unk_100038518;
    v5[19] = &unk_100038518;
    v5[20] = "\b";
    v5[21] = (char *)&value witness table for Builtin.BridgeObject + 64;
    swift_initClassMetadata2(a1, 0, 22, v5, a1 + v2);
  }
}

id sub_10000FFAC()
{
  return sub_100006D54();
}

id sub_10000FFCC(uint64_t a1)
{
  return *(id *)(a1 + qword_100048C18);
}

void sub_10000FFDC()
{
  uint64_t *v0;

  sub_1000086DC(v0[2], v0[3], v0[4]);
}

uint64_t sub_10000FFE8(_QWORD *a1)
{
  uint64_t v1;

  return sub_10000FFF0(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10000FFF0(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1[3];
  v4 = a1[4];
  sub_10000C1E8(a1, v3);
  v5 = sub_1000059D0(0, &qword_100048EA0, UIWindowScene_ptr);
  return dispatch thunk of ContextType.useWeak<A>(_:for:)(a2, v5, v5, v3, v4);
}

id sub_100010074()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "registerForRemoteNotifications");
}

uint64_t type metadata accessor for StocksTodayAgent(uint64_t a1)
{
  uint64_t result;

  result = qword_100049478;
  if (!qword_100049478)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for StocksTodayAgent);
  return result;
}

void sub_1000100C0()
{
  uint64_t v0;

  sub_100006F48(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1000100D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(v1);
  return SceneStateMonitor.sceneWillConnectToSession(withOptions:)(a1, ObjectType);
}

void sub_100010114()
{
  uint64_t v0;

  swift_getObjectType(v0);
  SceneStateMonitor.sceneWillEnterForeground()();
}

void sub_10001013C(id *a1)
{
  uint64_t *v1;

  sub_1000073F4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100010148(uint64_t a1)
{
  uint64_t v1;

  return sub_100006C3C(a1, v1);
}

uint64_t sub_100010150(char a1)
{
  uint64_t v2;
  char v4;

  sub_100010258(0, &qword_100049598, (uint64_t)&type metadata for Bool, (uint64_t (*)(_QWORD, uint64_t, void *, void *))&type metadata accessor for CheckedContinuation);
  v4 = a1;
  return CheckedContinuation.resume(returning:)(&v4, v2);
}

uint64_t sub_1000101B8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 176);
  v3 = *(_QWORD *)(*v0 + 168);
  swift_task_dealloc(*(_QWORD *)(*v0 + 184));
  swift_release(v3);
  swift_task_dealloc(v2);
  return swift_task_switch(sub_1000088A8, *(_QWORD *)(v1 + 128), *(_QWORD *)(v1 + 136));
}

uint64_t sub_100010220()
{
  return sub_100008EA0(&qword_100047FD0, (uint64_t (*)(uint64_t))&type metadata accessor for AppEvent, (uint64_t)&protocol conformance descriptor for AppEvent);
}

uint64_t sub_10001023C()
{
  return sub_100008EA0(&qword_100048948, (uint64_t (*)(uint64_t))sub_100005E6C, (uint64_t)&protocol conformance descriptor for CurrentValueSubject<A, B>);
}

void sub_100010258(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, void *, void *))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3, &type metadata for Never, &protocol witness table for Never);
    if (!v6)
      atomic_store(v5, a2);
  }
}

void sub_1000102B4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_100048908)
  {
    v0 = type metadata accessor for PassthroughSubject(0, (char *)&type metadata for () + 8, &type metadata for Never, &protocol witness table for Never);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_100048908);
  }
}

uint64_t sub_10001031C()
{
  return sub_100008EA0(&qword_100048918, (uint64_t (*)(uint64_t))sub_1000102B4, (uint64_t)&protocol conformance descriptor for PassthroughSubject<A, B>);
}

void sub_100010338(uint64_t a1)
{
  sub_10000D358(a1, &qword_100048938, (uint64_t (*)(uint64_t))sub_100005E6C, sub_10001023C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for Publishers.Drop);
}

uint64_t sub_10001035C()
{
  return sub_100008EA0(&qword_100048950, (uint64_t (*)(uint64_t))sub_100010338, (uint64_t)&protocol conformance descriptor for Publishers.Drop<A>);
}

unint64_t sub_100010378()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100048960;
  if (!qword_100048960)
  {
    sub_10000D358(255, &qword_100048930, (uint64_t (*)(uint64_t))sub_100010338, sub_10001035C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for Publishers.RemoveDuplicates);
    result = swift_getWitnessTable(&protocol conformance descriptor for Publishers.RemoveDuplicates<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100048960);
  }
  return result;
}

void sub_1000103E0(uint64_t a1)
{
  sub_10000D358(a1, &qword_100048968, (uint64_t (*)(uint64_t))sub_100005A08, sub_100010420, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for Publishers.RemoveDuplicates);
}

uint64_t sub_100010404()
{
  return sub_100008EA0(&qword_100048980, (uint64_t (*)(uint64_t))sub_1000103E0, (uint64_t)&protocol conformance descriptor for Publishers.RemoveDuplicates<A>);
}

uint64_t sub_100010420()
{
  return sub_100008EA0(&qword_100048970, (uint64_t (*)(uint64_t))sub_100005A08, (uint64_t)&protocol conformance descriptor for Publishers.MapKeyPath<A, B>);
}

unint64_t sub_10001043C()
{
  unint64_t result;
  char *v1;

  result = qword_100047F48;
  if (!qword_100047F48)
  {
    v1 = (char *)&OBJC_PROTOCOL___TSBackgroundFetchScheduler.isa + 1;
    result = swift_getExistentialTypeMetadata(0, 0, 1, &v1);
    atomic_store(result, (unint64_t *)&qword_100047F48);
  }
  return result;
}

unint64_t sub_100010490()
{
  unint64_t result;

  result = qword_100048E10;
  if (!qword_100048E10)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for RestorationEvent, &type metadata for RestorationEvent);
    atomic_store(result, (unint64_t *)&qword_100048E10);
  }
  return result;
}

void sub_1000104D4(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100048E08)
  {
    v2 = sub_100010490();
    v3 = type metadata accessor for StateMachine(a1, &type metadata for RestorationState, &type metadata for RestorationEvent, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100048E08);
  }
}

uint64_t sub_100010534(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100010578()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_100048458[0])
  {
    v0 = type metadata accessor for Setting(0, &type metadata for Bool, &protocol witness table for Bool);
    if (!v1)
      atomic_store(v0, qword_100048458);
  }
}

uint64_t sub_1000105D4(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100010618(uint64_t a1, uint64_t a2)
{
  return sub_1000106E0(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100010624(uint64_t a1)
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

Swift::Int sub_100010664(uint64_t a1)
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

uint64_t sub_1000106D4(uint64_t a1, uint64_t a2)
{
  return sub_1000106E0(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000106E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_10001071C(uint64_t a1, id *a2)
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

uint64_t sub_100010790(uint64_t a1, id *a2)
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

uint64_t sub_10001080C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100010850(_QWORD *a1, uint64_t *a2)
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

uint64_t sub_1000108D8@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100010900@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100010944(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100010A20(&qword_1000479F0, (uint64_t)&unk_100037B40);
  v3 = sub_100010A20(&qword_1000479F8, (uint64_t)&unk_100037A94);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
  sub_10000F8A4(a1, &qword_1000479C0, (uint64_t)&unk_1000424F0);
}

void type metadata accessor for UIBackgroundFetchResult(uint64_t a1)
{
  sub_10000F8A4(a1, &qword_1000479C8, (uint64_t)&unk_100042518);
}

uint64_t sub_1000109D8()
{
  return sub_100010A20(&qword_1000479D8, (uint64_t)&unk_100037A58);
}

uint64_t sub_1000109FC()
{
  return sub_100010A20(&qword_1000479E0, (uint64_t)&unk_100037A2C);
}

uint64_t sub_100010A20(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for LaunchOptionsKey(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100010A60()
{
  return sub_100010A20(&qword_1000479E8, (uint64_t)&unk_100037AC8);
}

_QWORD *sub_100010A88()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[2];
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;

  v1 = v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___menuManager;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___menuManager);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___menuManager);
LABEL_5:
    v11 = v2;
    return v3;
  }
  sub_10000C20C((uint64_t)v13);
  v4 = v14;
  v5 = v15;
  sub_10000C1E8(v13, v14);
  v6 = sub_10000C3D0(0, &qword_100048DC0, (uint64_t)&protocol descriptor for MenuManagerType, 0);
  result = dispatch thunk of ResolverType.resolve<A>(_:name:)(v12, v6, 1852399981, 0xE400000000000000, v6, v4, v5);
  v8 = (void *)v12[0];
  if (v12[0])
  {
    v9 = v12[1];
    sub_10000778C(v13);
    v10 = *(void **)v1;
    *(_QWORD *)v1 = v8;
    *(_QWORD *)(v1 + 8) = v9;
    v3 = v8;

    v2 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_100010B64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v1 = OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___tracker;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___tracker);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___tracker);
LABEL_5:
    swift_retain(v2);
    return v3;
  }
  v4 = v0;
  sub_10000C20C((uint64_t)v10);
  v5 = v11;
  v6 = v12;
  sub_10000C1E8(v10, v11);
  v7 = type metadata accessor for Tracker(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v7, v7, v5, v6);
  if (result)
  {
    v3 = result;
    sub_10000778C(v10);
    v9 = *(_QWORD *)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v3;
    swift_retain(v3);
    swift_release(v9);
    v2 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_100010C1C()
{
  uint64_t v0;

  static Account.storefrontID.getter();
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100010C34(uint64_t a1)
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

uint64_t sub_100010C60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v0 = type metadata accessor for StartupTaskExecutionPhase(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v10[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C20C((uint64_t)v10);
  v4 = v11;
  v5 = v12;
  sub_10000C1E8(v10, v11);
  v6 = type metadata accessor for StartupTaskManager(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v6, v6, v4, v5);
  if (result)
  {
    v8 = result;
    sub_10000778C(v10);
    (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for StartupTaskExecutionPhase.afterLaunching(_:), v0);
    StartupTaskManager.startAllTasks(launchOptions:phase:)(0, v3);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    objc_msgSend((id)objc_opt_self(FCTaskScheduler), "popHighPriorityTaskInFlight");
    return swift_release(v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id DiagnosticFileProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100010E30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(v5);
  return Configurable.setting<A>(_:)(a1, ObjectType, a5);
}

uint64_t sub_100010E74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(v7);
  return Configurable.setting<A>(_:_:)(a1, a2, a3, ObjectType, a7);
}

uint64_t sub_100010ED0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(v8);
  return Configurable.setting<A>(_:defaultValue:_:)(a1, a2, a3, a4, ObjectType, a8);
}

uint64_t sub_100011080(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  v4 = type metadata accessor for RemoteNotificationFetchResult(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == enum case for RemoteNotificationFetchResult.noData(_:))
  {
    v9 = 1;
    return a2(v9);
  }
  if (v8 == enum case for RemoteNotificationFetchResult.newData(_:))
  {
    v9 = 0;
    return a2(v9);
  }
  if (v8 == enum case for RemoteNotificationFetchResult.failed(_:))
  {
    v9 = 2;
    return a2(v9);
  }
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000005BLL, 0x8000000100035290, "StocksApp/AppDelegate.swift", 27, 2, 217, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000112E4(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  v4 = type metadata accessor for BackgroundFetchResult(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == enum case for BackgroundFetchResult.noData(_:))
  {
    v9 = 1;
    return a2(v9);
  }
  if (v8 == enum case for BackgroundFetchResult.newData(_:))
  {
    v9 = 0;
    return a2(v9);
  }
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000005BLL, 0x8000000100035290, "StocksApp/AppDelegate.swift", 27, 2, 244, 0);
  __break(1u);
  return result;
}

uint64_t sub_100011554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(v6);
  return Updatable.save<A>(setting:value:)(a1, a2, ObjectType, a6);
}

uint64_t sub_100011598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(v5);
  return Updatable.reset<A>(setting:)(a1, ObjectType, a5);
}

uint64_t sub_1000115D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(v3);
  return Updatable.apply(preset:)(a1, ObjectType, a3);
}

_QWORD *sub_100011670@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  objc_class *ObjectType;
  _QWORD *result;
  void *v7;
  unsigned int v8;
  _QWORD *v9;
  id v10;
  id v11;
  objc_super v12[2];
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType(v2);
  result = sub_100010A88();
  if (a1)
  {
    v7 = result;
    v8 = objc_msgSend(result, "canPerformAction:withSender:", a1, v2);

    if (v8)
    {
      v9 = sub_100010A88();
      result = (_QWORD *)swift_getObjectType(v9);
      a2[3] = result;
      *a2 = v9;
    }
    else
    {
      v13.receiver = v2;
      v13.super_class = ObjectType;
      v10 = objc_msgSendSuper2(&v13, "forwardingTargetForSelector:", a1);
      if (v10)
      {
        v11 = v10;
        _bridgeAnyObjectToAny(_:)(v12, v10);
        swift_unknownObjectRelease(v11);
      }
      else
      {
        memset(v12, 0, sizeof(v12));
      }
      return (_QWORD *)sub_100011D18((uint64_t)v12, (uint64_t)a2);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

_QWORD *sub_100011828(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  _QWORD v13[2];
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;

  sub_10000C20C((uint64_t)v14);
  v2 = v15;
  v3 = v16;
  sub_10000C1E8(v14, v15);
  v4 = sub_10000C3D0(0, &qword_100047EE0, (uint64_t)&protocol descriptor for CommandCenterType, 0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v13, v4, v4, v2, v3);
  v6 = v13[0];
  if (v13[0])
  {
    v7 = v13[1];
    sub_10000778C(v14);
    v8 = sub_100010A88();
    v10 = v9;
    ObjectType = swift_getObjectType(v8);
    v12 = sub_100010B64();
    v15 = type metadata accessor for Tracker(0);
    v16 = sub_10000B308(&qword_100047EE8, 255, (uint64_t (*)(uint64_t))&type metadata accessor for Tracker, (uint64_t)&protocol conformance descriptor for Tracker);
    v14[0] = v12;
    dispatch thunk of MenuManagerType.validate(_:with:tracker:)(a1, v6, v7, v14, ObjectType, v10);
    swift_unknownObjectRelease(v6);

    return (_QWORD *)sub_10000778C(v14);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000119A8(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_class *ObjectType;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  objc_super v22;
  _QWORD v23[3];
  uint64_t v24;

  ObjectType = (objc_class *)swift_getObjectType(v2);
  v6 = sub_100010A88();
  sub_100011CD4(a2, (uint64_t)v23);
  v7 = v24;
  if (v24)
  {
    v8 = sub_10000C1E8(v23, v24);
    v9 = *(_QWORD *)(v7 - 8);
    __chkstk_darwin(v8);
    v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    v12 = _bridgeAnythingToObjectiveC<A>(_:)(v11, v7);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    sub_10000778C(v23);
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(v6, "canPerformAction:withSender:", a1, v12);

  swift_unknownObjectRelease(v12);
  if ((v13 & 1) != 0)
    return 1;
  sub_100011CD4(a2, (uint64_t)v23);
  v15 = v24;
  if (v24)
  {
    v16 = sub_10000C1E8(v23, v24);
    v17 = *(_QWORD *)(v15 - 8);
    __chkstk_darwin(v16);
    v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v17 + 16))(v19);
    v20 = _bridgeAnythingToObjectiveC<A>(_:)(v19, v15);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v15);
    sub_10000778C(v23);
  }
  else
  {
    v20 = 0;
  }
  v22.receiver = v2;
  v22.super_class = ObjectType;
  v14 = objc_msgSendSuper2(&v22, "canPerformAction:withSender:", a1, v20);
  swift_unknownObjectRelease(v20);
  return (uint64_t)v14;
}

uint64_t sub_100011C14(uint64_t a1, uint64_t a2)
{
  return sub_10000B308(&qword_100047E18, a2, (uint64_t (*)(uint64_t))type metadata accessor for AppDelegate, (uint64_t)&unk_100037C40);
}

uint64_t sub_100011C40(uint64_t a1)
{
  uint64_t v2;

  sub_100011C7C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100011C7C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_100047EC0)
  {
    v0 = type metadata accessor for Optional(0, (char *)&type metadata for Any + 8);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_100047EC0);
  }
}

uint64_t sub_100011CD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_100011C7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100011D18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_100011C7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_100011D5C(uint64_t a1)
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

  v2 = type metadata accessor for AppEvent(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v30 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    sub_100005B74(0);
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
      v15 = sub_10000B308(&qword_100047FD0, 255, (uint64_t (*)(uint64_t))&type metadata accessor for AppEvent, (uint64_t)&protocol conformance descriptor for AppEvent);
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
          v22 = sub_10000B308(&qword_100047FD8, 255, (uint64_t (*)(uint64_t))&type metadata accessor for AppEvent, (uint64_t)&protocol conformance descriptor for AppEvent);
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

uint64_t sub_100011FC8()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;

  v0 = type metadata accessor for EndReason(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v21[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for ViewEndData(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v21[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C20C((uint64_t)v21);
  v8 = v22;
  v9 = v23;
  sub_10000C1E8(v21, v22);
  v10 = type metadata accessor for SessionManager(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v10, v10, v8, v9);
  if (result)
  {
    v12 = result;
    v13 = sub_10000778C(v21);
    v14 = SessionManager.tracker.getter(v13);
    (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for EndReason.forceQuit(_:), v0);
    ViewEndData.init(endReason:)(v3);
    v15 = sub_10000B308((unint64_t *)&unk_100047F30, 255, (uint64_t (*)(uint64_t))&type metadata accessor for ViewEndData, (uint64_t)&protocol conformance descriptor for ViewEndData);
    Tracker.push<A>(data:traits:file:line:)(v7, &_swiftEmptyArrayStorage, 0xD000000000000045, 0x8000000100035440, 172, v4, v15);
    swift_release(v14);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_10000C20C((uint64_t)v21);
    v16 = v22;
    v17 = v23;
    sub_10000C1E8(v21, v22);
    v18 = type metadata accessor for AppSessionManager(0);
    result = dispatch thunk of ResolverType.resolve<A>(_:)(v18, v18, v16, v17);
    if (result)
    {
      v19 = result;
      sub_10000778C(v21);
      AppSessionManager.appSessionDidTerminate()();
      swift_release(v12);
      return swift_release(v19);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_1000121C4(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = objc_msgSend(a1, "role");
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIWindowSceneSessionRoleApplication);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {

    swift_bridgeObjectRelease_n(v5, 2);
    goto LABEL_8;
  }
  v9 = v7;
  v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  if ((v10 & 1) != 0)
  {
LABEL_8:
    v13 = objc_msgSend(a1, "role");
    v12 = objc_msgSend(objc_allocWithZone((Class)UISceneConfiguration), "initWithName:sessionRole:", 0, v13);

    v14 = type metadata accessor for SceneDelegate(0);
    objc_msgSend(v12, "setDelegateClass:", swift_getObjCClassFromMetadata(v14));
    v15 = type metadata accessor for WindowScene(0);
    objc_msgSend(v12, "setSceneClass:", swift_getObjCClassFromMetadata(v15));
    sub_10000C36C(0, &qword_100047EF8, &qword_100047F00, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    v17 = swift_allocObject(v16, 72, 7);
    *(_OWORD *)(v17 + 16) = xmmword_100037BB0;
    v18 = objc_msgSend(a1, "persistentIdentifier");
    v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    v21 = v20;

    *(_QWORD *)(v17 + 56) = &type metadata for String;
    *(_QWORD *)(v17 + 64) = sub_10000FD64();
    *(_QWORD *)(v17 + 32) = v19;
    *(_QWORD *)(v17 + 40) = v21;
    v22 = sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
    v11 = (id)static OS_os_log.default.getter(v22);
    v23 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Application requested scene configuration, sceneSession=%{public}@", 66, 2, &_mh_execute_header, v11, v23, v17);
    swift_bridgeObjectRelease(v17);
    goto LABEL_9;
  }
  v11 = objc_msgSend(a1, "role");
  v12 = objc_msgSend(objc_allocWithZone((Class)UISceneConfiguration), "initWithName:sessionRole:", 0, v11);
LABEL_9:

  return v12;
}

void sub_100012424(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[5];

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v2 = a1;
    else
      v2 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = __CocoaSet.makeIterator()(v2);
    v4 = sub_1000059D0(0, &qword_100047F20, UISceneSession_ptr);
    v5 = sub_100012E3C();
    v6 = Set.Iterator.init(_cocoa:)(v36, v3, v4, v5);
    v1 = v36[0];
    v33 = v36[1];
    v7 = v36[2];
    v8 = v36[3];
    v9 = v36[4];
  }
  else
  {
    v10 = -1 << *(_BYTE *)(a1 + 32);
    v33 = a1 + 56;
    v7 = ~v10;
    v11 = -v10;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v9 = v12 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain(a1);
    v8 = 0;
  }
  v32 = (unint64_t)(v7 + 64) >> 6;
  if (v1 < 0)
    goto LABEL_13;
  while (1)
  {
    if (v9)
    {
      v13 = (v9 - 1) & v9;
      v14 = __clz(__rbit64(v9)) | (v8 << 6);
      v15 = v8;
      goto LABEL_30;
    }
    v20 = v8 + 1;
    if (__OFADD__(v8, 1))
      break;
    if (v20 >= v32)
      goto LABEL_33;
    v21 = *(_QWORD *)(v33 + 8 * v20);
    v15 = v8 + 1;
    if (!v21)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v32)
        goto LABEL_33;
      v21 = *(_QWORD *)(v33 + 8 * v15);
      if (!v21)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v32)
          goto LABEL_33;
        v21 = *(_QWORD *)(v33 + 8 * v15);
        if (!v21)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v32)
            goto LABEL_33;
          v21 = *(_QWORD *)(v33 + 8 * v15);
          if (!v21)
          {
            v22 = v8 + 5;
            while (v32 != v22)
            {
              v21 = *(_QWORD *)(v33 + 8 * v22++);
              if (v21)
              {
                v15 = v22 - 1;
                goto LABEL_29;
              }
            }
LABEL_33:
            sub_100012E94(v1);
            return;
          }
        }
      }
    }
LABEL_29:
    v13 = (v21 - 1) & v21;
    v14 = __clz(__rbit64(v21)) + (v15 << 6);
LABEL_30:
    v19 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v14);
    if (!v19)
      goto LABEL_33;
    while (1)
    {
      sub_10000C36C(0, &qword_100047EF8, &qword_100047F00, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      v24 = swift_allocObject(v23, 72, 7);
      *(_OWORD *)(v24 + 16) = xmmword_100037BB0;
      v25 = objc_msgSend(v19, "persistentIdentifier");
      v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
      v28 = v27;

      *(_QWORD *)(v24 + 56) = &type metadata for String;
      *(_QWORD *)(v24 + 64) = sub_10000FD64();
      *(_QWORD *)(v24 + 32) = v26;
      *(_QWORD *)(v24 + 40) = v28;
      v29 = sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
      v30 = (void *)static OS_os_log.default.getter(v29);
      v31 = static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)("Application discarding scene session, sceneSession=%{public}@", 61, 2, &_mh_execute_header, v30, v31, v24);

      swift_bridgeObjectRelease(v24);
      v8 = v15;
      v9 = v13;
      if ((v1 & 0x8000000000000000) == 0)
        break;
LABEL_13:
      v16 = __CocoaSet.Iterator.next()(v6);
      if (v16)
      {
        v17 = v16;
        v34 = v16;
        v18 = sub_1000059D0(0, &qword_100047F20, UISceneSession_ptr);
        swift_unknownObjectRetain(v17);
        swift_dynamicCast(&v35, &v34, (char *)&type metadata for Swift.AnyObject + 8, v18, 7);
        v19 = v35;
        swift_unknownObjectRelease(v17);
        v15 = v8;
        v13 = v9;
        if (v19)
          continue;
      }
      goto LABEL_33;
    }
  }
  __break(1u);
}

void sub_1000127B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[3];
  uint64_t v29;
  uint64_t v30;

  sub_10000C36C(0, &qword_100047EF8, &qword_100047F00, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v7 = swift_allocObject(v6, 72, 7);
  *(_OWORD *)(v7 + 16) = xmmword_100037BB0;
  v8 = Dictionary.description.getter(a1, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v10 = v9;
  *(_QWORD *)(v7 + 56) = &type metadata for String;
  *(_QWORD *)(v7 + 64) = sub_10000FD64();
  *(_QWORD *)(v7 + 32) = v8;
  *(_QWORD *)(v7 + 40) = v10;
  v11 = sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
  v12 = (void *)static OS_os_log.default.getter(v11);
  v13 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("received remote notification: %{public}@", 40, 2, &_mh_execute_header, v12, v13, v7);
  swift_bridgeObjectRelease(v7);

  sub_10000C20C((uint64_t)v28);
  v14 = v29;
  v15 = v30;
  sub_10000C1E8(v28, v29);
  v16 = type metadata accessor for RemoteNotificationManager(0);
  v17 = dispatch thunk of ResolverType.resolve<A>(_:)(v16, v16, v14, v15);
  if (v17)
  {
    v18 = v17;
    sub_10000778C(v28);
    v19 = RemoteNotificationManager.handleRemoteNotification(userInfo:)(a1);
    v20 = swift_allocObject(&unk_1000426B0, 32, 7);
    *(_QWORD *)(v20 + 16) = a2;
    *(_QWORD *)(v20 + 24) = a3;
    v21 = swift_retain(a3);
    v22 = (void *)zalgo.getter(v21);
    v23 = Promise.then<A>(on:closure:)(v22, sub_100012E00, v20, (char *)&type metadata for () + 8);
    swift_release(v19);
    swift_release(v20);

    v24 = swift_allocObject(&unk_1000426D8, 32, 7);
    *(_QWORD *)(v24 + 16) = a2;
    *(_QWORD *)(v24 + 24) = a3;
    v25 = swift_retain(a3);
    v26 = (void *)zalgo.getter(v25);
    v27 = Promise.error(on:closure:)(v26, sub_100012E18, v24);
    swift_release(v18);
    swift_release(v27);
    swift_release(v23);
    swift_release(v24);

  }
  else
  {
    __break(1u);
  }
}

void sub_100012A00(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v2 = static os_log_type_t.error.getter(a1);
  sub_10000C36C(0, &qword_100047EF8, &qword_100047F00, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v4 = swift_allocObject(v3, 72, 7);
  *(_OWORD *)(v4 + 16) = xmmword_100037BB0;
  v11 = 0;
  v12 = 0xE000000000000000;
  v10 = a1;
  v5 = sub_10000C3D0(0, &qword_100047F08, (uint64_t)&protocol descriptor for Error, 1);
  _print_unlocked<A, B>(_:_:)(&v10, &v11, v5, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v6 = v11;
  v7 = v12;
  *(_QWORD *)(v4 + 56) = &type metadata for String;
  *(_QWORD *)(v4 + 64) = sub_10000FD64();
  *(_QWORD *)(v4 + 32) = v6;
  *(_QWORD *)(v4 + 40) = v7;
  v8 = sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
  v9 = (void *)static OS_os_log.default.getter(v8);
  os_log(_:dso:log:type:_:)("failed to register for remote notifications with error: %{public}@", 66, 2, &_mh_execute_header, v9, v2, v4);
  swift_bridgeObjectRelease(v4);

}

void sub_100012B34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t Manager;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;

  sub_10000C20C((uint64_t)v19);
  v4 = v20;
  v5 = v21;
  sub_10000C1E8(v19, v20);
  Manager = type metadata accessor for BackgroundFetchManager(0);
  v7 = dispatch thunk of ResolverType.resolve<A>(_:)(Manager, Manager, v4, v5);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = sub_10000778C(v19);
    v10 = BackgroundFetchManager.performBackgroundFetch()(v9);
    v11 = swift_allocObject(&unk_100042638, 32, 7);
    *(_QWORD *)(v11 + 16) = a1;
    *(_QWORD *)(v11 + 24) = a2;
    v12 = swift_retain(a2);
    v13 = (void *)zalgo.getter(v12);
    v14 = Promise.then<A>(on:closure:)(v13, sub_100012DC4, v11, (char *)&type metadata for () + 8);
    swift_release(v10);
    swift_release(v11);

    v15 = swift_allocObject(&unk_100042660, 32, 7);
    *(_QWORD *)(v15 + 16) = a1;
    *(_QWORD *)(v15 + 24) = a2;
    v16 = swift_retain(a2);
    v17 = (void *)zalgo.getter(v16);
    v18 = Promise.error(on:closure:)(v17, sub_100012F10, v15);

    swift_release(v18);
    swift_release(v14);
    swift_release(v15);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100012C8C(uint64_t a1, uint64_t a2, Class isa)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  void *v9;
  NSString v10;
  id v11;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  sub_10000C20C((uint64_t)v12);
  v5 = v13;
  v6 = v14;
  sub_10000C1E8(v12, v13);
  v7 = sub_1000059D0(0, &qword_100047EF0, SNTestRunner_ptr);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v7, v7, v5, v6);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  v9 = (void *)result;
  result = sub_10000778C(v12);
  if (!a2)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  v10 = String._bridgeToObjectiveC()();
  if (isa)
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v11 = objc_msgSend(v9, "runTest:options:", v10, isa);

  return (uint64_t)v11;
}

uint64_t sub_100012D90()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100012DB4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_100012DC4(uint64_t a1)
{
  uint64_t v1;

  return sub_1000112E4(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

uint64_t sub_100012DDC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100012E00(uint64_t a1)
{
  uint64_t v1;

  return sub_100011080(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

uint64_t sub_100012E18()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(v0 + 16))(2);
}

unint64_t sub_100012E3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100047F28;
  if (!qword_100047F28)
  {
    v1 = sub_1000059D0(255, &qword_100047F20, UISceneSession_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100047F28);
  }
  return result;
}

uint64_t sub_100012E94(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100012E9C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100012EC0(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    sub_10000BBFC(255, a2, a3, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100012F08()
{
  return sub_100010C60();
}

uint64_t sub_100012F2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v0 = type metadata accessor for SettingAction.PostInstruction(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SettingAction(0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  v5 = SettingAction.init(_:_:)(0x61635F7261656C63, 0xEB00000000656863, sub_100013020, 0);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for SettingAction.PostInstruction.killProcess(_:), v0);
  v6 = dispatch thunk of SettingAction.then(_:)(v3);
  swift_release(v5);
  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_10004A9B0 = v6;
  return result;
}

uint64_t sub_100013020(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType;
  char v5;

  ObjectType = swift_getObjectType(a1);
  if (qword_100047868 != -1)
    swift_once(&qword_100047868, sub_100006134);
  v5 = 1;
  return dispatch thunk of Updatable.save<A>(setting:value:)(static Settings.Debug.clearCacheOnNextLaunch, &v5, &type metadata for Bool, &protocol witness table for Bool, ObjectType, a2);
}

uint64_t initializeBufferWithCopyOfBuffer for DeserializationError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for DeserializationError(uint64_t a1)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(a1 + 40);
  if (v1 >= 2)
    v1 = *(_DWORD *)a1 + 2;
  if (v1 == 1)
    return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  else
    return sub_10000778C((_QWORD *)a1);
}

uint64_t initializeWithCopy for DeserializationError(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  uint64_t v4;
  char v5;
  __int128 v6;

  v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 2)
    v3 = *(_DWORD *)a2 + 2;
  if (v3 == 1)
  {
    v4 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v4;
    swift_bridgeObjectRetain(v4);
    v5 = 1;
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v6;
    (**(void (***)(uint64_t))(v6 - 8))(a1);
    v5 = 0;
  }
  *(_BYTE *)(a1 + 40) = v5;
  return a1;
}

uint64_t assignWithCopy for DeserializationError(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2)
      v4 = *(_DWORD *)a1 + 2;
    if (v4 == 1)
      swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
    else
      sub_10000778C((_QWORD *)a1);
    v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2)
      v5 = *(_DWORD *)a2 + 2;
    if (v5 == 1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v6 = *(_QWORD *)(a2 + 8);
      *(_QWORD *)(a1 + 8) = v6;
      *(_BYTE *)(a1 + 40) = 1;
      swift_bridgeObjectRetain(v6);
    }
    else
    {
      v7 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 24) = v7;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
      *(_BYTE *)(a1 + 40) = 0;
    }
  }
  return a1;
}

__n128 initializeWithTake for DeserializationError(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DeserializationError(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  __int128 v6;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2)
      v4 = *(_DWORD *)a1 + 2;
    if (v4 == 1)
      swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
    else
      sub_10000778C((_QWORD *)a1);
    v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2)
      v5 = *(_DWORD *)a2 + 2;
    if (v5 == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    else
    {
      LOBYTE(v5) = 0;
      v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    }
    *(_BYTE *)(a1 + 40) = v5;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DeserializationError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 2)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DeserializationError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_100013388(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 2)
    return (*(_DWORD *)a1 + 2);
  return result;
}

uint64_t sub_1000133A8(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(_QWORD *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DeserializationError()
{
  return &type metadata for DeserializationError;
}

uint64_t sub_1000133E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  char *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = type metadata accessor for Stock(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for SymbolEntity(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for StocksActivity.StockFeed(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for StocksActivity(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, v14);
  v18 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v17, v14);
  if (v18 == enum case for StocksActivity.stockList(_:))
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))(v17, v14);
    sub_100013E28(0, &qword_100048140, (uint64_t (*)(uint64_t))&type metadata accessor for ScrollPosition, (uint64_t (*)(uint64_t))sub_100013EA4, (uint64_t)"scrollPosition selectedWatchlistID ");
    swift_bridgeObjectRelease(*(_QWORD *)&v17[*(int *)(v19 + 48) + 8]);
    v20 = type metadata accessor for ScrollPosition(0);
LABEL_5:
    result = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v17, v20);
LABEL_6:
    *(_QWORD *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    return result;
  }
  if (v18 == enum case for StocksActivity.forYouFeed(_:))
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))(v17, v14);
    sub_100013E28(0, &qword_100048138, (uint64_t (*)(uint64_t))&type metadata accessor for ForYouSectionDescriptor, (uint64_t (*)(uint64_t))&type metadata accessor for CardViewPresentationState, (uint64_t)"section cardPresentationState ");
    v22 = &v17[*(int *)(v21 + 48)];
    v23 = type metadata accessor for CardViewPresentationState(0);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v22, v23);
    v20 = type metadata accessor for ForYouSectionDescriptor(0);
    goto LABEL_5;
  }
  if (v18 != enum case for StocksActivity.symbolFeed(_:))
  {
    if (v18 == enum case for StocksActivity.symbolSearch(_:))
    {
      (*(void (**)(char *, uint64_t))(v15 + 96))(v17, v14);
      result = swift_bridgeObjectRelease(*((_QWORD *)v17 + 1));
    }
    else if (v18 == enum case for StocksActivity.article(_:)
           || v18 == enum case for StocksActivity.url(_:)
           || v18 == enum case for StocksActivity.alert(_:)
           || v18 == enum case for StocksActivity.campaignLandingPage(_:)
           || v18 == enum case for StocksActivity.tip(_:)
           || v18 == enum case for StocksActivity.onboarding(_:)
           || v18 == enum case for StocksActivity.watchlistCreation(_:))
    {
      result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    }
    else
    {
      if (v18 != enum case for StocksActivity.manageWatchlists(_:))
      {
        simulateCrash(_:_:)("Encountered an unhandled activity type, please update this switch to handle the case.", 85, 2, &_swiftEmptyArrayStorage);
        *(_QWORD *)(a2 + 32) = 0;
        *(_OWORD *)a2 = 0u;
        *(_OWORD *)(a2 + 16) = 0u;
        return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      }
      (*(void (**)(char *, uint64_t))(v15 + 96))(v17, v14);
      sub_100013D00(0);
      swift_release(*(_QWORD *)&v17[*(int *)(v26 + 48)]);
      result = sub_100013DDC((uint64_t)v17);
    }
    goto LABEL_6;
  }
  (*(void (**)(char *, uint64_t))(v15 + 96))(v17, v14);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v17, v10);
  *(_QWORD *)(a2 + 24) = type metadata accessor for OpenSymbolIntent(0);
  *(_QWORD *)(a2 + 32) = sub_100013EF8();
  sub_10000F58C((_QWORD *)a2);
  v25 = OpenSymbolIntent.init()();
  StocksActivity.StockFeed.stock.getter(v25);
  SymbolEntity.init(from:)(v6);
  OpenSymbolIntent.target.setter(v9);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_100013800()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_100013810@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000133E0(a1, a2);
}

uint64_t sub_100013824@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int v20;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
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
  char *v52;
  uint64_t v53;
  uint64_t v54;

  v4 = type metadata accessor for WatchlistEntity(0);
  v53 = *(_QWORD *)(v4 - 8);
  v54 = v4;
  __chkstk_darwin(v4);
  v52 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OpenWatchlistIntent(0);
  v50 = *(_QWORD *)(v6 - 8);
  v51 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for SymbolEntity(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for OpenSymbolIntent(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for StocksIntentType(0);
  v17 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, a1, v16);
  v20 = (*(uint64_t (**)(char *, uint64_t))(v17 + 88))(v19, v16);
  if (v20 == enum case for StocksIntentType.addSymbolToWatchlist(_:)
    || v20 == enum case for StocksIntentType.deleteSymbolFromWatchlist(_:))
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    v22 = type metadata accessor for StocksActivity(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(a2, 1, 1, v22);
  }
  if (v20 == enum case for StocksIntentType.openSymbol(_:))
  {
    (*(void (**)(char *, uint64_t))(v17 + 96))(v19, v16);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v19, v12);
    sub_100013E28(0, &qword_100048150, (uint64_t (*)(uint64_t))&type metadata accessor for Stock, (uint64_t (*)(uint64_t))&type metadata accessor for StocksActivity.Options, (uint64_t)" options ");
    OpenSymbolIntent.target.getter();
    v24 = Stock.init(from:)(v11);
    static StocksActivity.Options.default.getter(v24);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v25 = enum case for StocksActivity.StockFeed.individual(_:);
    v26 = type metadata accessor for StocksActivity.StockFeed(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(a2, v25, v26);
    v27 = (unsigned int *)&enum case for StocksActivity.symbolFeed(_:);
  }
  else if (v20 == enum case for StocksIntentType.openWatchlist(_:))
  {
    (*(void (**)(char *, uint64_t))(v17 + 96))(v19, v16);
    v29 = v50;
    v28 = v51;
    (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v8, v19, v51);
    sub_100013E28(0, &qword_100048140, (uint64_t (*)(uint64_t))&type metadata accessor for ScrollPosition, (uint64_t (*)(uint64_t))sub_100013EA4, (uint64_t)"scrollPosition selectedWatchlistID ");
    v31 = (uint64_t *)(a2 + *(int *)(v30 + 48));
    v32 = enum case for ScrollPosition.top(_:);
    v33 = type metadata accessor for ScrollPosition(0);
    v34 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(a2, v32, v33);
    v35 = v52;
    v36 = OpenWatchlistIntent.target.getter(v34);
    v37 = WatchlistEntity.id.getter(v36);
    v39 = v38;
    (*(void (**)(char *, uint64_t))(v53 + 8))(v35, v54);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v28);
    *v31 = v37;
    v31[1] = v39;
    v27 = (unsigned int *)&enum case for StocksActivity.stockList(_:);
  }
  else
  {
    if (v20 != enum case for StocksIntentType.openBusinessNews(_:))
    {
      result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000005BLL, 0x8000000100035290, "StocksApp/StocksUserActivityIntentSerializer.swift", 50, 2, 52, 0);
      __break(1u);
      return result;
    }
    sub_100013E28(0, &qword_100048138, (uint64_t (*)(uint64_t))&type metadata accessor for ForYouSectionDescriptor, (uint64_t (*)(uint64_t))&type metadata accessor for CardViewPresentationState, (uint64_t)"section cardPresentationState ");
    v41 = a2 + *(int *)(v40 + 48);
    v42 = enum case for ForYouSectionDescriptor.topStories(_:);
    v43 = type metadata accessor for ForYouSectionDescriptor(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 104))(a2, v42, v43);
    v44 = enum case for CardViewPresentationState.expanded(_:);
    v45 = type metadata accessor for CardViewPresentationState(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 104))(v41, v44, v45);
    v27 = (unsigned int *)&enum case for StocksActivity.forYouFeed(_:);
  }
  v46 = *v27;
  v47 = type metadata accessor for StocksActivity(0);
  v48 = *(_QWORD *)(v47 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 104))(a2, v46, v47);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v48 + 56))(a2, 0, 1, v47);
}

uint64_t sub_100013CEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100013824(a1, a2);
}

void sub_100013D00(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t TupleTypeMetadata2;
  uint64_t v6;

  if (!qword_100048120)
  {
    sub_100013D90(255, &qword_100048128, (uint64_t (*)(uint64_t))&type metadata accessor for Stock);
    v3 = v2;
    sub_100013D90(255, &qword_100048130, (uint64_t (*)(uint64_t))&type metadata accessor for CommandExecutionSource);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2(a1, v3, v4, "stock source ", 0);
    if (!v6)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_100048120);
  }
}

void sub_100013D90(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = a3(255);
    v6 = type metadata accessor for Optional(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_100013DDC(uint64_t a1)
{
  uint64_t v2;

  sub_100013D90(0, &qword_100048128, (uint64_t (*)(uint64_t))&type metadata accessor for Stock);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100013E28(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t), uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  unint64_t TupleTypeMetadata2;
  uint64_t v12;

  if (!*a2)
  {
    v9 = a3(255);
    v10 = a4(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2(a1, v9, v10, a5, 0);
    if (!v12)
      atomic_store(TupleTypeMetadata2, a2);
  }
}

void sub_100013EA4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_100049170)
  {
    v0 = type metadata accessor for Optional(0, &type metadata for String);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_100049170);
  }
}

unint64_t sub_100013EF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100048148;
  if (!qword_100048148)
  {
    v1 = type metadata accessor for OpenSymbolIntent(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for OpenSymbolIntent, v1);
    atomic_store(result, (unint64_t *)&qword_100048148);
  }
  return result;
}

uint64_t ArticleScorer.init(subscribedTags:config:currentDate:)@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  char *v6;
  uint64_t v7;

  *a4 = a1;
  sub_10000C6A0(a2, (uint64_t)(a4 + 1));
  v6 = (char *)a4 + *(int *)(type metadata accessor for ArticleScorer(0) + 24);
  v7 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v6, a3, v7);
}

uint64_t type metadata accessor for ArticleScorer(uint64_t a1)
{
  uint64_t result;

  result = qword_1000481B0;
  if (!qword_1000481B0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ArticleScorer);
  return result;
}

void ArticleScorer.score<A>(article:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  BOOL v43;
  double v44;
  double v45;
  char v46;
  char *v47;
  double v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE v63[120];
  _QWORD v64[7];
  char v65;
  double v66;
  double v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;

  v5 = v4;
  v59 = type metadata accessor for Date(0);
  v58 = *(_QWORD *)(v59 - 8);
  v10 = __chkstk_darwin(v59);
  v57 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v13, a1, a2);
  v15 = (*(double (**)(uint64_t, uint64_t))(a3 + 56))(a2, a3);
  v16 = (*(double (**)(uint64_t, uint64_t))(a3 + 40))(a2, a3);
  v17 = (*(double (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
  sub_100015314(a1, v5, a2, a3);
  v19 = v18;
  v20 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 32);
  v60 = a1;
  v21 = v20(a2, a3);
  v22 = *(_QWORD *)(v21 + 16);
  if (!v22)
  {
    swift_bridgeObjectRelease(v21);
    v24 = 0;
    goto LABEL_30;
  }
  v52 = v13;
  v54 = a4;
  v55 = a2;
  v56 = a3;
  v23 = 0;
  v24 = 0;
  v51 = v21;
  v25 = v21 + 32;
  v53 = v5;
  v26 = *v5;
  v27 = *(_QWORD *)(*v5 + 16);
  v62 = *v5 + 56;
  v61 = v21 + 32;
  while (1)
  {
    if (v27)
    {
      v28 = (_QWORD *)(v25 + 16 * v23);
      v30 = *v28;
      v29 = v28[1];
      v31 = *(_QWORD *)(v26 + 32);
      v32 = *(_QWORD *)(v26 + 40);
      if (v31 == *v28 && v32 == v29)
      {
        v35 = 1;
      }
      else
      {
        v34 = _stringCompareWithSmolCheck(_:_:expecting:)(v31, v32, *v28, v28[1], 0);
        v35 = v34 & 1;
        if ((v34 & 1) == 0 && v27 != 1)
        {
          v36 = (uint64_t *)v62;
          v37 = 1;
          while (1)
          {
            v38 = v37 + 1;
            if (__OFADD__(v37, 1))
            {
              __break(1u);
              return;
            }
            v39 = *(v36 - 1);
            v40 = *v36;
            v41 = v39 == v30 && v40 == v29;
            if (v41 || (_stringCompareWithSmolCheck(_:_:expecting:)(v39, v40, v30, v29, 0) & 1) != 0)
              break;
            v36 += 2;
            ++v37;
            if (v38 == v27)
            {
              v42 = 0;
              goto LABEL_25;
            }
          }
          v42 = 1;
LABEL_25:
          v25 = v61;
          v43 = __OFADD__(v24, v42);
          v24 += v42;
          if (v43)
            break;
          goto LABEL_22;
        }
      }
      v43 = __OFADD__(v24, v35);
      v24 += v35;
      if (v43)
        break;
    }
LABEL_22:
    if (++v23 == v22)
      goto LABEL_28;
  }
  __break(1u);
LABEL_28:
  swift_bridgeObjectRelease(v51);
  a3 = v56;
  a2 = v55;
  a4 = v54;
  v5 = v53;
  v13 = v52;
LABEL_30:
  v44 = (*(double (**)(uint64_t, uint64_t))(a3 + 64))(a2, a3);
  v45 = (*(double (**)(uint64_t, uint64_t))(a3 + 72))(a2, a3);
  v46 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 96))(a2, a3);
  v47 = v57;
  (*(void (**)(uint64_t, uint64_t))(a3 + 80))(a2, a3);
  type metadata accessor for ArticleScorer(0);
  v48 = Date.timeIntervalSince(_:)(v47) * 1000.0;
  (*(void (**)(char *, uint64_t))(v58 + 8))(v47, v59);
  v49 = (*(double (**)(uint64_t, uint64_t))(a3 + 88))(a2, a3);
  *(double *)v64 = v15;
  *(double *)&v64[1] = v16;
  *(double *)&v64[2] = v17;
  v64[3] = v19;
  v64[4] = v24;
  *(double *)&v64[5] = v44;
  *(double *)&v64[6] = v45;
  v65 = v46 & 1;
  v66 = v48;
  v67 = v49;
  v68 = 0u;
  v69 = 0u;
  v70 = 0;
  sub_100015738((uint64_t)v64, v5 + 1, (uint64_t)v63);
  sub_10001913C((uint64_t)v13, (uint64_t)v63, a2, a3, a4);
}

uint64_t ArticleScorer.score<A>(articles:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t WitnessTable;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[4];
  _BYTE v20[16];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[16];
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[16];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[3];
  uint64_t v32;
  uint64_t v33;

  v4 = v3;
  v31[2] = a1;
  v28 = a2;
  v29 = a3;
  v7 = type metadata accessor for Array(0, a2);
  v9 = type metadata accessor for ScoredArticle(0, a2, a3, v8);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v7);
  v33 = sub_1000145C0((void (*)(char *, char *))sub_100015C34, (uint64_t)v27, v7, v9, (uint64_t)&type metadata for Never, WitnessTable, (uint64_t)&protocol witness table for Never, v11);
  v12 = type metadata accessor for Array(0, v9);
  v31[0] = Dictionary.init()(&type metadata for String, v12, &protocol witness table for String);
  v25 = a2;
  v26 = a3;
  v13 = type metadata accessor for Dictionary(0, &type metadata for String, v12, &protocol witness table for String);
  v14 = swift_getWitnessTable(&protocol conformance descriptor for [A], v12);
  Sequence.reduce<A>(into:_:)(&v32, v31, sub_100015C60, v24, v12, v13, v14);
  swift_bridgeObjectRelease(v33);
  v15 = v32;
  v21 = a2;
  v22 = a3;
  v23 = v4;
  v16 = Dictionary.mapValues<A>(_:)(sub_100015C78, v20, v32, &type metadata for String, v12, v12, &protocol witness table for String);
  swift_bridgeObjectRelease(v15);
  v31[0] = v16;
  v30 = Array.init()(v9);
  v19[2] = a2;
  v19[3] = a3;
  v17 = swift_getWitnessTable(&protocol conformance descriptor for [A : B], v13);
  Sequence.reduce<A>(into:_:)(&v33, &v30, sub_100015C94, v19, v13, v12, v17);
  swift_bridgeObjectRelease(v31[0]);
  return v33;
}

uint64_t sub_1000145C0(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t AssociatedTypeWitness;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  Swift::Int v27;
  uint64_t result;
  Swift::Int v29;
  void (*v30)(_BYTE *, _QWORD);
  void (*v31)(char *);
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, char *);
  uint64_t v48;
  char *v49;
  Swift::Int v50;
  uint64_t v51;
  _BYTE v52[32];
  uint64_t v53;

  v39 = a5;
  v40 = a8;
  v47 = a1;
  v48 = a2;
  v38 = *(_QWORD *)(a5 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v49 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, *(_QWORD *)(v13 + 8));
  v15 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v16 = ((uint64_t (*)(void))__chkstk_darwin)();
  v18 = (char *)&v38 - v17;
  __chkstk_darwin(v16);
  v20 = (char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = swift_getAssociatedTypeWitness(0, a6);
  v41 = *(_QWORD *)(v21 - 8);
  v42 = v21;
  __chkstk_darwin(v21);
  v23 = (char *)&v38 - v22;
  v24 = dispatch thunk of Collection.count.getter(a3, a6);
  if (!v24)
    return static Array._allocateUninitialized(_:)(0, a4);
  v45 = AssociatedTypeWitness;
  v25 = v8;
  v26 = a4;
  v27 = v24;
  v53 = ContiguousArray.init()(v26);
  v43 = type metadata accessor for ContiguousArray(0, v26);
  ContiguousArray.reserveCapacity(_:)(v27);
  v46 = v25;
  result = dispatch thunk of Collection.startIndex.getter(a3, a6);
  if ((v27 & 0x8000000000000000) == 0)
  {
    v29 = v27;
    v44 = v20;
    while (v29)
    {
      v50 = v29;
      v30 = (void (*)(_BYTE *, _QWORD))dispatch thunk of Collection.subscript.read(v52, v23, a3, a6);
      v31 = *(void (**)(char *))(v15 + 16);
      v32 = v15;
      v33 = v45;
      v31(v18);
      v30(v52, 0);
      v34 = v23;
      v35 = v18;
      v36 = v44;
      v37 = v51;
      v47(v35, v49);
      if (v37)
      {
        (*(void (**)(char *, uint64_t))(v32 + 8))(v35, v33);
        (*(void (**)(char *, uint64_t))(v41 + 8))(v34, v42);
        swift_release(v53);
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v38 + 32))(v40, v49, v39);
      }
      v51 = 0;
      (*(void (**)(char *, uint64_t))(v32 + 8))(v35, v33);
      ContiguousArray.append(_:)(v36, v43);
      result = dispatch thunk of Collection.formIndex(after:)(v34, a3, a6);
      v29 = v50 - 1;
      v15 = v32;
      v18 = v35;
      v23 = v34;
      if (v50 == 1)
      {
        (*(void (**)(char *, uint64_t))(v41 + 8))(v34, v42);
        return v53;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000148B0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __n128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  v10 = v9;
  v11 = *a1;
  v25 = v8;
  v26 = v9;
  v13 = type metadata accessor for ScoredArticle(255, a3, a4, v12);
  v14 = type metadata accessor for Array(0, v13);
  v15 = swift_bridgeObjectRetain(v10);
  Dictionary.subscript.getter(&v27, &v25, v11, &type metadata for String, v14, &protocol witness table for String, v15);
  swift_bridgeObjectRelease(v10);
  v16 = v27;
  if (!v27)
    v16 = static Array._allocateUninitialized(_:)(0, v13);
  v17 = type metadata accessor for _ContiguousArrayStorage(0, v13);
  v18 = *(_QWORD *)(v13 - 8);
  v19 = swift_allocObject(v17, ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80))+ *(_QWORD *)(v18 + 72), *(unsigned __int8 *)(v18 + 80) | 7);
  v20 = static Array._adoptStorage(_:count:)(v19, 1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v21, a2, v13);
  v22 = static Array.+ infix(_:_:)(v16, v20, v13);
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v20);
  v27 = v22;
  v25 = v8;
  v26 = v10;
  v23 = type metadata accessor for Dictionary(0, &type metadata for String, v14, &protocol witness table for String);
  return Dictionary.subscript.setter(&v27, &v25, v23);
}

uint64_t sub_100014A44@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t WitnessTable;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  char v18[16];
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t@<X0>, uint64_t@<X1>, uint64_t@<X8>);
  char *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27[16];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *a1;
  v28 = a3;
  v29 = a4;
  v8 = type metadata accessor for ScoredArticle(255, a3, a4, a4);
  v9 = type metadata accessor for Array(0, v8);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v9);
  v11 = Sequence.sorted(by:)(sub_10001632C, v27, v9, WitnessTable);
  v30 = v11;
  Sequence.enumerated()(&v31, v9, WitnessTable);
  swift_bridgeObjectRelease(v11);
  v30 = v31;
  v24 = a3;
  v25 = a4;
  v26 = a2;
  v19 = a3;
  v20 = a4;
  v21 = sub_100016384;
  v22 = &v23;
  v12 = type metadata accessor for EnumeratedSequence(0, v9, WitnessTable);
  v13 = swift_getWitnessTable(&protocol conformance descriptor for EnumeratedSequence<A>, v12);
  v15 = sub_100014E04((void (*)(char *, char *))sub_100016390, (uint64_t)v18, v12, v8, (uint64_t)&type metadata for Never, v13, (uint64_t)&protocol witness table for Never, v14);
  result = swift_bridgeObjectRelease(v30);
  *a5 = v15;
  return result;
}

void sub_100014BB8(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  long double v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;

  v35 = a5;
  v36 = a6;
  v10 = *(_QWORD *)(a4 - 8);
  __chkstk_darwin(a1);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a2 + *(int *)(type metadata accessor for ScoredArticle(0, v13, v14, v13) + 36);
  v16 = *(double *)v15;
  v33 = *(_OWORD *)(v15 + 8);
  v32 = *(_QWORD *)(v15 + 24);
  v31 = *(_QWORD *)(v15 + 32);
  v17 = *(_QWORD *)(v15 + 40);
  v18 = *(_QWORD *)(v15 + 48);
  v30 = *(unsigned __int8 *)(v15 + 56);
  v19 = *(_QWORD *)(v15 + 64);
  v29 = *(_QWORD *)(v15 + 72);
  v20 = *(double *)(v15 + 104);
  v34 = *(_QWORD *)(v15 + 96);
  v21 = a3 + 1;
  v23 = a3[4];
  v22 = a3[5];
  sub_10000C1E8(a3 + 1, v23);
  v24 = (*(double (**)(uint64_t, uint64_t))(v22 + 160))(v23, v22);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a2, a4);
  v25 = a3[4];
  v26 = a3[5];
  sub_10000C1E8(v21, v25);
  v27 = (*(double (**)(uint64_t, uint64_t))(v26 + 128))(v25, v26);
  v28 = pow(1.0 - v27, (double)a1);
  v37 = v16;
  v38 = v33;
  v39 = v32;
  v40 = v31;
  v41 = v17;
  v42 = v18;
  v43 = v30;
  v44 = v19;
  v45 = v29;
  v46 = a1;
  v47 = 0;
  v48 = v34;
  v49 = v20;
  v50 = v16 * v24 + (1.0 - v24) * (v20 * v28);
  sub_10001913C((uint64_t)v12, (uint64_t)&v37, a4, v35, v36);
}

long double static ArticleScorer.applyRankPenalty(score:penalty:rank:)(uint64_t a1, double a2, double a3)
{
  return pow(1.0 - a3, (double)a1) * a2;
}

uint64_t sub_100014E04(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  void (*v16)(char *, char *, uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  Swift::Int v34;
  uint64_t v35;
  char *v36;
  void (*v37)(char *, char *, uint64_t);
  uint64_t v38;
  uint64_t result;
  uint64_t AssociatedConformanceWitness;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  char *v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  char *v62;
  uint64_t v63;
  void (*v64)(char *, char *);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v50 = a8;
  v51 = a5;
  v9 = v8;
  v63 = a4;
  v64 = a1;
  v65 = a2;
  v49 = *(_QWORD *)(a5 - 8);
  v11 = __chkstk_darwin(a1);
  v62 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v61 = (char *)&v46 - v13;
  v55 = v14;
  v16 = v15;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v14);
  v18 = *(_QWORD *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness);
  v48 = (char *)&v46 - v19;
  v20 = type metadata accessor for Optional(0, AssociatedTypeWitness);
  v52 = *(_QWORD *)(v20 - 8);
  v53 = v20;
  v21 = __chkstk_darwin(v20);
  v59 = (char *)&v46 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __chkstk_darwin(v21);
  v25 = (char *)&v46 - v24;
  v26 = __chkstk_darwin(v23);
  v47 = (char *)&v46 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __chkstk_darwin(v26);
  v30 = (char *)&v46 - v29;
  v58 = *((_QWORD *)v16 - 1);
  __chkstk_darwin(v28);
  v57 = (char *)&v46 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = swift_getAssociatedTypeWitness(0, a6);
  v54 = *(_QWORD *)(v66 - 8);
  __chkstk_darwin(v66);
  v56 = (char *)&v46 - v32;
  v33 = v16;
  v34 = dispatch thunk of Sequence.underestimatedCount.getter(v16, a6);
  v35 = v63;
  v67 = ContiguousArray.init()(v63);
  v63 = type metadata accessor for ContiguousArray(0, v35);
  ContiguousArray.reserveCapacity(_:)(v34);
  (*(void (**)(char *, _QWORD, _QWORD *))(v58 + 16))(v57, v60, v16);
  v36 = v56;
  v60 = v33;
  v37 = v33;
  v38 = v55;
  result = dispatch thunk of Sequence.makeIterator()(v37);
  if (v34 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v34)
  {
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(v38, v60, v66, &protocol requirements base descriptor for Sequence, &associated conformance descriptor for Sequence.Sequence.Iterator: IteratorProtocol);
    while (1)
    {
      dispatch thunk of IteratorProtocol.next()(v66, AssociatedConformanceWitness);
      result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v25, 1, AssociatedTypeWitness);
      if ((_DWORD)result == 1)
        goto LABEL_18;
      v64(v25, v62);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v54 + 8))(v36, v66);
        swift_release(v67);
        (*(void (**)(uint64_t, char *, uint64_t))(v49 + 32))(v50, v62, v51);
        return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v25, AssociatedTypeWitness);
      }
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v18 + 8))(v25, AssociatedTypeWitness);
      ContiguousArray.append(_:)(v30, v63);
      if (!--v34)
      {
        v41 = v59;
        v42 = v66;
        goto LABEL_9;
      }
    }
  }
  v42 = v66;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(v38, v60, v66, &protocol requirements base descriptor for Sequence, &associated conformance descriptor for Sequence.Sequence.Iterator: IteratorProtocol);
  v41 = v59;
LABEL_9:
  dispatch thunk of IteratorProtocol.next()(v42, AssociatedConformanceWitness);
  v62 = *(char **)(v18 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v62)(v41, 1, AssociatedTypeWitness) == 1)
  {
    v43 = v59;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v54 + 8))(v36, v66);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v43, v53);
    return v67;
  }
  else
  {
    v60 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
    v44 = v47;
    v45 = v48;
    v43 = v59;
    while (1)
    {
      v60(v45, v43, AssociatedTypeWitness);
      v64(v45, v61);
      if (v9)
        break;
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v18 + 8))(v45, AssociatedTypeWitness);
      ContiguousArray.append(_:)(v44, v63);
      dispatch thunk of IteratorProtocol.next()(v66, AssociatedConformanceWitness);
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v62)(v43, 1, AssociatedTypeWitness) == 1)
        goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v45, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v36, v66);
    swift_release(v67);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v49 + 32))(v50, v61, v51);
  }
}

uint64_t sub_100015314(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t, __n128);
  __n128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
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
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  _QWORD v59[3];
  uint64_t v60;
  uint64_t v61;

  v5 = a3;
  v58 = a2;
  v6 = *(_QWORD *)(a3 - 8);
  __chkstk_darwin(a1);
  v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v6 + 16))(v8);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(v5, a4);
  v57 = *(_QWORD *)(v9 + 16);
  if (!v57)
  {
    swift_bridgeObjectRelease(v9);
LABEL_26:
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(a4 + 8))(v59, v5, a4);
    v44 = v60;
    v45 = v61;
    sub_10000C1E8(v59, v60);
    if ((*(double (**)(uint64_t, uint64_t))(v45 + 24))(v44, v45) > 0.0)
    {
      v46 = v60;
      v47 = v61;
      sub_10000C1E8(v59, v60);
      (*(void (**)(uint64_t, uint64_t))(v47 + 16))(v46, v47);
      v48 = v60;
      v49 = v61;
      sub_10000C1E8(v59, v60);
      (*(double (**)(uint64_t, uint64_t))(v49 + 24))(v48, v49);
    }
    sub_10000778C(v59);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  v51 = a4;
  v52 = v8;
  v53 = v6;
  v54 = v5;
  v10 = 0;
  v50 = v9;
  v56 = v9 + 32;
  v11 = 0.0;
  v12 = 0.0;
  do
  {
    v13 = (_QWORD *)(v56 + 40 * v10);
    v14 = (_QWORD *)*v58;
    v15 = v13[3];
    v17 = v13[4];
    v16 = v13 + 4;
    sub_10000C1E8(v13, v15);
    v18 = *(uint64_t (**)(uint64_t, uint64_t, __n128))(v17 + 8);
    v19 = swift_bridgeObjectRetain(v14);
    v20 = v18(v15, v17, v19);
    v22 = v21;
    v23 = v14[2];
    if (!v23)
      goto LABEL_3;
    v24 = v20;
    v55 = v13 + 3;
    v25 = v14[4];
    v26 = v14[5];
    if (v25 != v24 || v26 != v22)
    {
      result = _stringCompareWithSmolCheck(_:_:expecting:)(v25, v26, v24, v22, 0);
      if ((result & 1) == 0)
      {
        if (v23 != 1)
        {
          v38 = v14 + 7;
          v39 = 1;
          while (1)
          {
            v40 = v39 + 1;
            if (__OFADD__(v39, 1))
              break;
            v41 = *(v38 - 1);
            v42 = *v38;
            if (v41 == v24 && v42 == v22)
              goto LABEL_11;
            result = _stringCompareWithSmolCheck(_:_:expecting:)(v41, v42, v24, v22, 0);
            if ((result & 1) != 0)
              goto LABEL_11;
            v38 += 2;
            ++v39;
            if (v40 == v23)
              goto LABEL_3;
          }
          __break(1u);
          return result;
        }
LABEL_3:
        swift_bridgeObjectRelease(v14);
        swift_bridgeObjectRelease(v22);
        sub_100010534((uint64_t)v13, (uint64_t)v59);
        sub_10000778C(v59);
        goto LABEL_4;
      }
    }
LABEL_11:
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(v22);
    sub_100010534((uint64_t)v13, (uint64_t)v59);
    v29 = v60;
    v30 = v61;
    sub_10000C1E8(v59, v60);
    v31 = (*(double (**)(uint64_t, uint64_t))(v30 + 24))(v29, v30);
    sub_10000778C(v59);
    if (v31 > 0.0)
    {
      v32 = v55;
      v33 = *v55;
      v34 = *v16;
      sub_10000C1E8(v13, *v55);
      v35 = (*(double (**)(uint64_t, uint64_t))(v34 + 16))(v33, v34);
      v36 = *v32;
      v37 = *v16;
      sub_10000C1E8(v13, *v32);
      v11 = v11 + v35 / (*(double (**)(uint64_t, uint64_t))(v37 + 24))(v36, v37);
      v12 = v12 + 1.0;
    }
LABEL_4:
    ++v10;
  }
  while (v10 != v57);
  swift_bridgeObjectRelease(v50);
  v6 = v53;
  v5 = v54;
  a4 = v51;
  v8 = v52;
  if (v12 == 0.0)
    goto LABEL_26;
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000156A0(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 == 2)
  {
    v6 = a2[3];
    v7 = a2[4];
    sub_10000C1E8(a2, v6);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 80))(v6, v7);
  }
  else if (a1 == 1)
  {
    v3 = a2[3];
    v4 = a2[4];
    sub_10000C1E8(a2, v3);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 72))(v3, v4);
  }
  else
  {
    v8 = a2[3];
    v9 = a2[4];
    sub_10000C1E8(a2, v8);
    if (a1 >= 3)
      return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 88))(v8, v9);
    else
      return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 64))(v8, v9);
  }
}

long double sub_100015738@<D0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  _BOOL4 v11;
  long double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  int v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  BOOL v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  long double v74;
  long double v75;
  long double v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  double v80;
  uint64_t v81;
  double v82;
  double v83;
  long double v84;
  long double v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  long double v89;
  long double result;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;

  v6 = *(double *)(a1 + 64);
  v7 = *(double *)(a1 + 72);
  v8 = a2[3];
  v9 = a2[4];
  sub_10000C1E8(a2, v8);
  (*(void (**)(uint64_t, uint64_t))(v9 + 136))(v8, v9);
  v11 = v7 > 0.0 && v6 > 0.0;
  v12 = 1.0;
  v99 = v7;
  v100 = v6;
  v13 = v6 / v7;
  v101 = 1.0;
  if (v11)
    v101 = exp2(-(v10 * v13));
  v14 = a2[3];
  v15 = a2[4];
  sub_10000C1E8(a2, v14);
  (*(void (**)(uint64_t, uint64_t))(v15 + 48))(v14, v15);
  if (v11)
    v12 = exp2(-(v16 * v13));
  v97 = v12;
  v17 = a2[3];
  v18 = a2[4];
  sub_10000C1E8(a2, v17);
  v95 = (*(double (**)(uint64_t, uint64_t))(v18 + 40))(v17, v18);
  v102 = *(double *)(a1 + 16);
  v19 = a2[3];
  v20 = a2[4];
  sub_10000C1E8(a2, v19);
  v94 = (*(double (**)(uint64_t, uint64_t))(v20 + 24))(v19, v20);
  v21 = a2[3];
  v22 = a2[4];
  sub_10000C1E8(a2, v21);
  v92 = (*(double (**)(uint64_t, uint64_t))(v22 + 32))(v21, v22);
  v23 = *(double *)(a1 + 24);
  v24 = *(_QWORD *)(a1 + 32);
  sub_1000156A0(v24, a2);
  v93 = v25;
  v105 = *(double *)(a1 + 40);
  v26 = a2[3];
  v27 = a2[4];
  sub_10000C1E8(a2, v26);
  v91 = (*(double (**)(uint64_t, uint64_t))(v27 + 104))(v26, v27);
  v28 = a2[3];
  v29 = a2[4];
  sub_10000C1E8(a2, v28);
  v30 = (*(double (**)(uint64_t, uint64_t))(v29 + 112))(v28, v29);
  v103 = *(double *)(a1 + 8);
  v104 = *(double *)(a1 + 48);
  v31 = a2[3];
  v32 = a2[4];
  sub_10000C1E8(a2, v31);
  v33 = (*(double (**)(uint64_t, uint64_t))(v32 + 16))(v31, v32);
  v34 = a2[3];
  v35 = a2[4];
  sub_10000C1E8(a2, v34);
  v36 = (*(double (**)(uint64_t, uint64_t))(v35 + 8))(v34, v35);
  v37 = a2[3];
  v38 = a2[4];
  sub_10000C1E8(a2, v37);
  v39 = (*(double (**)(uint64_t, uint64_t))(v38 + 56))(v37, v38);
  v40 = a2[3];
  v41 = a2[4];
  sub_10000C1E8(a2, v40);
  v42 = (*(double (**)(uint64_t, uint64_t))(v41 + 96))(v40, v41);
  v43 = a2[3];
  v44 = a2[4];
  sub_10000C1E8(a2, v43);
  v45 = (*(double (**)(uint64_t, uint64_t))(v44 + 120))(v43, v44);
  v46 = *(_QWORD *)(a1 + 88);
  v47 = a2[3];
  v48 = a2[4];
  sub_10000C1E8(a2, v47);
  v49 = (*(double (**)(uint64_t, uint64_t))(v48 + 152))(v47, v48);
  v50 = *(unsigned __int8 *)(a1 + 56);
  v51 = 1.0;
  if (v50 == 1)
  {
    v52 = a2[3];
    v53 = a2[4];
    v54 = v49;
    sub_10000C1E8(a2, v52);
    v55 = (*(double (**)(uint64_t, uint64_t))(v53 + 144))(v52, v53);
    v49 = v54;
    v51 = 1.0 - v55;
  }
  v56 = v33;
  v57 = v36;
  v58 = v33 + v36 + v39 + v42 + v45;
  if (v58 <= 0.0)
    v58 = 1.0;
  v59 = v105 * v91 + v30;
  if (v59 <= 1.0)
    v60 = v105 * v91 + v30;
  else
    v60 = 1.0;
  v61 = v59 > 0.0;
  v62 = 0.0;
  if (!v61)
    v60 = 0.0;
  v63 = v95;
  v64 = v102 * v94 + v92;
  if (v64 <= 1.0)
    v65 = v102 * v94 + v92;
  else
    v65 = 1.0;
  if (v64 > 0.0)
    v62 = v65;
  v66 = (1.0 - v95) * v62;
  v96 = v97 * (v95 * v23) + v101 * v66;
  v98 = v23;
  v67 = v63 * v23 + v66;
  v68 = v51 / v58;
  v69 = v103 * v57;
  v70 = v93 * v39;
  v71 = v60 * v42;
  v72 = v104 * v45;
  v73 = (v67 * v33 + v103 * v57 + v70 + v71 + v72) * (v51 / v58);
  v74 = pow(1.0 - v49, (double)v46);
  v75 = v74 * v73;
  v76 = v74 * ((v96 * v56 + v101 * (v69 + v70 + v71 + v72)) * v68);
  v77 = *(double *)a1;
  v78 = a2[3];
  v79 = a2[4];
  sub_10000C1E8(a2, v78);
  v80 = (*(double (**)(uint64_t, uint64_t))(v79 + 160))(v78, v79);
  v81 = *(_QWORD *)(a1 + 80);
  v82 = v77 * v80;
  v83 = 1.0 - v80;
  v84 = v77 * v80 + v75 * (1.0 - v80);
  v85 = v77 * v80 + v76 * (1.0 - v80);
  v86 = a2[3];
  v87 = a2[4];
  sub_10000C1E8(a2, v86);
  v88 = (*(double (**)(uint64_t, uint64_t))(v87 + 128))(v86, v87);
  v89 = pow(1.0 - v88, (double)v81);
  *(double *)a3 = v77;
  *(double *)(a3 + 8) = v103;
  result = v82 + v83 * (v76 * v89);
  *(double *)(a3 + 16) = v102;
  *(double *)(a3 + 24) = v98;
  *(_QWORD *)(a3 + 32) = v24;
  *(double *)(a3 + 40) = v105;
  *(double *)(a3 + 48) = v104;
  *(_BYTE *)(a3 + 56) = v50;
  *(double *)(a3 + 64) = v100;
  *(double *)(a3 + 72) = v99;
  *(_QWORD *)(a3 + 80) = v81;
  *(_QWORD *)(a3 + 88) = v46;
  *(long double *)(a3 + 96) = v84;
  *(long double *)(a3 + 104) = v85;
  *(long double *)(a3 + 112) = result;
  return result;
}

void sub_100015C34(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  ArticleScorer.score<A>(article:)(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_100015C60(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1000148B0(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_100015C78@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_100014A44(a1, v2[4], v2[2], v2[3], a2);
}

uint64_t sub_100015C94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = type metadata accessor for ScoredArticle(0, v7, v6, a4);
  return static Array.+= infix(_:_:)(a1, v8, v9);
}

uint64_t initializeBufferWithCopyOfBuffer for ArticleScorer(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t *v8;
  __int128 v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain(v5);
  }
  else
  {
    v8 = a2 + 1;
    v9 = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 32) = v9;
    v10 = v9;
    v11 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v9 - 8);
    swift_bridgeObjectRetain(v5);
    v11(a1 + 8, v8, v10);
    v12 = *(int *)(a3 + 24);
    v13 = a1 + v12;
    v14 = (uint64_t)a2 + v12;
    v15 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t destroy for ArticleScorer(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  char *v5;
  uint64_t v6;

  v4 = a1 + 1;
  swift_bridgeObjectRelease(*a1);
  sub_10000778C(v4);
  v5 = (char *)a1 + *(int *)(a2 + 24);
  v6 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for ArticleScorer(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t *v7;
  __int128 v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *a2;
  *(_QWORD *)a1 = *a2;
  v7 = a2 + 1;
  v8 = *((_OWORD *)a2 + 2);
  *(_OWORD *)(a1 + 32) = v8;
  v9 = v8;
  v10 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v8 - 8);
  swift_bridgeObjectRetain(v6);
  v10(a1 + 8, v7, v9);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = (uint64_t)a2 + v11;
  v14 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t *assignWithCopy for ArticleScorer(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v7 = a2 + 1;
  v6 = *a2;
  v8 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v8);
  sub_100015F3C(a1 + 1, v7);
  v9 = *(int *)(a3 + 24);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_QWORD *sub_100015F3C(_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v11 = *result;
        v12 = *a2;
        swift_retain(*a2);
        result = (_QWORD *)swift_release(v11);
        *v3 = v12;
      }
      else
      {
        return (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        v10 = *result;
        if ((v8 & 0x20000) != 0)
        {
          v14 = *a2;
          *v3 = *a2;
          swift_retain(v14);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (_QWORD *)swift_release(v10);
      }
      else
      {
        (*(void (**)(_BYTE *, _QWORD *, uint64_t))(v6 + 32))(v15, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          v13 = *a2;
          *v3 = *a2;
          swift_retain(v13);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (_QWORD *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v15, v4);
      }
    }
  }
  return result;
}

uint64_t initializeWithTake for ArticleScorer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t *assignWithTake for ArticleScorer(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v6);
  sub_10000778C(a1 + 1);
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
  a1[5] = a2[5];
  v7 = *(int *)(a3 + 24);
  v8 = (uint64_t)a1 + v7;
  v9 = (uint64_t)a2 + v7;
  v10 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ArticleScorer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000161B0);
}

uint64_t sub_1000161B0(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for Date(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ArticleScorer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100016238);
}

char *sub_100016238(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for Date(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_1000162AC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[1] = "(";
  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
    return 0;
  }
  return result;
}

BOOL sub_10001632C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;

  v7 = type metadata accessor for ScoredArticle(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  return *(double *)(a2 + *(int *)(v7 + 36) + 104) < *(double *)(a1 + *(int *)(v7 + 36) + 104);
}

void sub_100016384(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  sub_100014BB8(a1, a2, *(_QWORD **)(v3 + 32), *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), a3);
}

uint64_t sub_100016390(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t (*v6)(uint64_t, char *);
  uint64_t v7;
  uint64_t v8;
  uint64_t TupleTypeMetadata2;

  v6 = (uint64_t (*)(uint64_t, char *))v4[4];
  v7 = *(_QWORD *)a1;
  v8 = type metadata accessor for ScoredArticle(255, v4[2], v4[3], a4);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2(0, &type metadata for Int, v8, "offset element ", 0);
  return v6(v7, &a1[*(int *)(TupleTypeMetadata2 + 48)]);
}

unint64_t *sub_100016410(void (*a1)(_QWORD *__return_ptr, _QWORD *), uint64_t a2, uint64_t a3)
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
    sub_1000259B0(0, v5, 0);
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
        sub_1000259B0(v12 > 1, v13 + 1, 1);
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

id DiagnosticFileProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id DiagnosticFileProvider.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t sub_100016600@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  __chkstk_darwin(v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = URL.appendingPathComponent(_:)(*a1, a1[1]);
  v9 = URL.path.getter(v8);
  v11 = v10;
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *a2 = v9;
  a2[1] = v11;
  return result;
}

unint64_t *sub_1000166B0()
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
  v2 = __chkstk_darwin(v0);
  v4 = &v22[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  v6 = &v22[-v5];
  type metadata accessor for AppGroup(0);
  v7 = static AppGroup.stocks.getter();
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
    v18 = sub_100016410((void (*)(_QWORD *__return_ptr, _QWORD *))sub_100016ABC, (uint64_t)&v22[-32], v15);
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

char *_s9StocksApp22DiagnosticFileProviderC5filesSaySSGyF_0()
{
  uint64_t v0;
  unint64_t v1;
  char *v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v24;

  v3 = sub_1000166B0();
  v4 = static Caches.Default.location.getter();
  v6 = v5;
  v7 = static Caches.Shared.location.getter();
  v9 = v8;
  v10 = static Caches.Charts.location.getter();
  v12 = v3[2];
  v13 = v12 + 3;
  if (__OFADD__(v12, 3))
  {
    __break(1u);
LABEL_15:
    v2 = sub_100019EC0((char *)(v1 > 1), v12, 1, v2);
    goto LABEL_9;
  }
  v0 = v11;
  v24 = v10;
  v14 = swift_bridgeObjectRetain(v3);
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(v14);
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v2 = (char *)v3, v13 > (uint64_t)(v3[3] >> 1)))
  {
    if (v12 <= v13)
      v16 = v12 + 3;
    else
      v16 = v12;
    v2 = sub_100019EC0(isUniquelyReferenced_nonNull_native, v16, 1, (char *)v3);
  }
  v13 = *((_QWORD *)v2 + 2);
  v1 = *((_QWORD *)v2 + 3);
  v12 = v13 + 1;
  swift_bridgeObjectRetain(v6);
  if (v13 >= v1 >> 1)
    goto LABEL_15;
LABEL_9:
  *((_QWORD *)v2 + 2) = v12;
  v17 = &v2[16 * v13];
  *((_QWORD *)v17 + 4) = v4;
  *((_QWORD *)v17 + 5) = v6;
  v18 = *((_QWORD *)v2 + 3);
  swift_bridgeObjectRetain(v9);
  if (v12 >= v18 >> 1)
    v2 = sub_100019EC0((char *)(v18 > 1), v13 + 2, 1, v2);
  *((_QWORD *)v2 + 2) = v13 + 2;
  v19 = &v2[16 * v12];
  *((_QWORD *)v19 + 4) = v7;
  *((_QWORD *)v19 + 5) = v9;
  v21 = *((_QWORD *)v2 + 2);
  v20 = *((_QWORD *)v2 + 3);
  swift_bridgeObjectRetain(v0);
  if (v21 >= v20 >> 1)
    v2 = sub_100019EC0((char *)(v20 > 1), v21 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v21 + 1;
  v22 = &v2[16 * v21];
  *((_QWORD *)v22 + 4) = v24;
  *((_QWORD *)v22 + 5) = v0;
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v0);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v6);
  return v2;
}

uint64_t type metadata accessor for DiagnosticFileProvider()
{
  return objc_opt_self(SDEDiagnosticFileProvider);
}

uint64_t sub_100016ABC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100016600(a1, a2);
}

uint64_t sub_100016AD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return swift_task_switch(sub_100016AF0, 0, 0);
}

uint64_t sub_100016AF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 48) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100016B58, v2, v3);
}

uint64_t sub_100016B58()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD **)(v0 + 40);
  swift_release(*(_QWORD *)(v0 + 48));
  v2 = sub_10000C3D0(0, &qword_100047EE0, (uint64_t)&protocol descriptor for CommandCenterType, 0);
  v3 = v1 + 15;
  v4 = v1[18];
  v5 = v1[19];
  sub_10000C1E8(v3, v4);
  dispatch thunk of ResolverType.resolve<A>(_:)((_QWORD *)(v0 + 16), v2, v2, v4, v5);
  *(_OWORD *)(v0 + 56) = *(_OWORD *)(v0 + 16);
  return swift_task_switch(sub_100016BF8, 0, 0);
}

uint64_t sub_100016BF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 56);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 64);
    v3 = *(_QWORD **)(v0 + 32);
    *v3 = v1;
    v3[1] = v2;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100016C1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return swift_task_switch(sub_100016C34, 0, 0);
}

uint64_t sub_100016C34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 72) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100016C9C, v2, v3);
}

uint64_t sub_100016C9C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (_QWORD *)v0[8];
  swift_release(v0[9]);
  v2 = sub_10000C3D0(0, &qword_100048328, (uint64_t)&protocol descriptor for HeadlineProviderFactoryType, 1);
  v3 = v1 + 15;
  v4 = v1[18];
  v5 = v1[19];
  sub_10000C1E8(v3, v4);
  dispatch thunk of ResolverType.resolve<A>(_:)(v0 + 2, v2, v2, v4, v5);
  return swift_task_switch(sub_1000184C4, 0, 0);
}

uint64_t sub_100016D34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return swift_task_switch(sub_100016D4C, 0, 0);
}

uint64_t sub_100016D4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 72) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100016DB4, v2, v3);
}

uint64_t sub_100016DB4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (_QWORD *)v0[8];
  swift_release(v0[9]);
  v2 = sub_10000C3D0(0, &qword_100048340, (uint64_t)&protocol descriptor for HeadlineServiceType, 1);
  v3 = v1 + 15;
  v4 = v1[18];
  v5 = v1[19];
  sub_10000C1E8(v3, v4);
  dispatch thunk of ResolverType.resolve<A>(_:)(v0 + 2, v2, v2, v4, v5);
  return swift_task_switch(sub_1000184C4, 0, 0);
}

uint64_t sub_100016E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return swift_task_switch(sub_100016E64, 0, 0);
}

uint64_t sub_100016E64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 72) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100016ECC, v2, v3);
}

uint64_t sub_100016ECC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (_QWORD *)v0[8];
  swift_release(v0[9]);
  v2 = sub_10000C3D0(0, &qword_100048358, (uint64_t)&protocol descriptor for NowPlayingPresenting, 1);
  v3 = v1 + 15;
  v4 = v1[18];
  v5 = v1[19];
  sub_10000C1E8(v3, v4);
  dispatch thunk of ResolverType.resolve<A>(_:)(v0 + 2, v2, v2, v4, v5);
  return swift_task_switch(sub_100016F64, 0, 0);
}

uint64_t sub_100016F64()
{
  uint64_t v0;
  uint64_t result;

  if (*(_QWORD *)(v0 + 40))
  {
    sub_10000C6A0((__int128 *)(v0 + 16), *(_QWORD *)(v0 + 56));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100016FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return swift_task_switch(sub_100016FC0, 0, 0);
}

uint64_t sub_100016FC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 72) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100017028, v2, v3);
}

uint64_t sub_100017028()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (_QWORD *)v0[8];
  swift_release(v0[9]);
  v2 = sub_10000C3D0(0, &qword_100048370, (uint64_t)&protocol descriptor for ShareLinkProviderType, 1);
  v3 = v1 + 15;
  v4 = v1[18];
  v5 = v1[19];
  sub_10000C1E8(v3, v4);
  dispatch thunk of ResolverType.resolve<A>(_:)(v0 + 2, v2, v2, v4, v5);
  return swift_task_switch(sub_1000184C4, 0, 0);
}

uint64_t sub_1000170C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_task_switch(sub_1000170D8, 0, 0);
}

uint64_t sub_1000170D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 40) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100017140, v2, v3);
}

uint64_t sub_100017140()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (_QWORD *)v0[4];
  swift_release(v0[5]);
  sub_1000183E8(0, (unint64_t *)&qword_100048408, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for StackNavigator);
  v3 = v2;
  v0[6] = v2;
  v4 = v1 + 15;
  v5 = v1[18];
  v6 = v1[19];
  sub_10000C1E8(v4, v5);
  dispatch thunk of ResolverType.resolve<A>(_:)(v0 + 2, v3, v3, v5, v6);
  v0[7] = v0[2];
  return swift_task_switch(sub_1000171E0, 0, 0);
}

void sub_1000171E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v1 = *(_QWORD *)(v0 + 56);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 48);
    *(_QWORD *)(v0 + 16) = v1;
    v3 = type metadata accessor for StocksActivity(0);
    v4 = sub_100018464();
    AnyNavigator.init<A>(base:)(v0 + 16, v3, v2, v4);
    (*(void (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100017258(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return swift_task_switch(sub_100017270, 0, 0);
}

uint64_t sub_100017270()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 72) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000172D8, v2, v3);
}

uint64_t sub_1000172D8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (_QWORD *)v0[8];
  swift_release(v0[9]);
  v2 = sub_10000C3D0(0, &qword_1000483A8, (uint64_t)&protocol descriptor for OpenArticleIntentNavigatorType, 1);
  v3 = v1 + 15;
  v4 = v1[18];
  v5 = v1[19];
  sub_10000C1E8(v3, v4);
  dispatch thunk of ResolverType.resolve<A>(_:)(v0 + 2, v2, v2, v4, v5);
  return swift_task_switch(sub_1000184C4, 0, 0);
}

uint64_t sub_100017370(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_task_switch(sub_100017388, 0, 0);
}

uint64_t sub_100017388()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 40) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000173F0, v2, v3);
}

uint64_t sub_1000173F0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (_QWORD *)v0[4];
  swift_release(v0[5]);
  v2 = type metadata accessor for Tracker(0);
  v3 = v1 + 15;
  v4 = v1[18];
  v5 = v1[19];
  sub_10000C1E8(v3, v4);
  dispatch thunk of ResolverType.resolve<A>(_:)(v0 + 2, v2, v2, v4, v5);
  v0[6] = v0[2];
  return swift_task_switch(sub_10001747C, 0, 0);
}

uint64_t sub_10001747C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 48);
  if (v1)
  {
    **(_QWORD **)(v0 + 24) = v1;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001749C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = a2;
  sub_100018394(0);
  v2[4] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000174F4, 0, 0);
}

uint64_t sub_1000174F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 40) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001755C, v2, v3);
}

uint64_t sub_10001755C()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (_QWORD *)v0[4];
  v2 = (_QWORD *)v0[3];
  swift_release(v0[5]);
  v3 = type metadata accessor for ArticleTopStoriesOptionsProvider(0);
  v0[6] = v3;
  v4 = v2 + 15;
  v5 = v2[18];
  v6 = v2[19];
  sub_10000C1E8(v4, v5);
  dispatch thunk of ResolverType.resolve<A>(_:)(v1, v3, v3, v5, v6);
  return swift_task_switch(sub_1000175E4, 0, 0);
}

uint64_t sub_1000175E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD *v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v1 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v2, 1, v1);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v5 = *(_QWORD **)(v0 + 16);
    v5[3] = v1;
    v5[4] = sub_100008EA0(&qword_100048400, (uint64_t (*)(uint64_t))&type metadata accessor for ArticleTopStoriesOptionsProvider, (uint64_t)&protocol conformance descriptor for ArticleTopStoriesOptionsProvider);
    v6 = sub_10000F58C(v5);
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(v3 + 32))(v6, v2, v1);
    swift_task_dealloc(v2);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_10001768C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = a2;
  sub_100018394(0);
  v2[4] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000176E4, 0, 0);
}

uint64_t sub_1000176E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 40) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001774C, v2, v3);
}

uint64_t sub_10001774C()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (_QWORD *)v0[4];
  v2 = (_QWORD *)v0[3];
  swift_release(v0[5]);
  v3 = type metadata accessor for ArticleTopStoriesOptionsProvider(0);
  v0[6] = v3;
  v4 = v2 + 15;
  v5 = v2[18];
  v6 = v2[19];
  sub_10000C1E8(v4, v5);
  dispatch thunk of ResolverType.resolve<A>(_:)(v1, v3, v3, v5, v6);
  return swift_task_switch(sub_1000184BC, 0, 0);
}

uint64_t sub_1000177D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 112));
  sub_10000778C((_QWORD *)(v0 + 120));
  v1 = v0 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_executionPhase;
  v2 = type metadata accessor for StartupTaskExecutionPhase(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_defaultActor_destroy(v0);
  return swift_defaultActor_deallocate(v0);
}

uint64_t sub_100017830()
{
  return type metadata accessor for AppIntentsDependencyStartupTask(0);
}

uint64_t type metadata accessor for AppIntentsDependencyStartupTask(uint64_t a1)
{
  uint64_t result;

  result = qword_100048248;
  if (!qword_100048248)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AppIntentsDependencyStartupTask);
  return result;
}

uint64_t sub_100017874(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[4];

  v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[2] = &unk_100037E48;
  result = type metadata accessor for StartupTaskExecutionPhase(319);
  if (v3 <= 0x3F)
  {
    v4[3] = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 4, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_100017904()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_100017910(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = type metadata accessor for AppIntentsDependencyStartupTask(0);
  return StartupTaskType.group.getter(v3, a2);
}

uint64_t sub_100017948@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_executionPhase;
  v4 = type metadata accessor for StartupTaskExecutionPhase(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_100017990(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = type metadata accessor for AppIntentsDependencyStartupTask(0);
  return StartupTaskType.run()(v3, a2);
}

uint64_t sub_1000179B8()
{
  return sub_1000179D8();
}

uint64_t sub_1000179D8()
{
  _QWORD *v0;
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
  unint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  AppDependencyManager.addStocksDependencies(from:)(v0 + 15);
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v1 = sub_10000C3D0(0, &qword_100047EE0, (uint64_t)&protocol descriptor for CommandCenterType, 0);
  swift_retain(v0);
  AppDependencyManager.add<A>(key:dependency:)(&v22, &unk_100048300, v0, v1);
  swift_release(v0);
  sub_100017F2C((uint64_t)&v22);
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v2 = sub_10000C3D0(0, &qword_100048328, (uint64_t)&protocol descriptor for HeadlineProviderFactoryType, 1);
  swift_retain(v0);
  AppDependencyManager.add<A>(key:dependency:)(&v22, &unk_100048320, v0, v2);
  swift_release(v0);
  sub_100017F2C((uint64_t)&v22);
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v3 = sub_10000C3D0(0, &qword_100048340, (uint64_t)&protocol descriptor for HeadlineServiceType, 1);
  swift_retain(v0);
  AppDependencyManager.add<A>(key:dependency:)(&v22, &unk_100048338, v0, v3);
  swift_release(v0);
  sub_100017F2C((uint64_t)&v22);
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v4 = sub_10000C3D0(0, &qword_100048358, (uint64_t)&protocol descriptor for NowPlayingPresenting, 1);
  swift_retain(v0);
  AppDependencyManager.add<A>(key:dependency:)(&v22, &unk_100048350, v0, v4);
  swift_release(v0);
  sub_100017F2C((uint64_t)&v22);
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v5 = sub_10000C3D0(0, &qword_100048370, (uint64_t)&protocol descriptor for ShareLinkProviderType, 1);
  swift_retain(v0);
  AppDependencyManager.add<A>(key:dependency:)(&v22, &unk_100048368, v0, v5);
  swift_release(v0);
  sub_100017F2C((uint64_t)&v22);
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  sub_1000183E8(0, &qword_100048388, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for AnyNavigator);
  v7 = v6;
  swift_retain(v0);
  AppDependencyManager.add<A>(key:dependency:)(&v22, &unk_100048380, v0, v7);
  swift_release(v0);
  sub_100017F2C((uint64_t)&v22);
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v8 = sub_10000C3D0(0, &qword_1000483A8, (uint64_t)&protocol descriptor for OpenArticleIntentNavigatorType, 1);
  swift_retain(v0);
  AppDependencyManager.add<A>(key:dependency:)(&v22, &unk_1000483A0, v0, v8);
  swift_release(v0);
  sub_100017F2C((uint64_t)&v22);
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v9 = type metadata accessor for Tracker(0);
  swift_retain(v0);
  AppDependencyManager.add<A>(key:dependency:)(&v22, &unk_1000483B8, v0, v9);
  swift_release(v0);
  sub_100017F2C((uint64_t)&v22);
  v20 = 0xD000000000000018;
  v21 = 0x8000000100035790;
  AnyHashable.init<A>(_:)(&v22, &v20, &type metadata for String, &protocol witness table for String);
  v10 = sub_10000C3D0(0, &qword_1000483D0, (uint64_t)&protocol descriptor for ArticleOptionsProviderType, 1);
  swift_retain(v0);
  AppDependencyManager.add<A>(key:dependency:)(&v22, &unk_1000483C8, v0, v10);
  swift_release(v0);
  sub_100017F2C((uint64_t)&v22);
  v20 = 0xD000000000000018;
  v21 = 0x80000001000357B0;
  AnyHashable.init<A>(_:)(&v22, &v20, &type metadata for String, &protocol witness table for String);
  swift_retain(v0);
  AppDependencyManager.add<A>(key:dependency:)(&v22, &unk_1000483E0, v0, v10);
  swift_release(v0);
  sub_100017F2C((uint64_t)&v22);
  v12 = v0[18];
  v11 = v0[19];
  sub_10000C1E8(v0 + 15, v12);
  v13 = sub_100018310();
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v13, v13, v12, v11);
  if (result)
  {
    v15 = result;
    type metadata accessor for AppDependencyManager(0);
    v16 = static AppDependencyManager.shared.getter();
    v24 = 0;
    v22 = 0u;
    v23 = 0u;
    v17 = swift_allocObject(&unk_1000428B0, 24, 7);
    *(_QWORD *)(v17 + 16) = v15;
    swift_unknownObjectRetain(v15);
    AppDependencyManager.add<A>(key:dependency:)(&v22, sub_100018388, v17, v13);
    swift_release(v16);
    swift_release(v17);
    sub_100017F2C((uint64_t)&v22);
    sub_10000FD20(0, &qword_1000483F0, (uint64_t)&type metadata for () + 8, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Promise);
    swift_allocObject(v18, *(unsigned int *)(v18 + 48), *(unsigned __int16 *)(v18 + 52));
    v19 = Promise.init(value:)();
    swift_unknownObjectRelease(v15);
    return v19;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100017ECC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_1000482FC);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1000184C0;
  v4[4] = a1;
  v4[5] = v1;
  return swift_task_switch(sub_100016AF0, 0, 0);
}

uint64_t sub_100017F2C(uint64_t a1)
{
  uint64_t v2;

  sub_10000FD20(0, &qword_100048310, (uint64_t)&type metadata for AnyHashable, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100017F80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_10004831C);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1000184C0;
  v4[7] = a1;
  v4[8] = v1;
  return swift_task_switch(sub_100016C34, 0, 0);
}

uint64_t sub_100017FE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_100048334);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1000184C0;
  v4[7] = a1;
  v4[8] = v1;
  return swift_task_switch(sub_100016D4C, 0, 0);
}

uint64_t sub_100018040(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_10004834C);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1000184C0;
  v4[7] = a1;
  v4[8] = v1;
  return swift_task_switch(sub_100016E64, 0, 0);
}

uint64_t sub_1000180A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_100048364);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1000184C0;
  v4[7] = a1;
  v4[8] = v1;
  return swift_task_switch(sub_100016FC0, 0, 0);
}

uint64_t sub_100018100(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_10004837C);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1000184C0;
  v4[3] = a1;
  v4[4] = v1;
  return swift_task_switch(sub_1000170D8, 0, 0);
}

uint64_t sub_100018160(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_10004839C);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1000184C0;
  v4[7] = a1;
  v4[8] = v1;
  return swift_task_switch(sub_100017270, 0, 0);
}

uint64_t sub_1000181C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_1000483B4);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100018220;
  v4[3] = a1;
  v4[4] = v1;
  return swift_task_switch(sub_100017388, 0, 0);
}

uint64_t sub_100018220()
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

uint64_t sub_100018268(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_1000483C4);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1000184C0;
  return sub_10001749C(a1, v1);
}

uint64_t sub_1000182BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_1000483DC);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1000184C0;
  return sub_10001768C(a1, v1);
}

unint64_t sub_100018310()
{
  unint64_t result;
  char *v1;

  result = qword_1000488E0;
  if (!qword_1000488E0)
  {
    v1 = (char *)&OBJC_PROTOCOL___FCBundleSubscriptionManagerType.isa + 1;
    result = swift_getExistentialTypeMetadata(0, 0, 1, &v1);
    atomic_store(result, (unint64_t *)&qword_1000488E0);
  }
  return result;
}

uint64_t sub_100018364()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100018388@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 16);
  *a1 = v2;
  return swift_unknownObjectRetain(v2);
}

void sub_100018394(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000483F8)
  {
    v2 = type metadata accessor for ArticleTopStoriesOptionsProvider(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000483F8);
  }
}

void sub_1000183E8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v6 = type metadata accessor for StocksActivity(255);
    v7 = sub_100008EA0(&qword_100048390, (uint64_t (*)(uint64_t))&type metadata accessor for StocksActivity, (uint64_t)&protocol conformance descriptor for StocksActivity);
    v8 = a3(a1, v6, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

unint64_t sub_100018464()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100048410;
  if (!qword_100048410)
  {
    sub_1000183E8(255, (unint64_t *)&qword_100048408, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for StackNavigator);
    result = swift_getWitnessTable(&protocol conformance descriptor for StackNavigator<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100048410);
  }
  return result;
}

uint64_t *Settings.Debug.clearCacheOnNextLaunch.unsafeMutableAddressor()
{
  if (qword_100047868 != -1)
    swift_once(&qword_100047868, sub_100006134);
  return &static Settings.Debug.clearCacheOnNextLaunch;
}

uint64_t Storefront.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100018544 + 4 * byte_100037ED4[a1]))(0xD000000000000012, 0x8000000100034EE0);
}

uint64_t sub_100018544()
{
  return 0x313434333431;
}

uint64_t sub_100018558()
{
  return 0x343434333431;
}

uint64_t sub_10001856C()
{
  return 0x353534333431;
}

uint64_t sub_100018580()
{
  return 0x303634333431;
}

uint64_t sub_100018594()
{
  return 0x353634333431;
}

uint64_t sub_1000185A8()
{
  return 0x323634333431;
}

uint64_t sub_1000185BC()
{
  return 0x313734333431;
}

uint64_t sub_1000185D0()
{
  return 0x333434333431;
}

uint64_t sub_1000185E4()
{
  return 0x323434333431;
}

uint64_t sub_1000185F8()
{
  return 0x323534333431;
}

uint64_t sub_10001860C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = Storefront.rawValue.getter(*a1);
  v5 = v4;
  v6 = Storefront.rawValue.getter(v2);
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

Swift::Int sub_100018694()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v1 = *v0;
  Hasher.init(_seed:)(v6, 0);
  v2 = Storefront.rawValue.getter(v1);
  v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_1000186F4(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = Storefront.rawValue.getter(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100018734(uint64_t a1)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  v3 = Storefront.rawValue.getter(v2);
  v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

unint64_t sub_100018790@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = _s9StocksApp10StorefrontO8rawValueACSgSS_tcfC_0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000187BC@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = Storefront.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000187E4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100018F70();
  return static RawRepresentable<>.dataType.getter(a1, v2, &protocol witness table for String);
}

uint64_t sub_100018824(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  v4 = sub_100018F70();
  return static RawRepresentable<>.convert(from:)(a1, a2, v4, &protocol witness table for String);
}

uint64_t sub_10001886C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100018F70();
  return RawRepresentable<>.toData()(a1, v2, &protocol witness table for String);
}

uint64_t static Settings.Debug.clearCacheOnNextLaunch.getter()
{
  return sub_100018D1C(&qword_100047868, &static Settings.Debug.clearCacheOnNextLaunch);
}

uint64_t sub_1000188C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;
  _BYTE v14[4];
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;

  v0 = type metadata accessor for Access(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Domain(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100018FB4(0);
  v26 = 0;
  *v7 = 0xD000000000000012;
  v7[1] = 0x80000001000357D0;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for Domain.domain(_:), v4);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for Access.protected(_:), v0);
  sub_100019050(0);
  v9 = v8;
  sub_1000190A4();
  v11 = swift_allocObject(v9, ((*(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80))+ 11 * *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80) | 7);
  *(_OWORD *)(v11 + 16) = xmmword_100038000;
  v25 = 0;
  Option.init(label:value:description:)(0x746C7561666544, 0xE700000000000000, &v25, 0, 0, &type metadata for Storefront);
  v24 = 1;
  Option.init(label:value:description:)(21333, 0xE200000000000000, &v24, 0, 0, &type metadata for Storefront);
  v23 = 2;
  Option.init(label:value:description:)(0x7242207461657247, 0xED00006E69617469, &v23, 0, 0, &type metadata for Storefront);
  v22 = 3;
  Option.init(label:value:description:)(0x6164616E6143, 0xE600000000000000, &v22, 0, 0, &type metadata for Storefront);
  v21 = 4;
  Option.init(label:value:description:)(0x696C617274737541, 0xE900000000000061, &v21, 0, 0, &type metadata for Storefront);
  v20 = 5;
  Option.init(label:value:description:)(0x616E696843, 0xE500000000000000, &v20, 0, 0, &type metadata for Storefront);
  v19 = 6;
  Option.init(label:value:description:)(0x6E6170614ALL, 0xE500000000000000, &v19, 0, 0, &type metadata for Storefront);
  v18 = 7;
  Option.init(label:value:description:)(0x6D616E74656956, 0xE700000000000000, &v18, 0, 0, &type metadata for Storefront);
  v17 = 8;
  Option.init(label:value:description:)(0x6874654E20656854, 0xEF73646E616C7265, &v17, 0, 0, &type metadata for Storefront);
  v16 = 9;
  Option.init(label:value:description:)(0x796E616D726547, 0xE700000000000000, &v16, 0, 0, &type metadata for Storefront);
  v15 = 10;
  Option.init(label:value:description:)(0x65636E617246, 0xE600000000000000, &v15, 0, 0, &type metadata for Storefront);
  v12 = sub_1000190F8();
  result = Setting<>.init(_:defaultValue:domain:access:options:)(0x6F726665726F7473, 0xEA0000000000746ELL, &v26, v7, v3, v11, v12);
  static Settings.Debug.storefront = result;
  return result;
}

uint64_t *Settings.Debug.storefront.unsafeMutableAddressor()
{
  if (qword_100047870 != -1)
    swift_once(&qword_100047870, sub_1000188C8);
  return &static Settings.Debug.storefront;
}

uint64_t static Settings.Debug.storefront.getter()
{
  return sub_100018D1C(&qword_100047870, &static Settings.Debug.storefront);
}

uint64_t sub_100018D1C(_QWORD *a1, _QWORD *a2)
{
  if (*a1 != -1)
    swift_once();
  return swift_retain(*a2);
}

unint64_t _s9StocksApp10StorefrontO8rawValueACSgSS_tcfC_0(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100042200, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 0xB)
    return 11;
  else
    return v3;
}

unint64_t sub_100018DA0()
{
  unint64_t result;

  result = qword_100048420;
  if (!qword_100048420)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Storefront, &type metadata for Storefront);
    atomic_store(result, (unint64_t *)&qword_100048420);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for Storefront(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Storefront(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 10;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 10;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 10;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Storefront(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_100018ED0 + 4 * byte_100037EE4[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_100018F04 + 4 * byte_100037EDF[v4]))();
}

uint64_t sub_100018F04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100018F0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100018F14);
  return result;
}

uint64_t sub_100018F20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100018F28);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_100018F2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100018F34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100018F40(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100018F48(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Storefront()
{
  return &type metadata for Storefront;
}

ValueMetadata *type metadata accessor for Settings.Debug()
{
  return &type metadata for Settings.Debug;
}

unint64_t sub_100018F70()
{
  unint64_t result;

  result = qword_100048428;
  if (!qword_100048428)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Storefront, &type metadata for Storefront);
    atomic_store(result, (unint64_t *)&qword_100048428);
  }
  return result;
}

void sub_100018FB4(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100048430)
  {
    v2 = sub_10001900C();
    v3 = type metadata accessor for Setting(a1, &type metadata for Storefront, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100048430);
  }
}

unint64_t sub_10001900C()
{
  unint64_t result;

  result = qword_100048438;
  if (!qword_100048438)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Storefront, &type metadata for Storefront);
    atomic_store(result, (unint64_t *)&qword_100048438);
  }
  return result;
}

void sub_100019050(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100048440)
  {
    sub_1000190A4();
    v3 = type metadata accessor for _ContiguousArrayStorage(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100048440);
  }
}

void sub_1000190A4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_100048448)
  {
    v0 = type metadata accessor for Option(0, &type metadata for Storefront);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_100048448);
  }
}

unint64_t sub_1000190F8()
{
  unint64_t result;

  result = qword_100048450;
  if (!qword_100048450)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Storefront, &type metadata for Storefront);
    atomic_store(result, (unint64_t *)&qword_100048450);
  }
  return result;
}

__n128 sub_10001913C@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __n128 result;
  __int128 v14;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(a5, a1);
  v10 = a5 + *(int *)(type metadata accessor for ScoredArticle(0, a3, a4, v9) + 36);
  v11 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v10 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v10 + 80) = v11;
  *(_OWORD *)(v10 + 96) = *(_OWORD *)(a2 + 96);
  *(_QWORD *)(v10 + 112) = *(_QWORD *)(a2 + 112);
  v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v10 = *(_OWORD *)a2;
  *(_OWORD *)(v10 + 16) = v12;
  result = *(__n128 *)(a2 + 32);
  v14 = *(_OWORD *)(a2 + 48);
  *(__n128 *)(v10 + 32) = result;
  *(_OWORD *)(v10 + 48) = v14;
  return result;
}

uint64_t ScoredArticle.article.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

double ScoredArticle.score.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  double result;
  __int128 v7;
  __int128 v8;

  v3 = v2 + *(int *)(a1 + 36);
  v4 = *(_QWORD *)(v3 + 32);
  v5 = *(_BYTE *)(v3 + 56);
  result = *(double *)(v3 + 112);
  v7 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)v3;
  *(_OWORD *)(a2 + 16) = v7;
  *(_QWORD *)(a2 + 32) = v4;
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(v3 + 40);
  *(_BYTE *)(a2 + 56) = v5;
  v8 = *(_OWORD *)(v3 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(a2 + 80) = v8;
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(v3 + 96);
  *(double *)(a2 + 112) = result;
  return result;
}

uint64_t sub_10001921C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t sub_100019224(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = swift_checkMetadataState(319, *(_QWORD *)(a1 + 16));
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = "x";
    swift_initStructMetadata(a1, 0, 2, v4, a1 + 32);
    return 0;
  }
  return result;
}

uint64_t *sub_100019298(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 120 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain(v9);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v12 = *(_OWORD *)(v11 + 48);
    v14 = *(_OWORD *)v11;
    v13 = *(_OWORD *)(v11 + 16);
    *(_OWORD *)(v10 + 32) = *(_OWORD *)(v11 + 32);
    *(_OWORD *)(v10 + 48) = v12;
    *(_OWORD *)v10 = v14;
    *(_OWORD *)(v10 + 16) = v13;
    v16 = *(_OWORD *)(v11 + 80);
    v15 = *(_OWORD *)(v11 + 96);
    v17 = *(_OWORD *)(v11 + 64);
    *(_QWORD *)(v10 + 112) = *(_QWORD *)(v11 + 112);
    *(_OWORD *)(v10 + 80) = v16;
    *(_OWORD *)(v10 + 96) = v15;
    *(_OWORD *)(v10 + 64) = v17;
  }
  return v4;
}

uint64_t sub_100019368(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_100019378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_OWORD *)(v8 + 48);
  v11 = *(_OWORD *)v8;
  v10 = *(_OWORD *)(v8 + 16);
  *(_OWORD *)(v7 + 32) = *(_OWORD *)(v8 + 32);
  *(_OWORD *)(v7 + 48) = v9;
  *(_OWORD *)v7 = v11;
  *(_OWORD *)(v7 + 16) = v10;
  v13 = *(_OWORD *)(v8 + 80);
  v12 = *(_OWORD *)(v8 + 96);
  v14 = *(_OWORD *)(v8 + 64);
  *(_QWORD *)(v7 + 112) = *(_QWORD *)(v8 + 112);
  *(_OWORD *)(v7 + 80) = v13;
  *(_OWORD *)(v7 + 96) = v12;
  *(_OWORD *)(v7 + 64) = v14;
  return a1;
}

uint64_t sub_1000193F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v7 = *(_QWORD *)v8;
  *(_QWORD *)(v7 + 8) = *(_QWORD *)(v8 + 8);
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v8 + 16);
  *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
  *(_QWORD *)(v7 + 32) = *(_QWORD *)(v8 + 32);
  *(_QWORD *)(v7 + 40) = *(_QWORD *)(v8 + 40);
  *(_QWORD *)(v7 + 48) = *(_QWORD *)(v8 + 48);
  *(_BYTE *)(v7 + 56) = *(_BYTE *)(v8 + 56);
  *(_QWORD *)(v7 + 64) = *(_QWORD *)(v8 + 64);
  *(_QWORD *)(v7 + 72) = *(_QWORD *)(v8 + 72);
  *(_QWORD *)(v7 + 80) = *(_QWORD *)(v8 + 80);
  *(_QWORD *)(v7 + 88) = *(_QWORD *)(v8 + 88);
  *(_QWORD *)(v7 + 96) = *(_QWORD *)(v8 + 96);
  *(_QWORD *)(v7 + 104) = *(_QWORD *)(v8 + 104);
  *(_QWORD *)(v7 + 112) = *(_QWORD *)(v8 + 112);
  return a1;
}

uint64_t sub_1000194C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_OWORD *)(v8 + 48);
  v11 = *(_OWORD *)v8;
  v10 = *(_OWORD *)(v8 + 16);
  *(_OWORD *)(v7 + 32) = *(_OWORD *)(v8 + 32);
  *(_OWORD *)(v7 + 48) = v9;
  *(_OWORD *)v7 = v11;
  *(_OWORD *)(v7 + 16) = v10;
  v13 = *(_OWORD *)(v8 + 80);
  v12 = *(_OWORD *)(v8 + 96);
  v14 = *(_OWORD *)(v8 + 64);
  *(_QWORD *)(v7 + 112) = *(_QWORD *)(v8 + 112);
  *(_OWORD *)(v7 + 80) = v13;
  *(_OWORD *)(v7 + 96) = v12;
  *(_OWORD *)(v7 + 64) = v14;
  return a1;
}

uint64_t sub_10001953C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v7 = *(_QWORD *)v8;
  *(_QWORD *)(v7 + 8) = *(_QWORD *)(v8 + 8);
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v8 + 16);
  *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
  *(_QWORD *)(v7 + 32) = *(_QWORD *)(v8 + 32);
  *(_QWORD *)(v7 + 40) = *(_QWORD *)(v8 + 40);
  *(_QWORD *)(v7 + 48) = *(_QWORD *)(v8 + 48);
  *(_BYTE *)(v7 + 56) = *(_BYTE *)(v8 + 56);
  *(_QWORD *)(v7 + 64) = *(_QWORD *)(v8 + 64);
  *(_QWORD *)(v7 + 72) = *(_QWORD *)(v8 + 72);
  *(_QWORD *)(v7 + 80) = *(_QWORD *)(v8 + 80);
  *(_QWORD *)(v7 + 88) = *(_QWORD *)(v8 + 88);
  *(_QWORD *)(v7 + 96) = *(_QWORD *)(v8 + 96);
  *(_QWORD *)(v7 + 104) = *(_QWORD *)(v8 + 104);
  *(_QWORD *)(v7 + 112) = *(_QWORD *)(v8 + 112);
  return a1;
}

uint64_t sub_100019608(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0xFE)
    v6 = 254;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 >= 0xFE)
      return (*(uint64_t (**)(void))(v4 + 48))();
    v12 = *(unsigned __int8 *)(((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) + 0x38);
    if (v12 >= 2)
      return ((v12 + 2147483646) & 0x7FFFFFFF) + 1;
    return 0;
  }
  if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 120) & 0xFFFFFFF8) != 0)
    v8 = 2;
  else
    v8 = a2 - v6 + 1;
  if (v8 >= 0x10000)
    v9 = 4;
  else
    v9 = 2;
  if (v8 < 0x100)
    v9 = 1;
  if (v8 >= 2)
    v10 = v9;
  else
    v10 = 0;
  return ((uint64_t (*)(void))((char *)&loc_100019684 + 4 * byte_100038010[v10]))();
}

void sub_10001970C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0xFEu)
    v6 = 254;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFF88)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFF88)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 120);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_100019800()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x100019898);
}

void sub_100019808(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x100019810);
  JUMPOUT(0x100019898);
}

void sub_100019854()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x100019898);
}

void sub_10001985C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x100019898);
}

uint64_t sub_100019864(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0xFE)
  {
    if (a2 > 0xFE)
      JUMPOUT(0x100019870);
    *(_BYTE *)(((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 56) = a2 + 1;
LABEL_6:
    JUMPOUT(0x100019898);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

uint64_t type metadata accessor for ScoredArticle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000198BC(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ScoredArticle);
}

uint64_t sub_1000198BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t sub_1000198E8()
{
  uint64_t v0;

  sub_10000778C((_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 56, 7);
}

void sub_10001990C()
{
  SceneStateMonitor.sceneWillResignActive()();
}

void sub_100019914(Swift::String with)
{
  SceneStateMonitor.sceneWillResignActive(with:)(with);
}

void sub_10001991C()
{
  SceneStateMonitor.sceneDidEnterBackground()();
}

void sub_100019924(Swift::String with)
{
  SceneStateMonitor.sceneDidEnterBackground(with:)(with);
}

void sub_10001992C()
{
  SceneStateMonitor.sceneDidDisconnect()();
}

uint64_t sub_100019934(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9[2];

  type metadata accessor for AppDependencyManager(0);
  v2 = static AppDependencyManager.shared.getter();
  sub_100010534(a1, (uint64_t)v9);
  v3 = type metadata accessor for AppIntentsDependencyStartupTask(0);
  v4 = swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  swift_defaultActor_initialize();
  v5 = v4 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_executionPhase;
  v6 = enum case for StartupTaskExecutionPhase.didFinishLaunching(_:);
  v7 = type metadata accessor for StartupTaskExecutionPhase(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  *(_QWORD *)(v4 + 112) = v2;
  sub_10000C6A0(v9, v4 + 120);
  return v4;
}

uint64_t sub_1000199EC(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  _QWORD v7[5];

  v2 = a2[3];
  v3 = a2[4];
  sub_10000C1E8(a2, v2);
  v4 = type metadata accessor for AppIntentsDependencyStartupTask(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v4, v4, v2, v3);
  if (result)
  {
    v6 = result;
    v7[3] = v4;
    v7[4] = sub_100008EA0(&qword_100048628, type metadata accessor for AppIntentsDependencyStartupTask, (uint64_t)&unk_100037E60);
    v7[0] = v6;
    StartupTaskManager.onStartup(run:)(v7);
    return sub_10000778C(v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100019A98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void (*v8)(_QWORD *, _QWORD, uint64_t);
  void (*v9)(_QWORD *, uint64_t);
  uint64_t v11;

  v4 = type metadata accessor for DebugModel(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (uint64_t *)((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v7 = sub_100019EB8;
  v7[1] = a3;
  v8 = *(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104);
  v8(v7, enum case for DebugModel.action(_:), v4);
  swift_retain(a3);
  dispatch thunk of DebugDataSource.add(_:_:)(0xD00000000000001ALL, 0x80000001000358B0, v7);
  v9 = *(void (**)(_QWORD *, uint64_t))(v5 + 8);
  v9(v7, v4);
  *v7 = sub_100019C44;
  v7[1] = 0;
  v8(v7, enum case for DebugModel.modal(_:), v4);
  dispatch thunk of DebugDataSource.add(_:_:)(0xD000000000000012, 0x80000001000358D0, v7);
  return ((uint64_t (*)(_QWORD *, uint64_t))v9)(v7, v4);
}

void sub_100019BB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (qword_100047868 != -1)
    swift_once(&qword_100047868, sub_100006134);
  v0 = static Settings.Debug.clearCacheOnNextLaunch;
  v3 = 1;
  v1 = type metadata accessor for DebugAssembly();
  v2 = sub_10001A548((unint64_t *)&unk_100048700, (uint64_t)&unk_1000381B8);
  Updatable.save<A>(setting:value:)(v0, &v3, v1, v2);
  exit(0);
}

id sub_100019C44()
{
  id v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  Class isa;
  Class v12;
  id v13;
  __int128 v15;
  uint64_t v16;
  _OWORD v17[2];

  v0 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DiagnosticFileProvider()), "init");
  v1 = _s9StocksApp22DiagnosticFileProviderC5filesSaySSGyF_0();

  v2 = *((_QWORD *)v1 + 2);
  if (v2)
  {
    v3 = type metadata accessor for URL(0);
    swift_bridgeObjectRetain(v1);
    v4 = (uint64_t *)(v1 + 40);
    v5 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      v6 = *(v4 - 1);
      v7 = *v4;
      v16 = v3;
      sub_10000F58C(&v15);
      swift_bridgeObjectRetain(v7);
      URL.init(fileURLWithPath:)(v6, v7);
      swift_bridgeObjectRelease(v7);
      if (v16)
      {
        sub_10001A444(&v15, v17);
        sub_10001A444(v17, &v15);
        if ((swift_isUniquelyReferenced_nonNull_native(v5) & 1) == 0)
          v5 = sub_100019FE0(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
        v9 = *((_QWORD *)v5 + 2);
        v8 = *((_QWORD *)v5 + 3);
        if (v9 >= v8 >> 1)
          v5 = sub_100019FE0((char *)(v8 > 1), v9 + 1, 1, v5);
        *((_QWORD *)v5 + 2) = v9 + 1;
        sub_10001A444(&v15, &v5[32 * v9 + 32]);
      }
      else
      {
        sub_100011C40((uint64_t)&v15);
      }
      v4 += 2;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease_n(v1, 2);
  }
  else
  {
    swift_bridgeObjectRelease(v1);
    v5 = (char *)&_swiftEmptyArrayStorage;
  }
  v10 = objc_allocWithZone((Class)UIActivityViewController);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  sub_10001A408();
  v12 = Array._bridgeToObjectiveC()().super.isa;
  v13 = objc_msgSend(v10, "initWithActivityItems:applicationActivities:", isa, v12);

  return v13;
}

uint64_t sub_100019E40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return Updatable.save<A>(setting:value:)(a1, a2, a5, a6);
}

uint64_t sub_100019E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return Updatable.reset<A>(setting:)(a1, a4, a5);
}

uint64_t sub_100019E5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return Configurable.setting<A>(_:)(a1, a4, a5);
}

uint64_t sub_100019E68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return Configurable.setting<A>(_:defaultValue:)(a1, a2, a5, a6);
}

uint64_t sub_100019E74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return Configurable.setting<A>(_:_:)(a1, a2, a3, a6, a7);
}

uint64_t sub_100019E80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return Configurable.setting<A>(_:defaultValue:_:)(a1, a2, a3, a4, a7, a8);
}

uint64_t sub_100019E8C()
{
  return sub_10001A548((unint64_t *)&unk_1000486E0, (uint64_t)&unk_100038178);
}

uint64_t sub_100019EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100019A98(a1, a2, v2);
}

void sub_100019EB8()
{
  sub_100019BB8();
}

char *sub_100019EC0(char *result, int64_t a2, char a3, char *a4)
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
      sub_10000FD20(0, (unint64_t *)&unk_100049180, (uint64_t)&type metadata for String, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
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
    sub_10001A318(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_100019FE0(char *result, int64_t a2, char a3, char *a4)
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
      sub_10000FD20(0, &qword_1000486F8, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 1;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 5);
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
        if (v11 != a4 || v14 >= &a4[32 * v8 + 32])
          memmove(v14, a4 + 32, 32 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10001A454(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001A104(char a1, int64_t a2, char a3, unint64_t a4)
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
  uint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
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
    v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_10000F6A0(0, &qword_100048710, (uint64_t (*)(uint64_t))&type metadata accessor for Stock);
  v11 = v10;
  v12 = *(_QWORD *)(type metadata accessor for Stock(0) - 8);
  v13 = *(_QWORD *)(v12 + 72);
  v14 = *(unsigned __int8 *)(v12 + 80);
  v15 = (v14 + 32) & ~v14;
  v16 = (_QWORD *)swift_allocObject(v11, v15 + v13 * v9, v14 | 7);
  v17 = j__malloc_size(v16);
  if (!v13)
    goto LABEL_29;
  if (v17 - v15 == 0x8000000000000000 && v13 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v16[2] = v8;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v13);
LABEL_19:
  v19 = type metadata accessor for Stock(0);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v22 = (unint64_t)v16 + v21;
  if ((a1 & 1) != 0)
  {
    v23 = a4 + v21;
    if ((unint64_t)v16 < a4 || v22 >= v23 + *(_QWORD *)(v20 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v16 + v21, v23, v8, v19);
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v16 + v21);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001A584(0, v8, v22, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v16;
}

uint64_t sub_10001A318(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

unint64_t sub_10001A408()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000486F0;
  if (!qword_1000486F0)
  {
    v1 = objc_opt_self(UIActivity);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000486F0);
  }
  return result;
}

_OWORD *sub_10001A444(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10001A454(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
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

uint64_t sub_10001A548(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for DebugAssembly();
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001A584(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  v8 = *(_QWORD *)(type metadata accessor for Stock(0) - 8);
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

uint64_t type metadata accessor for AppIntentExecutionTypeProvider()
{
  return objc_opt_self(_TtC9StocksApp30AppIntentExecutionTypeProvider);
}

uint64_t sub_10001A6BC@<X0>(uint64_t a1@<X8>)
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
  _QWORD v13[4];
  _BYTE v14[16];
  uint64_t v15;
  _BYTE v16[16];
  uint64_t v17;
  _BYTE v18[16];
  uint64_t v19;

  v2 = enum case for AppIntentType.unknown(_:);
  v3 = type metadata accessor for AppIntentType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
  v4 = type metadata accessor for OpenArticleIntent(0);
  v19 = a1;
  v5 = sub_100008EA0(&qword_1000487D8, (uint64_t (*)(uint64_t))&type metadata accessor for OpenArticleIntent, (uint64_t)&protocol conformance descriptor for OpenArticleIntent);
  _AppIntentExecution.callAsFunction<A>(for:handler:)(v4, sub_10001A838, v18, v4, v5);
  v6 = type metadata accessor for OpenBusinessNewsIntent(0);
  v17 = a1;
  v7 = sub_100008EA0(&qword_1000487E0, (uint64_t (*)(uint64_t))&type metadata accessor for OpenBusinessNewsIntent, (uint64_t)&protocol conformance descriptor for OpenBusinessNewsIntent);
  _AppIntentExecution.callAsFunction<A>(for:handler:)(v6, sub_10001A844, v16, v6, v7);
  v8 = type metadata accessor for OpenSymbolIntent(0);
  v15 = a1;
  v9 = sub_100008EA0((unint64_t *)&qword_100048148, (uint64_t (*)(uint64_t))&type metadata accessor for OpenSymbolIntent, (uint64_t)&protocol conformance descriptor for OpenSymbolIntent);
  _AppIntentExecution.callAsFunction<A>(for:handler:)(v8, sub_10001A850, v14, v8, v9);
  v10 = type metadata accessor for OpenWatchlistIntent(0);
  v13[2] = a1;
  v11 = sub_100008EA0(&qword_1000487E8, (uint64_t (*)(uint64_t))&type metadata accessor for OpenWatchlistIntent, (uint64_t)&protocol conformance descriptor for OpenWatchlistIntent);
  return _AppIntentExecution.callAsFunction<A>(for:handler:)(v10, sub_10001A85C, v13, v10, v11);
}

uint64_t sub_10001A838(uint64_t a1)
{
  return sub_10001A868(a1, &enum case for AppIntentType.openArticle(_:));
}

uint64_t sub_10001A844(uint64_t a1)
{
  return sub_10001A868(a1, &enum case for AppIntentType.openBusinessNews(_:));
}

uint64_t sub_10001A850(uint64_t a1)
{
  return sub_10001A868(a1, &enum case for AppIntentType.openSymbol(_:));
}

uint64_t sub_10001A85C(uint64_t a1)
{
  return sub_10001A868(a1, &enum case for AppIntentType.openWatchlist(_:));
}

uint64_t sub_10001A868(uint64_t a1, unsigned int *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v2 + 16);
  v5 = type metadata accessor for AppIntentType(0);
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v4, *a2, v5);
}

uint64_t sub_10001A8C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = type metadata accessor for AppIntentExecutionTypeProvider();
  v3 = swift_allocObject(v2, 16, 7);
  a1[3] = v2;
  result = sub_100008EA0(&qword_1000489F8, (uint64_t (*)(uint64_t))type metadata accessor for AppIntentExecutionTypeProvider, (uint64_t)&unk_100038240);
  a1[4] = result;
  *a1 = v3;
  return result;
}

uint64_t sub_10001A92C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = type metadata accessor for SceneProvider(0);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  result = SceneProvider.init()();
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for SceneProvider;
  *a1 = result;
  return result;
}

_QWORD *sub_10001A984(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  v2 = type metadata accessor for AppConfiguration(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1[3];
  v7 = a1[4];
  sub_10000C1E8(a1, v6);
  v8 = sub_10000C3D0(0, &qword_1000489F0, (uint64_t)&protocol descriptor for AppConfigurationManagerType, 1);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(&v15, v8, v8, v6, v7);
  if (v16)
  {
    sub_10000C6A0(&v15, (uint64_t)v17);
    type metadata accessor for StateRestoreController(0);
    v10 = v18;
    v11 = v19;
    sub_10000C1E8(v17, v18);
    v12 = dispatch thunk of AppConfigurationManagerType.appConfiguration.getter(v10, v11);
    v13 = AppConfiguration.stateRestorationAllowedTimeWindow.getter(v12);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v14 = StateRestoreController.__allocating_init(timeWindow:isStateRestorationEnabled:shouldAlwaysAllowStateRestoration:)(1, 0, v13);
    sub_10000778C(v17);
    return (_QWORD *)v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001AACC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v1 = a1[3];
  v2 = a1[4];
  sub_10000C1E8(a1, v1);
  v3 = sub_10000DEA8(0, &qword_1000489E8, &protocolRef_FCAppActivityReceiver);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v3, v3, v1, v2);
  if (result)
  {
    v5 = result;
    v6 = type metadata accessor for SceneStateManagerBridge(0);
    swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
    return SceneStateManagerBridge.init(activityReceiver:)(v5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

_QWORD *sub_10001AB50(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v1 = a1[3];
  v2 = a1[4];
  sub_10000C1E8(a1, v1);
  v3 = sub_10000C3D0(0, &qword_1000489E0, (uint64_t)&protocol descriptor for PrivateDataPollingServiceType, 1);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(&v7, v3, v3, v1, v2);
  if (v8)
  {
    v5 = type metadata accessor for PrivateDataPollingManager();
    v6 = swift_allocObject(v5, 56, 7);
    sub_10000C6A0(&v7, v6 + 16);
    return (_QWORD *)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001ABEC()
{
  uint64_t v0;

  v0 = type metadata accessor for AppActivationURLHandler(0);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  return AppActivationURLHandler.init()();
}

_QWORD *sub_10001AC20@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v4 = a1[3];
  v5 = a1[4];
  sub_10000C1E8(a1, v4);
  v6 = sub_10000C3D0(0, &qword_100048888, (uint64_t)&protocol descriptor for WatchlistManagerType, 1);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v14, v6, v6, v4, v5);
  if (v14[3])
  {
    v8 = a1[3];
    v9 = a1[4];
    sub_10000C1E8(a1, v8);
    v10 = sub_10000C3D0(0, &qword_1000489D0, (uint64_t)&protocol descriptor for StockMetadataManagerType, 1);
    result = dispatch thunk of ResolverType.resolve<A>(_:)(v13, v10, v10, v8, v9);
    if (v13[3])
    {
      v11 = objc_allocWithZone((Class)type metadata accessor for GizmoSyncManager());
      v12 = sub_100021C68(v14, v13);
      result = (_QWORD *)sub_100008EA0(&qword_1000489D8, (uint64_t (*)(uint64_t))type metadata accessor for GizmoSyncManager, (uint64_t)&unk_1000386C4);
      *a2 = v12;
      a2[1] = result;
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

uint64_t sub_10001AD38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = type metadata accessor for StubGizmoSyncManager();
  v3 = swift_allocObject(v2, 16, 7);
  result = sub_100008EA0(&qword_1000489C8, (uint64_t (*)(uint64_t))type metadata accessor for StubGizmoSyncManager, (uint64_t)&unk_100038678);
  *a1 = v3;
  a1[1] = result;
  return result;
}

_QWORD *sub_10001AD98(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];

  v2 = a1[3];
  v3 = a1[4];
  sub_10000C1E8(a1, v2);
  sub_10000D358(0, (unint64_t *)&unk_1000488F0, (uint64_t (*)(uint64_t))&type metadata accessor for AppEvent, sub_100010220, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for EventManager);
  result = (_QWORD *)dispatch thunk of ResolverType.resolve<A>(_:)(v4, v4, v2, v3);
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  v6 = (uint64_t)result;
  v7 = a1[3];
  v8 = a1[4];
  sub_10000C1E8(a1, v7);
  v9 = sub_10000C3D0(0, &qword_100048888, (uint64_t)&protocol descriptor for WatchlistManagerType, 1);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v16, v9, v9, v7, v8);
  if (!v16[3])
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v10 = a1[3];
  v11 = a1[4];
  sub_10000C1E8(a1, v10);
  v12 = type metadata accessor for StocksTodayAgent(0);
  result = (_QWORD *)dispatch thunk of ResolverType.resolve<A>(_:)(v12, v12, v10, v11);
  if (result)
  {
    v13 = result;
    v14 = *(_QWORD *)((char *)result + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_didWriteTodayDataSubject);
    swift_retain(v14);

    v15 = type metadata accessor for WidgetContentInvalidationManager(0);
    swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
    return sub_10000C8DC(v6, v16, v14);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_10001AEE8(uint64_t a1)
{
  _QWORD v3[4];

  type metadata accessor for MainActor(0);
  v3[2] = a1;
  return sub_10001B0DC((void (*)(uint64_t *__return_ptr))sub_10001B570, (uint64_t)v3, (uint64_t)"StocksApp/ManagerAssembly.swift", 31, 2, 119);
}

char *sub_10001AF4C@<X0>(_QWORD *a1@<X0>, char **a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *result;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;

  v4 = a1[3];
  v5 = a1[4];
  sub_10000C1E8(a1, v4);
  v6 = sub_1000059D0(0, &qword_1000488D8, FCPurchaseController_ptr);
  result = (char *)dispatch thunk of ResolverType.resolve<A>(_:)(v6, v6, v4, v5);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  v8 = result;
  v9 = a1[3];
  v10 = a1[4];
  sub_10000C1E8(a1, v9);
  v11 = sub_10000DEA8(0, (unint64_t *)&qword_1000488E0, &protocolRef_FCBundleSubscriptionManagerType);
  result = (char *)dispatch thunk of ResolverType.resolve<A>(_:)(v11, v11, v9, v10);
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v12 = result;
  v13 = a1[3];
  v14 = a1[4];
  sub_10000C1E8(a1, v13);
  v15 = sub_1000059D0(0, &qword_1000488E8, FCSubscriptionController_ptr);
  result = (char *)dispatch thunk of ResolverType.resolve<A>(_:)(v15, v15, v13, v14);
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v16 = result;
  v17 = a1[3];
  v18 = a1[4];
  sub_10000C1E8(a1, v17);
  v19 = sub_1000059D0(0, &qword_1000488C8, FCFileCoordinatedTodayDropbox_ptr);
  result = (char *)dispatch thunk of ResolverType.resolve<A>(_:)(v19, v19, v17, v18);
  if (result)
  {
    v20 = result;
    v21 = objc_allocWithZone((Class)type metadata accessor for StocksTodayAgent(0));
    result = sub_100031B60(v8, v12, v16, v20);
    *a2 = result;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10001B0DC(void (*a1)(uint64_t *__return_ptr), uint64_t a2, uint64_t isEscapingClosureAtFileLocation, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v15;
  uint64_t v16;
  uint64_t MainExecutor;
  uint64_t v18;
  uint64_t result;
  Swift::String v20;
  Swift::String v21;
  void *object;
  Swift::String v23;
  uint64_t v24;
  unint64_t v25;

  v8 = v6;
  v15 = static MainActor.shared.getter();
  v16 = swift_release(v15);
  MainExecutor = swift_task_getMainExecutor(v16);
  if ((swift_task_isCurrentExecutor(MainExecutor) & 1) != 0)
  {
    a4 = swift_allocObject(&unk_100042B78, 32, 7);
    *(_QWORD *)(a4 + 16) = a1;
    *(_QWORD *)(a4 + 24) = a2;
    v18 = a2;
    a1(&v24);
    a5 = v7;
    if (v7)
    {
      swift_release(a4);
      return v18;
    }
    v18 = v24;
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(a4, "", 0, 0, 0, 0);
    swift_release(a4);
    if ((isEscapingClosureAtFileLocation & 1) == 0)
      return v18;
    __break(1u);
  }
  v24 = 0;
  v25 = 0xE000000000000000;
  _StringGuts.grow(_:)(66);
  v20._object = (void *)0x8000000100035A70;
  v20._countAndFlagsBits = 0xD00000000000003FLL;
  String.append(_:)(v20);
  v21._countAndFlagsBits = _typeName(_:qualified:)(v8, 0);
  object = v21._object;
  String.append(_:)(v21);
  swift_bridgeObjectRelease(object);
  v23._countAndFlagsBits = 46;
  v23._object = (void *)0xE100000000000000;
  String.append(_:)(v23);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v24, v25, isEscapingClosureAtFileLocation, a4, a5, a6, 0);
  __break(1u);
  return result;
}

uint64_t sub_10001B26C(void (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v14;
  uint64_t v15;
  uint64_t MainExecutor;
  uint64_t result;
  char isEscapingClosureAtFileLocation;
  Swift::String v19;
  Swift::String v20;
  void *object;
  Swift::String v22;

  v8 = v6;
  v14 = static MainActor.shared.getter();
  v15 = swift_release(v14);
  MainExecutor = swift_task_getMainExecutor(v15);
  if ((swift_task_isCurrentExecutor(MainExecutor) & 1) == 0)
    goto LABEL_6;
  a4 = swift_allocObject(&unk_100042BC8, 32, 7);
  *(_QWORD *)(a4 + 16) = a1;
  *(_QWORD *)(a4 + 24) = a2;
  a1();
  if (v7)
    return swift_release(a4);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(a4, "", 0, 0, 0, 0);
  result = swift_release(a4);
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
LABEL_6:
    _StringGuts.grow(_:)(66);
    v19._object = (void *)0x8000000100035A70;
    v19._countAndFlagsBits = 0xD00000000000003FLL;
    String.append(_:)(v19);
    v20._countAndFlagsBits = _typeName(_:qualified:)(v8, 0);
    object = v20._object;
    String.append(_:)(v20);
    swift_bridgeObjectRelease(object);
    v22._countAndFlagsBits = 46;
    v22._object = (void *)0xE100000000000000;
    String.append(_:)(v22);
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, a3, a4, a5, a6, 0);
    __break(1u);
  }
  return result;
}

uint64_t sub_10001B3F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  uint64_t result;
  id v12;
  NSURL *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;

  v0 = type metadata accessor for URL(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000BBFC(0, &qword_1000488D0, v4, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v17 - v7;
  v9 = (id)FCURLForTodayDropbox(v6);
  if (v9)
  {
    v10 = v9;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v8, v3, v0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v1 + 56))(v8, 0, 1, v0);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 48))(v8, 1, v0);
    if ((_DWORD)result != 1)
    {
      v12 = objc_allocWithZone((Class)FCFileCoordinatedTodayDropbox);
      URL._bridgeToObjectiveC()(v13);
      v15 = v14;
      v16 = objc_msgSend(v12, "initWithFileURL:", v14);

      (*(void (**)(char *, uint64_t))(v1 + 8))(v8, v0);
      return (uint64_t)v16;
    }
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v8, 1, 1, v0);
  }
  __break(1u);
  return result;
}

char *sub_10001B570@<X0>(char **a1@<X8>)
{
  uint64_t v1;

  return sub_10001AF4C(*(_QWORD **)(v1 + 16), a1);
}

uint64_t sub_10001B588()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001B598()
{
  return Watchlist.displayState.getter();
}

uint64_t sub_10001B5B8()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001B5DC(uint64_t a1)
{
  uint64_t v1;

  return sub_10001B654(a1, v1);
}

uint64_t sub_10001B5E4(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    sub_10000D41C(255, a2, a3, a4);
    result = swift_getWitnessTable(&protocol conformance descriptor for Publishers.ReceiveOn<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001B624(uint64_t a1)
{
  uint64_t v1;

  return sub_10001B7C4(a1, v1);
}

uint64_t sub_10001B62C(uint64_t a1)
{
  uint64_t v1;

  return sub_10001B934(a1, v1);
}

uint64_t sub_10001B634(uint64_t a1)
{
  uint64_t v1;

  return sub_10001B940(a1, v1);
}

uint64_t sub_10001B63C(uint64_t a1)
{
  uint64_t v1;

  return sub_10001B94C(a1, v1);
}

uint64_t sub_10001B644()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001B654(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t Strong;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t result;
  uint64_t v15;
  _BYTE v16[24];
  _BYTE v17[24];

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = a2 + 16;
  swift_beginAccess(v7, v17, 0, 0);
  Strong = swift_weakLoadStrong(v7);
  if (Strong)
  {
    v9 = Strong;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v6, Strong + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_logger, v3);
    v10 = swift_release(v9);
    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Attempting widget update for today dropbox changes", v13, 2u);
      swift_slowDealloc(v13, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  }
  swift_beginAccess(v7, v16, 0, 0);
  result = swift_weakLoadStrong(v7);
  if (result)
  {
    v15 = result;
    sub_100009BAC(1);
    return swift_release(v15);
  }
  return result;
}

uint64_t sub_10001B7C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t Strong;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t result;
  uint64_t v15;
  _BYTE v16[24];
  _BYTE v17[24];

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = a2 + 16;
  swift_beginAccess(v7, v17, 0, 0);
  Strong = swift_weakLoadStrong(v7);
  if (Strong)
  {
    v9 = Strong;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v6, Strong + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_logger, v3);
    v10 = swift_release(v9);
    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Attempting widget update for currency display changes", v13, 2u);
      swift_slowDealloc(v13, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  }
  swift_beginAccess(v7, v16, 0, 0);
  result = swift_weakLoadStrong(v7);
  if (result)
  {
    v15 = result;
    sub_100009BAC(0);
    return swift_release(v15);
  }
  return result;
}

uint64_t sub_10001B934(uint64_t a1, uint64_t a2)
{
  return sub_100007F54(a1, a2, "Attempting widget update for news attribution changes");
}

uint64_t sub_10001B940(uint64_t a1, uint64_t a2)
{
  return sub_100007F54(a1, a2, "Attempting widget update for news provider changes");
}

uint64_t sub_10001B94C(uint64_t a1, uint64_t a2)
{
  return sub_100007F54(a1, a2, "Attempting widget update for news environment changes");
}

uint64_t sub_10001B958(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _BYTE v4[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v4, 0, 0);
  result = swift_weakLoadStrong(v1);
  if (result)
  {
    v3 = result;
    *(_BYTE *)(result + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_hasCompletedColdLaunch) = 1;
    sub_100008508();
    return swift_release(v3);
  }
  return result;
}

uint64_t sub_10001B9BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_logger;
  v2 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_cancellables));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_10001BA1C()
{
  return type metadata accessor for WidgetContentInvalidationManager(0);
}

uint64_t sub_10001BA24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  return Configurable.setting<A>(_:_:)(a1, a2, a3, *v7, a7);
}

void sub_10001BA30(uint64_t a1, const char *a2, char a3)
{
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v5 = Logger.logObject.getter(a1);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, a2, v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  sub_100009BAC(a3 & 1);
}

uint64_t sub_10001BAE4()
{
  uint64_t v0;

  swift_retain(v0);
  asyncMain(block:)(sub_10001BF64, v0);
  return swift_release(v0);
}

uint64_t sub_10001BB10()
{
  uint64_t v0;

  return sub_10001B958(v0);
}

void sub_10001BB18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  void *v28;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v2 = a1;
    else
      v2 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = __CocoaSet.makeIterator()(v2);
    v4 = sub_1000059D0(0, &qword_100048B20, UIScene_ptr);
    v5 = sub_10000F84C();
    v6 = Set.Iterator.init(_cocoa:)(v27, v3, v4, v5);
    v1 = v27[0];
    v25 = v27[1];
    v7 = v27[2];
    v8 = v27[3];
    v9 = v27[4];
  }
  else
  {
    v10 = -1 << *(_BYTE *)(a1 + 32);
    v25 = a1 + 56;
    v7 = ~v10;
    v11 = -v10;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v9 = v12 & *(_QWORD *)(a1 + 56);
    v6 = (_QWORD *)swift_bridgeObjectRetain(a1);
    v8 = 0;
  }
  v24 = (unint64_t)(v7 + 64) >> 6;
  while (1)
  {
    v17 = v8;
    if ((v1 & 0x8000000000000000) == 0)
      break;
    v21 = __CocoaSet.Iterator.next()(v6);
    if (!v21)
      goto LABEL_34;
    v22 = v21;
    v26 = v21;
    v23 = sub_1000059D0(0, &qword_100048B20, UIScene_ptr);
    swift_unknownObjectRetain(v22);
    swift_dynamicCast(&v28, &v26, (char *)&type metadata for Swift.AnyObject + 8, v23, 7);
    v15 = v28;
    swift_unknownObjectRelease(v22);
    if (!v15)
      goto LABEL_34;
LABEL_13:
    v16 = objc_msgSend(v15, "activationState");

    if (!v16)
      goto LABEL_34;
  }
  if (v9)
  {
    v13 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    v14 = v13 | (v8 << 6);
LABEL_12:
    v15 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v14);
    if (!v15)
      goto LABEL_34;
    goto LABEL_13;
  }
  v18 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v18 >= v24)
      goto LABEL_34;
    v19 = *(_QWORD *)(v25 + 8 * v18);
    ++v8;
    if (!v19)
    {
      v8 = v17 + 2;
      if (v17 + 2 >= v24)
        goto LABEL_34;
      v19 = *(_QWORD *)(v25 + 8 * v8);
      if (!v19)
      {
        v8 = v17 + 3;
        if (v17 + 3 >= v24)
          goto LABEL_34;
        v19 = *(_QWORD *)(v25 + 8 * v8);
        if (!v19)
        {
          v8 = v17 + 4;
          if (v17 + 4 >= v24)
            goto LABEL_34;
          v19 = *(_QWORD *)(v25 + 8 * v8);
          if (!v19)
          {
            v8 = v17 + 5;
            if (v17 + 5 >= v24)
              goto LABEL_34;
            v19 = *(_QWORD *)(v25 + 8 * v8);
            if (!v19)
            {
              v20 = v17 + 6;
              while (v24 != v20)
              {
                v19 = *(_QWORD *)(v25 + 8 * v20++);
                if (v19)
                {
                  v8 = v20 - 1;
                  goto LABEL_31;
                }
              }
LABEL_34:
              sub_100012E94(v1);
              return;
            }
          }
        }
      }
    }
LABEL_31:
    v9 = (v19 - 1) & v19;
    v14 = __clz(__rbit64(v19)) + (v8 << 6);
    goto LABEL_12;
  }
  __break(1u);
}

uint64_t sub_10001BDF8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007C0C();
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

void sub_10001BF40()
{
  uint64_t v0;

  sub_10001BA30(v0, "Attempting widget update for price data changes", 1);
}

void sub_10001BF64()
{
  uint64_t v0;

  sub_10001BA30(v0, "Attempting widget update for watchlist changes", 0);
}

Swift::Void __swiftcall AppMonitor.sceneDidEnterBackground()()
{
  AppMonitor.trigger(event:)(0);
}

void sub_10001BF90()
{
  uint64_t v0;

  swift_getObjectType(v0);
  SceneStateMonitor.sceneWillResignActive()();
}

void sub_10001BFB8(uint64_t a1, void *a2)
{
  uint64_t v2;
  Swift::String v5;

  swift_getObjectType(v2);
  v5._countAndFlagsBits = a1;
  v5._object = a2;
  SceneStateMonitor.sceneWillResignActive(with:)(v5);
}

void sub_10001BFFC(uint64_t a1, void *a2)
{
  uint64_t v2;
  Swift::String v5;

  swift_getObjectType(v2);
  v5._countAndFlagsBits = a1;
  v5._object = a2;
  SceneStateMonitor.sceneDidEnterBackground(with:)(v5);
}

void sub_10001C040()
{
  uint64_t v0;

  swift_getObjectType(v0);
  SceneStateMonitor.sceneDidDisconnect()();
}

uint64_t sub_10001C170(uint64_t a1)
{
  uint64_t v2;

  sub_10001C1AC(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10001C1AC(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100047F58)
  {
    v2 = sub_10001C200();
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100047F58);
  }
}

unint64_t sub_10001C200()
{
  unint64_t result;
  void *v1;

  result = qword_100047F50;
  if (!qword_100047F50)
  {
    v1 = &protocol descriptor for KeyboardInputMonitorType;
    result = swift_getExistentialTypeMetadata(1, 0, 1, &v1);
    atomic_store(result, (unint64_t *)&qword_100047F50);
  }
  return result;
}

uint64_t sub_10001C254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = v3;
  sub_10000BBFC(0, &qword_100048D18, (uint64_t (*)(uint64_t))sub_100005D68, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v8);
  v10 = (char *)&v18 - v9;
  sub_100005D68(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_10000F608(a1, (uint64_t)&qword_100048D18, (uint64_t)sub_100005D68, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
    sub_100020648(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease(a3);
    return sub_10000F608((uint64_t)v10, (uint64_t)&qword_100048D18, (uint64_t)sub_100005D68, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
  }
  else
  {
    sub_100020770(a1, (uint64_t)v13);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v19 = *v4;
    *v4 = 0x8000000000000000;
    sub_1000209B0((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    v17 = *v4;
    *v4 = v19;
    swift_bridgeObjectRelease(a3);
    return swift_bridgeObjectRelease(v17);
  }
}

uint64_t sub_10001C3EC(uint64_t *a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;

  v3 = *a1;
  v4 = *(_QWORD *)(v2 + *a1);
  if (v4)
  {
    v5 = v4;
LABEL_5:
    swift_retain(v4);
    return v5;
  }
  v7 = v2;
  sub_10000C58C((uint64_t)v13);
  v8 = v14;
  v9 = v15;
  sub_10000C1E8(v13, v14);
  v10 = a2(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v10, v10, v8, v9);
  if (result)
  {
    v5 = result;
    sub_10000778C(v13);
    v12 = *(_QWORD *)(v7 + v3);
    *(_QWORD *)(v7 + v3) = v5;
    swift_retain(v5);
    swift_release(v12);
    v4 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001C4A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  uint64_t v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v1 = qword_100048BF8;
  v2 = *(_QWORD *)(v0 + qword_100048BF8);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + qword_100048BF8);
LABEL_5:
    swift_unknownObjectRetain(v2);
    return v3;
  }
  v4 = v0;
  sub_10000C58C((uint64_t)v10);
  v5 = v11;
  v6 = v12;
  sub_10000C1E8(v10, v11);
  v7 = sub_100020280();
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v7, v7, v5, v6);
  if (result)
  {
    v3 = result;
    sub_10000778C(v10);
    v9 = *(_QWORD *)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v3;
    swift_unknownObjectRetain(v3);
    swift_unknownObjectRelease(v9);
    v2 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

_QWORD *sub_10001C55C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[24];

  v3 = v1 + qword_100048C00;
  swift_beginAccess(v1 + qword_100048C00, v13, 0, 0);
  sub_10000C6B8(v3, (uint64_t)&v10, &qword_100048DC8, &qword_100048DD0, (uint64_t)&protocol descriptor for StateRestorationActivityProvider);
  if (v11)
    return (_QWORD *)sub_10000C6A0(&v10, a1);
  sub_1000060F0((uint64_t)&v10, &qword_100048DC8, &qword_100048DD0, (uint64_t)&protocol descriptor for StateRestorationActivityProvider);
  sub_10000C58C((uint64_t)&v10);
  v5 = v11;
  v6 = v12;
  sub_10000C1E8(&v10, v11);
  v7 = sub_10000C3D0(0, &qword_100048DD0, (uint64_t)&protocol descriptor for StateRestorationActivityProvider, 1);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(&v8, v7, v7, v5, v6);
  if (v9)
  {
    sub_10000C6A0(&v8, a1);
    sub_10000778C(&v10);
    sub_100010534(a1, (uint64_t)&v10);
    swift_beginAccess(v3, &v8, 33, 0);
    sub_100006820((uint64_t)&v10, v3, &qword_100048DC8, &qword_100048DD0, (uint64_t)&protocol descriptor for StateRestorationActivityProvider);
    return (_QWORD *)swift_endAccess(&v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

_QWORD *sub_10001C6CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[24];

  v3 = v1 + qword_100048C10;
  swift_beginAccess(v1 + qword_100048C10, v13, 0, 0);
  sub_10000C6B8(v3, (uint64_t)&v10, &qword_100048E88, &qword_100048E90, (uint64_t)&protocol descriptor for WelcomeFlowProviderType);
  if (v11)
    return (_QWORD *)sub_10000C6A0(&v10, a1);
  sub_1000060F0((uint64_t)&v10, &qword_100048E88, &qword_100048E90, (uint64_t)&protocol descriptor for WelcomeFlowProviderType);
  sub_10000C58C((uint64_t)&v10);
  v5 = v11;
  v6 = v12;
  sub_10000C1E8(&v10, v11);
  v7 = sub_10000C3D0(0, &qword_100048E90, (uint64_t)&protocol descriptor for WelcomeFlowProviderType, 1);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(&v8, v7, v7, v5, v6);
  if (v9)
  {
    sub_10000C6A0(&v8, a1);
    sub_10000778C(&v10);
    sub_100010534(a1, (uint64_t)&v10);
    swift_beginAccess(v3, &v8, 33, 0);
    sub_100006820((uint64_t)&v10, v3, &qword_100048E88, &qword_100048E90, (uint64_t)&protocol descriptor for WelcomeFlowProviderType);
    return (_QWORD *)swift_endAccess(&v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10001C83C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v4 = *(id *)(a1 + qword_100048C18);
  *(_QWORD *)(a1 + qword_100048C18) = a3;
  v3 = a3;

}

_QWORD *sub_10001C870()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[2];
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;

  v1 = v0 + qword_100048C50;
  v2 = *(void **)(v0 + qword_100048C50);
  if (v2)
  {
    v3 = *(id *)(v0 + qword_100048C50);
LABEL_5:
    v11 = v2;
    return v3;
  }
  sub_10000C58C((uint64_t)v13);
  v4 = v14;
  v5 = v15;
  sub_10000C1E8(v13, v14);
  v6 = sub_10000C3D0(0, &qword_100048DC0, (uint64_t)&protocol descriptor for MenuManagerType, 0);
  result = dispatch thunk of ResolverType.resolve<A>(_:name:)(v12, v6, 1852399981, 0xE400000000000000, v6, v4, v5);
  v8 = (void *)v12[0];
  if (v12[0])
  {
    v9 = v12[1];
    sub_10000778C(v13);
    v10 = *(void **)v1;
    *(_QWORD *)v1 = v8;
    *(_QWORD *)(v1 + 8) = v9;
    v3 = v8;

    v2 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001C94C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v1 = qword_100048C70;
  v2 = *(_QWORD *)(v0 + qword_100048C70);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + qword_100048C70);
LABEL_5:
    swift_retain(v2);
    return v3;
  }
  v4 = v0;
  sub_10000C58C((uint64_t)v10);
  v5 = v11;
  v6 = v12;
  sub_10000C1E8(v10, v11);
  v7 = type metadata accessor for Tracker(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v7, v7, v5, v6);
  if (result)
  {
    v3 = result;
    sub_10000778C(v10);
    v9 = *(_QWORD *)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v3;
    swift_retain(v3);
    swift_release(v9);
    v2 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001CA04(void *a1)
{
  char *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  CFTimeInterval v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  char v61;
  char v62;
  char v63;

  v2 = v1;
  sub_10000BBFC(0, (unint64_t *)&unk_100048EB8, (uint64_t (*)(uint64_t))&type metadata accessor for StocksActivity, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = __chkstk_darwin(v4);
  v8 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v10 = (char *)&v59 - v9;
  v11 = *(void **)&v1[qword_100048C28];
  v12 = v11;
  v13 = sub_100007DD0(v11);

  if (v13)
  {
    v14 = sub_10001C3EC(&qword_100048BE8, (uint64_t (*)(_QWORD))&type metadata accessor for StocksV2UserActivityDeserializer);
    StocksV2UserActivityDeserializer.deserialize(userActivity:)(v13);
    swift_release(v14);
    v15 = CACurrentMediaTime();
    v63 = 1;
    sub_100021598(0);
    v17 = v16;
    swift_allocObject(v16, *(unsigned int *)(v16 + 48), *(unsigned __int16 *)(v16 + 52));
    v18 = StateMachineTransition.init(state:)(&v63);
    v19 = swift_allocObject(&unk_100042F28, 32, 7);
    v59 = v5;
    v20 = (uint64_t)v10;
    v21 = v19;
    *(_QWORD *)(v19 + 16) = v13;
    *(_QWORD *)(v19 + 24) = a1;
    v60 = v13;
    v22 = a1;
    v23 = StateMachineTransition.didEnter(block:)(sub_100021654, v21);
    swift_release(v18);
    v24 = v21;
    v25 = v20;
    swift_release(v24);
    StateMachine.add(transition:)(v23);
    swift_release(v23);
    v62 = 1;
    swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
    v26 = StateMachineTransition.init(state:)(&v62);
    v27 = swift_allocObject(&unk_100042F50, 32, 7);
    *(CFTimeInterval *)(v27 + 16) = v15;
    *(_QWORD *)(v27 + 24) = v22;
    v28 = v22;
    v29 = StateMachineTransition.willExit(block:)(sub_100021680, v27);
    swift_release(v26);
    swift_release(v27);
    StateMachine.add(transition:)(v29);
    swift_release(v29);
    v30 = sub_10001C3EC(&qword_100048BF0, (uint64_t (*)(_QWORD))sub_100021288);
    sub_10002169C(v20, (uint64_t)v8, (uint64_t)&unk_100048EB8, (uint64_t)&type metadata accessor for StocksActivity, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
    v31 = *(unsigned __int8 *)(v59 + 80);
    v32 = (v31 + 16) & ~v31;
    v33 = (v6 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
    v34 = swift_allocObject(&unk_100042F78, v33 + 8, v31 | 7);
    sub_1000217BC((uint64_t)v8, v34 + v32);
    *(_QWORD *)(v34 + v33) = v2;
    v35 = v2;
    dispatch thunk of StackNavigator.onNavigationStart(closure:)(sub_100021818, v34);
    swift_release(v30);
    swift_release(v34);
    v61 = 0;
    v36 = StateMachine.fire(event:)(&v61);
    __chkstk_darwin(v36);
    *(&v59 - 2) = (uint64_t)v35;
    sub_10000FD20(0, &qword_1000483F0, (uint64_t)&type metadata for () + 8, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Promise);
    swift_allocObject(v37, *(unsigned int *)(v37 + 48), *(unsigned __int16 *)(v37 + 52));
    v38 = Promise.init(resolver:)(sub_100021880, &v59 - 4);
    v39 = swift_allocObject(&unk_100042FA0, 32, 7);
    v40 = v60;
    *(_QWORD *)(v39 + 16) = v35;
    *(_QWORD *)(v39 + 24) = v40;
    v41 = v40;
    v42 = v35;
    v43 = (void *)zalgo.getter(v42);
    v44 = Promise.then<A>(on:closure:)(v43, sub_100021888, v39, &type metadata for Bool);
    swift_release(v38);
    swift_release(v39);

    v45 = firstly<A>(closure:)(sub_1000218A0, v44, &type metadata for Bool);
    v46 = swift_allocObject(&unk_100042FC8, 24, 7);
    *(_QWORD *)(v46 + 16) = v42;
    v47 = v42;
    v48 = (void *)zalgo.getter(v47);
    v49 = Promise.then<A>(on:closure:)(v48, sub_1000218B8, v46, (char *)&type metadata for () + 8);
    swift_release(v45);
    swift_release(v46);

    sub_1000059D0(0, &qword_100048910, OS_dispatch_queue_ptr);
    v50 = (void *)static OS_dispatch_queue.main.getter();
    v51 = swift_allocObject(&unk_100042FF0, 24, 7);
    *(_QWORD *)(v51 + 16) = v47;
    v52 = v47;
    v53 = Promise.error(on:closure:)(v50, sub_1000218D0, v51);

    swift_release(v49);
    swift_release(v51);
    swift_release(v44);
    sub_10000F608(v25, (uint64_t)&unk_100048EB8, (uint64_t)&type metadata accessor for StocksActivity, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
    return v53;
  }
  else
  {
    v55 = sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
    v56 = (void *)static OS_os_log.default.getter(v55);
    v57 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Skipping state restoration because there's no eligible activity", 63, 2, &_mh_execute_header, v56, v57, &_swiftEmptyArrayStorage);

    sub_10000FD20(0, &qword_1000483F0, (uint64_t)&type metadata for () + 8, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Promise);
    swift_allocObject(v58, *(unsigned int *)(v58 + 48), *(unsigned __int16 *)(v58 + 52));
    return Promise.init(value:)();
  }
}

void sub_10001CFA8(uint64_t a1, void *a2, _BYTE *a3, unsigned __int8 *a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unsigned __int8 *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  char *v40;
  uint64_t v41;
  char v42;
  void (**v43)(uint64_t, char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _BYTE *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  _BYTE *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, char *, uint64_t);
  _BYTE *v63;
  uint64_t v64;
  unsigned __int8 *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _BYTE v72[24];
  id v73;

  v65 = a4;
  v7 = type metadata accessor for SidebarConfiguration(0);
  v69 = *(_QWORD *)(v7 - 8);
  v70 = v7;
  __chkstk_darwin(v7);
  v68 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000BBFC(0, &qword_100048D18, (uint64_t (*)(uint64_t))sub_100005D68, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v9);
  v11 = (char *)&v59 - v10;
  v71 = type metadata accessor for URL(0);
  v12 = *(unsigned __int8 **)(v71 - 8);
  v13 = __chkstk_darwin(v71);
  v66 = v14;
  v67 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v59 - v15;
  v73 = a2;
  v17 = objc_msgSend(a2, "URLContexts");
  v18 = sub_1000059D0(0, &qword_100048DF8, UIOpenURLContext_ptr);
  v19 = sub_10000F224(&qword_100048E00, &qword_100048DF8, UIOpenURLContext_ptr);
  v20 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v17, v18, v19);

  v21 = (void *)sub_10000F264(v20, &qword_100048DF8, UIOpenURLContext_ptr);
  swift_bridgeObjectRelease(v20);
  if (v21)
  {
    v63 = a3;
    v64 = v4;
    v22 = objc_msgSend(v21, "URL");
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v23 = objc_msgSend(v65, "session");
    v24 = objc_msgSend(v23, "persistentIdentifier");

    v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
    v60 = v26;
    v61 = v25;

    sub_100005D68(0);
    v28 = v27;
    v29 = (uint64_t *)&v11[*(int *)(v27 + 48)];
    v65 = v12;
    v62 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v12 + 2);
    v62(v11, v16, v71);
    v30 = objc_msgSend(v21, "options");
    v31 = objc_msgSend(v30, "sourceApplication");

    if (v31 || (v31 = objc_msgSend(v73, "sourceApplication")) != 0)
    {
      v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
      v34 = v33;

    }
    else
    {
      v32 = 0;
      v34 = 0;
    }
    *v29 = v32;
    v29[1] = v34;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v11, 0, 1, v28);
    a3 = v63;
    swift_beginAccess(&v63[qword_100048C78], v72, 33, 0);
    sub_10001C254((uint64_t)v11, v61, v60);
    swift_endAccess(v72);
    v35 = v67;
    v36 = v16;
    v37 = v16;
    v38 = v71;
    v39 = v62;
    v62(v67, v37, v71);
    v40 = v68;
    v41 = SidebarConfiguration.init(_:)(v35);
    v42 = SidebarConfiguration.shouldCollapseSidebar.getter(v41);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v40, v70);
    a3[qword_100048C48] = v42 & 1;
    v39(v35, v36, v38);
    v43 = (void (**)(uint64_t, char *, uint64_t))v65;
    v44 = v65[80];
    v45 = (v44 + 24) & ~v44;
    v46 = (v66 + v45 + 7) & 0xFFFFFFFFFFFFFFF8;
    v47 = swift_allocObject(&unk_100042F00, v46 + 8, v44 | 7);
    *(_QWORD *)(v47 + 16) = a3;
    v43[4](v47 + v45, v35, v38);
    *(_QWORD *)(v47 + v46) = v21;
    v48 = a3;
    v49 = v21;
    v50 = (void *)sub_10000F44C();
    v51 = (void *)zalgoIfMain.getter(v50);
    Bootstrapper.afterBootstrap(on:run:)(v51, sub_100021554, v47);

    swift_release(v47);
    ((void (*)(char *, uint64_t))v43[1])(v36, v38);
  }
  v52 = objc_msgSend(v73, "shortcutItem");
  if (v52)
  {
    v53 = v52;
    v54 = swift_allocObject(&unk_100042ED8, 32, 7);
    *(_QWORD *)(v54 + 16) = a3;
    *(_QWORD *)(v54 + 24) = v53;
    v55 = a3;
    v56 = v53;
    v57 = (void *)sub_10000F44C();
    v58 = (void *)zalgoIfMain.getter(v57);
    Bootstrapper.afterBootstrap(on:run:)(v58, sub_1000214BC, v54);

    swift_release(v54);
  }
}

uint64_t sub_10001D47C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  id v14;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;

  v5 = type metadata accessor for URLHandlerRoute(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C58C((uint64_t)v16);
  v9 = v17;
  v10 = v18;
  sub_10000C1E8(v16, v17);
  sub_10000BBFC(0, &qword_100048DD8, (uint64_t (*)(uint64_t))&type metadata accessor for AppURLContext, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for URLHandlerManager);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v11, v11, v9, v10);
  if (result)
  {
    v13 = result;
    sub_10000778C(v16);
    v14 = objc_msgSend(a3, "options");
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for URLHandlerRoute.sceneConnect(_:), v5);
    URLHandlerManager<A>.handle(url:options:route:)(a2, v14, v8);
    swift_release(v13);

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001D5BC(uint64_t a1, UIApplicationShortcutItem a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  sub_10000C58C((uint64_t)v8);
  v3 = v9;
  v4 = v10;
  sub_10000C1E8(v8, v9);
  v5 = type metadata accessor for ShortcutItemHandlerManager(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v5, v5, v3, v4);
  if (result)
  {
    v7 = result;
    sub_10000778C(v8);
    ShortcutItemHandlerManager.handle(shortcutItem:)(a2);
    return swift_release(v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10001D644(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  v5 = a1;
  sub_10000C41C((uint64_t)v8);
  v6 = v9;
  v7 = v10;
  sub_10000C1E8(v8, v9);
  dispatch thunk of SceneStateManagerType.sceneDidDisconnect()(v6, v7);
  sub_10000778C(v8);

}

uint64_t sub_10001D6C4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  sub_10000C58C((uint64_t)v12);
  v2 = v13;
  v3 = v14;
  sub_10000C1E8(v12, v13);
  v4 = type metadata accessor for SessionManager(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v4, v4, v2, v3);
  if (result)
  {
    v6 = result;
    v7 = sub_10000778C(v12);
    v8 = SessionManager.tracker.getter(v7);
    Tracker.ifSession(block:)(sub_10001D7EC, 0);
    swift_release(v8);
    if (objc_msgSend(a1, "activationState") == (id)-1)
    {
      v9 = objc_msgSend(a1, "session");
      objc_msgSend(v9, "setStateRestorationActivity:", 0);

    }
    sub_10000C41C((uint64_t)v12);
    v10 = v13;
    v11 = v14;
    sub_10000C1E8(v12, v13);
    dispatch thunk of SceneStateManagerType.willResignActive()(v10, v11);
    swift_release(v6);
    return sub_10000778C(v12);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10001D7EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[2];

  v0 = type metadata accessor for UUID(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = UUID.init()(v2);
  v6 = UUID.uuidString.getter(v5);
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  v9._countAndFlagsBits = v6;
  v9._object = v8;
  AccessTracker.enterGroup(groupName:)(v9);
  swift_bridgeObjectRelease(v8);
  v10 = type metadata accessor for AppSessionResignEvent(0);
  v11 = sub_100008EA0(&qword_100048E28, (uint64_t (*)(uint64_t))&type metadata accessor for AppSessionResignEvent, (uint64_t)&protocol conformance descriptor for AppSessionResignEvent);
  memset(v12, 0, sizeof(v12));
  AccessTracker.submit<A>(_:onlyIfTimed:userInfo:completion:)(v10, 0, v12, 0, 0, v10, v11);
  sub_10000F608((uint64_t)v12, (uint64_t)&qword_100047EC0, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000FD20);
  AccessTracker.leaveGroup()();
}

void sub_10001D910(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_10001D6C4(v4);

}

uint64_t sub_10001D964(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = swift_allocObject(&unk_100042DC0, 32, 7);
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  v9 = swift_retain(a2);
  Date.init()(v9);
  SessionManager.end(endDate:completion:)(v7, sub_100021988, v8);
  swift_release(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_10001DA34(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_100021160();

}

uint64_t sub_10001DA80()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + qword_100048BD0));
  sub_1000060F0(v0 + qword_100048BD8, (unint64_t *)&unk_100047ED0, (unint64_t *)&unk_100048DB0, (uint64_t)&protocol descriptor for ResolverType);

  swift_release(*(_QWORD *)(v0 + qword_100048BE8));
  swift_release(*(_QWORD *)(v0 + qword_100048BF0));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + qword_100048BF8));
  sub_1000060F0(v0 + qword_100048C00, &qword_100048DC8, &qword_100048DD0, (uint64_t)&protocol descriptor for StateRestorationActivityProvider);
  swift_release(*(_QWORD *)(v0 + qword_100048C08));
  sub_1000060F0(v0 + qword_100048C10, &qword_100048E88, &qword_100048E90, (uint64_t)&protocol descriptor for WelcomeFlowProviderType);

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + qword_100048C30 + 8));
  sub_10000F608(v0 + qword_100048C38, (uint64_t)&qword_100048D18, (uint64_t)sub_100005D68, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
  swift_release(*(_QWORD *)(v0 + qword_100048C40));

  sub_1000060F0(v0 + qword_100048C58, &qword_100048E18, &qword_100048E20, (uint64_t)&protocol descriptor for SceneStateManagerType);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + qword_100048C60));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + qword_100048C68));
  swift_release(*(_QWORD *)(v0 + qword_100048C70));
  return swift_bridgeObjectRelease(*(_QWORD *)(v0 + qword_100048C78));
}

uint64_t sub_10001DC58(uint64_t a1)
{
  swift_release(*(_QWORD *)(a1 + qword_100048BD0));
  sub_1000060F0(a1 + qword_100048BD8, (unint64_t *)&unk_100047ED0, (unint64_t *)&unk_100048DB0, (uint64_t)&protocol descriptor for ResolverType);

  swift_release(*(_QWORD *)(a1 + qword_100048BE8));
  swift_release(*(_QWORD *)(a1 + qword_100048BF0));
  swift_unknownObjectRelease(*(_QWORD *)(a1 + qword_100048BF8));
  sub_1000060F0(a1 + qword_100048C00, &qword_100048DC8, &qword_100048DD0, (uint64_t)&protocol descriptor for StateRestorationActivityProvider);
  swift_release(*(_QWORD *)(a1 + qword_100048C08));
  sub_1000060F0(a1 + qword_100048C10, &qword_100048E88, &qword_100048E90, (uint64_t)&protocol descriptor for WelcomeFlowProviderType);

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + qword_100048C30 + 8));
  sub_10000F608(a1 + qword_100048C38, (uint64_t)&qword_100048D18, (uint64_t)sub_100005D68, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
  swift_release(*(_QWORD *)(a1 + qword_100048C40));

  sub_1000060F0(a1 + qword_100048C58, &qword_100048E18, &qword_100048E20, (uint64_t)&protocol descriptor for SceneStateManagerType);
  swift_unknownObjectRelease(*(_QWORD *)(a1 + qword_100048C60));
  swift_unknownObjectRelease(*(_QWORD *)(a1 + qword_100048C68));
  swift_release(*(_QWORD *)(a1 + qword_100048C70));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + qword_100048C78));
}

uint64_t sub_10001DE3C()
{
  return type metadata accessor for SceneDelegate(0);
}

uint64_t sub_10001DE44(uint64_t a1, NSUserActivity a2)
{
  uint64_t v3;
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v14, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(v3);
  if (result)
  {
    v5 = (void *)result;
    sub_10000C58C((uint64_t)v11);

    v6 = v12;
    v7 = v13;
    sub_10000C1E8(v11, v12);
    v8 = type metadata accessor for UserActivityHandlerManager(0);
    v9 = dispatch thunk of ResolverType.resolve<A>(_:)(v8, v8, v6, v7);
    if (v9)
    {
      v10 = v9;
      UserActivityHandlerManager.handle(userActivity:)(a2);
      swift_release(v10);
    }
    return sub_10000778C(v11);
  }
  return result;
}

uint64_t sub_10001DEF0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t result;

  sub_10000C36C(0, &qword_100047EF8, &qword_100047F00, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v6 = swift_allocObject(v5, 72, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100037BB0;
  v7 = objc_msgSend(a2, "description");
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v10 = v9;

  *(_QWORD *)(v6 + 56) = &type metadata for String;
  *(_QWORD *)(v6 + 64) = sub_10000FD64();
  *(_QWORD *)(v6 + 32) = v8;
  *(_QWORD *)(v6 + 40) = v10;
  v11 = sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
  v12 = (void *)static OS_os_log.default.getter(v11);
  v13 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("State restoration will extend snapshot for activity: %{public}@", 63, 2, &_mh_execute_header, v12, v13, v6);
  swift_bridgeObjectRelease(v6);

  sub_1000059D0(0, (unint64_t *)&unk_100048EF0, UIDevice_ptr);
  result = static UIDevice.isSlow.getter();
  if ((result & 1) == 0)
    return (uint64_t)objc_msgSend(a3, "_extendStateRestoration");
  return result;
}

uint64_t sub_10001E048(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  Swift::Double v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  double v9;

  sub_10000C36C(0, &qword_100047EF8, &qword_100047F00, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v4 = swift_allocObject(v3, 72, 7);
  *(_OWORD *)(v4 + 16) = xmmword_100037BB0;
  v5 = Double.millisecondsUntilCurrentMediaTime()();
  *(_QWORD *)(v4 + 56) = &type metadata for Double;
  *(_QWORD *)(v4 + 64) = &protocol witness table for Double;
  *(Swift::Double *)(v4 + 32) = v5;
  v6 = sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
  v7 = (void *)static OS_os_log.default.getter(v6);
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("State restoration finished extending snapshot with duration: %0.1fms", v9);
  swift_bridgeObjectRelease(v4);

  sub_1000059D0(0, (unint64_t *)&unk_100048EF0, UIDevice_ptr);
  result = static UIDevice.isSlow.getter();
  if ((result & 1) == 0)
    return (uint64_t)objc_msgSend(a2, "_completeStateRestoration");
  return result;
}

uint64_t sub_10001E174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t result;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  char v29;
  _QWORD v30[3];
  char v31;

  v30[1] = a3;
  v5 = type metadata accessor for StocksActivity(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000BBFC(0, (unint64_t *)&unk_100048EB8, (uint64_t (*)(uint64_t))&type metadata accessor for StocksActivity, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)v30 - v11;
  v13 = StocksActivity.identifier.getter(v10);
  v15 = v14;
  sub_10002169C(a2, (uint64_t)v12, (uint64_t)&unk_100048EB8, (uint64_t)&type metadata accessor for StocksActivity, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
  v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v12, 1, v5);
  if ((_DWORD)v16 == 1)
  {
    sub_10000F608((uint64_t)v12, (uint64_t)&unk_100048EB8, (uint64_t)&type metadata accessor for StocksActivity, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
    swift_bridgeObjectRelease(v15);
    v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
    goto LABEL_3;
  }
  v23 = a1;
  v24 = StocksActivity.identifier.getter(v16);
  v26 = v25;
  v27 = *(void (**)(char *, uint64_t))(v6 + 8);
  v27(v12, v5);
  if (v13 == v24 && v15 == v26)
  {
    swift_bridgeObjectRelease_n(v15, 2);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v23, v5);
    return ((uint64_t (*)(char *, uint64_t))v27)(v8, v5);
  }
  v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v15, v24, v26, 0);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v26);
  v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v23, v5);
  if ((v29 & 1) != 0)
    return ((uint64_t (*)(char *, uint64_t))v27)(v8, v5);
LABEL_3:
  v18 = StocksActivity.affectsNavigationStack.getter(v17);
  result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if ((v18 & 1) != 0)
  {
    v20 = sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
    v21 = (void *)static OS_os_log.default.getter(v20);
    v22 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("State restoration extension interrupted due to conflicting navigation", 69, 2, &_mh_execute_header, v21, v22, &_swiftEmptyArrayStorage);

    v31 = 2;
    return StateMachine.fire(event:)(&v31);
  }
  return result;
}

void sub_10001E418(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = swift_allocObject(&unk_100043090, 32, 7);
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
  v5 = swift_retain(a2);
  v6 = (void *)static OS_os_log.default.getter(v5);
  v7 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("State restoration will wait for bootstrapping", 45, 2, &_mh_execute_header, v6, v7, &_swiftEmptyArrayStorage);

  v8 = (void *)sub_10000F44C();
  v9 = swift_allocObject(&unk_1000430B8, 32, 7);
  *(_QWORD *)(v9 + 16) = sub_100021920;
  *(_QWORD *)(v9 + 24) = v4;
  v10 = (id)zalgoIfMain.getter(v9);
  Bootstrapper.afterBootstrap(on:run:)(v10, sub_100021920, v9);

  swift_release(v9);
}

uint64_t sub_10001E524(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t result;
  uint64_t v16;
  _QWORD aBlock[5];
  uint64_t v18;
  uint64_t v19;

  v5 = sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
  v6 = (void *)static OS_os_log.default.getter(v5);
  v7 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("State restoration will route to activity", 40, 2, &_mh_execute_header, v6, v7, &_swiftEmptyArrayStorage);

  v19 = 0;
  v8 = (void *)objc_opt_self(UIView);
  v9 = (_QWORD *)swift_allocObject(&unk_100043018, 40, 7);
  v9[2] = &v19;
  v9[3] = a2;
  v9[4] = a3;
  v10 = swift_allocObject(&unk_100043040, 32, 7);
  *(_QWORD *)(v10 + 16) = sub_100021904;
  *(_QWORD *)(v10 + 24) = v9;
  aBlock[4] = sub_100021920;
  v18 = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001E74C;
  aBlock[3] = &unk_100043058;
  v11 = _Block_copy(aBlock);
  v12 = v18;
  v13 = a2;
  v14 = a3;
  swift_retain(v10);
  swift_release(v12);
  objc_msgSend(v8, "performWithoutAnimation:", v11);
  _Block_release(v11);
  LOBYTE(a3) = swift_isEscapingClosureAtFileLocation(v10, "", 71, 420, 44, 1);
  result = swift_release(v10);
  if ((a3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v16 = v19;
    if (v19)
    {
      swift_release(v9);
      return v16;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10001E6E8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = sub_10001C3EC(&qword_100048C08, (uint64_t (*)(_QWORD))&type metadata accessor for UserActivityHandlerManager);
  v6 = UserActivityHandlerManager.handleAsync(userActivity:)(a3);
  swift_release(v5);
  v7 = *a1;
  *a1 = v6;
  return swift_release(v7);
}

uint64_t sub_10001E74C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_10001E76C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(char *, uint64_t);
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;

  v0 = type metadata accessor for DispatchTime(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v2);
  v7 = (char *)&v13 - v6;
  static DispatchTime.now()(v5);
  + infix(_:_:)(v4, 10.0);
  v8 = *(uint64_t (**)(char *, uint64_t))(v1 + 8);
  v9 = v8(v4, v0);
  v10 = (void *)zalgo.getter(v9);
  v11 = Promise.timeout(after:on:message:)(v7, v10, 0, 0);

  v8(v7, v0);
  return v11;
}

uint64_t sub_10001E854()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v6;

  v1 = sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
  v2 = (void *)static OS_os_log.default.getter(v1);
  v3 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("State restoration succeeded", 27, 2, &_mh_execute_header, v2, v3, &_swiftEmptyArrayStorage);

  v6 = 1;
  StateMachine.fire(event:)(&v6);
  if (v0)
    swift_errorRelease(v0);
  sub_10000FD20(0, &qword_1000483F0, (uint64_t)&type metadata for () + 8, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Promise);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  return Promise.init(value:)();
}

uint64_t sub_10001E944(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;

  sub_10000BBFC(0, (unint64_t *)&unk_100048EE0, (uint64_t (*)(uint64_t))&type metadata accessor for PromiseError, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v2);
  v4 = (char *)&v23 - v3;
  v24 = a1;
  swift_errorRetain(a1);
  v5 = sub_10000C3D0(0, &qword_100047F08, (uint64_t)&protocol descriptor for Error, 1);
  v6 = type metadata accessor for PromiseError(0);
  v7 = swift_dynamicCast(v4, &v24, v5, v6, 6);
  v8 = *(_QWORD *)(v6 - 8);
  v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  if (!v7)
  {
    v9(v4, 1, 1, v6);
    v14 = sub_10000F608((uint64_t)v4, (uint64_t)&unk_100048EE0, (uint64_t)&type metadata accessor for PromiseError, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
LABEL_6:
    v15 = static os_log_type_t.error.getter(v14);
    sub_10000C36C(0, &qword_100047EF8, &qword_100047F00, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    v17 = swift_allocObject(v16, 72, 7);
    *(_OWORD *)(v17 + 16) = xmmword_100037BB0;
    v24 = a1;
    swift_errorRetain(a1);
    v18 = String.init<A>(describing:)(&v24, v5);
    v20 = v19;
    *(_QWORD *)(v17 + 56) = &type metadata for String;
    *(_QWORD *)(v17 + 64) = sub_10000FD64();
    *(_QWORD *)(v17 + 32) = v18;
    *(_QWORD *)(v17 + 40) = v20;
    v21 = sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
    v13 = (void *)static OS_os_log.default.getter(v21);
    os_log(_:dso:log:type:_:)("State restoration extension aborted due to error=%{public}@", 59, 2, &_mh_execute_header, v13, v15, v17);
    swift_bridgeObjectRelease(v17);
    goto LABEL_7;
  }
  v9(v4, 0, 1, v6);
  if ((*(unsigned int (**)(char *, uint64_t))(v8 + 88))(v4, v6) != enum case for PromiseError.timedOut(_:))
  {
    v14 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v4, v6);
    goto LABEL_6;
  }
  (*(void (**)(char *, uint64_t))(v8 + 96))(v4, v6);
  v10 = swift_bridgeObjectRelease(*((_QWORD *)v4 + 1));
  v11 = static os_log_type_t.error.getter(v10);
  v12 = sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
  v13 = (void *)static OS_os_log.default.getter(v12);
  os_log(_:dso:log:type:_:)("State restoration extension timed out", 37, 2, &_mh_execute_header, v13, v11, &_swiftEmptyArrayStorage);
LABEL_7:

  LOBYTE(v24) = 2;
  return StateMachine.fire(event:)(&v24);
}

id sub_10001EC1C(uint64_t a1)
{
  return *(id *)(a1 + qword_100048C18);
}

void sub_10001EC2C(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t *v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  int64_t v45;
  unint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  _QWORD v61[2];
  char *v62;
  uint64_t v63;
  int64_t v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  char *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  _QWORD v76[3];
  _QWORD v77[6];

  v71 = a1;
  sub_100005D68(0);
  v69 = v3;
  v4 = __chkstk_darwin(v3);
  v68 = (uint64_t)v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v74 = (char *)v61 - v6;
  v7 = type metadata accessor for URL(0);
  v73 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v9 = (char *)v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 0xC000000000000001) != 0)
  {
    if (a2 < 0)
      v10 = a2;
    else
      v10 = a2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a2);
    v11 = __CocoaSet.makeIterator()(v10);
    v12 = sub_1000059D0(0, &qword_100048DF8, UIOpenURLContext_ptr);
    v13 = sub_10000F224(&qword_100048E00, &qword_100048DF8, UIOpenURLContext_ptr);
    v14 = Set.Iterator.init(_cocoa:)(v77, v11, v12, v13);
    a2 = v77[0];
    v65 = v77[1];
    v15 = v77[2];
    v16 = v77[3];
    v17 = v77[4];
  }
  else
  {
    v18 = -1 << *(_BYTE *)(a2 + 32);
    v19 = *(_QWORD *)(a2 + 56);
    v65 = a2 + 56;
    v15 = ~v18;
    v20 = -v18;
    if (v20 < 64)
      v21 = ~(-1 << v20);
    else
      v21 = -1;
    v17 = v21 & v19;
    swift_bridgeObjectRetain(a2);
    v16 = 0;
  }
  v61[1] = v15;
  v63 = a2 & 0x7FFFFFFFFFFFFFFFLL;
  v64 = (unint64_t)(v15 + 64) >> 6;
  v66 = xmmword_100037BB0;
  v62 = (char *)&type metadata for Swift.AnyObject + 8;
  v70 = a2;
  v67 = v7;
  while (a2 < 0)
  {
    v41 = __CocoaSet.Iterator.next()(v14);
    if (!v41)
      goto LABEL_36;
    v42 = v41;
    v75 = v41;
    v43 = sub_1000059D0(0, &qword_100048DF8, UIOpenURLContext_ptr);
    swift_unknownObjectRetain(v42);
    swift_dynamicCast(v76, &v75, v62, v43, 7);
    v44 = (id)v76[0];
    swift_unknownObjectRelease(v42);
    v40 = v16;
    v38 = v17;
    if (!v44)
      goto LABEL_36;
LABEL_34:
    v48 = objc_msgSend(v44, "URL");
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v49 = objc_msgSend(v71, "session");
    v50 = objc_msgSend(v49, "persistentIdentifier");

    v51 = static String._unconditionallyBridgeFromObjectiveC(_:)(v50);
    v53 = v52;

    sub_10000C36C(0, &qword_100047EF8, &qword_100047F00, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    v55 = swift_allocObject(v54, 72, 7);
    *(_OWORD *)(v55 + 16) = v66;
    *(_QWORD *)(v55 + 56) = &type metadata for String;
    *(_QWORD *)(v55 + 64) = sub_10000FD64();
    *(_QWORD *)(v55 + 32) = v51;
    *(_QWORD *)(v55 + 40) = v53;
    sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
    swift_bridgeObjectRetain(v53);
    v57 = (void *)static OS_os_log.default.getter(v56);
    v58 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Assigning scene activation URL context due to openURL, sceneSession=%{public}@", 78, 2, &_mh_execute_header, v57, v58, v55);
    swift_bridgeObjectRelease(v55);

    (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v74, v9, v7);
    v59 = objc_msgSend(v44, "options");
    v60 = objc_msgSend(v59, "sourceApplication");

    if (v60)
    {
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v60);
      v24 = v23;

    }
    else
    {
      v22 = 0;
      v24 = 0;
    }
    v25 = v74;
    v26 = (uint64_t *)&v74[*(int *)(v69 + 48)];
    *v26 = v22;
    v26[1] = v24;
    v27 = v72;
    v28 = (uint64_t *)&v72[qword_100048C78];
    swift_beginAccess(&v72[qword_100048C78], v76, 33, 0);
    v29 = (uint64_t)v25;
    v30 = v68;
    sub_100020770(v29, v68);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v28);
    v75 = *v28;
    *v28 = 0x8000000000000000;
    sub_1000209B0(v30, v51, v53, isUniquelyReferenced_nonNull_native);
    v32 = *v28;
    *v28 = v75;
    swift_bridgeObjectRelease(v53);
    swift_bridgeObjectRelease(v32);
    swift_endAccess(v76);
    v33 = swift_allocObject(&unk_100042D98, 32, 7);
    *(_QWORD *)(v33 + 16) = v27;
    *(_QWORD *)(v33 + 24) = v44;
    v34 = v27;
    v35 = v44;
    v36 = (void *)sub_10000F44C();
    v37 = (void *)zalgoIfMain.getter(v36);
    Bootstrapper.afterBootstrap(on:run:)(v37, sub_100020EF8, v33);

    swift_release(v33);
    v7 = v67;
    v14 = (_QWORD *)(*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v9, v67);
    v16 = v40;
    v17 = v38;
    a2 = v70;
  }
  if (v17)
  {
    v38 = (v17 - 1) & v17;
    v39 = __clz(__rbit64(v17)) | (v16 << 6);
    v40 = v16;
LABEL_33:
    v44 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v39);
    if (!v44)
      goto LABEL_36;
    goto LABEL_34;
  }
  v45 = v16 + 1;
  if (!__OFADD__(v16, 1))
  {
    if (v45 >= v64)
      goto LABEL_36;
    v46 = *(_QWORD *)(v65 + 8 * v45);
    v40 = v16 + 1;
    if (!v46)
    {
      v40 = v16 + 2;
      if (v16 + 2 >= v64)
        goto LABEL_36;
      v46 = *(_QWORD *)(v65 + 8 * v40);
      if (!v46)
      {
        v40 = v16 + 3;
        if (v16 + 3 >= v64)
          goto LABEL_36;
        v46 = *(_QWORD *)(v65 + 8 * v40);
        if (!v46)
        {
          v40 = v16 + 4;
          if (v16 + 4 >= v64)
            goto LABEL_36;
          v46 = *(_QWORD *)(v65 + 8 * v40);
          if (!v46)
          {
            v47 = v16 + 5;
            while (v64 != v47)
            {
              v46 = *(_QWORD *)(v65 + 8 * v47++);
              if (v46)
              {
                v40 = v47 - 1;
                goto LABEL_32;
              }
            }
LABEL_36:
            sub_100012E94(a2);
            return;
          }
        }
      }
    }
LABEL_32:
    v38 = (v46 - 1) & v46;
    v39 = __clz(__rbit64(v46)) + (v40 << 6);
    goto LABEL_33;
  }
  __break(1u);
}

uint64_t sub_10001F25C(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;

  v3 = type metadata accessor for URLHandlerRoute(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v19[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C58C((uint64_t)v19);
  v11 = v20;
  v12 = v21;
  sub_10000C1E8(v19, v20);
  sub_10000BBFC(0, &qword_100048DD8, (uint64_t (*)(uint64_t))&type metadata accessor for AppURLContext, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for URLHandlerManager);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v13, v13, v11, v12);
  if (result)
  {
    v15 = result;
    sub_10000778C(v19);
    v16 = objc_msgSend(a2, "URL");
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v17 = objc_msgSend(a2, "options");
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for URLHandlerRoute.openURL(_:), v3);
    URLHandlerManager<A>.handle(url:options:route:)(v10, v17, v6);
    swift_release(v15);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001F410(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v7 = sub_1000059D0(0, &qword_100048DF8, UIOpenURLContext_ptr);
  v8 = sub_10000F224(&qword_100048E00, &qword_100048DF8, UIOpenURLContext_ptr);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = a1;
  sub_10001EC2C(v10, v9);

  return swift_bridgeObjectRelease(v9);
}

uint64_t sub_10001F4B8(uint64_t a1, void (*a2)(Swift::Bool), uint64_t a3, UIApplicationShortcutItem a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  Swift::Bool v11;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  sub_10000C58C((uint64_t)v12);
  v6 = v13;
  v7 = v14;
  sub_10000C1E8(v12, v13);
  v8 = type metadata accessor for ShortcutItemHandlerManager(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v8, v8, v6, v7);
  if (result)
  {
    v10 = result;
    sub_10000778C(v12);
    v11 = ShortcutItemHandlerManager.handle(shortcutItem:)(a4);
    a2(v11);
    return swift_release(v10);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10001F560(void *a1, int a2, void *a3, void *a4, void *aBlock)
{
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v8 = _Block_copy(aBlock);
  v9 = swift_allocObject(&unk_100042D48, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = (_QWORD *)swift_allocObject(&unk_100042D70, 48, 7);
  v10[2] = a1;
  v10[3] = sub_100020EA4;
  v10[4] = v9;
  v10[5] = a4;
  v11 = a4;
  v12 = a1;
  v13 = v11;
  v14 = a3;
  swift_retain(v9);
  v15 = (void *)sub_10000F44C();
  v16 = (id)zalgoIfMain.getter(v15);
  Bootstrapper.afterBootstrap(on:run:)(v16, sub_100020EEC, v10);

  swift_release(v9);
  swift_release(v10);

}

void sub_10001F660(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  sub_10000C36C(0, &qword_100047EF8, &qword_100047F00, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v10 = swift_allocObject(v9, 72, 7);
  *(_OWORD *)(v10 + 16) = xmmword_100037BB0;
  *(_QWORD *)(v10 + 56) = &type metadata for String;
  *(_QWORD *)(v10 + 64) = sub_10000FD64();
  *(_QWORD *)(v10 + 32) = v6;
  *(_QWORD *)(v10 + 40) = v8;
  sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
  v11 = a3;
  v12 = a1;
  swift_bridgeObjectRetain(v8);
  v15 = (id)static OS_os_log.default.getter(v13);
  v14 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("Will continue user activity of type %@", 38, 2, &_mh_execute_header, v15, v14, v10);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v10);

}

uint64_t sub_10001F78C(void *a1, uint64_t a2, void *a3)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  id v27;
  void *v28;
  void (*v29)(char *, char *, uint64_t);
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  _QWORD v52[3];
  uint64_t v53;
  uint64_t v54;

  v50 = a3;
  v51 = a2;
  v4 = type metadata accessor for URLHandlerRoute(0);
  v48 = *(_QWORD *)(v4 - 8);
  v49 = v4;
  __chkstk_darwin(v4);
  v47 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000BBFC(0, &qword_100048D18, (uint64_t (*)(uint64_t))sub_100005D68, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v6);
  v8 = (char *)&v47 - v7;
  sub_10000BBFC(0, &qword_1000488D0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v9);
  v11 = (char *)&v47 - v10;
  v12 = type metadata accessor for URL(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v47 - v17;
  v19 = objc_msgSend(a1, "activityType");
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
  v22 = v21;

  v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSUserActivityTypeBrowsingWeb);
  v25 = v24;
  if (v23 == v20 && v24 == v22)
  {
    swift_bridgeObjectRelease_n(v22, 2);
  }
  else
  {
    v26 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, v20, v22, 0);
    swift_bridgeObjectRelease(v22);
    swift_bridgeObjectRelease(v25);
    if ((v26 & 1) == 0)
    {
      v46 = sub_10001C3EC(&qword_100048C08, (uint64_t (*)(_QWORD))&type metadata accessor for UserActivityHandlerManager);
      UserActivityHandlerManager.handle(userActivity:)((NSUserActivity)a1);
      return swift_release(v46);
    }
  }
  v27 = objc_msgSend(a1, "webpageURL");
  if (!v27)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    return sub_10000F608((uint64_t)v11, (uint64_t)&qword_1000488D0, (uint64_t)&type metadata accessor for URL, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
  }
  v28 = v27;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v29 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v29(v11, v16, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
    return sub_10000F608((uint64_t)v11, (uint64_t)&qword_1000488D0, (uint64_t)&type metadata accessor for URL, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
  v29(v18, v11, v12);
  v30 = objc_msgSend(v50, "session");
  v31 = objc_msgSend(v30, "persistentIdentifier");

  v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
  v34 = v33;

  sub_100005D68(0);
  v36 = v35;
  v37 = &v8[*(int *)(v35 + 48)];
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v8, v18, v12);
  *(_QWORD *)v37 = 0;
  *((_QWORD *)v37 + 1) = 0;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v8, 0, 1, v36);
  swift_beginAccess(v51 + qword_100048C78, v52, 33, 0);
  sub_10001C254((uint64_t)v8, v32, v34);
  swift_endAccess(v52);
  sub_10000C58C((uint64_t)v52);
  v38 = v53;
  v39 = v54;
  sub_10000C1E8(v52, v53);
  sub_10000BBFC(0, &qword_100048DD8, (uint64_t (*)(uint64_t))&type metadata accessor for AppURLContext, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for URLHandlerManager);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v40, v40, v38, v39);
  if (result)
  {
    v42 = result;
    sub_10000778C(v52);
    v44 = v47;
    v43 = v48;
    v45 = v49;
    (*(void (**)(char *, _QWORD, uint64_t))(v48 + 104))(v47, enum case for URLHandlerRoute.userActivity(_:), v49);
    URLHandlerManager<A>.handle(url:options:route:)(v18, 0, v44);
    swift_release(v42);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v45);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10001FC1C(void *a1, uint64_t a2, void *a3, void *a4)
{
  _QWORD *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v7 = (_QWORD *)swift_allocObject(&unk_100042D20, 40, 7);
  v7[2] = a4;
  v7[3] = a1;
  v7[4] = a3;
  v8 = a3;
  v9 = a4;
  v10 = a1;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  v14 = (void *)sub_10000F44C();
  v15 = (id)zalgoIfMain.getter(v14);
  Bootstrapper.afterBootstrap(on:run:)(v15, sub_1000202D8, v7);

  swift_release(v7);
}

id sub_10001FCE8(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v5 = a1;
  v6 = (void *)sub_10001C4A4();
  v7 = objc_msgSend(v6, "isStateRestorationAllowed");
  swift_unknownObjectRelease(v6);
  if (v7)
  {
    sub_10001C55C((uint64_t)v12);
    v8 = v13;
    v9 = v14;
    sub_10000C1E8(v12, v13);
    v10 = (void *)dispatch thunk of StateRestorationActivityProvider.stateRestorationActivity.getter(v8, v9);
    sub_10000778C(v12);

    return v10;
  }
  else
  {

    return 0;
  }
}

uint64_t sub_10001FDA8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10001FDC0(a1, a2, a3, (void (*)(_QWORD *, uint64_t, uint64_t))&dispatch thunk of MenuManagerType.handleMenuCommand(sender:));
}

uint64_t sub_10001FDB4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10001FDC0(a1, a2, a3, (void (*)(_QWORD *, uint64_t, uint64_t))&dispatch thunk of MenuManagerType.handleAlternateMenuCommand(sender:));
}

uint64_t sub_10001FDC0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD *, uint64_t, uint64_t))
{
  id v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  _QWORD v13[4];

  swift_unknownObjectRetain(a3);
  v7 = a1;
  _bridgeAnyObjectToAny(_:)(v13, a3);
  swift_unknownObjectRelease(a3);
  v8 = sub_10001C870();
  v10 = v9;
  ObjectType = swift_getObjectType(v8);
  a4(v13, ObjectType, v10);

  return sub_10000778C(v13);
}

void sub_10001FE4C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];

  v4 = a3;
  v5 = a1;
  v6 = sub_10001C870();
  v8 = v7;
  ObjectType = swift_getObjectType(v6);
  v10 = sub_10000624C(&qword_100048C68, &qword_100047EE0, (uint64_t)&protocol descriptor for CommandCenterType);
  v12 = v11;
  v13 = sub_10001C94C();
  v14[3] = type metadata accessor for Tracker(0);
  v14[4] = sub_100008EA0(&qword_100047EE8, (uint64_t (*)(uint64_t))&type metadata accessor for Tracker, (uint64_t)&protocol conformance descriptor for Tracker);
  v14[0] = v13;
  dispatch thunk of MenuManagerType.validate(_:with:tracker:)(v4, v10, v12, v14, ObjectType, v8);

  swift_unknownObjectRelease(v10);
  sub_10000778C(v14);

}

uint64_t sub_10001FF4C(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t ObjectType;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v22;
  objc_class *v23;
  objc_super v24;
  _QWORD v25[3];
  uint64_t v26;

  ObjectType = swift_getObjectType(v2);
  v6 = sub_10001C870();
  sub_10002169C(a2, (uint64_t)v25, (uint64_t)&qword_100047EC0, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000FD20);
  v7 = v26;
  v23 = (objc_class *)ObjectType;
  if (v26)
  {
    v8 = sub_10000C1E8(v25, v26);
    v9 = *(_QWORD *)(v7 - 8);
    __chkstk_darwin(v8);
    v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    v12 = _bridgeAnythingToObjectiveC<A>(_:)(v11, v7);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    sub_10000778C(v25);
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(v6, "canPerformAction:withSender:", a1, v12);

  swift_unknownObjectRelease(v12);
  if ((v13 & 1) != 0)
    return 1;
  sub_10002169C(a2, (uint64_t)v25, (uint64_t)&qword_100047EC0, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000FD20);
  v15 = v26;
  if (v26)
  {
    v16 = sub_10000C1E8(v25, v26);
    v17 = *(_QWORD *)(v15 - 8);
    __chkstk_darwin(v16);
    v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v17 + 16))(v19);
    v20 = _bridgeAnythingToObjectiveC<A>(_:)(v19, v15);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v15);
    sub_10000778C(v25);
  }
  else
  {
    v20 = 0;
  }
  v24.receiver = v2;
  v24.super_class = v23;
  v14 = objc_msgSendSuper2(&v24, "canPerformAction:withSender:", a1, v20);
  swift_unknownObjectRelease(v20);
  return (uint64_t)v14;
}

uint64_t sub_10002016C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  id v9;
  char v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = a1;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = a1;
  }
  v10 = sub_10001FF4C(a3, (uint64_t)v12);

  sub_10000F608((uint64_t)v12, (uint64_t)&qword_100047EC0, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000FD20);
  return v10 & 1;
}

uint64_t sub_10002020C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  sub_10000C58C((uint64_t)v5);
  v0 = v6;
  v1 = v7;
  sub_10000C1E8(v5, v6);
  v2 = type metadata accessor for DebugNavigationController(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v2, v2, v0, v1);
  if (result)
  {
    v4 = result;
    sub_10000778C(v5);
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_100020280()
{
  unint64_t result;
  char *v1;

  result = qword_1000488B8;
  if (!qword_1000488B8)
  {
    v1 = (char *)&OBJC_PROTOCOL___TUStateRestoreControllerType.isa + 1;
    result = swift_getExistentialTypeMetadata(0, 0, 1, &v1);
    atomic_store(result, (unint64_t *)&qword_1000488B8);
  }
  return result;
}

uint64_t sub_1000202D8()
{
  uint64_t v0;

  return sub_10001F78C(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

Swift::Int sub_1000202E4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  Swift::Int result;
  int64_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  uint64_t v43;
  int v44;
  _QWORD v45[9];

  v3 = v2;
  sub_100005D68(0);
  v43 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v3;
  if (*(_QWORD *)(*v3 + 24) > a1)
    a1 = *(_QWORD *)(*v3 + 24);
  sub_100020DD8(0);
  v44 = a2;
  v10 = static _DictionaryStorage.resize(original:capacity:move:)(v9, a1, a2);
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_43;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v42 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v40 = v3;
  v41 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain(v9);
  v18 = 0;
  while (1)
  {
    if (v15)
    {
      v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v22 = v21 | (v18 << 6);
      goto LABEL_24;
    }
    v23 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v41)
      break;
    v24 = v42;
    v25 = v42[v23];
    ++v18;
    if (!v25)
    {
      v18 = v23 + 1;
      if (v23 + 1 >= v41)
        goto LABEL_36;
      v25 = v42[v18];
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v41)
        {
LABEL_36:
          swift_release(v9);
          v3 = v40;
          if ((v44 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = v42[v26];
        if (!v25)
        {
          while (1)
          {
            v18 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v18 >= v41)
              goto LABEL_36;
            v25 = v42[v18];
            ++v26;
            if (v25)
              goto LABEL_23;
          }
        }
        v18 = v26;
      }
    }
LABEL_23:
    v15 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v18 << 6);
LABEL_24:
    v27 = (uint64_t *)(*(_QWORD *)(v9 + 48) + 16 * v22);
    v29 = *v27;
    v28 = v27[1];
    v30 = *(_QWORD *)(v43 + 72);
    v31 = *(_QWORD *)(v9 + 56) + v30 * v22;
    if ((v44 & 1) != 0)
    {
      sub_100020770(v31, (uint64_t)v8);
    }
    else
    {
      sub_100020E3C(v31, (uint64_t)v8);
      swift_bridgeObjectRetain(v28);
    }
    Hasher.init(_seed:)(v45, *(_QWORD *)(v11 + 40));
    String.hash(into:)(v45, v29, v28);
    result = Hasher._finalize()();
    v32 = -1 << *(_BYTE *)(v11 + 32);
    v33 = result & ~v32;
    v34 = v33 >> 6;
    if (((-1 << v33) & ~*(_QWORD *)(v16 + 8 * (v33 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v16 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v37 = v34 == v36;
        if (v34 == v36)
          v34 = 0;
        v35 |= v37;
        v38 = *(_QWORD *)(v16 + 8 * v34);
      }
      while (v38 == -1);
      v19 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    v20 = (_QWORD *)(*(_QWORD *)(v11 + 48) + 16 * v19);
    *v20 = v29;
    v20[1] = v28;
    result = sub_100020770((uint64_t)v8, *(_QWORD *)(v11 + 56) + v30 * v19);
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release(v9);
  v3 = v40;
  v24 = v42;
  if ((v44 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v39 = 1 << *(_BYTE *)(v9 + 32);
  if (v39 >= 64)
    bzero(v24, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v39;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_43:
  result = swift_release(v9);
  *v3 = v11;
  return result;
}

uint64_t sub_100020648@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  unint64_t v9;
  char v10;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v4 = v3;
  v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  v9 = sub_10002586C(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v12 = *v4;
    v20 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100020B6C();
      v12 = v20;
    }
    swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v9 + 8));
    v13 = *(_QWORD *)(v12 + 56);
    sub_100005D68(0);
    v15 = v14;
    v16 = *(_QWORD *)(v14 - 8);
    sub_100020770(v13 + *(_QWORD *)(v16 + 72) * v9, a3);
    sub_1000207B4(v9, v12);
    v17 = *v4;
    *v4 = v12;
    swift_bridgeObjectRelease(v17);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v16 + 56))(a3, 0, 1, v15);
  }
  else
  {
    sub_100005D68(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(a3, 1, 1, v19);
  }
}

uint64_t sub_100020770(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_100005D68(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000207B4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Int v12;
  unint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  int64_t v21;
  unint64_t v22;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  _QWORD v30[9];

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
      while (1)
      {
        v9 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v10 = *v9;
        v11 = v9[1];
        Hasher.init(_seed:)(v30, *(_QWORD *)(a2 + 40));
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v30, v10, v11);
        v12 = Hasher._finalize()();
        result = swift_bridgeObjectRelease(v11);
        v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v13 < v8)
          goto LABEL_11;
LABEL_12:
        v14 = *(_QWORD *)(a2 + 48);
        v15 = (_OWORD *)(v14 + 16 * v3);
        v16 = (_OWORD *)(v14 + 16 * v6);
        if (v3 != v6 || v15 >= v16 + 1)
          *v15 = *v16;
        v17 = *(_QWORD *)(a2 + 56);
        sub_100005D68(0);
        v19 = *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72);
        v20 = v19 * v3;
        result = v17 + v19 * v3;
        v21 = v19 * v6;
        v22 = v17 + v19 * v6 + v19;
        if (v20 < v21 || result >= v22)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v20 == v21)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v13 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v13)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v24 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v25 = *v24;
    v26 = (-1 << v3) - 1;
  }
  else
  {
    v24 = (uint64_t *)(v4 + 8 * (result >> 6));
    v26 = *v24;
    v25 = (-1 << result) - 1;
  }
  *v24 = v26 & v25;
  v27 = *(_QWORD *)(a2 + 16);
  v28 = __OFSUB__(v27, 1);
  v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v29;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1000209B0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_10002586C(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7];
        sub_100005D68(0);
        return sub_100020D94(a1, v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v12);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_100020B6C();
      goto LABEL_7;
    }
    sub_1000202E4(v15, a4 & 1);
    v22 = sub_10002586C(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_100020AE4(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain(a3);
    }
  }
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_100020AE4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  sub_100005D68(0);
  result = sub_100020770(a4, v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

void *sub_100020B6C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0;
  sub_100005D68(0);
  v30 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020DD8(0);
  v5 = *v0;
  v6 = static _DictionaryStorage.copy(original:)(*v0);
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release(v5);
LABEL_28:
    *v1 = v7;
    return result;
  }
  v28 = v1;
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v29 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v24);
    ++v11;
    if (!v25)
    {
      v11 = v24 + 1;
      if (v24 + 1 >= v15)
        goto LABEL_26;
      v25 = *(_QWORD *)(v29 + 8 * v11);
      if (!v25)
        break;
    }
LABEL_25:
    v14 = (v25 - 1) & v25;
    v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v20 = *v19;
    v21 = v19[1];
    v22 = *(_QWORD *)(v30 + 72) * v17;
    sub_100020E3C(*(_QWORD *)(v5 + 56) + v22, (uint64_t)v4);
    v23 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v23 = v20;
    v23[1] = v21;
    sub_100020770((uint64_t)v4, *(_QWORD *)(v7 + 56) + v22);
    result = (void *)swift_bridgeObjectRetain(v21);
  }
  v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    result = (void *)swift_release(v5);
    v1 = v28;
    goto LABEL_28;
  }
  v25 = *(_QWORD *)(v29 + 8 * v26);
  if (v25)
  {
    v11 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v11 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v11);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100020D94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_100005D68(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_100020DD8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100048DE0)
  {
    sub_100005D68(255);
    v3 = type metadata accessor for _DictionaryStorage(a1, &type metadata for String, v2, &protocol witness table for String);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100048DE0);
  }
}

uint64_t sub_100020E3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_100005D68(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100020E80()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100020EA4(char a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 16) + 16))(*(_QWORD *)(v1 + 16), a1 & 1);
}

uint64_t sub_100020EB8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100020EEC()
{
  uint64_t v0;
  UIApplicationShortcutItem v1;

  v1.super.isa = *(Class *)(v0 + 40);
  return sub_10001F4B8(*(_QWORD *)(v0 + 16), *(void (**)(Swift::Bool))(v0 + 24), *(_QWORD *)(v0 + 32), v1);
}

uint64_t sub_100020EF8()
{
  uint64_t v0;

  return sub_10001F25C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_100020F00(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unint64_t *a5, _QWORD *a6)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Swift::Int v16;
  uint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  id v21;
  char v22;
  id v23;
  uint64_t v24;
  unint64_t *v25;

  v10 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (__CocoaSet.Index.age.getter(a1, a2) == *(_DWORD *)(a4 + 36))
      {
        v14 = __CocoaSet.Index.element.getter(v10, a2);
        v24 = v14;
        v15 = sub_1000059D0(0, a5, a6);
        swift_unknownObjectRetain(v14);
        swift_dynamicCast(&v25, &v24, (char *)&type metadata for Swift.AnyObject + 8, v15, 7);
        a5 = v25;
        swift_unknownObjectRelease(v14);
        v16 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a4 + 40));
        v17 = -1 << *(_BYTE *)(a4 + 32);
        v10 = v16 & ~v17;
        if (((*(_QWORD *)(a4 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
        {
          v18 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v10);
          v19 = static NSObject.== infix(_:_:)(v18);

          if ((v19 & 1) == 0)
          {
            v20 = ~v17;
            do
            {
              v10 = (v10 + 1) & v20;
              if (((*(_QWORD *)(a4 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
                goto LABEL_24;
              v21 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v10);
              v22 = static NSObject.== infix(_:_:)(v21);

            }
            while ((v22 & 1) == 0);
          }

LABEL_20:
          v23 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v10);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v11 = a4;
  else
    v11 = a4 & 0xFFFFFFFFFFFFFF8;
  v12 = __CocoaSet.element(at:)(a1, a2, v11);
  v24 = v12;
  v13 = sub_1000059D0(0, a5, a6);
  swift_unknownObjectRetain(v12);
  swift_dynamicCast(&v25, &v24, (char *)&type metadata for Swift.AnyObject + 8, v13, 7);
  swift_unknownObjectRelease(v12);
}

uint64_t sub_100021160()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  sub_10000C41C((uint64_t)v8);
  v0 = v9;
  v1 = v10;
  sub_10000C1E8(v8, v9);
  dispatch thunk of SceneStateManagerType.didEnterBackground()(v0, v1);
  sub_10000778C(v8);
  sub_10000C58C((uint64_t)v8);
  v2 = v9;
  v3 = v10;
  sub_10000C1E8(v8, v9);
  v4 = type metadata accessor for SessionManager(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v4, v4, v2, v3);
  if (result)
  {
    v6 = result;
    sub_10000778C(v8);
    backgroundTask(withName:timeout:work:)(0xD00000000000001BLL, 0x8000000100036160, sub_10002125C, v6, 15.0);
    v7 = (void *)sub_10001C4A4();
    objc_msgSend(v7, "sceneDidEnterBackground");
    swift_release(v6);
    return swift_unknownObjectRelease(v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10002125C(uint64_t a1, uint64_t a2)
{
  return sub_10001D964(a1, a2);
}

uint64_t sub_100021264()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_100021288(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_100048408)
  {
    v2 = type metadata accessor for StocksActivity(255);
    v3 = sub_100008EA0(&qword_100048390, (uint64_t (*)(uint64_t))&type metadata accessor for StocksActivity, (uint64_t)&protocol conformance descriptor for StocksActivity);
    v4 = type metadata accessor for StackNavigator(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_100048408);
  }
}

uint64_t sub_100021300()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100021324()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100021348()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100021374(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_10000BBFC(0, &qword_100048D18, (uint64_t (*)(uint64_t))sub_100005D68, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000213D0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000213FC()
{
  uint64_t v0;
  NSUserActivity v1;

  v1.super.isa = *(Class *)(v0 + 24);
  return sub_10001DE44(*(_QWORD *)(v0 + 16), v1);
}

uint64_t sub_100021404(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

uint64_t sub_100021410()
{
  uint64_t v0;

  return sub_10001CA04(*(void **)(v0 + 24));
}

uint64_t sub_100021440()
{
  id *v0;

  return swift_deallocObject(v0, 40, 7);
}

void sub_100021474(uint64_t a1)
{
  uint64_t v1;

  sub_10001CFA8(a1, *(void **)(v1 + 16), *(_BYTE **)(v1 + 24), *(unsigned __int8 **)(v1 + 32));
}

uint64_t sub_100021490()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000214BC()
{
  uint64_t v0;
  UIApplicationShortcutItem v1;

  v1.super.isa = *(Class *)(v0 + 24);
  return sub_10001D5BC(*(_QWORD *)(v0 + 16), v1);
}

uint64_t sub_1000214C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_100021554()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(type metadata accessor for URL(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_10001D47C(*(_QWORD *)(v0 + 16), v0 + v2, *(void **)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8)));
}

void sub_100021598(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[4];

  if (!qword_100048EC8)
  {
    v4[0] = &type metadata for RestorationState;
    v4[1] = &type metadata for RestorationEvent;
    v4[2] = sub_100021610();
    v4[3] = sub_100010490();
    v2 = type metadata accessor for StateMachineTransition(a1, v4);
    if (!v3)
      atomic_store(v2, (unint64_t *)&qword_100048EC8);
  }
}

unint64_t sub_100021610()
{
  unint64_t result;

  result = qword_100048ED0;
  if (!qword_100048ED0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for RestorationState, &type metadata for RestorationState);
    atomic_store(result, (unint64_t *)&qword_100048ED0);
  }
  return result;
}

uint64_t sub_100021654(uint64_t a1)
{
  uint64_t v1;

  return sub_10001DEF0(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_10002165C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100021680(uint64_t a1)
{
  uint64_t v1;

  return sub_10001E048(a1, *(void **)(v1 + 24));
}

uint64_t sub_10002169C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t, void *))
{
  uint64_t v7;

  v7 = a5(0, a3, a4, &type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a2, a1, v7);
  return a2;
}

uint64_t sub_1000216F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  sub_10000BBFC(0, (unint64_t *)&unk_100048EB8, (uint64_t (*)(uint64_t))&type metadata accessor for StocksActivity, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = type metadata accessor for StocksActivity(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v0 + v4, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v4, v6);
  v8 = (v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v9 = v8 + 8;

  return swift_deallocObject(v0, v9, v3 | 7);
}

uint64_t sub_1000217BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_10000BBFC(0, (unint64_t *)&unk_100048EB8, (uint64_t (*)(uint64_t))&type metadata accessor for StocksActivity, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100021818(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  sub_10000BBFC(0, (unint64_t *)&unk_100048EB8, (uint64_t (*)(uint64_t))&type metadata accessor for StocksActivity, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  return sub_10001E174(a1, v1 + v5, *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8)));
}

void sub_100021880(uint64_t a1, uint64_t a2)
{
  sub_10001E418(a1, a2);
}

uint64_t sub_100021888(uint64_t a1)
{
  uint64_t v1;

  return sub_10001E524(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1000218A0()
{
  return sub_10001E76C();
}

uint64_t sub_1000218B8()
{
  return sub_10001E854();
}

uint64_t sub_1000218D0(uint64_t a1)
{
  return sub_10001E944(a1);
}

uint64_t sub_1000218D8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100021904()
{
  uint64_t v0;

  return sub_10001E6E8(*(uint64_t **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_100021910()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100021920()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100021940(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

unint64_t sub_10002198C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t result;
  char v19;
  unint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  sub_100027E50(0);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v6 = (uint64_t *)((char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = *(_QWORD *)(a1 + 16);
  if (!v7)
  {
    v9 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v27 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v27);
    return (unint64_t)v9;
  }
  sub_100020DD8(0);
  v8 = static _DictionaryStorage.allocate(capacity:)(v7);
  v9 = (_QWORD *)v8;
  v10 = *(_QWORD *)(a1 + 16);
  if (!v10)
    goto LABEL_9;
  v11 = (uint64_t)v6 + *(int *)(v3 + 48);
  v12 = v8 + 64;
  v13 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v29 = a1;
  v14 = a1 + v13;
  v15 = *(_QWORD *)(v4 + 72);
  swift_retain(v8);
  while (1)
  {
    sub_100027EB4(v14, (uint64_t)v6, (uint64_t (*)(_QWORD))sub_100027E50);
    v16 = *v6;
    v17 = v6[1];
    result = sub_10002586C(*v6, v17);
    if ((v19 & 1) != 0)
      break;
    v20 = result;
    *(_QWORD *)(v12 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v21 = (uint64_t *)(v9[6] + 16 * result);
    *v21 = v16;
    v21[1] = v17;
    v22 = v9[7];
    sub_100005D68(0);
    result = sub_100020770(v11, v22 + *(_QWORD *)(*(_QWORD *)(v23 - 8) + 72) * v20);
    v24 = v9[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
      goto LABEL_12;
    v9[2] = v26;
    v14 += v15;
    if (!--v10)
    {
      swift_release(v9);
      v27 = v29;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_100021B1C(uint64_t a1)
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
  sub_100027CB8(0, &qword_100049118, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, void *, uint64_t, void *))&type metadata accessor for _DictionaryStorage);
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
    sub_100027EB4(v7, (uint64_t)&v16, (uint64_t (*)(_QWORD))sub_100027BF4);
    v8 = v16;
    v9 = v17;
    result = sub_10002586C(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_10001A444(&v18, (_OWORD *)(v4[7] + 32 * result));
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

id sub_100021C68(_QWORD *a1, _QWORD *a2)
{
  char *v2;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  __CFNotificationCenter *v18;
  __CFNotificationCenter *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  id v26;
  id v27;
  uint64_t v29;
  objc_super v30;
  void *v31;

  ObjectType = (objc_class *)swift_getObjectType(v2);
  v6 = type metadata accessor for PromiseDeduperFlags(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_sharedUserDefaults;
  sub_1000059D0(0, &qword_1000490C0, NSUserDefaults_ptr);
  v10 = v2;
  *(_QWORD *)&v2[v9] = static NSUserDefaults.stocksShared.getter();
  v11 = OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_syncDeduper;
  v31 = &_swiftEmptyArrayStorage;
  v12 = sub_10000B308(&qword_1000490C8, 255, (uint64_t (*)(uint64_t))&type metadata accessor for PromiseDeduperFlags, (uint64_t)&protocol conformance descriptor for PromiseDeduperFlags);
  sub_10000BBFC(0, &qword_1000490D0, (uint64_t (*)(uint64_t))&type metadata accessor for PromiseDeduperFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  v14 = v13;
  v15 = sub_1000256F0();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v31, v14, v15, v6, v12);
  sub_100027CB8(0, (unint64_t *)&unk_1000490E0, (uint64_t)&type metadata for () + 8, (uint64_t (*)(_QWORD, void *, uint64_t, void *))&type metadata accessor for PromiseDeduper);
  swift_allocObject(v16, *(unsigned int *)(v16 + 48), *(unsigned __int16 *)(v16 + 52));
  *(_QWORD *)&v10[v11] = PromiseDeduper.init(options:)(v8);
  v10[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_pendingWatchNotification] = 0;
  sub_100010534((uint64_t)a1, (uint64_t)&v10[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager]);
  sub_100010534((uint64_t)a2, (uint64_t)&v10[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_stockMetadataManager]);

  v30.receiver = v10;
  v30.super_class = ObjectType;
  v17 = objc_msgSendSuper2(&v30, "init");
  v18 = CFNotificationCenterGetDarwinNotifyCenter();
  if (qword_100047880 != -1)
    swift_once(&qword_100047880, sub_1000254C0);
  CFNotificationCenterAddObserver(v18, v17, (CFNotificationCallback)sub_100025510, (CFStringRef)qword_10004A9E8, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  v19 = CFNotificationCenterGetDarwinNotifyCenter();
  if (qword_100047888 != -1)
    swift_once(&qword_100047888, sub_100025518);
  CFNotificationCenterAddObserver(v19, v17, (CFNotificationCallback)sub_100025568, (CFStringRef)qword_10004A9F0, 0, CFNotificationSuspensionBehaviorCoalesce);

  v20 = (void *)objc_opt_self(WCSession);
  if (objc_msgSend(v20, "isSupported"))
  {
    if (qword_100047898 != -1)
      swift_once(&qword_100047898, sub_100025634);
    v21 = type metadata accessor for Logger(0);
    v22 = sub_100025750(v21, (uint64_t)qword_10004A9F8);
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "activating watch connectivity session", v25, 2u);
      swift_slowDealloc(v25, -1, -1);
    }

    v26 = objc_msgSend(v20, "defaultSession");
    objc_msgSend(v26, "setDelegate:", v17);

    v27 = objc_msgSend(v20, "defaultSession");
    objc_msgSend(v27, "activateSession");

  }
  sub_10000778C(a2);
  sub_10000778C(a1);
  return v17;
}

id sub_10002203C()
{
  void *v0;
  objc_class *ObjectType;
  __CFNotificationCenter *v2;
  __CFNotificationCenter *v3;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  v2 = CFNotificationCenterGetDarwinNotifyCenter();
  if (qword_100047880 != -1)
    swift_once(&qword_100047880, sub_1000254C0);
  CFNotificationCenterRemoveObserver(v2, v0, (CFNotificationName)qword_10004A9E8, 0);

  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  if (qword_100047888 != -1)
    swift_once(&qword_100047888, sub_100025518);
  CFNotificationCenterRemoveObserver(v3, v0, (CFNotificationName)qword_10004A9F0, 0);

  v5.receiver = v0;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, "dealloc");
}

uint64_t sub_10002227C(char a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v29[5];
  int v30;
  uint64_t v31;

  if (qword_100047898 != -1)
    swift_once(&qword_100047898, sub_100025634);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100025750(v4, (uint64_t)qword_10004A9F8);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 67109120;
    v30 = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v8 + 4);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "will sync forced=%{BOOL}d", v8, 8u);
    swift_slowDealloc(v8, -1, -1);
  }

  __chkstk_darwin(v9);
  v29[2] = a2;
  sub_10000BBFC(0, &qword_1000490F8, (uint64_t (*)(uint64_t))&type metadata accessor for Watchlist, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  v11 = firstly<A>(closure:)(sub_100027B48, v29, v10);
  v12 = swift_allocObject(&unk_100043138, 24, 7);
  *(_QWORD *)(v12 + 16) = a2;
  v13 = a2;
  v14 = (void *)zalgo.getter(v13);
  v15 = Promise.then<A>(on:closure:)(v14, sub_100027B84, v12, (char *)&type metadata for () + 8);
  swift_release(v11);
  swift_release(v12);

  v16 = swift_allocObject(&unk_100043160, 24, 7);
  *(_QWORD *)(v16 + 16) = v13;
  v17 = v13;
  v18 = (void *)zalgo.getter(v17);
  sub_10000BBFC(0, &qword_100049100, (uint64_t (*)(uint64_t))&type metadata accessor for Stock, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  v20 = Promise.then<A>(on:closure:)(v18, sub_100027B9C, v16, v19);
  swift_release(v15);
  swift_release(v16);

  sub_1000059D0(0, &qword_100048910, OS_dispatch_queue_ptr);
  v21 = (void *)static OS_dispatch_queue.main.getter();
  v22 = swift_allocObject(&unk_100043188, 25, 7);
  *(_QWORD *)(v22 + 16) = v17;
  *(_BYTE *)(v22 + 24) = a1 & 1;
  v23 = v17;
  v24 = Promise.then<A>(on:closure:)(v21, sub_100027BD8, v22, (char *)&type metadata for () + 8);
  swift_release(v20);

  v25 = swift_release(v22);
  v26 = (void *)zalgo.getter(v25);
  v27 = Promise.error(on:closure:)(v26, sub_100024990, 0);
  swift_release(v24);

  return v27;
}

uint64_t sub_100022584(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  if (qword_100047898 != -1)
    swift_once(&qword_100047898, sub_100025634);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100025750(v2, (uint64_t)qword_10004A9F8);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "prewarming watchlist manager", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v7 = (_QWORD *)(a1 + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager);
  v8 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager + 24);
  v9 = v7[4];
  sub_10000C1E8(v7, v8);
  return dispatch thunk of WatchlistManagerType.prewarm()(v8, v9);
}

uint64_t sub_10002268C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  if (qword_100047898 != -1)
    swift_once(&qword_100047898, sub_100025634);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_100025750(v0, (uint64_t)qword_10004A9F8);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "adopting changes from watch", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }

  return sub_100022774();
}

uint64_t sub_100022774()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  NSString v8;
  double v9;
  double v10;
  char *v11;
  id v12;
  NSString v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  char *v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  NSString v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  NSString v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  _BOOL4 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  void *v70;
  __n128 v71;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  uint64_t v91;
  NSObject *v92;
  os_log_type_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  BOOL v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  os_log_type_t v108;
  uint8_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  unint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  void *v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  uint64_t v127;
  char *v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  NSObject *v132;
  os_log_type_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  unint64_t v155;
  unint64_t v156;
  uint64_t v157;
  unint64_t v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  char *v166;
  char *v167;
  __n128 v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  char *v173;
  void *v174;
  unint64_t v175;
  char *v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  char *v181;
  char *v182;
  char *v183;
  uint64_t v184;
  _QWORD v185[2];
  __int128 v186;
  __int128 v187;
  double v188;
  _BYTE v189[16];
  uint64_t v190;
  unint64_t v191;

  v179 = type metadata accessor for CachePolicy(0);
  v0 = *(_QWORD *)(v179 - 8);
  __chkstk_darwin(v179);
  v2 = (char *)&v166 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Watchlist(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v166 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000059D0(0, &qword_1000490C0, NSUserDefaults_ptr);
  v7 = (void *)static NSUserDefaults.stocksShared.getter();
  v8 = String._bridgeToObjectiveC()();
  objc_msgSend(v7, "doubleForKey:", v8);
  v10 = v9;

  v11 = (char *)objc_opt_self(NSUserDefaults);
  v12 = objc_msgSend(v11, "standardUserDefaults");
  v13 = String._bridgeToObjectiveC()();
  objc_msgSend(v12, "doubleForKey:", v13);
  v15 = v14;

  if (v15 == 0.0)
  {
    if (qword_100047898 != -1)
LABEL_85:
      swift_once(&qword_100047898, sub_100025634);
    v16 = type metadata accessor for Logger(0);
    v17 = sub_100025750(v16, (uint64_t)qword_10004A9F8);
    v18 = Logger.logObject.getter(v17);
    v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = swift_slowAlloc(22, -1);
      *(_DWORD *)v20 = 134218240;
      v188 = v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v188, v189, v20 + 4);
      *(_WORD *)(v20 + 12) = 2048;
      v188 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v188, v189, v20 + 14);
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "not checking for changes from watch since this device has never written to it (localLastModified=%f), sharedLastModified=%f)", (uint8_t *)v20, 0x16u);
      swift_slowDealloc(v20, -1, -1);
    }
    goto LABEL_11;
  }
  v21 = v4;
  v178 = v3;
  v169 = v2;
  v170 = v0;
  v177 = v6;
  v22 = (unint64_t)&type metadata for ();
  if (v10 == 0.0)
  {
    if (qword_100047898 != -1)
      swift_once(&qword_100047898, sub_100025634);
    v23 = type metadata accessor for Logger(0);
    v24 = sub_100025750(v23, (uint64_t)qword_10004A9F8);
    v18 = Logger.logObject.getter(v24);
    v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v25))
    {
      v26 = swift_slowAlloc(22, -1);
      *(_DWORD *)v26 = 134218240;
      v188 = v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v188, v189, v26 + 4);
      *(_WORD *)(v26 + 12) = 2048;
      v188 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v188, v189, v26 + 14);
      _os_log_impl((void *)&_mh_execute_header, v18, v25, "not checking for changes from watch since shared defaults have never been modified (localLastModified=%f), sharedLastModified=%f)", (uint8_t *)v26, 0x16u);
      swift_slowDealloc(v26, -1, -1);
    }
LABEL_11:

    sub_10000FD20(0, &qword_1000483F0, (uint64_t)&type metadata for () + 8, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Promise);
    swift_allocObject(v27, *(unsigned int *)(v27 + 48), *(unsigned __int16 *)(v27 + 52));
    return Promise.init(value:)();
  }
  if (qword_100047898 != -1)
    goto LABEL_87;
  while (2)
  {
    v30 = type metadata accessor for Logger(0);
    v180 = sub_100025750(v30, (uint64_t)qword_10004A9F8);
    v31 = Logger.logObject.getter(v180);
    v32 = static os_log_type_t.default.getter();
    v33 = os_log_type_enabled(v31, v32);
    v34 = v183;
    v35 = v21;
    if (v33)
    {
      v36 = swift_slowAlloc(22, -1);
      *(_DWORD *)v36 = 134218240;
      v188 = v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v188, v189, v36 + 4);
      *(_WORD *)(v36 + 12) = 2048;
      v188 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v188, v189, v36 + 14);
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "checking for changes from watch (localLastModified=%f), sharedLastModified=%f)", (uint8_t *)v36, 0x16u);
      swift_slowDealloc(v36, -1, -1);
    }

    v191 = (unint64_t)&_swiftEmptyArrayStorage;
    v37 = *(void **)&v34[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_sharedUserDefaults];
    v38 = String._bridgeToObjectiveC()();
    v39 = objc_msgSend(v37, "objectForKey:", v38);

    if (v39)
    {
      _bridgeAnyObjectToAny(_:)(&v186, v39);
      swift_unknownObjectRelease(v39);
    }
    else
    {
      v186 = 0u;
      v187 = 0u;
    }
    sub_100011D18((uint64_t)&v186, (uint64_t)&v188);
    if (v190)
    {
      sub_100027D0C(0, &qword_100049138, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
      if (swift_dynamicCast(v185, &v188, (char *)&type metadata for Any + 8, v40, 6))
      {
        v171 = v185[0];
        goto LABEL_24;
      }
    }
    else
    {
      sub_10000F608((uint64_t)&v188, (uint64_t)&qword_100047EC0, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000FD20);
    }
    sub_100027D0C(0, (unint64_t *)&unk_100049140, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    v42 = swift_allocObject(v41, 40, 7);
    *(_OWORD *)(v42 + 16) = xmmword_100037BB0;
    v43 = sub_100021B1C((uint64_t)&_swiftEmptyArrayStorage);
    v171 = v42;
    *(_QWORD *)(v42 + 32) = v43;
LABEL_24:
    v44 = objc_msgSend(v11, "standardUserDefaults", v166);
    v45 = String._bridgeToObjectiveC()();
    v46 = objc_msgSend(v44, "objectForKey:", v45);

    if (v46)
    {
      _bridgeAnyObjectToAny(_:)(&v186, v46);
      swift_unknownObjectRelease(v46);
    }
    else
    {
      v186 = 0u;
      v187 = 0u;
    }
    sub_100011D18((uint64_t)&v186, (uint64_t)&v188);
    if (v190)
    {
      sub_100027D0C(0, &qword_100049138, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
      if (swift_dynamicCast(v185, &v188, (char *)&type metadata for Any + 8, v47, 6))
      {
        v48 = v185[0];
        goto LABEL_32;
      }
    }
    else
    {
      sub_10000F608((uint64_t)&v188, (uint64_t)&qword_100047EC0, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000FD20);
    }
    sub_100027D0C(0, (unint64_t *)&unk_100049140, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    v48 = swift_allocObject(v49, 40, 7);
    *(_OWORD *)(v48 + 16) = xmmword_100037BB0;
    *(_QWORD *)(v48 + 32) = sub_100021B1C((uint64_t)&_swiftEmptyArrayStorage);
LABEL_32:
    v11 = sub_100027078(v171);
    v50 = sub_100027078(v48);
    swift_bridgeObjectRelease(v48);
    swift_bridgeObjectRetain_n(v11, 2);
    v51 = swift_bridgeObjectRetain_n(v50, 2);
    v52 = Logger.logObject.getter(v51);
    v53 = static os_log_type_t.default.getter();
    v54 = os_log_type_enabled(v52, v53);
    v175 = v35;
    v176 = v11;
    v181 = v50;
    if (v54)
    {
      v55 = swift_slowAlloc(22, -1);
      v56 = swift_slowAlloc(64, -1);
      v188 = *(double *)&v56;
      *(_DWORD *)v55 = 136315394;
      v57 = ((uint64_t (*)(char *))swift_bridgeObjectRetain)(v11);
      v58 = Array.description.getter(v57, &type metadata for String);
      v60 = v59;
      swift_bridgeObjectRelease(v11);
      *(_QWORD *)&v186 = sub_1000076BC(v58, v60, (uint64_t *)&v188);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v186, (char *)&v186 + 8, v55 + 4);
      swift_bridgeObjectRelease_n(v11, 2);
      swift_bridgeObjectRelease(v60);
      *(_WORD *)(v55 + 12) = 2080;
      swift_bridgeObjectRetain(v181);
      v22 = (unint64_t)&type metadata for ();
      v61 = Array.description.getter(v181, &type metadata for String);
      v63 = v62;
      swift_bridgeObjectRelease(v181);
      v64 = v61;
      v50 = v181;
      *(_QWORD *)&v186 = sub_1000076BC(v64, v63, (uint64_t *)&v188);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v186, (char *)&v186 + 8, v55 + 14);
      swift_bridgeObjectRelease_n(v50, 2);
      v65 = v63;
      v11 = v176;
      swift_bridgeObjectRelease(v65);
      _os_log_impl((void *)&_mh_execute_header, v52, v53, "shared watchlist has symbols=%s, and this device last saved symbols=%s", (uint8_t *)v55, 0x16u);
      swift_arrayDestroy(v56, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v56, -1, -1);
      swift_slowDealloc(v55, -1, -1);

      if (v15 >= v10)
        break;
    }
    else
    {

      swift_bridgeObjectRelease_n(v50, 2);
      v66 = swift_bridgeObjectRelease_n(v11, 2);
      if (v15 >= v10)
        break;
    }
    v67 = Logger.logObject.getter(v66);
    v68 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v67, v68))
    {
      v69 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v69 = 0;
      _os_log_impl((void *)&_mh_execute_header, v67, v68, "shared watchlist has been modified since this device last wrote to it", v69, 2u);
      swift_slowDealloc(v69, -1, -1);
    }

    v70 = (void *)*((_QWORD *)v50 + 2);
    if (v70)
    {
      v184 = *((_QWORD *)v11 + 2);
      v173 = &v34[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager];
      v182 = v50 + 32;
      v71 = swift_bridgeObjectRetain(v50);
      v72 = v22;
      v22 = 0;
      v166 = v11 + 72;
      v71.n128_u64[0] = 136315138;
      v168 = v71;
      v167 = (char *)&type metadata for Any + 8;
      v172 = v72 + 8;
      v174 = v70;
      while (1)
      {
        if (v22 >= *((_QWORD *)v50 + 2))
        {
          __break(1u);
          goto LABEL_85;
        }
        v86 = (uint64_t *)&v182[16 * v22];
        v87 = *v86;
        v21 = v86[1];
        if (!v184)
          goto LABEL_53;
        v88 = *((_QWORD *)v11 + 4);
        v89 = *((_QWORD *)v11 + 5);
        v90 = v88 == v87 && v89 == v21;
        if (!v90 && (_stringCompareWithSmolCheck(_:_:expecting:)(v88, v89, v87, v21, 0) & 1) == 0)
        {
          if (v184 == 1)
            goto LABEL_53;
          v96 = *((_QWORD *)v11 + 6);
          v97 = *((_QWORD *)v11 + 7);
          if ((v96 != v87 || v97 != v21)
            && (_stringCompareWithSmolCheck(_:_:expecting:)(v96, v97, v87, v21, 0) & 1) == 0)
          {
            break;
          }
        }
LABEL_44:
        if ((void *)++v22 == v70)
        {
          swift_bridgeObjectRelease(v50);
          v22 = (unint64_t)&type metadata for ();
          goto LABEL_69;
        }
      }
      if (v184 != 2)
      {
        v98 = v166;
        v99 = 2;
        while (1)
        {
          v100 = v99 + 1;
          if (__OFADD__(v99, 1))
            break;
          v101 = *((_QWORD *)v98 - 1);
          v102 = *(_QWORD *)v98;
          v103 = v101 == v87 && v102 == v21;
          if (v103 || (_stringCompareWithSmolCheck(_:_:expecting:)(v101, v102, v87, v21, 0) & 1) != 0)
            goto LABEL_44;
          v98 += 16;
          ++v99;
          if (v100 == v184)
            goto LABEL_53;
        }
        __break(1u);
LABEL_87:
        swift_once(&qword_100047898, sub_100025634);
        continue;
      }
LABEL_53:
      v91 = swift_bridgeObjectRetain_n(v21, 3);
      v92 = Logger.logObject.getter(v91);
      v93 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v92, v93))
      {
        v94 = swift_slowAlloc(12, -1);
        v95 = swift_slowAlloc(32, -1);
        v188 = *(double *)&v95;
        *(_DWORD *)v94 = v168.n128_u32[0];
        swift_bridgeObjectRetain(v21);
        *(_QWORD *)(v94 + 4) = sub_1000076BC(v87, v21, (uint64_t *)&v188);
        swift_bridgeObjectRelease_n(v21, 3);
        _os_log_impl((void *)&_mh_execute_header, v92, v93, "found deleted symbol: %s", (uint8_t *)v94, 0xCu);
        swift_arrayDestroy(v95, 1, v167);
        swift_slowDealloc(v95, -1, -1);
        swift_slowDealloc(v94, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v21, 2);
      }
      v73 = v173;
      v74 = *((_QWORD *)v173 + 3);
      v75 = *((_QWORD *)v173 + 4);
      sub_10000C1E8(v173, v74);
      v76 = *((_QWORD *)v73 + 3);
      v77 = *((_QWORD *)v73 + 4);
      sub_10000C1E8(v73, v76);
      v78 = v177;
      dispatch thunk of WatchlistManagerType.defaultAllSymbolsWatchlist.getter(v76, v77);
      v79 = dispatch thunk of WatchlistManagerType.removeSymbol(_:from:)(v87, v21, v78, v74, v75);
      swift_bridgeObjectRelease(v21);
      v80 = (*(uint64_t (**)(char *, uint64_t))(v175 + 8))(v78, v178);
      v81 = (void *)zalgo.getter(v80);
      v82 = Promise.then<A>(on:closure:)(v81, nullsub_1, 0, v172);
      swift_release(v79);

      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v84 = *(_QWORD *)((v191 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v83 = *(_QWORD *)((v191 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v84 >= v83 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v83 > 1, v84 + 1, 1);
      v85 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v84, v82);
      specialized Array._endMutation()(v85);
      v34 = v183;
      v11 = v176;
      v50 = v181;
      v70 = v174;
      goto LABEL_44;
    }
    break;
  }
LABEL_69:
  swift_bridgeObjectRetain(v50);
  v104 = v34;
  v105 = sub_100026B30(v171, v50);

  swift_bridgeObjectRelease(v50);
  v106 = swift_bridgeObjectRetain_n(v105, 2);
  v107 = Logger.logObject.getter(v106);
  v108 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v107, v108))
  {
    v109 = (uint8_t *)swift_slowAlloc(12, -1);
    v110 = swift_slowAlloc(32, -1);
    v188 = *(double *)&v110;
    *(_DWORD *)v109 = 136315138;
    v184 = (uint64_t)(v109 + 4);
    swift_bridgeObjectRetain(v105);
    v112 = Array.description.getter(v111, &type metadata for String);
    v114 = v113;
    swift_bridgeObjectRelease(v105);
    *(_QWORD *)&v186 = sub_1000076BC(v112, v114, (uint64_t *)&v188);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v186, (char *)&v186 + 8, v184);
    swift_bridgeObjectRelease_n(v105, 2);
    swift_bridgeObjectRelease(v114);
    _os_log_impl((void *)&_mh_execute_header, v107, v108, "adding symbols %s", v109, 0xCu);
    swift_arrayDestroy(v110, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v110, -1, -1);
    swift_slowDealloc(v109, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v105, 2);
  }
  v115 = v170;
  v116 = v169;
  v117 = *(_QWORD *)&v104[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_stockMetadataManager + 24];
  v118 = *(_QWORD *)&v104[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_stockMetadataManager + 32];
  sub_10000C1E8(&v104[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_stockMetadataManager], v117);
  v119 = v179;
  (*(void (**)(char *, _QWORD, uint64_t))(v115 + 104))(v116, enum case for CachePolicy.preferCache(_:), v179);
  v120 = StockMetadataManagerType.fetchStocks(for:cachePolicy:)(v105, v116, v117, v118);
  (*(void (**)(char *, uint64_t))(v115 + 8))(v116, v119);
  v121 = swift_allocObject(&unk_1000431B0, 32, 7);
  *(_QWORD *)(v121 + 16) = v104;
  *(_QWORD *)(v121 + 24) = v105;
  v122 = v104;
  v123 = (void *)zalgo.getter(v122);
  v124 = Promise.then<A>(on:closure:)(v123, sub_100027DAC, v121, v22 + 8);
  swift_release(v120);
  swift_release(v121);

  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v126 = *(_QWORD *)((v191 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v125 = *(_QWORD *)((v191 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v126 >= v125 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v125 > 1, v126 + 1, 1);
  v127 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v126, v124);
  specialized Array._endMutation()(v127);
  v128 = v181;
  v129 = v176;
  if (*((_QWORD *)v181 + 2) == *((_QWORD *)v176 + 2) && (sub_1000257A8(v181, v176) & 1) == 0)
  {
    swift_bridgeObjectRetain_n(v129, 2);
    swift_bridgeObjectRetain(v128);
    v132 = Logger.logObject.getter(v131);
    v133 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v132, v133))
    {
      v134 = swift_slowAlloc(22, -1);
      v184 = swift_slowAlloc(64, -1);
      v188 = *(double *)&v184;
      *(_DWORD *)v134 = 136315394;
      swift_bridgeObjectRetain(v129);
      v136 = Array.description.getter(v135, &type metadata for String);
      v138 = v137;
      swift_bridgeObjectRelease(v129);
      *(_QWORD *)&v186 = sub_1000076BC(v136, v138, (uint64_t *)&v188);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v186, (char *)&v186 + 8, v134 + 4);
      swift_bridgeObjectRelease_n(v129, 2);
      swift_bridgeObjectRelease(v138);
      *(_WORD *)(v134 + 12) = 2080;
      swift_bridgeObjectRetain(v128);
      v140 = Array.description.getter(v139, &type metadata for String);
      v142 = v141;
      swift_bridgeObjectRelease(v128);
      *(_QWORD *)&v186 = sub_1000076BC(v140, v142, (uint64_t *)&v188);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v186, (char *)&v186 + 8, v134 + 14);
      swift_bridgeObjectRelease_n(v128, 2);
      swift_bridgeObjectRelease(v142);
      _os_log_impl((void *)&_mh_execute_header, v132, v133, "reordering symbols - watch:%s phone:%s", (uint8_t *)v134, 0x16u);
      v143 = v184;
      swift_arrayDestroy(v184, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v143, -1, -1);
      swift_slowDealloc(v134, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v128, 2);
      swift_bridgeObjectRelease_n(v129, 2);
    }
    v144 = v178;
    v145 = &v122[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager];
    v146 = *(_QWORD *)&v122[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager + 24];
    v147 = *((_QWORD *)v145 + 4);
    sub_10000C1E8(v145, v146);
    v148 = *((_QWORD *)v145 + 3);
    v149 = *((_QWORD *)v145 + 4);
    sub_10000C1E8(v145, v148);
    v150 = v177;
    dispatch thunk of WatchlistManagerType.defaultAllSymbolsWatchlist.getter(v148, v149);
    v151 = dispatch thunk of WatchlistManagerType.reorder(symbols:in:)(v129, v150, v146, v147);
    swift_bridgeObjectRelease(v129);
    v152 = (*(uint64_t (**)(char *, uint64_t))(v175 + 8))(v150, v144);
    v153 = (void *)zalgo.getter(v152);
    v154 = Promise.then<A>(on:closure:)(v153, sub_100024D2C, 0, (char *)&type metadata for () + 8);
    swift_release(v151);

    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v156 = *(_QWORD *)((v191 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v155 = *(_QWORD *)((v191 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v156 >= v155 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v155 > 1, v156 + 1, 1);
    v157 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v156, v154);
    v130 = specialized Array._endMutation()(v157);
  }
  else
  {
    swift_bridgeObjectRelease(v129);
    v130 = swift_bridgeObjectRelease(v128);
  }
  v158 = v191;
  v159 = (void *)zalgo.getter(v130);
  v160 = when<A>(on:_:)(v159, v158, (char *)&type metadata for () + 8);
  swift_bridgeObjectRelease(v158);

  v162 = (void *)zalgo.getter(v161);
  v163 = Promise.then<A>(on:closure:)(v162, sub_100024D2C, 0, (char *)&type metadata for () + 8);
  swift_release(v160);

  v164 = swift_allocObject(&unk_1000431D8, 32, 7);
  *(double *)(v164 + 16) = v10;
  *(_QWORD *)(v164 + 24) = v171;
  v165 = (void *)zalgo.getter(v164);
  v28 = Promise.always(on:closure:)(v165, sub_100027DE8, v164);
  swift_release(v163);
  swift_release(v164);

  return v28;
}

uint64_t sub_100023B4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  if (qword_100047898 != -1)
    swift_once(&qword_100047898, sub_100025634);
  v3 = type metadata accessor for Logger(0);
  v4 = sub_100025750(v3, (uint64_t)qword_10004A9F8);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "will fetch stocks from \"My Symbols\" watchlist", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  v8 = (_QWORD *)(a2 + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager);
  v9 = *(_QWORD *)(a2 + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager + 24);
  v10 = v8[4];
  sub_10000C1E8(v8, v9);
  return dispatch thunk of WatchlistManagerType.fetchStocksFromDefaultWatchlist()(v9, v10);
}

uint64_t sub_100023C54(uint64_t *a1, uint64_t a2, char a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Class isa;
  NSString v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSString v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;

  v4 = *a1;
  if (qword_100047898 != -1)
    swift_once(&qword_100047898, sub_100025634);
  v5 = type metadata accessor for Logger(0);
  sub_100025750(v5, (uint64_t)qword_10004A9F8);
  swift_bridgeObjectRetain(v4);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v9 = 134217984;
    v30 = *(_QWORD *)(v4 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v9 + 4);
    swift_bridgeObjectRelease(v4);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "did fetch stocks from \"My Symbols\" watchlist with %ld stocks", v9, 0xCu);
    swift_slowDealloc(v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease(v4);
  }
  v10 = sub_100023FBC(v4, a3 & 1);
  if ((v10 & 1) != 0)
  {
    v11 = objc_msgSend(objc_allocWithZone((Class)NPSManager), "init");
    type metadata accessor for AppGroup(0);
    v12 = static AppGroup.stocks.getter();
    AppGroup.identifier.getter();
    v14 = v13;
    swift_release(v12);
    v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v14);
    if (qword_100047878 != -1)
      swift_once(&qword_100047878, sub_100024F28);
    v16 = qword_10004A9E0;
    swift_bridgeObjectRetain(qword_10004A9E0);
    v18 = sub_1000271EC(v17);
    swift_bridgeObjectRelease(v16);
    isa = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v18);
    v20 = String._bridgeToObjectiveC()();
    v21 = static AppGroup.stocks.getter();
    AppGroup.identifier.getter();
    v23 = v22;
    swift_release(v21);
    v24 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v23);
    objc_msgSend(v11, "synchronizeUserDefaultsDomain:keys:container:appGroupContainer:", v15, isa, v20, v24);

    sub_1000245F0();
  }
  else
  {
    v25 = Logger.logObject.getter(v10);
    v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "watchlist contains no changes for watch", v27, 2u);
      swift_slowDealloc(v27, -1, -1);
    }

  }
  sub_10000FD20(0, &qword_1000483F0, (uint64_t)&type metadata for () + 8, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Promise);
  swift_allocObject(v28, *(unsigned int *)(v28 + 48), *(unsigned __int16 *)(v28 + 52));
  return Promise.init(value:)();
}

uint64_t sub_100023FBC(uint64_t a1, int a2)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  _QWORD *v9;
  void *v10;
  NSString v11;
  id v12;
  uint64_t v13;
  void *v14;
  char *v15;
  NSString v16;
  id v17;
  uint64_t v18;
  void *v19;
  char *v20;
  char *v21;
  char v22;
  char v23;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  NSString v33;
  Class isa;
  NSString v35;
  NSString v36;
  Class v37;
  NSString v38;
  void *v39;
  id v40;
  NSString v41;
  id v42;
  Class v43;
  NSString v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  HIDWORD(v45) = a2;
  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v2;
  v9 = sub_10002694C(a1);

  v10 = *(void **)&v8[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_sharedUserDefaults];
  v11 = String._bridgeToObjectiveC()();
  v12 = objc_msgSend(v10, "objectForKey:", v11);

  if (v12)
  {
    _bridgeAnyObjectToAny(_:)(&v47, v12);
    swift_unknownObjectRelease(v12);
  }
  else
  {
    v47 = 0u;
    v48 = 0u;
  }
  sub_100011D18((uint64_t)&v47, (uint64_t)&v49);
  if (v51)
  {
    sub_100027D0C(0, &qword_100049138, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    if (swift_dynamicCast(&v46, &v49, (char *)&type metadata for Any + 8, v13, 6))
    {
      v14 = v46;
      goto LABEL_9;
    }
  }
  else
  {
    sub_10000F608((uint64_t)&v49, (uint64_t)&qword_100047EC0, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000FD20);
  }
  v14 = &_swiftEmptyArrayStorage;
LABEL_9:
  v15 = sub_100027078((uint64_t)v14);
  swift_bridgeObjectRelease(v14);
  v16 = String._bridgeToObjectiveC()();
  v17 = objc_msgSend(v10, "objectForKey:", v16);

  if (v17)
  {
    _bridgeAnyObjectToAny(_:)(&v47, v17);
    swift_unknownObjectRelease(v17);
  }
  else
  {
    v47 = 0u;
    v48 = 0u;
  }
  sub_100011D18((uint64_t)&v47, (uint64_t)&v49);
  if (v51)
  {
    sub_100027D0C(0, &qword_100049138, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    if (swift_dynamicCast(&v46, &v49, (char *)&type metadata for Any + 8, v18, 6))
    {
      v19 = v46;
      goto LABEL_17;
    }
  }
  else
  {
    sub_10000F608((uint64_t)&v49, (uint64_t)&qword_100047EC0, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000FD20);
  }
  v19 = &_swiftEmptyArrayStorage;
LABEL_17:
  v20 = sub_100027078((uint64_t)v19);
  swift_bridgeObjectRelease(v19);
  v21 = sub_100027078((uint64_t)v9);
  v22 = sub_1000257A8(v21, v15);
  swift_bridgeObjectRelease(v15);
  if ((v22 & 1) != 0)
  {
    v23 = sub_1000257A8(v21, v20);
    swift_bridgeObjectRelease(v21);
    swift_bridgeObjectRelease(v20);
    if ((v23 & 1) != 0 && (v45 & 0x100000000) == 0)
    {
      swift_bridgeObjectRelease(v9);
      return 0;
    }
  }
  else
  {
    swift_bridgeObjectRelease(v21);
    swift_bridgeObjectRelease(v20);
  }
  if (qword_100047898 != -1)
    swift_once(&qword_100047898, sub_100025634);
  v25 = type metadata accessor for Logger(0);
  sub_100025750(v25, (uint64_t)qword_10004A9F8);
  swift_bridgeObjectRetain(a1);
  v27 = Logger.logObject.getter(v26);
  v28 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v29 = 134217984;
    v49 = *(_QWORD *)(a1 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50, v29 + 4);
    swift_bridgeObjectRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "saving %ld stocks to group user defaults", v29, 0xCu);
    swift_slowDealloc(v29, -1, -1);

  }
  else
  {

    v30 = swift_bridgeObjectRelease(a1);
  }
  v31 = Date.init()(v30);
  v32 = Date.timeIntervalSince1970.getter(v31);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v33 = String._bridgeToObjectiveC()();
  objc_msgSend(v10, "setDouble:forKey:", v33, v32);

  sub_100027CB8(0, &qword_100049130, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, void *, uint64_t, void *))&type metadata accessor for Dictionary);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v35 = String._bridgeToObjectiveC()();
  objc_msgSend(v10, "setObject:forKey:", isa, v35);

  v36 = String._bridgeToObjectiveC()();
  objc_msgSend(v10, "setDouble:forKey:", v36, v32);

  v37 = Array._bridgeToObjectiveC()().super.isa;
  v38 = String._bridgeToObjectiveC()();
  objc_msgSend(v10, "setObject:forKey:", v37, v38);

  v39 = (void *)objc_opt_self(NSUserDefaults);
  v40 = objc_msgSend(v39, "standardUserDefaults");
  v41 = String._bridgeToObjectiveC()();
  objc_msgSend(v40, "setDouble:forKey:", v41, v32);

  v42 = objc_msgSend(v39, "standardUserDefaults");
  v43 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  v44 = String._bridgeToObjectiveC()();
  objc_msgSend(v42, "setObject:forKey:", v43, v44);

  return 1;
}

void sub_1000245F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t inited;
  _QWORD *v8;
  unint64_t v9;
  Class isa;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  id v21;

  v1 = v0;
  v21 = objc_msgSend((id)objc_opt_self(WCSession), "defaultSession");
  if (objc_msgSend(v21, "isPaired") && objc_msgSend(v21, "isWatchAppInstalled"))
  {
    if (objc_msgSend(v21, "activationState") == (id)2)
    {
      if (qword_100047898 != -1)
        swift_once(&qword_100047898, sub_100025634);
      v2 = type metadata accessor for Logger(0);
      v3 = sub_100025750(v2, (uint64_t)qword_10004A9F8);
      v4 = Logger.logObject.getter(v3);
      v5 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v4, v5))
      {
        v6 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, v5, "issuing watch notification", v6, 2u);
        swift_slowDealloc(v6, -1, -1);
      }

      sub_10000BBFC(0, &qword_100049108, (uint64_t (*)(uint64_t))sub_100027BF4, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100037BB0;
      *(_QWORD *)(inited + 32) = 0x6D617473656D6974;
      *(_QWORD *)(inited + 40) = 0xE900000000000070;
      *(_QWORD *)(inited + 72) = type metadata accessor for Date(0);
      v8 = sub_10000F58C((_QWORD *)(inited + 48));
      Date.init()(v8);
      v9 = sub_100021B1C(inited);
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v9);

      *(_BYTE *)(v1 + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_pendingWatchNotification) = 0;
    }
    else
    {
      if (qword_100047898 != -1)
        swift_once(&qword_100047898, sub_100025634);
      v16 = type metadata accessor for Logger(0);
      v17 = sub_100025750(v16, (uint64_t)qword_10004A9F8);
      v18 = Logger.logObject.getter(v17);
      v19 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "deferring watch notification because session is not active", v20, 2u);
        swift_slowDealloc(v20, -1, -1);
      }

      *(_BYTE *)(v1 + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_pendingWatchNotification) = 1;
    }
  }
  else
  {
    if (qword_100047898 != -1)
      swift_once(&qword_100047898, sub_100025634);
    v11 = type metadata accessor for Logger(0);
    v12 = sub_100025750(v11, (uint64_t)qword_10004A9F8);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "skipping watch notification because no watch is paired or the watch app isn't installed", v15, 2u);
      swift_slowDealloc(v15, -1, -1);
    }

  }
}

void sub_100024990(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *oslog;
  uint64_t v11;
  _QWORD v12[3];
  _BYTE v13[8];
  uint64_t v14;

  if (qword_100047898 != -1)
    swift_once(&qword_100047898, sub_100025634);
  v2 = type metadata accessor for Logger(0);
  sub_100025750(v2, (uint64_t)qword_10004A9F8);
  swift_errorRetain(a1);
  v3 = swift_errorRetain(a1);
  oslog = Logger.logObject.getter(v3);
  v4 = static os_log_type_t.error.getter(oslog);
  if (os_log_type_enabled(oslog, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = swift_slowAlloc(32, -1);
    v14 = v6;
    *(_DWORD *)v5 = 136315138;
    swift_getErrorValue(a1, v13, v12);
    v7 = Error.localizedDescription.getter(v12[1], v12[2]);
    v9 = v8;
    v11 = sub_1000076BC(v7, v8, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, v12, v5 + 4);
    swift_bridgeObjectRelease(v9);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "failed to fetch latest watchlist with error: %s", v5, 0xCu);
    swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);

  }
}

uint64_t sub_100024B68(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = type metadata accessor for Watchlist(0);
  v7 = *(_QWORD *)(v23 - 8);
  __chkstk_darwin(v23);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  v11 = (_QWORD *)(a2 + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager);
  v12 = v11[3];
  v21 = v11[4];
  sub_10000C1E8(v11, v12);
  swift_bridgeObjectRetain(v10);
  v13 = sub_100026DAC(a3, v10);
  v22 = v3;
  swift_bridgeObjectRelease(v10);
  v14 = v11[3];
  v15 = v11[4];
  sub_10000C1E8(v11, v14);
  dispatch thunk of WatchlistManagerType.defaultAllSymbolsWatchlist.getter(v14, v15);
  v16 = WatchlistManagerType.addStocks(_:watchlist:)(v13, v9, v12, v21);
  swift_bridgeObjectRelease(v13);
  v17 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v23);
  v18 = (void *)zalgo.getter(v17);
  v19 = Promise.then<A>(on:closure:)(v18, sub_100024CD4, 0, (char *)&type metadata for () + 8);
  swift_release(v16);

  return v19;
}

uint64_t sub_100024CD4()
{
  uint64_t v0;

  sub_10000FD20(0, &qword_1000483F0, (uint64_t)&type metadata for () + 8, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Promise);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  return Promise.init(value:)();
}

uint64_t sub_100024D2C()
{
  return sub_100024CD4();
}

void sub_100024D40(double a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  void *v7;
  id v8;
  NSString v9;
  id v10;
  Class isa;
  NSString v12;

  if (qword_100047898 != -1)
    swift_once(&qword_100047898, sub_100025634);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100025750(v2, (uint64_t)qword_10004A9F8);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "finished watch sync", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v7 = (void *)objc_opt_self(NSUserDefaults);
  v8 = objc_msgSend(v7, "standardUserDefaults");
  v9 = String._bridgeToObjectiveC()();
  objc_msgSend(v8, "setDouble:forKey:", v9, a1);

  v10 = objc_msgSend(v7, "standardUserDefaults");
  sub_100027CB8(0, &qword_100049130, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, void *, uint64_t, void *))&type metadata accessor for Dictionary);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v12 = String._bridgeToObjectiveC()();
  objc_msgSend(v10, "setObject:forKey:", isa, v12);

}

void sub_100024F28()
{
  qword_10004A9E0 = (uint64_t)&off_100042328;
}

uint64_t type metadata accessor for GizmoSyncManager()
{
  return objc_opt_self(_TtC9StocksApp16GizmoSyncManager);
}

uint64_t sub_100024F8C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  unint64_t v9;

  if (qword_100047898 != -1)
    swift_once(&qword_100047898, sub_100025634);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_100025750(v0, (uint64_t)qword_10004A9F8);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "triggering sync in response to watchlist observer callback", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }

  v8 = 1668184435;
  v9 = 0xE400000000000000;
  __chkstk_darwin(v5);
  v6 = PromiseDeduper.promise(key:createBlock:)(&v8, sub_100027EF8);
  swift_release(v6);
  return swift_bridgeObjectRelease(v9);
}

uint64_t sub_1000250C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(v1);
  return WatchlistManagerObserver.watchlistManagerWatchlistsDidChange(_:)(a1, ObjectType);
}

void sub_100025204(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (*(_BYTE *)(a1 + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_pendingWatchNotification) == 1)
  {
    if (qword_100047898 != -1)
      swift_once(&qword_100047898, sub_100025634);
    v1 = type metadata accessor for Logger(0);
    v2 = sub_100025750(v1, (uint64_t)qword_10004A9F8);
    v3 = Logger.logObject.getter(v2);
    v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "notifying watch in response to session activation because we have a pending notification", v5, 2u);
      swift_slowDealloc(v5, -1, -1);
    }

    sub_1000245F0();
  }
}

uint64_t sub_1000254C0()
{
  uint64_t result;

  sub_1000059D0(0, &qword_1000490F0, NSString_ptr);
  result = NSString.init(stringLiteral:)("com.apple.stocks.wake-watch-app", 31, 2);
  qword_10004A9E8 = result;
  return result;
}

void sub_100025510(uint64_t a1, void *a2)
{
  sub_1000278E8(a2);
}

uint64_t sub_100025518()
{
  uint64_t result;

  sub_1000059D0(0, &qword_1000490F0, NSString_ptr);
  result = NSString.init(stringLiteral:)("com.apple.stocks.PreferencesChangedNotification", 47, 2);
  qword_10004A9F0 = result;
  return result;
}

void sub_100025568(uint64_t a1, void *a2)
{
  sub_1000279EC(a2);
}

void sub_100025570()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v1 = objc_msgSend(v0, "bundleIdentifier");

  if (v1)
  {
    sub_1000059D0(0, &qword_100048DF0, OS_os_log_ptr);
    v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
    v4 = v3;

    qword_100048F60 = OS_os_log.init(subsystem:category:)(v2, v4, 0x6E79536863746157, 0xE900000000000063);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100025634()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100025768(v0, qword_10004A9F8);
  sub_100025750(v0, (uint64_t)qword_10004A9F8);
  if (qword_100047890 != -1)
    swift_once(&qword_100047890, sub_100025570);
  return Logger.init(_:)((id)qword_100048F60);
}

uint64_t sub_1000256B4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_10000B308(&qword_1000490B8, a2, (uint64_t (*)(uint64_t))type metadata accessor for GizmoSyncManager, (uint64_t)&unk_100038694);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000256F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000490D8;
  if (!qword_1000490D8)
  {
    sub_10000BBFC(255, &qword_1000490D0, (uint64_t (*)(uint64_t))&type metadata accessor for PromiseDeduperFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000490D8);
  }
  return result;
}

uint64_t sub_100025750(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_100025768(uint64_t a1, uint64_t *a2)
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

uint64_t sub_1000257A8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  uint64_t result;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4];
  v6 = a1[5];
  v7 = a2[4];
  v8 = a2[5];
  v9 = v5 == v7 && v6 == v8;
  if (v9 || (v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v6, v7, v8, 0), result = 0, (v10 & 1) != 0))
  {
    v12 = v2 - 1;
    if (!v12)
      return 1;
    v13 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      v15 = *(v13 - 1);
      v16 = *v13;
      v17 = *(i - 1);
      v18 = *i;
      v19 = v15 == v17 && v16 == v18;
      if (!v19 && (_stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, v17, v18, 0) & 1) == 0)
        break;
      v13 += 2;
      if (!--v12)
        return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sub_10002586C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_1000258D0(a1, a2, v5);
}

unint64_t sub_1000258D0(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_1000259B0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100025A04(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1000259CC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100025B80(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1000259E8(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100025D2C(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_100025A04(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000FD20(0, (unint64_t *)&unk_100049180, (uint64_t)&type metadata for String, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
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

uint64_t sub_100025B80(char a1, int64_t a2, char a3, _QWORD *a4)
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
    sub_100027D0C(0, (unint64_t *)&unk_100049140, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    v11 = (_QWORD *)swift_allocObject(v10, 8 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 3);
  }
  else
  {
    v11 = &_swiftEmptyArrayStorage;
  }
  v14 = (unint64_t)(v11 + 4);
  v15 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= v15 + 8 * v8)
      memmove(v11 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v15 >= v14 + 8 * v8 || v14 >= v15 + 8 * v8)
  {
    sub_100027CB8(0, &qword_100049130, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, void *, uint64_t, void *))&type metadata accessor for Dictionary);
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

uint64_t sub_100025D2C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  size_t v12;
  unint64_t v13;
  unint64_t v14;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    sub_10000BBFC(0, (unint64_t *)&qword_100049150, (uint64_t (*)(uint64_t))sub_100027DF4, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    v11 = (_QWORD *)swift_allocObject(v10, 40 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v11[2] = v8;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 40);
  }
  else
  {
    v11 = &_swiftEmptyArrayStorage;
  }
  v13 = (unint64_t)(v11 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= v14 + 40 * v8)
      memmove(v11 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v14 >= v13 + 40 * v8 || v13 >= v14 + 40 * v8)
  {
    sub_100027DF4();
    swift_arrayInitWithCopy(v11 + 4);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100025EDC(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_100026360(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v23 = *v3;
  *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

Swift::Int sub_100026088(uint64_t a1)
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
  sub_100027C5C();
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

void sub_100026360(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD v29[9];

  v5 = v4;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_100026088(v11);
  }
  else
  {
    if (v10 > v9)
    {
      sub_1000264F8();
      goto LABEL_22;
    }
    sub_1000266A4(v11);
  }
  v12 = *v4;
  Hasher.init(_seed:)(v29, *(_QWORD *)(*v4 + 40));
  String.hash(into:)(v29, a1, a2);
  v13 = Hasher._finalize()();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a3 = v13 & ~v14;
  v15 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v16 = *(_QWORD *)(v12 + 48);
    v17 = (_QWORD *)(v16 + 16 * a3);
    v18 = v17[1];
    v19 = *v17 == a1 && v18 == a2;
    if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0) & 1) != 0)
    {
LABEL_21:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }
    else
    {
      v20 = ~v14;
      while (1)
      {
        a3 = (a3 + 1) & v20;
        if (((*(_QWORD *)(v15 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v21 = (_QWORD *)(v16 + 16 * a3);
        v22 = v21[1];
        v23 = *v21 == a1 && v22 == a2;
        if (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v21, v22, a1, a2, 0) & 1) != 0)
          goto LABEL_21;
      }
    }
  }
LABEL_22:
  v24 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v25 = (_QWORD *)(*(_QWORD *)(v24 + 48) + 16 * a3);
  *v25 = a1;
  v25[1] = a2;
  v26 = *(_QWORD *)(v24 + 16);
  v27 = __OFADD__(v26, 1);
  v28 = v26 + 1;
  if (v27)
    __break(1u);
  else
    *(_QWORD *)(v24 + 16) = v28;
}

void sub_1000264F8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
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
  sub_100027C5C();
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    swift_release(v2);
    *v1 = v4;
    return;
  }
  v5 = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)v5 >= v2 + 56 + 8 * v7)
    memmove(v5, (const void *)(v2 + 56), 8 * v7);
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
    swift_bridgeObjectRetain(v18);
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
}

Swift::Int sub_1000266A4(uint64_t a1)
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
  sub_100027C5C();
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

_QWORD *sub_10002694C(uint64_t a1)
{
  int64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v18[184];
  _QWORD *v19;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    v19 = &_swiftEmptyArrayStorage;
    sub_1000259CC(0, v1, 0);
    v4 = *(_QWORD *)(type metadata accessor for Stock(0) - 8);
    v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v6 = *(_QWORD *)(v4 + 72);
    sub_10000BBFC(0, &qword_100049108, (uint64_t (*)(uint64_t))sub_100027BF4, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    v8 = v7;
    do
    {
      inited = swift_initStackObject(v8, v18);
      *(_OWORD *)(inited + 16) = xmmword_100037BD0;
      *(_QWORD *)(inited + 32) = 0x6C6F626D7973;
      *(_QWORD *)(inited + 40) = 0xE600000000000000;
      *(_QWORD *)(inited + 48) = Stock.symbol.getter();
      *(_QWORD *)(inited + 56) = v10;
      *(_QWORD *)(inited + 72) = &type metadata for String;
      *(_QWORD *)(inited + 80) = 0x4E796E61706D6F63;
      *(_QWORD *)(inited + 88) = 0xEB00000000656D61;
      *(_QWORD *)(inited + 96) = Stock.name.getter();
      *(_QWORD *)(inited + 104) = v11;
      *(_QWORD *)(inited + 120) = &type metadata for String;
      *(_QWORD *)(inited + 128) = 0x65676E6168637865;
      *(_QWORD *)(inited + 136) = 0xE800000000000000;
      v12 = Stock.exchange.getter();
      *(_QWORD *)(inited + 168) = &type metadata for String;
      *(_QWORD *)(inited + 144) = v12;
      *(_QWORD *)(inited + 152) = v13;
      v14 = sub_100021B1C(inited);
      v2 = v19;
      if ((swift_isUniquelyReferenced_nonNull_native(v19) & 1) == 0)
      {
        sub_1000259CC(0, v2[2] + 1, 1);
        v2 = v19;
      }
      v16 = v2[2];
      v15 = v2[3];
      if (v16 >= v15 >> 1)
      {
        sub_1000259CC(v15 > 1, v16 + 1, 1);
        v2 = v19;
      }
      v2[2] = v16 + 1;
      v2[v16 + 4] = v14;
      v5 += v6;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_100026B30(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  char *v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[32];
  char *v39;

  v3 = v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
    return (uint64_t)&_swiftEmptyArrayStorage;
  v6 = a1;
  v7 = a1 + 32;
  swift_bridgeObjectRetain(a1);
  v8 = 0;
  v39 = (char *)&_swiftEmptyArrayStorage;
  v33 = a2 + 7;
  v9 = (char *)&type metadata for Any + 8;
  v34 = a2;
  v35 = v7;
  while (1)
  {
    v10 = *(_QWORD *)(v7 + 8 * v8);
    if (!*(_QWORD *)(v10 + 16))
      goto LABEL_4;
    swift_bridgeObjectRetain(*(_QWORD *)(v7 + 8 * v8));
    v11 = sub_10002586C(0x6C6F626D7973, 0xE600000000000000);
    if ((v12 & 1) != 0)
    {
      sub_1000077AC(*(_QWORD *)(v10 + 56) + 32 * v11, (uint64_t)v38);
      if ((swift_dynamicCast(&v36, v38, v9, &type metadata for String, 6) & 1) != 0)
        break;
    }
    swift_bridgeObjectRelease(v10);
LABEL_4:
    if (++v8 == v4)
    {
      swift_bridgeObjectRelease(v6);
      return (uint64_t)v39;
    }
  }
  v14 = v36;
  v13 = v37;
  v15 = a2[2];
  if (!v15)
    goto LABEL_15;
  v16 = a2[4];
  v17 = a2[5];
  if (v16 == v36 && v17 == v37
    || (result = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v17, v36, v37, 0), (result & 1) != 0))
  {
    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease(v13);
LABEL_13:
    v7 = v35;
    v9 = (char *)&type metadata for Any + 8;
    goto LABEL_4;
  }
  if (v15 == 1)
  {
LABEL_15:
    swift_bridgeObjectRelease(v10);
LABEL_16:
    v7 = v35;
    v19 = v39;
    if ((swift_isUniquelyReferenced_nonNull_native(v39) & 1) == 0)
      v19 = sub_100019EC0(0, *((_QWORD *)v19 + 2) + 1, 1, v19);
    v20 = v19;
    v21 = *((_QWORD *)v19 + 2);
    v39 = v20;
    v22 = *((_QWORD *)v20 + 3);
    if (v21 >= v22 >> 1)
      v39 = sub_100019EC0((char *)(v22 > 1), v21 + 1, 1, v39);
    v23 = v39;
    *((_QWORD *)v39 + 2) = v21 + 1;
    v24 = &v23[16 * v21];
    *((_QWORD *)v24 + 4) = v14;
    *((_QWORD *)v24 + 5) = v13;
    a2 = v34;
    v9 = (char *)&type metadata for Any + 8;
    goto LABEL_4;
  }
  v31 = v6;
  v32 = v3;
  v25 = v33;
  v26 = 1;
  while (1)
  {
    v27 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    v28 = *(v25 - 1);
    v29 = *v25;
    v30 = v28 == v14 && v29 == v13;
    if (v30 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v29, v14, v13, 0), (result & 1) != 0))
    {
      swift_bridgeObjectRelease(v10);
      swift_bridgeObjectRelease(v13);
      v6 = v31;
      v3 = v32;
      a2 = v34;
      goto LABEL_13;
    }
    v25 += 2;
    ++v26;
    if (v27 == v15)
    {
      swift_bridgeObjectRelease(v10);
      v6 = v31;
      v3 = v32;
      goto LABEL_16;
    }
  }
  __break(1u);
  return result;
}

_QWORD *sub_100026DAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  char *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD v30[2];
  char *v31;
  char *v32;
  _QWORD *v33;

  sub_10000BBFC(0, &qword_100048128, (uint64_t (*)(uint64_t))&type metadata accessor for Stock, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v5);
  v7 = (char *)v30 - v6;
  v8 = type metadata accessor for Stock(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = a1;
  v32 = (char *)v30 - v14;
  v15 = *(_QWORD *)(a1 + 16);
  if (v15)
  {
    v30[1] = v2;
    v30[0] = swift_bridgeObjectRetain(v13);
    v16 = (uint64_t *)(v30[0] + 40);
    v33 = &_swiftEmptyArrayStorage;
    v31 = v12;
    while (1)
    {
      if (*(_QWORD *)(a2 + 16))
      {
        v17 = *(v16 - 1);
        v18 = *v16;
        swift_bridgeObjectRetain(*v16);
        v19 = sub_10002586C(v17, v18);
        if ((v20 & 1) != 0)
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v7, *(_QWORD *)(a2 + 56) + *(_QWORD *)(v9 + 72) * v19, v8);
          v21 = 0;
        }
        else
        {
          v21 = 1;
        }
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, v21, 1, v8);
        swift_bridgeObjectRelease(v18);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
        {
          v22 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
          v23 = v32;
          v22(v32, v7, v8);
          v22(v12, v23, v8);
          if ((swift_isUniquelyReferenced_nonNull_native(v33) & 1) != 0)
            v24 = (unint64_t)v33;
          else
            v24 = sub_10001A104(0, v33[2] + 1, 1, (unint64_t)v33);
          v26 = *(_QWORD *)(v24 + 16);
          v25 = *(_QWORD *)(v24 + 24);
          if (v26 >= v25 >> 1)
            v24 = sub_10001A104(v25 > 1, v26 + 1, 1, v24);
          *(_QWORD *)(v24 + 16) = v26 + 1;
          v27 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
          v33 = (_QWORD *)v24;
          v28 = v24 + v27 + *(_QWORD *)(v9 + 72) * v26;
          v12 = v31;
          v22((char *)v28, v31, v8);
          goto LABEL_5;
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
      }
      sub_10000F608((uint64_t)v7, (uint64_t)&qword_100048128, (uint64_t)&type metadata accessor for Stock, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000BBFC);
LABEL_5:
      v16 += 2;
      if (!--v15)
      {
        swift_bridgeObjectRelease(v30[0]);
        return v33;
      }
    }
  }
  return &_swiftEmptyArrayStorage;
}

char *sub_100027078(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE v15[32];
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (char *)&_swiftEmptyArrayStorage;
  swift_bridgeObjectRetain(a1);
  v3 = 0;
  v4 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    v6 = *(_QWORD *)(a1 + 8 * v3 + 32);
    v7 = *(_QWORD *)(v6 + 16);
    swift_bridgeObjectRetain(v6);
    if (!v7
      || (v8 = sub_10002586C(0x6C6F626D7973, 0xE600000000000000), (v9 & 1) == 0)
      || (sub_1000077AC(*(_QWORD *)(v6 + 56) + 32 * v8, (uint64_t)v15),
          (swift_dynamicCast(&v16, v15, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0))
    {
      v16 = 0;
      v17 = 0;
    }
    swift_bridgeObjectRelease(v6);
    v10 = v17;
    if (v17)
    {
      v11 = v16;
      if ((swift_isUniquelyReferenced_nonNull_native(v4) & 1) == 0)
        v4 = sub_100019EC0(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
      v13 = *((_QWORD *)v4 + 2);
      v12 = *((_QWORD *)v4 + 3);
      if (v13 >= v12 >> 1)
        v4 = sub_100019EC0((char *)(v12 > 1), v13 + 1, 1, v4);
      *((_QWORD *)v4 + 2) = v13 + 1;
      v5 = &v4[16 * v13];
      *((_QWORD *)v5 + 4) = v11;
      *((_QWORD *)v5 + 5) = v10;
    }
    ++v3;
  }
  while (v1 != v3);
  swift_bridgeObjectRelease(a1);
  return v4;
}

uint64_t sub_1000271EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7[2];
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = Set.init(minimumCapacity:)(v2, &type metadata for String, &protocol witness table for String);
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain(*v4);
      sub_100025EDC(v7, v5, v6);
      swift_bridgeObjectRelease(v7[1]);
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void sub_100027280(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _QWORD v23[3];
  _BYTE v24[8];
  uint64_t v25;
  uint64_t v26;

  v3 = v2;
  if (a2)
  {
    swift_errorRetain(a2);
    if (qword_100047898 != -1)
      swift_once(&qword_100047898, sub_100025634);
    v6 = type metadata accessor for Logger(0);
    sub_100025750(v6, (uint64_t)qword_10004A9F8);
    swift_errorRetain(a2);
    v7 = swift_errorRetain(a2);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.error.getter(v8);
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(12, -1);
      v11 = swift_slowAlloc(32, -1);
      v25 = v11;
      *(_DWORD *)v10 = 136315138;
      swift_getErrorValue(a2, v24, v23);
      v12 = Error.localizedDescription.getter(v23[1], v23[2]);
      v14 = v13;
      v22 = sub_1000076BC(v12, v13, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, v23, v10 + 4);
      swift_bridgeObjectRelease(v14);
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "session activation did fail with error: %s", v10, 0xCu);
      swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v11, -1, -1);
      swift_slowDealloc(v10, -1, -1);

      swift_errorRelease(a2);
      if (a1 != 2)
        return;
    }
    else
    {
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      swift_errorRelease(a2);

      if (a1 != 2)
        return;
    }
    goto LABEL_12;
  }
  if (qword_100047898 != -1)
    swift_once(&qword_100047898, sub_100025634);
  v15 = type metadata accessor for Logger(0);
  v16 = sub_100025750(v15, (uint64_t)qword_10004A9F8);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v19 = 134217984;
    v25 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v19 + 4);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "session activation did complete with state: %ld", v19, 0xCu);
    swift_slowDealloc(v19, -1, -1);
  }

  if (a1 == 2)
  {
LABEL_12:
    v20 = swift_allocObject(&unk_100043200, 24, 7);
    *(_QWORD *)(v20 + 16) = v3;
    v21 = v3;
    asyncMain(block:)(sub_100027E48, v20);
    swift_release(v20);
  }
}

uint64_t sub_100027590(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  _OWORD v22[2];

  if (qword_100047898 != -1)
    swift_once(&qword_100047898, sub_100025634);
  v2 = type metadata accessor for Logger(0);
  sub_100025750(v2, (uint64_t)qword_10004A9F8);
  v3 = swift_bridgeObjectRetain_n(a1, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    *(_QWORD *)&v22[0] = v7;
    *(_DWORD *)v6 = 136315138;
    swift_bridgeObjectRetain(a1);
    v9 = Dictionary.description.getter(v8, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
    v11 = v10;
    swift_bridgeObjectRelease(a1);
    v21 = sub_1000076BC(v9, v11, (uint64_t *)v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, v22, v6 + 4);
    swift_bridgeObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v11);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "session did receive message: %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    if (!*(_QWORD *)(a1 + 16))
      goto LABEL_11;
  }
  else
  {

    swift_bridgeObjectRelease_n(a1, 2);
    if (!*(_QWORD *)(a1 + 16))
    {
LABEL_11:
      memset(v22, 0, sizeof(v22));
      return sub_10000F608((uint64_t)v22, (uint64_t)&qword_100047EC0, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000FD20);
    }
  }
  v12 = sub_10002586C(0xD000000000000021, 0x80000001000368E0);
  if ((v13 & 1) == 0)
    goto LABEL_11;
  sub_1000077AC(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v22);
  v14 = sub_10000F608((uint64_t)v22, (uint64_t)&qword_100047EC0, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10000FD20);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "forcing sync in response to message", v17, 2u);
    swift_slowDealloc(v17, -1, -1);
  }

  *(_QWORD *)&v22[0] = 1668184435;
  *((_QWORD *)&v22[0] + 1) = 0xE400000000000000;
  __chkstk_darwin(v18);
  v19 = PromiseDeduper.promise(key:createBlock:)(v22, sub_100027EF8);
  swift_release(v19);
  return swift_bridgeObjectRelease(*((_QWORD *)&v22[0] + 1));
}

void sub_1000278E8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;

  if (qword_100047898 != -1)
    swift_once(&qword_100047898, sub_100025634);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100025750(v2, (uint64_t)qword_10004A9F8);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "did receive watch-wake notification", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  if (a1)
  {
    v7 = a1;
    sub_1000245F0();

  }
}

void sub_1000279EC(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  if (qword_100047898 != -1)
    swift_once(&qword_100047898, sub_100025634);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100025750(v2, (uint64_t)qword_10004A9F8);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "did receive preferences-changed notification", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  if (a1)
  {
    v7 = a1;
    v10 = 1668184435;
    v11 = 0xE400000000000000;
    __chkstk_darwin(v7);
    v8 = PromiseDeduper.promise(key:createBlock:)(&v10, sub_100027B3C);
    swift_release(v8);
    v9 = v11;

    swift_bridgeObjectRelease(v9);
  }
}

uint64_t sub_100027B3C()
{
  uint64_t v0;

  return sub_10002227C(*(_BYTE *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100027B48()
{
  uint64_t v0;

  return sub_100022584(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100027B60()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100027B84()
{
  return sub_10002268C();
}

uint64_t sub_100027B9C(uint64_t a1)
{
  uint64_t v1;

  return sub_100023B4C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_100027BB4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 25, 7);
}

uint64_t sub_100027BD8(uint64_t *a1)
{
  uint64_t v1;

  return sub_100023C54(a1, *(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24));
}

void sub_100027BF4()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_100049110)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2(0, &type metadata for String, (char *)&type metadata for Any + 8, 0, 0);
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_100049110);
  }
}

void sub_100027C5C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_100049120)
  {
    v0 = type metadata accessor for _SetStorage(0, &type metadata for String, &protocol witness table for String);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_100049120);
  }
}

void sub_100027CB8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, void *, uint64_t, void *))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, &type metadata for String, a3, &protocol witness table for String);
    if (!v6)
      atomic_store(v5, a2);
  }
}

void sub_100027D0C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    sub_100027CB8(255, &qword_100049130, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, void *, uint64_t, void *))&type metadata accessor for Dictionary);
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_100027D80()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100027DAC(uint64_t *a1)
{
  uint64_t v1;

  return sub_100024B68(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_100027DC4()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_100027DE8()
{
  uint64_t v0;

  sub_100024D40(*(double *)(v0 + 16));
}

unint64_t sub_100027DF4()
{
  unint64_t result;
  void *v1;

  result = qword_100049158;
  if (!qword_100049158)
  {
    v1 = &protocol descriptor for Groupable;
    result = swift_getExistentialTypeMetadata(1, 0, 1, &v1);
    atomic_store(result, (unint64_t *)&qword_100049158);
  }
  return result;
}

void sub_100027E48()
{
  uint64_t v0;

  sub_100025204(*(_QWORD *)(v0 + 16));
}

void sub_100027E50(uint64_t a1)
{
  uint64_t v2;
  unint64_t TupleTypeMetadata2;
  uint64_t v4;

  if (!qword_100049160)
  {
    sub_100005D68(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2(a1, &type metadata for String, v2, 0, 0);
    if (!v4)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_100049160);
  }
}

uint64_t sub_100027EB4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_QWORD *sub_100027F04@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
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
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *result;
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
  _QWORD *v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(_QWORD, _QWORD, _QWORD);
  char *v88;
  uint64_t v89;
  uint64_t v90;
  void (*v91)(_QWORD, _QWORD, _QWORD);
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  void (*v110)(_QWORD, _QWORD, _QWORD);
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void (*v116)(_QWORD, _QWORD, _QWORD);
  char *v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  void (*v121)(_QWORD, _QWORD, _QWORD);
  uint64_t v122;
  char *v123;
  char *v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  char *v138;
  uint64_t v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  void (*v148)(_QWORD, _QWORD, _QWORD);
  char *v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void (*v157)(_QWORD, _QWORD, _QWORD);
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void (*v166)(_QWORD, _QWORD, _QWORD);
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  _QWORD *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  char *v203;
  uint64_t v204;
  uint64_t v205;
  char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  char *v222;
  uint64_t v223;
  uint64_t v224;
  void (*v225)(_QWORD, _QWORD, _QWORD);
  char *v226;
  char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  char *v235;
  void (*v236)(_QWORD, _QWORD, _QWORD);
  uint64_t v237;
  char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  char *v244;
  uint64_t v245;
  void (*v246)(_QWORD, _QWORD, _QWORD);
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  void (*v252)(_QWORD, _QWORD, _QWORD);
  char *v253;
  uint64_t v254;
  char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  _QWORD *v282;
  uint64_t v283;
  uint64_t v284;
  char *v285;
  uint64_t v286;
  char *v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  char *v291;
  uint64_t v292;
  uint64_t v293;
  _QWORD *v294;
  uint64_t v295;
  uint64_t v296;
  char *v297;
  uint64_t v298;
  void (*v299)(_QWORD, _QWORD, _QWORD);
  char *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  char *v309;
  uint64_t v310;
  uint64_t v311;
  void (*v312)(_QWORD, _QWORD, _QWORD);
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  unint64_t v323;
  uint64_t ObjectType;
  _QWORD *v325;
  unint64_t v326;
  uint64_t v327;
  void (*v328)(_QWORD, _QWORD);
  uint64_t v329;
  char v330;
  _BYTE *v331;
  void (*v332)(_QWORD);
  uint64_t v333;
  char *v334;
  uint64_t v335;
  uint64_t v336;
  int64_t v337;
  void **v338;
  int64_t v339;
  int v340;
  int v341;
  char v342;
  uint64_t v343;
  _QWORD *v344;
  char *v345;
  uint64_t v346;
  unint64_t v347;
  int64_t v348;
  uint64_t v349;
  char v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  int64_t v354;
  unint64_t *v355;
  uint64_t *v356;
  uint64_t v357;
  uint64_t v358;
  unint64_t v359;
  unint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  int64_t v364;
  unint64_t *v365;
  uint64_t *v366;
  uint64_t v367;
  uint64_t v368;
  unint64_t v369;
  unint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  int64_t v374;
  unint64_t *v375;
  uint64_t *v376;
  uint64_t v377;
  uint64_t v378;
  unint64_t v379;
  unint64_t v380;
  _QWORD *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  char v386;
  _BYTE *v387;
  _QWORD *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  _QWORD *v395;
  uint64_t v396;
  uint64_t v397;
  char *v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  _QWORD *v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  char *v411;
  uint64_t v412;
  int64_t v413;
  uint64_t v414;
  uint64_t v415;
  char *v416;
  uint64_t v417;
  uint64_t v418;
  unint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  char *v423;
  char *v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  _QWORD *v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  _QWORD *v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  char *v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  char *v452;
  void (*v453)(_QWORD, _QWORD, _QWORD);
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  _QWORD *v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  void (*v472)(_QWORD, _QWORD, _QWORD);
  uint64_t v473;
  _QWORD *v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  void (*v485)(_QWORD, _QWORD, _QWORD);
  uint64_t v486;
  _QWORD *v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  _QWORD *v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  void (*v505)(_QWORD, _QWORD, _QWORD);
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  void (*v511)(_QWORD, _QWORD, _QWORD);
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  void (*v522)(_QWORD, _QWORD, _QWORD);
  uint64_t v523;
  uint64_t v524;
  _QWORD *v525;
  uint64_t v526;
  uint64_t v527;
  char *v528;
  uint64_t v529;
  uint64_t v530;
  char *v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  _QWORD *v536;
  uint64_t v537;
  uint64_t v538;
  char *v539;
  void (*v540)(_QWORD, _QWORD, _QWORD);
  char *v541;
  uint64_t v542;
  uint64_t v543;
  void (*v544)(_QWORD, _QWORD, _QWORD);
  char *v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  uint64_t v552;
  uint64_t v553;
  char *v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  void (*v564)(_QWORD, _QWORD, _QWORD);
  char *v565;
  uint64_t v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  char *v572;
  uint64_t v573;
  uint64_t v574;
  uint64_t v575;
  uint64_t v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  uint64_t v580;
  uint64_t refreshed;
  char *v582;
  uint64_t v583;
  _QWORD *v584;
  _QWORD *v585;
  uint64_t v586;
  char *v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  uint64_t v591;
  uint64_t v592;
  char *v593;
  uint64_t v594;
  uint64_t v595;
  char *v596;
  uint64_t v597;
  uint64_t v598;
  char *v599;
  uint64_t v600;
  uint64_t v601;
  char *v602;
  uint64_t v603;
  uint64_t v604;
  void (*v605)(_QWORD, _QWORD, _QWORD);
  char *v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  uint64_t v614;
  uint64_t v615;
  uint64_t v616;
  void (*v617)(_QWORD, _QWORD, _QWORD);
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  uint64_t v621;
  uint64_t v622;
  uint64_t v623;
  uint64_t v624;
  uint64_t v625;
  void (*v626)(_QWORD, _QWORD, _QWORD);
  char *v627;
  uint64_t v628;
  uint64_t v629;
  uint64_t v630;
  uint64_t v631;
  uint64_t v632;
  uint64_t v633;
  char *v634;
  uint64_t v635;
  uint64_t v636;
  uint64_t v637;
  uint64_t v638;
  uint64_t v639;
  uint64_t v640;
  uint64_t v641;
  uint64_t v642;
  char *v643;
  uint64_t v644;
  uint64_t v645;
  uint64_t v646;
  uint64_t v647;
  uint64_t v648;
  uint64_t v649;
  char *v650;
  char *v651;
  uint64_t v652;
  uint64_t v653;
  uint64_t v654;
  uint64_t v655;
  _QWORD *v656;
  uint64_t v657;
  uint64_t v658;
  uint64_t v659;
  uint64_t v660;
  uint64_t v661;
  uint64_t v662;
  uint64_t v663;
  uint64_t v664;
  char *v665;
  uint64_t v666;
  char *v667;
  uint64_t v668;
  uint64_t v669;
  uint64_t v670;
  uint64_t v671;
  uint64_t v672;
  _QWORD *v673;
  uint64_t v674;
  uint64_t v675;
  char *v676;
  uint64_t v677;
  char *v678;
  uint64_t v679;
  void (*v680)(_QWORD, _QWORD, _QWORD);
  uint64_t v681;
  uint64_t v682;
  uint64_t v683;
  uint64_t v684;
  uint64_t v685;
  uint64_t v686;
  char *v687;
  char *v688;
  uint64_t v689;
  uint64_t v690;
  uint64_t v691;
  uint64_t v692;
  uint64_t v693;
  uint64_t v694;
  uint64_t v695;
  _DWORD *v696;
  uint64_t v697;
  _QWORD *v698;
  char *v699;
  uint64_t v700;
  uint64_t v701;
  void (*v702)(_QWORD, _QWORD, _QWORD);
  void (*v703)(_QWORD, _QWORD, _QWORD);
  uint64_t v704;
  uint64_t v705;
  char *v706;
  char *v707;
  uint64_t v708;
  char *v709;
  uint64_t v710;
  char *v711;
  uint64_t v712;
  uint64_t v713;
  void (*v714)(_QWORD, _QWORD, _QWORD);
  char *v715;
  uint64_t v716;
  uint64_t v717;
  char *v718;
  uint64_t v719;
  char *v720;
  uint64_t v721;
  char *v722;
  uint64_t v723;
  uint64_t v724;
  uint64_t v725;
  uint64_t v726;
  char *v727;
  _QWORD *v728;
  uint64_t v729;
  uint64_t v730;
  void (*v731)(_QWORD, _QWORD, _QWORD);
  uint64_t v732;
  char *v733;
  uint64_t v734;
  uint64_t v735;
  uint64_t v736;
  uint64_t v737;
  char *v738;
  uint64_t v739;
  uint64_t v740;
  char *v741;
  uint64_t v742;
  void (*v743)(_QWORD, _QWORD, _QWORD);
  uint64_t v744;
  uint64_t v745;
  char *v746;
  char *v747;
  _QWORD *v748;
  void (*v749)(_QWORD, _QWORD, _QWORD);
  uint64_t v750;
  char *v751;
  uint64_t v752;
  uint64_t v753;
  uint64_t v754;
  uint64_t v755;
  uint64_t v756;
  uint64_t v757;
  _QWORD *v758;
  char *v759;
  char *v760;
  uint64_t v761;
  uint64_t v762;
  void (*v763)(_QWORD, _QWORD, _QWORD);
  uint64_t v764;
  char *v765;
  uint64_t v766;
  char *v767;
  uint64_t v768;
  char *v769;
  uint64_t v770;
  uint64_t v771;
  uint64_t v772;
  uint64_t v773;
  char *v774;
  uint64_t v775;
  uint64_t v776;
  uint64_t v777;
  uint64_t v778;
  uint64_t v779;
  char *v780;
  char *v781;
  _QWORD *v782;
  uint64_t v783;
  uint64_t v784;
  char *v785;
  uint64_t v786;
  void (*v787)(_QWORD, _QWORD, _QWORD);
  char *v788;
  uint64_t v789;
  uint64_t v790;
  char *v791;
  uint64_t v792;
  char *v793;
  uint64_t v794;
  uint64_t v795;
  uint64_t v796;
  uint64_t v797;
  char *v798;
  _QWORD *v799;
  char *v800;
  char *v801;
  uint64_t v802;
  uint64_t v803;
  uint64_t v804;
  uint64_t v805;
  uint64_t v806;
  uint64_t v807;
  void (*v808)(_QWORD, _QWORD, _QWORD);
  uint64_t v809;
  uint64_t v810;
  char *v811;
  char *v812;
  char *v813;
  uint64_t v814;
  uint64_t v815;
  char *v816;
  uint64_t v817;
  uint64_t v818;
  uint64_t v819;
  _QWORD *v820;
  uint64_t v821;
  uint64_t v822;
  uint64_t v823;
  uint64_t v824;
  char *v825;
  uint64_t v826;
  uint64_t v827;
  uint64_t v828;
  uint64_t v829;
  char *v830;
  _QWORD *v831;
  uint64_t v832;
  uint64_t v833;
  char *v834;
  void (*v835)(_QWORD, _QWORD, _QWORD);
  char *v836;
  uint64_t v837;
  void (*v838)(_QWORD, _QWORD, _QWORD);
  uint64_t v839;
  char *v840;
  uint64_t v841;
  char *v842;
  uint64_t v843;
  char *v844;
  uint64_t v845;
  _QWORD *v846;
  char *v847;
  uint64_t v848;
  void (*v849)(_QWORD, _QWORD, _QWORD);
  uint64_t v850;
  char *v851;
  uint64_t v852;
  uint64_t v853;
  uint64_t v854;
  uint64_t v855;
  _QWORD *v856;
  char *v857;
  char *v858;
  uint64_t v859;
  uint64_t v860;
  char *v861;
  uint64_t v862;
  uint64_t v863;
  uint64_t v864;
  void (*v865)(_QWORD, _QWORD, _QWORD);
  uint64_t v866;
  uint64_t v867;
  uint64_t v868;
  char *v869;
  uint64_t v870;
  uint64_t v871;
  void (*v872)(_QWORD, _QWORD, _QWORD);
  char *v873;
  char *v874;
  uint64_t v875;
  char *v876;
  char *v877;
  char *v878;
  char *v879;
  uint64_t v880;
  uint64_t v881;
  char *v882;
  uint64_t v883;
  uint64_t v884;
  uint64_t v885;
  char *v886;
  char *v887;
  uint64_t v888;
  uint64_t v889;
  char *v890;
  uint64_t v891;
  uint64_t v892;
  uint64_t v893;
  char *v894;
  _QWORD *v895;
  char *v896;
  char *v897;
  uint64_t v898;
  uint64_t v899;
  uint64_t v900;
  uint64_t v901;
  uint64_t v902;
  uint64_t v903;
  uint64_t v904;
  uint64_t v905;
  void (*v906)(_QWORD, _QWORD, _QWORD);
  uint64_t v907;
  char *v908;
  uint64_t v909;
  char *v910;
  _QWORD *v911;
  char *v912;
  uint64_t v913;
  uint64_t v914;
  void (*v915)(_QWORD, _QWORD, _QWORD);
  char *v916;
  char *v917;
  uint64_t v918;
  void (*v919)(_QWORD, _QWORD, _QWORD);
  uint64_t v920;
  char *v921;
  uint64_t v922;
  char *v923;
  uint64_t v924;
  uint64_t v925;
  uint64_t v926;
  uint64_t v927;
  uint64_t v928;
  char *v929;
  _QWORD *v930;
  uint64_t v931;
  char *v932;
  uint64_t v933;
  char *v934;
  uint64_t v935;
  uint64_t v936;
  uint64_t v937;
  void (*v938)(_QWORD, _QWORD, _QWORD);
  uint64_t v939;
  uint64_t v940;
  uint64_t v941;
  char *v942;
  uint64_t v943;
  char *v944;
  _QWORD *v945;
  uint64_t v946;
  uint64_t v947;
  uint64_t v948;
  uint64_t v949;
  uint64_t v950;
  uint64_t v951;
  uint64_t v952;
  uint64_t v953;
  uint64_t v954;
  uint64_t v955;
  uint64_t v956;
  uint64_t v957;
  _QWORD *v958;
  uint64_t v959;
  uint64_t v960;
  char *v961;
  uint64_t v962;
  uint64_t v963;
  uint64_t v964;
  uint64_t v965;
  uint64_t v966;
  uint64_t v967;
  uint64_t v968;
  uint64_t v969;
  uint64_t v970;
  char *v971;
  uint64_t v972;
  uint64_t v973;
  uint64_t v974;
  char *v975;
  uint64_t v976;
  uint64_t v977;
  void (*v978)(_QWORD, _QWORD, _QWORD);
  char *v979;
  uint64_t v980;
  void (*v981)(_QWORD, _QWORD, _QWORD);
  uint64_t v982;
  uint64_t v983;
  uint64_t v984;
  uint64_t v985;
  uint64_t v986;
  uint64_t v987;
  uint64_t v988;
  char *v989;
  uint64_t v990;
  uint64_t v991;
  uint64_t v992;
  uint64_t v993;
  uint64_t v994;
  uint64_t v995;
  uint64_t v996;
  _QWORD *v997;
  uint64_t v998;
  uint64_t v999;
  uint64_t v1000;
  char *v1001;
  uint64_t v1002;
  uint64_t v1003;
  void (*v1004)(_QWORD, _QWORD, _QWORD);
  uint64_t v1005;
  char *v1006;
  uint64_t v1007;
  uint64_t v1008;
  _QWORD *v1009;
  uint64_t v1010;
  uint64_t v1011;
  uint64_t v1012;
  uint64_t v1013;
  uint64_t v1014;
  char *v1015;
  uint64_t v1016;
  uint64_t v1017;
  uint64_t v1018;
  uint64_t v1019;
  uint64_t v1020;
  uint64_t v1021;
  char *v1022;
  uint64_t v1023;
  _QWORD *v1024;
  _QWORD *v1025;
  uint64_t v1026;
  uint64_t v1027;
  uint64_t v1028;
  char *v1029;
  uint64_t v1030;
  uint64_t v1031;
  void (*v1032)(_QWORD, _QWORD, _QWORD);
  char *v1033;
  uint64_t v1034;
  void (*v1035)(_QWORD, _QWORD, _QWORD);
  uint64_t v1036;
  uint64_t v1037;
  uint64_t v1038;
  uint64_t v1039;
  uint64_t v1040;
  uint64_t v1041;
  char *v1042;
  char *v1043;
  uint64_t v1044;
  uint64_t v1045;
  uint64_t v1046;
  _QWORD *v1047;
  uint64_t v1048;
  uint64_t v1049;
  uint64_t v1050;
  uint64_t v1051;
  uint64_t v1052;
  uint64_t v1053;
  uint64_t v1054;
  uint64_t v1055;
  uint64_t v1056;
  uint64_t v1057;
  uint64_t v1058;
  uint64_t v1059;
  uint64_t v1060;
  uint64_t v1061;
  uint64_t v1062;
  uint64_t v1063;
  uint64_t v1064;
  char *v1065;
  uint64_t v1066;
  uint64_t v1067;
  void (*v1068)(_QWORD, _QWORD, _QWORD);
  uint64_t v1069;
  uint64_t v1070;
  uint64_t v1071;
  uint64_t v1072;
  uint64_t v1073;
  char *v1074;
  uint64_t v1075;
  void (*v1076)(_QWORD, _QWORD, _QWORD);
  char *v1077;
  uint64_t v1078;
  uint64_t v1079;
  uint64_t v1080;
  uint64_t v1081;
  uint64_t v1082;
  uint64_t v1083;
  uint64_t v1084;
  uint64_t v1085;
  uint64_t v1086;
  uint64_t v1087;
  uint64_t v1088;
  uint64_t v1089;
  uint64_t v1090;
  uint64_t v1091;
  char *v1092;
  uint64_t v1093;
  void (*v1094)(_QWORD, _QWORD, _QWORD);
  char *v1095;
  uint64_t v1096;
  uint64_t v1097;
  uint64_t v1098;
  uint64_t v1099;
  uint64_t v1100;
  _QWORD *v1101;
  uint64_t v1102;
  uint64_t v1103;
  uint64_t v1104;
  uint64_t v1105;
  char *v1106;
  char *v1107;
  uint64_t v1108;
  uint64_t v1109;
  uint64_t v1110;
  uint64_t v1111;
  uint64_t v1112;
  uint64_t v1113;
  char *v1114;
  uint64_t v1115;
  void (*v1116)(_QWORD, _QWORD, _QWORD);
  char *v1117;
  uint64_t v1118;
  uint64_t v1119;
  void (*v1120)(_QWORD, _QWORD, _QWORD);
  uint64_t v1121;
  uint64_t v1122;
  uint64_t v1123;
  uint64_t v1124;
  uint64_t v1125;
  char *v1126;
  char *v1127;
  uint64_t v1128;
  uint64_t v1129;
  uint64_t v1130;
  char *v1131;
  char *v1132;
  char *v1133;
  uint64_t v1134;
  uint64_t v1135;
  uint64_t v1136;
  uint64_t v1137;
  _QWORD *v1138;
  _QWORD *v1139;
  uint64_t v1140;
  uint64_t v1141;
  uint64_t v1142;
  uint64_t v1143;
  uint64_t v1144;
  void (*v1145)(_QWORD, _QWORD, _QWORD);
  void (*v1146)(_QWORD, _QWORD, _QWORD);
  uint64_t v1147;
  uint64_t v1148;
  uint64_t v1149;
  uint64_t v1150;
  char *v1151;
  uint64_t v1152;
  char *v1153;
  uint64_t v1154;
  uint64_t v1155;
  uint64_t v1156;
  void (*v1157)(_QWORD, _QWORD, _QWORD);
  uint64_t v1158;
  void (*v1159)(_QWORD, _QWORD, _QWORD);
  uint64_t v1160;
  uint64_t v1161;
  char *v1162;
  uint64_t v1163;
  uint64_t v1164;
  _QWORD *v1165;
  uint64_t v1166;
  uint64_t v1167;
  uint64_t v1168;
  uint64_t v1169;
  void (*v1170)(_QWORD, _QWORD, _QWORD);
  uint64_t v1171;
  uint64_t v1172;
  uint64_t v1173;
  uint64_t v1174;
  char *v1175;
  uint64_t v1176;
  uint64_t v1177;
  uint64_t v1178;
  char *v1179;
  _QWORD *v1180;
  uint64_t v1181;
  uint64_t v1182;
  uint64_t v1183;
  uint64_t v1184;
  uint64_t v1185;
  uint64_t v1186;
  void (*v1187)(_QWORD, _QWORD, _QWORD);
  char *v1188;
  char *v1189;
  uint64_t v1190;
  uint64_t v1191;
  void (*v1192)(_QWORD, _QWORD, _QWORD);
  uint64_t v1193;
  uint64_t v1194;
  uint64_t v1195;
  uint64_t v1196;
  uint64_t v1197;
  char *v1198;
  uint64_t v1199;
  uint64_t v1200;
  uint64_t v1201;
  _QWORD *v1202;
  _QWORD *v1203;
  uint64_t v1204;
  uint64_t v1205;
  uint64_t v1206;
  uint64_t v1207;
  uint64_t v1208;
  char *v1209;
  char *v1210;
  char *v1211;
  uint64_t v1212;
  void (*v1213)(_QWORD, _QWORD, _QWORD);
  uint64_t v1214;
  uint64_t v1215;
  uint64_t v1216;
  uint64_t v1217;
  _QWORD *v1218;
  uint64_t v1219;
  uint64_t v1220;
  uint64_t v1221;
  uint64_t v1222;
  uint64_t v1223;
  char *v1224;
  char *v1225;
  uint64_t v1226;
  uint64_t v1227;
  uint64_t v1228;
  uint64_t v1229;
  uint64_t v1230;
  uint64_t v1231;
  uint64_t v1232;
  uint64_t v1233;
  uint64_t v1234;
  uint64_t v1235;
  char *v1236;
  uint64_t v1237;
  uint64_t v1238;
  uint64_t v1239;
  uint64_t v1240;
  uint64_t v1241;
  char *v1242;
  uint64_t v1243;
  uint64_t v1244;
  void (*v1245)(_QWORD, _QWORD, _QWORD);
  char *v1246;
  uint64_t v1247;
  uint64_t v1248;
  void (*v1249)(_QWORD, _QWORD, _QWORD);
  uint64_t v1250;
  uint64_t v1251;
  uint64_t v1252;
  char *v1253;
  char *v1254;
  uint64_t v1255;
  char *v1256;
  uint64_t v1257;
  uint64_t v1258;
  char *v1259;
  char *v1260;
  uint64_t v1261;
  uint64_t v1262;
  uint64_t v1263;
  uint64_t v1264;
  uint64_t v1265;
  uint64_t v1266;
  uint64_t v1267;
  uint64_t v1268;
  void (*v1269)(_QWORD, _QWORD, _QWORD);
  uint64_t v1270;
  uint64_t v1271;
  uint64_t v1272;
  void (*v1273)(_QWORD, _QWORD, _QWORD);
  uint64_t v1274;
  uint64_t v1275;
  uint64_t v1276;
  uint64_t v1277;
  uint64_t v1278;
  void (*v1279)(_QWORD, _QWORD, _QWORD);
  char *v1280;
  uint64_t v1281;
  uint64_t v1282;
  uint64_t v1283;
  char *v1284;
  uint64_t v1285;
  uint64_t v1286;
  uint64_t v1287;
  _DWORD *v1288;
  char *v1289;
  uint64_t v1290;
  uint64_t v1291;
  uint64_t v1292;
  uint64_t v1293;
  uint64_t v1294;
  char *v1295;
  uint64_t v1296;
  uint64_t v1297;
  uint64_t v1298;
  uint64_t v1299;
  char *v1300;
  uint64_t v1301;
  _QWORD *v1302;
  _QWORD *v1303;
  uint64_t v1304;
  uint64_t v1305;
  uint64_t v1306;
  uint64_t v1307;
  uint64_t v1308;
  uint64_t v1309;
  uint64_t v1310;
  uint64_t v1311;
  char *v1312;
  uint64_t v1313;
  _QWORD *v1314;
  _QWORD *v1315;
  uint64_t v1316;
  uint64_t v1317;
  uint64_t started;
  _DWORD *v1319;
  char *v1320;
  uint64_t v1321;
  void (*v1322)(_QWORD, _QWORD, _QWORD);
  uint64_t v1323;
  uint64_t v1324;
  uint64_t v1325;
  uint64_t v1326;
  uint64_t v1327;
  _QWORD *v1328;
  _QWORD *v1329;
  uint64_t v1330;
  uint64_t v1331;
  uint64_t v1332;
  char *v1333;
  uint64_t v1334;
  void (*v1335)(_QWORD, _QWORD, _QWORD);
  char *v1336;
  uint64_t v1337;
  void (*v1338)(_QWORD, _QWORD, _QWORD);
  uint64_t v1339;
  char *v1340;
  char *v1341;
  char *v1342;
  uint64_t v1343;
  uint64_t v1344;
  uint64_t v1345;
  uint64_t v1346;
  uint64_t v1347;
  void (*v1348)(_QWORD, _QWORD, _QWORD);
  uint64_t v1349;
  uint64_t v1350;
  uint64_t v1351;
  uint64_t v1352;
  uint64_t v1353;
  uint64_t v1354;
  char *v1355;
  uint64_t v1356;
  char *v1357;
  uint64_t v1358;
  uint64_t v1359;
  char *v1360;
  uint64_t v1361;
  uint64_t v1362;
  uint64_t v1363;
  char *v1364;
  uint64_t v1365;
  uint64_t v1366;
  uint64_t v1367;
  uint64_t v1368;
  uint64_t v1369;
  char *v1370;
  uint64_t v1371;
  char *v1372;
  uint64_t v1373;
  uint64_t v1374;
  _QWORD *v1375;
  uint64_t v1376;
  uint64_t v1377;
  char *v1378;
  uint64_t v1379;
  uint64_t v1380;
  uint64_t v1381;
  uint64_t v1382;
  uint64_t v1383;
  uint64_t v1384;
  __int128 v1385;
  uint64_t v1386;
  uint64_t v1387;
  uint64_t *v1388;
  uint64_t v1389;
  uint64_t v1390;
  uint64_t v1391;
  uint64_t v1392;
  char *v1393;
  uint64_t v1394;
  uint64_t v1395;
  char *v1396;
  uint64_t v1397;
  void (*v1398)(_QWORD, _QWORD, _QWORD);
  char *v1399;
  uint64_t v1400;
  char *v1401;
  char *v1402;
  _QWORD *v1403;
  uint64_t v1404;
  _DWORD *v1405;
  char *v1406;
  uint64_t v1407;
  uint64_t v1408;
  uint64_t v1409;
  char *v1410;
  uint64_t v1411;
  uint64_t v1412;
  char *v1413;
  uint64_t v1414;
  uint64_t v1415;
  uint64_t v1416;
  uint64_t v1417;
  char *v1418;
  uint64_t v1419;
  uint64_t v1420;
  unint64_t v1421;
  unint64_t v1422;
  uint64_t v1423;
  uint64_t v1424;
  uint64_t v1425;
  __int128 v1426;
  uint64_t v1427;
  uint64_t v1428;
  _DWORD *v1429;
  _QWORD *v1430;
  uint64_t v1431;
  unint64_t v1432;
  _QWORD *v1433;
  char *v1434;
  char *v1435;
  uint64_t v1436;
  char *v1437;
  uint64_t v1438;
  uint64_t v1439;
  _QWORD *v1440;
  _BYTE *v1441;
  char *v1442;
  uint64_t v1443;
  _QWORD *v1444;
  void (*v1445)(_QWORD, _QWORD, _QWORD);
  __int128 v1446;
  uint64_t v1447;
  __int128 v1448;
  uint64_t v1449;
  uint64_t v1450;
  uint64_t v1451;
  void (*v1452)(_QWORD, _QWORD, _QWORD);
  uint64_t v1453;
  uint64_t v1454;
  __int128 v1455;
  uint64_t v1456;
  void (*v1457)(_QWORD, _QWORD, _QWORD);
  char *v1458;
  uint64_t v1459;
  char *v1460;
  uint64_t v1461;
  uint64_t v1462;
  uint64_t v1463;
  uint64_t v1464;
  char *v1465;
  __int128 v1466;
  char *v1467;
  uint64_t v1468;
  uint64_t v1469;
  char *v1470;
  uint64_t v1471;
  uint64_t v1472;
  uint64_t v1473;
  char *v1474;
  char *v1475;
  char *v1476;
  _QWORD *v1477;
  uint64_t v1478;
  uint64_t v1479;
  uint64_t v1480;
  _QWORD *v1481;
  uint64_t v1482;
  uint64_t v1483;
  _QWORD *v1484;
  uint64_t v1485;
  __int128 v1486;
  char *v1487;
  uint64_t v1488;
  unsigned int v1489;
  void (*v1490)(_QWORD);
  uint64_t v1491;
  uint64_t v1492;
  __int128 v1493;
  unsigned int v1494;
  _QWORD *v1495;
  void **v1496;
  __int128 v1497;
  _QWORD *v1498;
  uint64_t v1499;
  _QWORD v1500[2];
  uint64_t v1501;
  uint64_t v1502;

  sub_100031058(0);
  v1417 = v4;
  v1416 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v1418 = (char *)&v1383 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031520(0, (unint64_t *)&unk_100049240, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int, (uint64_t (*)(_QWORD, uint64_t, uint64_t))&type metadata accessor for Item.RangeControlType);
  v1415 = v6;
  v1414 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v1383 - v7;
  sub_1000310D0(0);
  v1412 = v9;
  v1411 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v1413 = (char *)&v1383 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031148(0);
  v1409 = v11;
  v1408 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v1410 = (char *)&v1383 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1431 = type metadata accessor for SettingsBundle(0);
  v1407 = *(_QWORD *)(v1431 - 8);
  __chkstk_darwin(v1431);
  v1406 = (char *)&v1383 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031520(0, (unint64_t *)&unk_100049268, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double, (uint64_t (*)(_QWORD, uint64_t, uint64_t))&type metadata accessor for Item.RangeControlType);
  v1467 = v14;
  v1404 = *((_QWORD *)v14 - 1);
  __chkstk_darwin(v14);
  v1405 = (_DWORD *)((char *)&v1383 - v15);
  sub_1000311C0(0);
  v1439 = v16;
  v1403 = *(_QWORD **)(v16 - 8);
  __chkstk_darwin(v16);
  v1434 = (char *)&v1383 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000318CC(0, (unint64_t *)&unk_100049280, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))&type metadata accessor for Item.ResetBehavior);
  v1401 = v18;
  v1400 = *((_QWORD *)v18 - 1);
  __chkstk_darwin(v18);
  v1402 = (char *)&v1383 - v19;
  sub_100031238(0);
  v1398 = v20;
  v1397 = *((_QWORD *)v20 - 1);
  __chkstk_darwin(v20);
  v1399 = (char *)&v1383 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000312B0(0);
  v1395 = v22;
  v1394 = *(_QWORD *)(v22 - 8);
  __chkstk_darwin(v22);
  v1396 = (char *)&v1383 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031328(0);
  v1392 = v24;
  v1391 = *(_QWORD *)(v24 - 8);
  __chkstk_darwin(v24);
  v1393 = (char *)&v1383 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1478 = type metadata accessor for DenylistDescriptor(0);
  v1477 = *(_QWORD **)(v1478 - 8);
  __chkstk_darwin(v1478);
  v1476 = (char *)&v1383 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1436 = type metadata accessor for PrivacyValidation(0);
  v1438 = *(_QWORD *)(v1436 - 8);
  v27 = __chkstk_darwin(v1436);
  v1435 = (char *)&v1383 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  v1433 = (uint64_t *)((char *)&v1383 - v29);
  v1440 = (_QWORD *)type metadata accessor for DebugModel(0);
  v1422 = *(v1440 - 1);
  __chkstk_darwin(v1440);
  v1441 = (char *)&v1383 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000313A0(0);
  v1461 = v31;
  v1454 = *(_QWORD *)(v31 - 8);
  __chkstk_darwin(v31);
  v1437 = (char *)&v1383 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031520(0, (unint64_t *)&unk_1000492C8, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double, (uint64_t (*)(_QWORD, uint64_t, uint64_t))&type metadata accessor for Item.ResetBehavior);
  v1480 = v33;
  v1479 = *(_QWORD *)(v33 - 8);
  __chkstk_darwin(v33);
  v1470 = (char *)&v1383 - v34;
  sub_100031520(0, (unint64_t *)&unk_1000492D0, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String, (uint64_t (*)(_QWORD, uint64_t, uint64_t))&type metadata accessor for Item.ResetBehavior);
  v1459 = v35;
  v1475 = *(char **)(v35 - 8);
  __chkstk_darwin(v35);
  v1460 = (char *)&v1383 - v36;
  sub_100031520(0, (unint64_t *)&unk_1000492D8, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int, (uint64_t (*)(_QWORD, uint64_t, uint64_t))&type metadata accessor for Item.ResetBehavior);
  v1464 = v37;
  v1468 = *(_QWORD *)(v37 - 8);
  __chkstk_darwin(v37);
  v1458 = (char *)&v1383 - v38;
  sub_100031520(0, &qword_1000492E0, (uint64_t)&type metadata for Bool, (uint64_t)&protocol witness table for Bool, (uint64_t (*)(_QWORD, uint64_t, uint64_t))&type metadata accessor for Item.ResetBehavior);
  v1483 = v39;
  v1485 = *(_QWORD *)(v39 - 8);
  __chkstk_darwin(v39);
  v1487 = (char *)&v1383 - v40;
  v41 = type metadata accessor for ChangeBehavior(0);
  v42 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v1474 = (char *)&v1383 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = type metadata accessor for AppConfiguration(0);
  v45 = *(_QWORD *)(v44 - 8);
  __chkstk_darwin(v44);
  v1442 = (char *)&v1383 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = a1[3];
  v48 = a1[4];
  sub_10000C1E8(a1, v47);
  v49 = sub_10000C3D0(0, (unint64_t *)&unk_1000492E8, (uint64_t)&protocol descriptor for PrivacyValidationProviderType, 0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v1500, v49, v49, v47, v48);
  v1432 = v1500[0];
  if (!v1500[0])
  {
    __break(1u);
    goto LABEL_47;
  }
  v1421 = v1500[1];
  v51 = a1[3];
  v52 = a1[4];
  sub_10000C1E8(a1, v51);
  v53 = sub_10000C3D0(0, (unint64_t *)&unk_1000489F0, (uint64_t)&protocol descriptor for AppConfigurationManagerType, 1);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(&v1497, v53, v53, v51, v52);
  if (!v1498)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  v1488 = v41;
  v1389 = v45;
  v1390 = v44;
  sub_10000C6A0(&v1497, (uint64_t)v1500);
  v54 = v1501;
  v55 = v1502;
  sub_10000C1E8(v1500, v1501);
  dispatch thunk of AppConfigurationManagerType.appConfiguration.getter(v54, v55);
  v56 = a1[3];
  v57 = a1[4];
  sub_10000C1E8(a1, v56);
  v58 = type metadata accessor for AppSessionManager(0);
  result = (_QWORD *)dispatch thunk of ResolverType.resolve<A>(_:)(v58, v58, v56, v57);
  v1430 = result;
  if (!result)
  {
LABEL_48:
    __break(1u);
    return result;
  }
  v1429 = v8;
  v1388 = a2;
  sub_10000FCC8(0, &qword_1000492F0, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v60 = v59;
  v1471 = v59;
  v61 = *(_QWORD *)(type metadata accessor for Group(0) - 8);
  v1469 = *(_QWORD *)(v61 + 72);
  v62 = *(unsigned __int8 *)(v61 + 80);
  v1462 = 2 * v1469;
  v1451 = 3 * v1469;
  v1425 = 6 * v1469;
  v63 = (v62 + 32) & ~v62;
  v1473 = v63;
  v1472 = v62 | 7;
  v64 = swift_allocObject(v60, v63 + 6 * v1469, v62 | 7);
  v1426 = xmmword_1000386E0;
  *(_OWORD *)(v64 + 16) = xmmword_1000386E0;
  v1387 = v64;
  v1495 = (_QWORD *)(v64 + v63);
  sub_100031418(0);
  v1491 = v65;
  v66 = swift_allocObject(v65, 72, 7);
  v1486 = xmmword_100037BB0;
  *(_OWORD *)(v66 + 16) = xmmword_100037BB0;
  sub_100031520(0, &qword_1000492F8, (uint64_t)&type metadata for Bool, (uint64_t)&protocol witness table for Bool, (uint64_t (*)(_QWORD, uint64_t, uint64_t))&type metadata accessor for Item);
  v68 = v67;
  v69 = static Settings.AccessChecks.simulateAccessToEverything.getter();
  sub_100031480();
  v71 = v70;
  v1484 = v70;
  v72 = swift_allocObject(v70, 40, 7);
  v1493 = xmmword_1000386F0;
  *(_OWORD *)(v72 + 16) = xmmword_1000386F0;
  v1481 = (_QWORD *)type metadata accessor for SettingAction(0);
  *(_QWORD *)(v72 + 32) = ((uint64_t (*)(void))static SettingActions.restart.getter)();
  *(_QWORD *)&v1497 = v72;
  specialized Array._endMutation()();
  v73 = v1497;
  v1490 = *(void (**)(_QWORD))(v42 + 104);
  v74 = v1474;
  v75 = enum case for ChangeBehavior.default(_:);
  v1489 = enum case for ChangeBehavior.default(_:);
  v1490(v1474);
  v76 = enum case for Item.ResetBehavior.reset<A>(_:);
  v1485 = *(_QWORD *)(v1485 + 104);
  v77 = v1487;
  v1494 = enum case for Item.ResetBehavior.reset<A>(_:);
  ((void (*)(char *, _QWORD, uint64_t))v1485)(v1487, enum case for Item.ResetBehavior.reset<A>(_:), v1483);
  v1492 = v68;
  v78 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v69, 0xD00000000000001DLL, 0x8000000100036970, v74, v77, v73);
  *(_QWORD *)(v66 + 56) = v68;
  v1482 = sub_1000314D8(&qword_100049308, &qword_1000492F8, (uint64_t)&type metadata for Bool, (uint64_t)&protocol witness table for Bool);
  *(_QWORD *)(v66 + 64) = v1482;
  *(_QWORD *)(v66 + 32) = v78;
  v79 = v1495;
  Group.init(title:footer:_:)(0x4320737365636341, 0xED0000736B636568, 0, 0, v66);
  v1465 = (char *)v79 + v1469;
  v80 = v1491;
  v81 = swift_allocObject(v1491, 72, 7);
  *(_OWORD *)(v81 + 16) = v1486;
  v82 = static Settings.PurchaseFlow.simulatePurchaseFlow.getter();
  v83 = swift_allocObject(v71, 40, 7);
  *(_OWORD *)(v83 + 16) = v1493;
  *(_QWORD *)(v83 + 32) = ((uint64_t (*)(void))static SettingActions.restart.getter)();
  *(_QWORD *)&v1497 = v83;
  specialized Array._endMutation()();
  v84 = v1497;
  v85 = v75;
  v86 = v1488;
  v87 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, uint64_t, uint64_t))v1490)(v74, v85, v1488);
  v88 = v1487;
  v89 = v76;
  v90 = v1483;
  v91 = (void (*)(_QWORD, _QWORD, _QWORD))v1485;
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v1487, v89, v1483);
  *(_QWORD *)&v1466 = 0xD000000000000016;
  v92 = v84;
  v93 = v1492;
  v94 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v82, 0xD000000000000016, 0x8000000100036990, v74, v88, v92);
  v95 = v1482;
  *(_QWORD *)(v81 + 56) = v93;
  *(_QWORD *)(v81 + 64) = v95;
  *(_QWORD *)(v81 + 32) = v94;
  Group.init(title:footer:_:)(0x6573616863727550, 0xED0000776F6C4620, 0, 0, v81);
  *(_QWORD *)&v1455 = (char *)v1495 + v1462;
  v96 = swift_allocObject(v80, 392, 7);
  v1385 = xmmword_100038700;
  *(_OWORD *)(v96 + 16) = xmmword_100038700;
  v97 = static Settings.Entitlements.simulateEntitlementCacheExpired.getter();
  v98 = v1489;
  v87(v74, v1489, v86);
  v99 = v1487;
  v100 = v1494;
  v91(v1487, v1494, v90);
  v101 = v74;
  v102 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v97, 0xD000000000000023, 0x8000000100036A20, v74, v99, &_swiftEmptyArrayStorage);
  v103 = v1482;
  *(_QWORD *)(v96 + 56) = v93;
  *(_QWORD *)(v96 + 64) = v103;
  *(_QWORD *)(v96 + 32) = v102;
  sub_100031520(0, (unint64_t *)&unk_100049310, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int, (uint64_t (*)(_QWORD, uint64_t, uint64_t))&type metadata accessor for Item);
  v105 = v104;
  v106 = static Settings.Entitlements.cacheRecoveryAttemptDuration.getter();
  v107 = v74;
  v108 = v98;
  v109 = v98;
  v110 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, uint64_t, uint64_t))v1490)(v107, v108, v86);
  v1452 = *(void (**)(_QWORD, _QWORD, _QWORD))(v1468 + 104);
  v111 = v1458;
  v1452(v1458, v100, v1464);
  v1463 = v105;
  v112 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v106, 0xD00000000000001FLL, 0x8000000100036A50, v101, v111, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v96 + 96) = v105;
  v113 = sub_1000314D8((unint64_t *)&unk_100049318, (unint64_t *)&unk_100049310, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
  *(_QWORD *)(v96 + 104) = v113;
  v114 = v113;
  *(_QWORD *)(v96 + 72) = v112;
  v115 = static Settings.BundleSubscriptions.entitlementsGracePeriod.getter();
  v110(v101, v109, v86);
  v116 = v110;
  v117 = v111;
  v118 = v111;
  v119 = v100;
  v120 = v1464;
  v121 = v1452;
  v1452(v118, v119, v1464);
  v122 = v115;
  v123 = v101;
  v124 = v101;
  v125 = v117;
  v126 = v1463;
  v127 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v122, 0xD000000000000019, 0x8000000100036A70, v123, v117, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v96 + 136) = v126;
  *(_QWORD *)(v96 + 144) = v114;
  v128 = v114;
  v1447 = v114;
  *(_QWORD *)(v96 + 112) = v127;
  v129 = static Settings.Entitlements.entitlementsResultOverride.getter();
  v130 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v130 + 16) = v1493;
  *(_QWORD *)(v130 + 32) = static SettingActions.resetOverrideEntitlement.getter();
  *(_QWORD *)&v1497 = v130;
  specialized Array._endMutation()();
  v131 = v1497;
  v116(v124, v1489, v1488);
  v132 = v1494;
  v121(v125, v1494, v120);
  v1420 = 0xD00000000000001ALL;
  v133 = v124;
  v134 = v131;
  v135 = v1463;
  v136 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v129, 0xD00000000000001ALL, 0x8000000100036A90, v124, v125, v134);
  *(_QWORD *)(v96 + 176) = v135;
  *(_QWORD *)(v96 + 184) = v128;
  *(_QWORD *)(v96 + 152) = v136;
  sub_100031520(0, (unint64_t *)&unk_100049320, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String, (uint64_t (*)(_QWORD, uint64_t, uint64_t))&type metadata accessor for Item);
  v138 = v137;
  v1465 = v137;
  v139 = static Settings.Entitlements.entitlementsOverride.getter();
  v1457 = (void (*)(_QWORD, _QWORD, _QWORD))*((_QWORD *)v1475 + 13);
  v140 = v1460;
  v1457(v1460, v132, v1459);
  v141 = Item<>.init(_:label:resetBehavior:actions:)(v139, 0xD00000000000001ALL, 0x8000000100036AB0, v140, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v96 + 216) = v138;
  v1456 = sub_1000314D8((unint64_t *)&unk_100049328, (unint64_t *)&unk_100049320, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
  *(_QWORD *)(v96 + 224) = v1456;
  *(_QWORD *)(v96 + 192) = v141;
  v142 = static Settings.Entitlements.trialPeriodOverride.getter();
  v143 = v133;
  v144 = v1489;
  v145 = v1488;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v133, v1489, v1488);
  v146 = v1487;
  v147 = v1483;
  v148 = (void (*)(_QWORD, _QWORD, _QWORD))v1485;
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v1487, v132, v1483);
  v1475 = (char *)0xD000000000000015;
  v149 = v146;
  v150 = v146;
  v151 = v1492;
  v152 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v142, 0xD000000000000015, 0x8000000100036AD0, v143, v149, &_swiftEmptyArrayStorage);
  v153 = v1482;
  *(_QWORD *)(v96 + 256) = v151;
  *(_QWORD *)(v96 + 264) = v153;
  *(_QWORD *)(v96 + 232) = v152;
  v154 = static Settings.Entitlements.simulateFamilyMember.getter();
  v155 = v144;
  v156 = v145;
  v157 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, uint64_t, uint64_t))v1490)(v143, v144, v156);
  v158 = v147;
  v148(v150, v1494, v147);
  v159 = v154;
  v160 = v1492;
  v161 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v159, v1466, 0x8000000100036AF0, v143, v150, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v96 + 296) = v160;
  *(_QWORD *)(v96 + 304) = v153;
  v162 = v153;
  *(_QWORD *)(v96 + 272) = v161;
  v163 = static Settings.Entitlements.simulateAmplifyUser.getter();
  v164 = v155;
  v165 = v1488;
  v157(v143, v164, v1488);
  v166 = v157;
  v167 = v1494;
  v148(v150, v1494, v158);
  v168 = v163;
  v169 = v1492;
  v170 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v168, v1475, 0x8000000100036B10, v143, v150, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v96 + 336) = v169;
  *(_QWORD *)(v96 + 344) = v162;
  *(_QWORD *)(v96 + 312) = v170;
  v171 = static Settings.Entitlements.simulateServicesBundle.getter();
  v166(v143, v1489, v165);
  v148(v150, v167, v158);
  v172 = v171;
  v173 = v1492;
  v174 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v172, 0xD000000000000018, 0x8000000100036B30, v143, v150, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v96 + 376) = v173;
  *(_QWORD *)(v96 + 384) = v162;
  *(_QWORD *)(v96 + 352) = v174;
  Group.init(title:footer:_:)(0x6D656C7469746E45, 0xEC00000073746E65, 0xD000000000000068, 0x80000001000369B0, v96);
  v1475 = (char *)v1495 + v1451;
  v175 = v1491;
  v176 = swift_allocObject(v1491, 232, 7);
  v1455 = xmmword_100038710;
  *(_OWORD *)(v176 + 16) = xmmword_100038710;
  v177 = static Presets.BundleSubscriptions.none.getter();
  v178 = v1484;
  v179 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v179 + 16) = v1493;
  *(_QWORD *)(v179 + 32) = ((uint64_t (*)(void))static SettingActions.restart.getter)();
  *(_QWORD *)&v1497 = v179;
  specialized Array._endMutation()();
  v180 = v1497;
  v181 = type metadata accessor for PresetItem(0);
  swift_allocObject(v181, *(unsigned int *)(v181 + 48), *(unsigned __int16 *)(v181 + 52));
  v182 = PresetItem.init(_:label:actions:)(v177, 1701736302, 0xE400000000000000, v180);
  *(_QWORD *)(v176 + 56) = v181;
  *(_QWORD *)(v176 + 64) = &protocol witness table for PresetItem;
  *(_QWORD *)(v176 + 32) = v182;
  v183 = static Presets.BundleSubscriptions.iTMS5.getter();
  v184 = swift_allocObject(v178, 40, 7);
  *(_OWORD *)(v184 + 16) = v1493;
  *(_QWORD *)(v184 + 32) = ((uint64_t (*)(void))static SettingActions.restart.getter)();
  *(_QWORD *)&v1497 = v184;
  specialized Array._endMutation()();
  v185 = v1497;
  swift_allocObject(v181, *(unsigned int *)(v181 + 48), *(unsigned __int16 *)(v181 + 52));
  v186 = PresetItem.init(_:label:actions:)(v183, 0x35736D7469, 0xE500000000000000, v185);
  *(_QWORD *)(v176 + 96) = v181;
  *(_QWORD *)(v176 + 104) = &protocol witness table for PresetItem;
  *(_QWORD *)(v176 + 72) = v186;
  v187 = static Presets.BundleSubscriptions.iTMS6.getter();
  v188 = swift_allocObject(v178, 40, 7);
  *(_OWORD *)(v188 + 16) = v1493;
  *(_QWORD *)(v188 + 32) = ((uint64_t (*)(void))static SettingActions.restart.getter)();
  *(_QWORD *)&v1497 = v188;
  specialized Array._endMutation()();
  v189 = v1497;
  swift_allocObject(v181, *(unsigned int *)(v181 + 48), *(unsigned __int16 *)(v181 + 52));
  v190 = PresetItem.init(_:label:actions:)(v187, 0x36736D7469, 0xE500000000000000, v189);
  *(_QWORD *)(v176 + 136) = v181;
  *(_QWORD *)(v176 + 144) = &protocol witness table for PresetItem;
  *(_QWORD *)(v176 + 112) = v190;
  v191 = static Presets.BundleSubscriptions.iTMS7.getter();
  v192 = swift_allocObject(v178, 40, 7);
  *(_OWORD *)(v192 + 16) = v1493;
  *(_QWORD *)(v192 + 32) = ((uint64_t (*)(void))static SettingActions.restart.getter)();
  *(_QWORD *)&v1497 = v192;
  specialized Array._endMutation()();
  v193 = v1497;
  swift_allocObject(v181, *(unsigned int *)(v181 + 48), *(unsigned __int16 *)(v181 + 52));
  v194 = PresetItem.init(_:label:actions:)(v191, 0x37736D7469, 0xE500000000000000, v193);
  *(_QWORD *)(v176 + 176) = v181;
  *(_QWORD *)(v176 + 184) = &protocol witness table for PresetItem;
  *(_QWORD *)(v176 + 152) = v194;
  v195 = static Presets.BundleSubscriptions.iTMS11.getter();
  v196 = swift_allocObject(v178, 40, 7);
  *(_OWORD *)(v196 + 16) = v1493;
  *(_QWORD *)(v196 + 32) = ((uint64_t (*)(void))static SettingActions.restart.getter)();
  *(_QWORD *)&v1497 = v196;
  specialized Array._endMutation()();
  v197 = v1497;
  swift_allocObject(v181, *(unsigned int *)(v181 + 48), *(unsigned __int16 *)(v181 + 52));
  v198 = PresetItem.init(_:label:actions:)(v195, 0x3131736D7469, 0xE600000000000000, v197);
  *(_QWORD *)(v176 + 216) = v181;
  *(_QWORD *)(v176 + 224) = &protocol witness table for PresetItem;
  *(_QWORD *)(v176 + 192) = v198;
  Group.init(title:footer:_:)(0xD000000000000012, 0x8000000100036B50, 0, 0, v176);
  v199 = v1469;
  v1443 = 4 * v1469;
  v200 = v175;
  v201 = swift_allocObject(v175, 72, 7);
  *(_OWORD *)(v201 + 16) = v1486;
  v202 = static Settings.WebAccess.localServerIP.getter();
  v203 = v1460;
  v204 = v1459;
  v1457(v1460, v1494, v1459);
  v205 = v202;
  v206 = v1465;
  v207 = Item<>.init(_:label:resetBehavior:actions:)(v205, 0x6572646441205049, 0xEA00000000007373, v203, &_swiftEmptyArrayStorage);
  v208 = v1456;
  *(_QWORD *)(v201 + 56) = v206;
  *(_QWORD *)(v201 + 64) = v208;
  *(_QWORD *)(v201 + 32) = v207;
  Group.init(title:footer:_:)(0x6563634120626557, 0xEA00000000007373, 0, 0, v201);
  v209 = swift_allocObject(v200, 72, 7);
  *(_OWORD *)(v209 + 16) = v1486;
  *(_QWORD *)(v209 + 56) = v1431;
  *(_QWORD *)(v209 + 64) = &protocol witness table for SettingsBundle;
  sub_10000F58C((_QWORD *)(v209 + 32));
  static SettingsBundle.appLaunchUpsell.getter();
  Group.init(title:footer:_:)(0, 0, 0, 0, v209);
  v1423 = 5 * v199;
  v210 = v1473;
  v211 = v1471;
  v1384 = v1473 + 5 * v199;
  v212 = v1472;
  v1428 = swift_allocObject(v1471, v1384, v1472);
  *(_OWORD *)(v1428 + 16) = v1455;
  v213 = swift_allocObject(v200, 192, 7);
  v1446 = xmmword_100037BA0;
  v1444 = (_QWORD *)v213;
  *(_OWORD *)(v213 + 16) = xmmword_100037BA0;
  v1424 = 8 * v199;
  v1386 = 7 * v199;
  v214 = swift_allocObject(v211, v210 + 7 * v199, v212);
  *(_OWORD *)(v214 + 16) = xmmword_100038720;
  v1383 = v214;
  v1453 = v214 + v210;
  v215 = swift_allocObject(v200, 232, 7);
  *(_OWORD *)(v215 + 16) = v1455;
  v216 = static Settings.Analytics2.Debugging.sessionName.getter();
  v217 = v1494;
  v1457(v203, v1494, v204);
  v218 = v1465;
  v219 = Item<>.init(_:label:resetBehavior:actions:)(v216, 0x206E6F6973736553, 0xEC000000656D614ELL, v203, &_swiftEmptyArrayStorage);
  v220 = v1456;
  *(_QWORD *)(v215 + 56) = v218;
  *(_QWORD *)(v215 + 64) = v220;
  *(_QWORD *)(v215 + 32) = v219;
  v221 = static Settings.Analytics2.Debugging.batchDebugging.getter();
  v222 = v1474;
  v223 = v1489;
  v224 = v1488;
  v225 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1474, v1489, v1488);
  v226 = v1487;
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v1487, v217, v1483);
  v227 = v226;
  v228 = v1492;
  v229 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v221, 0x6544206863746142, 0xEF676E6967677562, v222, v227, &_swiftEmptyArrayStorage);
  v230 = v1482;
  *(_QWORD *)(v215 + 96) = v228;
  *(_QWORD *)(v215 + 104) = v230;
  *(_QWORD *)(v215 + 72) = v229;
  v231 = static Settings.Analytics2.Debugging.batchSize.getter();
  v232 = v223;
  v233 = v223;
  v234 = v224;
  v225(v222, v232, v224);
  v235 = v1458;
  v236 = v1452;
  v1452(v1458, v217, v1464);
  v237 = v231;
  v238 = v235;
  v239 = v1463;
  v240 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v237, 0x6953206863746142, 0xEA0000000000657ALL, v222, v235, &_swiftEmptyArrayStorage);
  v241 = v1447;
  *(_QWORD *)(v215 + 136) = v239;
  *(_QWORD *)(v215 + 144) = v241;
  *(_QWORD *)(v215 + 112) = v240;
  v1495 = (_QWORD *)static Settings.Analytics2.Debugging.maxUploadRetryCount.getter();
  v242 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v242 + 16) = v1493;
  *(_QWORD *)(v242 + 32) = ((uint64_t (*)(void))static SettingActions.restart.getter)();
  *(_QWORD *)&v1497 = v242;
  specialized Array._endMutation()();
  v243 = v1497;
  v244 = v1474;
  v245 = v234;
  v246 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, uint64_t, uint64_t))v1490)(v1474, v233, v245);
  v247 = v1494;
  v236(v238, v1494, v1464);
  v248 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1495, v1466, 0x8000000100036BB0, v244, v238, v243);
  *(_QWORD *)(v215 + 176) = v239;
  *(_QWORD *)(v215 + 184) = v241;
  *(_QWORD *)(v215 + 152) = v248;
  v249 = static Settings.Analytics2.Debugging.disableAnalytics.getter();
  v250 = v233;
  v251 = v1488;
  v246(v244, v233, v1488);
  v252 = v246;
  v253 = v1487;
  v254 = v247;
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v1487, v247, v1483);
  v255 = v253;
  v256 = v1492;
  v257 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v249, 0xD000000000000011, 0x8000000100036BD0, v244, v255, &_swiftEmptyArrayStorage);
  v258 = v1482;
  *(_QWORD *)(v215 + 216) = v256;
  *(_QWORD *)(v215 + 224) = v258;
  *(_QWORD *)(v215 + 192) = v257;
  v259 = v1453;
  Group.init(title:footer:_:)(0x6E69676775626544, 0xE900000000000067, 0xD00000000000003ALL, 0x8000000100036B70, v215);
  v1495 = (_QWORD *)(v259 + v1469);
  v260 = v1491;
  v261 = swift_allocObject(v1491, 72, 7);
  *(_OWORD *)(v261 + 16) = v1486;
  sub_100031520(0, (unint64_t *)&unk_100049330, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double, (uint64_t (*)(_QWORD, uint64_t, uint64_t))&type metadata accessor for Item);
  v263 = v262;
  v264 = static Settings.Identification.adIdentifierRotation.getter();
  v252(v244, v250, v251);
  v1479 = *(_QWORD *)(v1479 + 104);
  v265 = v1470;
  v266 = v254;
  ((void (*)(char *, uint64_t, uint64_t))v1479)(v1470, v254, v1480);
  v267 = v264;
  v268 = v263;
  v1468 = v263;
  v269 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v267, 0xD00000000000001BLL, 0x8000000100036BF0, v244, v265, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v261 + 56) = v268;
  v1475 = (char *)sub_1000314D8((unint64_t *)&unk_100049338, (unint64_t *)&unk_100049330, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double);
  *(_QWORD *)(v261 + 64) = v1475;
  *(_QWORD *)(v261 + 32) = v269;
  Group.init(title:footer:_:)(0x696669746E656449, 0xEB00000000737265, 0, 0, v261);
  v270 = v1453;
  v271 = v260;
  v272 = swift_allocObject(v260, 72, 7);
  *(_OWORD *)(v272 + 16) = v1486;
  sub_100031568(0);
  v274 = v273;
  v275 = static Settings.Analytics2.Instrumentation.ads.getter();
  v276 = v1437;
  v277 = v266;
  v1445 = *(void (**)(_QWORD, _QWORD, _QWORD))(v1454 + 104);
  v1445(v1437, v266, v1461);
  v1450 = sub_100008EA0((unint64_t *)&unk_100049348, (uint64_t (*)(uint64_t))&type metadata accessor for FeatureState, (uint64_t)&protocol conformance descriptor for FeatureState);
  v278 = Item<>.init(_:label:resetBehavior:actions:)(v275, 7562305, 0xE300000000000000, v276, &_swiftEmptyArrayStorage);
  v1427 = v274;
  *(_QWORD *)(v272 + 56) = v274;
  v1449 = sub_100008EA0((unint64_t *)&unk_100049350, (uint64_t (*)(uint64_t))sub_100031568, (uint64_t)&protocol conformance descriptor for Item<A>);
  *(_QWORD *)(v272 + 64) = v1449;
  *(_QWORD *)(v272 + 32) = v278;
  Group.init(title:footer:_:)(0x656D757274736E49, 0xEF6E6F697461746ELL, 0, 0, v272);
  v1495 = (_QWORD *)(v270 + v1451);
  v279 = v271;
  v280 = swift_allocObject(v271, 72, 7);
  *(_OWORD *)(v280 + 16) = v1486;
  v281 = static Settings.Blueprint.Impressions.scrollDelta.getter();
  v282 = v1484;
  v283 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v283 + 16) = v1493;
  *(_QWORD *)(v283 + 32) = ((uint64_t (*)(void))static SettingActions.restart.getter)();
  *(_QWORD *)&v1497 = v283;
  specialized Array._endMutation()();
  v284 = v1497;
  v285 = v1474;
  v286 = v1488;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1474, v1489, v1488);
  v287 = v1470;
  ((void (*)(char *, uint64_t, uint64_t))v1479)(v1470, v277, v1480);
  v288 = v284;
  v289 = v1468;
  v290 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v281, v1466, 0x8000000100036C10, v285, v287, v288);
  v291 = v1475;
  *(_QWORD *)(v280 + 56) = v289;
  *(_QWORD *)(v280 + 64) = v291;
  *(_QWORD *)(v280 + 32) = v290;
  v292 = Group.init(title:footer:_:)(0x6973736572706D49, 0xEB00000000736E6FLL, 0, 0, v280);
  *(_QWORD *)&v1466 = v1453 + v1443;
  v1495 = (_QWORD *)static Settings.Analytics2.Debugging.jitterOverrides.getter(v292);
  v293 = swift_allocObject(v279, 152, 7);
  v1448 = xmmword_100037BD0;
  *(_OWORD *)(v293 + 16) = xmmword_100037BD0;
  v1454 = type metadata accessor for Settings.Analytics2.Debugging.Jitter(0);
  v1419 = static Settings.Analytics2.Debugging.Jitter.enablement.getter();
  v294 = v282;
  v295 = swift_allocObject(v282, 40, 7);
  *(_OWORD *)(v295 + 16) = v1493;
  *(_QWORD *)(v295 + 32) = ((uint64_t (*)(void))static SettingActions.restart.getter)();
  *(_QWORD *)&v1497 = v295;
  specialized Array._endMutation()();
  v296 = v1497;
  v297 = v1474;
  v298 = v1489;
  v299 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1474, v1489, v286);
  v300 = v1487;
  v301 = v1494;
  ((void (*)(char *, _QWORD, uint64_t))v1485)(v1487, v1494, v1483);
  v302 = v296;
  v303 = v1492;
  v304 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1419, 0x452072657474694ALL, 0xEE0064656C62616ELL, v297, v300, v302);
  v305 = v1482;
  *(_QWORD *)(v293 + 56) = v303;
  *(_QWORD *)(v293 + 64) = v305;
  *(_QWORD *)(v293 + 32) = v304;
  v1419 = static Settings.Analytics2.Debugging.Jitter.lowerBound.getter();
  v306 = swift_allocObject(v294, 40, 7);
  *(_OWORD *)(v306 + 16) = v1493;
  *(_QWORD *)(v306 + 32) = ((uint64_t (*)(void))static SettingActions.restart.getter)();
  *(_QWORD *)&v1497 = v306;
  specialized Array._endMutation()();
  v307 = v1497;
  v308 = v1488;
  v299(v297, v298, v1488);
  v309 = v1470;
  v310 = v301;
  v311 = v1480;
  v312 = (void (*)(_QWORD, _QWORD, _QWORD))v1479;
  ((void (*)(char *, uint64_t, uint64_t))v1479)(v1470, v310, v1480);
  v313 = v307;
  v314 = v1468;
  v315 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1419, 0xD000000000000011, 0x8000000100036C50, v297, v309, v313);
  v316 = v1475;
  *(_QWORD *)(v293 + 96) = v314;
  *(_QWORD *)(v293 + 104) = v316;
  *(_QWORD *)(v293 + 72) = v315;
  v1454 = static Settings.Analytics2.Debugging.Jitter.upperBound.getter();
  v317 = swift_allocObject(v294, 40, 7);
  *(_OWORD *)(v317 + 16) = v1493;
  *(_QWORD *)(v317 + 32) = ((uint64_t (*)(void))static SettingActions.restart.getter)();
  *(_QWORD *)&v1497 = v317;
  specialized Array._endMutation()();
  v318 = v1497;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v297, v1489, v308);
  v312(v309, v1494, v311);
  v319 = v318;
  v320 = v1468;
  v321 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1454, 0xD000000000000011, 0x8000000100036C70, v297, v309, v319);
  *(_QWORD *)(v293 + 136) = v320;
  *(_QWORD *)(v293 + 144) = v316;
  *(_QWORD *)(v293 + 112) = v321;
  v1454 = 0xD000000000000010;
  ((void (*)(void))Group.init(title:footer:group:_:))();
  v322 = swift_allocObject(v1491, 112, 7);
  v1466 = xmmword_100037BC0;
  *(_OWORD *)(v322 + 16) = xmmword_100037BC0;
  v323 = v1432;
  ObjectType = swift_getObjectType(v1432);
  v325 = v1433;
  v326 = v1421;
  v327 = dispatch thunk of PrivacyValidationProviderType.privacyValidation.getter(ObjectType, v1421);
  LOBYTE(v320) = PrivacyValidation.isEnabled.getter(v327);
  v328 = *(void (**)(_QWORD, _QWORD))(v1438 + 8);
  v329 = v1436;
  v328(v325, v1436);
  v330 = v320 & 1;
  v331 = v1441;
  *v1441 = v330;
  v332 = *(void (**)(_QWORD))(v1422 + 104);
  LODWORD(v1419) = enum case for DebugModel.BOOL(_:);
  v1422 = (unint64_t)v332;
  v332(v331);
  v1495 = (_QWORD *)type metadata accessor for DebugItem(0);
  *(_QWORD *)(v322 + 56) = v1495;
  v333 = sub_100008EA0((unint64_t *)&unk_100049358, (uint64_t (*)(uint64_t))&type metadata accessor for DebugItem, (uint64_t)&protocol conformance descriptor for DebugItem);
  v1433 = (_QWORD *)v322;
  *(_QWORD *)(v322 + 64) = v333;
  sub_10000F58C((_QWORD *)(v322 + 32));
  DebugItem.init(title:model:)(v1420, 0x8000000100036C90, v331);
  v1438 = swift_allocObject(v1471, v1473 + v1443, v1472);
  *(_OWORD *)(v1438 + 16) = v1446;
  v334 = v1435;
  v335 = dispatch thunk of PrivacyValidationProviderType.privacyValidation.getter(ObjectType, v326);
  v336 = PrivacyValidation.denylistDescriptors.getter(v335);
  v328(v334, v329);
  v337 = *(_QWORD *)(v336 + 16);
  if (v337)
  {
    v1496 = (void **)&_swiftEmptyArrayStorage;
    v338 = (void **)&v1496;
    sub_1000259E8(0, v337, 0);
    v339 = sub_1000315E0(v336);
    v341 = v340;
    v343 = v342 & 1;
    while ((v339 & 0x8000000000000000) == 0 && v339 < 1 << *(_BYTE *)(v336 + 32))
    {
      if (((*(_QWORD *)(v336 + 56 + (((unint64_t)v339 >> 3) & 0xFFFFFFFFFFFFF8)) >> v339) & 1) == 0)
        goto LABEL_43;
      if (*(_DWORD *)(v336 + 36) != v341)
        goto LABEL_44;
      v344 = v1477;
      v345 = v1476;
      v346 = v1478;
      ((void (*)(char *, int64_t, uint64_t))v1477[2])(v1476, *(_QWORD *)(v336 + 48) + v1477[9] * v339, v1478);
      v1498 = v1495;
      v1499 = v333;
      sub_10000F58C(&v1497);
      DenylistDescriptor.debugItem.getter();
      ((void (*)(char *, uint64_t))v344[1])(v345, v346);
      v338 = v1496;
      if ((swift_isUniquelyReferenced_nonNull_native(v1496) & 1) == 0)
      {
        sub_1000259E8(0, (int64_t)v338[2] + 1, 1);
        v338 = v1496;
      }
      v323 = (unint64_t)v338[2];
      v347 = (unint64_t)v338[3];
      if (v323 >= v347 >> 1)
      {
        sub_1000259E8(v347 > 1, v323 + 1, 1);
        v338 = v1496;
      }
      v338[2] = (void *)(v323 + 1);
      sub_10000C6A0(&v1497, (uint64_t)&v338[5 * v323 + 4]);
      v348 = sub_100031680(v339, v341, v343 & 1, v336);
      v339 = v348;
      v341 = v349;
      v343 = v350 & 1;
      if (!--v337)
      {
        sub_100021404(v348, v349, v350 & 1);
        swift_bridgeObjectRelease(v336);
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease(v336);
    v338 = (void **)&_swiftEmptyArrayStorage;
LABEL_17:
    v351 = Group.init(title:footer:_:)(0x6465766C6F736552, 0xE800000000000000, 0, 0, v338);
    v352 = AppConfiguration.analyticsDenylistDescriptorsPublic.getter(v351);
    v353 = v352;
    v354 = *(_QWORD *)(v352 + 16);
    if (v354)
    {
      v1496 = (void **)&_swiftEmptyArrayStorage;
      sub_1000259E8(0, v354, 0);
      v355 = (unint64_t *)v1496;
      v356 = (uint64_t *)(v353 + 40);
      do
      {
        v357 = *(v356 - 1);
        v358 = *v356;
        v1498 = v1495;
        v1499 = v333;
        sub_10000F58C(&v1497);
        swift_bridgeObjectRetain(v358);
        String.denylistDescriptorValueDebugItem.getter(v357, v358);
        swift_bridgeObjectRelease(v358);
        v1496 = (void **)v355;
        v360 = v355[2];
        v359 = v355[3];
        if (v360 >= v359 >> 1)
        {
          sub_1000259E8(v359 > 1, v360 + 1, 1);
          v355 = (unint64_t *)v1496;
        }
        v356 += 2;
        v355[2] = v360 + 1;
        sub_10000C6A0(&v1497, (uint64_t)&v355[5 * v360 + 4]);
        --v354;
      }
      while (v354);
      swift_bridgeObjectRelease(v353);
    }
    else
    {
      swift_bridgeObjectRelease(v352);
      v355 = (unint64_t *)&_swiftEmptyArrayStorage;
    }
    v1477 = v1444 + 4;
    v361 = Group.init(title:footer:_:)(0x63696C627550, 0xE600000000000000, 0, 0, v355);
    v362 = AppConfiguration.analyticsDenylistDescriptorsSeed.getter(v361);
    v363 = v362;
    v364 = *(_QWORD *)(v362 + 16);
    if (v364)
    {
      v1496 = (void **)&_swiftEmptyArrayStorage;
      sub_1000259E8(0, v364, 0);
      v365 = (unint64_t *)v1496;
      v366 = (uint64_t *)(v363 + 40);
      do
      {
        v367 = *(v366 - 1);
        v368 = *v366;
        v1498 = v1495;
        v1499 = v333;
        sub_10000F58C(&v1497);
        swift_bridgeObjectRetain(v368);
        String.denylistDescriptorValueDebugItem.getter(v367, v368);
        swift_bridgeObjectRelease(v368);
        v1496 = (void **)v365;
        v370 = v365[2];
        v369 = v365[3];
        if (v370 >= v369 >> 1)
        {
          sub_1000259E8(v369 > 1, v370 + 1, 1);
          v365 = (unint64_t *)v1496;
        }
        v366 += 2;
        v365[2] = v370 + 1;
        sub_10000C6A0(&v1497, (uint64_t)&v365[5 * v370 + 4]);
        --v364;
      }
      while (v364);
      swift_bridgeObjectRelease(v363);
    }
    else
    {
      swift_bridgeObjectRelease(v362);
      v365 = (unint64_t *)&_swiftEmptyArrayStorage;
    }
    v371 = Group.init(title:footer:_:)(1684366675, 0xE400000000000000, 0, 0, v365);
    v372 = AppConfiguration.analyticsDenylistDescriptorsInternal.getter(v371);
    v373 = v372;
    v374 = *(_QWORD *)(v372 + 16);
    if (v374)
    {
      v1496 = (void **)&_swiftEmptyArrayStorage;
      sub_1000259E8(0, v374, 0);
      v375 = (unint64_t *)v1496;
      v376 = (uint64_t *)(v373 + 40);
      do
      {
        v377 = *(v376 - 1);
        v378 = *v376;
        v1498 = v1495;
        v1499 = v333;
        sub_10000F58C(&v1497);
        swift_bridgeObjectRetain(v378);
        String.denylistDescriptorValueDebugItem.getter(v377, v378);
        swift_bridgeObjectRelease(v378);
        v1496 = (void **)v375;
        v380 = v375[2];
        v379 = v375[3];
        if (v380 >= v379 >> 1)
        {
          sub_1000259E8(v379 > 1, v380 + 1, 1);
          v375 = (unint64_t *)v1496;
        }
        v376 += 2;
        v375[2] = v380 + 1;
        sub_10000C6A0(&v1497, (uint64_t)&v375[5 * v380 + 4]);
        --v374;
      }
      while (v374);
      swift_bridgeObjectRelease(v373);
    }
    else
    {
      swift_bridgeObjectRelease(v372);
      v375 = (unint64_t *)&_swiftEmptyArrayStorage;
    }
    v381 = v1433;
    Group.init(title:footer:_:)(0x6C616E7265746E49, 0xE800000000000000, 0, 0, v375);
    v382 = type metadata accessor for Page(0);
    v381[12] = v382;
    v381[13] = &protocol witness table for Page;
    v383 = v382;
    v1478 = v382;
    sub_10000F58C(v381 + 9);
    Page.init(title:_:)(0xD000000000000014, 0x8000000100036CD0, v1438);
    Group.init(title:footer:_:)(0xD000000000000012, 0x8000000100036CB0, 0, 0, v381);
    v384 = v1491;
    v385 = swift_allocObject(v1491, 72, 7);
    *(_OWORD *)(v385 + 16) = v1486;
    v386 = AppSessionManager.wasPriorSessionCrashDetected.getter();
    v387 = v1441;
    *v1441 = v386 & 1;
    ((void (*)(_BYTE *, _QWORD, _QWORD *))v1422)(v387, v1419, v1440);
    *(_QWORD *)(v385 + 56) = v1495;
    *(_QWORD *)(v385 + 64) = v333;
    sub_10000F58C((_QWORD *)(v385 + 32));
    DebugItem.init(title:model:)(0x6544206873617243, 0xEE00646574636574, v387);
    Group.init(title:footer:_:)(0x6544206873617243, 0xEF6E6F6974636574, 0, 0, v385);
    v388 = v1444;
    v1444[7] = v383;
    v388[8] = &protocol witness table for Page;
    sub_10000F58C(v1477);
    Page.init(title:_:)(0x636974796C616E41, 0xE900000000000073, v1383);
    v1495 = v388 + 9;
    v389 = v1473;
    v1476 = (char *)(v1473 + v1469);
    v390 = swift_allocObject(v1471, v1473 + v1469, v1472);
    *(_OWORD *)(v390 + 16) = v1486;
    v1477 = (_QWORD *)(v390 + v389);
    v391 = swift_allocObject(v384, 72, 7);
    *(_OWORD *)(v391 + 16) = v1486;
    sub_100031764(0);
    v393 = v392;
    v394 = static Settings.Container.testSuite.getter();
    v395 = v1484;
    v396 = swift_allocObject(v1484, 40, 7);
    *(_OWORD *)(v396 + 16) = v1493;
    *(_QWORD *)(v396 + 32) = ((uint64_t (*)(void))static SettingActions.restart.getter)();
    *(_QWORD *)&v1497 = v396;
    specialized Array._endMutation()();
    v397 = v1497;
    v398 = v1393;
    v399 = v1494;
    (*(void (**)(char *, _QWORD, uint64_t))(v1391 + 104))(v1393, v1494, v1392);
    sub_100008EA0((unint64_t *)&unk_100049368, (uint64_t (*)(uint64_t))&type metadata accessor for Settings.Container.TestSuite, (uint64_t)&protocol conformance descriptor for Settings.Container.TestSuite);
    v400 = Item<>.init(_:label:resetBehavior:actions:)(v394, 0xD000000000000015, 0x8000000100036CF0, v398, v397);
    *(_QWORD *)(v391 + 56) = v393;
    *(_QWORD *)(v391 + 64) = sub_100008EA0((unint64_t *)&unk_100049370, (uint64_t (*)(uint64_t))sub_100031764, (uint64_t)&protocol conformance descriptor for Item<A>);
    *(_QWORD *)(v391 + 32) = v400;
    Group.init(title:footer:_:)(0x656E6961746E6F43, 0xE900000000000072, 0, 0, v391);
    v388[12] = v1478;
    v388[13] = &protocol witness table for Page;
    sub_10000F58C(v1495);
    Page.init(title:_:)(0x656E6961746E6F43, 0xE900000000000072, v390);
    v1477 = v388 + 14;
    v1438 = v389 + v1462;
    v401 = swift_allocObject(v1471, v389 + v1462, v1472);
    *(_OWORD *)(v401 + 16) = v1466;
    v1495 = (_QWORD *)v401;
    v402 = v401 + v389;
    v403 = v395;
    v404 = v1491;
    v405 = swift_allocObject(v1491, 72, 7);
    *(_OWORD *)(v405 + 16) = v1486;
    sub_1000317DC(0);
    v407 = v406;
    v408 = static Settings.News.newsProvider.getter();
    v409 = swift_allocObject(v403, 40, 7);
    *(_OWORD *)(v409 + 16) = v1493;
    *(_QWORD *)(v409 + 32) = ((uint64_t (*)(void))static SettingActions.restart.getter)();
    *(_QWORD *)&v1497 = v409;
    specialized Array._endMutation()();
    v410 = v1497;
    v411 = v1396;
    v333 = v399;
    (*(void (**)(char *, uint64_t, uint64_t))(v1394 + 104))(v1396, v399, v1395);
    sub_100008EA0((unint64_t *)&unk_100049380, (uint64_t (*)(uint64_t))&type metadata accessor for NewsProvider, (uint64_t)&protocol conformance descriptor for NewsProvider);
    v412 = Item<>.init(_:label:resetBehavior:actions:)(v408, 0x72656469766F7250, 0xE800000000000000, v411, v410);
    *(_QWORD *)(v405 + 56) = v407;
    *(_QWORD *)(v405 + 64) = sub_100008EA0((unint64_t *)&unk_100049388, (uint64_t (*)(uint64_t))sub_1000317DC, (uint64_t)&protocol conformance descriptor for Item<A>);
    *(_QWORD *)(v405 + 32) = v412;
    Group.init(title:footer:_:)(0x72656469766F7250, 0xE800000000000000, 0, 0, v405);
    v1441 = (_BYTE *)(v402 + v1469);
    v336 = swift_allocObject(v404, 152, 7);
    *(_OWORD *)(v336 + 16) = v1448;
    sub_100031854(0);
    v337 = v413;
    v343 = static Settings.News.appleNewsEnvironment.getter();
    v323 = (unint64_t)v403;
    v338 = (void **)swift_allocObject(v403, 40, 7);
    *((_OWORD *)v338 + 1) = v1493;
    if (qword_100047860 == -1)
      goto LABEL_39;
  }
  swift_once(&qword_100047860, sub_100012F2C);
LABEL_39:
  v414 = qword_10004A9B0;
  v338[4] = (void *)qword_10004A9B0;
  *(_QWORD *)&v1497 = v338;
  specialized Array._endMutation()();
  v415 = v1497;
  v416 = v1399;
  (*(void (**)(char *, uint64_t, _QWORD))(v1397 + 104))(v1399, v333, v1398);
  sub_100008EA0((unint64_t *)&unk_100049398, (uint64_t (*)(uint64_t))&type metadata accessor for NewsEnvironment, (uint64_t)&protocol conformance descriptor for NewsEnvironment);
  swift_retain(v414);
  v417 = Item<>.init(_:label:resetBehavior:actions:)(v343, 0x6D6E6F7269766E45, 0xEB00000000746E65, v416, v415);
  *(_QWORD *)(v336 + 56) = v337;
  *(_QWORD *)(v336 + 64) = sub_100008EA0((unint64_t *)&unk_1000493A0, (uint64_t (*)(uint64_t))sub_100031854, (uint64_t)&protocol conformance descriptor for Item<A>);
  *(_QWORD *)(v336 + 32) = v417;
  v418 = static Settings.News.disableEdgeCachedFeeds.getter();
  v419 = v323;
  v420 = swift_allocObject(v323, 40, 7);
  *(_OWORD *)(v420 + 16) = v1493;
  v421 = qword_10004A9B0;
  *(_QWORD *)(v420 + 32) = qword_10004A9B0;
  *(_QWORD *)&v1497 = v420;
  specialized Array._endMutation()();
  v422 = v1497;
  v423 = v1474;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1474, v1489, v1488);
  v424 = v1487;
  v425 = v1494;
  ((void (*)(char *, _QWORD, uint64_t))v1485)(v1487, v1494, v1483);
  swift_retain(v421);
  v426 = v418;
  v1420 = 0xD000000000000019;
  v427 = v1492;
  v428 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v426, 0xD000000000000019, 0x8000000100036D10, v423, v424, v422);
  v429 = v1482;
  *(_QWORD *)(v336 + 96) = v427;
  *(_QWORD *)(v336 + 104) = v429;
  *(_QWORD *)(v336 + 72) = v428;
  v430 = static Settings.News.disableEdgeCachedTopStories.getter();
  v431 = swift_allocObject(v419, 40, 7);
  *(_OWORD *)(v431 + 16) = v1493;
  v432 = qword_10004A9B0;
  *(_QWORD *)(v431 + 32) = qword_10004A9B0;
  *(_QWORD *)&v1497 = v431;
  specialized Array._endMutation()();
  v433 = v1497;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v423, v1489, v1488);
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v424, v425, v1483);
  swift_retain(v432);
  v1453 = 0xD00000000000001FLL;
  v434 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v430, 0xD00000000000001FLL, 0x8000000100036D30, v423, v424, v433);
  *(_QWORD *)(v336 + 136) = v427;
  *(_QWORD *)(v336 + 144) = v429;
  *(_QWORD *)(v336 + 112) = v434;
  Group.init(title:footer:_:)(0x654E20656C707041, 0xEA00000000007377, 0, 0, v336);
  v435 = v1444;
  v1444[17] = v1478;
  v435[18] = &protocol witness table for Page;
  sub_10000F58C(v1477);
  Page.init(title:_:)(1937204558, 0xE400000000000000, v1495);
  sub_1000318CC(0, &qword_1000493A8, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))&type metadata accessor for Item);
  v437 = v436;
  v438 = v1494;
  v439 = v1484;
  if (qword_100047870 != -1)
    swift_once(&qword_100047870, sub_1000188C8);
  v440 = v1428 + v1473;
  v441 = static Settings.Debug.storefront;
  v442 = swift_allocObject(v439, 40, 7);
  *(_OWORD *)(v442 + 16) = v1493;
  v443 = swift_retain(v441);
  *(_QWORD *)(v442 + 32) = static SettingActions.restart.getter(v443);
  *(_QWORD *)&v1497 = v442;
  specialized Array._endMutation()();
  v444 = v1497;
  v445 = v1402;
  (*(void (**)(char *, uint64_t, char *))(v1400 + 104))(v1402, v438, v1401);
  sub_100018F70();
  v446 = Item<>.init(_:label:resetBehavior:actions:)(v441, 0x6F726665726F7453, 0xEA0000000000746ELL, v445, v444);
  v435[22] = v437;
  v435[23] = sub_100031928();
  v435[19] = v446;
  v1436 = v440;
  Group.init(title:footer:_:)(0x6C6172656E6547, 0xE700000000000000, 0, 0, v435);
  v447 = v438;
  v1477 = (_QWORD *)(v440 + v1469);
  v448 = swift_allocObject(v1491, 552, 7);
  *(_OWORD *)(v448 + 16) = xmmword_100038730;
  v449 = static Settings.Features.enableAIAttribution.getter();
  v450 = swift_allocObject(v439, 40, 7);
  *(_OWORD *)(v450 + 16) = v1493;
  *(_QWORD *)(v450 + 32) = static SettingActions.restart.getter(v450);
  *(_QWORD *)&v1497 = v450;
  specialized Array._endMutation()();
  v451 = v1497;
  v452 = v1437;
  v453 = v1445;
  v1445(v1437, v447, v1461);
  v454 = v1427;
  v455 = Item<>.init(_:label:resetBehavior:actions:)(v449, 0x6972747441204941, 0xEE006E6F69747562, v452, v451);
  v456 = v1449;
  *(_QWORD *)(v448 + 56) = v454;
  *(_QWORD *)(v448 + 64) = v456;
  *(_QWORD *)(v448 + 32) = v455;
  v457 = static Settings.Features.appReviewPrompt.getter();
  v458 = swift_allocObject(v439, 40, 7);
  *(_OWORD *)(v458 + 16) = v1493;
  *(_QWORD *)(v458 + 32) = static SettingActions.restart.getter(v458);
  *(_QWORD *)&v1497 = v458;
  specialized Array._endMutation()();
  v459 = v1497;
  v460 = v1494;
  v461 = v1461;
  v453(v452, v1494, v1461);
  v462 = Item<>.init(_:label:resetBehavior:actions:)(v457, 0xD000000000000011, 0x8000000100036D50, v452, v459);
  v463 = v1449;
  *(_QWORD *)(v448 + 96) = v454;
  *(_QWORD *)(v448 + 104) = v463;
  *(_QWORD *)(v448 + 72) = v462;
  v1495 = (_QWORD *)static Settings.Features.narrativeAudio.getter();
  v464 = v1484;
  v465 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v465 + 16) = v1493;
  *(_QWORD *)(v465 + 32) = static SettingActions.restart.getter(v465);
  *(_QWORD *)&v1497 = v465;
  specialized Array._endMutation()();
  v466 = v1497;
  v1445(v452, v460, v461);
  v467 = Item<>.init(_:label:resetBehavior:actions:)(v1495, 0x6E69206F69647541, 0xEF736B636F745320, v452, v466);
  *(_QWORD *)(v448 + 136) = v454;
  *(_QWORD *)(v448 + 144) = v463;
  v468 = v463;
  *(_QWORD *)(v448 + 112) = v467;
  v1495 = (_QWORD *)static Settings.Features.cipActivation.getter();
  v469 = swift_allocObject(v464, 40, 7);
  *(_OWORD *)(v469 + 16) = v1493;
  *(_QWORD *)(v469 + 32) = static SettingActions.restart.getter(v469);
  *(_QWORD *)&v1497 = v469;
  specialized Array._endMutation()();
  v470 = v1497;
  v471 = v1494;
  v472 = v1445;
  v1445(v452, v1494, v1461);
  v473 = Item<>.init(_:label:resetBehavior:actions:)(v1495, 0x6974634120504943, 0xEE006E6F69746176, v452, v470);
  *(_QWORD *)(v448 + 176) = v454;
  *(_QWORD *)(v448 + 184) = v468;
  *(_QWORD *)(v448 + 152) = v473;
  v1495 = (_QWORD *)static Settings.NewsFeedModule.Features.useFeedDifferentiationMode.getter();
  v474 = v1484;
  v475 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v475 + 16) = v1493;
  *(_QWORD *)(v475 + 32) = static SettingActions.restart.getter(v475);
  *(_QWORD *)&v1497 = v475;
  specialized Array._endMutation()();
  v476 = v1497;
  v477 = v471;
  v478 = v1461;
  v472(v452, v477, v1461);
  v479 = Item<>.init(_:label:resetBehavior:actions:)(v1495, 0xD00000000000001ELL, 0x8000000100036D70, v452, v476);
  v480 = v1449;
  *(_QWORD *)(v448 + 216) = v454;
  *(_QWORD *)(v448 + 224) = v480;
  *(_QWORD *)(v448 + 192) = v479;
  v1495 = (_QWORD *)static Settings.NewsFeedModule.Features.useFeedDensityMode.getter();
  v481 = swift_allocObject(v474, 40, 7);
  *(_OWORD *)(v481 + 16) = v1493;
  *(_QWORD *)(v481 + 32) = static SettingActions.restart.getter(v481);
  *(_QWORD *)&v1497 = v481;
  specialized Array._endMutation()();
  v482 = v1497;
  v483 = v1494;
  v484 = v478;
  v485 = v1445;
  v1445(v452, v1494, v484);
  v1422 = 0xD000000000000016;
  v486 = Item<>.init(_:label:resetBehavior:actions:)(v1495, 0xD000000000000016, 0x8000000100036D90, v452, v482);
  *(_QWORD *)(v448 + 256) = v454;
  *(_QWORD *)(v448 + 264) = v480;
  *(_QWORD *)(v448 + 232) = v486;
  v1495 = (_QWORD *)static Settings.Features.symbolsInArticles.getter();
  v487 = v1484;
  v488 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v488 + 16) = v1493;
  *(_QWORD *)(v488 + 32) = static SettingActions.restart.getter(v488);
  *(_QWORD *)&v1497 = v488;
  specialized Array._endMutation()();
  v489 = v1497;
  v485(v452, v483, v1461);
  v1419 = 0xD00000000000001ALL;
  v490 = Item<>.init(_:label:resetBehavior:actions:)(v1495, 0xD00000000000001ALL, 0x8000000100036DB0, v452, v489);
  v491 = v1449;
  *(_QWORD *)(v448 + 296) = v454;
  *(_QWORD *)(v448 + 304) = v491;
  *(_QWORD *)(v448 + 272) = v490;
  v1495 = (_QWORD *)static Settings.Features.forYouFeedConfigRequests.getter();
  v492 = swift_allocObject(v487, 40, 7);
  *(_OWORD *)(v492 + 16) = v1493;
  *(_QWORD *)(v492 + 32) = static SettingActions.restart.getter(v492);
  *(_QWORD *)&v1497 = v492;
  specialized Array._endMutation()();
  v493 = v1497;
  v494 = v1494;
  v495 = v1461;
  v485(v452, v1494, v1461);
  v496 = Item<>.init(_:label:resetBehavior:actions:)(v1495, 0xD00000000000001CLL, 0x8000000100036DD0, v452, v493);
  *(_QWORD *)(v448 + 336) = v454;
  *(_QWORD *)(v448 + 344) = v491;
  *(_QWORD *)(v448 + 312) = v496;
  v1495 = (_QWORD *)static Settings.Features.newsFreeExperience.getter();
  v497 = v1484;
  v498 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v498 + 16) = v1493;
  *(_QWORD *)(v498 + 32) = static SettingActions.restart.getter(v498);
  *(_QWORD *)&v1497 = v498;
  specialized Array._endMutation()();
  v499 = v1497;
  v485(v452, v494, v495);
  v1444 = (_QWORD *)0xD000000000000014;
  v500 = Item<>.init(_:label:resetBehavior:actions:)(v1495, 0xD000000000000014, 0x8000000100036DF0, v452, v499);
  v501 = v1449;
  *(_QWORD *)(v448 + 376) = v454;
  *(_QWORD *)(v448 + 384) = v501;
  *(_QWORD *)(v448 + 352) = v500;
  v1495 = (_QWORD *)static Settings.Features.nffFeeds.getter();
  v502 = swift_allocObject(v497, 40, 7);
  *(_OWORD *)(v502 + 16) = v1493;
  *(_QWORD *)(v502 + 32) = static SettingActions.restart.getter(v502);
  *(_QWORD *)&v1497 = v502;
  specialized Array._endMutation()();
  v503 = v1497;
  v504 = v494;
  v505 = v1445;
  v1445(v452, v504, v495);
  v506 = Item<>.init(_:label:resetBehavior:actions:)(v1495, 0x646565462046464ELL, 0xE900000000000073, v452, v503);
  *(_QWORD *)(v448 + 416) = v454;
  *(_QWORD *)(v448 + 424) = v501;
  *(_QWORD *)(v448 + 392) = v506;
  v1441 = (_BYTE *)static Settings.Features.paidBundleViaOffer.getter();
  v507 = swift_allocObject(v497, 40, 7);
  *(_OWORD *)(v507 + 16) = v1493;
  *(_QWORD *)(v507 + 32) = static SettingActions.restart.getter(v507);
  *(_QWORD *)&v1497 = v507;
  specialized Array._endMutation()();
  v508 = v1497;
  v509 = v1494;
  v510 = v1461;
  v511 = v505;
  v505(v452, v1494, v1461);
  v1495 = (_QWORD *)0xD000000000000015;
  v512 = Item<>.init(_:label:resetBehavior:actions:)(v1441, 0xD000000000000015, 0x8000000100036E10, v452, v508);
  v513 = v1449;
  *(_QWORD *)(v448 + 456) = v454;
  *(_QWORD *)(v448 + 464) = v513;
  *(_QWORD *)(v448 + 432) = v512;
  v514 = static Settings.Features.showYahooNewsAttribution.getter();
  v511(v452, v509, v510);
  v1421 = 0xD00000000000001DLL;
  v515 = Item<>.init(_:label:resetBehavior:actions:)(v514, 0xD00000000000001DLL, 0x8000000100036E30, v452, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v448 + 496) = v454;
  *(_QWORD *)(v448 + 504) = v513;
  *(_QWORD *)(v448 + 472) = v515;
  v516 = static Settings.Features.widgetNewsCuration.getter();
  v511(v452, v509, v510);
  v517 = Item<>.init(_:label:resetBehavior:actions:)(v516, v1444, 0x8000000100036E50, v452, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v448 + 536) = v454;
  *(_QWORD *)(v448 + 544) = v513;
  *(_QWORD *)(v448 + 512) = v517;
  Group.init(title:footer:_:)(0x7365727574616546, 0xE800000000000000, 0, 0, v448);
  v1400 = v1436 + v1462;
  v518 = v1491;
  v519 = swift_allocObject(v1491, 192, 7);
  v1433 = (_QWORD *)v519;
  *(_OWORD *)(v519 + 16) = v1446;
  v1440 = (_QWORD *)(v519 + 32);
  v520 = v1473;
  v1401 = (char *)(v1473 + v1451);
  v521 = swift_allocObject(v1471, v1473 + v1451, v1472);
  v1399 = (char *)v521;
  *(_OWORD *)(v521 + 16) = v1448;
  v522 = (void (*)(_QWORD, _QWORD, _QWORD))(v521 + v520);
  static Settings.ForYou.configOverrides.getter();
  v523 = swift_allocObject(v518, 72, 7);
  *(_OWORD *)(v523 + 16) = v1486;
  type metadata accessor for Settings.ForYou.ConfigOverrides(0);
  v524 = static Settings.ForYou.ConfigOverrides.url.getter();
  v525 = v1484;
  v526 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v526 + 16) = v1493;
  *(_QWORD *)(v526 + 32) = static SettingActions.restart.getter(v526);
  *(_QWORD *)&v1497 = v526;
  specialized Array._endMutation()();
  v527 = v1497;
  v528 = v1460;
  v529 = v1494;
  v1457(v1460, v1494, v1459);
  v530 = v527;
  v531 = v1465;
  v532 = Item<>.init(_:label:resetBehavior:actions:)(v524, 5001813, 0xE300000000000000, v528, v530);
  v533 = v1456;
  *(_QWORD *)(v523 + 56) = v531;
  *(_QWORD *)(v523 + 64) = v533;
  *(_QWORD *)(v523 + 32) = v532;
  v1477 = (_QWORD *)0x8000000100036E70;
  v1398 = v522;
  Group.init(title:footer:group:_:)(v1454);
  v1397 = (uint64_t)v522 + v1469;
  v534 = swift_allocObject(v518, 192, 7);
  *(_OWORD *)(v534 + 16) = v1446;
  v535 = static Settings.News.disableTopStories.getter();
  v536 = v525;
  v537 = swift_allocObject(v525, 40, 7);
  *(_OWORD *)(v537 + 16) = v1493;
  *(_QWORD *)(v537 + 32) = static SettingActions.restart.getter(v537);
  *(_QWORD *)&v1497 = v537;
  specialized Array._endMutation()();
  v538 = v1497;
  v539 = v1474;
  v540 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1474, v1489, v1488);
  v541 = v1487;
  v542 = v529;
  v543 = v1483;
  v544 = (void (*)(_QWORD, _QWORD, _QWORD))v1485;
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v1487, v542, v1483);
  v545 = v541;
  v546 = v1492;
  v547 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v535, v1444, 0x8000000100036E90, v539, v545, v538);
  v548 = v1482;
  *(_QWORD *)(v534 + 56) = v546;
  *(_QWORD *)(v534 + 64) = v548;
  *(_QWORD *)(v534 + 32) = v547;
  v1441 = (_BYTE *)static Settings.News.enableForYouGroupSizeOverride.getter();
  v549 = swift_allocObject(v536, 40, 7);
  *(_OWORD *)(v549 + 16) = v1493;
  v550 = qword_10004A9B0;
  *(_QWORD *)(v549 + 32) = qword_10004A9B0;
  *(_QWORD *)&v1497 = v549;
  specialized Array._endMutation()();
  v551 = v1497;
  v552 = v1489;
  v553 = v1488;
  v540(v539, v1489, v1488);
  v554 = v1487;
  v544(v1487, v1494, v543);
  swift_retain(v550);
  v1402 = (char *)0xD00000000000001BLL;
  v555 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1441, 0xD00000000000001BLL, 0x8000000100036EB0, v539, v554, v551);
  v556 = v1482;
  *(_QWORD *)(v534 + 96) = v546;
  *(_QWORD *)(v534 + 104) = v556;
  *(_QWORD *)(v534 + 72) = v555;
  v557 = static Settings.News.forYouGroupSizeOverride.getter();
  v558 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v558 + 16) = v1493;
  v559 = qword_10004A9B0;
  *(_QWORD *)(v558 + 32) = qword_10004A9B0;
  *(_QWORD *)&v1497 = v558;
  specialized Array._endMutation()();
  v560 = v1497;
  v561 = v552;
  v562 = v552;
  v563 = v553;
  v564 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, uint64_t, uint64_t))v1490)(v539, v561, v553);
  v565 = v1458;
  v566 = v1494;
  v1452(v1458, v1494, v1464);
  swift_retain(v559);
  v1435 = (char *)0xD000000000000012;
  v567 = v560;
  v568 = v1463;
  v569 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v557, 0xD000000000000012, 0x8000000100036ED0, v539, v565, v567);
  v570 = v1447;
  *(_QWORD *)(v534 + 136) = v568;
  *(_QWORD *)(v534 + 144) = v570;
  *(_QWORD *)(v534 + 112) = v569;
  v571 = static Settings.ForYou.Ticker.tapToDismiss.getter();
  v564(v539, v562, v563);
  v572 = v1487;
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v1487, v566, v1483);
  v1441 = (_BYTE *)0xD000000000000013;
  v573 = v571;
  v574 = v1492;
  v575 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v573, 0xD000000000000013, 0x8000000100036EF0, v539, v572, &_swiftEmptyArrayStorage);
  v576 = v1482;
  *(_QWORD *)(v534 + 176) = v574;
  *(_QWORD *)(v534 + 184) = v576;
  *(_QWORD *)(v534 + 152) = v575;
  Group.init(title:footer:_:)(0x6C6172656E6547, 0xE700000000000000, 0, 0, v534);
  v577 = v1491;
  v578 = swift_allocObject(v1491, 72, 7);
  *(_OWORD *)(v578 + 16) = v1486;
  sub_100031980(0);
  v580 = v579;
  v1395 = v579;
  refreshed = static Settings.ForYou.Feed.autoRefreshStrategy.getter();
  v1398 = (void (*)(_QWORD, _QWORD, _QWORD))v1403[13];
  v582 = v1434;
  v1398(v1434, v566, v1439);
  v1397 = sub_100008EA0((unint64_t *)&unk_1000493C0, (uint64_t (*)(uint64_t))&type metadata accessor for FeedAutoRefreshStrategy, (uint64_t)&protocol conformance descriptor for FeedAutoRefreshStrategy);
  v1396 = (char *)0x8000000100036F10;
  v583 = Item<>.init(_:label:resetBehavior:actions:)(refreshed, v1495, 0x8000000100036F10, v582, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v578 + 56) = v580;
  v1394 = sub_100008EA0((unint64_t *)&unk_1000493C8, (uint64_t (*)(uint64_t))sub_100031980, (uint64_t)&protocol conformance descriptor for Item<A>);
  *(_QWORD *)(v578 + 64) = v1394;
  *(_QWORD *)(v578 + 32) = v583;
  Group.init(title:footer:_:)(0x68736572666552, 0xE700000000000000, 0, 0, v578);
  v584 = v1433;
  v1433[7] = v1478;
  v584[8] = &protocol witness table for Page;
  v585 = v584;
  sub_10000F58C(v1440);
  Page.init(title:_:)(0x756F5920726F46, 0xE700000000000000, v1399);
  v1403 = v585 + 9;
  v586 = swift_allocObject(v1471, v1384, v1472);
  v1440 = (_QWORD *)v586;
  *(_OWORD *)(v586 + 16) = v1455;
  v587 = (char *)(v586 + v1473);
  static Settings.StockFeed.configOverrides.getter();
  v588 = v577;
  v589 = swift_allocObject(v577, 72, 7);
  *(_OWORD *)(v589 + 16) = v1486;
  type metadata accessor for Settings.StockFeed.ConfigOverrides(0);
  v590 = static Settings.StockFeed.ConfigOverrides.url.getter();
  v591 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v591 + 16) = v1493;
  *(_QWORD *)(v591 + 32) = static SettingActions.restart.getter(v591);
  *(_QWORD *)&v1497 = v591;
  specialized Array._endMutation()();
  v592 = v1497;
  v593 = v1460;
  v594 = v1494;
  v1457(v1460, v1494, v1459);
  v595 = v592;
  v596 = v1465;
  v597 = Item<>.init(_:label:resetBehavior:actions:)(v590, 5001813, 0xE300000000000000, v593, v595);
  v598 = v1456;
  *(_QWORD *)(v589 + 56) = v596;
  *(_QWORD *)(v589 + 64) = v598;
  *(_QWORD *)(v589 + 32) = v597;
  Group.init(title:footer:group:_:)(v1454);
  v1393 = &v587[v1469];
  v599 = v587;
  v1399 = v587;
  v600 = swift_allocObject(v588, 72, 7);
  *(_OWORD *)(v600 + 16) = v1486;
  v601 = static Settings.ChartOptions.showYTD.getter();
  v602 = v1474;
  v603 = v1489;
  v604 = v1488;
  v605 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1474, v1489, v1488);
  v606 = v1487;
  v607 = v594;
  v608 = v1483;
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v1487, v607, v1483);
  v609 = v601;
  v610 = v1492;
  v611 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v609, 0x44545920776F6853, 0xE800000000000000, v602, v606, &_swiftEmptyArrayStorage);
  v612 = v1482;
  *(_QWORD *)(v600 + 56) = v610;
  *(_QWORD *)(v600 + 64) = v612;
  *(_QWORD *)(v600 + 32) = v611;
  Group.init(title:footer:_:)(0x737472616843, 0xE600000000000000, 0, 0, v600);
  v1393 = &v599[v1462];
  v613 = swift_allocObject(v1491, 152, 7);
  *(_OWORD *)(v613 + 16) = v1448;
  v614 = static Settings.StockFeed.Layout.Chunking.overrideEnabled.getter();
  v615 = v603;
  v616 = v604;
  v617 = v605;
  v605(v602, v615, v604);
  v618 = v1494;
  v619 = v608;
  ((void (*)(char *, _QWORD, uint64_t))v1485)(v606, v1494, v608);
  v620 = v614;
  v621 = v1492;
  v622 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v620, 0xD000000000000011, 0x8000000100036F30, v602, v606, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v613 + 56) = v621;
  *(_QWORD *)(v613 + 64) = v612;
  *(_QWORD *)(v613 + 32) = v622;
  v623 = static Settings.StockFeed.Layout.Chunking.overrideChunkSize.getter();
  v624 = v1489;
  v625 = v616;
  v617(v602, v1489, v616);
  v626 = v617;
  v627 = v1458;
  v628 = v618;
  v1452(v1458, v618, v1464);
  v629 = v623;
  v630 = v1463;
  v631 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v629, v1441, 0x8000000100036F50, v602, v627, &_swiftEmptyArrayStorage);
  v632 = v1447;
  *(_QWORD *)(v613 + 96) = v630;
  *(_QWORD *)(v613 + 104) = v632;
  *(_QWORD *)(v613 + 72) = v631;
  v633 = static Settings.StockFeed.Layout.overrideVerticalQuoteDetailLayout.getter();
  v626(v602, v624, v625);
  v634 = v1487;
  v635 = v628;
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v1487, v628, v619);
  v636 = v633;
  v637 = v1492;
  v638 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v636, v1453, 0x8000000100036F70, v602, v634, &_swiftEmptyArrayStorage);
  v639 = v1482;
  *(_QWORD *)(v613 + 136) = v637;
  *(_QWORD *)(v613 + 144) = v639;
  *(_QWORD *)(v613 + 112) = v638;
  Group.init(title:footer:_:)(0x74756F79614CLL, 0xE600000000000000, 0, 0, v613);
  v640 = v1491;
  v641 = swift_allocObject(v1491, 72, 7);
  *(_OWORD *)(v641 + 16) = v1486;
  v642 = static Settings.StockFeed.Feed.autoRefreshStrategy.getter();
  v643 = v1434;
  v1398(v1434, v628, v1439);
  v644 = v642;
  v645 = v1395;
  v646 = Item<>.init(_:label:resetBehavior:actions:)(v644, v1495, v1396, v643, &_swiftEmptyArrayStorage);
  v647 = v1394;
  *(_QWORD *)(v641 + 56) = v645;
  *(_QWORD *)(v641 + 64) = v647;
  *(_QWORD *)(v641 + 32) = v646;
  Group.init(title:footer:_:)(0x68736572666552, 0xE700000000000000, 0, 0, v641);
  v648 = swift_allocObject(v640, 72, 7);
  *(_OWORD *)(v648 + 16) = v1486;
  v649 = static Settings.StockFeed.Toolbar.overrideAlwaysShowUpdatedLabelEnabled.getter();
  v650 = v602;
  v626(v602, v1489, v1488);
  v651 = v1487;
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v1487, v635, v1483);
  v652 = v649;
  v653 = v1492;
  v654 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v652, v1420, 0x8000000100036F90, v650, v651, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v648 + 56) = v653;
  *(_QWORD *)(v648 + 64) = v639;
  *(_QWORD *)(v648 + 32) = v654;
  Group.init(title:footer:_:)(0x7261626C6F6F54, 0xE700000000000000, 0, 0, v648);
  v655 = v1478;
  v656 = v1433;
  v1433[12] = v1478;
  v656[13] = &protocol witness table for Page;
  sub_10000F58C(v1403);
  Page.init(title:_:)(0x6546206B636F7453, 0xEA00000000006465, v1440);
  v1495 = v656 + 14;
  v657 = v1471;
  v658 = v1472;
  v659 = swift_allocObject(v1471, v1476, v1472);
  *(_OWORD *)(v659 + 16) = v1486;
  v660 = v1473;
  v1440 = (_QWORD *)(v659 + v1473);
  v1453 = static Settings.NewsArticlesModules.EndOfArticleFeed.configOverrides.getter();
  v661 = swift_allocObject(v640, 72, 7);
  *(_OWORD *)(v661 + 16) = v1486;
  type metadata accessor for Settings.NewsArticlesModules.EndOfArticleFeed.ConfigOverrides(0);
  v662 = static Settings.NewsArticlesModules.EndOfArticleFeed.ConfigOverrides.url.getter();
  v663 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v663 + 16) = v1493;
  *(_QWORD *)(v663 + 32) = static SettingActions.restart.getter(v663);
  *(_QWORD *)&v1497 = v663;
  specialized Array._endMutation()();
  v664 = v1497;
  v665 = v1460;
  v1457(v1460, v1494, v1459);
  v666 = v664;
  v667 = v1465;
  v668 = Item<>.init(_:label:resetBehavior:actions:)(v662, 5001813, 0xE300000000000000, v665, v666);
  v669 = v1456;
  *(_QWORD *)(v661 + 56) = v667;
  *(_QWORD *)(v661 + 64) = v669;
  *(_QWORD *)(v661 + 32) = v668;
  v670 = v1454;
  Group.init(title:footer:group:_:)(v1454);
  v656[17] = v655;
  v656[18] = &protocol witness table for Page;
  sub_10000F58C(v1495);
  Page.init(title:_:)(v1441, 0x8000000100036FB0, v659);
  v1403 = v656 + 19;
  v671 = swift_allocObject(v657, v660 + v1469 + v1424, v658);
  v1399 = (char *)v671;
  *(_OWORD *)(v671 + 16) = v1385;
  v1453 = v671 + v660;
  v672 = swift_allocObject(v1491, 112, 7);
  *(_OWORD *)(v672 + 16) = v1466;
  v1495 = (_QWORD *)static Settings.Welcome.Version.latestCompleted.getter();
  v673 = v1484;
  v674 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v674 + 16) = v1493;
  *(_QWORD *)(v674 + 32) = static SettingActions.restart.getter(v674);
  *(_QWORD *)&v1497 = v674;
  specialized Array._endMutation()();
  v675 = v1497;
  v676 = v1474;
  v677 = v1489;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1474, v1489, v1488);
  v678 = v1458;
  v679 = v1464;
  v680 = v1452;
  v1452(v1458, v1494, v1464);
  v681 = v675;
  v682 = v1463;
  v683 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1495, v670, 0x8000000100036FD0, v676, v678, v681);
  v684 = v1447;
  *(_QWORD *)(v672 + 56) = v682;
  *(_QWORD *)(v672 + 64) = v684;
  *(_QWORD *)(v672 + 32) = v683;
  v1495 = (_QWORD *)static Settings.Welcome.Version.debugLatestCompleted.getter();
  v685 = swift_allocObject(v673, 40, 7);
  *(_OWORD *)(v685 + 16) = v1493;
  *(_QWORD *)(v685 + 32) = static SettingActions.restart.getter(v685);
  *(_QWORD *)&v1497 = v685;
  specialized Array._endMutation()();
  v686 = v1497;
  v687 = v676;
  ((void (*)(char *, uint64_t, uint64_t))v1490)(v676, v677, v1488);
  v688 = v1458;
  v689 = v1494;
  v680(v1458, v1494, v679);
  v690 = v686;
  v691 = v1463;
  v692 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1495, v1422, 0x8000000100036FF0, v687, v688, v690);
  *(_QWORD *)(v672 + 96) = v691;
  *(_QWORD *)(v672 + 104) = v684;
  *(_QWORD *)(v672 + 72) = v692;
  v693 = v1453;
  Group.init(title:footer:_:)(0x6E6F6973726556, 0xE700000000000000, 0, 0, v672);
  v1440 = (_QWORD *)(v693 + v1469);
  v694 = swift_allocObject(v1491, 192, 7);
  *(_OWORD *)(v694 + 16) = v1446;
  v695 = static Settings.Welcome.Animations.WelcomeToStocksScaleUp.initialScale.getter();
  v696 = v1405;
  *v1405 = 1008981770;
  v697 = enum case for Item.RangeControlType.stepper<A>(_:);
  v698 = *(_QWORD **)(v1404 + 104);
  LODWORD(v1477) = enum case for Item.RangeControlType.stepper<A>(_:);
  ((void (*)(_DWORD *, _QWORD, char *))v698)(v696, enum case for Item.RangeControlType.stepper<A>(_:), v1467);
  v1495 = v698;
  v699 = v1470;
  v700 = v689;
  v701 = v1480;
  v702 = (void (*)(_QWORD, _QWORD, _QWORD))v1479;
  ((void (*)(char *, uint64_t, uint64_t))v1479)(v1470, v689, v1480);
  v703 = v702;
  v704 = v1468;
  v705 = Item<>.init(_:label:resetBehavior:type:)(v695, 0x206C616974696E49, 0xED0000656C616353, v699, v696, &protocol witness table for Double);
  v706 = v1475;
  *(_QWORD *)(v694 + 56) = v704;
  *(_QWORD *)(v694 + 64) = v706;
  v707 = v706;
  *(_QWORD *)(v694 + 32) = v705;
  v708 = static Settings.Welcome.Animations.WelcomeToStocksScaleUp.mass.getter();
  *v696 = 1036831949;
  ((void (*)(_DWORD *, uint64_t, char *))v698)(v696, v697, v1467);
  v709 = v1470;
  v703(v1470, v700, v701);
  v710 = Item<>.init(_:label:resetBehavior:type:)(v708, 1936941389, 0xE400000000000000, v709, v696, &protocol witness table for Double);
  *(_QWORD *)(v694 + 96) = v704;
  *(_QWORD *)(v694 + 104) = v707;
  *(_QWORD *)(v694 + 72) = v710;
  v1439 = static Settings.Welcome.Animations.WelcomeToStocksScaleUp.damping.getter();
  v711 = v1474;
  v712 = v1489;
  v713 = v1488;
  v714 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1474, v1489, v1488);
  v715 = v1470;
  v716 = v1480;
  v703(v1470, v1494, v1480);
  v717 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1439, 0x676E69706D6144, 0xE700000000000000, v711, v715, &_swiftEmptyArrayStorage);
  v718 = v1475;
  *(_QWORD *)(v694 + 136) = v704;
  *(_QWORD *)(v694 + 144) = v718;
  *(_QWORD *)(v694 + 112) = v717;
  v719 = static Settings.Welcome.Animations.WelcomeToStocksScaleUp.stiffness.getter();
  v714(v711, v712, v713);
  v720 = v1470;
  v721 = v1494;
  ((void (*)(char *, _QWORD, uint64_t))v1479)(v1470, v1494, v716);
  v722 = v720;
  v723 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v719, 0x73656E6666697453, 0xE900000000000073, v711, v720, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v694 + 176) = v704;
  *(_QWORD *)(v694 + 184) = v718;
  *(_QWORD *)(v694 + 152) = v723;
  Group.init(title:footer:_:)(v1419, 0x8000000100037010, 0, 0, v694);
  v1434 = (char *)(v1453 + v1462);
  v724 = swift_allocObject(v1491, 232, 7);
  *(_OWORD *)(v724 + 16) = v1455;
  v725 = static Settings.Welcome.Animations.WelcomeToStocksFadeIn.duration.getter();
  *v696 = 1036831949;
  v726 = v1477;
  v727 = v1467;
  v728 = v1495;
  ((void (*)(_DWORD *, _QWORD, char *))v1495)(v696, v1477, v1467);
  v729 = v721;
  v730 = v1480;
  v731 = (void (*)(_QWORD, _QWORD, _QWORD))v1479;
  ((void (*)(char *, uint64_t, uint64_t))v1479)(v722, v729, v1480);
  v732 = Item<>.init(_:label:resetBehavior:type:)(v725, 0x6E6F697461727544, 0xE800000000000000, v722, v696, &protocol witness table for Double);
  v733 = v1475;
  *(_QWORD *)(v724 + 56) = v704;
  *(_QWORD *)(v724 + 64) = v733;
  *(_QWORD *)(v724 + 32) = v732;
  v734 = static Settings.Welcome.Animations.WelcomeToStocksFadeIn.controlOneX.getter();
  *v696 = 1008981770;
  ((void (*)(_DWORD *, uint64_t, char *))v728)(v696, v726, v727);
  v735 = v1494;
  v736 = v730;
  v731(v722, v1494, v730);
  v737 = Item<>.init(_:label:resetBehavior:type:)(v734, 0x206C6F72746E6F43, 0xEB00000000582031, v722, v696, &protocol witness table for Double);
  v738 = v1475;
  *(_QWORD *)(v724 + 96) = v704;
  *(_QWORD *)(v724 + 104) = v738;
  *(_QWORD *)(v724 + 72) = v737;
  v739 = static Settings.Welcome.Animations.WelcomeToStocksFadeIn.controlOneY.getter();
  *v696 = 1008981770;
  v740 = v1477;
  v741 = v1467;
  ((void (*)(_DWORD *, _QWORD, char *))v1495)(v696, v1477, v1467);
  v742 = v736;
  v743 = (void (*)(_QWORD, _QWORD, _QWORD))v1479;
  ((void (*)(char *, uint64_t, uint64_t))v1479)(v722, v735, v742);
  v1439 = 0xEB00000000592031;
  v744 = Item<>.init(_:label:resetBehavior:type:)(v739, 0x206C6F72746E6F43, 0xEB00000000592031, v722, v696, &protocol witness table for Double);
  *(_QWORD *)(v724 + 136) = v704;
  *(_QWORD *)(v724 + 144) = v738;
  *(_QWORD *)(v724 + 112) = v744;
  v745 = static Settings.Welcome.Animations.WelcomeToStocksFadeIn.controlTwoX.getter();
  *v696 = 1008981770;
  v746 = v741;
  v747 = v741;
  v748 = v1495;
  ((void (*)(_DWORD *, uint64_t, char *))v1495)(v696, v740, v746);
  v743(v722, v1494, v1480);
  v749 = v743;
  v1440 = (_QWORD *)0xEB00000000582032;
  v750 = Item<>.init(_:label:resetBehavior:type:)(v745, 0x206C6F72746E6F43, 0xEB00000000582032, v722, v696, &protocol witness table for Double);
  v751 = v1475;
  *(_QWORD *)(v724 + 176) = v704;
  *(_QWORD *)(v724 + 184) = v751;
  *(_QWORD *)(v724 + 152) = v750;
  v752 = static Settings.Welcome.Animations.WelcomeToStocksFadeIn.controlTwoY.getter();
  *v696 = 1008981770;
  ((void (*)(_DWORD *, uint64_t, char *))v748)(v696, v740, v747);
  v753 = v1494;
  v754 = v1480;
  v749(v722, v1494, v1480);
  v755 = Item<>.init(_:label:resetBehavior:type:)(v752, 0x206C6F72746E6F43, 0xEB00000000592032, v722, v696, &protocol witness table for Double);
  *(_QWORD *)(v724 + 216) = v704;
  *(_QWORD *)(v724 + 224) = v751;
  *(_QWORD *)(v724 + 192) = v755;
  Group.init(title:footer:_:)(v1420, 0x8000000100037030, 0, 0, v724);
  v1434 = (char *)(v1453 + v1451);
  v756 = swift_allocObject(v1491, 272, 7);
  *(_OWORD *)(v756 + 16) = v1426;
  v1420 = static Settings.Welcome.Animations.ActivityIndicatorFadeIn.delay.getter();
  *v696 = 1008981770;
  v757 = v1477;
  v758 = v1495;
  ((void (*)(_DWORD *, _QWORD, char *))v1495)(v696, v1477, v747);
  v759 = v722;
  v760 = v722;
  v761 = v754;
  v762 = v754;
  v763 = (void (*)(_QWORD, _QWORD, _QWORD))v1479;
  ((void (*)(char *, uint64_t, uint64_t))v1479)(v760, v753, v761);
  v764 = Item<>.init(_:label:resetBehavior:type:)(v1420, 0x79616C6544, 0xE500000000000000, v759, v696, &protocol witness table for Double);
  v765 = v1475;
  *(_QWORD *)(v756 + 56) = v704;
  *(_QWORD *)(v756 + 64) = v765;
  *(_QWORD *)(v756 + 32) = v764;
  v766 = static Settings.Welcome.Animations.ActivityIndicatorFadeIn.duration.getter();
  *v696 = 1008981770;
  ((void (*)(_DWORD *, uint64_t, char *))v758)(v696, v757, v747);
  v767 = v1470;
  v768 = v1494;
  v763(v1470, v1494, v762);
  v769 = v767;
  v770 = Item<>.init(_:label:resetBehavior:type:)(v766, 0x6E6F697461727544, 0xE800000000000000, v767, v696, &protocol witness table for Double);
  *(_QWORD *)(v756 + 96) = v704;
  *(_QWORD *)(v756 + 104) = v765;
  *(_QWORD *)(v756 + 72) = v770;
  v771 = static Settings.Welcome.Animations.ActivityIndicatorFadeIn.controlOneX.getter();
  *v696 = 1008981770;
  v772 = v757;
  v773 = v757;
  v774 = v1467;
  ((void (*)(_DWORD *, uint64_t, char *))v1495)(v696, v773, v1467);
  v775 = v768;
  v776 = v1480;
  v763(v769, v775, v1480);
  v777 = Item<>.init(_:label:resetBehavior:type:)(v771, 0x206C6F72746E6F43, 0xEB00000000582031, v769, v696, &protocol witness table for Double);
  *(_QWORD *)(v756 + 136) = v704;
  *(_QWORD *)(v756 + 144) = v765;
  *(_QWORD *)(v756 + 112) = v777;
  v778 = static Settings.Welcome.Animations.ActivityIndicatorFadeIn.controlOneY.getter();
  *v696 = 1008981770;
  v779 = v772;
  v780 = v774;
  v781 = v774;
  v782 = v1495;
  ((void (*)(_DWORD *, uint64_t, char *))v1495)(v696, v779, v780);
  v783 = v1494;
  v763(v769, v1494, v776);
  v784 = Item<>.init(_:label:resetBehavior:type:)(v778, 0x206C6F72746E6F43, v1439, v769, v696, &protocol witness table for Double);
  v785 = v1475;
  *(_QWORD *)(v756 + 176) = v704;
  *(_QWORD *)(v756 + 184) = v785;
  *(_QWORD *)(v756 + 152) = v784;
  v1420 = static Settings.Welcome.Animations.ActivityIndicatorFadeIn.controlTwoX.getter();
  *v696 = 1008981770;
  v786 = v1477;
  ((void (*)(_DWORD *, _QWORD, char *))v782)(v696, v1477, v781);
  v787 = (void (*)(_QWORD, _QWORD, _QWORD))v782;
  v788 = v1470;
  v789 = v1480;
  v763(v1470, v783, v1480);
  v790 = Item<>.init(_:label:resetBehavior:type:)(v1420, 0x206C6F72746E6F43, v1440, v788, v696, &protocol witness table for Double);
  v791 = v1475;
  *(_QWORD *)(v756 + 216) = v704;
  *(_QWORD *)(v756 + 224) = v791;
  *(_QWORD *)(v756 + 192) = v790;
  v792 = static Settings.Welcome.Animations.ActivityIndicatorFadeIn.controlTwoY.getter();
  *v696 = 1008981770;
  v787(v696, v786, v781);
  v793 = v1470;
  v763(v1470, v1494, v789);
  v794 = Item<>.init(_:label:resetBehavior:type:)(v792, 0x206C6F72746E6F43, 0xEB00000000592032, v793, v696, &protocol witness table for Double);
  *(_QWORD *)(v756 + 256) = v704;
  *(_QWORD *)(v756 + 264) = v791;
  *(_QWORD *)(v756 + 232) = v794;
  Group.init(title:footer:_:)(v1419, 0x8000000100037050, 0, 0, v756);
  v1434 = (char *)(v1453 + v1443);
  v795 = swift_allocObject(v1491, 232, 7);
  *(_OWORD *)(v795 + 16) = v1455;
  v796 = static Settings.Welcome.Animations.SpinnerFadeOut.duration.getter();
  *v696 = 1036831949;
  v797 = v1477;
  v798 = v1467;
  v799 = v1495;
  ((void (*)(_DWORD *, _QWORD, char *))v1495)(v696, v1477, v1467);
  ((void (*)(char *, _QWORD, uint64_t))v1479)(v793, v1494, v789);
  v800 = v793;
  v801 = v793;
  v802 = v704;
  v803 = Item<>.init(_:label:resetBehavior:type:)(v796, 0x6E6F697461727544, 0xE800000000000000, v800, v696, &protocol witness table for Double);
  *(_QWORD *)(v795 + 56) = v704;
  *(_QWORD *)(v795 + 64) = v791;
  *(_QWORD *)(v795 + 32) = v803;
  v804 = static Settings.Welcome.Animations.SpinnerFadeOut.controlOneX.getter();
  *v696 = 1008981770;
  v805 = v797;
  ((void (*)(_DWORD *, uint64_t, char *))v799)(v696, v797, v798);
  v806 = v1494;
  v807 = v1480;
  v808 = (void (*)(_QWORD, _QWORD, _QWORD))v1479;
  ((void (*)(char *, _QWORD, uint64_t))v1479)(v801, v1494, v1480);
  v809 = Item<>.init(_:label:resetBehavior:type:)(v804, 0x206C6F72746E6F43, 0xEB00000000582031, v801, v696, &protocol witness table for Double);
  *(_QWORD *)(v795 + 96) = v802;
  *(_QWORD *)(v795 + 104) = v791;
  *(_QWORD *)(v795 + 72) = v809;
  v810 = static Settings.Welcome.Animations.SpinnerFadeOut.controlOneY.getter();
  *v696 = 1008981770;
  v811 = v1467;
  ((void (*)(_DWORD *, uint64_t, char *))v1495)(v696, v805, v1467);
  v812 = v801;
  v813 = v801;
  v814 = v806;
  v808(v813, v806, v807);
  v815 = v810;
  v816 = v812;
  v817 = v1468;
  v818 = Item<>.init(_:label:resetBehavior:type:)(v815, 0x206C6F72746E6F43, v1439, v812, v696, &protocol witness table for Double);
  *(_QWORD *)(v795 + 136) = v817;
  *(_QWORD *)(v795 + 144) = v791;
  *(_QWORD *)(v795 + 112) = v818;
  v1420 = static Settings.Welcome.Animations.SpinnerFadeOut.controlTwoX.getter();
  *v696 = 1008981770;
  v819 = v1477;
  v820 = v1495;
  ((void (*)(_DWORD *, _QWORD, char *))v1495)(v696, v1477, v811);
  v821 = v814;
  v822 = v1480;
  v808(v816, v821, v1480);
  v823 = Item<>.init(_:label:resetBehavior:type:)(v1420, 0x206C6F72746E6F43, v1440, v816, v696, &protocol witness table for Double);
  *(_QWORD *)(v795 + 176) = v817;
  *(_QWORD *)(v795 + 184) = v791;
  *(_QWORD *)(v795 + 152) = v823;
  v824 = static Settings.Welcome.Animations.SpinnerFadeOut.controlTwoY.getter();
  *v696 = 1008981770;
  ((void (*)(_DWORD *, uint64_t, char *))v820)(v696, v819, v811);
  v825 = v1470;
  v808(v1470, v1494, v822);
  v826 = Item<>.init(_:label:resetBehavior:type:)(v824, 0x206C6F72746E6F43, 0xEB00000000592032, v825, v696, &protocol witness table for Double);
  *(_QWORD *)(v795 + 216) = v817;
  *(_QWORD *)(v795 + 224) = v791;
  *(_QWORD *)(v795 + 192) = v826;
  Group.init(title:footer:_:)(v1454, 0x8000000100037070, 0, 0, v795);
  v1434 = (char *)(v1453 + v1423);
  v827 = swift_allocObject(v1491, 232, 7);
  *(_OWORD *)(v827 + 16) = v1455;
  v828 = static Settings.Welcome.Animations.AppIconFadeOut.duration.getter();
  *v696 = 1036831949;
  v829 = v1477;
  v830 = v1467;
  v831 = v1495;
  ((void (*)(_DWORD *, _QWORD, char *))v1495)(v696, v1477, v1467);
  v832 = v1494;
  v808(v825, v1494, v1480);
  v833 = Item<>.init(_:label:resetBehavior:type:)(v828, 0x6E6F697461727544, 0xE800000000000000, v825, v696, &protocol witness table for Double);
  v834 = v1475;
  *(_QWORD *)(v827 + 56) = v817;
  *(_QWORD *)(v827 + 64) = v834;
  *(_QWORD *)(v827 + 32) = v833;
  v1423 = static Settings.Welcome.Animations.AppIconFadeOut.controlOneX.getter();
  *v696 = 1008981770;
  ((void (*)(_DWORD *, uint64_t, char *))v831)(v696, v829, v830);
  v835 = (void (*)(_QWORD, _QWORD, _QWORD))v831;
  v836 = v1470;
  v837 = v1480;
  v808(v1470, v832, v1480);
  v838 = v808;
  v839 = Item<>.init(_:label:resetBehavior:type:)(v1423, 0x206C6F72746E6F43, 0xEB00000000582031, v836, v696, &protocol witness table for Double);
  *(_QWORD *)(v827 + 96) = v817;
  *(_QWORD *)(v827 + 104) = v834;
  v840 = v834;
  *(_QWORD *)(v827 + 72) = v839;
  v1423 = static Settings.Welcome.Animations.AppIconFadeOut.controlOneY.getter();
  *v696 = 1008981770;
  v841 = v1477;
  v842 = v1467;
  v835(v696, v1477, v1467);
  v843 = v1494;
  v838(v836, v1494, v837);
  v844 = v836;
  v845 = Item<>.init(_:label:resetBehavior:type:)(v1423, 0x206C6F72746E6F43, v1439, v836, v696, &protocol witness table for Double);
  *(_QWORD *)(v827 + 136) = v817;
  *(_QWORD *)(v827 + 144) = v840;
  *(_QWORD *)(v827 + 112) = v845;
  v1423 = static Settings.Welcome.Animations.AppIconFadeOut.controlTwoX.getter();
  *v696 = 1008981770;
  v846 = v1495;
  ((void (*)(_DWORD *, uint64_t, char *))v1495)(v696, v841, v842);
  v847 = v836;
  v848 = v1480;
  v849 = (void (*)(_QWORD, _QWORD, _QWORD))v1479;
  ((void (*)(char *, uint64_t, uint64_t))v1479)(v847, v843, v1480);
  v850 = Item<>.init(_:label:resetBehavior:type:)(v1423, 0x206C6F72746E6F43, v1440, v844, v696, &protocol witness table for Double);
  *(_QWORD *)(v827 + 176) = v817;
  *(_QWORD *)(v827 + 184) = v840;
  *(_QWORD *)(v827 + 152) = v850;
  v1423 = static Settings.Welcome.Animations.AppIconFadeOut.controlTwoY.getter();
  *v696 = 1008981770;
  ((void (*)(_DWORD *, _QWORD, char *))v846)(v696, v1477, v842);
  v849(v844, v843, v848);
  v851 = v844;
  v852 = Item<>.init(_:label:resetBehavior:type:)(v1423, 0x206C6F72746E6F43, 0xEB00000000592032, v844, v696, &protocol witness table for Double);
  *(_QWORD *)(v827 + 216) = v817;
  *(_QWORD *)(v827 + 224) = v840;
  *(_QWORD *)(v827 + 192) = v852;
  Group.init(title:footer:_:)(0xD000000000000011, 0x8000000100037090, 0, 0, v827);
  v1425 += v1453;
  v853 = swift_allocObject(v1491, 192, 7);
  *(_OWORD *)(v853 + 16) = v1446;
  v854 = static Settings.Welcome.Animations.Page2Moves.delay.getter();
  *v696 = 1008981770;
  v855 = v1477;
  v856 = v1495;
  ((void (*)(_DWORD *, _QWORD, char *))v1495)(v696, v1477, v842);
  v857 = v851;
  v858 = v851;
  v859 = v1494;
  ((void (*)(char *, _QWORD, uint64_t))v1479)(v858, v1494, v848);
  v1434 = (char *)0xD000000000000018;
  v860 = Item<>.init(_:label:resetBehavior:type:)(v854, 0xD000000000000018, 0x80000001000370D0, v857, v696, &protocol witness table for Double);
  v861 = v1475;
  *(_QWORD *)(v853 + 56) = v817;
  *(_QWORD *)(v853 + 64) = v861;
  *(_QWORD *)(v853 + 32) = v860;
  v862 = static Settings.Welcome.Animations.Page2Moves.mass.getter();
  *v696 = 1036831949;
  ((void (*)(_DWORD *, uint64_t, char *))v856)(v696, v855, v842);
  v863 = v848;
  v864 = v848;
  v865 = (void (*)(_QWORD, _QWORD, _QWORD))v1479;
  ((void (*)(char *, uint64_t, uint64_t))v1479)(v857, v859, v863);
  v866 = v862;
  v867 = v1468;
  v868 = Item<>.init(_:label:resetBehavior:type:)(v866, 1936941389, 0xE400000000000000, v857, v696, &protocol witness table for Double);
  *(_QWORD *)(v853 + 96) = v867;
  *(_QWORD *)(v853 + 104) = v861;
  *(_QWORD *)(v853 + 72) = v868;
  v1423 = static Settings.Welcome.Animations.Page2Moves.damping.getter();
  v869 = v1474;
  v870 = v1489;
  v871 = v1488;
  v872 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1474, v1489, v1488);
  v873 = v857;
  v874 = v857;
  v875 = v1494;
  v865(v873, v1494, v864);
  v876 = v869;
  v877 = v869;
  v878 = v874;
  v879 = v874;
  v880 = v1468;
  v881 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1423, 0x676E69706D6144, 0xE700000000000000, v876, v879, &_swiftEmptyArrayStorage);
  v882 = v1475;
  *(_QWORD *)(v853 + 136) = v880;
  *(_QWORD *)(v853 + 144) = v882;
  *(_QWORD *)(v853 + 112) = v881;
  v883 = static Settings.Welcome.Animations.Page2Moves.stiffness.getter();
  v872(v877, v870, v871);
  v884 = v875;
  ((void (*)(char *, uint64_t, uint64_t))v1479)(v878, v875, v1480);
  v885 = v883;
  v886 = v877;
  v887 = v878;
  v888 = v1468;
  v889 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v885, 0x73656E6666697453, 0xE900000000000073, v886, v878, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v853 + 176) = v888;
  *(_QWORD *)(v853 + 184) = v882;
  v890 = v882;
  *(_QWORD *)(v853 + 152) = v889;
  Group.init(title:footer:_:)(0xD000000000000011, 0x80000001000370B0, 0, 0, v853);
  v1425 = v1453 + v1386;
  v891 = swift_allocObject(v1491, 232, 7);
  *(_OWORD *)(v891 + 16) = v1455;
  v892 = static Settings.Welcome.Animations.Page2FadeIns.duration.getter();
  *v696 = 1036831949;
  v893 = v1477;
  v894 = v1467;
  v895 = v1495;
  ((void (*)(_DWORD *, _QWORD, char *))v1495)(v696, v1477, v1467);
  v896 = v887;
  v897 = v887;
  v898 = v1480;
  ((void (*)(char *, uint64_t, uint64_t))v1479)(v897, v884, v1480);
  v899 = v892;
  v900 = v1468;
  v901 = Item<>.init(_:label:resetBehavior:type:)(v899, 0x6E6F697461727544, 0xE800000000000000, v896, v696, &protocol witness table for Double);
  *(_QWORD *)(v891 + 56) = v900;
  *(_QWORD *)(v891 + 64) = v890;
  *(_QWORD *)(v891 + 32) = v901;
  v1423 = static Settings.Welcome.Animations.Page2FadeIns.controlOneX.getter();
  *v696 = 1008981770;
  v902 = v893;
  ((void (*)(_DWORD *, uint64_t, char *))v895)(v696, v893, v894);
  v903 = v884;
  v904 = v898;
  v905 = v898;
  v906 = (void (*)(_QWORD, _QWORD, _QWORD))v1479;
  ((void (*)(char *, uint64_t, uint64_t))v1479)(v896, v884, v905);
  v907 = Item<>.init(_:label:resetBehavior:type:)(v1423, 0x206C6F72746E6F43, 0xEB00000000582031, v896, v696, &protocol witness table for Double);
  v908 = v1475;
  *(_QWORD *)(v891 + 96) = v900;
  *(_QWORD *)(v891 + 104) = v908;
  *(_QWORD *)(v891 + 72) = v907;
  v1423 = static Settings.Welcome.Animations.Page2FadeIns.controlOneY.getter();
  *v696 = 1008981770;
  v909 = v902;
  v910 = v1467;
  v911 = v1495;
  ((void (*)(_DWORD *, uint64_t, char *))v1495)(v696, v909, v1467);
  v906(v896, v903, v904);
  v912 = (uint64_t)v896;
  v913 = Item<>.init(_:label:resetBehavior:type:)(v1423, 0x206C6F72746E6F43, v1439, v896, v696, &protocol witness table for Double);
  *(_QWORD *)(v891 + 136) = v900;
  *(_QWORD *)(v891 + 144) = v908;
  *(_QWORD *)(v891 + 112) = v913;
  v1423 = static Settings.Welcome.Animations.Page2FadeIns.controlTwoX.getter();
  *v696 = 1008981770;
  v914 = v1477;
  v915 = (void (*)(_QWORD, _QWORD, _QWORD))v911;
  ((void (*)(_DWORD *, _QWORD, char *))v911)(v696, v1477, v910);
  v916 = v912;
  v917 = v912;
  v918 = v1494;
  v919 = (void (*)(_QWORD, _QWORD, _QWORD))v1479;
  ((void (*)(char *, _QWORD, uint64_t))v1479)((char *)v917, v1494, v904);
  v920 = Item<>.init(_:label:resetBehavior:type:)(v1423, 0x206C6F72746E6F43, v1440, (char *)v916, v696, &protocol witness table for Double);
  v921 = v1475;
  *(_QWORD *)(v891 + 176) = v900;
  *(_QWORD *)(v891 + 184) = v921;
  *(_QWORD *)(v891 + 152) = v920;
  v922 = static Settings.Welcome.Animations.Page2FadeIns.controlTwoY.getter();
  *v696 = 1008981770;
  v915(v696, v914, v1467);
  v923 = v1470;
  v924 = v918;
  v919(v1470, v918, v904);
  v925 = Item<>.init(_:label:resetBehavior:type:)(v922, 0x206C6F72746E6F43, 0xEB00000000592032, v923, v696, &protocol witness table for Double);
  *(_QWORD *)(v891 + 216) = v900;
  *(_QWORD *)(v891 + 224) = v921;
  *(_QWORD *)(v891 + 192) = v925;
  Group.init(title:footer:_:)(v1444, 0x80000001000370F0, 0, 0, v891);
  v1453 += v1424;
  v926 = swift_allocObject(v1491, 232, 7);
  *(_OWORD *)(v926 + 16) = v1455;
  v927 = static Settings.Welcome.Animations.DismissFade.duration.getter();
  *v696 = 1036831949;
  v928 = v1477;
  v929 = v1467;
  v930 = v1495;
  ((void (*)(_DWORD *, _QWORD, char *))v1495)(v696, v1477, v1467);
  ((void (*)(char *, uint64_t, uint64_t))v1479)(v923, v924, v904);
  v931 = v927;
  v932 = v923;
  v933 = Item<>.init(_:label:resetBehavior:type:)(v931, 0x6E6F697461727544, 0xE800000000000000, v923, v696, &protocol witness table for Double);
  v934 = v1475;
  *(_QWORD *)(v926 + 56) = v900;
  *(_QWORD *)(v926 + 64) = v934;
  *(_QWORD *)(v926 + 32) = v933;
  v935 = static Settings.Welcome.Animations.DismissFade.controlOneX.getter();
  *v696 = 1008981770;
  ((void (*)(_DWORD *, uint64_t, char *))v930)(v696, v928, v929);
  v936 = v924;
  v937 = v924;
  v938 = (void (*)(_QWORD, _QWORD, _QWORD))v1479;
  ((void (*)(char *, uint64_t, uint64_t))v1479)(v932, v936, v904);
  v939 = v935;
  v940 = v1468;
  v941 = Item<>.init(_:label:resetBehavior:type:)(v939, 0x206C6F72746E6F43, 0xEB00000000582031, v932, v696, &protocol witness table for Double);
  *(_QWORD *)(v926 + 96) = v940;
  *(_QWORD *)(v926 + 104) = v934;
  v942 = v934;
  *(_QWORD *)(v926 + 72) = v941;
  v943 = static Settings.Welcome.Animations.DismissFade.controlOneY.getter();
  *v696 = 1008981770;
  v944 = v1467;
  v945 = v1495;
  ((void (*)(_DWORD *, uint64_t, char *))v1495)(v696, v928, v1467);
  v938(v932, v937, v1480);
  v946 = v943;
  v947 = v1468;
  v948 = Item<>.init(_:label:resetBehavior:type:)(v946, 0x206C6F72746E6F43, v1439, v932, v696, &protocol witness table for Double);
  *(_QWORD *)(v926 + 136) = v947;
  *(_QWORD *)(v926 + 144) = v942;
  *(_QWORD *)(v926 + 112) = v948;
  v949 = static Settings.Welcome.Animations.DismissFade.controlTwoX.getter();
  *v696 = 1008981770;
  ((void (*)(_DWORD *, uint64_t, char *))v945)(v696, v928, v944);
  v950 = v1480;
  v938(v932, v937, v1480);
  v951 = v949;
  v952 = v1468;
  v953 = Item<>.init(_:label:resetBehavior:type:)(v951, 0x206C6F72746E6F43, v1440, v932, v696, &protocol witness table for Double);
  *(_QWORD *)(v926 + 176) = v952;
  *(_QWORD *)(v926 + 184) = v942;
  v954 = v952;
  *(_QWORD *)(v926 + 152) = v953;
  v955 = static Settings.Welcome.Animations.DismissFade.controlTwoY.getter();
  *v696 = 1008981770;
  ((void (*)(_DWORD *, uint64_t, char *))v1495)(v696, v928, v1467);
  v956 = v937;
  v938(v932, v937, v950);
  v957 = Item<>.init(_:label:resetBehavior:type:)(v955, 0x206C6F72746E6F43, 0xEB00000000592032, v932, v696, &protocol witness table for Double);
  *(_QWORD *)(v926 + 216) = v954;
  *(_QWORD *)(v926 + 224) = v942;
  *(_QWORD *)(v926 + 192) = v957;
  Group.init(title:footer:_:)(0x207373696D736944, 0xEC00000065646146, 0, 0, v926);
  v958 = v1433;
  v1433[22] = v1478;
  v958[23] = &protocol witness table for Page;
  sub_10000F58C(v1403);
  Page.init(title:_:)(0x656D6F636C6557, 0xE700000000000000, v1399);
  Group.init(title:footer:_:)(0x73656C75646F4DLL, 0xE700000000000000, 0, 0, v958);
  v1467 = (char *)(v1436 + v1451);
  v959 = v1491;
  v960 = swift_allocObject(v1491, 672, 7);
  *(_OWORD *)(v960 + 16) = xmmword_100037B90;
  v961 = v1406;
  static SettingsBundle.ads.getter();
  v962 = v1431;
  *(_QWORD *)(v960 + 56) = v1431;
  *(_QWORD *)(v960 + 64) = &protocol witness table for SettingsBundle;
  v1495 = (_QWORD *)v960;
  sub_10000F58C((_QWORD *)(v960 + 32));
  SettingsBundle.callAsFunction(title:additionalGroups:)(0x7369747265766441, 0xEB00000000676E69, &_swiftEmptyArrayStorage);
  (*(void (**)(char *, uint64_t))(v1407 + 8))(v961, v962);
  v1453 = v960 + 72;
  v963 = swift_allocObject(v1471, v1438, v1472);
  *(_QWORD *)&v1455 = v963;
  *(_OWORD *)(v963 + 16) = v1466;
  v1451 = v963 + v1473;
  v964 = swift_allocObject(v959, 152, 7);
  *(_OWORD *)(v964 + 16) = v1448;
  sub_1000319F8(0);
  v966 = v965;
  v967 = static Settings.AppConfiguration.source.getter();
  v968 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v968 + 16) = v1493;
  v969 = qword_10004A9B0;
  *(_QWORD *)(v968 + 32) = qword_10004A9B0;
  *(_QWORD *)&v1497 = v968;
  specialized Array._endMutation()();
  v970 = v1497;
  v971 = v1410;
  v972 = v956;
  (*(void (**)(char *, uint64_t, uint64_t))(v1408 + 104))(v1410, v956, v1409);
  sub_100008EA0((unint64_t *)&unk_1000493D8, (uint64_t (*)(uint64_t))&type metadata accessor for AppConfigurationSource, (uint64_t)&protocol conformance descriptor for AppConfigurationSource);
  swift_retain(v969);
  v973 = Item<>.init(_:label:resetBehavior:actions:)(v967, 0x656372756F53, 0xE600000000000000, v971, v970);
  *(_QWORD *)(v964 + 56) = v966;
  *(_QWORD *)(v964 + 64) = sub_100008EA0((unint64_t *)&unk_1000493E0, (uint64_t (*)(uint64_t))sub_1000319F8, (uint64_t)&protocol conformance descriptor for Item<A>);
  *(_QWORD *)(v964 + 32) = v973;
  v974 = static Settings.AppConfiguration.ignoreCache.getter();
  v975 = v1474;
  v976 = v1489;
  v977 = v1488;
  v978 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1474, v1489, v1488);
  v979 = v1487;
  v980 = v1483;
  v981 = (void (*)(_QWORD, _QWORD, _QWORD))v1485;
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v1487, v972, v1483);
  v982 = v974;
  v983 = v1492;
  v984 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v982, 0x432065726F6E6749, 0xEC00000065686361, v975, v979, &_swiftEmptyArrayStorage);
  v985 = v1482;
  *(_QWORD *)(v964 + 96) = v983;
  *(_QWORD *)(v964 + 104) = v985;
  *(_QWORD *)(v964 + 72) = v984;
  v1440 = (_QWORD *)static Settings.AppConfiguration.disableABTesting.getter();
  v986 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v986 + 16) = v1493;
  v987 = qword_10004A9B0;
  *(_QWORD *)(v986 + 32) = qword_10004A9B0;
  *(_QWORD *)&v1497 = v986;
  specialized Array._endMutation()();
  v988 = v1497;
  v978(v975, v976, v977);
  v989 = v1487;
  v981(v1487, v1494, v980);
  swift_retain(v987);
  v990 = v988;
  v991 = v1492;
  v992 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1440, v1441, 0x8000000100037130, v975, v989, v990);
  *(_QWORD *)(v964 + 136) = v991;
  *(_QWORD *)(v964 + 144) = v985;
  *(_QWORD *)(v964 + 112) = v992;
  v993 = v1451;
  v994 = Group.init(title:footer:_:)(0x656372756F53, 0xE600000000000000, 0, 0, v964);
  v1440 = (_QWORD *)(v993 + v1469);
  v1451 = static Settings.AppConfiguration.enableSegmentationOverrides.getter(v994);
  v995 = swift_allocObject(v1491, 152, 7);
  *(_OWORD *)(v995 + 16) = v1448;
  v996 = static Settings.AppConfiguration.overrideUserID.getter();
  v997 = v1484;
  v998 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v998 + 16) = v1493;
  v999 = qword_10004A9B0;
  *(_QWORD *)(v998 + 32) = qword_10004A9B0;
  *(_QWORD *)&v1497 = v998;
  specialized Array._endMutation()();
  v1000 = v1497;
  v1001 = v1460;
  v1002 = v1494;
  v1003 = v1459;
  v1004 = v1457;
  v1457(v1460, v1494, v1459);
  swift_retain(v999);
  v1005 = v1000;
  v1006 = v1465;
  v1007 = Item<>.init(_:label:resetBehavior:actions:)(v996, 1145656134, 0xE400000000000000, v1001, v1005);
  v1008 = v1456;
  *(_QWORD *)(v995 + 56) = v1006;
  *(_QWORD *)(v995 + 64) = v1008;
  *(_QWORD *)(v995 + 32) = v1007;
  v1439 = static Settings.AppConfiguration.overrideSegmentSetIDs.getter();
  v1009 = v997;
  v1010 = swift_allocObject(v997, 40, 7);
  *(_OWORD *)(v1010 + 16) = v1493;
  v1011 = qword_10004A9B0;
  *(_QWORD *)(v1010 + 32) = qword_10004A9B0;
  *(_QWORD *)&v1497 = v1010;
  specialized Array._endMutation()();
  v1012 = v1497;
  v1013 = v1002;
  v1004(v1001, v1002, v1003);
  swift_retain(v1011);
  v1014 = v1012;
  v1015 = v1465;
  v1016 = Item<>.init(_:label:resetBehavior:actions:)(v1439, 0x656469727265764FLL, 0xEE00734449535320, v1001, v1014);
  *(_QWORD *)(v995 + 96) = v1015;
  *(_QWORD *)(v995 + 104) = v1008;
  *(_QWORD *)(v995 + 72) = v1016;
  v1017 = static Settings.AppConfiguration.additionalSegmentSetIDs.getter();
  v1018 = swift_allocObject(v1009, 40, 7);
  *(_OWORD *)(v1018 + 16) = v1493;
  v1019 = qword_10004A9B0;
  *(_QWORD *)(v1018 + 32) = qword_10004A9B0;
  *(_QWORD *)&v1497 = v1018;
  specialized Array._endMutation()();
  v1020 = v1497;
  v1004(v1001, v1013, v1003);
  swift_retain(v1019);
  v1021 = v1020;
  v1022 = v1465;
  v1023 = Item<>.init(_:label:resetBehavior:actions:)(v1017, v1454, 0x8000000100037170, v1001, v1021);
  *(_QWORD *)(v995 + 136) = v1022;
  *(_QWORD *)(v995 + 144) = v1008;
  *(_QWORD *)(v995 + 112) = v1023;
  Group.init(title:footer:group:_:)(0xD000000000000011);
  v1024 = v1495;
  v1495[12] = v1478;
  v1024[13] = &protocol witness table for Page;
  v1025 = v1024;
  sub_10000F58C((_QWORD *)v1453);
  Page.init(title:_:)(0xD000000000000011, 0x8000000100037110, v1455);
  v1453 = (uint64_t)(v1025 + 14);
  v1026 = swift_allocObject(v1471, v1476, v1472);
  *(_QWORD *)&v1455 = v1026;
  *(_OWORD *)(v1026 + 16) = v1486;
  v1451 = v1026 + v1473;
  v1027 = swift_allocObject(v1491, 112, 7);
  *(_OWORD *)(v1027 + 16) = v1466;
  v1028 = static Settings.ForYou.Card.systemDetents.getter();
  v1029 = v1474;
  v1030 = v1489;
  v1031 = v1488;
  v1032 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1474, v1489, v1488);
  v1033 = v1487;
  v1034 = v1483;
  v1035 = (void (*)(_QWORD, _QWORD, _QWORD))v1485;
  ((void (*)(char *, _QWORD, uint64_t))v1485)(v1487, v1494, v1483);
  v1036 = v1028;
  v1037 = v1492;
  v1038 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1036, 0x44206D6574737953, 0xEE0073746E657465, v1029, v1033, &_swiftEmptyArrayStorage);
  v1039 = v1482;
  *(_QWORD *)(v1027 + 56) = v1037;
  *(_QWORD *)(v1027 + 64) = v1039;
  *(_QWORD *)(v1027 + 32) = v1038;
  v1440 = (_QWORD *)static Settings.StockFeed.Card.swipeToDismiss.getter();
  v1040 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v1040 + 16) = v1493;
  *(_QWORD *)(v1040 + 32) = static SettingActions.restart.getter(v1040);
  *(_QWORD *)&v1497 = v1040;
  specialized Array._endMutation()();
  v1041 = v1497;
  v1032(v1029, v1030, v1031);
  v1042 = v1487;
  v1035(v1487, v1494, v1034);
  v1043 = v1042;
  v1044 = v1041;
  v1045 = v1492;
  v1046 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1440, v1454, 0x8000000100037190, v1029, v1042, v1044);
  *(_QWORD *)(v1027 + 96) = v1045;
  *(_QWORD *)(v1027 + 104) = v1039;
  *(_QWORD *)(v1027 + 72) = v1046;
  Group.init(title:footer:_:)(0x726F697661686542, 0xE800000000000000, 0, 0, v1027);
  v1047 = v1495;
  v1495[17] = v1478;
  v1047[18] = &protocol witness table for Page;
  sub_10000F58C((_QWORD *)v1453);
  Page.init(title:_:)(1685217603, 0xE400000000000000, v1455);
  *(_QWORD *)&v1455 = v1047 + 19;
  v1048 = v1471;
  v1049 = swift_allocObject(v1471, v1476, v1472);
  *(_OWORD *)(v1049 + 16) = v1486;
  v1050 = v1473;
  v1453 = v1049 + v1473;
  v1051 = swift_allocObject(v1491, 72, 7);
  *(_OWORD *)(v1051 + 16) = v1486;
  v1052 = static Settings.CompositionalList.useDiffableDataSource.getter();
  v1053 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v1053 + 16) = v1493;
  *(_QWORD *)(v1053 + 32) = static SettingActions.restart.getter(v1053);
  *(_QWORD *)&v1497 = v1053;
  specialized Array._endMutation()();
  v1054 = v1497;
  v1055 = v1489;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1029, v1489, v1488);
  ((void (*)(char *, _QWORD, uint64_t))v1485)(v1043, v1494, v1483);
  v1056 = v1054;
  v1057 = v1492;
  v1058 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1052, v1434, 0x80000001000371F0, v1029, v1043, v1056);
  v1059 = v1482;
  *(_QWORD *)(v1051 + 56) = v1057;
  *(_QWORD *)(v1051 + 64) = v1059;
  *(_QWORD *)(v1051 + 32) = v1058;
  Group.init(title:footer:_:)(v1444, 0x80000001000371D0, 0, 0, v1051);
  v1047[22] = v1478;
  v1047[23] = &protocol witness table for Page;
  sub_10000F58C((_QWORD *)v1455);
  Page.init(title:_:)(v1435, 0x80000001000371B0, v1049);
  v1453 = (uint64_t)(v1047 + 24);
  v1060 = swift_allocObject(v1048, v1438, v1472);
  v1451 = v1060;
  *(_OWORD *)(v1060 + 16) = v1466;
  *(_QWORD *)&v1455 = v1060 + v1050;
  v1061 = swift_allocObject(v1491, 112, 7);
  *(_OWORD *)(v1061 + 16) = v1466;
  v1062 = static Settings.NewsFeedModule.Layout.enableVisualDebugging.getter();
  v1063 = v1055;
  v1064 = v1488;
  ((void (*)(char *, uint64_t, uint64_t))v1490)(v1029, v1055, v1488);
  v1065 = v1487;
  v1066 = v1494;
  v1067 = v1483;
  v1068 = (void (*)(_QWORD, _QWORD, _QWORD))v1485;
  ((void (*)(char *, _QWORD, uint64_t))v1485)(v1487, v1494, v1483);
  v1069 = v1062;
  v1070 = v1492;
  v1071 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1069, 0xD000000000000011, 0x8000000100037210, v1029, v1065, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v1061 + 56) = v1070;
  *(_QWORD *)(v1061 + 64) = v1059;
  *(_QWORD *)(v1061 + 32) = v1071;
  v1440 = (_QWORD *)static Settings.NewsFeedModule.Layout.enableLogDebugging.getter();
  v1072 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v1072 + 16) = v1493;
  *(_QWORD *)(v1072 + 32) = static SettingActions.restart.getter(v1072);
  *(_QWORD *)&v1497 = v1072;
  specialized Array._endMutation()();
  v1073 = v1497;
  v1074 = v1029;
  v1075 = v1064;
  v1076 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, uint64_t, uint64_t))v1490)(v1029, v1063, v1075);
  v1077 = v1487;
  v1068(v1487, v1066, v1067);
  v1078 = v1073;
  v1079 = v1492;
  v1080 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1440, 0x6F79614C20676F4CLL, 0xEB00000000737475, v1074, v1077, v1078);
  v1081 = v1482;
  *(_QWORD *)(v1061 + 96) = v1079;
  *(_QWORD *)(v1061 + 104) = v1081;
  *(_QWORD *)(v1061 + 72) = v1080;
  v1082 = v1455;
  Group.init(title:footer:_:)(0x74756F79614CLL, 0xE600000000000000, 0, 0, v1061);
  v1440 = (_QWORD *)(v1082 + v1469);
  v1083 = swift_allocObject(v1491, 272, 7);
  *(_OWORD *)(v1083 + 16) = v1426;
  v1084 = static Settings.NewsFeedModule.Format.ignorePackageCache.getter();
  v1085 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v1085 + 16) = v1493;
  *(_QWORD *)(v1085 + 32) = static SettingActions.restart.getter(v1085);
  *(_QWORD *)&v1497 = v1085;
  specialized Array._endMutation()();
  v1086 = v1497;
  v1076(v1074, v1489, v1488);
  v1087 = v1494;
  ((void (*)(char *, _QWORD, uint64_t))v1485)(v1077, v1494, v1483);
  v1088 = v1086;
  v1089 = v1492;
  v1090 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1084, v1444, 0x8000000100037230, v1074, v1077, v1088);
  *(_QWORD *)(v1083 + 56) = v1089;
  *(_QWORD *)(v1083 + 64) = v1081;
  *(_QWORD *)(v1083 + 32) = v1090;
  v1091 = static Settings.NewsFeedModule.Debug.Format.host.getter();
  v1092 = v1460;
  v1093 = v1459;
  v1094 = v1457;
  v1457(v1460, v1087, v1459);
  v1095 = v1465;
  v1096 = Item<>.init(_:label:resetBehavior:actions:)(v1091, 0xD000000000000011, 0x8000000100037250, v1092, &_swiftEmptyArrayStorage);
  v1097 = v1456;
  *(_QWORD *)(v1083 + 96) = v1095;
  *(_QWORD *)(v1083 + 104) = v1097;
  *(_QWORD *)(v1083 + 72) = v1096;
  v1098 = static Settings.NewsFeedModule.Debug.Format.port.getter();
  v1094(v1092, v1087, v1093);
  v1099 = Item<>.init(_:label:resetBehavior:actions:)(v1098, 0xD000000000000011, 0x8000000100037270, v1092, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v1083 + 136) = v1095;
  *(_QWORD *)(v1083 + 144) = v1097;
  *(_QWORD *)(v1083 + 112) = v1099;
  v1100 = static Settings.NewsFeedModule.Format.loadPackagesFromDebugServerDropbox.getter();
  v1101 = v1484;
  v1102 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v1102 + 16) = v1493;
  *(_QWORD *)(v1102 + 32) = static SettingActions.restart.getter(v1102);
  *(_QWORD *)&v1497 = v1102;
  specialized Array._endMutation()();
  v1103 = v1497;
  v1104 = v1489;
  v1105 = v1488;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1074, v1489, v1488);
  v1106 = v1487;
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v1487, v1087, v1483);
  v1107 = v1074;
  v1108 = v1103;
  v1109 = v1492;
  v1110 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1100, 0xD000000000000027, 0x8000000100037290, v1074, v1106, v1108);
  v1111 = v1482;
  *(_QWORD *)(v1083 + 176) = v1109;
  *(_QWORD *)(v1083 + 184) = v1111;
  *(_QWORD *)(v1083 + 152) = v1110;
  v1439 = static Settings.NewsFeedModule.Format.prefetchWebArchives.getter();
  v1112 = swift_allocObject(v1101, 40, 7);
  *(_OWORD *)(v1112 + 16) = v1493;
  *(_QWORD *)(v1112 + 32) = static SettingActions.restart.getter(v1112);
  *(_QWORD *)&v1497 = v1112;
  specialized Array._endMutation()();
  v1113 = v1497;
  v1114 = v1074;
  v1115 = v1104;
  v1116 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, uint64_t, uint64_t))v1490)(v1114, v1104, v1105);
  v1117 = v1487;
  v1118 = v1494;
  v1119 = v1483;
  v1120 = (void (*)(_QWORD, _QWORD, _QWORD))v1485;
  ((void (*)(char *, _QWORD, uint64_t))v1485)(v1487, v1494, v1483);
  *(_QWORD *)&v1455 = 0xD000000000000024;
  v1121 = v1113;
  v1122 = v1492;
  v1123 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1439, 0xD000000000000024, 0x80000001000372C0, v1107, v1117, v1121);
  *(_QWORD *)(v1083 + 216) = v1122;
  *(_QWORD *)(v1083 + 224) = v1111;
  *(_QWORD *)(v1083 + 192) = v1123;
  v1439 = static Settings.NewsFeedModule.Format.prefetchDataResources.getter();
  v1124 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v1124 + 16) = v1493;
  *(_QWORD *)(v1124 + 32) = static SettingActions.restart.getter(v1124);
  *(_QWORD *)&v1497 = v1124;
  specialized Array._endMutation()();
  v1125 = v1497;
  v1126 = v1107;
  v1127 = v1107;
  v1128 = v1115;
  v1129 = v1115;
  v1130 = v1488;
  v1116(v1127, v1128, v1488);
  v1131 = v1487;
  v1120(v1487, v1118, v1119);
  v1132 = v1126;
  v1133 = v1131;
  v1134 = v1125;
  v1135 = v1492;
  v1136 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1439, 0xD000000000000021, 0x80000001000372F0, v1126, v1131, v1134);
  v1137 = v1482;
  *(_QWORD *)(v1083 + 256) = v1135;
  *(_QWORD *)(v1083 + 264) = v1137;
  *(_QWORD *)(v1083 + 232) = v1136;
  Group.init(title:footer:_:)(0x74616D726F46, 0xE600000000000000, 0, 0, v1083);
  v1138 = v1495;
  v1495[27] = v1478;
  v1138[28] = &protocol witness table for Page;
  v1139 = v1138;
  sub_10000F58C((_QWORD *)v1453);
  Page.init(title:_:)(1684366662, 0xE400000000000000, v1451);
  v1451 = (uint64_t)(v1139 + 29);
  v1140 = swift_allocObject(v1471, v1438, v1472);
  v1453 = v1140;
  *(_OWORD *)(v1140 + 16) = v1466;
  v1440 = (_QWORD *)(v1140 + v1473);
  v1141 = swift_allocObject(v1491, 192, 7);
  *(_OWORD *)(v1141 + 16) = v1446;
  v1142 = static Settings.MarketData.freezeQuotes.getter();
  v1143 = v1129;
  v1144 = v1129;
  v1145 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, uint64_t, uint64_t))v1490)(v1132, v1144, v1130);
  v1146 = (void (*)(_QWORD, _QWORD, _QWORD))v1485;
  ((void (*)(char *, _QWORD, uint64_t))v1485)(v1133, v1494, v1119);
  v1147 = v1142;
  v1148 = v1492;
  v1149 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1147, 0x5120657A65657246, 0xED00007365746F75, v1132, v1133, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v1141 + 56) = v1148;
  *(_QWORD *)(v1141 + 64) = v1137;
  *(_QWORD *)(v1141 + 32) = v1149;
  *(_QWORD *)&v1446 = static Settings.MarketData.freezeQuoteDetails.getter();
  v1150 = v1143;
  v1145(v1132, v1143, v1130);
  v1151 = v1487;
  v1152 = v1494;
  v1146(v1487, v1494, v1119);
  v1153 = v1474;
  v1154 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1446, v1444, 0x8000000100037320, v1474, v1151, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v1141 + 96) = v1148;
  *(_QWORD *)(v1141 + 104) = v1137;
  *(_QWORD *)(v1141 + 72) = v1154;
  v1155 = static Settings.MarketData.freezeSparklines.getter();
  v1156 = v1488;
  v1157 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, uint64_t, uint64_t))v1490)(v1153, v1150, v1488);
  v1158 = v1483;
  v1159 = (void (*)(_QWORD, _QWORD, _QWORD))v1485;
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v1151, v1152, v1483);
  v1160 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1155, 0xD000000000000011, 0x8000000100037340, v1153, v1151, &_swiftEmptyArrayStorage);
  v1161 = v1482;
  *(_QWORD *)(v1141 + 136) = v1148;
  *(_QWORD *)(v1141 + 144) = v1161;
  *(_QWORD *)(v1141 + 112) = v1160;
  *(_QWORD *)&v1446 = static Settings.MarketData.freezeCharts.getter();
  v1157(v1153, v1489, v1156);
  v1162 = v1151;
  v1159(v1151, v1152, v1158);
  v1163 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1446, 0x4320657A65657246, 0xED00007374726168, v1153, v1151, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v1141 + 176) = v1148;
  *(_QWORD *)(v1141 + 184) = v1161;
  v1164 = v1161;
  *(_QWORD *)(v1141 + 152) = v1163;
  v1165 = v1440;
  Group.init(title:footer:_:)(0x6568636143, 0xE500000000000000, 0, 0, v1141);
  *(_QWORD *)&v1446 = (char *)v1165 + v1469;
  v1166 = swift_allocObject(v1491, 112, 7);
  *(_OWORD *)(v1166 + 16) = v1466;
  v1167 = static Settings.Refreshing.MarketData.overrideEnabled.getter();
  v1168 = v1489;
  v1169 = v1488;
  v1170 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1153, v1489, v1488);
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v1162, v1152, v1158);
  v1171 = v1167;
  v1172 = v1492;
  v1173 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1171, v1434, 0x8000000100037360, v1153, v1162, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v1166 + 56) = v1172;
  *(_QWORD *)(v1166 + 64) = v1164;
  *(_QWORD *)(v1166 + 32) = v1173;
  v1174 = static Settings.Refreshing.MarketData.overrideInterval.getter();
  v1170(v1153, v1168, v1169);
  v1175 = v1470;
  ((void (*)(char *, uint64_t, uint64_t))v1479)(v1470, v1152, v1480);
  v1176 = v1174;
  v1177 = v1468;
  v1178 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1176, 0xD000000000000011, 0x8000000100037380, v1153, v1175, &_swiftEmptyArrayStorage);
  v1179 = v1475;
  *(_QWORD *)(v1166 + 96) = v1177;
  *(_QWORD *)(v1166 + 104) = v1179;
  *(_QWORD *)(v1166 + 72) = v1178;
  Group.init(title:footer:_:)(0x6968736572666552, 0xEA0000000000676ELL, 0, 0, v1166);
  v1180 = v1495;
  v1495[32] = v1478;
  v1180[33] = &protocol witness table for Page;
  sub_10000F58C((_QWORD *)v1451);
  Page.init(title:_:)(0x442074656B72614DLL, 0xEB00000000617461, v1453);
  v1180[37] = type metadata accessor for If(0);
  v1180[38] = &protocol witness table for If;
  sub_10000F58C(v1180 + 34);
  If.init(_:_:)(sub_100030CCC, 0, sub_100030D70, 0);
  v1453 = (uint64_t)(v1180 + 39);
  v1181 = swift_allocObject(v1471, v1476, v1472);
  v1451 = v1181;
  *(_OWORD *)(v1181 + 16) = v1486;
  *(_QWORD *)&v1446 = v1181 + v1473;
  v1182 = swift_allocObject(v1491, 112, 7);
  *(_OWORD *)(v1182 + 16) = v1466;
  v1183 = static Settings.AppLaunch.disableAppLaunchOnboarding.getter();
  v1184 = v1489;
  v1185 = v1169;
  v1186 = v1169;
  v1187 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1153, v1489, v1186);
  v1188 = v1162;
  v1189 = v1162;
  v1190 = v1494;
  v1191 = v1483;
  v1192 = (void (*)(_QWORD, _QWORD, _QWORD))v1485;
  ((void (*)(char *, _QWORD, uint64_t))v1485)(v1189, v1494, v1483);
  v1193 = v1183;
  v1194 = v1492;
  v1195 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1193, v1435, 0x80000001000373A0, v1153, v1188, &_swiftEmptyArrayStorage);
  v1196 = v1482;
  *(_QWORD *)(v1182 + 56) = v1194;
  *(_QWORD *)(v1182 + 64) = v1196;
  *(_QWORD *)(v1182 + 32) = v1195;
  v1197 = static Settings.AppLaunch.showPersonalizedAdsOnNextLaunch.getter();
  v1187(v1153, v1184, v1185);
  v1198 = v1487;
  v1192(v1487, v1190, v1191);
  v1199 = v1197;
  v1200 = v1492;
  v1201 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1199, v1455, 0x80000001000373C0, v1153, v1198, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v1182 + 96) = v1200;
  *(_QWORD *)(v1182 + 104) = v1196;
  *(_QWORD *)(v1182 + 72) = v1201;
  Group.init(title:footer:_:)(0x70757472617453, 0xE700000000000000, 0, 0, v1182);
  v1202 = v1495;
  v1495[42] = v1478;
  v1202[43] = &protocol witness table for Page;
  v1203 = v1202;
  sub_10000F58C((_QWORD *)v1453);
  Page.init(title:_:)(0x696472616F626E4FLL, 0xEA0000000000676ELL, v1451);
  *(_QWORD *)&v1455 = v1203 + 44;
  v1204 = swift_allocObject(v1471, v1476, v1472);
  *(_OWORD *)(v1204 + 16) = v1486;
  v1453 = v1204 + v1473;
  v1205 = swift_allocObject(v1491, 72, 7);
  *(_OWORD *)(v1205 + 16) = v1486;
  v1206 = static Settings.ForYouFeedMasthead.premiumSealEnabled.getter();
  v1207 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v1207 + 16) = v1493;
  *(_QWORD *)(v1207 + 32) = static SettingActions.restart.getter(v1207);
  *(_QWORD *)&v1497 = v1207;
  specialized Array._endMutation()();
  v1208 = v1497;
  v1209 = v1474;
  v1187(v1474, v1489, v1185);
  v1210 = v1198;
  v1211 = v1198;
  v1212 = v1483;
  v1213 = (void (*)(_QWORD, _QWORD, _QWORD))v1485;
  ((void (*)(char *, _QWORD, uint64_t))v1485)(v1211, v1494, v1483);
  v1214 = v1208;
  v1215 = v1492;
  v1216 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1206, 0xD000000000000011, 0x8000000100037420, v1209, v1210, v1214);
  v1217 = v1482;
  *(_QWORD *)(v1205 + 56) = v1215;
  *(_QWORD *)(v1205 + 64) = v1217;
  *(_QWORD *)(v1205 + 32) = v1216;
  Group.init(title:footer:_:)(0xD000000000000025, 0x80000001000373F0, 0, 0, v1205);
  v1218 = v1495;
  v1495[47] = v1478;
  v1218[48] = &protocol witness table for Page;
  sub_10000F58C((_QWORD *)v1455);
  Page.init(title:_:)(0x206D75696D657250, 0xEC0000006C616553, v1204);
  *(_QWORD *)&v1455 = v1218 + 49;
  v1219 = swift_allocObject(v1471, v1476, v1472);
  *(_OWORD *)(v1219 + 16) = v1486;
  v1453 = v1219 + v1473;
  v1220 = swift_allocObject(v1491, 72, 7);
  *(_OWORD *)(v1220 + 16) = v1486;
  v1221 = static Settings.PrivateData.simulateNewsSyncingEnabled.getter();
  v1222 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v1222 + 16) = v1493;
  *(_QWORD *)(v1222 + 32) = static SettingActions.restart.getter(v1222);
  *(_QWORD *)&v1497 = v1222;
  specialized Array._endMutation()();
  v1223 = v1497;
  v1224 = v1474;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1474, v1489, v1488);
  v1225 = v1487;
  v1213(v1487, v1494, v1212);
  v1226 = v1223;
  v1227 = v1492;
  v1228 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1221, v1421, 0x8000000100037440, v1224, v1225, v1226);
  *(_QWORD *)(v1220 + 56) = v1227;
  *(_QWORD *)(v1220 + 64) = v1217;
  v1229 = v1227;
  *(_QWORD *)(v1220 + 32) = v1228;
  Group.init(title:footer:_:)(0x656469727265764FLL, 0xE900000000000073, 0, 0, v1220);
  v1230 = v1478;
  v1218[52] = v1478;
  v1218[53] = &protocol witness table for Page;
  sub_10000F58C((_QWORD *)v1455);
  Page.init(title:_:)(0x2065746176697250, 0xEC00000061746144, v1219);
  sub_100031A70(0);
  v1232 = v1231;
  v1233 = static Settings.DataSource.stocksDataServiceEnabled.getter();
  v1234 = swift_allocObject(v1484, 40, 7);
  *(_OWORD *)(v1234 + 16) = v1493;
  *(_QWORD *)(v1234 + 32) = static SettingActions.restart.getter(v1234);
  *(_QWORD *)&v1497 = v1234;
  specialized Array._endMutation()();
  v1235 = v1497;
  v1236 = v1413;
  v1237 = v1494;
  (*(void (**)(char *, _QWORD, uint64_t))(v1411 + 104))(v1413, v1494, v1412);
  sub_100008EA0((unint64_t *)&unk_1000493F0, (uint64_t (*)(uint64_t))&type metadata accessor for StocksDataServiceEnablement, (uint64_t)&protocol conformance descriptor for StocksDataServiceEnablement);
  v1238 = Item<>.init(_:label:resetBehavior:actions:)(v1233, v1441, 0x8000000100037460, v1236, v1235);
  v1218[57] = v1232;
  v1218[58] = sub_100008EA0((unint64_t *)&unk_1000493F8, (uint64_t (*)(uint64_t))sub_100031A70, (uint64_t)&protocol conformance descriptor for Item<A>);
  v1218[54] = v1238;
  v1218[62] = v1230;
  v1218[63] = &protocol witness table for Page;
  sub_10000F58C(v1218 + 59);
  Page.init(title:_:)(0x7069726373627553, 0xED0000736E6F6974, v1387);
  v1481 = v1218 + 64;
  v1239 = swift_allocObject(v1471, v1401, v1472);
  v1484 = (_QWORD *)v1239;
  *(_OWORD *)(v1239 + 16) = v1448;
  *(_QWORD *)&v1493 = v1239 + v1473;
  v1240 = swift_allocObject(v1491, 112, 7);
  *(_OWORD *)(v1240 + 16) = v1466;
  v1241 = static Settings.Tips.savedViaFeed.getter();
  v1242 = v1474;
  v1243 = v1489;
  v1244 = v1488;
  v1245 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1474, v1489, v1488);
  v1246 = v1487;
  v1247 = v1237;
  v1248 = v1483;
  v1249 = (void (*)(_QWORD, _QWORD, _QWORD))v1485;
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v1487, v1247, v1483);
  v1250 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1241, 1684366662, 0xE400000000000000, v1242, v1246, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v1240 + 56) = v1229;
  v1251 = v1482;
  *(_QWORD *)(v1240 + 64) = v1482;
  *(_QWORD *)(v1240 + 32) = v1250;
  v1252 = static Settings.Tips.savedViaArticleViewer.getter();
  v1253 = v1242;
  v1254 = v1242;
  v1255 = v1244;
  v1245(v1254, v1243, v1244);
  v1256 = v1487;
  v1257 = v1494;
  v1249(v1487, v1494, v1248);
  v1258 = v1252;
  v1259 = v1253;
  v1260 = v1256;
  v1261 = v1492;
  v1262 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1258, 0x20656C6369747241, 0xEE00726577656956, v1253, v1256, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v1240 + 96) = v1261;
  *(_QWORD *)(v1240 + 104) = v1251;
  *(_QWORD *)(v1240 + 72) = v1262;
  v1263 = v1493;
  Group.init(title:footer:_:)(0x20656C6369747241, 0xEE00676E69766153, 0, 0, v1240);
  *(_QWORD *)&v1455 = v1263 + v1469;
  v1264 = swift_allocObject(v1491, 112, 7);
  *(_OWORD *)(v1264 + 16) = v1466;
  v1265 = static Settings.Tips.audioQueuedViaFeed.getter();
  v1266 = v1489;
  v1267 = v1255;
  v1268 = v1255;
  v1269 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1253, v1489, v1268);
  v1270 = v1257;
  v1271 = v1257;
  v1272 = v1483;
  v1273 = (void (*)(_QWORD, _QWORD, _QWORD))v1485;
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v1260, v1271, v1483);
  v1274 = v1265;
  v1275 = v1492;
  v1276 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1274, 1684366662, 0xE400000000000000, v1259, v1260, &_swiftEmptyArrayStorage);
  v1277 = v1482;
  *(_QWORD *)(v1264 + 56) = v1275;
  *(_QWORD *)(v1264 + 64) = v1277;
  *(_QWORD *)(v1264 + 32) = v1276;
  v1278 = static Settings.Tips.audioQueuedViaArticleViewer.getter();
  v1269(v1259, v1266, v1267);
  v1279 = v1269;
  v1280 = v1487;
  v1273(v1487, v1270, v1272);
  v1281 = v1278;
  v1282 = v1492;
  v1283 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1281, 0x20656C6369747241, 0xEE00726577656956, v1259, v1280, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v1264 + 96) = v1282;
  *(_QWORD *)(v1264 + 104) = v1277;
  *(_QWORD *)(v1264 + 72) = v1283;
  v1284 = v1435;
  v1285 = Group.init(title:footer:_:)(v1435, 0x8000000100037480, 0xD00000000000005ELL, 0x80000001000374A0, v1264);
  *(_QWORD *)&v1493 = static Settings.Tips.Earnings.configOverrides.getter(v1285);
  v1286 = swift_allocObject(v1491, 112, 7);
  *(_OWORD *)(v1286 + 16) = v1466;
  type metadata accessor for Settings.Tips.Earnings.ConfigOverrides(0);
  v1287 = static Settings.Tips.Earnings.ConfigOverrides.tipMaxPresentedCount.getter();
  v1288 = v1429;
  *v1429 = 1065353216;
  (*(void (**)(_DWORD *, _QWORD, uint64_t))(v1414 + 104))(v1288, v1477, v1415);
  v1289 = v1458;
  v1452(v1458, v1270, v1464);
  v1290 = v1287;
  v1291 = v1463;
  v1292 = Item<>.init(_:label:resetBehavior:type:)(v1290, v1441, 0x8000000100037520, v1289, v1288, &protocol witness table for Int);
  v1293 = v1447;
  *(_QWORD *)(v1286 + 56) = v1291;
  *(_QWORD *)(v1286 + 64) = v1293;
  *(_QWORD *)(v1286 + 32) = v1292;
  v1294 = static Settings.Tips.Earnings.ConfigOverrides.tipFrequencyInterval.getter();
  v1279(v1259, v1489, v1488);
  v1295 = v1470;
  v1296 = v1270;
  ((void (*)(char *, uint64_t, uint64_t))v1479)(v1470, v1270, v1480);
  v1297 = v1294;
  v1298 = v1468;
  v1299 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1297, v1422, 0x8000000100037540, v1259, v1295, &_swiftEmptyArrayStorage);
  v1300 = v1475;
  *(_QWORD *)(v1286 + 96) = v1298;
  *(_QWORD *)(v1286 + 104) = v1300;
  *(_QWORD *)(v1286 + 72) = v1299;
  Group.init(title:footer:group:_:)(v1284);
  v1301 = v1478;
  v1302 = v1495;
  v1495[67] = v1478;
  v1302[68] = &protocol witness table for Page;
  v1303 = v1302;
  sub_10000F58C(v1481);
  Page.init(title:_:)(1936746836, 0xE400000000000000, v1484);
  *(_QWORD *)&v1493 = v1303 + 69;
  v1304 = v1471;
  v1305 = v1472;
  v1306 = swift_allocObject(v1471, v1476, v1472);
  *(_OWORD *)(v1306 + 16) = v1486;
  v1307 = v1473;
  v1484 = (_QWORD *)(v1306 + v1473);
  v1308 = swift_allocObject(v1491, 72, 7);
  *(_OWORD *)(v1308 + 16) = v1486;
  sub_100031AE8(0);
  v1310 = v1309;
  v1311 = static Settings.Watchlist.kvsCleanupPermission.getter();
  v1312 = v1418;
  (*(void (**)(char *, uint64_t, uint64_t))(v1416 + 104))(v1418, v1296, v1417);
  sub_100008EA0((unint64_t *)&unk_100049408, (uint64_t (*)(uint64_t))&type metadata accessor for KVSCleanupPermission, (uint64_t)&protocol conformance descriptor for KVSCleanupPermission);
  v1313 = Item<>.init(_:label:resetBehavior:actions:)(v1311, 0x61656C432053564BLL, 0xEB0000000070756ELL, v1312, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v1308 + 56) = v1310;
  *(_QWORD *)(v1308 + 64) = sub_100008EA0((unint64_t *)&unk_100049410, (uint64_t (*)(uint64_t))sub_100031AE8, (uint64_t)&protocol conformance descriptor for Item<A>);
  *(_QWORD *)(v1308 + 32) = v1313;
  Group.init(title:footer:_:)(0x756C61562D79654BLL, 0xEF65726F74532065, 0, 0, v1308);
  v1314 = v1495;
  v1495[72] = v1301;
  v1314[73] = &protocol witness table for Page;
  v1315 = v1314;
  sub_10000F58C((_QWORD *)v1493);
  Page.init(title:_:)(0x73696C6863746157, 0xE900000000000074, v1306);
  *(_QWORD *)&v1493 = v1315 + 74;
  v1316 = swift_allocObject(v1304, v1476, v1305);
  v1484 = (_QWORD *)v1316;
  *(_OWORD *)(v1316 + 16) = v1486;
  v1477 = (_QWORD *)(v1316 + v1307);
  v1481 = (_QWORD *)static Settings.Earnings.configOverrides.getter();
  v1317 = swift_allocObject(v1491, 112, 7);
  *(_OWORD *)(v1317 + 16) = v1466;
  type metadata accessor for Settings.Earnings.ConfigOverrides(0);
  started = static Settings.Earnings.ConfigOverrides.earningsStartDate.getter();
  v1319 = v1429;
  static Item.RangeControlType.slider.getter(&type metadata for Int, &protocol witness table for Int);
  v1320 = v1458;
  v1321 = v1464;
  v1322 = v1452;
  v1452(v1458, v1296, v1464);
  v1323 = v1463;
  v1324 = Item<>.init(_:label:resetBehavior:type:)(started, v1421, 0x8000000100037580, v1320, v1319, &protocol witness table for Int);
  v1325 = v1447;
  *(_QWORD *)(v1317 + 56) = v1323;
  *(_QWORD *)(v1317 + 64) = v1325;
  *(_QWORD *)(v1317 + 32) = v1324;
  v1326 = static Settings.Earnings.ConfigOverrides.earningsEndDate.getter();
  static Item.RangeControlType.slider.getter(&type metadata for Int, &protocol witness table for Int);
  v1322(v1320, v1296, v1321);
  v1327 = Item<>.init(_:label:resetBehavior:type:)(v1326, v1402, 0x80000001000375A0, v1320, v1319, &protocol witness table for Int);
  *(_QWORD *)(v1317 + 96) = v1323;
  *(_QWORD *)(v1317 + 104) = v1325;
  *(_QWORD *)(v1317 + 72) = v1327;
  Group.init(title:footer:group:_:)(0xD000000000000017);
  v1328 = v1495;
  v1495[77] = v1478;
  v1328[78] = &protocol witness table for Page;
  v1329 = v1328;
  sub_10000F58C((_QWORD *)v1493);
  Page.init(title:_:)(0x73676E696E726145, 0xE800000000000000, v1484);
  v1484 = v1329 + 79;
  v1330 = swift_allocObject(v1471, v1438, v1472);
  *(_QWORD *)&v1493 = v1330;
  *(_OWORD *)(v1330 + 16) = v1466;
  v1481 = (_QWORD *)(v1330 + v1473);
  v1331 = swift_allocObject(v1491, 152, 7);
  *(_OWORD *)(v1331 + 16) = v1448;
  v1332 = static Settings.Widget.demoMode.getter();
  v1333 = v1474;
  v1334 = v1488;
  v1335 = (void (*)(_QWORD, _QWORD, _QWORD))v1490;
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1474, v1489, v1488);
  v1336 = v1487;
  v1337 = v1483;
  v1338 = (void (*)(_QWORD, _QWORD, _QWORD))v1485;
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v1487, v1296, v1483);
  v1339 = v1332;
  v1340 = v1333;
  v1341 = v1333;
  v1342 = v1336;
  v1343 = v1492;
  v1344 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1339, v1454, 0x80000001000375C0, v1340, v1336, &_swiftEmptyArrayStorage);
  v1345 = v1482;
  *(_QWORD *)(v1331 + 56) = v1343;
  *(_QWORD *)(v1331 + 64) = v1345;
  *(_QWORD *)(v1331 + 32) = v1344;
  v1346 = static Settings.Widget.dumpEntries.getter();
  v1347 = v1489;
  v1335(v1341, v1489, v1334);
  v1348 = v1335;
  v1349 = v1494;
  v1338(v1342, v1494, v1337);
  v1350 = v1346;
  v1351 = v1492;
  v1352 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1350, 0x746E6520706D7544, 0xEC00000073656972, v1341, v1342, &_swiftEmptyArrayStorage);
  *(_QWORD *)(v1331 + 96) = v1351;
  *(_QWORD *)(v1331 + 104) = v1345;
  *(_QWORD *)(v1331 + 72) = v1352;
  v1353 = static Settings.Widget.entryInterval.getter();
  v1354 = v1488;
  v1348(v1341, v1347, v1488);
  v1355 = v1470;
  ((void (*)(char *, uint64_t, uint64_t))v1479)(v1470, v1349, v1480);
  v1356 = v1353;
  v1357 = v1341;
  v1358 = v1468;
  v1359 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1356, 0xD000000000000020, 0x80000001000375E0, v1341, v1355, &_swiftEmptyArrayStorage);
  v1360 = v1475;
  *(_QWORD *)(v1331 + 136) = v1358;
  *(_QWORD *)(v1331 + 144) = v1360;
  *(_QWORD *)(v1331 + 112) = v1359;
  Group.init(title:footer:_:)(1869440324, 0xE400000000000000, 0, 0, v1331);
  v1361 = v1491;
  v1362 = swift_allocObject(v1491, 112, 7);
  *(_OWORD *)(v1362 + 16) = v1466;
  v1363 = static Settings.Features.widgetSpecificConfig.getter();
  v1364 = v1437;
  v1445(v1437, v1349, v1461);
  v1365 = v1363;
  v1366 = v1427;
  v1367 = Item<>.init(_:label:resetBehavior:actions:)(v1365, v1434, 0x8000000100037670, v1364, &_swiftEmptyArrayStorage);
  v1368 = v1449;
  *(_QWORD *)(v1362 + 56) = v1366;
  *(_QWORD *)(v1362 + 64) = v1368;
  *(_QWORD *)(v1362 + 32) = v1367;
  v1369 = static Settings.News.overrideWidgetSectionConfigID.getter();
  v1370 = v1460;
  v1457(v1460, v1349, v1459);
  v1371 = v1369;
  v1372 = v1465;
  v1373 = Item<>.init(_:label:resetBehavior:actions:)(v1371, v1454, 0x8000000100037690, v1370, &_swiftEmptyArrayStorage);
  v1374 = v1456;
  *(_QWORD *)(v1362 + 96) = v1372;
  *(_QWORD *)(v1362 + 104) = v1374;
  *(_QWORD *)(v1362 + 72) = v1373;
  Group.init(title:footer:_:)(0x72756769666E6F43, 0xED00006E6F697461, 0xD000000000000050, 0x8000000100037610, v1362);
  v1375 = v1495;
  v1495[82] = v1478;
  v1375[83] = &protocol witness table for Page;
  sub_10000F58C(v1484);
  Page.init(title:_:)(0x5720736B636F7453, 0xED00007465676469, v1493);
  Group.init(title:footer:_:)(0x736E6F6974704FLL, 0xE700000000000000, 0, 0, v1375);
  v1376 = swift_allocObject(v1361, 72, 7);
  *(_OWORD *)(v1376 + 16) = v1486;
  v1377 = static Settings.Radars.radar50783266.getter();
  ((void (*)(char *, _QWORD, uint64_t))v1490)(v1341, v1489, v1354);
  v1378 = v1487;
  ((void (*)(char *, uint64_t, uint64_t))v1485)(v1487, v1349, v1483);
  v1379 = v1377;
  v1380 = v1492;
  v1381 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v1379, 0x3636323338373035, 0xE800000000000000, v1357, v1378, &_swiftEmptyArrayStorage);
  v1382 = v1482;
  *(_QWORD *)(v1376 + 56) = v1380;
  *(_QWORD *)(v1376 + 64) = v1382;
  *(_QWORD *)(v1376 + 32) = v1381;
  Group.init(title:footer:_:)(0x737261646152, 0xE600000000000000, 0, 0, v1376);
  swift_unknownObjectRelease(v1432);
  swift_release(v1430);
  (*(void (**)(char *, uint64_t))(v1389 + 8))(v1442, v1390);
  *v1388 = v1428;
  return (_QWORD *)sub_10000778C(v1500);
}

BOOL sub_100030CCC()
{
  void *v0;
  id v1;
  id v2;
  id v4;
  id v5;

  v0 = (void *)objc_opt_self(UIDevice);
  v1 = objc_msgSend(v0, "currentDevice");
  v2 = objc_msgSend(v1, "userInterfaceIdiom");

  if (v2 == (id)1)
    return 1;
  v4 = objc_msgSend(v0, "currentDevice");
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  return v5 == (id)5;
}

uint64_t sub_100030D70@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  _QWORD *v25;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;

  v31 = a1;
  sub_100031520(0, &qword_1000492E0, (uint64_t)&type metadata for Bool, (uint64_t)&protocol witness table for Bool, (uint64_t (*)(_QWORD, uint64_t, uint64_t))&type metadata accessor for Item.ResetBehavior);
  v29 = *(_QWORD *)(v1 - 8);
  v30 = v1;
  __chkstk_darwin(v1);
  v3 = (char *)&v27 - v2;
  v4 = type metadata accessor for ChangeBehavior(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FCC8(0, &qword_1000492F0, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v9 = v8;
  v10 = *(_QWORD *)(type metadata accessor for Group(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = *(unsigned __int8 *)(v10 + 80);
  v13 = (v12 + 32) & ~v12;
  v14 = swift_allocObject(v9, v13 + v11, v12 | 7);
  v27 = xmmword_100037BB0;
  *(_OWORD *)(v14 + 16) = xmmword_100037BB0;
  v28 = v14 + v13;
  sub_100031418(0);
  v16 = swift_allocObject(v15, 72, 7);
  *(_OWORD *)(v16 + 16) = v27;
  sub_100031520(0, &qword_1000492F8, (uint64_t)&type metadata for Bool, (uint64_t)&protocol witness table for Bool, (uint64_t (*)(_QWORD, uint64_t, uint64_t))&type metadata accessor for Item);
  v18 = v17;
  v19 = static Settings.ForYouFeedMasthead.mastheadEnabled.getter();
  sub_100031480();
  v21 = swift_allocObject(v20, 40, 7);
  *(_OWORD *)(v21 + 16) = xmmword_1000386F0;
  type metadata accessor for SettingAction(0);
  *(_QWORD *)(v21 + 32) = static SettingActions.restart.getter();
  v32 = v21;
  specialized Array._endMutation()();
  v22 = v32;
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for ChangeBehavior.default(_:), v4);
  (*(void (**)(char *, _QWORD, uint64_t))(v29 + 104))(v3, enum case for Item.ResetBehavior.reset<A>(_:), v30);
  v23 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(v19, 0xD00000000000001CLL, 0x8000000100037770, v7, v3, v22);
  *(_QWORD *)(v16 + 56) = v18;
  *(_QWORD *)(v16 + 64) = sub_1000314D8(&qword_100049308, &qword_1000492F8, (uint64_t)&type metadata for Bool, (uint64_t)&protocol witness table for Bool);
  *(_QWORD *)(v16 + 32) = v23;
  Group.init(title:footer:_:)(0xD000000000000017, 0x80000001000376B0, 0xD00000000000009CLL, 0x80000001000376D0, v16);
  v24 = type metadata accessor for Page(0);
  v25 = v31;
  v31[3] = v24;
  v25[4] = &protocol witness table for Page;
  sub_10000F58C(v25);
  return Page.init(title:_:)(0x646165687473614DLL, 0xE800000000000000, v14);
}

void sub_100031058(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_100049230)
  {
    v2 = type metadata accessor for KVSCleanupPermission(255);
    v3 = sub_100008EA0(&qword_100049238, (uint64_t (*)(uint64_t))&type metadata accessor for KVSCleanupPermission, (uint64_t)&protocol conformance descriptor for KVSCleanupPermission);
    v4 = type metadata accessor for Item.ResetBehavior(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_100049230);
  }
}

void sub_1000310D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_100049248)
  {
    v2 = type metadata accessor for StocksDataServiceEnablement(255);
    v3 = sub_100008EA0(&qword_100049250, (uint64_t (*)(uint64_t))&type metadata accessor for StocksDataServiceEnablement, (uint64_t)&protocol conformance descriptor for StocksDataServiceEnablement);
    v4 = type metadata accessor for Item.ResetBehavior(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_100049248);
  }
}

void sub_100031148(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_100049258)
  {
    v2 = type metadata accessor for AppConfigurationSource(255);
    v3 = sub_100008EA0(&qword_100049260, (uint64_t (*)(uint64_t))&type metadata accessor for AppConfigurationSource, (uint64_t)&protocol conformance descriptor for AppConfigurationSource);
    v4 = type metadata accessor for Item.ResetBehavior(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_100049258);
  }
}

void sub_1000311C0(uint64_t a1)
{
  uint64_t refreshed;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_100049270)
  {
    refreshed = type metadata accessor for FeedAutoRefreshStrategy(255);
    v3 = sub_100008EA0(&qword_100049278, (uint64_t (*)(uint64_t))&type metadata accessor for FeedAutoRefreshStrategy, (uint64_t)&protocol conformance descriptor for FeedAutoRefreshStrategy);
    v4 = type metadata accessor for Item.ResetBehavior(a1, refreshed, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_100049270);
  }
}

void sub_100031238(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_100049288)
  {
    v2 = type metadata accessor for NewsEnvironment(255);
    v3 = sub_100008EA0(&qword_100049290, (uint64_t (*)(uint64_t))&type metadata accessor for NewsEnvironment, (uint64_t)&protocol conformance descriptor for NewsEnvironment);
    v4 = type metadata accessor for Item.ResetBehavior(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_100049288);
  }
}

void sub_1000312B0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_100049298)
  {
    v2 = type metadata accessor for NewsProvider(255);
    v3 = sub_100008EA0(&qword_1000492A0, (uint64_t (*)(uint64_t))&type metadata accessor for NewsProvider, (uint64_t)&protocol conformance descriptor for NewsProvider);
    v4 = type metadata accessor for Item.ResetBehavior(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_100049298);
  }
}

void sub_100031328(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_1000492A8)
  {
    v2 = type metadata accessor for Settings.Container.TestSuite(255);
    v3 = sub_100008EA0(&qword_1000492B0, (uint64_t (*)(uint64_t))&type metadata accessor for Settings.Container.TestSuite, (uint64_t)&protocol conformance descriptor for Settings.Container.TestSuite);
    v4 = type metadata accessor for Item.ResetBehavior(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1000492A8);
  }
}

void sub_1000313A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_1000492B8)
  {
    v2 = type metadata accessor for FeatureState(255);
    v3 = sub_100008EA0(&qword_1000492C0, (uint64_t (*)(uint64_t))&type metadata accessor for FeatureState, (uint64_t)&protocol conformance descriptor for FeatureState);
    v4 = type metadata accessor for Item.ResetBehavior(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1000492B8);
  }
}

void sub_100031418(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100049150)
  {
    v2 = sub_10000C3D0(255, (unint64_t *)&qword_100049158, (uint64_t)&protocol descriptor for Groupable, 1);
    v3 = type metadata accessor for _ContiguousArrayStorage(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100049150);
  }
}

void sub_100031480()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_100049300)
  {
    v0 = type metadata accessor for _ContiguousArrayStorage(0, (char *)&type metadata for Swift.AnyObject + 8);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_100049300);
  }
}

uint64_t sub_1000314D8(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    sub_100031520(255, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t))&type metadata accessor for Item);
    result = swift_getWitnessTable(&protocol conformance descriptor for Item<A>, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_100031520(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v6 = a5(0, a3, a4);
    if (!v7)
      atomic_store(v6, a2);
  }
}

void sub_100031568(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_100049340)
  {
    v2 = type metadata accessor for FeatureState(255);
    v3 = sub_100008EA0(&qword_1000492C0, (uint64_t (*)(uint64_t))&type metadata accessor for FeatureState, (uint64_t)&protocol conformance descriptor for FeatureState);
    v4 = type metadata accessor for Item(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_100049340);
  }
}

uint64_t sub_1000315E0(uint64_t a1)
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

int64_t sub_100031680(int64_t result, int a2, char a3, uint64_t a4)
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

void sub_100031764(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_100049360)
  {
    v2 = type metadata accessor for Settings.Container.TestSuite(255);
    v3 = sub_100008EA0(&qword_1000492B0, (uint64_t (*)(uint64_t))&type metadata accessor for Settings.Container.TestSuite, (uint64_t)&protocol conformance descriptor for Settings.Container.TestSuite);
    v4 = type metadata accessor for Item(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_100049360);
  }
}

void sub_1000317DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_100049378)
  {
    v2 = type metadata accessor for NewsProvider(255);
    v3 = sub_100008EA0(&qword_1000492A0, (uint64_t (*)(uint64_t))&type metadata accessor for NewsProvider, (uint64_t)&protocol conformance descriptor for NewsProvider);
    v4 = type metadata accessor for Item(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_100049378);
  }
}

void sub_100031854(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_100049390)
  {
    v2 = type metadata accessor for NewsEnvironment(255);
    v3 = sub_100008EA0(&qword_100049290, (uint64_t (*)(uint64_t))&type metadata accessor for NewsEnvironment, (uint64_t)&protocol conformance descriptor for NewsEnvironment);
    v4 = type metadata accessor for Item(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_100049390);
  }
}

void sub_1000318CC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_10001900C();
    v7 = a3(a1, &type metadata for Storefront, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

unint64_t sub_100031928()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000493B0;
  if (!qword_1000493B0)
  {
    sub_1000318CC(255, &qword_1000493A8, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))&type metadata accessor for Item);
    result = swift_getWitnessTable(&protocol conformance descriptor for Item<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000493B0);
  }
  return result;
}

void sub_100031980(uint64_t a1)
{
  uint64_t refreshed;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_1000493B8)
  {
    refreshed = type metadata accessor for FeedAutoRefreshStrategy(255);
    v3 = sub_100008EA0(&qword_100049278, (uint64_t (*)(uint64_t))&type metadata accessor for FeedAutoRefreshStrategy, (uint64_t)&protocol conformance descriptor for FeedAutoRefreshStrategy);
    v4 = type metadata accessor for Item(a1, refreshed, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1000493B8);
  }
}

void sub_1000319F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_1000493D0)
  {
    v2 = type metadata accessor for AppConfigurationSource(255);
    v3 = sub_100008EA0(&qword_100049260, (uint64_t (*)(uint64_t))&type metadata accessor for AppConfigurationSource, (uint64_t)&protocol conformance descriptor for AppConfigurationSource);
    v4 = type metadata accessor for Item(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1000493D0);
  }
}

void sub_100031A70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_1000493E8)
  {
    v2 = type metadata accessor for StocksDataServiceEnablement(255);
    v3 = sub_100008EA0(&qword_100049250, (uint64_t (*)(uint64_t))&type metadata accessor for StocksDataServiceEnablement, (uint64_t)&protocol conformance descriptor for StocksDataServiceEnablement);
    v4 = type metadata accessor for Item(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1000493E8);
  }
}

void sub_100031AE8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_100049400)
  {
    v2 = type metadata accessor for KVSCleanupPermission(255);
    v3 = sub_100008EA0(&qword_100049238, (uint64_t (*)(uint64_t))&type metadata accessor for KVSCleanupPermission, (uint64_t)&protocol conformance descriptor for KVSCleanupPermission);
    v4 = type metadata accessor for Item(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_100049400);
  }
}

char *sub_100031B60(void *a1, void *a2, void *a3, void *a4)
{
  void *v4;
  objc_class *ObjectType;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  char *result;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  ObjectType = (objc_class *)swift_getObjectType(v4);
  v10 = v4;
  Logger.init(subsystem:category:)(0xD000000000000012, 0x8000000100037870, 0x6567417961646F54, 0xEA0000000000746ELL);
  v11 = OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_didWriteTodayDataSubject;
  sub_100010258(0, (unint64_t *)&qword_100048908, (uint64_t)&type metadata for () + 8, (uint64_t (*)(_QWORD, uint64_t, void *, void *))&type metadata accessor for PassthroughSubject);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  *(_QWORD *)&v10[v11] = PassthroughSubject.init()();
  *(_QWORD *)&v10[OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_purchaseController] = a1;
  *(_QWORD *)&v10[OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_bundleSubscriptionManager] = a2;
  *(_QWORD *)&v10[OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_dropbox] = a4;
  v13 = a1;
  swift_unknownObjectRetain(a2);
  v14 = a4;

  v28.receiver = v10;
  v28.super_class = ObjectType;
  v15 = objc_msgSendSuper2(&v28, "init");
  v16 = objc_allocWithZone((Class)FCBoostableOperationThrottler);
  v17 = (char *)v15;
  v18 = objc_msgSend(v16, "initWithDelegate:", v17);
  v19 = OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler;
  v20 = *(void **)&v17[OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler];
  *(_QWORD *)&v17[OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler] = v18;

  v21 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v21, "addObserver:selector:name:object:", v17, "markPurchaseDirty", FCPurchaseListChangedNotificationName, 0);

  result = (char *)objc_msgSend(a2, "addObserver:", v17);
  v23 = *(void **)&v17[v19];
  if (v23)
  {
    v24 = (void *)objc_opt_self(UIApplication);
    v25 = v23;
    v26 = objc_msgSend(v24, "sharedApplication");
    v27 = objc_msgSend(v26, "applicationState");

    objc_msgSend(v25, "setSuspended:", v27 == 0);
    swift_unknownObjectRelease(a2);

    return v17;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100031DD4()
{
  void *v0;
  objc_class *ObjectType;
  id v2;
  objc_super v4;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  v2 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v2, "removeObserver:", v0);

  v4.receiver = v0;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t sub_100031F74()
{
  return type metadata accessor for StocksTodayAgent(0);
}

uint64_t sub_100031FA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v9;
  _QWORD *v10;

  v7[2] = a6;
  v7[3] = a7;
  v9 = type metadata accessor for MainActor(0);
  v7[4] = v9;
  v7[5] = static MainActor.shared.getter(v9);
  v10 = (_QWORD *)swift_task_alloc(dword_10004957C);
  v7[6] = v10;
  *v10 = v7;
  v10[1] = sub_100032020;
  return sub_100006324(a5);
}

uint64_t sub_100032020()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 32);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 48));
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100032090, v2, v3);
}

uint64_t sub_100032090()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(v0 + 16);
  v2 = swift_release(*(_QWORD *)(v0 + 40));
  v1(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000320C8(uint64_t a1, uint64_t a2, uint64_t a3)
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
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10000FBF0(a1);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_1000432A0, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_100049570, v16);
}

uint64_t sub_10003226C(uint64_t a1, uint64_t a2)
{
  return sub_10003228C(a1, a2, sub_100032684, 152);
}

uint64_t sub_10003227C(uint64_t a1, uint64_t a2)
{
  return sub_10003228C(a1, a2, sub_100032684, 158);
}

uint64_t sub_10003228C(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;

  type metadata accessor for MainActor(0);
  v9 = v4;
  return sub_10001B26C(a3, (uint64_t)&v8, (uint64_t)"StocksApp/StocksTodayAgent.swift", 32, 2u, a4);
}

uint64_t sub_100032320()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100032344(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1000323A8;
  return v6(a1);
}

uint64_t sub_1000323A8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000323F4()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100032428(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v9 = v1[6];
  v8 = v1[7];
  v10 = (_QWORD *)swift_task_alloc(dword_10004955C);
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_100018220;
  return sub_100031FA8(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_1000324B4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000324D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10004956C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100018220;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100049568 + dword_100049568))(a1, v4);
}

uint64_t sub_100032548()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10003256C(uint64_t a1)
{
  uint64_t v1;

  sub_100006FE8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

unint64_t sub_100032574()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100049588;
  if (!qword_100049588)
  {
    sub_100010258(255, (unint64_t *)&qword_100048908, (uint64_t)&type metadata for () + 8, (uint64_t (*)(_QWORD, uint64_t, void *, void *))&type metadata accessor for PassthroughSubject);
    result = swift_getWitnessTable(&protocol conformance descriptor for PassthroughSubject<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100049588);
  }
  return result;
}

uint64_t sub_1000325D8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10003260C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100010258(0, &qword_100049598, (uint64_t)&type metadata for Bool, (uint64_t (*)(_QWORD, uint64_t, void *, void *))&type metadata accessor for CheckedContinuation);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_100032684()
{
  sub_1000100C0();
}

__n128 initializeWithCopy for ArticleScore(uint64_t a1, __int128 *a2)
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
  v7 = a2[6];
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ArticleScore(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 120))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ArticleScore(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 120) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 120) = 0;
    if (a2)
      *(_BYTE *)(result + 56) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for ArticleScore()
{
  return &type metadata for ArticleScore;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC9StocksAppP33_2DCA117914DA7A3F460B455F137671BB19ResourceBundleClass);
}
