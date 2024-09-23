@implementation SGPropertyDescription

- (NSString)name
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SGPropertyDescription_name);
  v3 = *(_QWORD *)&self->name[OBJC_IVAR___SGPropertyDescription_name];
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x24954AF98](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (SGTypeDescription)type
{
  return (SGTypeDescription *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR___SGPropertyDescription_type));
}

- (BOOL)visible
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___SGPropertyDescription_visible);
}

+ (id)create:(id)a3 type:(id)a4
{
  objc_class *ObjCClassMetadata;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t *v10;
  id v11;
  objc_super v13;

  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = objc_allocWithZone(ObjCClassMetadata);
  v10 = (uint64_t *)&v9[OBJC_IVAR___SGPropertyDescription_name];
  *v10 = v6;
  v10[1] = v8;
  *(_QWORD *)&v9[OBJC_IVAR___SGPropertyDescription_type] = a4;
  v9[OBJC_IVAR___SGPropertyDescription_visible] = 1;
  v13.receiver = v9;
  v13.super_class = ObjCClassMetadata;
  v11 = a4;
  return objc_msgSendSuper2(&v13, sel_init);
}

- (NSString)description
{
  return (NSString *)@objc SGTypeDescription.description.getter(self, (uint64_t)a2, (void (*)(_QWORD *__return_ptr, void **, id))closure #1 in SGPropertyDescription.description.getter);
}

- (SGPropertyDescription)init
{
  SGPropertyDescription *result;

  result = (SGPropertyDescription *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

- (BOOL)isEqual:(id)a3
{
  return @objc SGInput.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))SGPropertyDescription.isEqual(_:));
}

@end
