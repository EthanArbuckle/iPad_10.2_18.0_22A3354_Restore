@implementation MusicVideoDetailHeaderLockupView

- (_TtC16MusicApplication32MusicVideoDetailHeaderLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication32MusicVideoDetailHeaderLockupView *)sub_613EB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication32MusicVideoDetailHeaderLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_61689C();
}

- (void)layoutSubviews
{
  _TtC16MusicApplication32MusicVideoDetailHeaderLockupView *v2;

  v2 = self;
  sub_614B34();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_lockupImageArtworkCatalog));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_playButtonHandler), *(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_playButtonHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_buildMenu), *(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_buildMenu]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_artistButtonHandler), *(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_artistButtonHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_libraryAddKeepLocalStatusObserver));
  sub_64880((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_libraryAddKeepLocalStatusControllableDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_libraryAddKeepLocalControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_contextualActionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_headerLockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView____lazy_storage___actionableBylineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_detailLabel));
}

@end
