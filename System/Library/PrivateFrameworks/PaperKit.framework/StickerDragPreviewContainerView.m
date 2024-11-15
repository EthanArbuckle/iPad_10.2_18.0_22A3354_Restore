@implementation StickerDragPreviewContainerView

- (_TtC8PaperKit31StickerDragPreviewContainerView)initWithCoder:(id)a3
{
  id v4;
  _TtC8PaperKit31StickerDragPreviewContainerView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit31StickerDragPreviewContainerView_isLifted) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit31StickerDragPreviewContainerView_meshView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit31StickerDragPreviewContainerView_transformView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit31StickerDragPreviewContainerView_shineView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit31StickerDragPreviewContainerView_shadowView) = 0;
  v4 = a3;

  result = (_TtC8PaperKit31StickerDragPreviewContainerView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)_preparePreviewContainerWithPreview:(id)a3 source:(id)a4 initialTransform:(CGAffineTransform *)a5
{
  id v7;
  id v8;
  _TtC8PaperKit31StickerDragPreviewContainerView *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  specialized StickerDragPreviewContainerView._preparePreviewContainer(preview:source:initialTransform:)(v7, v8);

}

- (void)_animateLiftAlongsideAnimator:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _TtC8PaperKit31StickerDragPreviewContainerView *v10;
  _QWORD v11[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = self;
  v8[3] = thunk for @escaping @callee_unowned @convention(block) () -> ()partial apply;
  v8[4] = v7;
  v11[4] = partial apply for closure #1 in StickerDragPreviewContainerView._animateLift(alongside:completion:);
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v11[3] = &block_descriptor_42;
  v9 = _Block_copy(v11);
  v10 = self;
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(a3, sel_addAnimations_, v9);
  _Block_release(v9);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)_animateLiftCancellationAlongsideAnimator:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _TtC8PaperKit31StickerDragPreviewContainerView *v10;
  _QWORD v11[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = self;
  v8[3] = thunk for @escaping @callee_unowned @convention(block) () -> ()partial apply;
  v8[4] = v7;
  v11[4] = partial apply for closure #1 in StickerDragPreviewContainerView._animateLiftCancellation(alongside:completion:);
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v11[3] = &block_descriptor_20;
  v9 = _Block_copy(v11);
  v10 = self;
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(a3, sel_addAnimations_, v9);
  _Block_release(v9);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)_animateDropAlongsideAnimator:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  _TtC8PaperKit31StickerDragPreviewContainerView *v7;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  swift_unknownObjectRetain();
  v7 = self;
  specialized StickerDragPreviewContainerView._animateDrop(alongside:completion:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) () -> (), v6);
  swift_unknownObjectRelease();

  swift_release();
}

- (_TtC8PaperKit31StickerDragPreviewContainerView)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit31StickerDragPreviewContainerView *result;

  result = (_TtC8PaperKit31StickerDragPreviewContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31StickerDragPreviewContainerView_meshView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31StickerDragPreviewContainerView_transformView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31StickerDragPreviewContainerView_shineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31StickerDragPreviewContainerView_shadowView));
}

@end
