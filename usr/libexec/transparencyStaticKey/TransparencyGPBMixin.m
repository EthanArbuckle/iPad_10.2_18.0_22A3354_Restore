@implementation TransparencyGPBMixin

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10008AB90;
  if (!qword_10008AB90)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBMixin, CFSTR("Mixin"), off_10008A220, &off_10008A318, 2, 24, v3);
    qword_10008AB90 = (uint64_t)result;
  }
  return result;
}

@end
