@implementation PDAnimationShapeTarget

- (PDAnimationShapeTarget)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDAnimationShapeTarget;
  return -[PDAnimationShapeTarget init](&v3, sel_init);
}

- (void)setDrawable:(id)a3
{
  objc_storeStrong((id *)&self->mDrawable, a3);
}

- (id)drawable
{
  return self->mDrawable;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PDAnimationShapeTarget drawable](self, "drawable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PDAnimationShapeTarget drawable](self, "drawable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "drawable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDrawable, 0);
}

@end
