@implementation MTCSUpdateIndexRequest

- (MTCSUpdateIndexRequest)initWithReason:(id)a3 entityLoadingBlock:(id)a4 searchableIndex:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MTCSUpdateIndexRequest *v15;
  void *v16;
  uint64_t v17;
  NSString *identifier;
  id v19;
  id entityLoadingBlock;
  id v21;
  id completion;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MTCSUpdateIndexRequest;
  v15 = -[MTCSUpdateIndexRequest init](&v24, "init");
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v17;

    objc_storeStrong((id *)&v15->_reason, a3);
    v19 = objc_retainBlock(v12);
    entityLoadingBlock = v15->_entityLoadingBlock;
    v15->_entityLoadingBlock = v19;

    objc_storeStrong((id *)&v15->_searchableIndex, a5);
    v21 = objc_retainBlock(v14);
    completion = v15->_completion;
    v15->_completion = v21;

  }
  return v15;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCSUpdateIndexRequest reason](self, "reason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("'%@', id = %@"), v3, self->_identifier));

  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (CSSearchableIndex)searchableIndex
{
  return self->_searchableIndex;
}

- (id)entityLoadingBlock
{
  return self->_entityLoadingBlock;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_entityLoadingBlock, 0);
  objc_storeStrong((id *)&self->_searchableIndex, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
