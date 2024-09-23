@implementation TRILevel

+ (id)descriptor
{
  id v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = (id)descriptor_descriptor_44;
  if (!descriptor_descriptor_44)
  {
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    LODWORD(v8) = 0;
    v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, TRITrifactorRoot_FileDescriptor(), &off_1ECF0E190, 11, 80, v8);
    objc_msgSend(v2, "setupOneofs:count:firstHasIndex:", _MergedGlobals_0, 1, 0xFFFFFFFFLL);
    if (descriptor_descriptor_44)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("Trifactor.pbobjc.m"), 409, CFSTR("Startup recursed!"));
    descriptor_descriptor_44 = (uint64_t)v2;
  }
  return v2;
}

- (id)fileOrDirectoryLevelWithIsDir:(BOOL *)a3
{
  int v5;
  void *v6;
  BOOL v7;

  v5 = -[TRILevel levelOneOfCase](self, "levelOneOfCase");
  if (v5 == 101)
  {
    -[TRILevel directoryValue](self, "directoryValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
    if (!a3)
      return v6;
    goto LABEL_8;
  }
  if (v5 == 100)
  {
    -[TRILevel fileValue](self, "fileValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = 0;
  if (a3)
LABEL_8:
    *a3 = v7;
  return v6;
}

- (id)object
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[TRILevel levelOneOfCase](self, "levelOneOfCase");
  switch(v3)
  {
    case 10:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TRILevel BOOLeanValue](self, "BOOLeanValue"));
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 11:
      -[TRILevel stringValue](self, "stringValue");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 12:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[TRILevel intValue](self, "intValue"));
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 13:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[TRILevel longValue](self, "longValue"));
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 14:
      v6 = (void *)MEMORY[0x1E0CB37E8];
      -[TRILevel floatValue](self, "floatValue");
      objc_msgSend(v6, "numberWithFloat:");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 15:
      v7 = (void *)MEMORY[0x1E0CB37E8];
      -[TRILevel doubleValue](self, "doubleValue");
      objc_msgSend(v7, "numberWithDouble:");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 16:
      -[TRILevel binaryValue](self, "binaryValue");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v8 = (void *)v4;
      return v8;
    default:
      if (v3 == 100)
      {
        -[TRILevel fileValue](self, "fileValue");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      if (v3 == 101)
      {
        -[TRILevel directoryValue](self, "directoryValue");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
        v9 = v5;
        objc_msgSend(v5, "path");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        return v8;
      }
      v8 = 0;
      return v8;
  }
}

- (BOOL)isFactorOnDemand
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[TRILevel fileOrDirectoryLevelWithIsDir:](self, "fileOrDirectoryLevelWithIsDir:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "hasIsOnDemand") && (objc_msgSend(v4, "isOnDemand") & 1) != 0)
  {
    v5 = 1;
  }
  else if (-[TRILevel levelOneOfCase](self, "levelOneOfCase") == 104)
  {
    -[TRILevel mobileAssetReferenceValue](self, "mobileAssetReferenceValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hasIsOnDemand"))
      v5 = objc_msgSend(v6, "isOnDemand");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
