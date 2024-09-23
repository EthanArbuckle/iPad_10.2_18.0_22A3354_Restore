@implementation VSRecognitionResult

- (VSRecognitionResult)init
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  return a3 && CFEqual(self, a3) != 0;
}

- (VSRecognitionResult)retain
{
  CFRetain(self);
  return self;
}

- (id)recognitionResultByReplacingValueForClassIdentifier:(id)a3 withValue:(id)a4
{
  Class isa;
  Class v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  Class v17;
  void *v18;
  VSRecognitionResult *v20;

  isa = self[2].super.isa;
  CFRetain(isa);
  v8 = self[3].super.isa;
  CFRetain(v8);
  v9 = -[objc_class count](isa, "count");
  v10 = -[objc_class count](v8, "count") != v9 || v9 < 1;
  v20 = self;
  if (!v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    while (1)
    {
      if (objc_msgSend((id)-[objc_class objectAtIndex:](isa, "objectAtIndex:", v12), "isEqualToString:", a3))
      {
        if (v14)
        {
          if (!a4)
            goto LABEL_12;
        }
        else
        {
          v14 = (void *)-[objc_class mutableCopy](v8, "mutableCopy");
          if (!a4)
          {
LABEL_12:
            if (!v13)
              v13 = (void *)-[objc_class mutableCopy](isa, "mutableCopy");
            objc_msgSend(v13, "removeObjectAtIndex:", v12 - v11);
            objc_msgSend(v14, "removeObjectAtIndex:", v12 - v11++);
            goto LABEL_15;
          }
        }
        objc_msgSend(v14, "replaceObjectAtIndex:withObject:", v12, a4);
      }
LABEL_15:
      if (v9 == ++v12)
        goto LABEL_16;
    }
  }
  v14 = 0;
  v13 = 0;
LABEL_16:

  if (!v14)
    return v20;
  v15 = (void *)objc_opt_class();
  v16 = -[VSRecognitionResult modelIdentifier](v20, "modelIdentifier");
  if (v13)
    v17 = (Class)v13;
  else
    v17 = isa;
  v18 = (void *)objc_msgSend(v15, "recognitionResultWithModelIdentifier:classIdentifiers:values:", v16, v17, v14);

  return v18;
}

- (id)modelIdentifier
{
  return self[4].super.isa;
}

- (int64_t)elementCount
{
  int64_t result;

  result = (int64_t)self[3].super.isa;
  if (result)
    return CFArrayGetCount((CFArrayRef)result);
  return result;
}

- (BOOL)getElementClassIdentifier:(id *)a3 value:(id *)a4 atIndex:(int64_t)a5
{
  VSRecognitionResultGetPhraseAtIndex((uint64_t)self, a5, (const __CFArray **)a3, (const __CFArray **)a4);
  if (a3 && !*a3)
    return 0;
  if (a4)
    return *a4 != 0;
  return 1;
}

- (id)valueOfFirstElementWithClassIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  void *v10;
  id v11;

  v5 = -[VSRecognitionResult elementCount](self, "elementCount");
  if (v5 >= 1)
  {
    v6 = v5;
    v10 = 0;
    v11 = 0;
    v7 = 1;
    while (1)
    {
      if (-[VSRecognitionResult getElementClassIdentifier:value:atIndex:](self, "getElementClassIdentifier:value:atIndex:", &v11, &v10, v7 - 1))
      {
        if (objc_msgSend(v11, "isEqualToString:", a3))
          result = v10;
        else
          result = 0;
        if (result)
          return result;
      }
      else
      {
        result = 0;
      }
      if (v7++ >= v6)
        return result;
    }
  }
  return 0;
}

- (id)createHandler
{
  const __CFString *isa;
  void *v3;
  Class v4;
  objc_class *v5;
  NSString *aClassName;
  CFTypeRef cf;

  isa = (const __CFString *)self[5].super.isa;
  if (!isa)
    return 0;
  aClassName = 0;
  cf = 0;
  if (!VSRecognitionPluginStringCopyInfo(isa, (CFURLRef *)&cf, (CFStringRef *)&aClassName))
    return 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", objc_msgSend((id)cf, "path"));
  if (!v3)
    goto LABEL_10;
  objc_msgSend(v3, "load");
  v4 = NSClassFromString(aClassName);
  v5 = v4;
  if (v4)
  {
    if (-[objc_class conformsToProtocol:](v4, "conformsToProtocol:", &unk_1F0444418)
      && ((-[objc_class instancesRespondToSelector:](v5, "instancesRespondToSelector:", sel_actionForRecognitionResult_) & 1) != 0
       || -[objc_class instancesRespondToSelector:](v5, "instancesRespondToSelector:", sel_actionForRecognitionResults_)))
    {
      v5 = (objc_class *)objc_alloc_init(v5);
      goto LABEL_11;
    }
LABEL_10:
    v5 = 0;
  }
LABEL_11:
  if (cf)
    CFRelease(cf);
  if (aClassName)
    CFRelease(aClassName);
  return v5;
}

- (void)setRecognitionAction:(id)a3
{
  self[6].super.isa = (Class)a3;
}

- (id)recognitionAction
{
  return self[6].super.isa;
}

- (id)description
{
  return (id)(id)CFCopyDescription(self);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    pthread_once(&VSRecognitionResultGetTypeID___VSRecognitionResultRegisterOnce, (void (*)(void))_VSRecognitionResultRegisterClass);
}

+ (id)recognitionResultWithModelIdentifier:(id)a3 classIdentifiers:(id)a4 values:(id)a5
{
  return VSRecognitionResultCreateWithHandlerInfo(*MEMORY[0x1E0C9AE00], a3, a4, (CFArrayRef)a5, 0);
}

@end
