@implementation TransparencyGPBFieldMask

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A7368;
  if (!qword_1002A7368)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBFieldMask, CFSTR("FieldMask"), off_1002A1568, &off_1002A1548, 1, 16, v3);
    qword_1002A7368 = (uint64_t)result;
  }
  return result;
}

@end
