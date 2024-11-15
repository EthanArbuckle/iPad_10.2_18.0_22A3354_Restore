@implementation SGOutput

- (unint64_t)type
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___SGOutput_type);
  swift_beginAccess();
  return *v2;
}

- (void)setType:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR___SGOutput_type);
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)name
{
  return (NSString *)@objc SGInput.name.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SGOutput_name);
}

+ (id)outputWithName:(id)a3 type:(unint64_t)a4
{
  return @objc static SGInput.create(name:type:)((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))specialized static SGOutput.create(name:type:));
}

- (NSString)description
{
  return (NSString *)@objc SGEdge.debugDescription.getter(self, (uint64_t)a2, SGOutput.description.getter);
}

- (BOOL)isEqual:(id)a3
{
  return @objc SGInput.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))SGOutput.isEqual(_:));
}

- (SGOutput)init
{
  SGOutput *result;

  result = (SGOutput *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectWeakDestroy();
}

@end
