@implementation MilestoneRootsRequest

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A7B8;
  if (!qword_10012A7B8)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", MilestoneRootsRequest, CFSTR("MilestoneRootsRequest"), &unk_100126720, &off_1001266C0, 3, 24, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB560);
    qword_10012A7B8 = (uint64_t)v2;
  }
  return v2;
}

@end
