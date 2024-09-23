@implementation PKDisplayProfile

- (PKDisplayProfile)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDisplayProfile;
  return -[PKDisplayProfile init](&v4, sel_init, a3);
}

+ (id)displayProfileOfType:(int64_t)a3 withDictionary:(id)a4 bundle:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  void *v11;

  v8 = a4;
  v9 = a5;
  v10 = (objc_class *)objc_msgSend(a1, "classForDisplayProfileType:", a3);
  if (v10)
    v11 = (void *)objc_msgSend([v10 alloc], "initWithDictionary:bundle:", v8, v9);
  else
    v11 = 0;

  return v11;
}

- (PKDisplayProfile)initWithDictionary:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDisplayProfile;
  return -[PKDisplayProfile init](&v5, sel_init, a3, a4);
}

+ (Class)classForDisplayProfileType:(int64_t)a3
{
  void *v3;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

@end
