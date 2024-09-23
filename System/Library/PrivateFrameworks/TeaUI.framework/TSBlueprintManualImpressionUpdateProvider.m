@implementation TSBlueprintManualImpressionUpdateProvider

- (void)setVisibileViewAccessor:(id)a3 visibleRectAccessor:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  TSBlueprintManualImpressionUpdateProvider *v10;

  v6 = _Block_copy(a3);
  v7 = _Block_copy(a4);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = self;
  BlueprintManualImpressionUpdateProvider.set(visibleViewAccessor:visibleRectAccessor:)((uint64_t)sub_1B149153C, v8, (uint64_t)sub_1B1491544, v9);

  swift_release();
  swift_release();
}

- (void)updateImpressionsForView:(id)a3 withVisibleRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIView *v9;
  TSBlueprintManualImpressionUpdateProvider *v10;
  __C::CGRect v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = (UIView *)a3;
  v10 = self;
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  BlueprintManualImpressionUpdateProvider.updateImpressions(for:with:)(v9, v11);

}

- (void)endImpressions
{
  TSBlueprintManualImpressionUpdateProvider *v2;

  v2 = self;
  BlueprintManualImpressionUpdateProvider.endImpressions()();

}

- (TSBlueprintManualImpressionUpdateProvider)init
{
  return (TSBlueprintManualImpressionUpdateProvider *)BlueprintManualImpressionUpdateProvider.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B13B9100(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___TSBlueprintManualImpressionUpdateProvider_visibleViewAccessor));
  sub_1B13B9100(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___TSBlueprintManualImpressionUpdateProvider_visibleRectAccessor));
}

@end
