@implementation PHPerson(PhotosUICore)

- (id)px_localizedName
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;

  v1 = a1;
  objc_sync_enter(v1);
  objc_getAssociatedObject(v1, &PersonLocalizedNameKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(v1, "_px_localizedNameWithStyle:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "length"))
    {
LABEL_9:
      objc_setAssociatedObject(v1, &PersonLocalizedNameKey, v2, (void *)0x301);
      goto LABEL_10;
    }
    objc_msgSend(v1, "displayName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      objc_msgSend(v1, "displayName");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v1, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");

      if (!v7)
      {
        v8 = &stru_1E5149688;
        goto LABEL_8;
      }
      objc_msgSend(v1, "name");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (const __CFString *)v5;
LABEL_8:

    v2 = (void *)v8;
    goto LABEL_9;
  }
LABEL_10:
  objc_sync_exit(v1);

  return v2;
}

- (__CFString)px_longStyleLocalizedName
{
  __CFString *v2;
  __CFString *v3;

  objc_msgSend(a1, "_px_localizedNameWithStyle:", 3);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v2, "length"))
  {
    objc_msgSend(a1, "name");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (-[__CFString length](v3, "length"))
    {
      v2 = v3;
    }
    else
    {

      v2 = &stru_1E5149688;
    }
  }
  return v2;
}

- (id)_px_localizedNameWithStyle:()PhotosUICore
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "px_nameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v4, a3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)px_nameComponents
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "contactMatchingDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("first-name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("last-name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length") || objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    objc_msgSend(v4, "setGivenName:", v2);
    objc_msgSend(v4, "setFamilyName:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)px_navigationURL
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "localIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("photos://people?identifier=%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)px_isSameDetectionTypeAsPerson:()PhotosUICore
{
  id v4;
  unsigned int v5;
  _BOOL8 v6;

  v4 = a3;
  v5 = objc_msgSend(a1, "detectionType");
  v6 = 0;
  if (v5 <= 4 && ((1 << v5) & 0x1A) != 0)
    v6 = v5 == objc_msgSend(v4, "detectionType");

  return v6;
}

+ (id)px_localizedNameFromContact:()PhotosUICore
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3850];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "givenName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGivenName:", v6);

  objc_msgSend(v4, "familyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setFamilyName:", v7);
  objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v5, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
