@implementation DDScannerResult(CRCodable)

- (id)crCodableDataRepresentation
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ddScannerResultWithCRCodableDataRepresentation:()CRCodable
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v10[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unarchivedObjectOfClasses:fromData:error:", v7, v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
