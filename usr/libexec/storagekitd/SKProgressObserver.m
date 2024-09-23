@implementation SKProgressObserver

- (SKProgressObserver)initWithProgress:(id)a3
{
  id v5;
  SKProgressObserver *v6;
  SKProgressObserver *v7;
  NSMutableArray *v8;
  NSMutableArray *messages;
  NSString *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKProgressObserver;
  v6 = -[SKProgressObserver init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_progress, a3);
    v8 = objc_opt_new(NSMutableArray);
    messages = v7->_messages;
    v7->_messages = v8;

    v10 = NSStringFromSelector("localizedAdditionalDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v7, v11, 1, 0);

  }
  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  NSString *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a4;
  v8 = a3;
  v9 = NSStringFromSelector("localizedAdditionalDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  v12 = v25;
  if (v11)
  {
    v13 = v25;
    if (!v13)
      goto LABEL_10;
    v14 = objc_opt_class(NSProgress);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
      goto LABEL_10;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedAdditionalDescription"));

    if (!v15)
      goto LABEL_10;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKProgressObserver messages](self, "messages"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastObject"));
    if (v17)
    {
      v18 = (void *)v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SKProgressObserver messages](self, "messages"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastObject"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedAdditionalDescription"));
      v22 = objc_msgSend(v20, "isEqualToString:", v21);

      if ((v22 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SKProgressObserver messages](self, "messages"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedAdditionalDescription"));
    objc_msgSend(v23, "addObject:", v24);

LABEL_10:
    v12 = v25;
  }

}

- (void)dealloc
{
  void *v3;
  NSString *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKProgressObserver progress](self, "progress"));
  v4 = NSStringFromSelector("localizedAdditionalDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, v5);

  v6.receiver = self;
  v6.super_class = (Class)SKProgressObserver;
  -[SKProgressObserver dealloc](&v6, "dealloc");
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
