@implementation UIWebClip(SBAdditions)

- (id)sb_iconImageFileProtectionType
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "iconImagePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributesOfItemAtPath:error:", v1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AD8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)sb_markIconImageFileProtectionTypeAsNone
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "iconImagePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributesOfItemAtPath:error:", v1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)*MEMORY[0x1E0CB2AE0];
  v5 = *MEMORY[0x1E0CB2AD8];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AD8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v5;
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttributes:ofItemAtPath:error:", v9, v1, 0);

  }
  return v7 ^ 1u;
}

@end
