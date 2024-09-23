@implementation ODDWhen

- (ODDWhen)init
{
  ODDWhen *v2;
  ODDIteratorSpecification *v3;
  ODDIteratorSpecification *mIteratorSpecification;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ODDWhen;
  v2 = -[ODDLayoutObjectList init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ODDIteratorSpecification);
    mIteratorSpecification = v2->mIteratorSpecification;
    v2->mIteratorSpecification = v3;

  }
  return v2;
}

- (id)iteratorSpecification
{
  return self->mIteratorSpecification;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ODDWhen;
  -[ODDLayoutObject description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mIteratorSpecification, 0);
}

@end
