@implementation PSIAsset

- (PSIAsset)initWithUUID:(id)a3 creationDate:(id)a4
{
  id v7;
  PSIAsset *v8;
  PSIAsset *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PSIAsset;
  v8 = -[PSIObject initWithUUID:](&v11, sel_initWithUUID_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_creationDate, a4);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSIAsset;
  v4 = -[PSIObject copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 5, self->_creationDate);
  return v4;
}

- (unint64_t)objectType
{
  return 0;
}

- (BOOL)isUpdate
{
  unint64_t propertySets;

  propertySets = self->_propertySets;
  return propertySets != 3 && propertySets != 0;
}

- (PSIDate)creationDate
{
  return (PSIDate *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)propertySets
{
  return self->_propertySets;
}

- (void)setPropertySets:(unint64_t)a3
{
  self->_propertySets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
