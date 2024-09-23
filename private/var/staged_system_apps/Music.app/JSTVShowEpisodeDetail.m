@implementation JSTVShowEpisodeDetail

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSTVShowEpisodeDetail__item;
  v4 = sub_100007E8C(&qword_1011EC1F0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore21JSTVShowEpisodeDetail_containerDetailLink));
}

@end
