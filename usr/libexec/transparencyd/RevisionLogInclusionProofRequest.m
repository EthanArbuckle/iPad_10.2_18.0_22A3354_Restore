@implementation RevisionLogInclusionProofRequest

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A7530;
  if (!qword_1002A7530)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", RevisionLogInclusionProofRequest, CFSTR("RevisionLogInclusionProofRequest"), &unk_1002A2750, &off_1002A2888, 4, 24, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100216EA5);
    qword_1002A7530 = (uint64_t)v2;
  }
  return v2;
}

@end
