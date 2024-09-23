@implementation CHChannelFolder

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelFolder *v8;
  PCString v10;

  v8 = (OZChannelFolder *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelFolder::OZChannelFolder(v8, &v10, 0, a4, a5, 0);
  PCString::~PCString(&v10);
  return (OZChannelBase *)v8;
}

+ (unsigned)_defaultChannelFlags
{
  return 4096;
}

- (void)dealloc
{
  OZChannelFolder *pOZChannel;
  objc_super v4;

  if (-[CHChannelBase _shouldDeleteOZChannelOnDealloc](self, "_shouldDeleteOZChannelOnDealloc"))
  {
    pOZChannel = (OZChannelFolder *)self->super._pOZChannel;
    if (pOZChannel)
    DeleteDescendants(pOZChannel);
  }
  v4.receiver = self;
  v4.super_class = (Class)CHChannelFolder;
  -[CHChannelBase dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, oz=%p, name='%@', ID=%lu, #children=%lu>"), NSStringFromClass(v4), self, self->super._pOZChannel, -[CHChannelBase name](self, "name"), -[CHChannelBase channelID](self, "channelID"), -[CHChannelFolder numberOfChildren](self, "numberOfChildren"));
}

- (id)debugDescrptionWithIndentLevel:(unsigned int)a3
{
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  OZChannelBase *v11;
  OZChannelBase *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v16 = 2 * a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%*s%@"), v16, ", -[CHChannelFolder description](self, "description"));
  objc_msgSend(v5, "appendString:", CFSTR("("));
  if (v6)
  {
    v7 = v6[1] - *v6;
    if ((v7 & 0x7FFFFFFF8) != 0)
    {
      v8 = 0;
      v9 = a3 + 1;
      v10 = (v7 >> 3);
      while (1)
      {
        v11 = *(OZChannelBase **)(*v6 + 8 * v8);
        if (!CHChannelWrapperClassForOZChannel((uint64_t)v11))
          break;
        v12 = CHChannelWrapperForOZChannel(v11, 0);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v13 = -[OZChannelBase description](v12, "description");
          goto LABEL_9;
        }
        v13 = -[OZChannelBase debugDescrptionWithIndentLevel:](v12, "debugDescrptionWithIndentLevel:", v9);
        v14 = 0;
LABEL_10:
        objc_msgSend(v5, "appendFormat:", CFSTR("\n%*s%@"), v14, ", v13);
        if (v10 == ++v8)
          goto LABEL_11;
      }
      v13 = CHDescriptionForOZChannel((uint64_t)v11);
LABEL_9:
      v14 = (v16 + 2);
      goto LABEL_10;
    }
  }
LABEL_11:
  objc_msgSend(v5, "appendFormat:", CFSTR("\n%*s)"), v16, ");
  return v5;
}

- (id)debugDescription
{
  return -[CHChannelFolder debugDescrptionWithIndentLevel:](self, "debugDescrptionWithIndentLevel:", 0);
}

- (void)ozChannel
{
  void *result;

  result = self->super._pOZChannel;
  if (result)
  return result;
}

- (BOOL)testFolderFlag:(unsigned int)a3
{
  OZChannelFolder *pOZChannel;

  pOZChannel = (OZChannelFolder *)self->super._pOZChannel;
  if (pOZChannel)
  return OZChannelFolder::testFoldFlag(pOZChannel, a3);
}

- (void)setFolderFlag:(unsigned int)a3
{
  OZChannelFolder *pOZChannel;

  pOZChannel = (OZChannelFolder *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannelFolder::setFoldFlag(pOZChannel, a3);
}

- (void)resetFolderFlag:(unsigned int)a3
{
  OZChannelFolder *pOZChannel;

  pOZChannel = (OZChannelFolder *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannelFolder::resetFoldFlag(pOZChannel, a3);
}

- (unsigned)folderFlags
{
}

- (void)setFolderFlags:(unsigned int)a3
{
  OZChannelFolder *pOZChannel;

  pOZChannel = (OZChannelFolder *)self->super._pOZChannel;
  if (pOZChannel)
  OZChannelFolder::setFoldFlags(pOZChannel, a3);
}

- (id)children
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (v2)
    v3 = (v2[1] - *v2) >> 3;
  else
    LODWORD(v3) = 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (int)v3);
  if ((_DWORD)v3)
  {
    v5 = 0;
    v6 = 8 * v3;
    do
    {
      objc_msgSend(v4, "addObject:", CHChannelWrapperForOZChannel(*(OZChannelBase **)(*v2 + v5), 0));
      v5 += 8;
    }
    while (v6 != v5);
  }
  return v4;
}

- (unsigned)numberOfChildren
{
  _QWORD *v2;
  uint64_t v3;

  if (v2)
    return (v2[1] - *v2) >> 3;
  else
    LODWORD(v3) = 0;
  return v3;
}

- (id)childAtIndex:(unint64_t)a3
{
  OZChannelBase *v3;

  return CHChannelWrapperForOZChannel(v3, 0);
}

- (unint64_t)indexOfChild:(id)a3
{
  OZChannelBase *pOZChannel;
  _QWORD *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;
  uint64_t v12;

  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  v6 = objc_msgSend(a3, "ozChannel");
  v7 = (uint64_t *)v5[14];
  if (!v7)
    return 0x7FFFFFFFFFFFFFFFLL;
  v8 = *v7;
  v9 = *(_QWORD *)(v5[14] + 8) - v8;
  if (!((unint64_t)v9 >> 3))
    return 0x7FFFFFFFFFFFFFFFLL;
  v10 = v6;
  result = 0;
  v12 = (int)(v9 >> 3);
  while (*(_QWORD *)(v8 + 8 * result) != v10)
  {
    if (v12 == ++result)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)childWithChannelID:(unsigned int)a3
{
  OZChannelFolder *pOZChannel;
  id result;

  pOZChannel = (OZChannelFolder *)self->super._pOZChannel;
  if (pOZChannel)
  result = (id)OZChannelFolder::getDescendant(pOZChannel, a3);
  if (result)
    return CHChannelWrapperForOZChannel((OZChannelBase *)result, 0);
  return result;
}

- (void)iterateDescendantsWithOptions:(unsigned int)a3 usingBlock:(id)a4
{
  uint64_t v5;
  const void *pOZChannel;

  v5 = *(_QWORD *)&a3;
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  IterateDescendants((uint64_t)pOZChannel, v5, (uint64_t)a4);
}

- (void)iterateDescendantsWithOptions:(unsigned int)a3 usingFunction:(void *)a4 contextInfo:(void *)a5
{
  uint64_t v7;
  const void *pOZChannel;
  _QWORD v9[6];

  v7 = *(_QWORD *)&a3;
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__CHChannelFolder_iterateDescendantsWithOptions_usingFunction_contextInfo___block_invoke;
  v9[3] = &__block_descriptor_48_e23_B16__0__CHChannelBase_8l;
  v9[4] = a4;
  v9[5] = a5;
  IterateDescendants((uint64_t)pOZChannel, v7, (uint64_t)v9);
}

uint64_t __75__CHChannelFolder_iterateDescendantsWithOptions_usingFunction_contextInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 32))(a2, *(_QWORD *)(a1 + 40));
}

- (void)iterateDescendantsWithOptions:(unsigned int)a3 usingSelector:(SEL)a4 delegate:(id)a5 contextInfo:(void *)a6
{
  uint64_t v9;
  const void *pOZChannel;
  _QWORD v11[7];

  v9 = *(_QWORD *)&a3;
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__CHChannelFolder_iterateDescendantsWithOptions_usingSelector_delegate_contextInfo___block_invoke;
  v11[3] = &unk_1E6557110;
  v11[4] = a5;
  v11[5] = a4;
  v11[6] = a6;
  IterateDescendants((uint64_t)pOZChannel, v9, (uint64_t)v11);
}

id __84__CHChannelFolder_iterateDescendantsWithOptions_usingSelector_delegate_contextInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), *(SEL *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
}

- (unsigned)_newChannelIdForChild
{
  OZChannelBase *pOZChannel;
  OZChannelFolder *v3;
  unsigned int v4;

  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  else
    v3 = 0;
  do
    v4 = objc_msgSend((id)objc_opt_class(), "_newChannelId");
  while (OZChannelFolder::getDescendant(v3, v4));
  return v4;
}

- (void)addChild:(id)a3
{
  OZChannelBase *pOZChannel;
  OZChannelFolder *v5;
  OZChannelBase *v6;

  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  v6 = (OZChannelBase *)objc_msgSend(a3, "ozChannel");
  FixupNewChild(v5, v6);
  OZChannelFolder::push_back(v5, v6);
}

- (void)insertChild:(id)a3 atIndex:(unint64_t)a4
{
  OZChannelBase *pOZChannel;
  OZChannelFolder *v7;
  OZChannelBase *v8;
  uint64_t *v9;
  uint64_t v10;
  const OZChannelBase *v11;

  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  else
    v7 = 0;
  v8 = (OZChannelBase *)objc_msgSend(a3, "ozChannel");
  FixupNewChild(v7, v8);
  v9 = (uint64_t *)*((_QWORD *)v7 + 14);
  if (v9 && (v10 = *v9, a4 != (int)((unint64_t)(*(_QWORD *)(*((_QWORD *)v7 + 14) + 8) - v10) >> 3)))
    v11 = *(const OZChannelBase **)(v10 + 8 * a4);
  else
    v11 = 0;
  OZChannelFolder::insertDescendantBefore(v7, v11, v8);
}

- (BOOL)_shouldDeleteDescendantsOnRemoval
{
  OZChannelBase *pOZChannel;
  _QWORD *v3;
  BOOL result;

  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  else
    v3 = 0;
  if (((*(uint64_t (**)(_QWORD *))(*v3 + 120))(v3) & 1) != 0
  {
    return 0;
  }
  do
  {
    result = objc_msgSend((id)CHPreexistingChannelWrapperForOZChannel(v3), "_shouldDeleteOZChannelOnDealloc");
    if (result)
      break;
    v3 = (_QWORD *)v3[6];
  }
  while (v3);
  return result;
}

- (void)removeChild:(id)a3
{
  OZChannelBase *pOZChannel;
  OZChannelFolder *v6;
  OZChannelBase *v7;

  if (a3)
  {
    pOZChannel = self->super._pOZChannel;
    if (pOZChannel)
    else
      v6 = 0;
    v7 = (OZChannelBase *)objc_msgSend(a3, "ozChannel");
    if (-[CHChannelFolder _shouldDeleteDescendantsOnRemoval](self, "_shouldDeleteDescendantsOnRemoval"))
      DeleteDescendant(v6, v7);
    else
      OZChannelFolder::removeDescendant(v6, v7);
  }
}

- (void)removeAllChildren
{
  OZChannelBase *pOZChannel;
  OZChannelFolder *v4;

  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  else
    v4 = 0;
  if (-[CHChannelFolder _shouldDeleteDescendantsOnRemoval](self, "_shouldDeleteDescendantsOnRemoval"))
    DeleteDescendants(v4);
  else
    OZChannelFolder::removeAllDescendants(v4, 1);
}

- (id)channelStateForDescendants:(BOOL)a3
{
  return OZChannelBase::createChannelState(self->super._pOZChannel, 1, a3);
}

- (BOOL)configureDescendantsWithChannelState:(id)a3
{
  return (*((uint64_t (**)(OZChannelBase *, id))self->super._pOZChannel->var0 + 57))(self->super._pOZChannel, a3);
}

- (BOOL)hasDescendant:(id)a3
{
  OZChannelBase *pOZChannel;
  OZChannelBase *v5;

  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  return OZChannelBase::isDescendantOf((OZChannelBase *)objc_msgSend(a3, "ozChannel"), v5);
}

- (id)pathToDescendant:(id)a3
{
  OZChannelBase *pOZChannel;
  const OZChannelBase *v5;
  void **v6;
  void *v7;
  void *v9[2];
  char v10;

  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  OZChannelRef::OZChannelRef((OZChannelRef *)v9, (const OZChannelBase *)objc_msgSend(a3, "ozChannel"), v5);
  if (v10 >= 0)
    v6 = v9;
  else
    v6 = (void **)v9[0];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v6, 1);
  OZChannelRef::~OZChannelRef(v9);
  return v7;
}

- (id)descendantAtPath:(id)a3
{
  OZChannelBase *pOZChannel;
  OZChannelBase *v5;
  OZChannelBase *Channel;
  OZChannelBase *v7;
  PCString v9;
  void *v10[3];

  v9.var0 = 0;
  PCString::set(&v9, (CFStringRef)a3);
  OZChannelRef::OZChannelRef((OZChannelRef *)v10, &v9);
  PCString::~PCString(&v9);
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  Channel = OZChannelRef::getChannel((OZChannelRef *)v10, v5);
  v7 = CHChannelWrapperForOZChannel(Channel, 0);
  OZChannelRef::~OZChannelRef(v10);
  return v7;
}

- (BOOL)hasModifiedDescendant
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  BOOL result;
  BOOL v6;

  if (!v2)
    return 0;
  v3 = v2[1];
  if (*v2 == v3)
    return 0;
  v4 = *v2 + 8;
  do
  {
    result = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(v4 - 8) + 496))(*(_QWORD *)(v4 - 8), 1);
    if (result)
      break;
    v6 = v4 == v3;
    v4 += 8;
  }
  while (!v6);
  return result;
}

- (BOOL)hasDescendantWithFadeHandle
{
  void *v2;

  return (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 664))(v2);
}

- (BOOL)hasTimeVaryingDescendant
{
  OZChannelBase *pOZChannel;
  void *v3;

  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  else
    v3 = 0;
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v3 + 560))(v3) & 1) != 0)
    return 1;
  else
    return (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 664))(v3);
}

- (id)addNewChannelWithXMLTypeInfo:(id)a3
{
  return 0;
}

@end
