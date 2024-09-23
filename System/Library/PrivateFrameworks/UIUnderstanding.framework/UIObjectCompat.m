@implementation UIObjectCompat

- (NSUUID)id
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_24972C960();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___UIObjectCompat_id;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_24972C93C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v8;
}

- (void)setId:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  void (*v9)(char *, char *, uint64_t);
  UIObjectCompat *v10;
  uint64_t v11;

  v4 = sub_24972C960();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24972C948();
  v8 = (char *)self + OBJC_IVAR___UIObjectCompat_id;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();

}

- (_TtC15UIUnderstanding11UIDetection)detection
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___UIObjectCompat_detection);
  swift_beginAccess();
  return (_TtC15UIUnderstanding11UIDetection *)*v2;
}

- (void)setDetection:(id)a3
{
  sub_2496F4954((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___UIObjectCompat_detection);
}

- (_TtC15UIUnderstanding11BoundingBox)boundingBox
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___UIObjectCompat_boundingBox);
  swift_beginAccess();
  return (_TtC15UIUnderstanding11BoundingBox *)*v2;
}

- (void)setBoundingBox:(id)a3
{
  sub_2496F4954((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___UIObjectCompat_boundingBox);
}

- (_TtC15UIUnderstanding13IconDetection)iconDetection
{
  return (_TtC15UIUnderstanding13IconDetection *)sub_2496F4E38((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___UIObjectCompat_iconDetection);
}

- (void)setIconDetection:(id)a3
{
  sub_2496F4954((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___UIObjectCompat_iconDetection);
}

- (NSArray)children
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for UIObject();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24972CCCC();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setChildren:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for UIObject();
  v4 = sub_24972CCD8();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___UIObjectCompat_children);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC15UIUnderstanding21ClickabilityDetection)clickDetection
{
  return (_TtC15UIUnderstanding21ClickabilityDetection *)sub_2496F4E38((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___UIObjectCompat_clickDetection);
}

- (void)setClickDetection:(id)a3
{
  sub_2496F4954((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___UIObjectCompat_clickDetection);
}

- (_TtC15UIUnderstanding14FocusDetection)focusDetection
{
  return (_TtC15UIUnderstanding14FocusDetection *)sub_2496F4E38((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___UIObjectCompat_focusDetection);
}

- (void)setFocusDetection:(id)a3
{
  sub_2496F4954((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___UIObjectCompat_focusDetection);
}

- (UIObjectCompat)initWithDetection:(id)a3 clickable:(id)a4 focused:(id)a5 icon:(id)a6 boundingBox:(id)a7 children:(id)a8
{
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  UIObjectCompat *v19;

  type metadata accessor for UIObject();
  v13 = sub_24972CCD8();
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (UIObjectCompat *)sub_2496F8648(v14, a4, a5, a6, v18, v13);

  return v19;
}

- (UIObjectCompat)initWithLabel:(int64_t)a3 confidence:(double)a4 text:(id)a5 boundingBox:(id)a6 children:(id)a7 clickable:(BOOL)a8 focused:(BOOL)a9
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a5)
  {
    v14 = sub_24972CBB8();
    v16 = v15;
  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  type metadata accessor for UIObject();
  v17 = sub_24972CCD8();
  return (UIObjectCompat *)UIObject.init(label:confidence:text:boundingBox:children:clickable:focused:)(a3, v14, v16, a6, a4, v17, a8, a9);
}

- (NSString)description
{
  UIObjectCompat *v2;
  void *v3;

  v2 = self;
  sub_2496F654C();

  v3 = (void *)sub_24972CB94();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (UIObjectCompat)init
{
  UIObjectCompat *result;

  result = (UIObjectCompat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___UIObjectCompat_id;
  v4 = sub_24972C960();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end
