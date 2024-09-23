@implementation MilestoneConsistency

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A7C8;
  if (!qword_10012A7C8)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", MilestoneConsistency, CFSTR("MilestoneConsistency"), &unk_100126720, &off_1001267D8, 2, 24, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB574);
    qword_10012A7C8 = (uint64_t)v2;
  }
  return v2;
}

@end
