@implementation CRLCommandSetMovieValue

+ (id)movieSetValueCommandWithMovie:(id)a3 property:(unint64_t)a4 boxedValue:(id)a5
{
  char *v7;
  id v8;

  v7 = (char *)a3;
  swift_unknownObjectRetain(a5);
  v8 = sub_1008A1B30(v7, a4, a5);

  swift_unknownObjectRelease(a5);
  return v8;
}

- (_TtC8Freeform23CRLCommandSetMovieValue)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLCommandSetMovieValue();
  return -[CRLCommand init](&v3, "init");
}

@end
