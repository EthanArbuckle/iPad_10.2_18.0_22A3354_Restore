@implementation SKMountParams

- (SKMountParams)init
{
  void *v3;
  SKMountParams *v4;

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SKMountParams initWithParams:](self, "initWithParams:", v3);

  return v4;
}

- (SKMountParams)initWithParams:(id)a3
{
  id v5;
  SKMountParams *v6;
  uint64_t v7;
  NSSet *allParams;
  NSURL *mountPoint;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKMountParams;
  v6 = -[SKMountParams init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    allParams = v6->_allParams;
    v6->_allParams = (NSSet *)v7;

    v6->_readOnly = objc_msgSend(v5, "containsObject:", CFSTR("rdonly"));
    v6->_noBrowse = objc_msgSend(v5, "containsObject:", CFSTR("nobrowse"));
    mountPoint = v6->_mountPoint;
    v6->_mountPoint = 0;

    objc_storeStrong((id *)&v6->_allParams, a3);
    *(_WORD *)&v6->_recursive = 257;
    v6->_raidTraverse = 1;
  }

  return v6;
}

- (id)dictionaryRepresentation
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
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x24BDAC8D0];
  -[SKMountParams allParams](self, "allParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[SKMountParams readOnly](self, "readOnly"))
    objc_msgSend(v4, "addObject:", CFSTR("rdonly"));
  if (-[SKMountParams noBrowse](self, "noBrowse"))
    objc_msgSend(v4, "addObject:", CFSTR("nobrowse"));
  v5 = (void *)MEMORY[0x24BDBCED8];
  v16[0] = CFSTR("kSKDiskMountOptionToolOptions");
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v16[1] = CFSTR("kSKDiskMountOptionRecursive");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKMountParams recursive](self, "recursive"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  v16[2] = CFSTR("kSKDiskMountOptionRecursiveRAID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKMountParams raidTraverse](self, "raidTraverse"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v8;
  v16[3] = CFSTR("kSKDiskMountOptionForce");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKMountParams force](self, "force"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = kSKDiskMountOptionWithoutEFI;
  v17[3] = v9;
  v17[4] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKMountParams mountPoint](self, "mountPoint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SKMountParams mountPoint](self, "mountPoint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("kSKDiskMountOptionMountPoint"));

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SKMountParams *v4;
  void *v5;
  SKMountParams *v6;
  void *v7;

  v4 = [SKMountParams alloc];
  -[SKMountParams allParams](self, "allParams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SKMountParams initWithParams:](v4, "initWithParams:", v5);

  -[SKMountParams mountPoint](self, "mountPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKMountParams setMountPoint:](v6, "setMountPoint:", v7);

  -[SKMountParams setRecursive:](v6, "setRecursive:", -[SKMountParams recursive](self, "recursive"));
  -[SKMountParams setForce:](v6, "setForce:", -[SKMountParams force](self, "force"));
  -[SKMountParams setRaidTraverse:](v6, "setRaidTraverse:", -[SKMountParams raidTraverse](self, "raidTraverse"));
  return v6;
}

- (id)redactedDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSUInteger v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSSet count](self->_allParams, "count");
  if (self->_mountPoint)
    v7 = MEMORY[0x24BDBD1C8];
  else
    v7 = MEMORY[0x24BDBD1C0];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { allParams: \"%lu\", mount point: \"%@\", recursive: %d, force: %d }>"), v5, v6, v7, self->_recursive, self->_force);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { allParams: \"%@\", mount point: \"%@\", recursive: %d, force: %d }>"), v5, self->_allParams, self->_mountPoint, self->_recursive, self->_force);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)noBrowse
{
  return self->_noBrowse;
}

- (void)setNoBrowse:(BOOL)a3
{
  self->_noBrowse = a3;
}

- (NSURL)mountPoint
{
  return self->_mountPoint;
}

- (void)setMountPoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)allParams
{
  return self->_allParams;
}

- (void)setAllParams:(id)a3
{
  objc_storeStrong((id *)&self->_allParams, a3);
}

- (BOOL)recursive
{
  return self->_recursive;
}

- (void)setRecursive:(BOOL)a3
{
  self->_recursive = a3;
}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (BOOL)raidTraverse
{
  return self->_raidTraverse;
}

- (void)setRaidTraverse:(BOOL)a3
{
  self->_raidTraverse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allParams, 0);
  objc_storeStrong((id *)&self->_mountPoint, 0);
}

@end
