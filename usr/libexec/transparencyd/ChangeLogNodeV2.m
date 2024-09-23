@implementation ChangeLogNodeV2

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A75F8;
  if (!qword_1002A75F8)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", ChangeLogNodeV2, CFSTR("ChangeLogNodeV2"), &unk_1002A2BE0, &off_1002A30D8, 1, 16, v3);
    qword_1002A75F8 = (uint64_t)result;
  }
  return result;
}

@end
