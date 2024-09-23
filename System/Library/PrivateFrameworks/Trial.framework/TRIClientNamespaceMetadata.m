@implementation TRIClientNamespaceMetadata

+ (id)descriptor
{
  void *v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = (void *)_MergedGlobals_16;
  if (!_MergedGlobals_16)
  {
    v5 = (void *)MEMORY[0x1E0DC0F30];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    if (!qword_1ECED7ED0)
      qword_1ECED7ED0 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0F40]), "initWithPackage:objcPrefix:syntax:", CFSTR("TRI"), CFSTR("TRI"), 2);
    LODWORD(v9) = 0;
    v2 = (void *)objc_msgSend(v5, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v6, v7, v9);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_19B917860);
    if (_MergedGlobals_16)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TriclientNamespaceMetadata.pbobjc.m"), 98, CFSTR("Startup recursed!"));
    _MergedGlobals_16 = (uint64_t)v2;
  }
  return v2;
}

@end
