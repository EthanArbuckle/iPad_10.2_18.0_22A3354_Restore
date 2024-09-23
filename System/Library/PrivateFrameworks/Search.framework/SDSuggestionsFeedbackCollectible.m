@implementation SDSuggestionsFeedbackCollectible

- (SDSuggestionsFeedbackCollectible)initWithSuggestionsData:(id)a3
{
  id v4;
  SDSuggestionsFeedbackCollectible *v5;
  uint64_t v6;
  NSData *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SDSuggestionsFeedbackCollectible;
  v5 = -[SDSuggestionsFeedbackCollectible init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    data = v5->_data;
    v5->_data = (NSData *)v6;

  }
  return v5;
}

- (BOOL)serializeToJSON:(void *)a3 valuesOnly:(BOOL)a4
{
  NSUInteger v6;
  NSUInteger v7;
  char *v8;
  char *v9;
  char *v10;
  NSUInteger v11;
  uint64_t v12;
  char *v13;
  unsigned int v14;
  int v15;
  unint64_t v16;
  BOOL v17;
  char *v18;
  char *v19;
  unsigned int v20;
  int v21;

  v6 = -[NSData length](self->_data, "length");
  if (v6)
  {
    v7 = v6;
    v8 = -[NSData bytes](self->_data, "bytes");
    v9 = v8;
    if (!a4)
      goto LABEL_24;
    v10 = &v8[v7];
    v11 = v7 - 1;
    v12 = MEMORY[0x24BDAC740];
    v13 = v8;
    do
    {
      v14 = *v13;
      if ((v14 & 0x80000000) != 0)
        v15 = __maskrune(*v13, 0x4000uLL);
      else
        v15 = *(_DWORD *)(v12 + 4 * v14 + 60) & 0x4000;
      v16 = (unint64_t)(v13 + 1);
      --v11;
      if (v15)
        v17 = v13 >= v10;
      else
        v17 = 1;
      ++v13;
    }
    while (!v17);
    if (v14 != 123)
      goto LABEL_23;
    v18 = &v9[v7 - 1];
    do
    {
      v19 = v18;
      if ((unint64_t)(v18 + 1) <= v16)
        break;
      v20 = *v18;
      v21 = (v20 & 0x80000000) != 0 ? __maskrune(v20, 0x4000uLL) : *(_DWORD *)(v12 + 4 * v20 + 60) & 0x4000;
      v18 = v19 - 1;
      --v11;
    }
    while (v21);
    if (*v19 == 125 && (unint64_t)v19 > v16)
    {
LABEL_24:
      json_writer_add_raw_value();
      LOBYTE(v6) = 1;
    }
    else
    {
LABEL_23:
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (id)dataCollectionBundle
{
  return (id)*MEMORY[0x24BEB06B8];
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
