@implementation TransparencyGPBValue

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_100131348;
  if (!qword_100131348)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBValue, CFSTR("Value"), off_100129D70, &off_100129D88, 6, 48, v4);
    objc_msgSend(v2, "setupOneofs:count:firstHasIndex:", off_100129E48, 1, 0xFFFFFFFFLL);
    qword_100131348 = (uint64_t)v2;
  }
  return v2;
}

@end
