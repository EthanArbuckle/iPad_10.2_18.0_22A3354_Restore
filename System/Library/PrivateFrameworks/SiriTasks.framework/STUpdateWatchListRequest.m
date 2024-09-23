@implementation STUpdateWatchListRequest

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUpdateWatchListRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentIdentifiersToAdd, CFSTR("_contentIdentifiersToAdd"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentIdentifiersToRemove, CFSTR("_contentIdentifiersToRemove"));

}

- (STUpdateWatchListRequest)initWithCoder:(id)a3
{
  id v4;
  STUpdateWatchListRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *contentIdentifiersToAdd;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *contentIdentifiersToRemove;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STUpdateWatchListRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_contentIdentifiersToAdd"));
    v9 = objc_claimAutoreleasedReturnValue();
    contentIdentifiersToAdd = v5->_contentIdentifiersToAdd;
    v5->_contentIdentifiersToAdd = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("_contentIdentifiersToRemove"));
    v14 = objc_claimAutoreleasedReturnValue();
    contentIdentifiersToRemove = v5->_contentIdentifiersToRemove;
    v5->_contentIdentifiersToRemove = (NSArray *)v14;

  }
  return v5;
}

- (NSArray)contentIdentifiersToAdd
{
  return self->_contentIdentifiersToAdd;
}

- (void)_setContentIdentifiersToAdd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)contentIdentifiersToRemove
{
  return self->_contentIdentifiersToRemove;
}

- (void)_setContentIdentifiersToRemove:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentIdentifiersToRemove, 0);
  objc_storeStrong((id *)&self->_contentIdentifiersToAdd, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
