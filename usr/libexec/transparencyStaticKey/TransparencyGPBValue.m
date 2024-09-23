@implementation TransparencyGPBValue

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10008AC08;
  if (!qword_10008AC08)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBValue, CFSTR("Value"), off_10008A780, &off_10008A798, 6, 48, v4);
    objc_msgSend(v2, "setupOneofs:count:firstHasIndex:", off_10008A858, 1, 0xFFFFFFFFLL);
    qword_10008AC08 = (uint64_t)v2;
  }
  return v2;
}

@end
