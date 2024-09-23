@implementation TransparencyGPBUInt32Value

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1001313D8;
  if (!qword_1001313D8)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBUInt32Value, CFSTR("UInt32Value"), off_10012A240, &off_10012A2D8, 1, 8, v3);
    qword_1001313D8 = (uint64_t)result;
  }
  return result;
}

@end
