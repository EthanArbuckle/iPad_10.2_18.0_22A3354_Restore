@implementation ATLogProofRequest

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10012A738;
  if (!qword_10012A738)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", ATLogProofRequest, CFSTR("ATLogProofRequest"), &unk_1001264E0, &off_100126518, 2, 16, v3);
    qword_10012A738 = (uint64_t)result;
  }
  return result;
}

@end
