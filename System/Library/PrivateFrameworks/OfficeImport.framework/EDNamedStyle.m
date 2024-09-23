@implementation EDNamedStyle

- (void)setName:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->mName != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mName, a3);
    v5 = v6;
  }

}

- (id)name
{
  return self->mName;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)EDNamedStyle;
  v5 = -[EDStyle copyWithZone:](&v10, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->mName, "copyWithZone:", a3);
    v7 = (void *)v5[12];
    v5[12] = v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDNamedStyle;
  -[EDStyle description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
}

@end
