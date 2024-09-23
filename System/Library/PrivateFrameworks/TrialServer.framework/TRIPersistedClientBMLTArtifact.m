@implementation TRIPersistedClientBMLTArtifact

+ (id)descriptor
{
  void *v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = (void *)_MergedGlobals_35;
  if (!_MergedGlobals_35)
  {
    v5 = (void *)MEMORY[0x1E0DC0F30];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    if (!qword_1EFC74218)
      qword_1EFC74218 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0F40]), "initWithPackage:objcPrefix:syntax:", CFSTR("TRI"), CFSTR("TRI"), 2);
    LODWORD(v9) = 0;
    v2 = (void *)objc_msgSend(v5, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v6, v7, v9);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1D21DA0DA);
    if (_MergedGlobals_35)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TripersistedClientBmltartifact.pbobjc.m"), 132, CFSTR("Startup recursed!"));
    _MergedGlobals_35 = (uint64_t)v2;
  }
  return v2;
}

@end
