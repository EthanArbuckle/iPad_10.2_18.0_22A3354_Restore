@implementation TRIFactor

+ (id)descriptor
{
  id v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = (id)descriptor_descriptor_1;
  if (!descriptor_descriptor_1)
  {
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    LODWORD(v8) = 0;
    v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, TRITrifactorRoot_FileDescriptor(), &descriptor_fields_2, 7, 56, v8);
    if (descriptor_descriptor_1)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("Trifactor.pbobjc.m"), 152, CFSTR("Startup recursed!"));
    descriptor_descriptor_1 = (uint64_t)v2;
  }
  return v2;
}

- (BOOL)isInNamespaceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[TRIFactor namespaceString](self, "namespaceString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "isEqualToString:", v4);
  else
    v7 = 0;

  return v7;
}

- (id)namespaceString
{
  void *v3;

  if (-[TRIFactor hasNamespaceName](self, "hasNamespaceName"))
  {
    -[TRIFactor namespaceName](self, "namespaceName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[TRIFactor hasNamespaceId](self, "hasNamespaceId"))
  {
    +[TRINamespace namespaceNameFromId:](TRINamespace, "namespaceNameFromId:", -[TRIFactor namespaceId](self, "namespaceId"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)typeString
{
  int v3;
  int v4;
  __CFString *v5;

  if (-[TRIFactor hasType](self, "hasType"))
  {
    v3 = -[TRIFactor type](self, "type");
    v4 = v3;
    if (v3 > 99)
    {
      switch(v3)
      {
        case 'd':
          v5 = CFSTR("file");
          break;
        case 'e':
          v5 = CFSTR("directory");
          break;
        case 'h':
          v5 = CFSTR("mobileasset");
          break;
        default:
LABEL_19:
          v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("(unrecognized: %d)"), -[TRIFactor type](self, "type"));
          break;
      }
    }
    else
    {
      v5 = CFSTR("unknown");
      switch(v4)
      {
        case 0:
          return v5;
        case 10:
          v5 = CFSTR("BOOLean");
          break;
        case 11:
          v5 = CFSTR("string");
          break;
        case 12:
          v5 = CFSTR("integer");
          break;
        case 13:
          v5 = CFSTR("long");
          break;
        case 14:
          v5 = CFSTR("float");
          break;
        case 15:
          v5 = CFSTR("double");
          break;
        case 16:
          v5 = CFSTR("binary");
          break;
        default:
          goto LABEL_19;
      }
    }
  }
  else
  {
    v5 = CFSTR("(unset)");
  }
  return v5;
}

- (BOOL)hasNamespace
{
  if ((-[TRIFactor hasNamespaceName](self, "hasNamespaceName") & 1) != 0)
    return 1;
  else
    return -[TRIFactor hasNamespaceId](self, "hasNamespaceId");
}

@end
