@implementation JSListenNowMusicSiriUpsell

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore26JSListenNowMusicSiriUpsell__title;
  v4 = sub_100007E8C((uint64_t *)&unk_1011A3370);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore26JSListenNowMusicSiriUpsell__subtitle, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore26JSListenNowMusicSiriUpsell__buttonTitle, v4);
}

@end
