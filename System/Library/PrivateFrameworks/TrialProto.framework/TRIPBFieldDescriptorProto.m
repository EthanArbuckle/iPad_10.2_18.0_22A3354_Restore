@implementation TRIPBFieldDescriptorProto

+ (id)descriptor
{
  id v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = (id)descriptor_descriptor_115;
  if (!descriptor_descriptor_115)
  {
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    LODWORD(v8) = 1;
    v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, TRIPBDescriptorRoot_FileDescriptor(), &descriptor_fields_116, 10, 72, v8);
    if (descriptor_descriptor_115)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIDescriptor.pbobjc.m"), 710, CFSTR("Startup recursed!"));
    descriptor_descriptor_115 = (uint64_t)v2;
  }
  return v2;
}

@end
