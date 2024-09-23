@implementation PKMutableMediaCol

- (PKMutableMediaCol)init
{
  PKMutableMediaCol *v2;
  uint64_t v3;
  NSMutableDictionary *dict;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKMutableMediaCol;
  v2 = -[PKMutableMediaCol init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    dict = v2->_dict;
    v2->_dict = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)setMarginsTop:(int)a3 left:(int)a4 bottom:(int)a5 right:(int)a6
{
  uint64_t v7;
  void *v8;
  uint64_t i;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  int v17;
  uint64_t v18;

  v7 = 0;
  v18 = *MEMORY[0x24BDAC8D0];
  v10 = CFSTR("media-bottom-margin");
  v11 = a5;
  v12 = CFSTR("media-left-margin");
  v13 = a4;
  v14 = CFSTR("media-top-margin");
  v15 = a3;
  v16 = CFSTR("media-right-margin");
  v17 = a6;
  do
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)((char *)&v10 + v7 + 8));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMutableMediaCol setValue:forKey:](self, "setValue:forKey:", v8, *(const __CFString **)((char *)&v10 + v7));

    v7 += 16;
  }
  while (v7 != 64);
  for (i = 48; i != -16; i -= 16)

}

- (void)setValue:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_dict, "setObject:forKey:", a3, a4);
}

- (id)makeMediaCol
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *dict;
  id v10;
  id v11;
  id v12;
  PKMediaCol *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v3 = (void *)objc_opt_new();
  -[PKMutableMediaCol mediaSize](self, "mediaSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKMutableMediaCol mediaSize](self, "mediaSize");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_addCollection:name:value:", 0, CFSTR("media-size"), v6);

  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24E6EB348);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24E6EB360);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  dict = self->_dict;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __33__PKMutableMediaCol_makeMediaCol__block_invoke;
  v15[3] = &unk_24E6CD7D8;
  v10 = v7;
  v16 = v10;
  v11 = v3;
  v17 = v11;
  v12 = v8;
  v18 = v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dict, "enumerateKeysAndObjectsUsingBlock:", v15);
  v13 = -[PKCollectionSpecialization initWithCollection:]([PKMediaCol alloc], "initWithCollection:", v11);

  return v13;
}

void __33__PKMutableMediaCol_makeMediaCol__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(a1[4], "containsObject:", v6))
  {
    objc_msgSend(a1[5], "_addInteger:valueTag:name:value:", 0, 33, v6, objc_msgSend(v5, "intValue"));
  }
  else if (objc_msgSend(a1[6], "containsObject:", v6))
  {
    objc_msgSend(a1[5], "_addString:valueTag:name:lang:value:", 0, 68, v6, 0, v5);
  }

}

- (NSString)mediaSource
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("media-source"));
}

- (void)setMediaSource:(id)a3
{
  -[PKMutableMediaCol setValue:forKey:](self, "setValue:forKey:", a3, CFSTR("media-source"));
}

- (NSString)mediaType
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("media-type"));
}

- (void)setMediaType:(id)a3
{
  -[PKMutableMediaCol setValue:forKey:](self, "setValue:forKey:", a3, CFSTR("media-type"));
}

- (PKMediaSize)mediaSize
{
  return (PKMediaSize *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMediaSize:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSize, 0);
  objc_storeStrong((id *)&self->_dict, 0);
}

@end
