@implementation TransparencyGPBType

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008AB40;
  if (!qword_10008AB40)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBType, CFSTR("Type"), off_100089D28, &off_100089C68, 6, 48, v3);
    qword_10008AB40 = (uint64_t)result;
  }
  return result;
}

@end
