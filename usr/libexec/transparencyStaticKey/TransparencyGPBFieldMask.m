@implementation TransparencyGPBFieldMask

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008AA38;
  if (!qword_10008AA38)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBFieldMask, CFSTR("FieldMask"), off_100089698, &off_100089678, 1, 16, v3);
    qword_10008AA38 = (uint64_t)result;
  }
  return result;
}

@end
