@implementation FedStatsCategoricalTypeSubcategory

- (FedStatsCategoricalTypeSubcategory)initWithSuperCategory:(id)a3 index:(unint64_t)a4
{
  id v7;
  FedStatsCategoricalTypeSubcategory *v8;
  FedStatsCategoricalTypeSubcategory *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FedStatsCategoricalTypeSubcategory;
  v8 = -[FedStatsCategoricalTypeSubcategory init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_superCategory, a3);
    v9->_index = a4;
  }

  return v9;
}

+ (id)categoryWithSuperCategory:(id)a3 index:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSuperCategory:index:", v6, a4);

  return v7;
}

- (NSString)superCategory
{
  return self->_superCategory;
}

- (unint64_t)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_superCategory, 0);
}

@end
