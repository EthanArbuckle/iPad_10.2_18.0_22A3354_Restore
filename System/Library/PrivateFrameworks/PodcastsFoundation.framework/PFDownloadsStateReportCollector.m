@implementation PFDownloadsStateReportCollector

- (PFDownloadsStateReportCollector)initWithManagedObjectContext:(id)a3 episodePropertiesToReport:(id)a4 showPropertiesToReport:(id)a5 allEpisodes:(BOOL)a6
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  objc_super v14;

  v9 = sub_1A93F8310();
  v10 = sub_1A93F8310();
  v11 = (char *)self + OBJC_IVAR___PFDownloadsStateReportCollector_checker;
  *(_QWORD *)v11 = a3;
  *((_QWORD *)v11 + 1) = v9;
  *((_QWORD *)v11 + 2) = v10;
  v11[24] = a6;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for DownloadStateReportCollector();
  v12 = a3;
  return -[PFDownloadsStateReportCollector init](&v14, sel_init);
}

- (void)generateReportWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  PFDownloadsStateReportCollector *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1A91D1BE4((uint64_t)sub_1A91D2324, v5);

  swift_release();
}

- (PFDownloadsStateReportCollector)init
{
  PFDownloadsStateReportCollector *result;

  result = (PFDownloadsStateReportCollector *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFDownloadsStateReportCollector_checker);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
