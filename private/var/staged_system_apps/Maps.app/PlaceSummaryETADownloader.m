@implementation PlaceSummaryETADownloader

- (void)ETAProviderUpdated:(id)a3
{
  id v5;
  _TtC4Maps25PlaceSummaryETADownloader *v6;

  v5 = a3;
  v6 = self;
  sub_100184E64(a3);

}

- (_TtC4Maps25PlaceSummaryETADownloader)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryETADownloader_etaProviders) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryETADownloader_models) = (Class)_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlaceSummaryETADownloader();
  return -[PlaceSummaryETADownloader init](&v3, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps25PlaceSummaryETADownloader_etaProviders));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryETADownloader_models));
}

@end
