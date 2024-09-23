@implementation CRLImmutableBoard

- (_TtC8Freeform17CRLImmutableBoard)initWithBoard:(id)a3
{
  return (_TtC8Freeform17CRLImmutableBoard *)sub_100B24950((char *)a3);
}

+ (id)copyInMemoryBoardWithoutRemappingWithBoard:(id)a3 error:(id *)a4
{
  id v4;
  char *v5;

  v4 = a3;
  v5 = sub_100B2C820(v4);

  return v5;
}

- (id)qa_drawingDataAndReturnError:(id *)a3
{
  _TtC8Freeform17CRLImmutableBoard *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  Class isa;

  v3 = self;
  v4 = sub_100B24BA0();
  v6 = v5;

  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_1004BBBC8((uint64_t)v4, v6);
  return isa;
}

@end
