@implementation CHChannelBase

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return 1;
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  return 0;
}

+ (unsigned)_newChannelId
{
  unsigned int result;

  do
    result = __ldaxr((unsigned int *)&+[CHChannelBase _newChannelId]::nextId);
  while (__stlxr(result + 1, (unsigned int *)&+[CHChannelBase _newChannelId]::nextId));
  return result;
}

+ (unsigned)_defaultChannelFlags
{
  return 0;
}

- (BOOL)allowsKeyframes
{
  return (*((uint64_t (**)(OZChannelBase *))self->_pOZChannel->var0 + 64))(self->_pOZChannel);
}

- (void)setAllowsKeyframes:(BOOL)a3
{
  (*((void (**)(OZChannelBase *, BOOL, _QWORD))self->_pOZChannel->var0 + 63))(self->_pOZChannel, a3, 0);
}

- (CHChannelBase)initWithOZChannel:(OZChannelBase *)a3 freeWhenDone:(BOOL)a4
{
  id WrapperForOZChannel;
  CHChannelBase *v8;
  CHChannelBase *v9;
  objc_super v11;

  if (objc_msgSend((id)objc_opt_class(), "_isOZChannelClassOK:", a3))
  {
    objc_sync_enter(CFSTR("CHChannelWrapperLock"));
    WrapperForOZChannel = GetWrapperForOZChannel(a3);
    if (WrapperForOZChannel)
    {
      -[CHChannelBase dealloc](self, "dealloc");
      v8 = (CHChannelBase *)WrapperForOZChannel;
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)CHChannelBase;
      v9 = -[CHChannelBase init](&v11, sel_init);
      v8 = v9;
      if (v9)
      {
        v9->_pOZChannel = a3;
        v9->_freeWhenDone = a4;
        objc_sync_enter(CFSTR("CHChannelWrapperLock"));
        a3->var9 = v8;
        objc_sync_exit(CFSTR("CHChannelWrapperLock"));
      }
    }
    objc_sync_exit(CFSTR("CHChannelWrapperLock"));
  }
  else
  {
    -[CHChannelBase dealloc](self, "dealloc");
    return 0;
  }
  return v8;
}

- (CHChannelBase)initWithParent:(id)a3 name:(id)a4 channelID:(unsigned int)a5 flags:(unsigned int)a6
{
  CHChannelBase *v7;

  v7 = -[CHChannelBase initWithOZChannel:freeWhenDone:](self, "initWithOZChannel:freeWhenDone:", objc_msgSend((id)objc_opt_class(), "_newOZChannelWithName:channelID:flags:", a4, *(_QWORD *)&a5, *(_QWORD *)&a6), 1);
  if (v7)
    objc_msgSend(a3, "addChild:", v7);
  return v7;
}

- (CHChannelBase)initWithParent:(id)a3 name:(id)a4 channelID:(unsigned int)a5
{
  return -[CHChannelBase initWithParent:name:channelID:flags:](self, "initWithParent:name:channelID:flags:", a3, a4, *(_QWORD *)&a5, objc_msgSend((id)objc_opt_class(), "_defaultChannelFlags"));
}

- (CHChannelBase)initWithParent:(id)a3 name:(id)a4
{
  uint64_t v7;

  if (a3)
    v7 = objc_msgSend(a3, "_newChannelIdForChild");
  else
    v7 = objc_msgSend((id)objc_opt_class(), "_newChannelId");
  return -[CHChannelBase initWithParent:name:channelID:flags:](self, "initWithParent:name:channelID:flags:", a3, a4, v7, objc_msgSend((id)objc_opt_class(), "_defaultChannelFlags"));
}

- (CHChannelBase)init
{
  return -[CHChannelBase initWithParent:name:](self, "initWithParent:name:", 0, &stru_1E65EDDA0);
}

- (BOOL)_shouldDeleteOZChannelOnDealloc
{
  OZChannelBase *pOZChannel;

  return self->_freeWhenDone && (pOZChannel = self->_pOZChannel) != 0 && pOZChannel->var6 == 0;
}

- (void)_ozChannelWillBeDeleted:(void *)a3
{
  self->_pOZChannel = 0;
}

- (void)release
{
  objc_super v3;

  objc_sync_enter(CFSTR("CHChannelWrapperLock"));
  v3.receiver = self;
  v3.super_class = (Class)CHChannelBase;
  -[CHChannelBase release](&v3, sel_release);
  objc_sync_exit(CFSTR("CHChannelWrapperLock"));
}

- (void)dealloc
{
  OZChannelBase *pOZChannel;
  OZChannelBase *v4;
  objc_super v5;

  pOZChannel = self->_pOZChannel;
  if (pOZChannel)
  {
    objc_sync_enter(CFSTR("CHChannelWrapperLock"));
    pOZChannel->var9 = 0;
    objc_sync_exit(CFSTR("CHChannelWrapperLock"));
    if (-[CHChannelBase _shouldDeleteOZChannelOnDealloc](self, "_shouldDeleteOZChannelOnDealloc"))
    {
      v4 = self->_pOZChannel;
      if (v4)
        (*((void (**)(OZChannelBase *))v4->var0 + 1))(v4);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)CHChannelBase;
  -[CHChannelBase dealloc](&v5, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  OZChannelBase *v3;

  v3 = ChannelStateCopy(self->_pOZChannel, 0);
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOZChannel:freeWhenDone:", v3, 1);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, oz=%p, name='%@', ID=%lu>"), NSStringFromClass(v4), self, self->_pOZChannel, -[CHChannelBase name](self, "name"), -[CHChannelBase channelID](self, "channelID"));
}

- (OZChannelBase)ozChannel
{
  return self->_pOZChannel;
}

- (id)parent
{
  id result;

  result = self->_pOZChannel->var6;
  if (result)
    return CHChannelWrapperForOZChannel((OZChannelBase *)result, 0);
  return result;
}

- (id)rootBase
{
  id result;

  result = OZChannelBase::getChannelRootBase(self->_pOZChannel);
  if (result)
    return CHChannelWrapperForOZChannel((OZChannelBase *)result, 0);
  return result;
}

- (id)channelRefPath:(id)a3
{
  const OZChannelBase *v4;
  OZChannelBase *pOZChannel;
  void **v6;
  void *v7;
  void *v9[2];
  char v10;

  v4 = (const OZChannelBase *)objc_msgSend(a3, "ozChannel");
  if (!v4)
    return 0;
  pOZChannel = self->_pOZChannel;
  if (!pOZChannel)
    return 0;
  OZChannelRef::OZChannelRef((OZChannelRef *)v9, pOZChannel, v4);
  if (v10 >= 0)
    v6 = v9;
  else
    v6 = (void **)v9[0];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
  OZChannelRef::~OZChannelRef(v9);
  return v7;
}

- (id)channelFromChannelRefPath:(id)a3
{
  OZChannelBase *v3;
  OZChannelBase *Channel;
  PCString v8;
  void *v9[3];

  v3 = 0;
  if (a3 && self->_pOZChannel)
  {
    if (objc_msgSend(a3, "length"))
    {
      PCURL::PCURL((PCURL *)&v8, a3);
      OZChannelRef::OZChannelRef((OZChannelRef *)v9, &v8);
      PCString::~PCString(&v8);
      Channel = OZChannelRef::getChannel((OZChannelRef *)v9, self->_pOZChannel);
      v3 = CHChannelWrapperForOZChannel(Channel, 0);
      OZChannelRef::~OZChannelRef(v9);
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (id)delegate
{
  return 0;
}

- (id)name
{
  return (id)PCString::ns_str(&self->_pOZChannel->var4);
}

- (void)setName:(id)a3
{
  OZChannelBase *pOZChannel;
  PCString v4;

  pOZChannel = self->_pOZChannel;
  v4.var0 = 0;
  PCString::set(&v4, (CFStringRef)a3);
  OZChannelBase::setName(pOZChannel, &v4, 0);
  PCString::~PCString(&v4);
}

- (unsigned)channelID
{
  return self->_pOZChannel->var3;
}

- (void)setChannelID:(unsigned int)a3
{
  OZChannelBase::setID(self->_pOZChannel, a3);
}

- (unint64_t)flags
{
  return self->_pOZChannel->var7;
}

- (void)setFlags:(unint64_t)a3
{
  OZChannelBase::setFlags(self->_pOZChannel, a3);
}

- (BOOL)testFlag:(unint64_t)a3
{
  return OZChannelBase::testFlag(self->_pOZChannel, a3);
}

- (void)setFlag:(unint64_t)a3
{
  OZChannelBase::setFlag(self->_pOZChannel, a3, 0);
}

- (void)resetFlag:(unint64_t)a3
{
  OZChannelBase::resetFlag(self->_pOZChannel, a3, 0);
}

- (BOOL)testDefaultFlag:(unint64_t)a3
{
  return OZChannelBase::testDefaultFlag(self->_pOZChannel, a3);
}

- (void)saveStateAsDefault
{
  (*((void (**)(OZChannelBase *))self->_pOZChannel->var0 + 16))(self->_pOZChannel);
}

- (BOOL)isStateModified
{
  return (*((uint64_t (**)(OZChannelBase *))self->_pOZChannel->var0 + 19))(self->_pOZChannel);
}

- (void)reset
{
  (*((void (**)(OZChannelBase *, _QWORD))self->_pOZChannel->var0 + 36))(self->_pOZChannel, 0);
}

- (void)resetToDefault
{
  (*((void (**)(OZChannelBase *, _QWORD))self->_pOZChannel->var0 + 35))(self->_pOZChannel, 0);
}

- (BOOL)getResetCallback:(void *)a3 context:(void *)a4
{
  int ResetCallback;
  void (*v7)(OZChannelBase *, void *);
  void *v8;
  BOOL v10;
  void *v11;
  void (*v12)(OZChannelBase *, void *);

  v11 = 0;
  v12 = 0;
  v10 = 0;
  ResetCallback = OZChannelBase::getResetCallback(self->_pOZChannel, &v12, &v11, &v10);
  if (ResetCallback)
  {
    if (a3)
    {
      if (v10)
        v7 = v12;
      else
        v7 = 0;
      *a3 = v7;
    }
    if (a4)
    {
      if (v10)
        v8 = v11;
      else
        v8 = 0;
      *a4 = v8;
    }
  }
  return ResetCallback;
}

- (void)setResetCallback:(void *)a3 context:(void *)a4
{
  OZChannelBase::setResetCallback(self->_pOZChannel, (void (*)(OZChannelBase *, void *))a3, (uint64_t *)a4, 1);
}

- (BOOL)isModified
{
  return (*((uint64_t (**)(OZChannelBase *, uint64_t))self->_pOZChannel->var0 + 62))(self->_pOZChannel, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertGlobalToLocal:(SEL)a3
{
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(*((uint64_t (**)(OZChannelBase *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))self->_pOZChannel->var0
                                               + 41))(self->_pOZChannel, a4);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertLocalToGlobal:(SEL)a3
{
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(*((uint64_t (**)(OZChannelBase *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))self->_pOZChannel->var0
                                               + 42))(self->_pOZChannel, a4);
}

- (id)labelCtlrClassName
{
  return OZChannelBase::getLabelCtlrClassName(self->_pOZChannel);
}

- (void)setLabelCtlrClassName:(id)a3
{
  OZChannelBase::setLabelCtlrClassName(self->_pOZChannel, (__CFString *)a3);
}

- (id)parameterCtlrClassName
{
  return OZChannelBase::getParameterCtlrClassName(self->_pOZChannel);
}

- (void)setParameterCtlrClassName:(id)a3
{
  OZChannelBase::setParameterCtlrClassName(self->_pOZChannel, (__CFString *)a3);
}

- (id)inspectorCtlrClassName
{
  return OZChannelBase::getInspectorCtlrClassName(self->_pOZChannel);
}

- (void)setInspectorCtlrClassName:(id)a3
{
  OZChannelBase::setInspectorCtlrClassName(self->_pOZChannel, (__CFString *)a3);
}

- (void)getMD5Value:(unsigned int *)a3
{
  __int128 v4;

  OZChannelBase::getHash(self->_pOZChannel);
  if (a3)
    *(_OWORD *)a3 = v4;
}

- (id)channelState
{
  return OZChannelBase::createChannelState(self->_pOZChannel, 1, 1);
}

- (BOOL)configureWithChannelState:(id)a3
{
  return (*((uint64_t (**)(OZChannelBase *, id))self->_pOZChannel->var0 + 57))(self->_pOZChannel, a3);
}

- (void)lock
{
  (*((void (**)(OZChannelBase *, uint64_t, uint64_t))self->_pOZChannel->var0 + 12))(self->_pOZChannel, 1, 1);
}

- (void)unlock
{
  (*((void (**)(OZChannelBase *, _QWORD, uint64_t))self->_pOZChannel->var0 + 12))(self->_pOZChannel, 0, 1);
}

- (id)keyframes:(id *)a3
{
  OZChannelBase *pOZChannel;
  __int128 v4;
  id v5;
  char *v6;
  uint64_t v7;
  unsigned int v8;
  FigTimeObj *v9;
  char *v10;
  uint64_t v11;
  FigTimeObj *v12;
  __int128 v15;
  uint64_t v16;
  _OWORD v17[3];
  char *v18;
  char *v19;

  pOZChannel = self->_pOZChannel;
  v4 = *(_OWORD *)&a3->var0.var3;
  v17[0] = *(_OWORD *)&a3->var0.var0;
  v17[1] = v4;
  v17[2] = *(_OWORD *)&a3->var1.var1;
  (*((void (**)(char **__return_ptr, OZChannelBase *, _OWORD *, _QWORD, _QWORD))pOZChannel->var0 + 65))(&v18, pOZChannel, v17, 0, 0);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = v19;
  if (v19 != v18)
  {
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = [FigTimeObj alloc];
      v10 = &v18[24 * v7];
      v11 = *((_QWORD *)v10 + 2);
      v15 = *(_OWORD *)v10;
      v16 = v11;
      v12 = -[FigTimeObj initWithFigTime:](v9, "initWithFigTime:", &v15);
      objc_msgSend(v5, "addObject:", v12);

      v7 = v8;
      v6 = v18;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((v19 - v18) >> 3) > v8++);
  }
  if (v6)
  {
    v19 = v6;
    operator delete(v6);
  }
  return v5;
}

- (BOOL)hasNextKeyframe:(id *)a3
{
  return (*((uint64_t (**)(OZChannelBase *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, _QWORD))self->_pOZChannel->var0
          + 79))(self->_pOZChannel, a3, 0);
}

- (BOOL)hasPreviousKeyframe:(id *)a3
{
  return (*((uint64_t (**)(OZChannelBase *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, _QWORD))self->_pOZChannel->var0
          + 78))(self->_pOZChannel, a3, 0);
}

- (BOOL)hasKeyframeAtTime:(id *)a3
{
  return (*((uint64_t (**)(OZChannelBase *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, _QWORD))self->_pOZChannel->var0
          + 71))(self->_pOZChannel, a3, 0);
}

- (BOOL)getPreviousKeyframeTime:(id *)a3
{
  return (*((uint64_t (**)(OZChannelBase *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, _QWORD))self->_pOZChannel->var0
          + 78))(self->_pOZChannel, a3, 0);
}

- (BOOL)getNextKeyframeTime:(id *)a3
{
  return (*((uint64_t (**)(OZChannelBase *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, _QWORD))self->_pOZChannel->var0
          + 79))(self->_pOZChannel, a3, 0);
}

- (void)_replaceChannel:(OZChannelBase *)a3 flagsOnly:(BOOL)a4
{
  _BOOL4 v4;
  OZChannelBase *pOZChannel;
  OZChannelFolder *var6;

  v4 = a4;
  pOZChannel = self->_pOZChannel;
  var6 = pOZChannel->var6;
  (*((void (**)(OZChannelBase *, SEL))pOZChannel->var0 + 44))(pOZChannel, a2);
  if (v4)
    OZChannelBase::setFlags(pOZChannel, a3->var7);
  else
    (*((void (**)(OZChannelBase *, OZChannelBase *))pOZChannel->var0 + 32))(pOZChannel, a3);
  (*((void (**)(OZChannelBase *))pOZChannel->var0 + 45))(pOZChannel);
  pOZChannel->var6 = var6;
}

- (BOOL)isFolder
{
  return (BYTE1(self->_pOZChannel->var7) >> 4) & 1;
}

- (BOOL)isCompoundChannel
{
  return (*((uint64_t (**)(OZChannelBase *))self->_pOZChannel->var0 + 15))(self->_pOZChannel);
}

- (id)reverseDNSName:(id)a3
{
  void *v4;
  id result;

  if (a3 == self)
    return 0;
  v4 = (void *)objc_msgSend(-[CHChannelBase parent](self, "parent"), "reverseDNSName:", a3);
  result = -[CHChannelBase name](self, "name");
  if (v4)
    return (id)objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(".%@"), result);
  return result;
}

@end
