@implementation PlaybackStatusView

- (_TtC23ShelfKitCollectionViews18PlaybackStatusView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_27F780();
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews18PlaybackStatusView *v2;

  v2 = self;
  sub_27C138();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC23ShelfKitCollectionViews18PlaybackStatusView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_27D35C();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC23ShelfKitCollectionViews18PlaybackStatusView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_27D7D4();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews18PlaybackStatusView *v6;

  v5 = a3;
  v6 = self;
  sub_27DE6C(a3);

}

- (NSString)accessibilityTimeRemainingString
{
  return (NSString *)sub_FA7E0(self, (uint64_t)a2, (void (*)(void))sub_27E010);
}

- (NSString)accessibilityPlayedDateString
{
  return (NSString *)sub_FA7E0(self, (uint64_t)a2, (void (*)(void))sub_27E134);
}

- (_TtC23ShelfKitCollectionViews18PlaybackStatusView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews18PlaybackStatusView *result;

  result = (_TtC23ShelfKitCollectionViews18PlaybackStatusView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.PlaybackStatusView", 42, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[6];
  _OWORD v11[2];
  _OWORD v12[8];
  uint64_t v13;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_playedDateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_timeLabel));
  v3 = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_legacyPlayedCheckmarkMargins
                                                    + 47];
  v10[4] = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_legacyPlayedCheckmarkMargins
                                                        + 31];
  v10[5] = v3;
  v11[0] = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_legacyPlayedCheckmarkMargins
                                                        + 63];
  *(_OWORD *)((char *)v11 + 10) = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_legacyPlayedCheckmarkMargins
                                                                               + 73];
  v4 = *(_OWORD *)&self->timeLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_legacyPlayedCheckmarkMargins];
  v10[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_legacyPlayedCheckmarkMargins);
  v10[1] = v4;
  v5 = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_legacyPlayedCheckmarkMargins
                                                    + 15];
  v10[2] = *(_OWORD *)&self->itemDuration[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_legacyPlayedCheckmarkMargins
                                        + 8];
  v10[3] = v5;
  sub_27FD88((uint64_t)v10, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_14788);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_checkmarkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_progressView));
  v6 = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme
                                                    + 79];
  v12[6] = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme
                                                        + 63];
  v12[7] = v6;
  v13 = *(_QWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme
                                                     + 95];
  v7 = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme
                                                    + 15];
  v12[2] = *(_OWORD *)&self->itemDuration[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme + 8];
  v12[3] = v7;
  v8 = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme
                                                    + 47];
  v12[4] = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme
                                                        + 31];
  v12[5] = v8;
  v9 = *(_OWORD *)&self->timeLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme];
  v12[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme);
  v12[1] = v9;
  sub_10DA74((uint64_t)v12);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_presenter));
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_playStateChangeHandler), *(_QWORD *)&self->playedDateLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_playStateChangeHandler]);
  sub_FA4C((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_playState, type metadata accessor for PlayState);
}

@end
