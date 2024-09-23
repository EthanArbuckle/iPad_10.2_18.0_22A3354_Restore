@implementation TRIPBValue

+ (id)descriptor
{
  id v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = (id)descriptor_descriptor_16;
  if (!descriptor_descriptor_16)
  {
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    LODWORD(v8) = 0;
    v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, TRIPBStructRoot_FileDescriptor(), &off_1ECF0E428, 6, 48, v8);
    objc_msgSend(v2, "setupOneofs:count:firstHasIndex:", _MergedGlobals_3, 1, 0xFFFFFFFFLL);
    if (descriptor_descriptor_16)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIStruct.pbobjc.m"), 225, CFSTR("Startup recursed!"));
    descriptor_descriptor_16 = (uint64_t)v2;
  }
  return v2;
}

@end
