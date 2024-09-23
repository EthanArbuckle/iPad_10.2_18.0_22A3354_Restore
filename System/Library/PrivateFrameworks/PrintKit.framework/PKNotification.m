@implementation PKNotification

- (PKNotification)initWithNotifier:(id)a3 notifyKind:(int)a4
{
  id v7;
  PKNotification *v8;
  PKNotification *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKNotification;
  v8 = -[PKNotification init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notifier, a3);
    v9->_kind = a4;
  }

  return v9;
}

- (void)cancel
{
  -[PKNotifier cancelNotification:](self->_notifier, "cancelNotification:", self);
}

- (void)start
{
  PKNotifier *notifier;
  unint64_t v4;
  id v5;

  notifier = self->_notifier;
  v4 = -[PKNotification _makeFlags](self, "_makeFlags");
  -[PKNotification _makeDict](self, "_makeDict");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKNotifier startNotification:options:dict:](notifier, "startNotification:options:dict:", self, v4);

}

- (unint64_t)_makeFlags
{
  return self->_kind;
}

- (id)_makeDict
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

  v3 = (void *)objc_opt_new();
  -[PKNotification headerString](self, "headerString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKNotification headerString](self, "headerString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDBD6D8]);

  }
  -[PKNotification messageString](self, "messageString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PKNotification messageString](self, "messageString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDBD6E0]);

  }
  -[PKNotification defaultButtonTitle](self, "defaultButtonTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PKNotification defaultButtonTitle](self, "defaultButtonTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDBD6F8]);

  }
  -[PKNotification alternateButtonTitle](self, "alternateButtonTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKNotification alternateButtonTitle](self, "alternateButtonTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDBD6F0]);

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BEB0E40]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BEB0E58]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BEB0E00]);
  return v3;
}

- (void)_interpretResult:(unint64_t)a3 responseDict:(id)a4
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  -[PKNotification resultHandler](self, "resultHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKNotification resultQueue](self, "resultQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 2 * (a3 == 1);
  if (!a3)
    v8 = 1;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__PKNotification__interpretResult_responseDict___block_invoke;
  v10[3] = &unk_24E6CCD88;
  v11 = v6;
  v12 = v8;
  v9 = v6;
  dispatch_async(v7, v10);

}

uint64_t __48__PKNotification__interpretResult_responseDict___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (OS_dispatch_queue)resultQueue
{
  return self->_resultQueue;
}

- (void)setResultQueue:(id)a3
{
  self->_resultQueue = (OS_dispatch_queue *)a3;
}

- (id)resultHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setResultHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)endTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (PKNotifier)notifier
{
  return (PKNotifier *)objc_getProperty(self, a2, 48, 1);
}

- (int)kind
{
  return self->_kind;
}

- (NSString)headerString
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHeaderString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)messageString
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMessageString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)defaultButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDefaultButtonTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)alternateButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAlternateButtonTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_messageString, 0);
  objc_storeStrong((id *)&self->_headerString, 0);
  objc_storeStrong((id *)&self->_notifier, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong(&self->_resultHandler, 0);
}

@end
