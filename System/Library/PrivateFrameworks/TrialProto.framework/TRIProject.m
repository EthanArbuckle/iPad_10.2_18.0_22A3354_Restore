@implementation TRIProject

+ (id)descriptor
{
  id v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = (id)_MergedGlobals_14;
  if (!_MergedGlobals_14)
  {
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    if (!qword_1ECF0E6B0)
      qword_1ECF0E6B0 = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("TRI"), CFSTR("TRI"), 2);
    LODWORD(v8) = 0;
    v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, v8);
    if (_MergedGlobals_14)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TriprojectId.pbobjc.m"), 70, CFSTR("Startup recursed!"));
    _MergedGlobals_14 = (uint64_t)v2;
  }
  return v2;
}

+ (id)projectNameFromId:(unsigned int)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  void *v9;

  LODWORD(v3) = a3;
  if (TRIProject_ProjectId_IsValidValue(a3))
    v3 = v3;
  else
    v3 = 0;
  TRIProject_ProjectId_EnumDescriptor();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textFormatNameForValue:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIProject+TRI.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

  }
  return v7;
}

+ (int)projectIdFromName:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v7;

  v7 = 0;
  v3 = a3;
  TRIProject_ProjectId_EnumDescriptor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getValue:forEnumTextFormatName:", &v7, v3);

  if (v5)
    return v7;
  else
    return 0;
}

@end
