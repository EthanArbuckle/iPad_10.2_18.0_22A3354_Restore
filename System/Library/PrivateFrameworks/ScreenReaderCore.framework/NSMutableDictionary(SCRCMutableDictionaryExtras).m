@implementation NSMutableDictionary(SCRCMutableDictionaryExtras)

- (void)scrc_mergeEntriesFromDictionary:()SCRCMutableDictionaryExtras factory:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  objc_msgSend(v24, "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_opt_class();
  objc_msgSend(v7, "nextObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    do
    {
      objc_msgSend(v24, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "objectForKey:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v12 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v12;
        }
        objc_msgSend(v11, "scrc_mergeEntriesFromDictionary:factory:", v10, v6);
        v13 = a1;
        v14 = v11;
      }
      else
      {
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v10, "isEqualToString:", CFSTR("@undefine")))
        {

LABEL_21:
          objc_msgSend(a1, "removeObjectForKey:", v9);
          goto LABEL_22;
        }
        if (v6)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v10, "hasPrefix:", CFSTR("@")))
            {
              if (objc_msgSend(v10, "hasSuffix:", CFSTR(")")))
              {
                v15 = objc_msgSend(v10, "rangeOfString:", CFSTR("("));
                if (v15 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  v16 = v15;
                  objc_msgSend(v10, "substringWithRange:", 1, v15 - 1);
                  v17 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "substringWithRange:", v16 + 1, objc_msgSend(v10, "length") - v16 - 2);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = (void *)v17;
                  objc_msgSend(v6, "scrc_dictionaryValueForClassKey:withSpecifier:", v17, v18);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = v19;
                  if (v19)
                  {
                    v22 = v19;

                    v10 = v22;
                  }

                }
              }
            }
          }
        }
        if (!v10)
          goto LABEL_21;
        v13 = a1;
        v14 = v10;
      }
      objc_msgSend(v13, "setObject:forKey:", v14, v9);

LABEL_22:
      objc_msgSend(v7, "nextObject");
      v21 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v21;
    }
    while (v21);
  }

}

- (uint64_t)scrc_mergeEntriesFromDictionary:()SCRCMutableDictionaryExtras
{
  return objc_msgSend(a1, "scrc_mergeEntriesFromDictionary:factory:", a3, 0);
}

@end
