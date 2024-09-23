@implementation SocialProfilesAccessoryView

- (void)layoutSubviews
{
  _TtC16MusicApplication27SocialProfilesAccessoryView *v2;

  v2 = self;
  sub_867154();

}

- (_TtC16MusicApplication27SocialProfilesAccessoryView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _OWORD *v9;
  __int128 v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27SocialProfilesAccessoryView_accessorySocialPersons) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27SocialProfilesAccessoryView_artworkCachingReference) = 0;
  v9 = (_OWORD *)((char *)self + OBJC_IVAR____TtC16MusicApplication27SocialProfilesAccessoryView_overlayMargins);
  v10 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *v9 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v9[1] = v10;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27SocialProfilesAccessoryView_peopleBadgeView) = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[SocialProfilesAccessoryView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplication27SocialProfilesAccessoryView)initWithCoder:(id)a3
{
  id v3;
  _TtC16MusicApplication27SocialProfilesAccessoryView *v4;

  v3 = a3;
  v4 = (_TtC16MusicApplication27SocialProfilesAccessoryView *)sub_868EEC((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication27SocialProfilesAccessoryView_accessorySocialPersons));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication27SocialProfilesAccessoryView_artworkCachingReference));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SocialProfilesAccessoryView_peopleBadgeView));
}

@end
