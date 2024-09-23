@implementation LemonadeCuratedLibraryView.ContainerViewController.LibrarySummaryOutputPresenter

- (BOOL)wantsLocationNames
{
  return 0;
}

- (NSString)title
{
  void *v2;

  if (*(_QWORD *)&self->title[OBJC_IVAR____TtCCV12PhotosUICore26LemonadeCuratedLibraryViewP33_3214E6D65D1AA0606897629850A43E8423ContainerViewController29LibrarySummaryOutputPresenter_title])
  {
    _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
    v2 = (void *)sub_1A7AE3734();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtCCV12PhotosUICore26LemonadeCuratedLibraryViewP33_3214E6D65D1AA0606897629850A43E8423ContainerViewController29LibrarySummaryOutputPresenter *v7;

  if (a3)
  {
    v4 = sub_1A7AE3764();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1A69746E8(v4, v6);

}

- (_TtCCV12PhotosUICore26LemonadeCuratedLibraryViewP33_3214E6D65D1AA0606897629850A43E8423ContainerViewController29LibrarySummaryOutputPresenter)init
{
  _QWORD *v3;
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCCV12PhotosUICore26LemonadeCuratedLibraryViewP33_3214E6D65D1AA0606897629850A43E8423ContainerViewController29LibrarySummaryOutputPresenter_title);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCCV12PhotosUICore26LemonadeCuratedLibraryViewP33_3214E6D65D1AA0606897629850A43E8423ContainerViewController29LibrarySummaryOutputPresenter_onChange);
  v5 = (objc_class *)type metadata accessor for LemonadeCuratedLibraryView.ContainerViewController.LibrarySummaryOutputPresenter();
  *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return -[LemonadeCuratedLibraryView.ContainerViewController.LibrarySummaryOutputPresenter init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCCV12PhotosUICore26LemonadeCuratedLibraryViewP33_3214E6D65D1AA0606897629850A43E8423ContainerViewController29LibrarySummaryOutputPresenter_onChange));
}

@end
