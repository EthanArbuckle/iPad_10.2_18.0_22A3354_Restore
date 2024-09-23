@implementation SLCollaborationAttributionView

- (CGSize)intrinsicContentSize
{
  SLCollaborationAttributionView *v2;
  double v3;
  double v4;
  id v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  -[SLRemoteView maxWidth](v2, sel_maxWidth);
  v4 = v3;
  v5 = -[SLRemoteView maxWidth](v2, sel_maxWidth);
  v6 = (*(double (**)(id))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v2->super.super.super.super.super.isa) + 0x150))(v5);

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (SLCollaborationAttributionViewDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___SLCollaborationAttributionView_delegate;
  swift_beginAccess();
  return (SLCollaborationAttributionViewDelegate *)(id)MEMORY[0x19AEC4F4C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (BOOL)automaticallyAdjustsMaxWidthToFitBounds
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SLCollaborationAttributionView_automaticallyAdjustsMaxWidthToFitBounds;
  swift_beginAccess();
  return *v2;
}

- (void)setAutomaticallyAdjustsMaxWidthToFitBounds:(BOOL)a3
{
  _BOOL4 v3;
  char *v5;
  char v6;

  v3 = a3;
  v5 = (char *)self + OBJC_IVAR___SLCollaborationAttributionView_automaticallyAdjustsMaxWidthToFitBounds;
  swift_beginAccess();
  v6 = *v5;
  *v5 = v3;
  if ((v6 & 1) == 0 && v3)
    -[SLCollaborationAttributionView setNeedsLayout](self, sel_setNeedsLayout);
}

- (SLCollaborationAttributionView)initWithHighlight:(id)a3 variant:(int64_t)a4
{
  id v5;
  SLCollaborationAttributionView *v6;

  v5 = a3;
  v6 = (SLCollaborationAttributionView *)specialized CollaborationAttributionView.init(highlight:variant:)(v5, a4);

  return v6;
}

- (SLCollaborationAttributionView)initWithVariant:(int64_t)a3
{
  return (SLCollaborationAttributionView *)CollaborationAttributionView.init(variant:)(a3);
}

- (SLCollaborationAttributionView)initWithCoder:(id)a3
{
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)layoutSubviews
{
  SLCollaborationAttributionView *v2;

  v2 = self;
  CollaborationAttributionView.layoutSubviews()();

}

- (void)updatePlaceHolderSymbolScale:(int64_t)a3 weight:(int64_t)a4 pointSize:(double)a5
{
  SLCollaborationAttributionView *v8;

  v8 = self;
  CollaborationAttributionView.updatePlaceholderSymbol(scale:weight:pointSize:)(a3, a4, a5);

}

- (void)tintColorDidChange
{
  id v2;
  id v3;
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CollaborationAttributionView();
  v2 = v6.receiver;
  -[SLCollaborationAttributionView tintColorDidChange](&v6, sel_tintColorDidChange);
  v3 = objc_msgSend(v2, sel_slotView, v6.receiver, v6.super_class);
  v4 = objc_msgSend(v2, sel_tintColor);
  objc_msgSend(v3, sel_setTintColor_, v4);

  v5 = objc_msgSend(v2, sel_slotView);
  objc_msgSend(v5, sel__updateContent);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  SLCollaborationAttributionView *v6;
  SLCollaborationAttributionView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  CollaborationAttributionView.traitCollectionDidChange(_:)(v8);

}

- (id)makePlaceholderSlotContentForStyle:(id)a3
{
  id v4;
  SLCollaborationAttributionView *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = CollaborationAttributionView.makePlaceholderSlotContent(for:)(v4);

  return v6;
}

- (void)renderRemoteContentForLayerContextID:(int64_t)a3 style:(id)a4 yield:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  SLCollaborationAttributionView *v11;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a4;
  v11 = self;
  CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:)(a3, v10, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned UISSlotAnyContent) -> (@unowned ObjCBool), v9);

  swift_release();
}

- (void)remoteContentIsLoadedValueChanged
{
  void (*v2)(void);
  uint64_t v3;
  SLCollaborationAttributionView *v4;

  v4 = self;
  if (-[SLRemoteView remoteContentIsLoaded](v4, sel_remoteContentIsLoaded))
  {
    v2 = (void (*)(void))(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v4->super.super.super.super.super.isa)
                                              + 0xA0))();
    if (v2)
    {
      v3 = (uint64_t)v2;
      v2();
      outlined consume of (@escaping @callee_guaranteed () -> ())?(v3);
    }
  }

}

- (SLCollaborationAttributionView)initWithServiceProxyClass:(Class)a3 maxWidth:(double)a4
{
  SLCollaborationAttributionView *result;

  result = (SLCollaborationAttributionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SLCollaborationAttributionView)initWithFrame:(CGRect)a3
{
  SLCollaborationAttributionView *result;

  result = (SLCollaborationAttributionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak CollaborationAttributionViewDelegate?((uint64_t)self + OBJC_IVAR___SLCollaborationAttributionView_delegate);
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                                                                          + OBJC_IVAR___SLCollaborationAttributionView_remoteContentDidLoad));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SLCollaborationAttributionView_highlight));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration));
  swift_bridgeObjectRelease();
}

@end
