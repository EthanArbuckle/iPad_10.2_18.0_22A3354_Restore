@implementation TSDNoChangePrototypeChange

- (id)initNoChangePrototypeChangeForPrototype:(id)a3
{
  TSDNoChangePrototypeChange *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDNoChangePrototypeChange;
  v4 = -[TSDNoChangePrototypeChange init](&v6, sel_init);
  if (v4)
    v4->mPrototype = a3;
  return v4;
}

- (NSString)description
{
  return (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C60], "descriptionWithObject:class:format:", self, objc_opt_class(), CFSTR(": unchanged")), "descriptionString");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDNoChangePrototypeChange;
  -[TSDNoChangePrototypeChange dealloc](&v3, sel_dealloc);
}

- (BOOL)prototypeIsBeingModified
{
  return 0;
}

- (BOOL)prototypeIsBeingReplaced
{
  return 0;
}

- (BOOL)prototypeIsBeingDeleted
{
  return 0;
}

- (id)changedPropertySet
{
  return 0;
}

- (id)replacement
{
  return 0;
}

- (TSSPropertySource)propertiesBeforeChange
{
  TSSPropertySource *v3;
  void *v4;
  uint64_t v5;

  v3 = (TSSPropertySource *)TSUProtocolCast();
  if (!v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDNoChangePrototypeChange propertiesBeforeChange]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPrototypeChange.m"), 293, CFSTR("Tried to treat %@ as a property source when it's not"), self->mPrototype);
  }
  return v3;
}

- (BOOL)propertyIsChanging:(int)a3
{
  return 0;
}

- (BOOL)propertiesAreChanging:(id)a3
{
  return 0;
}

- (id)prototype
{
  return objc_getProperty(self, a2, 8, 1);
}

@end
