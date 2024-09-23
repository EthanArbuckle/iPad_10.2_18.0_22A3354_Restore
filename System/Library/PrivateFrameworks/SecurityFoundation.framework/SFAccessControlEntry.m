@implementation SFAccessControlEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAccessControlEntry)initWithBundleID:(id)a3 owner:(BOOL)a4 canRead:(BOOL)a5 canWrite:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  SFAccessControlEntry *v11;
  uint64_t v12;
  _QWORD *accessControlEntryInternal;
  void *v14;
  char v15;
  char v16;
  objc_super v18;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SFAccessControlEntry;
  v11 = -[SFAccessControlEntry init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    accessControlEntryInternal = v11->_accessControlEntryInternal;
    v14 = (void *)accessControlEntryInternal[1];
    accessControlEntryInternal[1] = v12;

    *((_BYTE *)v11->_accessControlEntryInternal + 16) = *((_BYTE *)v11->_accessControlEntryInternal + 16) & 0xFE | a4;
    if (v7)
      v15 = 2;
    else
      v15 = 0;
    *((_BYTE *)v11->_accessControlEntryInternal + 16) = *((_BYTE *)v11->_accessControlEntryInternal + 16) & 0xFD | v15;
    if (v6)
      v16 = 4;
    else
      v16 = 0;
    *((_BYTE *)v11->_accessControlEntryInternal + 16) = *((_BYTE *)v11->_accessControlEntryInternal + 16) & 0xFB | v16;
  }

  return v11;
}

- (SFAccessControlEntry)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFAccessControlEntry;
  return -[SFAccessControlEntry init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBundleID:owner:canRead:canWrite:", *((_QWORD *)self->_accessControlEntryInternal + 1), *((_BYTE *)self->_accessControlEntryInternal + 16) & 1, (*((unsigned __int8 *)self->_accessControlEntryInternal + 16) >> 1) & 1, (*((unsigned __int8 *)self->_accessControlEntryInternal + 16) >> 2) & 1);
}

- (BOOL)isOwner
{
  return *((_BYTE *)self->_accessControlEntryInternal + 16) & 1;
}

- (void)setOwner:(BOOL)a3
{
  *((_BYTE *)self->_accessControlEntryInternal + 16) = *((_BYTE *)self->_accessControlEntryInternal + 16) & 0xFE | a3;
}

- (BOOL)canRead
{
  return (*((unsigned __int8 *)self->_accessControlEntryInternal + 16) >> 1) & 1;
}

- (void)setCanRead:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self->_accessControlEntryInternal + 16) = *((_BYTE *)self->_accessControlEntryInternal + 16) & 0xFD | v3;
}

- (BOOL)canWrite
{
  return (*((unsigned __int8 *)self->_accessControlEntryInternal + 16) >> 2) & 1;
}

- (void)setCanWrite:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self->_accessControlEntryInternal + 16) = *((_BYTE *)self->_accessControlEntryInternal + 16) & 0xFB | v3;
}

- (NSString)bundleID
{
  return (NSString *)(id)objc_msgSend(*((id *)self->_accessControlEntryInternal + 1), "copy");
}

- (void)setBundleID:(id)a3
{
  uint64_t v4;
  _QWORD *accessControlEntryInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  accessControlEntryInternal = self->_accessControlEntryInternal;
  v6 = (void *)accessControlEntryInternal[1];
  accessControlEntryInternal[1] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accessControlEntryInternal, 0);
}

@end
