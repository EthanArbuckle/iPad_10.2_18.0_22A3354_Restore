@implementation PXGFocusGuideViewConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[PXGFocusGuideViewConfiguration preferredFocusEnvironments](self, "preferredFocusEnvironments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXGFocusGuideViewConfiguration preferredFocusEnvironments](self, "preferredFocusEnvironments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PXGFocusGuideViewConfiguration *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (PXGFocusGuideViewConfiguration *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PXGFocusGuideViewConfiguration preferredFocusEnvironments](v4, "preferredFocusEnvironments");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGFocusGuideViewConfiguration preferredFocusEnvironments](self, "preferredFocusEnvironments");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSArray)preferredFocusEnvironments
{
  return self->_preferredFocusEnvironments;
}

- (void)setPreferredFocusEnvironments:(id)a3
{
  objc_storeStrong((id *)&self->_preferredFocusEnvironments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredFocusEnvironments, 0);
}

@end
