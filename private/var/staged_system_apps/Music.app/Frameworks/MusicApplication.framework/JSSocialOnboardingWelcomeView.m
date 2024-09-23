@implementation JSSocialOnboardingWelcomeView

- (_TtC16MusicApplication29JSSocialOnboardingWelcomeView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication29JSSocialOnboardingWelcomeView *)JSSocialOnboardingWelcomeView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication29JSSocialOnboardingWelcomeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s16MusicApplication29JSSocialOnboardingWelcomeViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[JSSocialOnboardingWelcomeView setIsAccessibilityElement:](&v4, "setIsAccessibilityElement:", v3);
}

- (NSString)accessibilityLabel
{
  _TtC16MusicApplication29JSSocialOnboardingWelcomeView *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  JSSocialOnboardingWelcomeView.accessibilityLabel.getter();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  _TtC16MusicApplication29JSSocialOnboardingWelcomeView *v8;
  _TtC16MusicApplication29JSSocialOnboardingWelcomeView *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = self;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v9 = self;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  -[JSSocialOnboardingWelcomeView setAccessibilityLabel:](&v10, "setAccessibilityLabel:", a3);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication29JSSocialOnboardingWelcomeView *v2;

  v2 = self;
  JSSocialOnboardingWelcomeView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplication29JSSocialOnboardingWelcomeView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = JSSocialOnboardingWelcomeView.sizeThatFits(_:)(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication29JSSocialOnboardingWelcomeView_headline]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication29JSSocialOnboardingWelcomeView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication29JSSocialOnboardingWelcomeView_subtitle]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSSocialOnboardingWelcomeView_artwork));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29JSSocialOnboardingWelcomeView_textDrawingCache));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29JSSocialOnboardingWelcomeView_artworkCachingReference));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29JSSocialOnboardingWelcomeView_artworkComponent));
  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication29JSSocialOnboardingWelcomeView_textComponents);
  v4 = *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication29JSSocialOnboardingWelcomeView_textComponents];
  v5 = *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication29JSSocialOnboardingWelcomeView_textComponents + 8];
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication29JSSocialOnboardingWelcomeView_textComponents]);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSSocialOnboardingWelcomeView_textStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSSocialOnboardingWelcomeView_imageArtworkCatalog));
}

@end
