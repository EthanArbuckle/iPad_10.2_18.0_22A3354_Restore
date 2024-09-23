@implementation TRIFile

+ (id)descriptor
{
  id v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = (id)descriptor_descriptor_32;
  if (!descriptor_descriptor_32)
  {
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    LODWORD(v8) = 0;
    v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, TRITrifactorTypesRoot_FileDescriptor(), descriptor_fields_33, 3, 24, v8);
    if (descriptor_descriptor_32)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TrifactorTypes.pbobjc.m"), 211, CFSTR("Startup recursed!"));
    descriptor_descriptor_32 = (uint64_t)v2;
  }
  return v2;
}

- (BOOL)requiresDownload
{
  void *v3;
  BOOL v4;

  if (!-[TRIFile isOnDemand](self, "isOnDemand"))
    return 0;
  -[TRIFile path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") == 0;

  return v4;
}

@end
