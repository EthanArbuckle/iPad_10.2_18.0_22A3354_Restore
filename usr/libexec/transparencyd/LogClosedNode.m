@implementation LogClosedNode

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A7620;
  if (!qword_1002A7620)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", LogClosedNode, CFSTR("LogClosedNode"), &unk_1002A2BE0, &off_1002A31D8, 2, 16, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100217298);
    qword_1002A7620 = (uint64_t)v2;
  }
  return v2;
}

@end
