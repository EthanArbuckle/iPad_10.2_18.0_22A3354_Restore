@implementation CHChannelCurve

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelCurve *v8;
  PCString v10;

  v8 = (OZChannelCurve *)operator new();
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelCurve::OZChannelCurve(v8, &v10, 0, a4, a5);
  PCString::~PCString(&v10);
  return (OZChannelBase *)v8;
}

- (void)ozChannel
{
  void *result;

  result = self->super.super._pOZChannel;
  if (result)
  return result;
}

- (id)addNewChannelWithXMLTypeInfo:(id)a3
{
  return 0;
}

- (id)addVertexChannelsWithXMLTypeInfoForX:(id)a3 andForY:(id)a4
{
  OZChannelBase *pOZChannel;
  OZChannelCurve *v5;
  char *v6;
  int v7;
  char *v8;
  char *v9;
  OZChannelBase *VertexAssociatedChannelX;
  OZChannelBase *VertexAssociatedChannelY;
  void *v12;
  OZChannelBase *v13;

  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  v6 = (char *)OZChannelCurve::addVertex(v5, MEMORY[0x1E0CA2E68], 0.0, 0.0);
  v7 = (int)v6;
  v9 = v8;
  VertexAssociatedChannelX = (OZChannelBase *)OZChannelCurve::getVertexAssociatedChannelX((uint64_t)v5, v6);
  VertexAssociatedChannelY = (OZChannelBase *)OZChannelCurve::getVertexAssociatedChannelY((uint64_t)v5, v7, v9);
  v12 = (void *)MEMORY[0x1E0C99D20];
  v13 = CHChannelWrapperForOZChannel(VertexAssociatedChannelX, 0);
  return (id)objc_msgSend(v12, "arrayWithObjects:", v13, CHChannelWrapperForOZChannel(VertexAssociatedChannelY, 0), 0);
}

- (id)vertexChannelFolders
{
  id v3;
  OZChannelBase *pOZChannel;
  _QWORD *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  id v10;
  OZChannelBase *v11;
  void *v12;
  BOOL v13;
  void *v14;
  OZChannelBase *v16;
  OZChannelBase *v17;
  void *__p;
  char *v19;
  uint64_t v20;
  void *v21;
  char *v22;
  uint64_t v23;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  v6 = (char *)(v5 + 36);
  v21 = 0;
  v22 = 0;
  v23 = 0;
  __p = 0;
  v19 = 0;
  v20 = 0;
  (*(void (**)(_QWORD *, void **))(v5[36] + 288))(v5 + 36, &v21);
  v7 = (char *)(v5 + 65);
  (*(void (**)(char *, void **))(*(_QWORD *)v7 + 288))(v7, &__p);
  if (v21 != v22 && __p != v19)
  {
    v8 = (char *)v21 + 8;
    v9 = (char *)__p + 8;
    do
    {
      v16 = 0;
      v17 = 0;
      (*(void (**)(char *, _QWORD, OZChannelBase **))(*(_QWORD *)v6 + 552))(v6, *((_QWORD *)v8 - 1), &v17);
      (*(void (**)(char *, _QWORD, OZChannelBase **))(*(_QWORD *)v7 + 552))(v7, *((_QWORD *)v9 - 1), &v16);
      v10 = objc_alloc(MEMORY[0x1E0C99D20]);
      v11 = CHChannelWrapperForOZChannel(v17, 0);
      v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, CHChannelWrapperForOZChannel(v16, 0), 0);
      objc_msgSend(v3, "addObject:", v12);

      if (v8 == v22)
        break;
      v8 += 8;
      v13 = v9 == v19;
      v9 += 8;
    }
    while (!v13);
  }
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);

  if (__p)
  {
    v19 = (char *)__p;
    operator delete(__p);
  }
  if (v21)
  {
    v22 = (char *)v21;
    operator delete(v21);
  }
  return v14;
}

@end
