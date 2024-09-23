@implementation RecordLabelsDetailView

- (_TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView *)sub_1CF09C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView_recordLabels) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView_onSelectHandler);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView_recordLabelLinkViews) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView____lazy_storage___titleLabel) = 0;
  v5 = a3;

  result = (_TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/DetailCell.swift", 33, 2, 197, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView *v5;
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
  sub_1CFA08(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView *v2;

  v2 = self;
  sub_1CFCE0();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView *v6;

  v5 = a3;
  v6 = self;
  sub_1D0018(a3);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView_recordLabels));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView_onSelectHandler), *(_QWORD *)&self->recordLabels[OBJC_IVAR____TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView_onSelectHandler]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView_recordLabelLinkViews));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView____lazy_storage___titleLabel));
}

@end
