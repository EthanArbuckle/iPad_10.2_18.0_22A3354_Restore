@implementation _UITextViewAnimatedPlaceholderSupport

- (UITextView)textView
{
  return (UITextView *)(id)MEMORY[0x186DCA138]((char *)self+ OBJC_IVAR____UITextViewAnimatedPlaceholderSupport_textView, a2);
}

- (void)setTextView:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (_UITextViewAnimatedPlaceholderSupport)initWithTextView:(id)a3
{
  return (_UITextViewAnimatedPlaceholderSupport *)sub_1855E24F8(a3);
}

- (id)insertLoadingPlaceholderAtLocation:(id)a3 lines:(double)a4
{
  id v6;
  _UITextViewAnimatedPlaceholderSupport *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_1855E2628((uint64_t)v6, a4);

  return v8;
}

- (void)replacePlaceholder:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  _UITextViewAnimatedPlaceholderSupport *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1855E2D30(v6, v7);

}

- (void)removePlaceholder:(id)a3
{
  id v4;
  _UITextViewAnimatedPlaceholderSupport *v5;

  v4 = a3;
  v5 = self;
  sub_1855E2FB8(v4);

}

- (void)layoutManagedSubviews
{
  UITextView *v2;
  UITextView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _UITextViewAnimatedPlaceholderSupport *v8;
  _UITextViewAnimatedPlaceholderSupport *v9;
  _UITextViewAnimatedPlaceholderSupport *v10;

  v10 = self;
  v2 = -[_UITextViewAnimatedPlaceholderSupport textView](v10, sel_textView);
  if (v2)
  {
    v3 = v2;
    -[UIView bounds](v2, sel_bounds);
    v5 = v4;
    v7 = v6;
    v8 = (_UITextViewAnimatedPlaceholderSupport *)sub_1855E2364();
    -[_UITextViewAnimatedPlaceholderSupport setFrame:](v8, sel_setFrame_, 0.0, 0.0, v5, v7);

    v9 = v8;
  }
  else
  {
    v9 = v10;
  }

}

- (_UITextViewAnimatedPlaceholderSupport)init
{
  _UITextViewAnimatedPlaceholderSupport *result;

  result = (_UITextViewAnimatedPlaceholderSupport *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____UITextViewAnimatedPlaceholderSupport____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____UITextViewAnimatedPlaceholderSupport____lazy_storage___textEffectsView));
  swift_bridgeObjectRelease();
}

- (void)targetedPreviewFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC5UIKit21UITextEffectTextChunk *v15;
  _UITextViewAnimatedPlaceholderSupport *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDD85D98);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_186507774();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EDD85DD0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EDD85DD8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_185763474((uint64_t)v9, (uint64_t)&unk_1EDD85DE0, (uint64_t)v14);
  swift_release();
}

- (void)updateTextChunkVisibilityForAnimation:(_TtC5UIKit21UITextEffectTextChunk *)a3 visible:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC5UIKit21UITextEffectTextChunk *v17;
  _UITextViewAnimatedPlaceholderSupport *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDD85D98);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = sub_186507774();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EDD85DA8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EDD85DB0;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_185763474((uint64_t)v11, (uint64_t)&unk_1EDD85DB8, (uint64_t)v16);
  swift_release();
}

@end
