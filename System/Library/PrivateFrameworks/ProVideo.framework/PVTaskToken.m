@implementation PVTaskToken

- (void)returnToPool
{
  void *v3;
  id v4;

  -[PVTaskToken pool](self, "pool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PVTaskToken pool](self, "pool");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "returnToken:", self);

  }
}

- (PVTaskToken)initWithPool:(id)a3 tokenId:(unint64_t)a4
{
  id v6;
  PVTaskToken *v7;
  PVTaskToken *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PVTaskToken;
  v7 = -[PVTaskToken init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_pool, v6);
    v8->_tokenId = a4;
    -[PVTaskToken setReturned:](v8, "setReturned:", 0);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  if (!-[PVTaskToken returned](self, "returned"))
    -[PVTaskToken returnToPool](self, "returnToPool");
  v3.receiver = self;
  v3.super_class = (Class)PVTaskToken;
  -[PVTaskToken dealloc](&v3, sel_dealloc);
}

- (PVTaskTokenPool)pool
{
  return (PVTaskTokenPool *)objc_loadWeakRetained((id *)&self->_pool);
}

- (unint64_t)tokenId
{
  return self->_tokenId;
}

- (BOOL)returned
{
  return self->_returned;
}

- (void)setReturned:(BOOL)a3
{
  self->_returned = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pool);
}

@end
