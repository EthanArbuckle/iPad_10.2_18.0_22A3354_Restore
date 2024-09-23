@implementation TipsContentModel

- (_TtC6TipsUI16TipsContentModel)init
{
  return (_TtC6TipsUI16TipsContentModel *)sub_20CF8696C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
  v4 = sub_20CFCC728();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController));
  swift_release();
  swift_release();
  swift_release();
  v5 = (char *)self + OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  v6 = sub_20CFCC554();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (void)appControllerContentUpdated:(id)a3
{
  TPSAppController *v4;
  _TtC6TipsUI16TipsContentModel *v5;

  v4 = (TPSAppController *)a3;
  v5 = self;
  TipsContentModel.appControllerContentUpdated(_:)(v4);

}

- (void)appController:(id)a3 loadingContent:(BOOL)a4
{
  TPSAppController *v6;
  _TtC6TipsUI16TipsContentModel *v7;

  v6 = (TPSAppController *)a3;
  v7 = self;
  TipsContentModel.appController(_:loadingContent:)(v6, a4);

}

- (void)appControllerNetworkStateDidChangeToReachable:(id)a3
{
  sub_20CFC1DBC(self, (uint64_t)a2, a3);
}

- (void)appControllerUserUpdatedSavedTips:(id)a3
{
  sub_20CFC1DBC(self, (uint64_t)a2, a3);
}

@end
