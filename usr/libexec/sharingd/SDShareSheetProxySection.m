@implementation SDShareSheetProxySection

- (SDShareSheetProxySection)initWithType:(int64_t)a3 proxies:(id)a4
{
  id v6;
  SDShareSheetProxySection *v7;
  SDShareSheetProxySection *v8;
  NSArray *v9;
  NSArray *proxies;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SDShareSheetProxySection;
  v7 = -[SDShareSheetProxySection init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = (NSArray *)objc_msgSend(v6, "copy");
    proxies = v8->_proxies;
    v8->_proxies = v9;

  }
  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  unint64_t type;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SDShareSheetProxySection;
  v3 = -[SDShareSheetProxySection description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  type = self->_type;
  if (type > 2)
    v6 = 0;
  else
    v6 = (uint64_t)*(&off_100717DC0 + type);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ type:%@ initialBatchSize:%ld proxiesCount:%lu"), v4, v6, self->_initialBatchSize, -[NSArray count](self->_proxies, "count")));

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)proxies
{
  return self->_proxies;
}

- (unint64_t)initialBatchSize
{
  return self->_initialBatchSize;
}

- (void)setInitialBatchSize:(unint64_t)a3
{
  self->_initialBatchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxies, 0);
}

@end
