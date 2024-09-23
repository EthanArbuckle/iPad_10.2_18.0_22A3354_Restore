@implementation ATLogInsertResponse

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10012A730;
  if (!qword_10012A730)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", ATLogInsertResponse, CFSTR("ATLogInsertResponse"), &unk_1001264E0, &off_1001264F8, 1, 8, v3);
    qword_10012A730 = (uint64_t)result;
  }
  return result;
}

@end
