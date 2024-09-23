@implementation TransparencyGPBMethod

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_100131408;
  if (!qword_100131408)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBMethod, CFSTR("Method"), off_10012A490, &off_10012A4A8, 7, 40, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DFAC0);
    qword_100131408 = (uint64_t)v2;
  }
  return v2;
}

@end
