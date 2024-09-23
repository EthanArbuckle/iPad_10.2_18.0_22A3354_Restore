@implementation TransparencyGPBField

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A73E8;
  if (!qword_1002A73E8)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBField, CFSTR("Field"), off_1002A1910, &off_1002A1928, 10, 64, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100216D28);
    qword_1002A73E8 = (uint64_t)v2;
  }
  return v2;
}

@end
