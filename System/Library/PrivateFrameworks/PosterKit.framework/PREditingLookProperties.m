@implementation PREditingLookProperties

+ (PREditingLookProperties)allocWithZone:(_NSZone *)a3
{
  id v5;
  objc_super v7;

  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
    return (PREditingLookProperties *)+[PREditingLookProperties allocWithZone:](PRImmutableEditingLookProperties, "allocWithZone:", a3);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PREditingLookProperties;
  return (PREditingLookProperties *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

- (PREditingLookProperties)initWithTimeFontConfiguration:(id)a3 titlePosterColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  PRImmutableEditingLookProperties *v10;
  PREditingLookProperties *p_super;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PREditingLookProperties isMemberOfClass:](self, "isMemberOfClass:", v8);

  if (v9)
  {
    v10 = -[PRImmutableEditingLookProperties initWithTimeFontConfiguration:titlePosterColor:]([PRImmutableEditingLookProperties alloc], "initWithTimeFontConfiguration:titlePosterColor:", v6, v7);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PREditingLookProperties;
    v10 = -[PREditingLookProperties init](&v13, sel_init);
    self = &v10->super;
  }
  p_super = &v10->super;

  return p_super;
}

- (PREditingLookProperties)initWithProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PREditingLookProperties *v7;

  v4 = a3;
  objc_msgSend(v4, "timeFontConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titlePosterColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PREditingLookProperties initWithTimeFontConfiguration:titlePosterColor:](self, "initWithTimeFontConfiguration:titlePosterColor:", v5, v6);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PREditingLookProperties *v4;
  void *v5;
  char isKindOfClass;
  PREditingLookProperties *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (PREditingLookProperties *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PREditingLookProperties timeFontConfiguration](self, "timeFontConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditingLookProperties timeFontConfiguration](v7, "timeFontConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualObjects();

      if (v10)
      {
        -[PREditingLookProperties titlePosterColor](self, "titlePosterColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditingLookProperties titlePosterColor](v7, "titlePosterColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = BSEqualObjects();

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PREditingLookProperties timeFontConfiguration](self, "timeFontConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PREditingLookProperties titlePosterColor](self, "titlePosterColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PREditingLookProperties *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __38__PREditingLookProperties_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __38__PREditingLookProperties_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PREditingLookProperties initWithProperties:](+[PREditingLookProperties allocWithZone:](PRMutableEditingLookProperties, "allocWithZone:", a3), "initWithProperties:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[PREditingLookProperties timeFontConfiguration](self, "timeFontConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v8, "appendObject:withName:", v4, CFSTR("timeFontConfiguration"));

  -[PREditingLookProperties titlePosterColor](self, "titlePosterColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "appendObject:withName:", v6, CFSTR("titlePosterColor"));

}

@end
