@implementation DetailHeader

- (_TtC16MusicApplication12DetailHeader)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication12DetailHeader *)sub_6745F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication12DetailHeader)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_67FA74();
}

- (void)layoutSubviews
{
  _TtC16MusicApplication12DetailHeader *v2;

  v2 = self;
  sub_674998();

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_675204(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  sub_675254(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_bounds, (SEL *)&selRef_setBounds_);
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_675204(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  sub_675254(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_frame, (SEL *)&selRef_setFrame_);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplication12DetailHeader *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_675464(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication12DetailHeader *v6;

  v5 = a3;
  v6 = self;
  sub_675914(a3);

}

- (_TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView)accessibilityPlaylistVisibilitySwitchContainerView
{
  return (_TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView *)*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication12DetailHeader_detailsView) + OBJC_IVAR____TtCC16MusicApplication12DetailHeader11DetailsView_visibilitySwitch);
}

- (NSString)accessibilityIsVisiblePlaylistTitle
{
  void *v2;
  _TtC16MusicApplication12DetailHeader *v3;
  id v4;
  uint64_t v5;
  NSString v6;
  _BYTE v8[24];

  v2 = *(void **)(*(char **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicApplication12DetailHeader_detailsView)
                + OBJC_IVAR____TtCC16MusicApplication12DetailHeader11DetailsView_visibilitySwitch);
  v3 = self;
  v4 = v2;
  v5 = sub_67FCA8();
  swift_bridgeObjectRelease();
  swift_beginAccess(v5 + 112, v8, 0, 0);
  swift_bridgeObjectRetain();

  swift_release(v5);
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (UIView)accessibilityArtworkEditingOverlayView
{
  _TtC16MusicApplication12DetailHeader *v2;
  id v3;

  v2 = self;
  v3 = sub_676C84();

  return (UIView *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12DetailHeader__curatorsViewController));
  swift_bridgeObjectRelease();

  sub_64880((uint64_t)self + OBJC_IVAR____TtC16MusicApplication12DetailHeader_editingDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12DetailHeader_visibilitySeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12DetailHeader_descriptionSeparator));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication12DetailHeader_artworkCachingReference));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication12DetailHeader_artworkComponent));
  swift_bridgeObjectRelease();
  sub_68055C(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___detailsConstraints), *(void **)&self->actionText[OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___detailsConstraints], *(void **)&self->actionText[OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___detailsConstraints+ 8], *(void **)&self->_curatorsViewController[OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___detailsConstraints], *(void **)&self->showsArtwork[OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___detailsConstraints], *(void **)&self->hiddenHeaderElements[OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___detailsConstraints+ 7]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___artworkContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___artworkShadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12DetailHeader_radiosityShadow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___artworkEditingOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12DetailHeader_detailsView));
}

@end
