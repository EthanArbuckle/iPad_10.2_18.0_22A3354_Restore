@implementation TransparencyGPBField

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_100131380;
  if (!qword_100131380)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBField, CFSTR("Field"), off_100129F88, &off_100129FA0, 10, 64, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DFA18);
    qword_100131380 = (uint64_t)v2;
  }
  return v2;
}

@end
