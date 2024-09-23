@implementation PKMediaCol

- (id)userCodableDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = (void *)objc_opt_new();
  -[PKMediaCol mediaSize](self, "mediaSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "userCodableDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("media-size"));

  }
  -[PKMediaCol mediaSourceProperties](self, "mediaSourceProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "userCodableDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("media-source-properties"));

  }
  v18 = 0;
  v19 = 0;
  v20 = 0;
  if (-[PKMediaCol getMargins:](self, "getMargins:", &v18))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(v19));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("media-bottom-margin"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("media-left-margin"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(v20));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("media-top-margin"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("media-right-margin"));

  }
  -[PKMediaCol mediaSource](self, "mediaSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("media-source"));

  -[PKMediaCol mediaType](self, "mediaType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("media-type"));

  -[PKMediaCol mediaKey](self, "mediaKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("media-key"));

  return v3;
}

- (PKMediaSize)mediaSize
{
  return (PKMediaSize *)Printd_Parameters::_get_MediaSize((void **)-[PKCollectionSpecialization params](self, "params"));
}

- (PKMediaSourceProperties)mediaSourceProperties
{
  return (PKMediaSourceProperties *)Printd_Parameters::_get_MediaSourceProperties((void **)-[PKCollectionSpecialization params](self, "params"));
}

- (BOOL)getMargins:(pwg_size_s *)a3
{
  unint64_t v4;
  BOOL v5;
  _DWORD **v6;
  void *v7;
  PK_ipp_attribute_t *v8;
  int IXInteger;
  _DWORD *v10;
  uint64_t i;
  const __CFString *v13;
  _QWORD v14[8];

  v4 = 0;
  v5 = 0;
  v14[7] = *MEMORY[0x24BDAC8D0];
  v13 = CFSTR("media-bottom-margin");
  v14[0] = (char *)&a3->map.ppd + 4;
  v14[1] = CFSTR("media-left-margin");
  v14[2] = &a3->map.ppd;
  v14[3] = CFSTR("media-top-margin");
  v14[4] = &a3->length;
  v14[5] = CFSTR("media-right-margin");
  v14[6] = &a3->width;
  v6 = (_DWORD **)v14;
  while (1)
  {
    -[PKCollectionSpecialization collection](self, "collection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_findAttribute0:valueTag:", *(v6 - 1), 33);
    v8 = (PK_ipp_attribute_t *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      break;
    IXInteger = ippGetIXInteger(v8, 0);
    v10 = *v6;
    v6 += 2;
    *v10 = IXInteger;

    v5 = v4++ > 2;
    if (v4 == 4)
    {
      v5 = 1;
      break;
    }
  }
  for (i = 6; i != -2; i -= 2)

  return v5;
}

- (NSString)mediaSource
{
  return (NSString *)Printd_Parameters::_get_MediaSource((void **)-[PKCollectionSpecialization params](self, "params"));
}

- (NSString)mediaType
{
  return (NSString *)Printd_Parameters::_get_MediaType((void **)-[PKCollectionSpecialization params](self, "params"));
}

- (NSString)mediaKey
{
  return (NSString *)Printd_Parameters::_get_MediaKey((void **)-[PKCollectionSpecialization params](self, "params"));
}

@end
