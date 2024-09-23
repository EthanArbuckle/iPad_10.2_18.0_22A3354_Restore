@implementation HighlightsHitTestResult

- (id)px_photosViewTouchableHitTestResultTouchAction
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  v2 = *(uint64_t *)((char *)&self->super._userDataProvider
                  + OBJC_IVAR____TtC12PhotosUICore23HighlightsHitTestResult_px_photosViewTouchableHitTestResultTouchAction);
  v5[4] = *(Class *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC12PhotosUICore23HighlightsHitTestResult_px_photosViewTouchableHitTestResultTouchAction);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = sub_1A6F905BC;
  v5[3] = &block_descriptor_4_0;
  v3 = _Block_copy(v5);
  sub_1A7ADBF34();
  swift_release();
  return v3;
}

- (_TtC12PhotosUICore23HighlightsHitTestResult)initWithSpriteReference:(id)a3 layout:(id)a4 identifier:(id)a5 userDataProvider:(id)a6
{
  id v9;
  id v10;
  id v11;
  _TtC12PhotosUICore23HighlightsHitTestResult *result;

  _Block_copy(a6);
  v9 = a3;
  v10 = a4;
  v11 = a5;
  result = (_TtC12PhotosUICore23HighlightsHitTestResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore23HighlightsHitTestResult_item);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore23HighlightsHitTestResult_displayItem);
  swift_release();
}

@end
