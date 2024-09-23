@implementation TSDPropertySourceForModifyPrototypeChange

- (TSDPropertySourceForModifyPrototypeChange)initWithPrototypeChange:(id)a3 afterChange:(BOOL)a4
{
  TSDPropertySourceForModifyPrototypeChange *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDPropertySourceForModifyPrototypeChange;
  result = -[TSDPropertySourceForModifyPrototypeChange init](&v7, sel_init);
  if (result)
  {
    result->mChange = (TSDModifyPrototypeChange *)a3;
    result->mAfterChange = a4;
  }
  return result;
}

- (id)p_propertyMap
{
  _BOOL4 mAfterChange;
  TSDModifyPrototypeChange *mChange;

  mAfterChange = self->mAfterChange;
  mChange = self->mChange;
  if (mAfterChange)
    return -[TSDModifyPrototypeChange changedPropertyMapAfterChange](mChange, "changedPropertyMapAfterChange");
  else
    return -[TSDModifyPrototypeChange changedPropertyMapBeforeChange](mChange, "changedPropertyMapBeforeChange");
}

- (BOOL)containsProperty:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[TSSPropertySet containsProperty:](-[TSDModifyPrototypeChange changedPropertySet](self->mChange, "changedPropertySet"), "containsProperty:", *(_QWORD *)&a3))
  {
    return 1;
  }
  else
  {
    return objc_msgSend(-[TSDModifyPrototypeChange prototype](self->mChange, "prototype"), "containsProperty:", v3);
  }
}

- (id)boxedObjectForProperty:(int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  if (-[TSSPropertySet containsProperty:](-[TSDModifyPrototypeChange changedPropertySet](self->mChange, "changedPropertySet"), "containsProperty:", *(_QWORD *)&a3))
  {
    v5 = -[TSDPropertySourceForModifyPrototypeChange p_propertyMap](self, "p_propertyMap");
  }
  else
  {
    v5 = -[TSDModifyPrototypeChange prototype](self->mChange, "prototype");
  }
  return (id)objc_msgSend(v5, "boxedObjectForProperty:", v3);
}

- (id)objectForProperty:(int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  if (-[TSSPropertySet containsProperty:](-[TSDModifyPrototypeChange changedPropertySet](self->mChange, "changedPropertySet"), "containsProperty:", *(_QWORD *)&a3))
  {
    v5 = -[TSDPropertySourceForModifyPrototypeChange p_propertyMap](self, "p_propertyMap");
  }
  else
  {
    v5 = -[TSDModifyPrototypeChange prototype](self->mChange, "prototype");
  }
  return (id)objc_msgSend(v5, "objectForProperty:", v3);
}

- (int)intValueForProperty:(int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  if (-[TSSPropertySet containsProperty:](-[TSDModifyPrototypeChange changedPropertySet](self->mChange, "changedPropertySet"), "containsProperty:", *(_QWORD *)&a3))
  {
    v5 = -[TSDPropertySourceForModifyPrototypeChange p_propertyMap](self, "p_propertyMap");
  }
  else
  {
    v5 = -[TSDModifyPrototypeChange prototype](self->mChange, "prototype");
  }
  return objc_msgSend(v5, "intValueForProperty:", v3);
}

- (float)floatValueForProperty:(int)a3
{
  uint64_t v3;
  id v5;
  float result;

  v3 = *(_QWORD *)&a3;
  if (-[TSSPropertySet containsProperty:](-[TSDModifyPrototypeChange changedPropertySet](self->mChange, "changedPropertySet"), "containsProperty:", *(_QWORD *)&a3))
  {
    v5 = -[TSDPropertySourceForModifyPrototypeChange p_propertyMap](self, "p_propertyMap");
  }
  else
  {
    v5 = -[TSDModifyPrototypeChange prototype](self->mChange, "prototype");
  }
  objc_msgSend(v5, "floatValueForProperty:", v3);
  return result;
}

- (double)doubleValueForProperty:(int)a3
{
  uint64_t v3;
  id v5;
  double result;

  v3 = *(_QWORD *)&a3;
  if (-[TSSPropertySet containsProperty:](-[TSDModifyPrototypeChange changedPropertySet](self->mChange, "changedPropertySet"), "containsProperty:", *(_QWORD *)&a3))
  {
    v5 = -[TSDPropertySourceForModifyPrototypeChange p_propertyMap](self, "p_propertyMap");
  }
  else
  {
    v5 = -[TSDModifyPrototypeChange prototype](self->mChange, "prototype");
  }
  objc_msgSend(v5, "doubleValueForProperty:", v3);
  return result;
}

- (double)CGFloatValueForProperty:(int)a3
{
  uint64_t v3;
  id v5;
  double result;

  v3 = *(_QWORD *)&a3;
  if (-[TSSPropertySet containsProperty:](-[TSDModifyPrototypeChange changedPropertySet](self->mChange, "changedPropertySet"), "containsProperty:", *(_QWORD *)&a3))
  {
    v5 = -[TSDPropertySourceForModifyPrototypeChange p_propertyMap](self, "p_propertyMap");
  }
  else
  {
    v5 = -[TSDModifyPrototypeChange prototype](self->mChange, "prototype");
  }
  objc_msgSend(v5, "CGFloatValueForProperty:", v3);
  return result;
}

@end
