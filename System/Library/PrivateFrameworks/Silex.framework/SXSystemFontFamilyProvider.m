@implementation SXSystemFontFamilyProvider

- (SXSystemFontFamilyProvider)init
{
  return -[SXSystemFontFamilyProvider initWithFontMetaData:](self, "initWithFontMetaData:", &unk_24D703008);
}

- (SXSystemFontFamilyProvider)initWithFontMetaData:(id)a3
{
  id v4;
  SXSystemFontFamilyProvider *v5;
  SXSystemFontFamilyProvider *v6;
  uint64_t v7;
  NSArray *fonts;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXSystemFontFamilyProvider;
  v5 = -[SXSystemFontFamilyProvider init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SXSystemFontFamilyProvider fontsForMetadata:](v5, "fontsForMetadata:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    fonts = v6->_fonts;
    v6->_fonts = (NSArray *)v7;

  }
  return v6;
}

- (id)fontsForMetadata:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  SXSystemFontFace *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  SXFontFamily *v24;
  void *v25;
  SXFontFamily *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v10 = -[SXSystemFontFace initWithMetadata:]([SXSystemFontFace alloc], "initWithMetadata:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
        -[SXSystemFontFace fontAttributes](v10, "fontAttributes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "familyName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXSystemFontFace fontAttributes](v10, "fontAttributes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "familyName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v13, v15);

        }
        objc_msgSend(v13, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = v4;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
        objc_msgSend(v17, "objectForKey:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = [SXFontFamily alloc];
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[SXFontFamily initWithFamilyName:faces:](v24, "initWithFamilyName:faces:", v22, v25);

        objc_msgSend(v16, "addObject:", v26);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v19);
  }

  return v16;
}

- (NSString)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXSystemFontFamilyProvider fonts](self, "fonts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; fonts: %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (NSArray)fonts
{
  return self->_fonts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fonts, 0);
}

@end
