@implementation LogClosedNode

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A6A8;
  if (!qword_10012A6A8)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", LogClosedNode, CFSTR("LogClosedNode"), &unk_1001259B0, &off_100125FA8, 2, 16, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB3E8);
    qword_10012A6A8 = (uint64_t)v2;
  }
  return v2;
}

@end
