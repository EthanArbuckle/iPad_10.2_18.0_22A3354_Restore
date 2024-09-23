@implementation TransparencyGPBValue

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A73B0;
  if (!qword_1002A73B0)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBValue, CFSTR("Value"), off_1002A16F8, &off_1002A1710, 6, 48, v4);
    objc_msgSend(v2, "setupOneofs:count:firstHasIndex:", off_1002A17D0, 1, 0xFFFFFFFFLL);
    qword_1002A73B0 = (uint64_t)v2;
  }
  return v2;
}

@end
