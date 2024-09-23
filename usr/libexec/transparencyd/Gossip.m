@implementation Gossip

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A7550;
  if (!qword_1002A7550)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", Gossip, CFSTR("Gossip"), &unk_1002A2B68, &off_1002A2B28, 2, 16, v3);
    qword_1002A7550 = (uint64_t)result;
  }
  return result;
}

@end
