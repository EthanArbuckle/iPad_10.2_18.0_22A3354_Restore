@implementation TRIPBServiceOptions

+ (id)descriptor
{
  id v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = (id)descriptor_descriptor_333;
  if (!descriptor_descriptor_333)
  {
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    LODWORD(v8) = 0;
    v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, TRIPBDescriptorRoot_FileDescriptor(), &descriptor_fields_334, 2, 16, v8);
    objc_msgSend(v2, "setupExtensionRanges:count:", &descriptor_ranges_336, 1);
    if (descriptor_descriptor_333)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIDescriptor.pbobjc.m"), 2062, CFSTR("Startup recursed!"));
    descriptor_descriptor_333 = (uint64_t)v2;
  }
  return v2;
}

@end
