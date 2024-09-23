@implementation PNRStringsFileReaderResult

- (PNRStringsFileReaderResult)initWithCountry:(id)a3 region:(id)a4 city:(id)a5
{
  id v9;
  id v10;
  id v11;
  PNRStringsFileReaderResult *v12;
  PNRStringsFileReaderResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PNRStringsFileReaderResult;
  v12 = -[PNRStringsFileReaderResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_country, a3);
    objc_storeStrong((id *)&v13->_region, a4);
    objc_storeStrong((id *)&v13->_city, a5);
  }

  return v13;
}

- (BOOL)isEqualTo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PNRStringsFileReaderResult country](self, "country");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "country");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[PNRStringsFileReaderResult region](self, "region");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "region");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        -[PNRStringsFileReaderResult city](self, "city");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "city");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (int64_t)score
{
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  -[PNRStringsFileReaderResult country](self, "country");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v3 != 0;
  if (v3)
    v5 = 10;
  else
    v5 = 1;
  -[PNRStringsFileReaderResult region](self, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 2 * v5;
  v8 = v6 == 0;
  if (v6)
    v9 = 10 * v5;
  else
    v9 = v5;
  if (v8)
    v7 = 0;
  v10 = v7 | v4;
  -[PNRStringsFileReaderResult city](self, "city");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 3 * v9;
  if (!v11)
    v12 = 0;
  return v10 + v12;
}

- (id)separatorForLanguage:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(&unk_24F4D3D70, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    v7 = CFSTR(" ");
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(&unk_24F4D3D70);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "isEqualToString:", v3) & 1) != 0)
        break;
      if (v5 == ++v8)
      {
        v5 = objc_msgSend(&unk_24F4D3D70, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          goto LABEL_3;
        v7 = CFSTR(", ");
        break;
      }
    }
  }
  else
  {
    v7 = CFSTR(", ");
  }

  return (id)v7;
}

- (BOOL)shouldOrderCityFirstForLanguage:(id)a3 phoneNumberInCC:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(&unk_24F4D3D88, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(&unk_24F4D3D88);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isEqualToString:", v4) & 1) != 0)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(&unk_24F4D3D88, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (id)aggregateStringWhileInCountry:(id)a3 forLanguage:(id)a4 ccOfNumber:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v8 = a3;
  v9 = a4;
  v10 = -[PNRStringsFileReaderResult shouldOrderCityFirstForLanguage:phoneNumberInCC:](self, "shouldOrderCityFirstForLanguage:phoneNumberInCC:", v9, a5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNRStringsFileReaderResult city](self, "city");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {
    -[PNRStringsFileReaderResult region](self, "region");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNRStringsFileReaderResult city](self, "city");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v15 & 1) != 0)
      goto LABEL_5;
    -[PNRStringsFileReaderResult city](self, "city");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);
  }

LABEL_5:
  -[PNRStringsFileReaderResult region](self, "region");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    -[PNRStringsFileReaderResult region](self, "region");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v11, "addObject:", v18);
    else
      objc_msgSend(v11, "insertObject:atIndex:", v18, 0);

  }
  -[PNRStringsFileReaderResult country](self, "country");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");

  if (v20)
  {
    -[PNRStringsFileReaderResult country](self, "country");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsSeparatedByString:", CFSTR(":"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v22, "count") == 2)
    {
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "caseInsensitiveCompare:", v23)
        && (objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("CN"))
         || objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("HK"))
         && objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("MO"))))
      {

        objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v11, "addObject:", v23);
        else
          objc_msgSend(v11, "insertObject:atIndex:", v23, 0);
      }

    }
  }
  -[PNRStringsFileReaderResult separatorForLanguage:](self, "separatorForLanguage:", v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (int64_t)maxPossibleScore
{
  return 321;
}

- (BOOL)isPlaceHolderForEmpty
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[PNRStringsFileReaderResult country](self, "country");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR(":NONE")))
  {
    -[PNRStringsFileReaderResult region](self, "region");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("NONE")))
    {
      -[PNRStringsFileReaderResult city](self, "city");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("NONE"));

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_storeStrong((id *)&self->_country, a3);
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_storeStrong((id *)&self->_city, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_country, 0);
}

@end
