@implementation ArtworkContainer

- (_TtC23ShelfKitCollectionViews16ArtworkContainer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2652DC();
}

- (UIView)accessibilityPlayButton
{
  return (UIView *)sub_264450(self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_playButton);
}

- (UIView)accessibilityContextButton
{
  return (UIView *)sub_264450(self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_contextButton);
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews16ArtworkContainer *v2;

  v2 = self;
  sub_264490();

}

- (_TtC23ShelfKitCollectionViews16ArtworkContainer)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews16ArtworkContainer *result;

  result = (_TtC23ShelfKitCollectionViews16ArtworkContainer *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.ArtworkContainer", 40, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_episodePlayStateController));
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_libraryActionController, &qword_3DECA8);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_legibilityGradientView));
  v3 = *(_QWORD *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle
                                               + 16];
  v4 = *(_QWORD *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle
                                               + 24];
  v5 = *(_QWORD *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle
                                               + 32];
  v6 = *(_QWORD *)&self->artworkView[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle];
  v7 = *(_QWORD *)&self->legibilityGradientView[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle];
  v8 = *(_QWORD *)&self->mt_hoverStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle];
  v9 = *(_QWORD *)&self->mt_hoverStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle + 8];
  v10 = *(void **)&self->mt_hoverStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle + 16];
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle));
  sub_B7AE8(v3, v4, v5, v6, v7, v8, v9, v10);
  sub_B7A70(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle), *(_QWORD *)&self->episodePlayStateController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle], *(_QWORD *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle], *(_QWORD *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle+ 8], *(_QWORD *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle+ 16], *(_QWORD *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle+ 24], *(_QWORD *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle+ 32], *(_QWORD *)&self->artworkView[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle], *(_QWORD *)&self->legibilityGradientView[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle], *(_QWORD *)&self->mt_hoverStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle], *(_QWORD *)&self->mt_hoverStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle + 8], *(void **)&self->mt_hoverStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle + 16]);
  sub_10DBC8((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_delegate);
  sub_AEEF0((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_playState);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_playbackStatusPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_playButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_contextButton));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_playAction));
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_playHandler), *(_QWORD *)&self->episodePlayStateController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_playHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_contextAction));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_objectGraph));
}

@end
