@implementation VRFWitness

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_10012A630;
  if (!qword_10012A630)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", VRFWitness, CFSTR("VRFWitness"), &unk_1001259B0, &off_100125950, 3, 24, v3);
    qword_10012A630 = (uint64_t)result;
  }
  return result;
}

@end
