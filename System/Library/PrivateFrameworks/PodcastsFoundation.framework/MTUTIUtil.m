@implementation MTUTIUtil

+ (id)convertUti:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA5CB8]))
  {
    v4 = (id)*MEMORY[0x1E0CA5BF8];

    v3 = v4;
  }
  return v3;
}

+ (BOOL)isVideo:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a1, "convertUti:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA5BF8]);

  return v4;
}

+ (BOOL)isAudio:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a1, "convertUti:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA5AC8]);

  return v4;
}

@end
