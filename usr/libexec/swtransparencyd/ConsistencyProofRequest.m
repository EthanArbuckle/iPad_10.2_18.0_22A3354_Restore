@implementation ConsistencyProofRequest

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A6B0;
  if (!qword_10012A6B0)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", ConsistencyProofRequest, CFSTR("ConsistencyProofRequest"), &unk_100126088, &off_100125FE8, 5, 32, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB3F0);
    qword_10012A6B0 = (uint64_t)v2;
  }
  return v2;
}

@end
