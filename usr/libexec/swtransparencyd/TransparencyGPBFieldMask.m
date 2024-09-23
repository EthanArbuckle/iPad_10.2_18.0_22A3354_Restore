@implementation TransparencyGPBFieldMask

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_100131300;
  if (!qword_100131300)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBFieldMask, CFSTR("FieldMask"), off_100129BE0, &off_100129BC0, 1, 16, v3);
    qword_100131300 = (uint64_t)result;
  }
  return result;
}

@end
