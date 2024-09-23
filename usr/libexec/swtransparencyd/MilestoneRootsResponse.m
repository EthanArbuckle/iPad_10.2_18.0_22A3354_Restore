@implementation MilestoneRootsResponse

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A7C0;
  if (!qword_10012A7C0)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", MilestoneRootsResponse, CFSTR("MilestoneRootsResponse"), &unk_100126720, &off_100126738, 5, 40, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB568);
    qword_10012A7C0 = (uint64_t)v2;
  }
  return v2;
}

@end
