@implementation TRIUIAssignment

+ (id)descriptor
{
  id v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = (id)descriptor_descriptor_52_0;
  if (!descriptor_descriptor_52_0)
  {
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    LODWORD(v8) = 0;
    v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, TRIUiassignmentRoot_FileDescriptor(), &off_1ECF0E4F0, 4, 32, v8);
    objc_msgSend(v2, "setupOneofs:count:firstHasIndex:", _MergedGlobals_4, 1, 0xFFFFFFFFLL);
    if (descriptor_descriptor_52_0)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("Uiassignment.pbobjc.m"), 483, CFSTR("Startup recursed!"));
    descriptor_descriptor_52_0 = (uint64_t)v2;
  }
  return v2;
}

@end
