@implementation MTMediaTask

- (MTMediaTask)initWithType:(int64_t)a3
{
  MTMediaTask *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  AMSMediaTask *mediaTask;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTMediaTask;
  v4 = -[MTMediaTask init](&v13, sel_init);
  if (v4)
  {
    if (a3)
      v5 = 301;
    else
      v5 = 300;
    v6 = objc_alloc(MEMORY[0x24BE08238]);
    objc_msgSend(MEMORY[0x24BE73840], "mediaApiClientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE73840], "mediaApiClientVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE737D0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "initWithType:clientIdentifier:clientVersion:bag:", v5, v7, v8, v9);
    mediaTask = v4->_mediaTask;
    v4->_mediaTask = (AMSMediaTask *)v10;

    if (a3)
      -[AMSMediaTask setIncludedResultKeys:](v4->_mediaTask, "setIncludedResultKeys:", &unk_24FD6BE18);
  }
  return v4;
}

- (void)setIdentifiers:(id)a3
{
  -[AMSMediaTask setItemIdentifiers:](self->_mediaTask, "setItemIdentifiers:", a3);
}

- (void)setCharts:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AMSMediaTask setCharts:](self->_mediaTask, "setCharts:", v3);
}

- (NSArray)identifiers
{
  return (NSArray *)-[AMSMediaTask itemIdentifiers](self->_mediaTask, "itemIdentifiers");
}

- (void)perform:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[AMSMediaTask perform](self->_mediaTask, "perform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __23__MTMediaTask_perform___block_invoke;
  v7[3] = &unk_24FD62C40;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addFinishBlock:", v7);

}

void __23__MTMediaTask_perform___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  v5 = a3;
  objc_msgSend(v20, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v20, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("data"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("results"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "objectForKey:", CFSTR("podcast-episodes"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = v11;
        }
        else
        {
          objc_msgSend(v10, "objectForKey:", CFSTR("podcast"));
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v13;

      }
      else
      {
        v15 = 0;
      }
      objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v16, "objectForKey:", CFSTR("data"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v9 = v18;

    }
    v19 = *(_QWORD *)(a1 + 32);
    if (v19)
      (*(void (**)(uint64_t, id, _QWORD))(v19 + 16))(v19, v9, 0);

  }
  else
  {
    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
      (*(void (**)(uint64_t, _QWORD, id))(v14 + 16))(v14, 0, v5);
  }

}

- (BOOL)charts
{
  return self->_charts;
}

- (AMSMediaTask)mediaTask
{
  return self->_mediaTask;
}

- (void)setMediaTask:(id)a3
{
  objc_storeStrong((id *)&self->_mediaTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaTask, 0);
}

@end
