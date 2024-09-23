@implementation SYActivityObserverContext

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  _BOOL8 needsCacheUpdate;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  needsCacheUpdate = self->_needsCacheUpdate;
  v5 = a3;
  objc_msgSend(v3, "numberWithBool:", needsCacheUpdate);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("NeedsCacheUpdate"));

}

- (void)setNeedsCacheUpdate:(BOOL)a3
{
  self->_needsCacheUpdate = a3;
}

- (BOOL)needsCacheUpdate
{
  return self->_needsCacheUpdate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SYActivityObserverContext)initWithCoder:(id)a3
{
  id v4;
  SYActivityObserverContext *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SYActivityObserverContext;
  v5 = -[SYActivityObserverContext init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NeedsCacheUpdate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_needsCacheUpdate = objc_msgSend(v6, "BOOLValue");

  }
  return v5;
}

@end
