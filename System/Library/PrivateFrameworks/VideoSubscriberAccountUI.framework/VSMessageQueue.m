@implementation VSMessageQueue

- (VSMessageQueue)init
{
  VSMessageQueue *v2;
  NSMutableArray *v3;
  NSMutableArray *messages;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSMessageQueue;
  v2 = -[VSMessageQueue init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    messages = v2->_messages;
    v2->_messages = v3;

  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  VSMessageQueueDelegate **p_delegate;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2303C5000, v6, OS_LOG_TYPE_DEFAULT, "Will notify new delegate of messages.", v7, 2u);
  }

  objc_msgSend(v5, "didAddMessagesToMessageQueue:", self);
}

- (void)addMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  VSMessageQueue *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Will add message %@ to queue %@", (uint8_t *)&v8, 0x16u);
  }

  -[VSMessageQueue messages](self, "messages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  -[VSMessageQueue delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didAddMessagesToMessageQueue:", self);

}

- (id)removeAllMessages
{
  void *v2;
  void *v3;

  -[VSMessageQueue messages](self, "messages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v2, "removeAllObjects");

  return v3;
}

- (VSMessageQueueDelegate)delegate
{
  return (VSMessageQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableArray)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
  objc_storeStrong((id *)&self->_messages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messages, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
