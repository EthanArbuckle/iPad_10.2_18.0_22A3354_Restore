@implementation BEAnnotation

- (NSString)cfi
{
  return (NSString *)sub_112360((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEAnnotation_cfi);
}

- (void)setCfi:(id)a3
{
  sub_1123EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BEAnnotation_cfi);
}

- (NSArray)rects
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___BEAnnotation_rects);
  swift_beginAccess((char *)self + OBJC_IVAR___BEAnnotation_rects, v6, 0, 0);
  v3 = *v2;
  type metadata accessor for CGRect(0);
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setRects:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9[24];

  type metadata accessor for CGRect(0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___BEAnnotation_rects);
  swift_beginAccess(v7, v9, 1, 0);
  v8 = *v7;
  *v7 = v6;
  swift_bridgeObjectRelease(v8);
}

- (NSString)content
{
  return (NSString *)sub_112360((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEAnnotation_content);
}

- (void)setContent:(id)a3
{
  sub_1123EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BEAnnotation_content);
}

- (BEAnnotation)init
{
  BEAnnotation *result;

  result = (BEAnnotation *)_swift_stdlib_reportUnimplementedInitializer("AEBookPlugins.Annotation", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  swift_bridgeObjectRelease(*(_QWORD *)&self->cfi[OBJC_IVAR___BEAnnotation_cfi]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BEAnnotation_rects));
  swift_bridgeObjectRelease(*(_QWORD *)&self->cfi[OBJC_IVAR___BEAnnotation_content]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->cfi[OBJC_IVAR___BEAnnotation_representativeContent]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->cfi[OBJC_IVAR___BEAnnotation_note]);
  v3 = (char *)self + OBJC_IVAR___BEAnnotation_creationDate;
  v4 = type metadata accessor for Date(0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___BEAnnotation_modificationDate, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->cfi[OBJC_IVAR___BEAnnotation_uuid]);
}

- (NSString)description
{
  return (NSString *)sub_10F870(self, (uint64_t)a2, (void (*)(void))Annotation.description.getter);
}

- (NSString)debugDescription
{
  return (NSString *)sub_10F870(self, (uint64_t)a2, (void (*)(void))Annotation.debugDescription.getter);
}

@end
