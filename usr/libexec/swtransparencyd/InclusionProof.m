@implementation InclusionProof

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A670;
  if (!qword_10012A670)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", InclusionProof, CFSTR("InclusionProof"), &unk_1001259B0, &off_100125DE8, 4, 40, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB3B3);
    qword_10012A670 = (uint64_t)v2;
  }
  return v2;
}

@end
