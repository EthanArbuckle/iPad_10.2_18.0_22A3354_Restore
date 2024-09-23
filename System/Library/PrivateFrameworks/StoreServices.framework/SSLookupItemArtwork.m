@implementation SSLookupItemArtwork

- (SSLookupItemArtwork)initWithLookupDictionary:(id)a3
{
  SSLookupItemArtwork *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSLookupItemArtwork;
  v4 = -[SSLookupItemArtwork init](&v6, sel_init);
  if (v4)
    v4->_dictionary = (NSDictionary *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSLookupItemArtwork;
  -[SSLookupItemArtwork dealloc](&v3, sel_dealloc);
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6 forColorKind:(id)a7
{
  id v11;
  char isKindOfClass;
  double v13;
  double v14;
  double v15;
  unint64_t v16;

  v11 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", a7);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v13 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  if ((isKindOfClass & 1) != 0)
  {
    v16 = strtoul((const char *)objc_msgSend(v11, "UTF8String", 0.0, 0.0, 0.0), 0, 16);
    v13 = (double)BYTE2(v16) / 255.0;
    v14 = (double)BYTE1(v16) / 255.0;
    v15 = (double)v16 / 255.0;
  }
  if (a3)
    *a3 = v13;
  if (a4)
    *a4 = v14;
  if (a5)
    *a5 = v15;
  if (a6)
    *a6 = 1.0;
  return isKindOfClass & 1;
}

- (int64_t)height
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("height"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "integerValue");
  else
    return 0;
}

- (NSURL)URL
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("url"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  else
    return 0;
}

- (id)URLWithHeight:(int64_t)a3 width:(int64_t)a4
{
  return -[SSLookupItemArtwork URLWithHeight:width:format:](self, "URLWithHeight:width:format:", a3, a4, CFSTR("jpg"));
}

- (id)URLWithHeight:(int64_t)a3 width:(int64_t)a4 format:(id)a5
{
  return -[SSLookupItemArtwork URLWithHeight:width:cropStyle:format:](self, "URLWithHeight:width:cropStyle:format:", a3, a4, CFSTR("bb"), a5);
}

- (id)URLWithHeight:(int64_t)a3 width:(int64_t)a4 cropStyle:(id)a5 format:(id)a6
{
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSURL *v19;
  _QWORD v21[13];

  v21[12] = *MEMORY[0x1E0C80C00];
  v11 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("url"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v12 = 0;
  v13 = 0;
  v21[0] = CFSTR("{h}");
  v21[1] = a3;
  v21[2] = 0;
  v21[3] = CFSTR("{w}");
  v21[4] = a4;
  v21[8] = a6;
  v21[9] = CFSTR("{c}");
  v21[10] = 0;
  v21[11] = a5;
  v21[5] = 0;
  v21[6] = CFSTR("{f}");
  v21[7] = 0;
  do
  {
    v14 = objc_msgSend(v11, "rangeOfString:options:", v21[v12], 4);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_7;
    v16 = v14;
    v17 = v15;
    v18 = (id)v21[v12 + 2];
    if (v18)
    {
      if (!v13)
        goto LABEL_10;
    }
    else
    {
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), v21[v12 + 1]);
      if (!v13)
      {
LABEL_10:
        v13 = (void *)objc_msgSend(v11, "mutableCopy");
        v11 = v13;
      }
    }
    objc_msgSend(v13, "replaceCharactersInRange:withString:", v16, v17, v18);

LABEL_7:
    v12 += 3;
  }
  while (v12 != 12);
  if (!v13 || (v19 = (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13)) == 0)
    v19 = -[SSLookupItemArtwork URL](self, "URL");

  return v19;
}

- (int64_t)width
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("width"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "integerValue");
  else
    return 0;
}

- (NSDictionary)lookupDictionary
{
  return self->_dictionary;
}

@end
