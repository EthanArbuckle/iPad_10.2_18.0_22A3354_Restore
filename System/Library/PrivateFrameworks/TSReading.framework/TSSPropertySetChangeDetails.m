@implementation TSSPropertySetChangeDetails

- (TSSPropertySetChangeDetails)initWithChangedProperties:(id)a3
{
  TSSPropertySetChangeDetails *v4;
  TSSMutablePropertySet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSSPropertySetChangeDetails;
  v4 = -[TSSPropertySetChangeDetails init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (TSSMutablePropertySet *)objc_msgSend(a3, "mutableCopy");
    else
      v5 = objc_alloc_init(TSSMutablePropertySet);
    v4->mChangedProperties = v5;
  }
  return v4;
}

- (TSSPropertySetChangeDetails)init
{
  return -[TSSPropertySetChangeDetails initWithChangedProperties:](self, "initWithChangedProperties:", 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSSPropertySetChangeDetails;
  -[TSSPropertySetChangeDetails dealloc](&v3, sel_dealloc);
}

- (void)addChangedProperty:(int)a3
{
  -[TSSMutablePropertySet addProperty:](self->mChangedProperties, "addProperty:", *(_QWORD *)&a3);
}

- (void)addChangedProperties:(id)a3
{
  -[TSSMutablePropertySet addProperties:](self->mChangedProperties, "addProperties:", a3);
}

- (id)changedProperties
{
  return self->mChangedProperties;
}

@end
