@implementation SSVPlaybackResponse

- (SSVPlaybackResponse)initWithDictionary:(id)a3 URLResponse:(id)a4
{
  id v6;
  id v7;
  SSVPlaybackResponse *v8;
  uint64_t v9;
  NSDictionary *responseDictionary;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SSVPlaybackResponse;
  v8 = -[SSVPlaybackResponse init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    responseDictionary = v8->_responseDictionary;
    v8->_responseDictionary = (NSDictionary *)v9;

    objc_storeStrong((id *)&v8->_urlResponse, a4);
  }

  return v8;
}

- (id)itemForItemIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__SSVPlaybackResponse_itemForItemIdentifier___block_invoke;
  v8[3] = &unk_1E47B9D58;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[SSVPlaybackResponse _enumerateItemsUsingBlock:](self, "_enumerateItemsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __45__SSVPlaybackResponse_itemForItemIdentifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "itemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (NSArray)items
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__SSVPlaybackResponse_items__block_invoke;
  v6[3] = &unk_1E47B9D80;
  v4 = v3;
  v7 = v4;
  -[SSVPlaybackResponse _enumerateItemsUsingBlock:](self, "_enumerateItemsUsingBlock:", v6);

  return (NSArray *)v4;
}

uint64_t __28__SSVPlaybackResponse_items__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSDictionary copyWithZone:](self->_responseDictionary, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSHTTPURLResponse copyWithZone:](self->_urlResponse, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)_enumerateItemsUsingBlock:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v5 = a3;
  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("songList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__SSVPlaybackResponse__enumerateItemsUsingBlock___block_invoke;
    v6[3] = &unk_1E47B9DA8;
    v6[4] = self;
    v7 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  }
}

void __49__SSVPlaybackResponse__enumerateItemsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  SSVPlaybackItem *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = -[SSVPlaybackItem initWithItemDictionary:]([SSVPlaybackItem alloc], "initWithItemDictionary:", v6);
    objc_msgSend(*(id *)(a1 + 32), "fallbackStreamingKeyCertificateURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPlaybackItem setFallbackStreamingKeyCertificateURL:](v3, "setFallbackStreamingKeyCertificateURL:", v4);

    objc_msgSend(*(id *)(a1 + 32), "fallbackStreamingKeyServerURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPlaybackItem setFallbackStreamingKeyServerURL:](v3, "setFallbackStreamingKeyServerURL:", v5);

    if (v3)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (NSHTTPURLResponse)URLResponse
{
  return self->_urlResponse;
}

- (NSURL)fallbackStreamingKeyServerURL
{
  return self->_fallbackStreamingKeyServerURL;
}

- (void)setFallbackStreamingKeyServerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)fallbackStreamingKeyCertificateURL
{
  return self->_fallbackStreamingKeyCertificateURL;
}

- (void)setFallbackStreamingKeyCertificateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackStreamingKeyCertificateURL, 0);
  objc_storeStrong((id *)&self->_fallbackStreamingKeyServerURL, 0);
  objc_storeStrong((id *)&self->_urlResponse, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
