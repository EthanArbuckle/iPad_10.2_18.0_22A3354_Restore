@implementation ICTitleQuery

- (void)titleQuery:(id)a3 didUpdateWithItem:(id)a4
{
  id v6;
  id v7;
  _TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery *v8;
  NSString *v9;
  NSString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = -[PKTitleQuery transcribedTitle](v8, sel_transcribedTitle);
  if (v9)
  {
    v10 = v9;
    v11 = sub_1ACA420C0();
    v13 = v12;

  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  sub_1AC8F1218(v11, v13);

  swift_bridgeObjectRelease();
}

- (void)start
{
  _TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery *v2;

  v2 = self;
  sub_1AC8F1018();

}

- (_TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery)initWithDrawing:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v9;

  v4 = sub_1ACA41FD0();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a3;
  sub_1ACA41FC4();

  return (_TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery *)sub_1AC8F1648((uint64_t)v6);
}

- (_TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery)init
{
  objc_class *ObjectType;
  char *v4;
  uint64_t v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery_drawingUUID) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery_continuation;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC9FED8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery_resumed) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery_timer) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[ICTitleQuery init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_1AC7C3AB0((uint64_t)self + OBJC_IVAR____TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery_continuation, (uint64_t *)&unk_1EEC9FF40);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery_timer));
}

@end
