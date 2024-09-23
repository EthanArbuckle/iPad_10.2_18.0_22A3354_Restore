@implementation RevisionLogInclusionProofRequest

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A6D0;
  if (!qword_10012A6D0)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", RevisionLogInclusionProofRequest, CFSTR("RevisionLogInclusionProofRequest"), &unk_100126088, &off_1001261C0, 4, 24, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB41D);
    qword_10012A6D0 = (uint64_t)v2;
  }
  return v2;
}

@end
