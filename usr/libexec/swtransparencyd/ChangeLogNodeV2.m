@implementation ChangeLogNodeV2

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10012A680;
  if (!qword_10012A680)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", ChangeLogNodeV2, CFSTR("ChangeLogNodeV2"), &unk_1001259B0, &off_100125EA8, 1, 16, v3);
    qword_10012A680 = (uint64_t)result;
  }
  return result;
}

@end
