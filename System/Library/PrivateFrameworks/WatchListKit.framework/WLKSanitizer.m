@implementation WLKSanitizer

+ (id)sanitizeError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || !objc_msgSend(v4, "code"))
  {

    goto LABEL_7;
  }
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_7:
    v11 = v4;
    goto LABEL_8;
  }
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKSanitizer _sanitizeDictionary:](WLKSanitizer, "_sanitizeDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v4, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v4, "code"), v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v11;
}

+ (id)_sanitizeDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(v4, "wlk_stringForKey:", *MEMORY[0x1E0CB2D50]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v7, v6);

  v8 = *MEMORY[0x1E0CB2D80];
  objc_msgSend(v4, "wlk_stringForKey:", *MEMORY[0x1E0CB2D80]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v9, v8);

  v10 = *MEMORY[0x1E0CB3300];
  objc_msgSend(v4, "wlk_stringForKey:", *MEMORY[0x1E0CB3300]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v11, v10);

  v12 = *MEMORY[0x1E0CB2BF8];
  objc_msgSend(v4, "wlk_stringForKey:", *MEMORY[0x1E0CB2BF8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v13, v12);

  v14 = *MEMORY[0x1E0CB2938];
  objc_msgSend(v4, "wlk_stringForKey:", *MEMORY[0x1E0CB2938]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v15, v14);

  v16 = *MEMORY[0x1E0CB3308];
  objc_msgSend(v4, "wlk_urlForKey:", *MEMORY[0x1E0CB3308]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v18, v16);

  v19 = *MEMORY[0x1E0CB2AA0];
  objc_msgSend(v4, "wlk_stringForKey:", *MEMORY[0x1E0CB2AA0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v20, v19);
  v21 = (void *)objc_msgSend(v5, "copy");

  return v21;
}

@end
