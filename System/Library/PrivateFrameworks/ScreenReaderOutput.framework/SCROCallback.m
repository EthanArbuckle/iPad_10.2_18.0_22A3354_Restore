@implementation SCROCallback

- (SCROCallback)initWithKey:(int)a3 object:(id)a4
{
  id v7;
  SCROCallback *v8;
  SCROCallback *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SCROCallback;
  v8 = -[SCROCallback init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_key = a3;
    objc_storeStrong((id *)&v8->_object, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCROCallback)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  SCROCallback *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("_key"));
  if (initWithCoder__onceToken != -1)
    dispatch_once(&initWithCoder__onceToken, &__block_literal_global_5);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__classes, CFSTR("_object"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SCROCallback initWithKey:object:](self, "initWithKey:object:", v5, v6);

  return v7;
}

void __30__SCROCallback_initWithCoder___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[11];

  v4[10] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__classes;
  initWithCoder__classes = v2;

}

- (void)encodeWithCoder:(id)a3
{
  uint64_t key;
  id v5;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", key, CFSTR("_key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_object, CFSTR("_object"));

}

- (int)key
{
  return self->_key;
}

- (id)object
{
  return self->_object;
}

- (void)setIsAtomic:(BOOL)a3
{
  self->_isAtomic = a3;
}

- (BOOL)isAtomic
{
  return self->_isAtomic;
}

- (void)postToHandler:(id)a3
{
  objc_msgSend(a3, "performSelector:withObject:", sel_handleCallback_, self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
}

@end
