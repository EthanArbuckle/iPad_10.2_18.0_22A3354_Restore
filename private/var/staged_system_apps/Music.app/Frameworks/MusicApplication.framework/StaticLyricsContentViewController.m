@implementation StaticLyricsContentViewController

- (void)viewDidLoad
{
  _TtC16MusicApplication33StaticLyricsContentViewController *v2;

  v2 = self;
  sub_293EC8();

}

- (void)viewDidLayoutSubviews
{
  sub_294604(self, (uint64_t)a2, (const char **)&selRef_viewDidLayoutSubviews);
}

- (void)viewLayoutMarginsDidChange
{
  sub_294604(self, (uint64_t)a2, (const char **)&selRef_viewLayoutMarginsDidChange);
}

- (_TtC16MusicApplication33StaticLyricsContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication33StaticLyricsContentViewController *v9;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  v9 = (_TtC16MusicApplication33StaticLyricsContentViewController *)sub_29572C(v5, v7, (uint64_t)a4);

  return v9;
}

- (_TtC16MusicApplication33StaticLyricsContentViewController)initWithCoder:(id)a3
{
  id v3;
  _TtC16MusicApplication33StaticLyricsContentViewController *v4;

  v3 = a3;
  v4 = (_TtC16MusicApplication33StaticLyricsContentViewController *)sub_2958C4((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->lyricsText[OBJC_IVAR____TtC16MusicApplication33StaticLyricsContentViewController_lyricsText]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication33StaticLyricsContentViewController_lyrics));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33StaticLyricsContentViewController_textColor));
  swift_bridgeObjectRelease(*(_QWORD *)&self->lyricsText[OBJC_IVAR____TtC16MusicApplication33StaticLyricsContentViewController_songIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33StaticLyricsContentViewController_lyricsFont));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33StaticLyricsContentViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33StaticLyricsContentViewController____lazy_storage___textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33StaticLyricsContentViewController____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33StaticLyricsContentViewController____lazy_storage___reportConcernButton));
}

@end
