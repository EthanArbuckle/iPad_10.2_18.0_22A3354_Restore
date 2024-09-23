@implementation PGUpNextComputer

- (_TtC11PhotosGraph16PGUpNextComputer)initWithTargets:(id)a3
{
  objc_class *ObjectType;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED872388);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph16PGUpNextComputer_targets) = (Class)sub_1CA85B7B0();
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[PGUpNextComputer init](&v6, sel_init);
}

- (BOOL)enumerateSuggestionsWith:(id)a3 featureWeightVectors:(id)a4 error:(id *)a5 block:(id)a6
{
  void *v9;
  _TtC11PhotosGraph16PGUpNextComputer *v10;

  v9 = _Block_copy(a6);
  if (a4)
  {
    sub_1CA2FDBAC();
    a4 = (id)sub_1CA85B7B0();
  }
  _Block_copy(v9);
  swift_unknownObjectRetain();
  v10 = self;
  sub_1CA2FD940((uint64_t)a3, (unint64_t)a4, (int)v10, (unint64_t)v9);
  _Block_release(v9);

  swift_unknownObjectRelease();
  _Block_release(v9);
  swift_bridgeObjectRelease();
  return 1;
}

- (_TtC11PhotosGraph16PGUpNextComputer)init
{
  _TtC11PhotosGraph16PGUpNextComputer *result;

  result = (_TtC11PhotosGraph16PGUpNextComputer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
