@implementation SearchUICollectionViewRestorationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SearchUICollectionViewRestorationContext)initWithCoder:(id)a3
{
  id v4;
  SearchUICollectionViewRestorationContext *v5;
  uint64_t v6;
  NSIndexPath *lastSelectedIndexPath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUICollectionViewRestorationContext;
  v5 = -[SearchUICollectionViewRestorationContext init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastSelectedIndexPath"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastSelectedIndexPath = v5->_lastSelectedIndexPath;
    v5->_lastSelectedIndexPath = (NSIndexPath *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_lastSelectedIndexPath, CFSTR("lastSelectedIndexPath"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  -[SearchUICollectionViewRestorationContext lastSelectedIndexPath](self, "lastSelectedIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastSelectedIndexPath:", v5);

  return v4;
}

- (NSIndexPath)lastSelectedIndexPath
{
  return (NSIndexPath *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLastSelectedIndexPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
}

@end
