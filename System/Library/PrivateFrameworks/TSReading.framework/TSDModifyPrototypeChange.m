@implementation TSDModifyPrototypeChange

- (id)initModifyPrototypeChangeForPrototype:(id)a3
{
  TSDModifyPrototypeChange *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDModifyPrototypeChange;
  v4 = -[TSDModifyPrototypeChange init](&v6, sel_init);
  if (v4)
  {
    v4->mChangedPropertySet = objc_alloc_init(TSSMutablePropertySet);
    v4->mPrototype = a3;
    v4->mChangedPropertyMapBeforeChange = objc_alloc_init(TSSPropertyMap);
    v4->mChangedPropertyMapAfterChange = objc_alloc_init(TSSPropertyMap);
    v4->mPropertiesWithOldValuesRecordedButNotNewValues = objc_alloc_init(TSSMutablePropertySet);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDModifyPrototypeChange;
  -[TSDModifyPrototypeChange dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C60], "descriptionWithObject:class:format:", self, objc_opt_class(), CFSTR(": changed properties"));
  if (-[TSDModifyPrototypeChange changedPropertySet](self, "changedPropertySet"))
    objc_msgSend(v3, "addField:value:", CFSTR("mChangedPropertySet"), -[TSSMutablePropertySet description](-[TSDModifyPrototypeChange changedPropertySet](self, "changedPropertySet"), "description"));
  return (NSString *)objc_msgSend(v3, "descriptionString");
}

- (BOOL)prototypeIsBeingModified
{
  return 1;
}

- (BOOL)prototypeIsBeingReplaced
{
  return 0;
}

- (BOOL)prototypeIsBeingDeleted
{
  return 0;
}

- (id)replacement
{
  return 0;
}

- (TSSPropertySource)propertiesBeforeChange
{
  void *v3;
  uint64_t v4;
  TSSPropertySource *result;

  -[TSDModifyPrototypeChange prototype](self, "prototype");
  if (!TSUProtocolCast())
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDModifyPrototypeChange propertiesBeforeChange]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPrototypeChange.m"), 202, CFSTR("Tried to treat %@ as a property source when it's not"), -[TSDModifyPrototypeChange prototype](self, "prototype"));
  }
  result = (TSSPropertySource *)self->mPropertySourceBeforeChange;
  if (!result)
  {
    result = -[TSDPropertySourceForModifyPrototypeChange initWithPrototypeChange:afterChange:]([TSDPropertySourceForModifyPrototypeChange alloc], "initWithPrototypeChange:afterChange:", self, 0);
    self->mPropertySourceBeforeChange = (TSDPropertySourceForModifyPrototypeChange *)result;
  }
  return result;
}

- (TSSPropertySource)propertiesAfterChange
{
  void *v3;
  uint64_t v4;
  TSSPropertySource *result;

  -[TSDModifyPrototypeChange prototype](self, "prototype");
  if (!TSUProtocolCast())
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDModifyPrototypeChange propertiesAfterChange]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPrototypeChange.m"), 216, CFSTR("Tried to treat %@ as a property source when it's not"), -[TSDModifyPrototypeChange prototype](self, "prototype"));
  }
  result = (TSSPropertySource *)self->mPropertySourceAfterChange;
  if (!result)
  {
    result = -[TSDPropertySourceForModifyPrototypeChange initWithPrototypeChange:afterChange:]([TSDPropertySourceForModifyPrototypeChange alloc], "initWithPrototypeChange:afterChange:", self, 1);
    self->mPropertySourceAfterChange = (TSDPropertySourceForModifyPrototypeChange *)result;
  }
  return result;
}

- (BOOL)propertyIsChanging:(int)a3
{
  return -[TSSPropertySet containsProperty:](self->mChangedPropertySet, "containsProperty:", *(_QWORD *)&a3);
}

- (BOOL)propertiesAreChanging:(id)a3
{
  return -[TSSPropertySet intersectsProperties:](self->mChangedPropertySet, "intersectsProperties:", a3);
}

- (id)prototype
{
  return objc_getProperty(self, a2, 8, 1);
}

- (TSSMutablePropertySet)changedPropertySet
{
  return (TSSMutablePropertySet *)objc_getProperty(self, a2, 16, 1);
}

- (TSSPropertyMap)changedPropertyMapBeforeChange
{
  return (TSSPropertyMap *)objc_getProperty(self, a2, 24, 1);
}

- (TSSPropertyMap)changedPropertyMapAfterChange
{
  return (TSSPropertyMap *)objc_getProperty(self, a2, 32, 1);
}

- (TSSMutablePropertySet)i_propertiesWithOldValuesRecordedButNotNewValues
{
  return (TSSMutablePropertySet *)objc_getProperty(self, a2, 56, 1);
}

@end
