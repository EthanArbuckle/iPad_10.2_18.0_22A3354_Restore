@implementation StaticLyricsContentViewController

- (void)viewDidLoad
{
  _TtC5Music33StaticLyricsContentViewController *v2;

  v2 = self;
  sub_100802578();

}

- (void)viewDidLayoutSubviews
{
  sub_100802CB4(self, (uint64_t)a2, (const char **)&selRef_viewDidLayoutSubviews);
}

- (void)viewLayoutMarginsDidChange
{
  sub_100802CB4(self, (uint64_t)a2, (const char **)&selRef_viewLayoutMarginsDidChange);
}

- (_TtC5Music33StaticLyricsContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

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
  return (_TtC5Music33StaticLyricsContentViewController *)sub_100803738(v5, v7, a4);
}

- (_TtC5Music33StaticLyricsContentViewController)initWithCoder:(id)a3
{
  return (_TtC5Music33StaticLyricsContentViewController *)sub_100803930(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->lyricsText[OBJC_IVAR____TtC5Music33StaticLyricsContentViewController_lyricsText]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music33StaticLyricsContentViewController_lyrics));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33StaticLyricsContentViewController_textColor));
  swift_bridgeObjectRelease(*(_QWORD *)&self->lyricsText[OBJC_IVAR____TtC5Music33StaticLyricsContentViewController_songIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33StaticLyricsContentViewController_lyricsFont));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33StaticLyricsContentViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33StaticLyricsContentViewController____lazy_storage___textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33StaticLyricsContentViewController____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33StaticLyricsContentViewController____lazy_storage___reportConcernButton));
}

@end
