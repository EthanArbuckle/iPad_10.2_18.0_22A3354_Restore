@implementation TSDReplaceDeletePrototypeChange

- (id)initReplacePrototypeChangeForPrototype:(id)a3 toReplacement:(id)a4
{
  TSDReplaceDeletePrototypeChange *v6;
  TSDReplaceDeletePrototypeChange *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDReplaceDeletePrototypeChange;
  v6 = -[TSDReplaceDeletePrototypeChange init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->mPrototypeIsBeingReplaced = 1;
    v6->mPrototype = a3;
    v7->mReplacement = a4;
  }
  return v7;
}

- (id)initDeletePrototypeChangeForPrototype:(id)a3 replacement:(id)a4
{
  TSDReplaceDeletePrototypeChange *v6;
  TSDReplaceDeletePrototypeChange *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDReplaceDeletePrototypeChange;
  v6 = -[TSDReplaceDeletePrototypeChange init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->mPrototypeIsBeingDeleted = 1;
    v6->mPrototypeIsBeingReplaced = a4 != 0;
    v6->mPrototype = a3;
    v7->mReplacement = a4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDReplaceDeletePrototypeChange;
  -[TSDReplaceDeletePrototypeChange dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v10;

  v3 = -[TSDReplaceDeletePrototypeChange prototypeIsBeingReplaced](self, "prototypeIsBeingReplaced");
  v4 = (void *)MEMORY[0x24BEB3C60];
  v5 = objc_opt_class();
  if (v3)
    v6 = objc_msgSend(v4, "descriptionWithObject:class:format:", self, v5, CFSTR(": replaced with %p"), -[TSDReplaceDeletePrototypeChange replacement](self, "replacement"));
  else
    v6 = objc_msgSend(v4, "descriptionWithObject:class:format:", self, v5, CFSTR(": unchanged"), v10);
  v7 = (void *)v6;
  if (-[TSDReplaceDeletePrototypeChange prototypeIsBeingDeleted](self, "prototypeIsBeingDeleted"))
  {
    if (-[TSDReplaceDeletePrototypeChange prototypeIsBeingDeleted](self, "prototypeIsBeingDeleted"))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    objc_msgSend(v7, "addField:value:", CFSTR("prototypeIsBeingDeleted"), v8);
  }
  return (NSString *)objc_msgSend(v7, "descriptionString");
}

- (BOOL)prototypeIsBeingModified
{
  return 0;
}

- (id)changedPropertySet
{
  return 0;
}

- (TSSPropertySource)propertiesBeforeChange
{
  TSSPropertySource *v3;
  void *v4;
  uint64_t v5;

  -[TSDReplaceDeletePrototypeChange prototype](self, "prototype");
  v3 = (TSSPropertySource *)TSUProtocolCast();
  if (!v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDReplaceDeletePrototypeChange propertiesBeforeChange]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPrototypeChange.m"), 98, CFSTR("Tried to treat %@ as a property source when it's not"), -[TSDReplaceDeletePrototypeChange prototype](self, "prototype"));
  }
  return v3;
}

- (TSSPropertySource)propertiesAfterChange
{
  void *v3;
  uint64_t v4;
  TSSPropertySource *result;
  void *v6;
  uint64_t v7;

  if (-[TSDReplaceDeletePrototypeChange prototypeIsBeingDeleted](self, "prototypeIsBeingDeleted"))
  {
    if (!-[TSDReplaceDeletePrototypeChange prototypeIsBeingReplaced](self, "prototypeIsBeingReplaced"))
    {
      v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDReplaceDeletePrototypeChange propertiesAfterChange]");
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPrototypeChange.m"), 104, CFSTR("%@ is being deleted, but we're calling -newProperties on a prototypeChange for it."), -[TSDReplaceDeletePrototypeChange prototype](self, "prototype"));
    }
  }
  if (-[TSDReplaceDeletePrototypeChange prototypeIsBeingReplaced](self, "prototypeIsBeingReplaced"))
  {
    -[TSDReplaceDeletePrototypeChange replacement](self, "replacement");
    result = (TSSPropertySource *)TSUProtocolCast();
    if (result)
      return result;
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDReplaceDeletePrototypeChange propertiesAfterChange]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPrototypeChange.m"), 107, CFSTR("Tried to treat %@ as a property source when it's not"), -[TSDReplaceDeletePrototypeChange replacement](self, "replacement"));
  }
  return 0;
}

- (BOOL)propertyIsChanging:(int)a3
{
  return 1;
}

- (BOOL)propertiesAreChanging:(id)a3
{
  return 1;
}

- (BOOL)prototypeIsBeingReplaced
{
  return self->mPrototypeIsBeingReplaced;
}

- (BOOL)prototypeIsBeingDeleted
{
  return self->mPrototypeIsBeingDeleted;
}

- (id)replacement
{
  return objc_getProperty(self, a2, 16, 1);
}

- (id)prototype
{
  return objc_getProperty(self, a2, 24, 1);
}

@end
