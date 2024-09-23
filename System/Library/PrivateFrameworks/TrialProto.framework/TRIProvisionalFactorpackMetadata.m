@implementation TRIProvisionalFactorpackMetadata

+ (id)descriptor
{
  id v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = (id)_MergedGlobals_12;
  if (!_MergedGlobals_12)
  {
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    if (!qword_1ECF0E690)
      qword_1ECF0E690 = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("TRI"), CFSTR("TRI"), 2);
    LODWORD(v8) = 0;
    v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, v8);
    if (_MergedGlobals_12)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TriprovisionalFactorPackMetadata.pbobjc.m"), 102, CFSTR("Startup recursed!"));
    _MergedGlobals_12 = (uint64_t)v2;
  }
  return v2;
}

@end
