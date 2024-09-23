@implementation CSHWProtoMessageKey

+ (id)descriptor
{
  id result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = (id)qword_1003893F8;
  if (!qword_1003893F8)
  {
    v3 = objc_opt_class(CSHWProtoMessageKey);
    v4 = objc_opt_class(CSHWProtoRoot);
    LODWORD(v5) = 12;
    result = +[GPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](GPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v3, v4, sub_10029C108(), &off_100388F98, 2, 24, v5);
    qword_1003893F8 = (uint64_t)result;
  }
  return result;
}

@end
