@implementation CitySearchController

- (_TtC11MusicCoreUIP33_66D9DE5C50A23191A347FA0B4F8C41B820CitySearchController)init
{
  return (_TtC11MusicCoreUIP33_66D9DE5C50A23191A347FA0B4F8C41B820CitySearchController *)sub_1002A244C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC11MusicCoreUIP33_66D9DE5C50A23191A347FA0B4F8C41B820CitySearchController__query;
  v4 = sub_100005574(&qword_10049BB68);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC11MusicCoreUIP33_66D9DE5C50A23191A347FA0B4F8C41B820CitySearchController__completionResults;
  v6 = sub_100005574(&qword_10049BB60);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MusicCoreUIP33_66D9DE5C50A23191A347FA0B4F8C41B820CitySearchController_searchCompleter));
}

@end
