@implementation SCRCThreadKey

+ (void)initialize
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BDD1648]);
  v3 = (void *)_ThreadKeyLock;
  _ThreadKeyLock = (uint64_t)v2;

  _ThreadIDs = (uint64_t)CFArrayCreateMutable(0, 0, 0);
}

- (id)_initWithThreadID:(unint64_t)a3 description:(id)a4
{
  id v6;
  SCRCThreadKey *v7;
  SCRCThreadKey *v8;
  uint64_t v9;
  NSString *threadDescription;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCRCThreadKey;
  v7 = -[SCRCThreadKey init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_threadID = a3;
    v9 = objc_msgSend(v6, "copy");
    threadDescription = v8->_threadDescription;
    v8->_threadDescription = (NSString *)v9;

    objc_msgSend((id)_ThreadKeyLock, "lock");
    CFArrayAppendValue((CFMutableArrayRef)_ThreadIDs, (const void *)v8->_threadID);
    objc_msgSend((id)_ThreadKeyLock, "unlock");
  }

  return v8;
}

- (SCRCThreadKey)init
{
  SCRCThreadKey *v2;
  int v3;
  objc_super v5;
  CFRange v6;

  v5.receiver = self;
  v5.super_class = (Class)SCRCThreadKey;
  v2 = -[SCRCThreadKey init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend((id)_ThreadKeyLock, "lock");
    v3 = 100000;
    while (1)
    {
      v6.length = CFArrayGetCount((CFArrayRef)_ThreadIDs);
      ++_LastThreadID;
      v6.location = 0;
      if (!CFArrayContainsValue((CFArrayRef)_ThreadIDs, v6, (const void *)_LastThreadID))
        break;
      if (!--v3)
        goto LABEL_7;
    }
    CFArrayAppendValue((CFMutableArrayRef)_ThreadIDs, (const void *)_LastThreadID);
    v2->_threadID = _LastThreadID;
LABEL_7:
    objc_msgSend((id)_ThreadKeyLock, "unlock");
  }
  return v2;
}

- (SCRCThreadKey)initWithDescription:(id)a3
{
  id v4;
  SCRCThreadKey *v5;
  uint64_t v6;
  NSString *threadDescription;

  v4 = a3;
  v5 = -[SCRCThreadKey init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    threadDescription = v5->_threadDescription;
    v5->_threadDescription = (NSString *)v6;

  }
  return v5;
}

- (SCRCThreadKey)initWithObject:(id)a3
{
  objc_class *v4;
  void *v5;
  SCRCThreadKey *v6;

  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SCRCThreadKey initWithDescription:](self, "initWithDescription:", v5);

  return v6;
}

- (id)_allCurrentThreadIDs
{
  id v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex i;
  const void *ValueAtIndex;

  v2 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v2, "appendString:", CFSTR("{"));
  objc_msgSend((id)_ThreadKeyLock, "lock");
  Count = CFArrayGetCount((CFArrayRef)_ThreadIDs);
  if (Count >= 1)
  {
    v4 = Count;
    for (i = 0; i != v4; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)_ThreadIDs, i);
      if (i)
        objc_msgSend(v2, "appendString:", CFSTR(", "));
      objc_msgSend(v2, "appendFormat:", CFSTR("%lu"), ValueAtIndex);
    }
  }
  objc_msgSend((id)_ThreadKeyLock, "unlock");
  objc_msgSend(v2, "appendString:", CFSTR("} "));
  return v2;
}

- (void)dealloc
{
  CFIndex FirstIndexOfValue;
  objc_super v4;
  CFRange v5;

  objc_msgSend((id)_ThreadKeyLock, "lock");
  v5.length = CFArrayGetCount((CFArrayRef)_ThreadIDs);
  v5.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue((CFArrayRef)_ThreadIDs, v5, (const void *)self->_threadID);
  CFArrayRemoveValueAtIndex((CFMutableArrayRef)_ThreadIDs, FirstIndexOfValue);
  objc_msgSend((id)_ThreadKeyLock, "unlock");
  v4.receiver = self;
  v4.super_class = (Class)SCRCThreadKey;
  -[SCRCThreadKey dealloc](&v4, sel_dealloc);
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (NSString)threadDescription
{
  if (self->_threadDescription)
    return self->_threadDescription;
  else
    return (NSString *)&stru_24CB26880;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t threadID;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  threadID = self->_threadID;
  -[SCRCThreadKey threadDescription](self, "threadDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> ThreadKeyID:%lu  Description:\"%@\"), v5, self, threadID, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  return self->_threadID;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = objc_msgSend(v4, "threadID"), v5 == -[SCRCThreadKey threadID](self, "threadID")))
  {
    -[SCRCThreadKey threadDescription](self, "threadDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "threadDescription");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 | v7)
      v8 = objc_msgSend((id)v6, "isEqualToString:", v7);
    else
      v8 = 1;

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SCRCThreadKey;
    v8 = -[SCRCThreadKey isEqual:](&v10, sel_isEqual_, v4);
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SCRCThreadKey _initWithThreadID:description:]([SCRCThreadKey alloc], "_initWithThreadID:description:", self->_threadID, self->_threadDescription);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadDescription, 0);
}

@end
