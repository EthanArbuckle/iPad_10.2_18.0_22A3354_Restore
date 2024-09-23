@implementation WQAShapeLayer

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)WQAShapeLayer;
  -[WQAShapeLayer description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WQAShapeLayer quickActionVisualsToken](self, "quickActionVisualsToken");
  -[WQAShapeLayer quickActionIdentifier](self, "quickActionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] token=%li, identifier=%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)quickActionIdentifier
{
  return self->_quickActionIdentifier;
}

- (void)setQuickActionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_quickActionIdentifier, a3);
}

- (int64_t)quickActionVisualsToken
{
  return self->_quickActionVisualsToken;
}

- (void)setQuickActionVisualsToken:(int64_t)a3
{
  self->_quickActionVisualsToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickActionIdentifier, 0);
}

@end
