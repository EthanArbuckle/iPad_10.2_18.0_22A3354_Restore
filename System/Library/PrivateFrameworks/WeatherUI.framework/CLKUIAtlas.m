@implementation CLKUIAtlas

- (CLKUIAtlas)initWithUuid:(id)a3
{
  id v5;
  CLKUIAtlas *v6;
  CLKUIAtlas *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKUIAtlas;
  v6 = -[CLKUIAtlas init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uuid, a3);
    v7->_status = 0;
  }

  return v7;
}

- (int64_t)instanceCount
{
  return (int)atomic_load((unsigned int *)&self->_instanceCount);
}

- (id)backing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[CLKUIResourceManager sharedInstance](CLKUIResourceManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateForUuid:", self->_uuid);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "provideAtlasBacking:", self->_uuid);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && !self->_status)
    {
      self->_status = 1;
      self->_width = objc_msgSend(v5, "width");
      self->_height = objc_msgSend(v6, "height");
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)incrementInstanceCount
{
  int *p_instanceCount;
  unsigned int v3;

  p_instanceCount = &self->_instanceCount;
  do
    v3 = __ldaxr((unsigned int *)p_instanceCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_instanceCount));
}

- (void)decrementInstanceCount
{
  int *p_instanceCount;
  unsigned int v3;

  p_instanceCount = &self->_instanceCount;
  do
    v3 = __ldaxr((unsigned int *)p_instanceCount);
  while (__stlxr(v3 - 1, (unsigned int *)p_instanceCount));
}

- (BOOL)isPurgable
{
  return -[CLKUIAtlas status](self, "status") == 2 || -[CLKUIAtlas status](self, "status") == 3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (double)boundTime
{
  return self->_boundTime;
}

- (void)setBoundTime:(double)a3
{
  self->_boundTime = a3;
}

- (unint64_t)memoryCost
{
  return self->_memoryCost;
}

- (void)setMemoryCost:(unint64_t)a3
{
  self->_memoryCost = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
