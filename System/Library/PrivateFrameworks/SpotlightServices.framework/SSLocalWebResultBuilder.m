@implementation SSLocalWebResultBuilder

+ (BOOL)supportsResult:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(&unk_1E6E9B668, "containsObject:", v3);

  return v4;
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

+ (id)stringWithUrl:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  objc_msgSend(v3, "_lp_simplifiedDisplayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("."));
    if (v6 == 0x7FFFFFFFFFFFFFFFLL || (v8 = v6 + v7, v9 = objc_msgSend(v5, "length"), v10 = v9 - v8, v9 <= v8))
    {
      v4 = 0;
    }
    else
    {
      v11 = objc_msgSend(v5, "rangeOfString:options:range:", CFSTR("/"), 0, v8, v10);
      if (v11 != 0x7FFFFFFFFFFFFFFFLL
        || (v11 = objc_msgSend(v5, "rangeOfString:options:range:", CFSTR("?"), 0, v8, v10),
            v4 = 0,
            v11 != 0x7FFFFFFFFFFFFFFFLL))
      {
        objc_msgSend(v5, "substringToIndex:", v11);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v4;
}

- (SSLocalWebResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSLocalWebResultBuilder *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SSLocalWebResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v14, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6968], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSLocalWebResultBuilder setSiteName:](v5, "setSiteName:", v6);

    v7 = *MEMORY[0x1E0CA6108];
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6108], objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[SSLocalWebResultBuilder setUrl:](v5, "setUrl:", v8);
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v4, "valueForAttribute:withType:", v7, objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLWithString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSLocalWebResultBuilder setUrl:](v5, "setUrl:", v11);

    }
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6890], objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSLocalWebResultBuilder setCloudTabDeviceName:](v5, "setCloudTabDeviceName:", v12);

  }
  return v5;
}

- (id)buildResult
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSLocalWebResultBuilder;
  -[SSResultBuilder buildResult](&v10, sel_buildResult);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();
  -[SSLocalWebResultBuilder url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithUrl:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompletion:", v8);

  return v3;
}

- (id)buildCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[SSLocalWebResultBuilder url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D8C5E0];
    -[SSLocalWebResultBuilder url](self, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutWithURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setPunchout:", v6);

    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SSLocalWebResultBuilder;
    -[SSResultBuilder buildCommand](&v9, sel_buildCommand);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)buildDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_class();
  -[SSLocalWebResultBuilder url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithUrl:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
    objc_msgSend(v4, "addObject:", v7);
  -[SSLocalWebResultBuilder cloudTabDeviceName](self, "cloudTabDeviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FROM_CLOUD_TAB_DEVICE_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSLocalWebResultBuilder cloudTabDeviceName](self, "cloudTabDeviceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v14);

  }
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" · "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    if (buildDescriptions_onceToken != -1)
      dispatch_once(&buildDescriptions_onceToken, &__block_literal_global_38);
    v16 = (void *)buildDescriptions_symbolNamesForContentTypes;
    -[SSResultBuilder result](self, "result");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contentType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)objc_opt_new();
      objc_msgSend(v20, "setSymbolName:", v19);
      objc_msgSend(v20, "setIsTemplate:", 1);
      v21 = (void *)objc_opt_new();
      objc_msgSend(v21, "setGlyph:", v20);
      v22 = (void *)MEMORY[0x1E0D8C3D0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "textWithString:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v29[0] = v21;
      v29[1] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setFormattedTextPieces:", v25);

    }
    else
    {
      objc_msgSend(v3, "setText:", v15);
    }
    objc_msgSend(v3, "setMaxLines:", 1);
    v28 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

void __44__SSLocalWebResultBuilder_buildDescriptions__block_invoke()
{
  void *v0;

  v0 = (void *)buildDescriptions_symbolNamesForContentTypes;
  buildDescriptions_symbolNamesForContentTypes = (uint64_t)&unk_1E6E9B8F8;

}

- (NSString)siteName
{
  return self->_siteName;
}

- (void)setSiteName:(id)a3
{
  objc_storeStrong((id *)&self->_siteName, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)cloudTabDeviceName
{
  return self->_cloudTabDeviceName;
}

- (void)setCloudTabDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_cloudTabDeviceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudTabDeviceName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_siteName, 0);
}

@end
