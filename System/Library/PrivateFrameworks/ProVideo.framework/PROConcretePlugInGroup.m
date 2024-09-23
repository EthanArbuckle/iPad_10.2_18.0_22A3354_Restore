@implementation PROConcretePlugInGroup

- (PROConcretePlugInGroup)initWithUUID:(__CFUUID *)a3 name:(id)a4 bundle:(id)a5
{
  PROConcretePlugInGroup *v8;
  PROConcretePlugInGroup *v9;
  uint64_t v10;
  uint64_t v11;
  PROConcretePlugInGroup *v12;
  objc_super v14;

  if (a3 && a4 && a5)
  {
    v14.receiver = self;
    v14.super_class = (Class)PROConcretePlugInGroup;
    v8 = -[PROConcretePlugInGroup init](&v14, sel_init);
    v9 = v8;
    if (v8)
    {
      v10 = -[PROConcretePlugInGroup zone](v8, "zone");
      v9->uuidRef = (__CFUUID *)CFRetain(a3);
      v11 = objc_msgSend(a4, "copy");
      v9->name = (NSString *)v11;
      v9->displayName = (NSString *)objc_msgSend((id)objc_msgSend(a5, "localizedStringForKey:value:table:", v11, 0, 0), "copy");
      v9->plugIns = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", v10), "init");
      v9->protocols = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", v10), "init");
      v9->mutex = (NSLock *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3740], "allocWithZone:", v10), "init");
    }
  }
  else
  {
    v12 = self;
    return 0;
  }
  return v9;
}

- (void)dealloc
{
  __CFUUID *uuidRef;
  objc_super v4;

  uuidRef = self->uuidRef;
  if (uuidRef)
    CFRelease(uuidRef);

  -[NSLock lock](self->mutex, "lock");
  v4.receiver = self;
  v4.super_class = (Class)PROConcretePlugInGroup;
  -[PROConcretePlugInGroup dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqualToPlugInGroup:(id)a3
{
  __CFUUID *uuidRef;

  uuidRef = self->uuidRef;
  return uuidRef == (__CFUUID *)objc_msgSend(a3, "uuid");
}

- (BOOL)isEqual:(id)a3
{
  objc_super v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[PROConcretePlugInGroup isEqualToPlugInGroup:](self, "isEqualToPlugInGroup:", a3);
  v6.receiver = self;
  v6.super_class = (Class)PROConcretePlugInGroup;
  return -[PROConcretePlugInGroup isEqual:](&v6, sel_isEqual_, a3);
}

- (unint64_t)hash
{
  return (unint64_t)self->uuidRef >> 2;
}

- (void)addPlugIn:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil argument '%s' to method '%@'"), "plugIn", NSStringFromSelector(a2));
  -[NSLock lock](self->mutex, "lock");
  objc_msgSend((id)-[PROConcretePlugInGroup mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("plugIns")), "addObject:", a3);
  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "implementedProtocols"), "objectEnumerator");
  v6 = objc_msgSend(v5, "nextObject");
  if (v6)
  {
    v7 = v6;
    do
    {
      -[NSMutableDictionary addObject:toSetForKey:](self->protocols, "addObject:toSetForKey:", a3, v7);
      v7 = objc_msgSend(v5, "nextObject");
    }
    while (v7);
  }
  -[NSLock unlock](self->mutex, "unlock");
}

- (void)removePlugIn:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil argument '%s' to method '%@'"), "plugIn", NSStringFromSelector(a2));
  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "implementedProtocols"), "objectEnumerator");
  -[NSLock lock](self->mutex, "lock");
  v6 = objc_msgSend(v5, "nextObject");
  if (v6)
  {
    v7 = v6;
    do
    {
      -[NSMutableDictionary removeObject:fromSetForKey:](self->protocols, "removeObject:fromSetForKey:", a3, v7);
      v7 = objc_msgSend(v5, "nextObject");
    }
    while (v7);
  }
  objc_msgSend((id)-[PROConcretePlugInGroup mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("plugIns"), v7), "removeObject:", a3);
  -[NSLock unlock](self->mutex, "unlock");
}

- (id)name
{
  return self->name;
}

- (id)displayName
{
  return self->displayName;
}

- (id)plugIns
{
  return self->plugIns;
}

- (__CFUUID)uuid
{
  return self->uuidRef;
}

- (id)uuidString
{
  return (id)(id)CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], self->uuidRef);
}

- (id)description
{
  __CFString *v3;
  void *v4;

  v3 = (__CFString *)CFUUIDCreateString(0, self->uuidRef);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Group: %@\n\tUUID: %@\n\tPlugins: %@\n\tProtocols: %@"), -[PROConcretePlugInGroup displayName](self, "displayName"), v3, self->plugIns, self->protocols);

  return v4;
}

- (id)plugInsForProtocols:(id)a3
{
  return -[NSMutableDictionary objectsInAllSetsForKeys:](self->protocols, "objectsInAllSetsForKeys:", a3);
}

@end
