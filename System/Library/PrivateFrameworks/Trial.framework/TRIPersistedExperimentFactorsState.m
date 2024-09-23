@implementation TRIPersistedExperimentFactorsState

+ (id)descriptor
{
  void *v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = (void *)descriptor_descriptor_25;
  if (!descriptor_descriptor_25)
  {
    v5 = (void *)MEMORY[0x1E0DC0F30];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    LODWORD(v9) = 0;
    v2 = (void *)objc_msgSend(v5, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v6, v7, TRITripersistedEvaluationStatusRoot_FileDescriptor(), &descriptor_fields_26, 3, 24, v9);
    if (descriptor_descriptor_25)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TripersistedEvaluationStatus.pbobjc.m"), 180, CFSTR("Startup recursed!"));
    descriptor_descriptor_25 = (uint64_t)v2;
  }
  return v2;
}

@end
