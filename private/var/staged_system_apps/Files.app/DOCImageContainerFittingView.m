@implementation DOCImageContainerFittingView

- (double)contentOffsetFromTop
{
  double *v2;
  _BYTE v4[24];

  v2 = (double *)((char *)self + OBJC_IVAR____TtC5Files28DOCImageContainerFittingView_contentOffsetFromTop);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files28DOCImageContainerFittingView_contentOffsetFromTop, v4, 0, 0);
  return *v2;
}

- (void)setContentOffsetFromTop:(double)a3
{
  double *v4;
  _BYTE v5[24];

  v4 = (double *)((char *)self + OBJC_IVAR____TtC5Files28DOCImageContainerFittingView_contentOffsetFromTop);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files28DOCImageContainerFittingView_contentOffsetFromTop, v5, 1, 0);
  *v4 = a3;
}

- (_TtC5Files28DOCImageContainerFittingView)initWithFrame:(CGRect)a3
{
  _TtC5Files28DOCImageContainerFittingView *result;

  sub_1001F92C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC5Files28DOCImageContainerFittingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s5Files28DOCImageContainerFittingViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double height;
  double width;
  _TtC5Files28DOCImageContainerFittingView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = DOCImageContainerFittingView.systemLayoutSizeFitting(_:)(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC5Files28DOCImageContainerFittingView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  DOCImageContainerFittingView.intrinsicContentSize.getter();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCImageContainerFittingView();
  v2 = v3.receiver;
  -[DOCImageContainerFittingView layoutSubviews](&v3, "layoutSubviews");
  DOCImageContainerFittingView.updateContentFrame()();
  objc_msgSend(v2, "setContentOffsetFromTop:", 0.0, v3.receiver, v3.super_class);

}

- (void)thumbnailLoaded:(id)a3
{
  uint64_t *v5;
  uint64_t v6;
  _TtC5Files28DOCImageContainerFittingView *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  char v11;
  _BYTE v12[24];

  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files28DOCImageContainerFittingView_thumbnails);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files28DOCImageContainerFittingView_thumbnails, v12, 0, 0);
  v6 = *v5;
  swift_unknownObjectRetain(a3);
  v7 = self;
  v8 = swift_bridgeObjectRetain(v6);
  v9 = sub_1001FBF28(v8, a3);
  v11 = v10;
  swift_bridgeObjectRelease(v6);
  if ((v11 & 1) == 0)
    sub_1001FB0E8(a3, v9);
  swift_unknownObjectRelease(a3);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Files28DOCImageContainerFittingView_viewPairs));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Files28DOCImageContainerFittingView_thumbnails));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Files28DOCImageContainerFittingView_displayedNodes));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Files28DOCImageContainerFittingView_nodes));
}

- (void)fittingImageViewDidLayout:(id)a3
{
  id v4;
  _TtC5Files28DOCImageContainerFittingView *v5;

  v4 = a3;
  v5 = self;
  _s5Files28DOCImageContainerFittingViewC012fittingImageE9DidLayoutyySo010DOCFittinggE0CF_0();

}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  _TtC5Files28DOCImageContainerFittingView *v7;
  _QWORD *v8;
  Class isa;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = _s5Files28DOCImageContainerFittingViewC15dragInteraction_17itemsForBeginningSaySo10UIDragItemCGSo0kG0C_So0K7Session_ptF_0(v6);

  swift_unknownObjectRelease(a4);
  sub_10004F2F0(0, (unint64_t *)&unk_100648460, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  _TtC5Files28DOCImageContainerFittingView *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  v11 = _s5Files28DOCImageContainerFittingViewC15dragInteraction_17previewForLifting7sessionSo21UITargetedDragPreviewCSgSo06UIDragG0C_So0O4ItemCSo0O7Session_ptF_0(v8);

  swift_unknownObjectRelease(a5);
  return v11;
}

@end
