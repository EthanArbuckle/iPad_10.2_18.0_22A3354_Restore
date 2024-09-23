@implementation PSWeakReference

+ (id)weakReferenceWithObject:(id)a3
{
  id v3;
  PSWeakReference *v4;

  v3 = a3;
  v4 = -[PSWeakReference initWithObject:]([PSWeakReference alloc], "initWithObject:", v3);

  return v4;
}

- (PSWeakReference)initWithObject:(id)a3
{
  id v4;
  PSWeakReference *v5;
  PSWeakReference *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PSWeakReference;
  v5 = -[PSWeakReference init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_location, v4);

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PSWeakReference object](self, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)object
{
  return objc_loadWeakRetained(&self->_location);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[PSWeakReference object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithObject:", v5);

  return v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  const char *Name;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSWeakReference;
  -[PSWeakReference forwardingTargetForSelector:](&v8, sel_forwardingTargetForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[PSWeakReference object](self, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    Name = sel_getName(a3);
    NSLog(CFSTR("########### Warning: PSWeakReference sent an unrecognized selector %s. This is likely because it is used directly instead of accessing its object. Attempting to recover by forwarding to target %@"), Name, v5);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  char v6;

  v4 = a3;
  -[PSWeakReference object](self, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
    v6 = 1;
  else
    v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_location);
}

@end
