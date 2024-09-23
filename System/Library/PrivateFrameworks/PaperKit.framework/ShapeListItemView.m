@implementation ShapeListItemView

- (_TtC8PaperKit17ShapeListItemView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8PaperKit17ShapeListItemView *result;

  v5 = OBJC_IVAR____TtC8PaperKit17ShapeListItemView_imageView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3890]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit17ShapeListItemView_cornerRadius) = (Class)0x4018000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit17ShapeListItemView_symbolPointSize) = (Class)0x403E000000000000;

  result = (_TtC8PaperKit17ShapeListItemView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShapeListItemView();
  return -[ShapeListItemView isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ShapeListItemView();
  v4 = v5.receiver;
  -[ShapeListItemView setHighlighted:](&v5, sel_setHighlighted_, v3);
  ShapeListItemView.updateUI()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ShapeListItemView();
  v4 = a3;
  v5 = v6.receiver;
  -[ShapeListItemView traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  ShapeListItemView.updateUI()();

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v9;
  id v10;
  id v11;
  _TtC8PaperKit17ShapeListItemView *v12;
  void *v13;

  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIPointerRegion);
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  -[ShapeListItemView bounds](v12, sel_bounds);
  v13 = (void *)UIPointerRegion.init(rect:identifier:)();

  return v13;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  id v21;
  id v22;
  _TtC8PaperKit17ShapeListItemView *v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UIPointerShape?);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for UIPointerEffect();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v13);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16, v17);
  v19 = (uint64_t *)((char *)&v27 - v18);
  v20 = objc_allocWithZone(MEMORY[0x1E0DC3D90]);
  v21 = a3;
  v22 = a4;
  v23 = self;
  *v19 = objc_msgSend(v20, sel_initWithView_, v23);
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v12 + 104))(v19, *MEMORY[0x1E0DC1E30], v11);
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIPointerStyle);
  (*(void (**)(char *, _QWORD *, uint64_t))(v12 + 16))(v15, v19, v11);
  v24 = type metadata accessor for UIPointerShape();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v10, 1, 1, v24);
  v25 = (void *)UIPointerStyle.init(effect:shape:)();
  (*(void (**)(_QWORD *, uint64_t))(v12 + 8))(v19, v11);

  return v25;
}

- (_TtC8PaperKit17ShapeListItemView)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit17ShapeListItemView *result;

  result = (_TtC8PaperKit17ShapeListItemView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit17ShapeListItemView_imageView));
}

@end
