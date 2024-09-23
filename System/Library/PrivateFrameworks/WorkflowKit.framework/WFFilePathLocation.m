@implementation WFFilePathLocation

+ (Class)supportedClassForURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__WFFilePathLocation_supportedClassForURL___block_invoke;
  v8[3] = &unk_1E7AF76B0;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "if_firstObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

+ (id)locationWithSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("relativeSubpath"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRelativeSubpath:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __43__WFFilePathLocation_supportedClassForURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canRepresentURL:", *(_QWORD *)(a1 + 32));
}

@end
