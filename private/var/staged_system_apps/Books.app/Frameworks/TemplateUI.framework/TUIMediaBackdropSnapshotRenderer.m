@implementation TUIMediaBackdropSnapshotRenderer

+ (void)renderWithContent:(id)a3 size:(CGSize)a4 contentScale:(double)a5 completionHandler:(id)a6
{
  double height;
  double width;
  void *v10;
  uint64_t v11;
  id v12;

  height = a4.height;
  width = a4.width;
  v10 = _Block_copy(a6);
  v11 = swift_allocObject(&unk_2439C8, 24, 7);
  *(_QWORD *)(v11 + 16) = v10;
  v12 = a3;
  _s10TemplateUI29MediaBackdropSnapshotRendererC6render7content4size0H5Scale10completionySo15TUIImageContentC_So6CGSizeV12CoreGraphics7CGFloatVySo10CGImageRefaSg_s5Error_pSgtctFZ_0(v12, (uint64_t)sub_17CDCC, v11, width, height, a5);

  swift_release(v11);
}

- (TUIMediaBackdropSnapshotRenderer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MediaBackdropSnapshotRenderer();
  return -[TUIMediaBackdropSnapshotRenderer init](&v3, "init");
}

@end
