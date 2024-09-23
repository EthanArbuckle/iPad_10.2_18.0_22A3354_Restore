@implementation SKProgressObserver

- (SKProgressObserver)initWithProgress:(id)a3
{
  id v5;
  SKProgressObserver *v6;
  SKProgressObserver *v7;
  uint64_t v8;
  NSMutableArray *messages;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SKProgressObserver;
  v6 = -[SKProgressObserver init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_progress, a3);
    v8 = objc_opt_new();
    messages = v7->_messages;
    v7->_messages = (NSMutableArray *)v8;

    NSStringFromSelector(sel_localizedAdditionalDescription);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v7, v10, 1, 0);

  }
  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a4;
  v8 = a3;
  NSStringFromSelector(sel_localizedAdditionalDescription);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  v11 = v23;
  if (v10)
  {
    v12 = v23;
    if (!v12)
      goto LABEL_10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
    objc_msgSend(v12, "localizedAdditionalDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_10;
    -[SKProgressObserver messages](self, "messages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      -[SKProgressObserver messages](self, "messages");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedAdditionalDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToString:", v19);

      if ((v20 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    -[SKProgressObserver messages](self, "messages");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedAdditionalDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v22);

LABEL_10:
    v11 = v23;
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SKProgressObserver progress](self, "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedAdditionalDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, v4);

  v5.receiver = self;
  v5.super_class = (Class)SKProgressObserver;
  -[SKProgressObserver dealloc](&v5, sel_dealloc);
}

- (NSMutableArray)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
  objc_storeStrong((id *)&self->_messages, a3);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_messages, 0);
}

@end
