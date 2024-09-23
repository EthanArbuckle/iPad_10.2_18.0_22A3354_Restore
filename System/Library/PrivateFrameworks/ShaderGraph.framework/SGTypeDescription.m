@implementation SGTypeDescription

- (NSArray)properties
{
  Class isa;

  type metadata accessor for SGPropertyDescription();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (unsigned)size
{
  return (*(_DWORD **)((char *)&self->super.isa + OBJC_IVAR___SGTypeDescription_type))[14];
}

- (unsigned)alignment
{
  return (*(_DWORD **)((char *)&self->super.isa + OBJC_IVAR___SGTypeDescription_type))[15];
}

- (unsigned)offset
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SGTypeDescription_offset);
  swift_beginAccess();
  return *v2;
}

- (void)setOffset:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SGTypeDescription_offset);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)getMTLTextureType:(unint64_t *)a3
{
  return @objc SGTypeDescription.getMTLTextureType(_:)(self, (uint64_t)a2, (uint64_t *)a3, MetalDataType.MTLTextureType.getter);
}

- (BOOL)getMTLDataType:(unint64_t *)a3
{
  return @objc SGTypeDescription.getMTLTextureType(_:)(self, (uint64_t)a2, (uint64_t *)a3, MetalDataType.MTLDataType.getter);
}

- (BOOL)isEqual:(id)a3
{
  return @objc SGInput.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))SGTypeDescription.isEqual(_:));
}

+ (id)typeDescriptionRepresenting:(unint64_t)a3 error:(id *)a4
{
  return specialized static SGTypeDescription.create(_:)(a3);
}

- (NSString)description
{
  return (NSString *)@objc SGTypeDescription.description.getter(self, (uint64_t)a2, (void (*)(_QWORD *__return_ptr, void **, id))closure #1 in SGTypeDescription.description.getter);
}

- (SGTypeDescription)init
{
  SGTypeDescription *result;

  result = (SGTypeDescription *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

@end
