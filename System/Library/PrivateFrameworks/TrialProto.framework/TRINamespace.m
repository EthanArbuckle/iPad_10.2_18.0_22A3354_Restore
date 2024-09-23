@implementation TRINamespace

+ (id)descriptor
{
  id v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = (id)descriptor_descriptor_7;
  if (!descriptor_descriptor_7)
  {
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    LODWORD(v8) = 0;
    v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, TRITrinamespaceRoot_FileDescriptor(), 0, 0, 4, v8);
    if (descriptor_descriptor_7)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("Trinamespace.pbobjc.m"), 70, CFSTR("Startup recursed!"));
    descriptor_descriptor_7 = (uint64_t)v2;
  }
  return v2;
}

+ (id)namespaceNameFromId:(unsigned int)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  void *v9;

  LODWORD(v3) = a3;
  if (TRINamespace_NamespaceId_IsValidValue(a3))
    v3 = v3;
  else
    v3 = 0;
  TRINamespace_NamespaceId_EnumDescriptor();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textFormatNameForValue:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRINamespace+TRI.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

  }
  return v7;
}

+ (int)namespaceIdFromName:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v7;

  v7 = 0;
  v3 = a3;
  TRINamespace_NamespaceId_EnumDescriptor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getValue:forEnumTextFormatName:", &v7, v3);

  if (v5)
    return v7;
  else
    return 0;
}

@end
