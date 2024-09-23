@implementation PPLabelStrengthSets

- (PPLabelStrengthSets)initWithWeakSet:(id)a3 strongSet:(id)a4
{
  id v7;
  id v8;
  PPLabelStrengthSets *v9;
  PPLabelStrengthSets *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPLabelStrengthSets;
  v9 = -[PPLabelStrengthSets init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_weak, a3);
    objc_storeStrong((id *)&v10->_strong, a4);
  }

  return v10;
}

- (NSSet)weak
{
  return self->_weak;
}

- (NSSet)strong
{
  return self->_strong;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strong, 0);
  objc_storeStrong((id *)&self->_weak, 0);
}

+ (id)labelStrengthSetsWithWeakSet:(id)a3 strongSet:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWeakSet:strongSet:", v7, v6);

  return v8;
}

@end
