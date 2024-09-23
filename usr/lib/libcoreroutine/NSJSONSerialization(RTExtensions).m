@implementation NSJSONSerialization(RTExtensions)

+ (id)JSONStringFromNSDictionary:()RTExtensions error:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v5) & 1) != 0)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 8, &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    if (v7)
    {
      v18[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NSJSONSerialization failed"), &stru_1E92AB3A8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = *MEMORY[0x1E0CB3388];
      v19[0] = v9;
      v19[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.routined.NSJSONSerializationRTExtensions"), 0, v10);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "string");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
    }

  }
  else
  {
    v20[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Invalid dictionary for JSON serialization"), &stru_1E92AB3A8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v13;
    v20[1] = *MEMORY[0x1E0CB2D80];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Refer to NSJSONSerialization spec for valid dictionaries"), &stru_1E92AB3A8, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.routined.NSJSONSerializationRTExtensions"), 0, v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

@end
