@implementation SFXPCInvocation

- (SFXPCInvocation)init
{
  objc_class *ObjCClassFromMetadata;
  SFXPCInvocation *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  objc_super v11;

  swift_getObjectType();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v4 = self;
  v5 = NSStringFromClass(ObjCClassFromMetadata);
  v6 = sub_1A2AE343C();
  v8 = v7;

  v9 = (uint64_t *)((char *)v4 + OBJC_IVAR___SFXPCInvocation_name);
  *v9 = v6;
  v9[1] = v8;

  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for SFXPCInvocation();
  return -[SFXPCInvocation init](&v11, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFXPCInvocation)initWithCoder:(id)a3
{
  id v3;
  SFXPCInvocation *v4;

  v3 = a3;
  v4 = (SFXPCInvocation *)sub_1A2A00984(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SFXPCInvocation *v5;
  void *v6;
  id v7;

  if (*(_QWORD *)&self->name[OBJC_IVAR___SFXPCInvocation_name])
  {
    v4 = a3;
    v5 = self;
    v6 = (void *)sub_1A2AE340C();
    v7 = (id)sub_1A2AE340C();
    objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);

  }
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
