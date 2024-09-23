@implementation ItemizedTextListView

- (_TtC16MusicApplication20ItemizedTextListView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication20ItemizedTextListView *)sub_68E458(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication20ItemizedTextListView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_691034();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication20ItemizedTextListView *v6;

  v5 = a3;
  v6 = self;
  sub_68E6D0(a3);

}

- (void)music_inheritedLayoutInsetsDidChange
{
  char *v2;
  void (*v3)(char *, __n128);
  uint64_t v4;
  __n128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ItemizedTextListView();
  v2 = (char *)v6.receiver;
  -[ItemizedTextListView music_inheritedLayoutInsetsDidChange](&v6, "music_inheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "setNeedsLayout", v6.receiver, v6.super_class);
  v3 = *(void (**)(char *, __n128))&v2[OBJC_IVAR____TtC16MusicApplication20ItemizedTextListView_layoutInvalidationHandler];
  if (v3)
  {
    v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC16MusicApplication20ItemizedTextListView_layoutInvalidationHandler + 8];
    v5 = swift_retain(v4);
    v3(v2, v5);
    sub_5C198((uint64_t)v3, v4);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplication20ItemizedTextListView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_68E930(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication20ItemizedTextListView *v2;

  v2 = self;
  sub_68F1AC();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication20ItemizedTextListView_layoutInvalidationHandler), *(_QWORD *)&self->wantsTopSeparator[OBJC_IVAR____TtC16MusicApplication20ItemizedTextListView_layoutInvalidationHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ItemizedTextListView____lazy_storage___separator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ItemizedTextListView____lazy_storage___headerTitleLabel));
  swift_bridgeObjectRelease();
}

@end
