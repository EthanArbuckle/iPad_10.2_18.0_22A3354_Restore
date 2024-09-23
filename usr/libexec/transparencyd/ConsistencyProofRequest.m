@implementation ConsistencyProofRequest

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A7510;
  if (!qword_1002A7510)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", ConsistencyProofRequest, CFSTR("ConsistencyProofRequest"), &unk_1002A2750, &off_1002A26B0, 5, 32, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100216E78);
    qword_1002A7510 = (uint64_t)v2;
  }
  return v2;
}

@end
