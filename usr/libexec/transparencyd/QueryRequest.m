@implementation QueryRequest

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A76B8;
  if (!qword_1002A76B8)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", QueryRequest, CFSTR("QueryRequest"), &unk_1002A3550, &off_1002A34D0, 4, 32, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1002172A8);
    qword_1002A76B8 = (uint64_t)v2;
  }
  return v2;
}

@end
