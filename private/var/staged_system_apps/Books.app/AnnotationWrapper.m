@implementation AnnotationWrapper

- (int)annotationType
{
  return 2;
}

- (NSString)annotationLocation
{
  return (NSString *)sub_1001FE0E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationLocation);
}

- (void)setAnnotationLocation:(id)a3
{
  sub_1001FE144((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationLocation);
}

- (NSString)redactedAnnotationLocation
{
  NSString v2;
  uint64_t v3;
  _TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(NSString *)&self->annotationLocation[OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationLocation];
  if (v2)
  {
    v3 = *(uint64_t *)((char *)&self->super.isa
                    + OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationLocation);
    v4 = self;
    swift_bridgeObjectRetain(v2);
    String.redactedCFI.getter(v3, v2);
    v6 = v5;

    swift_bridgeObjectRelease(v2);
    v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
  }
  return (NSString *)v2;
}

- (NSString)annotationNote
{
  return (NSString *)sub_1001FE0E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationNote);
}

- (void)setAnnotationNote:(id)a3
{
  sub_1001FE144((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationNote);
}

- (NSString)annotationRepresentativeText
{
  return (NSString *)sub_1001FE0E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationRepresentativeText);
}

- (void)setAnnotationRepresentativeText:(id)a3
{
  sub_1001FE144((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationRepresentativeText);
}

- (NSString)annotationSelectedText
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->annotationLocation[OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationRepresentativeText];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->annotationLocation[OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationRepresentativeText]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)annotationUuid
{
  _TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  Swift::String v6;
  NSString v7;

  v2 = self;
  v3 = -[AnnotationWrapper description](v2, "description");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v5 = v4;

  v6._countAndFlagsBits = 1145656661;
  v6._object = (void *)0xE400000000000000;
  String.append(_:)(v6);

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return (NSString *)v7;
}

- (NSDate)annotationCreationDate
{
  return (NSDate *)sub_1001FE2A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationCreationDate);
}

- (void)setAnnotationCreationDate:(id)a3
{
  sub_1001FE390(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationCreationDate);
}

- (NSDate)annotationModificationDate
{
  return (NSDate *)sub_1001FE2A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationModificationDate);
}

- (void)setAnnotationModificationDate:(id)a3
{
  sub_1001FE390(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationModificationDate);
}

- (int)annotationStyle
{
  return 3;
}

- (BOOL)annotationIsUnderline
{
  return 0;
}

- (BOOL)annotationHasNote
{
  _TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper *v2;
  char v3;

  v2 = self;
  v3 = sub_1001FE4CC();

  return v3 & 1;
}

- (_TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper)init
{
  _TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper *result;

  result = (_TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper *)_swift_stdlib_reportUnimplementedInitializer("Books.AnnotationWrapper", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->annotationLocation[OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationLocation]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->annotationLocation[OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationNote]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->annotationLocation[OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationRepresentativeText]);
  sub_100010960((uint64_t)self + OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationCreationDate, &qword_1009D7440);
  sub_100010960((uint64_t)self+ OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationModificationDate, &qword_1009D7440);
}

@end
