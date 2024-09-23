@implementation CNVCardSocialProfileLineGenerator

- (id)lineWithValue:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  id v8;
  _BOOL4 v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "valueForKey:", CFSTR("service"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v28 = v7;
  if (objc_msgSend(v8, "length"))
  {
    v9 = -[CNVCardSocialProfileLineGenerator isStandardServiceName:](self, "isStandardServiceName:", v8);
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v8, "lowercaseString");
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v11;
    }
    v8 = v8;
    v12 = v8;
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  objc_msgSend(v6, "valueForKey:", CFSTR("urlString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v8;
  if (objc_msgSend(v13, "length"))
  {
    if (v10)
    {
      v26 = 0;
    }
    else
    {
      objc_msgSend(v6, "valueForKey:", CFSTR("username"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v13;
    v29 = v18;
  }
  else
  {
    objc_msgSend(v6, "valueForKey:", CFSTR("username"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v14;
    if (objc_msgSend(v14, "length"))
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAddingPercentEncodingWithAllowedCharacters:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@:%@"), CFSTR("x-apple"), v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      v26 = 0;
    }
    else
    {
      v26 = 0;
      v18 = 0;
    }
  }
  objc_msgSend(v6, "valueForKey:", CFSTR("userIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("displayname"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifiers"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count"))
  {
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(","));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("teamIdentifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30.receiver = self;
  v30.super_class = (Class)CNVCardSocialProfileLineGenerator;
  -[CNVCardLineGenerator lineWithValue:label:](&v30, sel_lineWithValue_label_, v18, v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "addParameterWithName:value:", CFSTR("type"), v12);
  objc_msgSend(v24, "addParameterWithName:value:", CFSTR("x-user"), v26);
  objc_msgSend(v24, "addParameterWithName:value:", CFSTR("x-userid"), v19);
  objc_msgSend(v24, "addParameterWithName:value:", CFSTR("x-displayname"), v20);
  objc_msgSend(v24, "addParameterWithName:value:", CFSTR("x-bundleidentifiers"), v22);
  objc_msgSend(v24, "addParameterWithName:value:", CFSTR("x-teamidentifier"), v23);

  return v24;
}

- (BOOL)isStandardServiceName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("Twitter");
  v7[1] = CFSTR("Facebook");
  v7[2] = CFSTR("LinkedIn");
  v7[3] = CFSTR("Flickr");
  v7[4] = CFSTR("MySpace");
  v7[5] = CFSTR("SinaWeibo");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v7, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "containsObject:", v4);

  return (char)v3;
}

@end
