@implementation NavigationWaypointController

- (NSArray)displayedWaypoints
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps28NavigationWaypointController_displayedWaypoints);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps28NavigationWaypointController_displayedWaypoints, v6, 0, 0);
  v3 = *v2;
  sub_10000E4BC(0, (unint64_t *)&qword_101491C90, GEOComposedWaypoint_ptr);
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setDisplayedWaypoints:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9[24];

  v5 = sub_10000E4BC(0, (unint64_t *)&qword_101491C90, GEOComposedWaypoint_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps28NavigationWaypointController_displayedWaypoints);
  swift_beginAccess(v7, v9, 1, 0);
  v8 = *v7;
  *v7 = v6;
  swift_bridgeObjectRelease(v8);
}

- (unint64_t)targetLegIndex
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC4Maps28NavigationWaypointController_targetLegIndex);
}

- (void)setTargetLegIndex:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28NavigationWaypointController_targetLegIndex) = (Class)a3;
}

- (GEOComposedWaypoint)originWaypoint
{
  return (GEOComposedWaypoint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC4Maps28NavigationWaypointController_originWaypoint));
}

- (void)setOriginWaypoint:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28NavigationWaypointController_originWaypoint);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28NavigationWaypointController_originWaypoint) = (Class)a3;
  v3 = a3;

}

- (_TtC4Maps28NavigationWaypointController)initWithService:(id)a3
{
  return (_TtC4Maps28NavigationWaypointController *)sub_10009747C(a3);
}

- (void)registerObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28NavigationWaypointController_observers), "registerObserver:", a3);
}

- (void)unregisterObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28NavigationWaypointController_observers), "unregisterObserver:", a3);
}

- (void)insertWaypoint:(id)a3
{
  id v4;
  _TtC4Maps28NavigationWaypointController *v5;

  v4 = a3;
  v5 = self;
  sub_100097638(v4);

}

- (void)replaceWaypoint:(id)a3 with:(id)a4
{
  id v6;
  id v7;
  _TtC4Maps28NavigationWaypointController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000978E8(v6, v7);

}

- (void)removeWaypointAt:(int64_t)a3
{
  _TtC4Maps28NavigationWaypointController *v4;

  v4 = self;
  sub_100097CA4(a3);

}

- (_TtC4Maps28NavigationWaypointController)init
{
  _TtC4Maps28NavigationWaypointController *result;

  result = (_TtC4Maps28NavigationWaypointController *)_swift_stdlib_reportUnimplementedInitializer("Maps.NavigationWaypointController", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps28NavigationWaypointController_displayedWaypoints));

}

- (void)navigationServiceWillReroute:(id)a3
{
  uint64_t v4;
  _TtC4Maps28NavigationWaypointController *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;

  v4 = qword_101490D18;
  v11 = a3;
  v5 = self;
  if (v4 != -1)
    swift_once(&qword_101490D18, sub_100099990);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_10000E918(v6, (uint64_t)qword_101498360);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "navigationServiceWillReroute", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  _TtC4Maps28NavigationWaypointController *v14;

  v8 = *(_QWORD *)&a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = self;
  sub_100099A2C(a3, v8);

}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v9;
  id v10;
  _TtC4Maps28NavigationWaypointController *v11;

  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_100098F88(a3, a4, a5);

}

- (void)navigationService:(id)a3 failedRerouteWithErrorCode:(int64_t)a4
{
  id v7;
  _TtC4Maps28NavigationWaypointController *v8;

  v7 = a3;
  v8 = self;
  sub_1000992F4(a3, a4);

}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v9;
  _TtC4Maps28NavigationWaypointController *v10;

  v9 = a3;
  v10 = self;
  sub_100099488(a3, a4, a5);

}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  id v10;
  id v11;
  _TtC4Maps28NavigationWaypointController *v12;

  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_100099D1C(a3, a4, a5);

}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v9;
  id v10;
  _TtC4Maps28NavigationWaypointController *v11;

  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_100099688(a3, a4, a5);

}

@end
