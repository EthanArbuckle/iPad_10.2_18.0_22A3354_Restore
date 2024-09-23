@implementation TVBackgroundMediaInfo

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)TVBackgroundMediaInfo,
        -[TVMediaInfo isEqual:](&v9, sel_isEqual_, v4)))
  {
    -[TVBackgroundMediaInfo playerBridge](self, "playerBridge");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playerBridge");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TVBackgroundMediaInfo;
  v4 = -[TVMediaInfo copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[TVBackgroundMediaInfo playerBridge](self, "playerBridge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlayerBridge:", v5);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)TVBackgroundMediaInfo;
  -[TVMediaInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVBackgroundMediaInfo playerBridge](self, "playerBridge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, bridge = %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (IKAppPlayerBridge)playerBridge
{
  return self->_playerBridge;
}

- (void)setPlayerBridge:(id)a3
{
  objc_storeStrong((id *)&self->_playerBridge, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerBridge, 0);
}

@end
