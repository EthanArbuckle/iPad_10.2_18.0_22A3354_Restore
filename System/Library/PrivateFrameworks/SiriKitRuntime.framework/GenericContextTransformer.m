@implementation GenericContextTransformer

- (_TtC14SiriKitRuntime25GenericContextTransformer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GenericContextTransformer();
  return -[GenericContextTransformer init](&v3, sel_init);
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
  _QWORD *v9;
  void (*v10)(_QWORD *, id, id);
  id v11;
  _TtC14SiriKitRuntime25GenericContextTransformer *v12;

  v9 = _Block_copy(a6);
  v10 = (void (*)(_QWORD *, id, id))v9[2];
  swift_unknownObjectRetain();
  v11 = a4;
  v12 = self;
  v10(v9, a3, v11);
  _Block_release(v9);
  swift_unknownObjectRelease();

}

@end
