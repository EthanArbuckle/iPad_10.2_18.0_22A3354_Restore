@implementation SeriesListModeManager

- (_TtC5Books21SeriesListModeManager)init
{
  return (_TtC5Books21SeriesListModeManager *)SeriesListModeManager.init()();
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books21SeriesListModeManager_filterPublishers));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books21SeriesListModeManager_sortPublishers));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books21SeriesListModeManager_filterOptions));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books21SeriesListModeManager_sortOrders));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books21SeriesListModeManager_previousSortOrders));
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  id v6;
  id v7;
  _TtC5Books21SeriesListModeManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1003ACED0(v7);

}

@end
