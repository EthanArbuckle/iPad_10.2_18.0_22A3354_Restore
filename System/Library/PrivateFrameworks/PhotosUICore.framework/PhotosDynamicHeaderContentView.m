@implementation PhotosDynamicHeaderContentView

- (_TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A6BA0D10();
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosDynamicHeaderContentView(0);
  v2 = v3.receiver;
  -[PhotosDynamicHeaderContentView layoutSubviews](&v3, sel_layoutSubviews);
  sub_1A7ADCC9C();

}

- (BOOL)handlePrimaryAction:(id)a3
{
  id v4;
  _TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1A6B995CC(v4);

  return self & 1;
}

- (void)willMoveToWindow:(id)a3
{
  id v5;
  _TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView *v6;

  v5 = a3;
  v6 = self;
  sub_1A6B99908((uint64_t)a3);

}

- (UIEdgeInsets)safeAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (_TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView)initWithFrame:(CGRect)a3
{
  _TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView *result;

  result = (_TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  char *v6;
  uint64_t v7;

  v3 = *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity
                  + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView_configuration);
  v4 = *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                  + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView_configuration);
  v5 = *((_BYTE *)&self->super._cachedTraitCollection
       + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView_configuration));
  sub_1A68589A0(v3, v4, v5);
  sub_1A6BA2648((uint64_t)self+ OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView_insets, (unint64_t *)&unk_1EE8D4800, (uint64_t)&unk_1EE8D47F0, (uint64_t)&protocol descriptor for PhotosDynamicHeaderInsets);
  swift_unknownObjectRelease();
  swift_release();
  v6 = (char *)self
     + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView_environmentValues;
  v7 = sub_1A7ADF540();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView_overlayViewController));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView_scenePhaseView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView_photosViewModel));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView_movieStoryViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView____lazy_storage___emptyView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView____lazy_storage___movieStoryStyleSwitcherButton));
  sub_1A6A430C8(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView____lazy_storage___movieCurationButton));
  sub_1A6A430C8(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView____lazy_storage___feedbackButton));
  sub_1A6BA1318(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView____lazy_storage___movieCustomExcludedActionTypes));
  sub_1A6A430C8(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView____lazy_storage___customBannerView));
  sub_1A67EC0B0((uint64_t)self+ OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView____lazy_storage___centralizedFeedbackActionPerformer, (uint64_t (*)(_QWORD))sub_1A6BA11FC);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView____lazy_storage___proxy));
}

@end
