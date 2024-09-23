@implementation TRIPersistedAllocationCommon

+ (id)descriptor
{
  void *v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = (void *)descriptor_descriptor_12;
  if (!descriptor_descriptor_12)
  {
    v5 = (void *)MEMORY[0x1E0DC0F30];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    LODWORD(v9) = 0;
    v2 = (void *)objc_msgSend(v5, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v6, v7, TRITripersistedAllocationStatusRoot_FileDescriptor(), &descriptor_fields_13, 2, 16, v9);
    if (descriptor_descriptor_12)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TripersistedAllocationStatus.pbobjc.m"), 135, CFSTR("Startup recursed!"));
    descriptor_descriptor_12 = (uint64_t)v2;
  }
  return v2;
}

@end
