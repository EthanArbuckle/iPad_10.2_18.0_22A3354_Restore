@implementation UIAccessibilityLocationDescriptor(AXAdditions)

- (uint64_t)_auxiliaryDataAsDictionaryRepresentation
{
  return 0;
}

- (id)dictionaryRepresentation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  AXValueRef v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  CFTypeRef v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD valuePtr[2];
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a1, "view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "point");
  valuePtr[0] = v3;
  valuePtr[1] = v4;
  v5 = AXValueCreate(kAXValueTypeCGPoint, valuePtr);
  objc_msgSend(a1, "attributedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v8 = *MEMORY[0x1E0CF3FD0];
  v17[0] = v2;
  v9 = *MEMORY[0x1E0CF3FC8];
  v16[0] = v8;
  v16[1] = v9;
  v10 = CFAutorelease(v5);
  v16[2] = *MEMORY[0x1E0CF3FA0];
  v17[1] = v10;
  v17[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v11);
  objc_msgSend(a1, "_auxiliaryDataAsDictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v7, "addEntriesFromDictionary:", v12);
  v13 = (void *)objc_msgSend(v7, "copy");

  return v13;
}

- (BOOL)matchesDictionaryRepresentation:()AXAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;

  v4 = a3;
  objc_msgSend(a1, "attributedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF3FA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqualToString:", v9);

  if (v10)
  {
    v11 = objc_msgSend(a1, "view");
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF3FD0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedLongLongValue") == v11;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
