@implementation SSDownloadPolicyApplicationState

- (SSDownloadPolicyApplicationState)initWithApplicationIdentifier:(id)a3
{
  SSDownloadPolicyApplicationState *v4;
  SSDownloadPolicyApplicationState *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSDownloadPolicyApplicationState;
  v4 = -[SSDownloadPolicyApplicationState init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[SSDownloadPolicyApplicationState setApplicationIdentifier:](v4, "setApplicationIdentifier:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDownloadPolicyApplicationState;
  -[SSDownloadPolicyApplicationState dealloc](&v3, sel_dealloc);
}

- (void)addApplicationState:(int64_t)a3
{
  NSSet *applicationStates;
  id v6;
  id v7;

  applicationStates = self->_applicationStates;
  if (applicationStates)
  {
    v7 = (id)-[NSSet mutableCopy](applicationStates, "mutableCopy");
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));

    self->_applicationStates = (NSSet *)objc_msgSend(v7, "copy");
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    self->_applicationStates = (NSSet *)objc_msgSend(v6, "initWithObjects:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), 0);
  }
}

- (void)setNotRunningApplicationStates
{
  id v3;
  uint64_t i;
  void *v5;
  id v6;

  v3 = (id)-[NSSet mutableCopy](self->_applicationStates, "mutableCopy");
  if (!v3)
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = v3;
  for (i = 0; i != 5; ++i)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", dword_1A27A0F28[i]);
    objc_msgSend(v6, "addObject:", v5);

  }
  self->_applicationStates = (NSSet *)objc_msgSend(v6, "copy");

}

- (unint64_t)hash
{
  return -[NSString hash](self->_applicationIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  _BOOL4 v6;
  NSString *v7;
  NSSet *v8;

  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = -[SSDownloadPolicyApplicationState applicationIdentifier](self, "applicationIdentifier");
    if (v7 == (NSString *)objc_msgSend(a3, "applicationIdentifier")
      || (v6 = -[NSString isEqualToString:](-[SSDownloadPolicyApplicationState applicationIdentifier](self, "applicationIdentifier"), "isEqualToString:", objc_msgSend(a3, "applicationIdentifier"))))
    {
      v8 = -[SSDownloadPolicyApplicationState applicationStates](self, "applicationStates");
      LOBYTE(v6) = v8 == (NSSet *)objc_msgSend(a3, "applicationStates")
                || -[NSSet isEqualToSet:](-[SSDownloadPolicyApplicationState applicationStates](self, "applicationStates"), "isEqualToSet:", objc_msgSend(a3, "applicationStates"));
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_applicationIdentifier, CFSTR("appid"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSet allObjects](self->_applicationStates, "allObjects"), CFSTR("appsts"));
}

- (SSDownloadPolicyApplicationState)initWithCoder:(id)a3
{
  SSDownloadPolicyApplicationState *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSDownloadPolicyApplicationState;
  v4 = -[SSDownloadPolicyApplicationState init](&v10, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("appsts"));
    v4->_applicationIdentifier = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appid"));
    if (v7)
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v7);
    else
      v8 = 0;
    v4->_applicationStates = (NSSet *)v8;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = -[NSString copyWithZone:](self->_applicationIdentifier, "copyWithZone:", a3);
  v5[2] = -[NSSet copyWithZone:](self->_applicationStates, "copyWithZone:", a3);
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_applicationIdentifier);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)-[NSSet allObjects](self->_applicationStates, "allObjects"));
  return v3;
}

- (SSDownloadPolicyApplicationState)initWithXPCEncoding:(id)a3
{
  SSDownloadPolicyApplicationState *v5;
  CFArrayRef v7;
  uint64_t v8;
  objc_super v9;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v9.receiver = self;
    v9.super_class = (Class)SSDownloadPolicyApplicationState;
    v5 = -[SSDownloadPolicyApplicationState init](&v9, sel_init);
    if (v5)
    {
      objc_opt_class();
      v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
      objc_opt_class();
      v5->_applicationIdentifier = (NSString *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      if (v7)
        v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v7);
      else
        v8 = 0;
      v5->_applicationStates = (NSSet *)v8;

    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)applicationStates
{
  return self->_applicationStates;
}

- (void)setApplicationStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
