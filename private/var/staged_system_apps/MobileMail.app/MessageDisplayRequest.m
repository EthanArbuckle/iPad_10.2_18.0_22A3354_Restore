@implementation MessageDisplayRequest

- (MessageDisplayRequest)initWithMessage:(id)a3
{
  return -[MessageDisplayRequest initWithMessage:completion:firstPaintCompletion:](self, "initWithMessage:completion:firstPaintCompletion:", a3, 0, 0);
}

- (MessageDisplayRequest)initWithMessage:(id)a3 completion:(id)a4 firstPaintCompletion:(id)a5
{
  id v7;
  MessageDisplayRequest *v8;
  MessageDisplayRequest *v9;
  EFPromise *v10;
  EFPromise *startPromise;
  EFPromise *v12;
  EFPromise *finishPromise;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MessageDisplayRequest;
  v8 = -[MessageDisplayRequest init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_message, a3);
    v10 = (EFPromise *)objc_alloc_init((Class)EFPromise);
    startPromise = v9->_startPromise;
    v9->_startPromise = v10;

    v12 = (EFPromise *)objc_alloc_init((Class)EFPromise);
    finishPromise = v9->_finishPromise;
    v9->_finishPromise = v12;

    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (void)didBeginProcessingRequest
{
  os_unfair_lock_s *p_lock;
  EFPromise *startPromise;
  id v5;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_hasStarted)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_hasStarted = 1;
    os_unfair_lock_unlock(p_lock);
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "_messageViewDidFinishFirstPaint:", MFMessageContentViewDidFinishFirstPaint, 0);

    startPromise = self->_startPromise;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    -[EFPromise finishWithResult:](startPromise, "finishWithResult:");

  }
}

- (void)requestAbortedWithError:(id)a3
{
  _BOOL4 hasStarted;
  _BOOL4 hasFinished;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  hasStarted = self->_hasStarted;
  if (!self->_hasStarted)
    self->_hasStarted = 1;
  hasFinished = self->_hasFinished;
  if (!self->_hasFinished)
    self->_hasFinished = 1;
  os_unfair_lock_unlock(&self->_lock);
  if (!hasStarted)
    -[EFPromise finishWithError:](self->_startPromise, "finishWithError:", v6);
  if (!hasFinished)
    -[EFPromise finishWithError:](self->_finishPromise, "finishWithError:", v6);

}

- (EFFuture)startFuture
{
  return (EFFuture *)-[EFPromise future](self->_startPromise, "future");
}

- (EFFuture)finishFuture
{
  return (EFFuture *)-[EFPromise future](self->_finishPromise, "future");
}

- (void)_messageViewDidFinishFirstPaint:(id)a3
{
  _BOOL4 hasFinished;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  EFPromise *finishPromise;
  void *v15;
  id v16;

  v16 = a3;
  os_unfair_lock_lock(&self->_lock);
  hasFinished = self->_hasFinished;
  os_unfair_lock_unlock(&self->_lock);
  v5 = v16;
  if (!hasFinished)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", MFMessageContentViewDidFinishFirstPaintMessageKey));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageDisplayRequest message](self, "message"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemID"));
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (v11)
    {
      os_unfair_lock_lock(&self->_lock);
      if (self->_hasFinished)
      {
        os_unfair_lock_unlock(&self->_lock);
      }
      else
      {
        self->_hasFinished = 1;
        os_unfair_lock_unlock(&self->_lock);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v12, "removeObserver:name:object:", self, MFMessageContentViewDidFinishFirstPaint, 0);

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", MFMessageContentViewDidFinishFirstPaintErrorKey));
        finishPromise = self->_finishPromise;
        if (v13)
        {
          -[EFPromise finishWithError:](finishPromise, "finishWithError:", v13);
        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          -[EFPromise finishWithResult:](finishPromise, "finishWithResult:", v15);

        }
      }
    }

    v5 = v16;
  }

}

- (EMMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (EFPromise)startPromise
{
  return self->_startPromise;
}

- (void)setStartPromise:(id)a3
{
  objc_storeStrong((id *)&self->_startPromise, a3);
}

- (EFPromise)finishPromise
{
  return self->_finishPromise;
}

- (void)setFinishPromise:(id)a3
{
  objc_storeStrong((id *)&self->_finishPromise, a3);
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (BOOL)hasFinished
{
  return self->_hasFinished;
}

- (void)setHasFinished:(BOOL)a3
{
  self->_hasFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishPromise, 0);
  objc_storeStrong((id *)&self->_startPromise, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
