@implementation ContainerDetailTracklistSectionHeaderView

- (_TtC16MusicApplication41ContainerDetailTracklistSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication41ContainerDetailTracklistSectionHeaderView *)sub_2FD190();
}

- (_TtC16MusicApplication41ContainerDetailTracklistSectionHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2FD374();
}

- (void)layoutSubviews
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for ContainerDetailTracklistSectionHeaderView();
  v2 = (char *)v16.receiver;
  -[ContainerDetailTracklistSectionHeaderView layoutSubviews](&v16, "layoutSubviews");
  objc_msgSend(v2, "bounds", v16.receiver, v16.super_class);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v2, "music_inheritedLayoutInsets");
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(v2, "effectiveUserInterfaceLayoutDirection");
  UIEdgeInsetsInsetRect(v4, v6, v8, v10, v12, v14);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC16MusicApplication41ContainerDetailTracklistSectionHeaderView_textStackView], "setFrame:", CGRect.applyingLayoutDirection(_:inBounds:)(v15));

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication41ContainerDetailTracklistSectionHeaderView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication41ContainerDetailTracklistSectionHeaderView_subtitle]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication41ContainerDetailTracklistSectionHeaderView_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication41ContainerDetailTracklistSectionHeaderView_textStackView));
  v3 = (char *)self + OBJC_IVAR____TtC16MusicApplication41ContainerDetailTracklistSectionHeaderView_textComponents;
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication41ContainerDetailTracklistSectionHeaderView_textComponents);
  v5 = *((_QWORD *)v3 + 1);
  swift_bridgeObjectRelease(*((_QWORD *)v3 + 2));
  swift_release(v5);
  swift_release(v4);
}

@end
