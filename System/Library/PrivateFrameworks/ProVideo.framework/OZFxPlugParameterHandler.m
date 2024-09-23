@implementation OZFxPlugParameterHandler

- (void)dumpAllChannels
{
  unsigned __int8 v3;
  uint64_t v4;

  {
    PCMutex::PCMutex(&-[OZFxPlugParameterHandler dumpAllChannels]::printLock);
    __cxa_atexit((void (*)(void *))PCMutex::~PCMutex, &-[OZFxPlugParameterHandler dumpAllChannels]::printLock, &dword_1B2737000);
  }
  PCMutex::lock(&-[OZFxPlugParameterHandler dumpAllChannels]::printLock);
  LOBYTE(v4) = 1;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x1E0DE4A60], (uint64_t)"\n----\n", 6);
  -[OZFxPlugParameterHandler dumpChannelFolder:depth:](self, "dumpChannelFolder:depth:", self->_baseChannel, 0, &-[OZFxPlugParameterHandler dumpAllChannels]::printLock, v4);
  PCMutex::unlock(&-[OZFxPlugParameterHandler dumpAllChannels]::printLock);
}

- (void)dumpChannelFolder:(void *)a3 depth:(int)a4
{
  _QWORD *v7;
  int v8;
  _QWORD *v9;
  char *CStr;
  char *v11;
  size_t v12;
  PCString ***v13;
  PCString **v14;
  PCString **v15;
  _QWORD *v16;
  PCString *v17;
  int v18;
  char *v19;
  char *v20;
  size_t v21;

  if (a4 >= 1)
  {
    v7 = (_QWORD *)MEMORY[0x1E0DE4A60];
    v8 = a4;
    do
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)"\t", 1);
      --v8;
    }
    while (v8);
  }
  v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x1E0DE4A60], (uint64_t)"Folder ", 7);
  CStr = PCString::createCStr((PCString *)a3 + 4);
  if (CStr)
  {
    v11 = CStr;
    v12 = strlen(CStr);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)v11, v12);
    free(v11);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)":\n", 2);
  v13 = (PCString ***)*((_QWORD *)a3 + 14);
  v15 = *v13;
  v14 = v13[1];
  if (*v13 != v14)
  {
    v16 = (_QWORD *)MEMORY[0x1E0DE4A60];
    do
    {
      v17 = *v15;
      if ((BYTE1((*v15)[7].var0) & 0x10) != 0)
      {
      }
      else
      {
        v18 = a4 + 1;
        if ((a4 & 0x80000000) == 0)
        {
          do
          {
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"\t", 1);
            --v18;
          }
          while (v18);
          v17 = *v15;
        }
        v19 = PCString::createCStr(v17 + 4);
        if (v19)
        {
          v20 = v19;
          v21 = strlen(v19);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)v20, v21);
          free(v20);
        }
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"\n", 1);
      }
      ++v15;
    }
    while (v15 != v14);
  }
}

- (OZFxPlugParameterHandler)initWithBaseChannel:(void *)a3 andPluginLock:(shared_ptr<OZFxPlugSharedLock>)a4
{
  uint64_t *ptr;
  OZFxPlugParameterHandler *v6;
  OZFxPlugParameterHandler *v7;
  _OWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t channelMap;
  uint64_t flagMap;
  char v14;
  objc_super v15;
  void *v16;

  ptr = (uint64_t *)a4.__ptr_;
  v15.receiver = self;
  v15.super_class = (Class)OZFxPlugParameterHandler;
  v16 = a3;
  v6 = -[OZFxPlugParameterHandler init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_viewControllerGroup = 0;
    v8 = (_OWORD *)operator new();
    *v8 = 0u;
    v8[1] = 0u;
    v8[2] = 0u;
    v7->_folderStack = v8;
    v9 = (_QWORD *)operator new();
    v9[2] = 0;
    v9[1] = 0;
    *v9 = v9 + 1;
    v7->_channelMap = v9;
    v10 = (_QWORD *)operator new();
    v10[1] = 0;
    v10[2] = 0;
    *v10 = v10 + 1;
    v7->_flagMap = v10;
    v7->_baseChannel = a3;
    v7->_renderer = 0;
    *(_WORD *)&v7->_startActionCalled = 0;
    v7->_numWriteActions = 0;
    *(_DWORD *)&v7->_postAddParameters = 0;
    atomic_store(0, (unsigned __int8 *)&v7->_pluginRemoved);
    v7->_sendingNotifications = 0;
    std::deque<OZChannelFolder *>::push_back((_QWORD *)v7->_folderStack, &v16);
    channelMap = (uint64_t)v7->_channelMap;
    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy(channelMap, *(_QWORD **)(channelMap + 8));
    *(_QWORD *)channelMap = channelMap + 8;
    *(_QWORD *)(channelMap + 16) = 0;
    *(_QWORD *)(channelMap + 8) = 0;
    flagMap = (uint64_t)v7->_flagMap;
    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy(flagMap, *(_QWORD **)(flagMap + 8));
    *(_QWORD *)flagMap = flagMap + 8;
    *(_QWORD *)(flagMap + 16) = 0;
    *(_QWORD *)(flagMap + 8) = 0;
    v14 = 0;
    std::deque<BOOL>::push_back(&v7->_suppressChannelChangesStack.c.__map_.__first_, &v14);
    v7->_hasPathParameters = 0;
    std::shared_ptr<TXTextStyle>::operator=[abi:ne180100](&v7->_fxPlugLock.__ptr_, ptr);
  }
  return v7;
}

- (OZFxPlugParameterHandler)initWithBaseChannel:(void *)a3 andCopy:(id)a4 andPluginLock:(shared_ptr<OZFxPlugSharedLock>)a5
{
  uint64_t *ptr;
  OZFxPlugParameterHandler *v8;
  OZFxPlugParameterHandler *v9;
  _OWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t channelMap;
  uint64_t flagMap;
  char v16;
  objc_super v17;
  void *v18;

  ptr = (uint64_t *)a5.__ptr_;
  v17.receiver = self;
  v17.super_class = (Class)OZFxPlugParameterHandler;
  v18 = a3;
  v8 = -[OZFxPlugParameterHandler init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_viewControllerGroup = 0;
    v10 = (_OWORD *)operator new();
    *v10 = 0u;
    v10[1] = 0u;
    v10[2] = 0u;
    v9->_folderStack = v10;
    v11 = (_QWORD *)operator new();
    v11[2] = 0;
    v11[1] = 0;
    *v11 = v11 + 1;
    v9->_channelMap = v11;
    v12 = (_QWORD *)operator new();
    v12[2] = 0;
    v12[1] = 0;
    *v12 = v12 + 1;
    v9->_flagMap = v12;
    v9->_baseChannel = a3;
    v9->_renderer = 0;
    *(_WORD *)&v9->_startActionCalled = 0;
    v9->_numWriteActions = 0;
    v9->_postAddParameters = objc_msgSend(a4, "doneAddingParams");
    v9->_hasPointParam = *((_BYTE *)a4 + 113);
    v9->_isNewGradientColorize = *((_BYTE *)a4 + 114);
    v9->_appTerminating = 0;
    atomic_store(0, (unsigned __int8 *)&v9->_pluginRemoved);
    v9->_sendingNotifications = 0;
    std::deque<OZChannelFolder *>::push_back((_QWORD *)v9->_folderStack, &v18);
    channelMap = (uint64_t)v9->_channelMap;
    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy(channelMap, *(_QWORD **)(channelMap + 8));
    *(_QWORD *)channelMap = channelMap + 8;
    *(_QWORD *)(channelMap + 16) = 0;
    *(_QWORD *)(channelMap + 8) = 0;
    flagMap = (uint64_t)v9->_flagMap;
    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy(flagMap, *(_QWORD **)(flagMap + 8));
    *(_QWORD *)flagMap = flagMap + 8;
    *(_QWORD *)(flagMap + 16) = 0;
    *(_QWORD *)(flagMap + 8) = 0;
    v16 = 0;
    std::deque<BOOL>::push_back(&v9->_suppressChannelChangesStack.c.__map_.__first_, &v16);
    v9->_hasPathParameters = *((_BYTE *)a4 + 256);
    if (v9 != a4)
      std::vector<int>::__assign_with_size[abi:ne180100]<int *,int *>((char *)&v9->_fullWidthCustomParams, *((char **)a4 + 33), *((_QWORD *)a4 + 34), (uint64_t)(*((_QWORD *)a4 + 34) - *((_QWORD *)a4 + 33)) >> 2);
    std::shared_ptr<TXTextStyle>::operator=[abi:ne180100](&v9->_fxPlugLock.__ptr_, ptr);
    -[OZFxPlugParameterHandler copyFolderRecursiveFrom:To:](v9, "copyFolderRecursiveFrom:To:", *((_QWORD *)a4 + 7), v18);
    -[OZFxPlugParameterHandler copyValueGettersFrom:](v9, "copyValueGettersFrom:", a4);
  }
  return v9;
}

- (OZFxPlugParameterHandler)initWithBaseChannel:(void *)a3 andCopy:(id)a4 Skip:(int)a5 andPluginLock:(shared_ptr<OZFxPlugSharedLock>)a6
{
  uint64_t *ptr;
  uint64_t v7;
  OZFxPlugParameterHandler *v10;
  OZFxPlugParameterHandler *v11;
  _OWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t channelMap;
  uint64_t flagMap;
  char v18;
  objc_super v19;
  void *v20;

  ptr = (uint64_t *)a6.__ptr_;
  v7 = *(_QWORD *)&a5;
  v19.receiver = self;
  v19.super_class = (Class)OZFxPlugParameterHandler;
  v20 = a3;
  v10 = -[OZFxPlugParameterHandler init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_viewControllerGroup = 0;
    v12 = (_OWORD *)operator new();
    *v12 = 0u;
    v12[1] = 0u;
    v12[2] = 0u;
    v11->_folderStack = v12;
    v13 = (_QWORD *)operator new();
    v13[2] = 0;
    v13[1] = 0;
    *v13 = v13 + 1;
    v11->_channelMap = v13;
    v14 = (_QWORD *)operator new();
    v14[2] = 0;
    v14[1] = 0;
    *v14 = v14 + 1;
    v11->_flagMap = v14;
    v11->_baseChannel = a3;
    v11->_renderer = 0;
    *(_WORD *)&v11->_startActionCalled = 0;
    v11->_numWriteActions = 0;
    v11->_postAddParameters = objc_msgSend(a4, "doneAddingParams");
    v11->_hasPointParam = *((_BYTE *)a4 + 113);
    v11->_isNewGradientColorize = *((_BYTE *)a4 + 114);
    v11->_appTerminating = 0;
    atomic_store(0, (unsigned __int8 *)&v11->_pluginRemoved);
    v11->_sendingNotifications = 0;
    std::deque<OZChannelFolder *>::push_back((_QWORD *)v11->_folderStack, &v20);
    channelMap = (uint64_t)v11->_channelMap;
    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy(channelMap, *(_QWORD **)(channelMap + 8));
    *(_QWORD *)channelMap = channelMap + 8;
    *(_QWORD *)(channelMap + 16) = 0;
    *(_QWORD *)(channelMap + 8) = 0;
    flagMap = (uint64_t)v11->_flagMap;
    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy(flagMap, *(_QWORD **)(flagMap + 8));
    *(_QWORD *)flagMap = flagMap + 8;
    *(_QWORD *)(flagMap + 16) = 0;
    *(_QWORD *)(flagMap + 8) = 0;
    v18 = 0;
    std::deque<BOOL>::push_back(&v11->_suppressChannelChangesStack.c.__map_.__first_, &v18);
    v11->_hasPathParameters = *((_BYTE *)a4 + 256);
    if (v11 != a4)
      std::vector<int>::__assign_with_size[abi:ne180100]<int *,int *>((char *)&v11->_fullWidthCustomParams, *((char **)a4 + 33), *((_QWORD *)a4 + 34), (uint64_t)(*((_QWORD *)a4 + 34) - *((_QWORD *)a4 + 33)) >> 2);
    std::shared_ptr<TXTextStyle>::operator=[abi:ne180100](&v11->_fxPlugLock.__ptr_, ptr);
    -[OZFxPlugParameterHandler copyFolderRecursiveFrom:To:Skip:](v11, "copyFolderRecursiveFrom:To:Skip:", *((_QWORD *)a4 + 7), v20, v7);
    -[OZFxPlugParameterHandler copyValueGettersFrom:](v11, "copyValueGettersFrom:", a4);
  }
  return v11;
}

- (void)dealloc
{
  _QWORD **channelMap;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  char *flagMap;
  const PCString *v15;
  _QWORD *folderStack;
  uint64_t v17;
  _QWORD **v18;
  OZChannelBase *renderer;
  uint64_t v20;
  _QWORD **v21;
  objc_super v22;

  channelMap = (_QWORD **)self->_channelMap;
  v4 = channelMap + 1;
  v5 = *channelMap;
  if (*channelMap == channelMap + 1)
    goto LABEL_22;
  do
  {
    v6 = v5[5];
    if (v6)
    {
      {
        goto LABEL_6;
      }
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    }
    v5[5] = 0;
LABEL_6:
    v7 = (_QWORD *)v5[1];
    if (v7)
    {
      do
      {
        v8 = v7;
        v7 = (_QWORD *)*v7;
      }
      while (v7);
    }
    else
    {
      do
      {
        v8 = (_QWORD *)v5[2];
        v9 = *v8 == (_QWORD)v5;
        v5 = v8;
      }
      while (!v9);
    }
    v5 = v8;
  }
  while (v8 != v4);
  channelMap = (_QWORD **)self->_channelMap;
  v10 = *channelMap;
  if (*channelMap != v4)
  {
    do
    {
      v11 = v10[5];
      if (v11)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
        v10[5] = 0;
      }
      v12 = (_QWORD *)v10[1];
      if (v12)
      {
        do
        {
          v13 = v12;
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          v13 = (_QWORD *)v10[2];
          v9 = *v13 == (_QWORD)v10;
          v10 = v13;
        }
        while (!v9);
      }
      v10 = v13;
    }
    while (v13 != v4);
    channelMap = (_QWORD **)self->_channelMap;
  }
LABEL_22:
  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)channelMap, channelMap[1]);
  *channelMap = channelMap + 1;
  channelMap[2] = 0;
  channelMap[1] = 0;
  flagMap = (char *)self->_flagMap;
  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)flagMap, *((_QWORD **)flagMap + 1));
  *(_QWORD *)flagMap = flagMap + 8;
  *((_QWORD *)flagMap + 2) = 0;
  *((_QWORD *)flagMap + 1) = 0;
  folderStack = self->_folderStack;
  if (folderStack)
  {
    v17 = std::deque<unsigned long>::~deque[abi:ne180100](folderStack);
    MEMORY[0x1B5E29170](v17, 0x1080C40BE8D5F09);
  }
  self->_folderStack = 0;
  v18 = (_QWORD **)self->_channelMap;
  if (v18)
  {
    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)self->_channelMap, v18[1]);
    MEMORY[0x1B5E29170](v18, 0x1020C4062D53EE8);
  }
  self->_channelMap = 0;
  renderer = (OZChannelBase *)self->_renderer;
  if (renderer)
  {
    v20 = OZChannelBase::setRangeName(renderer, v15);
    MEMORY[0x1B5E29170](v20, 0xC400A2AC0F1);
  }
  self->_renderer = 0;
  v21 = (_QWORD **)self->_flagMap;
  if (v21)
  {
    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)self->_flagMap, v21[1]);
    MEMORY[0x1B5E29170](v21, 0x1020C4062D53EE8);
  }
  self->_flagMap = 0;
  v22.receiver = self;
  v22.super_class = (Class)OZFxPlugParameterHandler;
  -[OZFxPlugParameterHandler dealloc](&v22, sel_dealloc);
}

- (void)appWillTerminate:(id)a3
{
  self->_appTerminating = 1;
}

- (void)setPluginRemoved:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_pluginRemoved);
}

- (void)copyFolderRecursiveFrom:(void *)a3 To:(void *)a4
{
  -[OZFxPlugParameterHandler copyFolderRecursiveFrom:To:Skip:](self, "copyFolderRecursiveFrom:To:Skip:", a3, a4, 0);
}

- (void)copyFolderRecursiveFrom:(void *)a3 To:(void *)a4 Skip:(int)a5
{
  uint64_t *v6;
  uint64_t v7;
  const void **v8;
  uint64_t v9;
  const void **v10;
  OZChannelBase *v12;
  uint64_t **channelMap;
  OZChannelBlindData *v14;
  OZChannelBlindData *v15;
  void *v16;
  __shared_weak_count *cntrl;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  OZChannelBlindData **value;
  OZChannelBlindData **end;
  OZChannelBlindData **v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  OZChannelBlindData **v32;
  OZChannelBlindData **v33;
  OZChannelBlindData **begin;
  OZChannelBlindData *v35;
  OZChannelButton *v36;
  OZChannelButton *v37;
  __shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  PCString v45;
  const void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __compressed_pair<OZChannelBlindData **, std::allocator<OZChannelBlindData *>> *p_end_cap;
  vector<OZChannelBlindData *, std::allocator<OZChannelBlindData *>> *p_customParameterList;
  PCString v53;
  OZFxPlugSharedLock *v54;
  __shared_weak_count *v55;
  uint64_t v56;
  void *v57;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v59;
  _DWORD *v60[2];

  if (a3)
  {
    if (a4)
    {
      v6 = (uint64_t *)*((_QWORD *)a3 + 14);
      if (v6)
      {
        v7 = *v6;
        v8 = *(const void ***)(*((_QWORD *)a3 + 14) + 8);
        v9 = 8 * (a5 - 1) + 8;
        if (a5 <= 0)
          v9 = 0;
        v10 = (const void **)(v7 + v9);
        if ((const void **)(v7 + v9) != v8)
        {
          p_end_cap = &self->_customParameterList.__end_cap_;
          p_customParameterList = &self->_customParameterList;
          do
          {
            v12 = (OZChannelBase *)(*(uint64_t (**)(const void *, SEL))(*(_QWORD *)*v10 + 248))(*v10, a2);
            OZChannelFolder::push_back((OZChannelFolder *)a4, v12);
            channelMap = (uint64_t **)self->_channelMap;
            LODWORD(v56) = *((_DWORD *)*v10 + 6);
            v60[0] = &v56;
            std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, (unsigned int *)&v56, (uint64_t)&std::piecewise_construct, v60)[5] = (uint64_t *)v12;
            if (v12)
            {
              if (v14)
              {
                v15 = v14;
                v16 = -[OZFxPlugParameterHandler getScene](self, "getScene");
                cntrl = self->_fxPlugLock.__cntrl_;
                ptr = self->_fxPlugLock.__ptr_;
                v59 = cntrl;
                if (cntrl)
                {
                  v18 = (unint64_t *)((char *)cntrl + 8);
                  do
                    v19 = __ldxr(v18);
                  while (__stxr(v19 + 1, v18));
                }
                OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)v60, (uint64_t)&ptr);
                v20 = (std::__shared_weak_count *)v59;
                if (v59)
                {
                  v21 = (unint64_t *)((char *)v59 + 8);
                  do
                    v22 = __ldaxr(v21);
                  while (__stlxr(v22 - 1, v21));
                  if (!v22)
                  {
                    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
                    std::__shared_weak_count::__release_weak(v20);
                  }
                }
                v23 = *(_QWORD *)v60[0];
                v56 = 0;
                v57 = 0;
                LODWORD(v56) = *((_DWORD *)v15 + 6);
                HIDWORD(v56) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v23 + 40))(v23);
                v57 = v16;
                OZChannelBlindData::setInterpolateContext(v15, (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v56, 16));
                end = self->_customParameterList.__end_;
                value = self->_customParameterList.__end_cap_.__value_;
                if (end >= value)
                {
                  v27 = end - p_customParameterList->__begin_;
                  if ((unint64_t)(v27 + 1) >> 61)
                    std::vector<double>::__throw_length_error[abi:ne180100]();
                  v28 = (char *)value - (char *)p_customParameterList->__begin_;
                  v29 = v28 >> 2;
                  if (v28 >> 2 <= (unint64_t)(v27 + 1))
                    v29 = v27 + 1;
                  if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
                    v30 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v30 = v29;
                  if (v30)
                    v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)p_end_cap, v30);
                  else
                    v31 = 0;
                  v32 = (OZChannelBlindData **)&v31[8 * v27];
                  *v32 = v15;
                  v26 = v32 + 1;
                  begin = self->_customParameterList.__begin_;
                  v33 = self->_customParameterList.__end_;
                  if (v33 != begin)
                  {
                    do
                    {
                      v35 = *--v33;
                      *--v32 = v35;
                    }
                    while (v33 != begin);
                    v33 = p_customParameterList->__begin_;
                  }
                  self->_customParameterList.__begin_ = v32;
                  self->_customParameterList.__end_ = v26;
                  self->_customParameterList.__end_cap_.__value_ = (OZChannelBlindData **)&v31[8 * v30];
                  if (v33)
                    operator delete(v33);
                }
                else
                {
                  *end = v15;
                  v26 = end + 1;
                }
                self->_customParameterList.__end_ = v26;
                OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v60);
              }
              if (v36)
              {
                v37 = v36;
                v38 = self->_fxPlugLock.__cntrl_;
                v54 = self->_fxPlugLock.__ptr_;
                v55 = v38;
                if (v38)
                {
                  v39 = (unint64_t *)((char *)v38 + 8);
                  do
                    v40 = __ldxr(v39);
                  while (__stxr(v40 + 1, v39));
                }
                OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)v60, (uint64_t)&v54);
                v41 = (std::__shared_weak_count *)v55;
                if (v55)
                {
                  v42 = (unint64_t *)((char *)v55 + 8);
                  do
                    v43 = __ldaxr(v42);
                  while (__stlxr(v43 - 1, v42));
                  if (!v43)
                  {
                    ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
                    std::__shared_weak_count::__release_weak(v41);
                  }
                }
                v44 = *(_QWORD *)v60[0];
                PCString::PCString(&v53, &v37->var20);
                v45.var0 = (__CFString *)&v53;
                OZChannelButton::setCallbackSelectorAsString(v37, v45, *(void **)(v44 + 24));
                PCString::~PCString(&v53);
                OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v60);
              }
            }
            v46 = *v10;
            if (*v10)
            {
              if (v47)
              {
                if (!v48 && !v49)
                {
                  if (v12)
                  else
                    v50 = 0;
                  -[OZFxPlugParameterHandler copyFolderRecursiveFrom:To:](self, "copyFolderRecursiveFrom:To:", v47, v50, p_end_cap);
                }
              }
            }
            ++v10;
          }
          while (v10 != v8);
        }
      }
    }
  }
}

- (void)setViewControllerGroup:(id)a3
{
  self->_viewControllerGroup = (OZViewControllerGroup *)a3;
}

- (void)stopObservingViewControllerGroup
{
  self->_viewControllerGroup = 0;
}

- (void)copyValueGettersFrom:(id)a3
{
  char *v3;
  char *v4;
  uint64_t **p_paramCreationMap;
  uint64_t **v6;
  __int128 v7;
  char *v8;
  char *v9;
  BOOL v10;
  _DWORD *v11;

  v3 = (char *)*((_QWORD *)a3 + 4);
  v4 = (char *)a3 + 40;
  if (v3 != (char *)a3 + 40)
  {
    p_paramCreationMap = (uint64_t **)&self->_paramCreationMap;
    do
    {
      v11 = v3 + 32;
      v6 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(p_paramCreationMap, (unsigned int *)v3 + 8, (uint64_t)&std::piecewise_construct, &v11);
      v7 = *(_OWORD *)(v3 + 40);
      v6[7] = (uint64_t *)*((_QWORD *)v3 + 7);
      *(_OWORD *)(v6 + 5) = v7;
      v8 = (char *)*((_QWORD *)v3 + 1);
      if (v8)
      {
        do
        {
          v9 = v8;
          v8 = *(char **)v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (char *)*((_QWORD *)v3 + 2);
          v10 = *(_QWORD *)v9 == (_QWORD)v3;
          v3 = v9;
        }
        while (!v10);
      }
      v3 = v9;
    }
    while (v9 != v4);
  }
}

- (void)clearImageList
{
  uint64_t *ImageList;
  uint64_t v3;
  uint64_t v4;

  ImageList = (uint64_t *)OZFxPlugRenderContextManager::getImageList(&self->_threadContextManager);
  v3 = ImageList[1];
  v4 = *ImageList;
  while (v3 != v4)
    v3 = std::shared_ptr<HGCPUComputeDevice const>::~shared_ptr[abi:ne180100](v3 - 16);
  ImageList[1] = v4;
}

- (void)getScene
{
  unsigned __int8 v2;
  OZChannelBase *baseChannel;
  uint64_t ObjectManipulator;

  v2 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
  if ((v2 & 1) == 0
    && (baseChannel = (OZChannelBase *)self->_baseChannel) != 0
    && (ObjectManipulator = OZChannelBase::getObjectManipulator(baseChannel)) != 0)
  {
    return (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)ObjectManipulator + 264))(ObjectManipulator);
  }
  else
  {
    return 0;
  }
}

- (void)getSceneNode
{
  OZChannelBase *baseChannel;
  uint64_t ObjectManipulator;

  baseChannel = (OZChannelBase *)self->_baseChannel;
  if (baseChannel && (ObjectManipulator = OZChannelBase::getObjectManipulator(baseChannel)) != 0)
    return (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)ObjectManipulator + 232))(ObjectManipulator);
  else
    return 0;
}

- (id)motionEffectForLockedSharedBase:(void *)a3
{
  unsigned __int8 v3;

  if (!a3)
    return 0;
  v3 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
  if ((v3 & 1) != 0)
    return 0;
  else
    return (id)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)a3, (OZFactoryBase *)a2);
}

- (PCNSRef<FFMotionEffect)motionEffectRef
{
  id *v2;
  id *v4;
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  PCNSRef<FFMotionEffect *> v11;
  id v12;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v14;
  OZLocking *v15[2];

  v4 = v2;
  *v2 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v14 = cntrl;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v15, (uint64_t)&ptr);
  v8 = (std::__shared_weak_count *)v14;
  if (v14)
  {
    v9 = (unint64_t *)((char *)v14 + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (*(_QWORD *)v15[0])
  {
    PCMakeNSRefAndRetain<EAGLContext *>(-[OZFxPlugParameterHandler motionEffectForLockedSharedBase:](self, "motionEffectForLockedSharedBase:"), &v12);
    ProCore_Impl::PCNSRefImpl::operator=(v4, &v12);
    ProCore_Impl::PCNSRefImpl::release(&v12);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v15);
  return v11;
}

- (void)sendUpdateEvent
{
  OZDocument **v2;

  v2 = -[OZFxPlugParameterHandler getScene](self, "getScene");
  if (v2)
    OZDocument::postNotification(v2[198], 2);
}

- (void)callParameterChanged:(id)a3 forParameterID:(unsigned int)a4 modifiedParameterIDs:(void *)a5 changedParameters:(id)a6 supportsParametersChanged:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v10;
  __int32 *v13;
  __int32 *v14;
  __int32 *v15;
  void *v16;
  __shared_weak_count *cntrl;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  __int32 *v24;
  _DWORD *v25;
  __int32 *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  int v34;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v36;
  OZLocking *v37[2];

  v7 = a7;
  v10 = *(_QWORD *)&a4;
  v13 = (__int32 *)*((_QWORD *)a5 + 1);
  v14 = wmemchr(*(__int32 **)a5, a4, ((uint64_t)v13 - *(_QWORD *)a5) >> 2);
  if (v14)
    v15 = v14;
  else
    v15 = v13;
  if (v15 == *((__int32 **)a5 + 1))
  {
    v16 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.FinalCut")) & 1) != 0
      || objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.iMovieApp")))
    {
      cntrl = self->_fxPlugLock.__cntrl_;
      ptr = self->_fxPlugLock.__ptr_;
      v36 = cntrl;
      if (cntrl)
      {
        v18 = (unint64_t *)((char *)cntrl + 8);
        do
          v19 = __ldxr(v18);
        while (__stxr(v19 + 1, v18));
      }
      OZFxPlugLockSentinel::OZFxPlugLockSentinel(v37, (uint64_t)&ptr);
      v20 = (std::__shared_weak_count *)v36;
      if (v36)
      {
        v21 = (unint64_t *)((char *)v36 + 8);
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }
      OZFxPlugRenderContextManager::pushContext(objc_msgSend(*(id *)(*(_QWORD *)v37[0] + 40), "contextManager", ptr), 1);
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v37);
    }
    if (v7)
      objc_msgSend(a6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10));
    else
      objc_msgSend(a3, "parameterChanged:", v10);
    v23 = *((_QWORD *)a5 + 2);
    v24 = (__int32 *)*((_QWORD *)a5 + 1);
    if ((unint64_t)v24 >= v23)
    {
      v26 = *(__int32 **)a5;
      v27 = ((uint64_t)v24 - *(_QWORD *)a5) >> 2;
      v28 = v27 + 1;
      if ((unint64_t)(v27 + 1) >> 62)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v29 = v23 - (_QWORD)v26;
      if (v29 >> 1 > v28)
        v28 = v29 >> 1;
      if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFFCLL)
        v30 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v30 = v28;
      if (v30)
      {
        v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)a5 + 16, v30);
        v26 = *(__int32 **)a5;
        v24 = (__int32 *)*((_QWORD *)a5 + 1);
      }
      else
      {
        v31 = 0;
      }
      v32 = &v31[4 * v27];
      v33 = &v31[4 * v30];
      *(_DWORD *)v32 = v10;
      v25 = v32 + 4;
      while (v24 != v26)
      {
        v34 = *--v24;
        *((_DWORD *)v32 - 1) = v34;
        v32 -= 4;
      }
      *(_QWORD *)a5 = v32;
      *((_QWORD *)a5 + 1) = v25;
      *((_QWORD *)a5 + 2) = v33;
      if (v26)
        operator delete(v26);
    }
    else
    {
      *v24 = v10;
      v25 = v24 + 1;
    }
    *((_QWORD *)a5 + 1) = v25;
  }
}

- (BOOL)folderWasModified:(void *)a3 inDocument:(void *)a4 parameterID:(unsigned int)a5 modifiedParamID:(void *)a6 supportsParametersChanged:(BOOL)a7 paramsChangedArray:(id)a8 target:(id)a9
{
  uint64_t v9;
  const OZChannelBase **v10;
  _BOOL8 v11;
  uint64_t v14;
  int v15;
  const OZChannelBase *v17;
  OZNotificationManager *v18;
  void *v19;
  __int32 *v20;
  __int32 *v21;
  __int32 *v22;
  unint64_t v23;
  __int32 *v24;
  _DWORD *v25;
  __int32 *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  int v34;
  char *v36;

  v9 = *((_QWORD *)a3 + 14);
  v10 = *(const OZChannelBase ***)v9;
  if (*(_QWORD *)v9 == *(_QWORD *)(v9 + 8))
  {
    LOBYTE(v15) = 0;
    return v15 & 1;
  }
  v11 = a7;
  v14 = *(_QWORD *)&a5;
  v15 = 0;
  v36 = (char *)a6 + 16;
  while (1)
  {
    v17 = *v10;
    v18 = (OZNotificationManager *)*((_QWORD *)a4 + 21);
    if (v18)
      break;
LABEL_6:
    if (v17)
    else
      v19 = 0;
    if (folderIsParameterType((unint64_t)v19))
      v15 |= -[OZFxPlugParameterHandler folderWasModified:inDocument:parameterID:modifiedParamID:supportsParametersChanged:paramsChangedArray:target:](self, "folderWasModified:inDocument:parameterID:modifiedParamID:supportsParametersChanged:paramsChangedArray:target:", v19, a4, v14, a6, v11, a8, a9);
    if (++v10 == *(const OZChannelBase ***)(v9 + 8))
      return v15 & 1;
  }
  if (!OZNotificationManager::wasChannelModified(v18, v17))
  {
    v17 = *v10;
    goto LABEL_6;
  }
  v20 = (__int32 *)*((_QWORD *)a6 + 1);
  v21 = wmemchr(*(__int32 **)a6, v14, ((uint64_t)v20 - *(_QWORD *)a6) >> 2);
  if (v21)
    v22 = v21;
  else
    v22 = v20;
  if (v22 == *((__int32 **)a6 + 1))
  {
    if (v11)
      objc_msgSend(a8, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14));
    else
      objc_msgSend(a9, "parameterChanged:", v14);
    v24 = (__int32 *)*((_QWORD *)a6 + 1);
    v23 = *((_QWORD *)a6 + 2);
    if ((unint64_t)v24 >= v23)
    {
      v26 = *(__int32 **)a6;
      v27 = ((uint64_t)v24 - *(_QWORD *)a6) >> 2;
      v28 = v27 + 1;
      if ((unint64_t)(v27 + 1) >> 62)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v29 = v23 - (_QWORD)v26;
      if (v29 >> 1 > v28)
        v28 = v29 >> 1;
      if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFFCLL)
        v30 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v30 = v28;
      if (v30)
      {
        v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)v36, v30);
        v26 = *(__int32 **)a6;
        v24 = (__int32 *)*((_QWORD *)a6 + 1);
      }
      else
      {
        v31 = 0;
      }
      v32 = &v31[4 * v27];
      v33 = &v31[4 * v30];
      *(_DWORD *)v32 = v14;
      v25 = v32 + 4;
      while (v24 != v26)
      {
        v34 = *--v24;
        *((_DWORD *)v32 - 1) = v34;
        v32 -= 4;
      }
      *(_QWORD *)a6 = v32;
      *((_QWORD *)a6 + 1) = v25;
      *((_QWORD *)a6 + 2) = v33;
      if (v26)
        operator delete(v26);
    }
    else
    {
      *v24 = v14;
      v25 = v24 + 1;
    }
    *((_QWORD *)a6 + 1) = v25;
  }
  LOBYTE(v15) = 1;
  return v15 & 1;
}

- (void)sendNotifications:(id)a3
{
  _QWORD *v5;
  uint64_t v6;
  char *channelMap;
  uint64_t v8;
  __shared_weak_count *cntrl;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  unsigned __int8 v15;
  char *v16;
  void *v17;
  OZNotificationManager *v18;
  char *v19;
  char *v20;
  BOOL v21;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v23;
  OZLocking *v24[2];
  void *__p;
  void *v26;
  uint64_t v27;

  if (!self->_sendingNotifications)
  {
    self->_sendingNotifications = 1;
    v5 = -[OZFxPlugParameterHandler getScene](self, "getScene");
    if (!v5 || (v6 = v5[198]) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_31:
      self->_sendingNotifications = 0;
      return;
    }
    channelMap = (char *)self->_channelMap;
    *(_BYTE *)(v6 + 101) = 1;
    __p = 0;
    v26 = 0;
    v27 = 0;
    v8 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    cntrl = self->_fxPlugLock.__cntrl_;
    ptr = self->_fxPlugLock.__ptr_;
    v23 = cntrl;
    if (cntrl)
    {
      v10 = (unint64_t *)((char *)cntrl + 8);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    OZFxPlugLockSentinel::OZFxPlugLockSentinel(v24, (uint64_t)&ptr);
    v12 = (std::__shared_weak_count *)v23;
    if (v23)
    {
      v13 = (unint64_t *)((char *)v23 + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    if (*(_QWORD *)v24[0])
    {
      v15 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
      if ((v15 & 1) == 0)
      {
        OZFxPlugSharedBase::restartPluginXPCIfNecessary(*(OZFxPlugSharedBase **)v24[0]);
        OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v24);
        v16 = *(char **)self->_channelMap;
        if (v16 != channelMap + 8)
        {
          do
          {
            v17 = (void *)*((_QWORD *)v16 + 5);
            v18 = *(OZNotificationManager **)(v6 + 168);
            if (v18 && OZNotificationManager::wasChannelModified(v18, *((const OZChannelBase **)v16 + 5)))
            {
              -[OZFxPlugParameterHandler callParameterChanged:forParameterID:modifiedParameterIDs:changedParameters:supportsParametersChanged:](self, "callParameterChanged:forParameterID:modifiedParameterIDs:changedParameters:supportsParametersChanged:", a3, *((unsigned int *)v16 + 8), &__p, v8, 0);
            }
            else
            {
              if (v17)
              if (folderIsParameterType((unint64_t)v17))
                -[OZFxPlugParameterHandler folderWasModified:inDocument:parameterID:modifiedParamID:supportsParametersChanged:paramsChangedArray:target:](self, "folderWasModified:inDocument:parameterID:modifiedParamID:supportsParametersChanged:paramsChangedArray:target:", v17, v6, *((unsigned int *)v16 + 8), &__p, 0, v8, a3, ptr);
            }
            v19 = (char *)*((_QWORD *)v16 + 1);
            if (v19)
            {
              do
              {
                v20 = v19;
                v19 = *(char **)v19;
              }
              while (v19);
            }
            else
            {
              do
              {
                v20 = (char *)*((_QWORD *)v16 + 2);
                v21 = *(_QWORD *)v20 == (_QWORD)v16;
                v16 = v20;
              }
              while (!v21);
            }
            v16 = v20;
          }
          while (v20 != channelMap + 8);
        }
        *(_BYTE *)(v6 + 101) = 0;
        if (__p)
        {
          v26 = __p;
          operator delete(__p);
        }
        goto LABEL_31;
      }
    }
    self->_sendingNotifications = 0;
    *(_BYTE *)(v6 + 101) = 0;
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v24);
    if (__p)
      operator delete(__p);
  }
}

- (void)channelMap
{
  return self->_channelMap;
}

- (void)updateChannelMap
{
  uint64_t **channelMap;
  char *v4;
  uint64_t *i;
  uint64_t v6;
  unsigned int v7;
  uint64_t *v8;
  char *v9;
  unsigned int v10;
  BOOL v11;
  uint64_t **v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  BOOL v16;
  uint64_t *v17;
  uint64_t *v18;
  unsigned int v19;
  unsigned int *v20;

  channelMap = (uint64_t **)self->_channelMap;
  v4 = (char *)(channelMap + 1);
  for (i = *channelMap; i != (uint64_t *)(channelMap + 1); v4 = (char *)(channelMap + 1))
  {
    v6 = i[5];
    v7 = *(_DWORD *)(v6 + 24);
    v19 = v7;
    v8 = channelMap[1];
    if (!v8)
      goto LABEL_13;
    v9 = v4;
    do
    {
      v10 = *((_DWORD *)v8 + 8);
      v11 = v10 >= v7;
      if (v10 >= v7)
        v12 = (uint64_t **)v8;
      else
        v12 = (uint64_t **)(v8 + 1);
      if (v11)
        v9 = (char *)v8;
      v8 = *v12;
    }
    while (*v12);
    if (v9 != v4 && v7 >= *((_DWORD *)v9 + 8))
    {
      v17 = (uint64_t *)i[1];
      if (v17)
      {
        do
        {
          i = v17;
          v17 = (uint64_t *)*v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          v18 = i;
          i = (uint64_t *)i[2];
        }
        while ((uint64_t *)*i != v18);
      }
    }
    else
    {
LABEL_13:
      v13 = (uint64_t *)i[1];
      v14 = i;
      if (v13)
      {
        do
        {
          v15 = v13;
          v13 = (uint64_t *)*v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          v15 = (uint64_t *)v14[2];
          v16 = *v15 == (_QWORD)v14;
          v14 = v15;
        }
        while (!v16);
      }
      v20 = &v19;
      std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v19, (uint64_t)&std::piecewise_construct, &v20)[5] = (uint64_t *)v6;
      std::__tree<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>>>::__remove_node_pointer((uint64_t **)self->_channelMap, i);
      operator delete(i);
      channelMap = (uint64_t **)self->_channelMap;
      i = v15;
    }
  }
}

- (vector<unsigned)imageParamIDs
{
  unsigned int *begin;
  _QWORD *v5;
  vector<unsigned int, std::allocator<unsigned int>> *v6;
  unsigned int *value;
  unsigned int *end;
  unsigned int *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  unsigned int *v15;
  unsigned int v16;
  _QWORD *v17;
  _QWORD *v18;
  BOOL v19;

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self[1].__begin_;
  v5 = *(_QWORD **)begin;
  if (*(unsigned int **)begin != begin + 2)
  {
    v6 = self;
    do
    {
      self = (vector<unsigned int, std::allocator<unsigned int>> *)v5[5];
      if (self)
      {
        if (self)
        {
          self = (vector<unsigned int, std::allocator<unsigned int>> *)OZChanSceneNodeRef::getNode((OZChannelBase *)self);
          if (self)
          {
            end = retstr->__end_;
            value = retstr->__end_cap_.__value_;
            if (end >= value)
            {
              self = (vector<unsigned int, std::allocator<unsigned int>> *)retstr->__begin_;
              v10 = end - retstr->__begin_;
              v11 = v10 + 1;
              if ((unint64_t)(v10 + 1) >> 62)
                std::vector<double>::__throw_length_error[abi:ne180100]();
              v12 = (char *)value - (char *)self;
              if (v12 >> 1 > v11)
                v11 = v12 >> 1;
              if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
                v13 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v13 = v11;
              if (v13)
              {
                v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&retstr->__end_cap_, v13);
                self = (vector<unsigned int, std::allocator<unsigned int>> *)retstr->__begin_;
                end = retstr->__end_;
              }
              else
              {
                v14 = 0;
              }
              v15 = (unsigned int *)&v14[4 * v10];
              *v15 = *((_DWORD *)v5 + 8);
              v9 = v15 + 1;
              while (end != (unsigned int *)self)
              {
                v16 = *--end;
                *--v15 = v16;
              }
              retstr->__begin_ = v15;
              retstr->__end_ = v9;
              retstr->__end_cap_.__value_ = (unsigned int *)&v14[4 * v13];
              if (self)
                operator delete(self);
            }
            else
            {
              *end = *((_DWORD *)v5 + 8);
              v9 = end + 1;
            }
            retstr->__end_ = v9;
          }
        }
      }
      v17 = (_QWORD *)v5[1];
      if (v17)
      {
        do
        {
          v18 = v17;
          v17 = (_QWORD *)*v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          v18 = (_QWORD *)v5[2];
          v19 = *v18 == (_QWORD)v5;
          v5 = v18;
        }
        while (!v19);
      }
      v5 = v18;
    }
    while (v18 != (_QWORD *)v6[1].__begin_ + 1);
  }
  return self;
}

- (unsigned)paramIDForImageWellWithSceneNode:(unsigned int)a3
{
  unsigned int *v5;
  unsigned int *v6;
  uint64_t **channelMap;
  uint64_t *v8;
  OZChannelBase *v9;
  _DWORD *Node;
  unsigned int v11;
  unsigned int v13;
  void *__p;
  unsigned int *v15;
  uint64_t v16;
  unsigned int *v17;

  if (!self)
  {
    v11 = 0;
    __p = 0;
    v15 = 0;
    v16 = 0;
    return v11;
  }
  -[OZFxPlugParameterHandler imageParamIDs](self, "imageParamIDs");
  v5 = (unsigned int *)__p;
  v6 = v15;
  if (__p == v15)
  {
    v11 = 0;
    if (!__p)
      return v11;
    goto LABEL_12;
  }
  while (1)
  {
    v13 = *v5;
    channelMap = (uint64_t **)self->_channelMap;
    v17 = &v13;
    v8 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v13, (uint64_t)&std::piecewise_construct, &v17)[5];
    if (v8)
    {
      if (v9)
      {
        Node = OZChanSceneNodeRef::getNode(v9);
        if (Node)
        {
          if (Node[20] == a3)
            break;
        }
      }
    }
    if (++v5 == v6)
    {
      v11 = 0;
      goto LABEL_9;
    }
  }
  v11 = v13;
LABEL_9:
  v5 = (unsigned int *)__p;
  if (__p)
  {
LABEL_12:
    v15 = v5;
    operator delete(v5);
  }
  return v11;
}

- (BOOL)containsParameterWithID:(unsigned int)a3
{
  _QWORD *channelMap;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  unsigned int v8;
  BOOL v9;
  char **v10;

  channelMap = self->_channelMap;
  v6 = (char *)channelMap[1];
  v4 = (char *)(channelMap + 1);
  v5 = v6;
  if (!v6)
    goto LABEL_12;
  v7 = v4;
  do
  {
    v8 = *((_DWORD *)v5 + 8);
    v9 = v8 >= a3;
    if (v8 >= a3)
      v10 = (char **)v5;
    else
      v10 = (char **)(v5 + 8);
    if (v9)
      v7 = v5;
    v5 = *v10;
  }
  while (*v10);
  if (v7 == v4 || *((_DWORD *)v7 + 8) > a3)
LABEL_12:
    v7 = v4;
  return v7 != v4;
}

- (void)saveParameterFlags
{
  _QWORD *channelMap;
  _QWORD *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t **flagMap;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;
  unsigned int v11;
  unsigned int *v12;

  channelMap = self->_channelMap;
  v3 = (_QWORD *)*channelMap;
  if ((_QWORD *)*channelMap != channelMap + 1)
  {
    do
    {
      v5 = v3[5];
      v11 = *(_DWORD *)(v5 + 24);
      v6 = *(uint64_t **)(v5 + 56);
      flagMap = (uint64_t **)self->_flagMap;
      v12 = &v11;
      std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(flagMap, &v11, (uint64_t)&std::piecewise_construct, &v12)[5] = v6;
      v8 = (_QWORD *)v3[1];
      if (v8)
      {
        do
        {
          v9 = v8;
          v8 = (_QWORD *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (_QWORD *)v3[2];
          v10 = *v9 == (_QWORD)v3;
          v3 = v9;
        }
        while (!v10);
      }
      v3 = v9;
    }
    while (v9 != (_QWORD *)self->_channelMap + 1);
  }
}

- (void)restoreParameterFlagsForChannel:(OZChannelBase *)a3
{
  _QWORD *channelMap;
  char *v4;
  char *v5;
  char *v6;
  unsigned int var3;
  char *v8;
  unsigned int v9;
  BOOL v10;
  char **v11;
  _QWORD *flagMap;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  unsigned int v17;
  BOOL v18;
  char **v19;

  channelMap = self->_channelMap;
  v6 = (char *)channelMap[1];
  v4 = (char *)(channelMap + 1);
  v5 = v6;
  if (v6)
  {
    var3 = a3->var3;
    v8 = v4;
    do
    {
      v9 = *((_DWORD *)v5 + 8);
      v10 = v9 >= var3;
      if (v9 >= var3)
        v11 = (char **)v5;
      else
        v11 = (char **)(v5 + 8);
      if (v10)
        v8 = v5;
      v5 = *v11;
    }
    while (*v11);
    if (v8 != v4 && var3 >= *((_DWORD *)v8 + 8) && *((OZChannelBase **)v8 + 5) == a3)
    {
      flagMap = self->_flagMap;
      v15 = (char *)flagMap[1];
      v13 = (char *)(flagMap + 1);
      v14 = v15;
      if (v15)
      {
        v16 = v13;
        do
        {
          v17 = *((_DWORD *)v14 + 8);
          v18 = v17 >= var3;
          if (v17 >= var3)
            v19 = (char **)v14;
          else
            v19 = (char **)(v14 + 8);
          if (v18)
            v16 = v14;
          v14 = *v19;
        }
        while (*v19);
        if (v16 != v13 && var3 >= *((_DWORD *)v16 + 8))
          OZChannelBase::setFlags(a3, a3->var7 & 0xFFFFFFFFFFBEFFC3 | *((_QWORD *)v16 + 5) & 0x41003CLL);
      }
    }
  }
}

- (OZChannelBase)channelWithID:(int)a3
{
  _QWORD *channelMap;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  unsigned int v8;
  BOOL v9;
  char **v10;

  channelMap = self->_channelMap;
  v6 = (char *)channelMap[1];
  v4 = (char *)(channelMap + 1);
  v5 = v6;
  if (!v6)
    return 0;
  v7 = v4;
  do
  {
    v8 = *((_DWORD *)v5 + 8);
    v9 = v8 >= a3;
    if (v8 >= a3)
      v10 = (char **)v5;
    else
      v10 = (char **)(v5 + 8);
    if (v9)
      v7 = v5;
    v5 = *v10;
  }
  while (*v10);
  if (v7 != v4 && *((_DWORD *)v7 + 8) <= a3)
    return (OZChannelBase *)*((_QWORD *)v7 + 5);
  else
    return 0;
}

- (unsigned)parameterCount
{
  char *channelMap;
  unsigned int result;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;
  int v11;
  _QWORD *v12;

  channelMap = (char *)self->_channelMap;
  result = *((_DWORD *)channelMap + 4);
  v4 = channelMap + 8;
  v5 = *(_QWORD **)channelMap;
  if (v4 != v5)
  {
    do
    {
      v6 = (_QWORD *)*v4;
      v7 = (_QWORD *)*v4;
      v8 = v4;
      if (*v4)
      {
        do
        {
          v9 = v7;
          v7 = (_QWORD *)v7[1];
        }
        while (v7);
      }
      else
      {
        do
        {
          v9 = (_QWORD *)v8[2];
          v10 = *v9 == (_QWORD)v8;
          v8 = v9;
        }
        while (v10);
      }
      v11 = *(_DWORD *)(v9[5] + 24) >> 4 > 0x270u;
      if (v6)
      {
        do
        {
          v12 = v6;
          v6 = (_QWORD *)v6[1];
        }
        while (v6);
      }
      else
      {
        do
        {
          v12 = (_QWORD *)v4[2];
          v10 = *v12 == (_QWORD)v4;
          v4 = v12;
        }
        while (v10);
      }
      result -= v11;
      v4 = v12;
    }
    while (v12 != v5);
  }
  return result;
}

- (OZChannelBase)parameterAtIndex:(unsigned int)a3
{
  unsigned int v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  BOOL v7;

  v3 = 0;
  v4 = *(_QWORD **)self->_channelMap;
  while (v3 != a3)
  {
    v5 = (_QWORD *)v4[1];
    if (v5)
    {
      do
      {
        v6 = v5;
        v5 = (_QWORD *)*v5;
      }
      while (v5);
    }
    else
    {
      do
      {
        v6 = (_QWORD *)v4[2];
        v7 = *v6 == (_QWORD)v4;
        v4 = v6;
      }
      while (!v7);
    }
    ++v3;
    v4 = v6;
    if (v3 > a3)
      return 0;
  }
  return (OZChannelBase *)v4[5];
}

- (void)removeParameter:(unsigned int)a3
{
  _QWORD *channelMap;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  unsigned int v9;
  BOOL v10;
  char **v11;
  OZChannelBase *v12;
  _QWORD *v13;
  uint64_t v14;
  OZChannelBlindData *v15;
  OZChannelBlindData **end;
  OZChannelBlindData **begin;
  uint64_t v18;
  OZChannelFolder *var6;
  OZChannelBlindData **v20;
  OZChannelBlindData **v21;
  int64_t v22;
  void *__p;
  _QWORD *v24;

  channelMap = self->_channelMap;
  v7 = (char *)channelMap[1];
  v5 = (char *)(channelMap + 1);
  v6 = v7;
  if (!v7)
    goto LABEL_12;
  v8 = v5;
  do
  {
    v9 = *((_DWORD *)v6 + 8);
    v10 = v9 >= a3;
    if (v9 >= a3)
      v11 = (char **)v6;
    else
      v11 = (char **)(v6 + 8);
    if (v10)
      v8 = v6;
    v6 = *v11;
  }
  while (*v11);
  if (v8 == v5 || *((_DWORD *)v8 + 8) > a3)
LABEL_12:
    v8 = v5;
  v12 = (OZChannelBase *)*((_QWORD *)v8 + 5);
  v24 = 0;
  v13 = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v24, 1uLL);
  *v13 = v12;
  __p = v13;
  v24 = &v13[v14];
  if (v12)
  {
    if (v15)
    {
      begin = self->_customParameterList.__begin_;
      end = self->_customParameterList.__end_;
      if (begin != end)
      {
        v18 = 0;
        while (v15 != begin[v18])
        {
          if (&begin[++v18] == end)
            goto LABEL_24;
        }
        v20 = &begin[v18];
        v21 = &begin[v18 + 1];
        v22 = (char *)end - (char *)v21;
        if (end != v21)
          memmove(&begin[v18], v21, (char *)end - (char *)v21);
        self->_customParameterList.__end_ = (OZChannelBlindData **)((char *)v20 + v22);
      }
    }
LABEL_24:
    var6 = v12->var6;
  }
  else
  {
    var6 = 0;
  }
  OZChannelFolder::removeDescendant(var6, v12);
  std::__tree<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>>>::__remove_node_pointer((uint64_t **)self->_channelMap, (uint64_t *)v8);
  operator delete(v8);
  -[OZFxPlugParameterHandler performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updateInspectorAndDeleteChannel_, objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v12), 0.0);
  if (__p)
    operator delete(__p);
}

- (void)updateInspectorAndDeleteChannel:(id)a3
{
  _QWORD *v4;
  OZDocument *v5;
  uint64_t v6;

  v6 = 0;
  objc_msgSend(a3, "getValue:", &v6);
  if (v6)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    v6 = 0;
  }
  v4 = -[OZFxPlugParameterHandler getScene](self, "getScene");
  if (v4)
  {
    v5 = (OZDocument *)v4[198];
    if (v5)
      OZDocument::postNotification(v5, 134742016);
  }
}

- (void)updateInspector
{
  _QWORD *v2;
  OZDocument *v3;

  v2 = -[OZFxPlugParameterHandler getScene](self, "getScene");
  if (v2)
  {
    v3 = (OZDocument *)v2[198];
    if (v3)
      OZDocument::postNotification(v3, 134742016);
  }
}

- (void)updateKeyframeEditor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__OZFxPlugParameterHandler_updateKeyframeEditor__block_invoke;
  block[3] = &unk_1E64DFA00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __48__OZFxPlugParameterHandler_updateKeyframeEditor__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  OZDocument *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "motionEffectRef");
    if (v5)
      goto LABEL_8;
    v2 = *(void **)(a1 + 32);
  }
  else
  {
    v5 = 0;
  }
  v3 = objc_msgSend(v2, "getScene");
  if (v3)
  {
    v4 = *(OZDocument **)(v3 + 1584);
    if (v4)
      OZDocument::postNotification(v4, 137216);
  }
LABEL_8:
  ProCore_Impl::PCNSRefImpl::release(&v5);
}

- (double)convertFromFigTime:(id *)a3 meOffset:(double)a4 motionEffect:(id)a5
{
  __int128 v6;

  return FigTimeToFrames(&v6, (uint64_t)-[OZFxPlugParameterHandler getScene](self, "getScene", a3->var0, *(_QWORD *)&a3->var1, a3->var3), (uint64_t)a5)- a4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertToFigTime:(SEL)a3 meOffset:(double)a4 motionEffect:(double)a5
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)FramesToFigTime((CMTime *)-[OZFxPlugParameterHandler getScene](self, "getScene"), (uint64_t)a6, (uint64_t)retstr, a4 + a5);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fxTimeToFigTime:(SEL)a3 withConversionData:(id)a4
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)a4.var1;
  return self;
}

- ($EBBD99E4BEE052F512DA5DADC73F537E)figTimeToFxTime:(id *)a3 withConversionData:(void *)a4
{
  __shared_weak_count *cntrl;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  unsigned __int8 v12;
  int v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v15;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v17;
  OZLocking *v18[2];
  id v19;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v20;

  v20 = 0;
  if (self)
    -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef", a3, a4);
  else
    v19 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v17 = cntrl;
  if (cntrl)
  {
    v7 = (unint64_t *)((char *)cntrl + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v18, (uint64_t)&ptr);
  v9 = (std::__shared_weak_count *)v17;
  if (v17)
  {
    v10 = (unint64_t *)((char *)v17 + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (!*(_QWORD *)v18[0] || (v12 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v12 & 1) != 0))
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v18);
  }
  else
  {
    v13 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)v18[0] + 160))(*(_QWORD *)v18[0]);
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v18);
    if (v13)
    {
      v20 = a3;
    }
    else
    {
      -[OZFxPlugParameterHandler convertFromFigTime:meOffset:motionEffect:](self, "convertFromFigTime:meOffset:motionEffect:", a3, v19, 0.0, ptr);
      v20 = v15;
    }
  }
  ProCore_Impl::PCNSRefImpl::release(&v19);
  return ($EBBD99E4BEE052F512DA5DADC73F537E)v20;
}

- ($EBBD99E4BEE052F512DA5DADC73F537E)figDurationToFxDuration:(id *)a3 withConversionData:(void *)a4
{
  $EBBD99E4BEE052F512DA5DADC73F537E v5;
  __shared_weak_count *cntrl;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  unsigned __int8 v12;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v15;
  OZLocking *v16[2];

  v5.var0 = COERCE_DOUBLE(-[OZFxPlugParameterHandler figTimeToFxTime:withConversionData:](self, "figTimeToFxTime:withConversionData:", a3, a4));
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v15 = cntrl;
  if (cntrl)
  {
    v7 = (unint64_t *)((char *)cntrl + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v16, (uint64_t)&ptr);
  v9 = (std::__shared_weak_count *)v15;
  if (v15)
  {
    v10 = (unint64_t *)((char *)v15 + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (*(_QWORD *)v16[0])
  {
    v12 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
    if ((v12 & 1) == 0)
      v5.var0 = TXTextLayout::getLineShift(*(TXTextLayout **)v16[0]) + v5.var0;
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v16);
  return ($EBBD99E4BEE052F512DA5DADC73F537E)v5.var1;
}

- (void)setHandlingOSCEvents:(BOOL)a3
{
  OZFxPlugRenderContextManager::setHandlingOSCEvent(&self->_threadContextManager, a3);
}

- (void)beginTimingOperation:(id *)a3 forChannel:(OZChannelBase *)a4
{
  return 0;
}

- (BOOL)usesRationalTime
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  unsigned __int8 v9;
  char v10;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v13;
  OZLocking *v14[2];

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v13 = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v14, (uint64_t)&ptr);
  v6 = (std::__shared_weak_count *)v13;
  if (v13)
  {
    v7 = (unint64_t *)((char *)v13 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if (!*(_QWORD *)v14[0] || (v9 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v9 & 1) != 0))
    v10 = 0;
  else
    v10 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)v14[0] + 160))(*(_QWORD *)v14[0]);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v14);
  return v10;
}

- (void)markForDynamicParameterUsage
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  unsigned __int8 v9;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v11;
  OZLocking *v12[2];

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v11 = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v12, (uint64_t)&ptr);
  v6 = (std::__shared_weak_count *)v11;
  if (v11)
  {
    v7 = (unint64_t *)((char *)v11 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if (*(_QWORD *)v12[0])
  {
    v9 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
    if ((v9 & 1) == 0)
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)v12[0] + 200))(*(_QWORD *)v12[0], 1);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v12);
}

- (void)addExistingChannel:(OZChannelBase *)a3
{
  _QWORD *folderStack;
  unint64_t v6;
  OZChannelFolder *v7;
  uint64_t **channelMap;
  unsigned int var3;
  unsigned int *p_var3;

  folderStack = self->_folderStack;
  v6 = folderStack[5] + folderStack[4] - 1;
  v7 = *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v6 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v6 & 0x1FF));
  OZChannelBase::registerParent(a3, v7);
  OZChannelFolder::push_back(v7, a3);
  channelMap = (uint64_t **)self->_channelMap;
  var3 = a3->var3;
  p_var3 = &var3;
  std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &var3, (uint64_t)&std::piecewise_construct, &p_var3)[5] = (uint64_t *)a3;
  -[OZFxPlugParameterHandler addParamMappingForParameterChannel:](self, "addParamMappingForParameterChannel:", a3);
}

- (void)addExistingGroup:(void *)a3
{
  void *v4;

  v4 = a3;
  -[OZFxPlugParameterHandler addExistingChannel:](self, "addExistingChannel:");
  std::deque<OZChannelFolder *>::push_back((_QWORD *)self->_folderStack, &v4);
}

- (id)displayName
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  unsigned __int8 v9;
  void *v10;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v13;
  OZLocking *v14[2];

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v13 = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v14, (uint64_t)&ptr);
  v6 = (std::__shared_weak_count *)v13;
  if (v13)
  {
    v7 = (unint64_t *)((char *)v13 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if (!*(_QWORD *)v14[0] || (v9 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v9 & 1) != 0))
    v10 = 0;
  else
    v10 = (void *)objc_msgSend(*(id *)(*(_QWORD *)v14[0] + 16), "displayName", ptr);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v14);
  return v10;
}

- (void)addMixSlider:(unsigned int)a3
{
  uint64_t v3;
  OZChannelPercent *v5;
  _QWORD *folderStack;
  unint64_t v7;
  PCString v8;

  v3 = *(_QWORD *)&a3;
  v5 = (OZChannelPercent *)operator new();
  PCURL::PCURL((PCURL *)&v8, CFSTR("Channel Mix"));
  folderStack = self->_folderStack;
  v7 = folderStack[5] + folderStack[4] - 1;
  OZChannelPercent::OZChannelPercent(v5, 1.0, &v8, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v7 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v7 & 0x1FF)), v3, 0, 0, 0);
  PCString::~PCString(&v8);
  -[OZFxPlugParameterHandler addMixSlider:withChannel:](self, "addMixSlider:withChannel:", v3, v5);
}

- (void)addMixSlider:(unsigned int)a3 withChannel:(OZChannelPercent *)a4
{
  uint64_t **channelMap;
  unsigned int v7;
  unsigned int *v8;

  v7 = a3;
  OZChannelBase::resetFlag((OZChannelBase *)a4, 16, 0);
  OZChannelBase::setFlag((OZChannelBase *)a4, 0x100000000, 0);
  channelMap = (uint64_t **)self->_channelMap;
  v8 = &v7;
  std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v7, (uint64_t)&std::piecewise_construct, &v8)[5] = (uint64_t *)a4;
}

- (OZChannelPercent)mixChannel
{
  _QWORD *channelMap;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  unsigned int v7;
  BOOL v8;
  char **v9;
  const void *v10;

  channelMap = self->_channelMap;
  v5 = (char *)channelMap[1];
  v3 = (char *)(channelMap + 1);
  v4 = v5;
  if (!v5)
    return 0;
  v6 = v3;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 >= 0x2711;
    if (v7 >= 0x2711)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 != v3 && *((_DWORD *)v6 + 8) <= 0x2711u && (v10 = (const void *)*((_QWORD *)v6 + 5)) != 0)
  else
    return 0;
}

- (double)mixAmountAtTime:(id)a3
{
  OZChannelPercent *v5;
  double v7;

  v7 = 1.0;
  v5 = -[OZFxPlugParameterHandler mixChannel](self, "mixChannel");
  if (!v5)
    return 1.0;
  -[OZFxPlugParameterHandler _getFloatValue:fromParm:atTime:](self, "_getFloatValue:fromParm:atTime:", &v7, v5->var3, a3.var1);
  return v7;
}

- (void)addFlipCheckbox:(unsigned int)a3
{
  uint64_t v3;
  OZChannelBool *v5;
  _QWORD *folderStack;
  unint64_t v7;
  PCString v8;

  v3 = *(_QWORD *)&a3;
  v5 = (OZChannelBool *)operator new();
  PCURL::PCURL((PCURL *)&v8, CFSTR("Channel Flip"));
  folderStack = self->_folderStack;
  v7 = folderStack[5] + folderStack[4] - 1;
  OZChannelBool::OZChannelBool(v5, 0, &v8, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v7 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v7 & 0x1FF)), v3, 0, 0, 0);
  PCString::~PCString(&v8);
  -[OZFxPlugParameterHandler addFlipCheckbox:withChannel:](self, "addFlipCheckbox:withChannel:", v3, v5);
}

- (void)addFlipCheckbox:(unsigned int)a3 withChannel:(OZChannelBool *)a4
{
  uint64_t **channelMap;
  unsigned int v7;
  unsigned int *v8;

  v7 = a3;
  OZChannelBase::setFlag((OZChannelBase *)a4, 4259872, 0);
  OZChannelBase::resetFlag((OZChannelBase *)a4, 16, 0);
  OZChannelBase::setFlag((OZChannelBase *)a4, 0x100000000, 0);
  channelMap = (uint64_t **)self->_channelMap;
  v8 = &v7;
  std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v7, (uint64_t)&std::piecewise_construct, &v8)[5] = (uint64_t *)a4;
}

- (OZChannelBool)flipChannel
{
  _QWORD *channelMap;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  unsigned int v7;
  BOOL v8;
  char **v9;
  const void *v10;

  channelMap = self->_channelMap;
  v5 = (char *)channelMap[1];
  v3 = (char *)(channelMap + 1);
  v4 = v5;
  if (!v5)
    return 0;
  v6 = v3;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 >= 0x2712;
    if (v7 >= 0x2712)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 != v3 && *((_DWORD *)v6 + 8) <= 0x2712u && (v10 = (const void *)*((_QWORD *)v6 + 5)) != 0)
  else
    return 0;
}

- (BOOL)shouldFlipPoints
{
  OZChannelBool *v2;

  v2 = -[OZFxPlugParameterHandler flipChannel](self, "flipChannel");
  if (v2)
    LOBYTE(v2) = OZChannel::getValueAsInt((OZChannel *)v2, MEMORY[0x1E0CA2E68], 0.0) == 1;
  return (char)v2;
}

- (void)addInputPointsCheckbox:(unsigned int)a3
{
  uint64_t v3;
  OZChannelBool *v5;
  _QWORD *folderStack;
  unint64_t v7;
  PCString v8;

  v3 = *(_QWORD *)&a3;
  v5 = (OZChannelBool *)operator new();
  PCURL::PCURL((PCURL *)&v8, CFSTR("Channel::Input Points"));
  folderStack = self->_folderStack;
  v7 = folderStack[5] + folderStack[4] - 1;
  OZChannelBool::OZChannelBool(v5, 1, &v8, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v7 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v7 & 0x1FF)), v3, 0, 0, 0);
  PCString::~PCString(&v8);
  -[OZFxPlugParameterHandler addInputPointsCheckbox:withChannel:](self, "addInputPointsCheckbox:withChannel:", v3, v5);
}

- (void)addInputPointsCheckbox:(unsigned int)a3 withChannel:(OZChannelBool *)a4
{
  uint64_t **channelMap;
  unsigned int v7;
  unsigned int *v8;

  v7 = a3;
  OZChannelBase::setFlag((OZChannelBase *)a4, 4259872, 0);
  OZChannelBase::resetFlag((OZChannelBase *)a4, 16, 0);
  OZChannelBase::setFlag((OZChannelBase *)a4, 0x100000000, 0);
  channelMap = (uint64_t **)self->_channelMap;
  v8 = &v7;
  std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v7, (uint64_t)&std::piecewise_construct, &v8)[5] = (uint64_t *)a4;
}

- (BOOL)useInputPoints
{
  OZChannelBool *v2;

  v2 = -[OZFxPlugParameterHandler inputPointsChannel](self, "inputPointsChannel");
  if (v2)
    LOBYTE(v2) = OZChannel::getValueAsInt((OZChannel *)v2, MEMORY[0x1E0CA2E68], 0.0) == 1;
  return (char)v2;
}

- (OZChannelBool)inputPointsChannel
{
  _QWORD *channelMap;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  unsigned int v7;
  BOOL v8;
  char **v9;
  const void *v10;

  channelMap = self->_channelMap;
  v5 = (char *)channelMap[1];
  v3 = (char *)(channelMap + 1);
  v4 = v5;
  if (!v5)
    return 0;
  v6 = v3;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 >= 0x2713;
    if (v7 >= 0x2713)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 != v3 && *((_DWORD *)v6 + 8) >> 2 <= 0x9C4u && (v10 = (const void *)*((_QWORD *)v6 + 5)) != 0)
  else
    return 0;
}

- (void)addAbsolutePointCheckbox:(unsigned int)a3
{
  OZChannelBool *v5;
  _QWORD *folderStack;
  unint64_t v7;
  uint64_t **channelMap;
  unsigned int v9;
  PCString v10;

  v5 = (OZChannelBool *)operator new();
  PCURL::PCURL((PCURL *)&v10, CFSTR("Channel::Absolute Points"));
  folderStack = self->_folderStack;
  v7 = folderStack[5] + folderStack[4] - 1;
  OZChannelBool::OZChannelBool(v5, 1, &v10, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v7 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v7 & 0x1FF)), a3, 0, 0, 0);
  PCString::~PCString(&v10);
  OZChannelBase::setFlag((OZChannelBase *)v5, 4259872, 0);
  OZChannelBase::resetFlag((OZChannelBase *)v5, 16, 0);
  OZChannelBase::setFlag((OZChannelBase *)v5, 0x100000000, 0);
  channelMap = (uint64_t **)self->_channelMap;
  v9 = 10004;
  v10.var0 = (__CFString *)&v9;
  std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v9, (uint64_t)&std::piecewise_construct, &v10)[5] = (uint64_t *)v5;
}

- (BOOL)useAbsolutePoints
{
  OZChannelBool *v2;

  v2 = -[OZFxPlugParameterHandler absolutePointsChannel](self, "absolutePointsChannel");
  if (v2)
    LOBYTE(v2) = OZChannel::getValueAsInt((OZChannel *)v2, MEMORY[0x1E0CA2E68], 0.0) == 1;
  return (char)v2;
}

- (OZChannelBool)absolutePointsChannel
{
  _QWORD *channelMap;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  unsigned int v7;
  BOOL v8;
  char **v9;
  const void *v10;

  channelMap = self->_channelMap;
  v5 = (char *)channelMap[1];
  v3 = (char *)(channelMap + 1);
  v4 = v5;
  if (!v5)
    return 0;
  v6 = v3;
  do
  {
    v7 = *((_DWORD *)v4 + 8) >> 2;
    v8 = v7 >= 0x9C5;
    if (v7 >= 0x9C5)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 != v3 && *((_DWORD *)v6 + 8) <= 0x2714u && (v10 = (const void *)*((_QWORD *)v6 + 5)) != 0)
  else
    return 0;
}

- (void)addPublishOSCCheckbox:(unsigned int)a3
{
  OZChannelBool *v5;
  _QWORD *folderStack;
  unint64_t v7;
  uint64_t **channelMap;
  unsigned int v9;
  PCString v10;

  if (!-[OZFxPlugParameterHandler publishOSCChannel](self, "publishOSCChannel"))
  {
    v5 = (OZChannelBool *)operator new();
    PCURL::PCURL((PCURL *)&v10, CFSTR("Channel::Publish OSC"));
    folderStack = self->_folderStack;
    v7 = folderStack[5] + folderStack[4] - 1;
    OZChannelBool::OZChannelBool(v5, 0, &v10, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v7 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v7 & 0x1FF)), a3, 0, 0, 0);
    PCString::~PCString(&v10);
    OZChannelBase::resetFlag((OZChannelBase *)v5, 16, 0);
    OZChannelBase::setFlag((OZChannelBase *)v5, 0x100000000, 0);
    channelMap = (uint64_t **)self->_channelMap;
    v9 = 10005;
    v10.var0 = (__CFString *)&v9;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v9, (uint64_t)&std::piecewise_construct, &v10)[5] = (uint64_t *)v5;
  }
}

- (OZChannelBool)publishOSCChannel
{
  _QWORD *channelMap;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  unsigned int v7;
  BOOL v8;
  char **v9;
  const void *v10;

  channelMap = self->_channelMap;
  v5 = (char *)channelMap[1];
  v3 = (char *)(channelMap + 1);
  v4 = v5;
  if (!v5)
    return 0;
  v6 = v3;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 >= 0x2715;
    if (v7 >= 0x2715)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 != v3 && *((_DWORD *)v6 + 8) <= 0x2715u && (v10 = (const void *)*((_QWORD *)v6 + 5)) != 0)
  else
    return 0;
}

- (void)setDoneAddingParams:(BOOL)a3
{
  self->_postAddParameters = a3;
}

- (BOOL)doneAddingParams
{
  return self->_postAddParameters;
}

- (void)removeHiddenParameters
{
  _QWORD *folderStack;
  unint64_t v4;
  OZChannelFolder *v5;
  OZChannelBool *v6;
  OZChannelBool *v7;

  folderStack = self->_folderStack;
  v4 = folderStack[5] + folderStack[4] - 1;
  v5 = *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v4 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v4 & 0x1FF));
  OZChannelFolder::removeDescendant(v5, (OZChannelBase *)-[OZFxPlugParameterHandler mixChannel](self, "mixChannel"));
  OZChannelFolder::removeDescendant(v5, (OZChannelBase *)-[OZFxPlugParameterHandler flipChannel](self, "flipChannel"));
  OZChannelFolder::removeDescendant(v5, (OZChannelBase *)-[OZFxPlugParameterHandler inputPointsChannel](self, "inputPointsChannel"));
  v6 = -[OZFxPlugParameterHandler absolutePointsChannel](self, "absolutePointsChannel");
  if (v6)
    OZChannelFolder::removeDescendant(v5, (OZChannelBase *)v6);
  v7 = -[OZFxPlugParameterHandler publishOSCChannel](self, "publishOSCChannel");
  if (v7)
    OZChannelFolder::removeDescendant(v5, (OZChannelBase *)v7);
}

- (void)reAddHiddenParameters
{
  _QWORD *folderStack;
  unint64_t v4;
  OZChannelFolder *v5;
  OZChannelBool *v6;
  OZChannelBool *v7;

  folderStack = self->_folderStack;
  v4 = folderStack[5] + folderStack[4] - 1;
  v5 = *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v4 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v4 & 0x1FF));
  OZChannelFolder::push_back(v5, (OZChannelBase *)-[OZFxPlugParameterHandler mixChannel](self, "mixChannel"));
  OZChannelFolder::push_back(v5, (OZChannelBase *)-[OZFxPlugParameterHandler flipChannel](self, "flipChannel"));
  OZChannelFolder::push_back(v5, (OZChannelBase *)-[OZFxPlugParameterHandler inputPointsChannel](self, "inputPointsChannel"));
  v6 = -[OZFxPlugParameterHandler absolutePointsChannel](self, "absolutePointsChannel");
  if (v6)
    OZChannelFolder::push_back(v5, (OZChannelBase *)v6);
  v7 = -[OZFxPlugParameterHandler publishOSCChannel](self, "publishOSCChannel");
  if (v7)
    OZChannelFolder::push_back(v5, (OZChannelBase *)v7);
  -[OZFxPlugParameterHandler updateInspector](self, "updateInspector");
}

- (void)movePublishOSCChannelToEnd
{
  OZChannelBool *v3;
  OZChannelBase *v4;
  _QWORD *folderStack;
  unint64_t v6;
  OZChannelFolder *v7;

  v3 = -[OZFxPlugParameterHandler publishOSCChannel](self, "publishOSCChannel");
  if (v3)
  {
    v4 = (OZChannelBase *)v3;
    folderStack = self->_folderStack;
    v6 = folderStack[5] + folderStack[4] - 1;
    v7 = *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v6 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v6 & 0x1FF));
    OZChannelFolder::removeDescendant(v7, (OZChannelBase *)v3);
    OZChannelFolder::push_back(v7, v4);
    -[OZFxPlugParameterHandler updateInspector](self, "updateInspector");
  }
}

- (void)forceRenderAtTime:(id)a3
{
  -[OZFxPlugParameterHandler _updateUIForParm:](self, "_updateUIForParm:", *(unsigned int *)(*(_QWORD *)self->_channelMap + 32));
}

- (void)setParameterFlags:(unsigned int)a3 forChannel:(OZChannelBase *)a4
{
  if ((a3 & 1) != 0)
  {
    (*((void (**)(OZChannelBase *, _QWORD, _QWORD))a4->var0 + 63))(a4, 0, 0);
    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  OZChannelBase::setFlag(a4, 4259872, 0);
  if ((a3 & 4) == 0)
  {
LABEL_4:
    if ((a3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  OZChannelBase::setFlag(a4, 4, 0);
  if ((a3 & 0x10) == 0)
  {
LABEL_5:
    if ((a3 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  OZChannelBase::setFlag(a4, 8, 0);
  OZChannelBase::resetFlag(a4, 0x100000000, 0);
  if ((a3 & 0x20) == 0)
  {
LABEL_6:
    if ((a3 & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  OZChannelBase::resetFlag(a4, 16, 0);
  if ((a3 & 0x200) == 0)
  {
LABEL_7:
    if ((a3 & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  OZChannelBase::setFlag(a4, 0x10000, 0);
  if ((a3 & 0x20000) == 0)
  {
LABEL_8:
    if ((a3 & 0x40) == 0)
      return;
LABEL_17:
    OZChannelBase::setFlag(a4, 0x1000000000, 0);
    return;
  }
LABEL_16:
  OZChannelBase::setFlag(a4, 0x400000, 0);
  if ((a3 & 0x40) != 0)
    goto LABEL_17;
}

- (BOOL)addFloatSliderWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(double)a5 parameterMin:(double)a6 parameterMax:(double)a7 sliderMin:(double)a8 sliderMax:(double)a9 delta:(double)a10 parmFlags:(unsigned int)a11
{
  uint64_t v11;
  _BOOL4 v21;
  OZChannelDouble *v22;
  _QWORD *folderStack;
  unint64_t v24;
  uint64_t **channelMap;
  uint64_t **v26;
  uint64_t v28;
  PCString v29;

  v11 = *(_QWORD *)&a11;
  LODWORD(v28) = a4;
  v21 = -[OZFxPlugParameterHandler _floatParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:](self, "_floatParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:", *(_QWORD *)&a4, *(_QWORD *)&a11, a6, a7, a8, a9, a5, v28);
  if (v21)
  {
    v22 = (OZChannelDouble *)operator new();
    PCURL::PCURL((PCURL *)&v29, a3);
    folderStack = self->_folderStack;
    v24 = folderStack[5] + folderStack[4] - 1;
    OZChannelDouble::OZChannelDouble(v22, a5, &v29, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v24 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v24 & 0x1FF)), a4, 0, 0, 0);
    PCString::~PCString(&v29);
    if ((v11 & 0x100) == 0)
    {
      OZChannel::setMin((OZChannel *)v22, a6);
      OZChannel::setMax((OZChannel *)v22, a7);
    }
    OZChannel::setSliderMin((OZChannel *)v22, a8);
    OZChannel::setSliderMax((OZChannel *)v22, a9);
    OZChannel::setCoarseDelta((OZChannel *)v22, a10);
    OZChannel::setFineDelta((OZChannel *)v22, a10 / 10.0);
    OZChannelBase::setFlag((OZChannelBase *)v22, 0x100000000, 0);
    (*(void (**)(OZChannelDouble *, _QWORD))(*(_QWORD *)v22 + 288))(v22, 0);
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v11, v22);
    if (self->_postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    channelMap = (uint64_t **)self->_channelMap;
    v29.var0 = (__CFString *)&v28;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, (unsigned int *)&v28, (uint64_t)&std::piecewise_construct, &v29)[5] = (uint64_t *)v22;
    v29.var0 = (__CFString *)&v28;
    v26 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->_paramCreationMap, (unsigned int *)&v28, (uint64_t)&std::piecewise_construct, &v29);
    v26[5] = (uint64_t *)FloatSliderTransactionFactory;
    v26[6] = (uint64_t *)FloatRetrieval;
    v26[7] = 0;
    if (self->_postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
  }
  return v21;
}

- (BOOL)addPercentSliderWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(double)a5 parameterMin:(double)a6 parameterMax:(double)a7 sliderMin:(double)a8 sliderMax:(double)a9 delta:(double)a10 parmFlags:(unsigned int)a11
{
  uint64_t v11;
  _BOOL4 v21;
  OZChannelPercent *v22;
  _QWORD *folderStack;
  unint64_t v24;
  uint64_t **channelMap;
  uint64_t **v26;
  uint64_t v28;
  PCString v29;

  v11 = *(_QWORD *)&a11;
  LODWORD(v28) = a4;
  v21 = -[OZFxPlugParameterHandler _floatParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:](self, "_floatParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:", *(_QWORD *)&a4, *(_QWORD *)&a11, a6, a7, a8, a9, a5, v28);
  if (v21)
  {
    v22 = (OZChannelPercent *)operator new();
    PCURL::PCURL((PCURL *)&v29, a3);
    folderStack = self->_folderStack;
    v24 = folderStack[5] + folderStack[4] - 1;
    OZChannelPercent::OZChannelPercent(v22, a5, &v29, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v24 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v24 & 0x1FF)), a4, 0, 0, 0);
    PCString::~PCString(&v29);
    if ((v11 & 0x100) == 0)
    {
      OZChannel::setMin((OZChannel *)v22, a6);
      OZChannel::setMax((OZChannel *)v22, a7);
    }
    OZChannel::setSliderMin((OZChannel *)v22, a8);
    OZChannel::setSliderMax((OZChannel *)v22, a9);
    OZChannel::setCoarseDelta((OZChannel *)v22, a10);
    OZChannel::setFineDelta((OZChannel *)v22, a10 / 10.0);
    OZChannelBase::setFlag((OZChannelBase *)v22, 0x100000000, 0);
    (*((void (**)(OZChannelPercent *, _QWORD))v22->var0 + 36))(v22, 0);
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v11, v22);
    if (self->_postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    channelMap = (uint64_t **)self->_channelMap;
    v29.var0 = (__CFString *)&v28;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, (unsigned int *)&v28, (uint64_t)&std::piecewise_construct, &v29)[5] = (uint64_t *)v22;
    v29.var0 = (__CFString *)&v28;
    v26 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->_paramCreationMap, (unsigned int *)&v28, (uint64_t)&std::piecewise_construct, &v29);
    v26[5] = (uint64_t *)PercentSliderTransactionFactory;
    v26[6] = (uint64_t *)FloatRetrieval;
    v26[7] = 0;
    if (self->_postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
  }
  return v21;
}

- (BOOL)addIntSliderWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(int)a5 parameterMin:(int)a6 parameterMax:(int)a7 sliderMin:(int)a8 sliderMax:(int)a9 delta:(int)a10 parmFlags:(unsigned int)a11
{
  _BOOL4 v18;
  BOOL v19;
  OZChannelUint32 *v20;
  _QWORD *folderStack;
  unint64_t v22;
  uint64_t **channelMap;
  uint64_t **v24;
  uint64_t v26;
  BOOL v27;
  unsigned int v28;
  PCString v29;

  v28 = a4;
  LODWORD(v26) = a11;
  v18 = -[OZFxPlugParameterHandler _intParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:](self, "_intParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:", *(_QWORD *)&a4, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, a9, *(_QWORD *)&a5, v26);
  v19 = v18;
  if (v18)
  {
    v27 = v18;
    v20 = (OZChannelUint32 *)operator new();
    PCURL::PCURL((PCURL *)&v29, a3);
    folderStack = self->_folderStack;
    v22 = folderStack[5] + folderStack[4] - 1;
    OZChannelUint32::OZChannelUint32(v20, (double)a5, &v29, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v22 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v22 & 0x1FF)), a4, 0, 0, 0);
    PCString::~PCString(&v29);
    if ((a11 & 0x100) == 0)
    {
      OZChannel::setMin((OZChannel *)v20, (double)a6);
      OZChannel::setMax((OZChannel *)v20, (double)a7);
    }
    OZChannel::setSliderMin((OZChannel *)v20, (double)a8);
    OZChannel::setSliderMax((OZChannel *)v20, (double)a9);
    OZChannel::setCoarseDelta((OZChannel *)v20, (double)a10);
    OZChannelBase::setFlag((OZChannelBase *)v20, 0x100000000, 0);
    (*((void (**)(OZChannelUint32 *, _QWORD))v20->var0 + 36))(v20, 0);
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", a11, v20);
    if (self->_postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    channelMap = (uint64_t **)self->_channelMap;
    v29.var0 = (__CFString *)&v28;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v28, (uint64_t)&std::piecewise_construct, &v29)[5] = (uint64_t *)v20;
    v29.var0 = (__CFString *)&v28;
    v24 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->_paramCreationMap, &v28, (uint64_t)&std::piecewise_construct, &v29);
    v24[5] = (uint64_t *)IntSliderTransactionFactory;
    v24[6] = (uint64_t *)IntRetrieval;
    v24[7] = 0;
    v19 = v27;
    if (self->_postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
  }
  return v19;
}

- (BOOL)addToggleButtonWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(BOOL)a5 parmFlags:(unsigned int)a6
{
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  _BOOL4 v11;
  _BOOL4 v12;
  OZChannelBool *v13;
  _QWORD *folderStack;
  unint64_t v15;
  uint64_t **channelMap;
  uint64_t **v17;
  uint64_t v19;
  PCString v20;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v8 = *(_QWORD *)&a4;
  LODWORD(v19) = a4;
  v11 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a4, 1, 0, v19);
  v12 = v11 & -[OZFxPlugParameterHandler parameter:hasValidFlags:](self, "parameter:hasValidFlags:", v8, v6);
  if (v12)
  {
    v13 = (OZChannelBool *)operator new();
    PCURL::PCURL((PCURL *)&v20, a3);
    folderStack = self->_folderStack;
    v15 = folderStack[5] + folderStack[4] - 1;
    OZChannelBool::OZChannelBool(v13, v7, &v20, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v15 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v15 & 0x1FF)), v8, 0, 0, 0);
    PCString::~PCString(&v20);
    (*((void (**)(OZChannelBool *, _QWORD))v13->var0 + 36))(v13, 0);
    OZChannelBase::setFlag((OZChannelBase *)v13, 0x100000000, 0);
    (*((void (**)(OZChannelBool *, BOOL, _QWORD))v13->var0 + 63))(v13, (v6 & 1) == 0, 0);
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v6, v13);
    if (self->_postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    channelMap = (uint64_t **)self->_channelMap;
    v20.var0 = (__CFString *)&v19;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, (unsigned int *)&v19, (uint64_t)&std::piecewise_construct, &v20)[5] = (uint64_t *)v13;
    v20.var0 = (__CFString *)&v19;
    v17 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->_paramCreationMap, (unsigned int *)&v19, (uint64_t)&std::piecewise_construct, &v20);
    v17[5] = (uint64_t *)ToggleButtonTransactionFactory;
    v17[6] = (uint64_t *)BoolRetrieval;
    v17[7] = 0;
    if (self->_postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
  }
  return v12;
}

- (BOOL)addAngleSliderWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(double)a5 parameterMin:(double)a6 parameterMax:(double)a7 parmFlags:(unsigned int)a8
{
  uint64_t v8;
  _BOOL4 v15;
  OZChannelAngle *v16;
  _QWORD *folderStack;
  unint64_t v18;
  uint64_t **channelMap;
  uint64_t **v20;
  uint64_t v22;
  PCString v23;

  v8 = *(_QWORD *)&a8;
  LODWORD(v22) = a4;
  v15 = -[OZFxPlugParameterHandler _floatParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:](self, "_floatParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:", *(_QWORD *)&a4, *(_QWORD *)&a8, a6, a7, a6, a7, a5 * 3.14159265 / 180.0, v22);
  if (v15)
  {
    v16 = (OZChannelAngle *)operator new();
    PCURL::PCURL((PCURL *)&v23, a3);
    folderStack = self->_folderStack;
    v18 = folderStack[5] + folderStack[4] - 1;
    OZChannelAngle::OZChannelAngle(v16, a5 * 0.0174532925, &v23, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v18 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v18 & 0x1FF)), a4, 0, 0, 0);
    PCString::~PCString(&v23);
    if ((v8 & 0x100) == 0)
    {
      OZChannel::setMin((OZChannel *)v16, a6);
      OZChannel::setMax((OZChannel *)v16, a7);
    }
    OZChannelBase::setFlag((OZChannelBase *)v16, 0x100000000, 0);
    (*((void (**)(OZChannelAngle *, _QWORD))v16->var0 + 36))(v16, 0);
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v8, v16);
    if (self->_postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    channelMap = (uint64_t **)self->_channelMap;
    v23.var0 = (__CFString *)&v22;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, (unsigned int *)&v22, (uint64_t)&std::piecewise_construct, &v23)[5] = (uint64_t *)v16;
    v23.var0 = (__CFString *)&v22;
    v20 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->_paramCreationMap, (unsigned int *)&v22, (uint64_t)&std::piecewise_construct, &v23);
    v20[5] = (uint64_t *)AngleSliderTransactionFactory;
    v20[6] = (uint64_t *)FloatRetrieval;
    v20[7] = 0;
    if (self->_postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
  }
  return v15;
}

- (OZFxPlugColorTransformInfo)getColorTransformInfo
{
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  OZFxPlugSharedBase *v11;
  unsigned __int8 v12;
  LiAgent *Agent;
  const LiAgent *v14;
  uint64_t RequestedColorDescription;
  CGColorSpace *v16;
  uint64_t v17;
  CGColorSpace *v18;
  CGColorSpace *v19;
  CGColorSpace *v20;
  CGColorSpace *v21;
  OZFxPlugColorTransformInfo *result;
  OZFxPlugRenderContextManager *v23[2];
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v25;
  OZLocking *v26[2];

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v25 = cntrl;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v26, (uint64_t)&ptr);
  v8 = (std::__shared_weak_count *)v25;
  if (v25)
  {
    v9 = (unint64_t *)((char *)v25 + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v11 = *(OZFxPlugSharedBase **)v26[0];
  if (*(_QWORD *)v26[0]
    && (v12 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v12 & 1) == 0)
    && (*(uint64_t (**)(_QWORD))(*(_QWORD *)v11 + 24))(*(_QWORD *)v26[0]))
  {
    OZFxRenderContextAgentSentry::OZFxRenderContextAgentSentry((OZFxRenderContextAgentSentry *)v23, &self->_threadContextManager);
    Agent = (LiAgent *)OZFxRenderContextAgentSentry::getAgent(v23, v11);
    v14 = Agent;
    if (Agent)
    {
      RequestedColorDescription = LiAgent::getRequestedColorDescription(Agent);
      v16 = *(CGColorSpace **)RequestedColorDescription;
      retstr->var0._pcColorDesc._colorSpaceRef._obj = *(CGColorSpace **)RequestedColorDescription;
      if (v16)
        PCCFRefTraits<CGColorSpace *>::retain(v16);
      v17 = *(_QWORD *)(RequestedColorDescription + 8);
      retstr->var0._pcColorDesc._toneMapMethod._gain = *(float *)(RequestedColorDescription + 16);
      *(_QWORD *)&retstr->var0._pcColorDesc._dynamicRange = v17;
      retstr->var0._isPremultiplied = *(_BYTE *)(RequestedColorDescription + 24);
      OZFxPlugSharedBase::getPluginColorDescription((id *)v11, v14, &retstr->var1);
    }
    else
    {
      *(_OWORD *)&retstr->var1._pcColorDesc._colorSpaceRef._obj = 0u;
      *(_OWORD *)&retstr->var1._pcColorDesc._toneMapMethod._gain = 0u;
      *(_OWORD *)&retstr->var0._pcColorDesc._colorSpaceRef._obj = 0u;
      *(_OWORD *)&retstr->var0._pcColorDesc._toneMapMethod._gain = 0u;
      v20 = PCGetNCLCColorSpace(kPCNCLC_Rec709Linear);
      FxColorDescription::FxColorDescription((uint64_t)retstr, v20, 0, &kPCNoToneMapMethod, 1);
      v21 = PCGetNCLCColorSpace(kPCNCLC_Rec709Linear);
      FxColorDescription::FxColorDescription((uint64_t)&retstr->var1, v21, 0, &kPCNoToneMapMethod, 1);
    }
    OZFxRenderContextAgentSentry::~OZFxRenderContextAgentSentry((OZFxRenderContextAgentSentry *)v23);
  }
  else
  {
    *(_OWORD *)&retstr->var1._pcColorDesc._colorSpaceRef._obj = 0u;
    *(_OWORD *)&retstr->var1._pcColorDesc._toneMapMethod._gain = 0u;
    *(_OWORD *)&retstr->var0._pcColorDesc._colorSpaceRef._obj = 0u;
    *(_OWORD *)&retstr->var0._pcColorDesc._toneMapMethod._gain = 0u;
    v18 = PCGetNCLCColorSpace(kPCNCLC_Rec709Linear);
    FxColorDescription::FxColorDescription((uint64_t)retstr, v18, 0, &kPCNoToneMapMethod, 1);
    v19 = PCGetNCLCColorSpace(kPCNCLC_Rec709Linear);
    FxColorDescription::FxColorDescription((uint64_t)&retstr->var1, v19, 0, &kPCNoToneMapMethod, 1);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v26);
  return result;
}

- (void)getColorInFxPlugColorSpace:(void *)a3 red:(float *)a4 green:(float *)a5 blue:(float *)a6 alpha:(float *)a7
{
  CGColorSpace *CGColorSpace;
  int DynamicRange;
  PCToneMapMethod *ToneMapMethod;
  CGColorSpace *v15;
  PCToneMapMethod *v16;
  int v17;
  _DWORD v18[3];
  uint64_t v19;
  int v20;
  PCToneMapMethod v21;
  FxColorDescription v22;
  FxColorDescription v23;

  if (self)
  {
    -[OZFxPlugParameterHandler getColorTransformInfo](self, "getColorTransformInfo");
  }
  else
  {
    memset(&v23, 0, sizeof(v23));
    memset(&v22, 0, sizeof(v22));
  }
  CGColorSpace = (CGColorSpace *)FxColorDescription::getCGColorSpace(&v23);
  DynamicRange = FxColorDescription::getDynamicRange(&v23);
  if (FxColorDescription::isDynamicRangeManaged(&v22))
    ToneMapMethod = (PCToneMapMethod *)FxColorDescription::getToneMapMethod(&v22);
  else
    ToneMapMethod = (PCToneMapMethod *)&kPCNoToneMapMethod;
  v21 = *ToneMapMethod;
  if (FxColorDescription::isHDR(&v22) && FxColorDescription::isSDR(&v23))
  {
    v15 = PCGetNCLCColorSpace((unsigned int *)&kPCNCLC_Rec2020Linear);
    v20 = 0;
    v19 = 0;
    PCColor::getRGBA((int *)a3, (float *)&v19, (float *)&v19 + 1, (float *)&v20, a7, v15, 1, &v21);
    v16 = (PCToneMapMethod *)FxColorDescription::getToneMapMethod(&v23);
    PCColorUtil::transform(v16, &v19, (uint64_t)v15, 1, (uint64_t)CGColorSpace, DynamicRange, (uint64_t)v18);
    v17 = v18[1];
    *a4 = *(float *)v18;
    *(_DWORD *)a5 = v17;
    *a6 = *(float *)&v18[2];
  }
  else
  {
    PCColor::getRGBA((int *)a3, a4, a5, a6, a7, CGColorSpace, DynamicRange, &v21);
  }
  PCCFRef<CGColorSpace *>::~PCCFRef(&v23._pcColorDesc._colorSpaceRef._obj);
  PCCFRef<CGColorSpace *>::~PCCFRef(&v22._pcColorDesc._colorSpaceRef._obj);
}

- (void)setColorFromFxPlugColorSpace:(void *)a3 red:(float)a4 green:(float)a5 blue:(float)a6 alpha:(float)a7
{
  CGColorSpace *CGColorSpace;
  int DynamicRange;
  PCToneMapMethod *ToneMapMethod;
  CGColorSpace *v15;
  PCToneMapMethod *v16;
  uint64_t v17;
  unint64_t v18;
  float v19;
  PCToneMapMethod v20;
  FxColorDescription v21;
  FxColorDescription v22;

  if (self)
  {
    -[OZFxPlugParameterHandler getColorTransformInfo](self, "getColorTransformInfo");
  }
  else
  {
    memset(&v22, 0, sizeof(v22));
    memset(&v21, 0, sizeof(v21));
  }
  CGColorSpace = (CGColorSpace *)FxColorDescription::getCGColorSpace(&v22);
  DynamicRange = FxColorDescription::getDynamicRange(&v22);
  if (FxColorDescription::isDynamicRangeManaged(&v21))
    ToneMapMethod = (PCToneMapMethod *)FxColorDescription::getToneMapMethod(&v21);
  else
    ToneMapMethod = (PCToneMapMethod *)&kPCNoToneMapMethod;
  v20 = *ToneMapMethod;
  if (FxColorDescription::isHDR(&v21) && FxColorDescription::isSDR(&v22))
  {
    v15 = PCGetNCLCColorSpace((unsigned int *)&kPCNCLC_Rec2020Linear);
    v18 = __PAIR64__(LODWORD(a5), LODWORD(a4));
    v19 = a6;
    v16 = (PCToneMapMethod *)FxColorDescription::getToneMapMethod(&v22);
    PCColorUtil::transform(v16, (uint64_t *)&v18, (uint64_t)CGColorSpace, DynamicRange, (uint64_t)v15, 1, (uint64_t)&v17);
    PCColor::setRGBA((int *)a3, v15, 1, &v20, a4, a5, a6, a7);
  }
  else
  {
    PCColor::setRGBA((int *)a3, CGColorSpace, DynamicRange, &v20, a4, a5, a6, a7);
  }
  PCCFRef<CGColorSpace *>::~PCCFRef(&v22._pcColorDesc._colorSpaceRef._obj);
  PCCFRef<CGColorSpace *>::~PCCFRef(&v21._pcColorDesc._colorSpaceRef._obj);
}

- (BOOL)addColorParameterWithName:(id)a3 parmId:(unsigned int)a4 defaultRed:(double)a5 defaultGreen:(double)a6 defaultBlue:(double)a7 parmFlags:(unsigned int)a8
{
  uint64_t v8;
  _BOOL4 v15;
  OZChannelColorNoAlpha *v16;
  _QWORD *folderStack;
  unint64_t v18;
  float v19;
  float v20;
  float v21;
  uint64_t **channelMap;
  uint64_t **v23;
  PCColor v25;
  unsigned int v26;
  unsigned int *v27;

  v8 = *(_QWORD *)&a8;
  v26 = a4;
  v15 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a4, 1, 1);
  if (v15)
  {
    v16 = (OZChannelColorNoAlpha *)operator new();
    PCURL::PCURL((PCURL *)&v25, a3);
    folderStack = self->_folderStack;
    v18 = folderStack[5] + folderStack[4] - 1;
    OZChannelColorNoAlpha::OZChannelColorNoAlpha(v16, (const PCString *)&v25, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v18 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v18 & 0x1FF)), a4, 0, 5u);
    PCString::~PCString((PCString *)&v25);
    if ((v8 & 0x400) != 0)
      OZChannelColorNoAlpha::setIsColor((uint64_t)v16, 0);
    PCColorSpaceCache::sRGB((CGColorSpace **)&v27);
    PCColor::PCColor(&v25, 0.0, 0.0, 0.0, (OZChannelBase *)&v27);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v27);
    PCColor::getColorSpace(&v25, (CGColorSpace **)&v27);
    v19 = a7;
    v20 = a6;
    v21 = a5;
    PCColor::setRGBA(&v25, v21, v20, v19, 1.0, (OZChannelBase *)&v27);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v27);
    (*(void (**)(OZChannelColorNoAlpha *, PCColor *))(*(_QWORD *)v16 + 848))(v16, &v25);
    OZChannelBase::setFlag((OZChannelBase *)v16, 0x100000000, 0);
    (*(void (**)(OZChannelColorNoAlpha *, _QWORD))(*(_QWORD *)v16 + 288))(v16, 0);
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v8, v16);
    if (self->_postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    channelMap = (uint64_t **)self->_channelMap;
    v27 = &v26;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v26, (uint64_t)&std::piecewise_construct, &v27)[5] = (uint64_t *)v16;
    v27 = &v26;
    v23 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->_paramCreationMap, &v26, (uint64_t)&std::piecewise_construct, &v27);
    v23[5] = (uint64_t *)RGBColorTransactionFactory;
    v23[6] = (uint64_t *)RGBRetrieval;
    v23[7] = 0;
    if (self->_postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
    PCCFRef<CGColorSpace *>::~PCCFRef(&v25.var1._obj);
  }
  return v15;
}

- (BOOL)addColorParameterWithName:(id)a3 parmId:(unsigned int)a4 defaultRed:(double)a5 defaultGreen:(double)a6 defaultBlue:(double)a7 defaultAlpha:(double)a8 parmFlags:(unsigned int)a9
{
  uint64_t v9;
  _BOOL4 v17;
  OZChannelColor *v18;
  _QWORD *folderStack;
  unint64_t v20;
  float v21;
  float v22;
  float v23;
  float v24;
  uint64_t **channelMap;
  uint64_t **v26;
  PCColor v28;
  unsigned int v29;
  unsigned int *v30;

  v9 = *(_QWORD *)&a9;
  v29 = a4;
  v17 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a4, 1, 1);
  if (v17)
  {
    v18 = (OZChannelColor *)operator new();
    PCURL::PCURL((PCURL *)&v28, a3);
    folderStack = self->_folderStack;
    v20 = folderStack[5] + folderStack[4] - 1;
    OZChannelColor::OZChannelColor(v18, (const PCString *)&v28, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v20 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v20 & 0x1FF)), a4, 0, 6u);
    PCString::~PCString((PCString *)&v28);
    if ((v9 & 0x400) != 0)
      OZChannelColorNoAlpha::setIsColor((uint64_t)v18, 0);
    PCColorSpaceCache::sRGB((CGColorSpace **)&v30);
    PCColor::PCColor(&v28, 0.0, 0.0, 0.0, (OZChannelBase *)&v30);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v30);
    PCColor::getColorSpace(&v28, (CGColorSpace **)&v30);
    v21 = a8;
    v22 = a7;
    v23 = a6;
    v24 = a5;
    PCColor::setRGBA(&v28, v24, v23, v22, v21, (OZChannelBase *)&v30);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v30);
    (*(void (**)(OZChannelColor *, PCColor *))(*(_QWORD *)v18 + 848))(v18, &v28);
    OZChannelBase::setFlag((OZChannelBase *)v18, 0x100000000, 0);
    (*(void (**)(OZChannelColor *, _QWORD))(*(_QWORD *)v18 + 288))(v18, 0);
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v9, v18);
    if (self->_postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    channelMap = (uint64_t **)self->_channelMap;
    v30 = &v29;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v29, (uint64_t)&std::piecewise_construct, &v30)[5] = (uint64_t *)v18;
    v30 = &v29;
    v26 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->_paramCreationMap, &v29, (uint64_t)&std::piecewise_construct, &v30);
    v26[5] = (uint64_t *)RGBAColorTransactionFactory;
    v26[6] = (uint64_t *)RGBARetrieval;
    v26[7] = 0;
    if (self->_postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
    PCCFRef<CGColorSpace *>::~PCCFRef(&v28.var1._obj);
  }
  return v17;
}

- (BOOL)addPointParameterWithName:(id)a3 parmId:(unsigned int)a4 defaultX:(double)a5 defaultY:(double)a6 parmFlags:(unsigned int)a7
{
  uint64_t v7;
  _BOOL4 v13;
  uint64_t v14;
  _QWORD *folderStack;
  unint64_t v16;
  uint64_t **channelMap;
  uint64_t **v18;
  uint64_t v20;
  PCString v21;

  v7 = *(_QWORD *)&a7;
  LODWORD(v20) = a4;
  v13 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a4, 1, 1, v20);
  if (v13)
  {
    v14 = operator new();
    PCURL::PCURL((PCURL *)&v21, a3);
    folderStack = self->_folderStack;
    v16 = folderStack[5] + folderStack[4] - 1;
    OZChannelPositionPercent::OZChannelPositionPercent((OZChannelPositionPercent *)v14, &v21, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v16 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v16 & 0x1FF)), a4, 0);
    PCString::~PCString(&v21);
    OZChannel::setDefaultValue((OZChannel *)(v14 + 136), a5);
    OZChannel::setDefaultValue((OZChannel *)(v14 + 288), a6);
    OZChannelBase::setFlag((OZChannelBase *)v14, 0x100000000, 0);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v14 + 288))(v14, 0);
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v7, v14);
    if (self->_postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    channelMap = (uint64_t **)self->_channelMap;
    v21.var0 = (__CFString *)&v20;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, (unsigned int *)&v20, (uint64_t)&std::piecewise_construct, &v21)[5] = (uint64_t *)v14;
    v21.var0 = (__CFString *)&v20;
    v18 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->_paramCreationMap, (unsigned int *)&v20, (uint64_t)&std::piecewise_construct, &v21);
    v18[5] = (uint64_t *)PointTransactionFactory;
    v18[6] = (uint64_t *)PointRetrieval;
    v18[7] = 0;
    self->_hasPointParam = 1;
    if (self->_postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
  }
  return v13;
}

- (BOOL)add2DVectorWithName:(id)a3 parmId:(unsigned int)a4 defaultX:(double)a5 defaultY:(double)a6 parmFlags:(unsigned int)a7
{
  uint64_t v7;
  _BOOL4 v13;
  uint64_t v14;
  _QWORD *folderStack;
  unint64_t v16;
  uint64_t **channelMap;
  uint64_t v19;
  PCString v20;

  v7 = *(_QWORD *)&a7;
  LODWORD(v19) = a4;
  v13 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a4, 1, 1, v19);
  if (v13)
  {
    v14 = operator new();
    PCURL::PCURL((PCURL *)&v20, a3);
    folderStack = self->_folderStack;
    v16 = folderStack[5] + folderStack[4] - 1;
    OZChannelPosition::OZChannelPosition((OZChannelPosition *)v14, &v20, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v16 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v16 & 0x1FF)), a4, 0, 2u, 0, 0);
    PCString::~PCString(&v20);
    OZChannel::setDefaultValue((OZChannel *)(v14 + 136), a5);
    OZChannel::setDefaultValue((OZChannel *)(v14 + 288), a6);
    OZChannelBase::setFlag((OZChannelBase *)v14, 0x100000000, 0);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v14 + 288))(v14, 0);
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v7, v14);
    if (self->_postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    channelMap = (uint64_t **)self->_channelMap;
    v20.var0 = (__CFString *)&v19;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, (unsigned int *)&v19, (uint64_t)&std::piecewise_construct, &v20)[5] = (uint64_t *)v14;
    if (self->_postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
  }
  return v13;
}

- (BOOL)add2DScaleWithName:(id)a3 parmId:(unsigned int)a4 defaultX:(double)a5 defaultY:(double)a6 parmFlags:(unsigned int)a7
{
  _BOOL4 v13;
  uint64_t v14;
  _QWORD *folderStack;
  unint64_t v16;
  uint64_t **channelMap;
  uint64_t v19;
  PCString v20;

  LODWORD(v19) = a4;
  v13 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a4, 1, 1, v19);
  if (!v13)
    return v13;
  v14 = operator new();
  PCURL::PCURL((PCURL *)&v20, a3);
  folderStack = self->_folderStack;
  v16 = folderStack[5] + folderStack[4] - 1;
  OZChannelScale::OZChannelScale((OZChannelScale *)v14, &v20, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v16 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v16 & 0x1FF)), a4, 0, 2u, 0, 0);
  PCString::~PCString(&v20);
  OZChannel::setDefaultValue((OZChannel *)(v14 + 136), a5);
  OZChannel::setDefaultValue((OZChannel *)(v14 + 288), a6);
  OZChannelBase::setFlag((OZChannelBase *)v14, 0x100000000, 0);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v14 + 288))(v14, 0);
  if ((a7 & 1) != 0)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v14 + 504))(v14, 0, 0);
    if ((a7 & 2) == 0)
    {
LABEL_4:
      if ((a7 & 4) == 0)
        goto LABEL_5;
      goto LABEL_18;
    }
  }
  else if ((a7 & 2) == 0)
  {
    goto LABEL_4;
  }
  OZChannelBase::setFlag((OZChannelBase *)v14, 4259872, 0);
  if ((a7 & 4) == 0)
  {
LABEL_5:
    if ((a7 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  OZChannelBase::setFlag((OZChannelBase *)v14, 4, 0);
  if ((a7 & 0x10) == 0)
  {
LABEL_6:
    if ((a7 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  OZChannelBase::setFlag((OZChannelBase *)v14, 8, 0);
  if ((a7 & 0x20) == 0)
  {
LABEL_7:
    if ((a7 & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  OZChannelBase::resetFlag((OZChannelBase *)v14, 16, 0);
  if ((a7 & 0x200) == 0)
  {
LABEL_8:
    if ((a7 & 0x20000) == 0)
      goto LABEL_9;
LABEL_22:
    OZChannelBase::setFlag((OZChannelBase *)v14, 0x400000, 0);
    if ((a7 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_21:
  OZChannelBase::setFlag((OZChannelBase *)v14, 0x10000, 0);
  if ((a7 & 0x20000) != 0)
    goto LABEL_22;
LABEL_9:
  if ((a7 & 0x40) != 0)
LABEL_10:
    OZChannelBase::setFlag((OZChannelBase *)v14, 0x1000000000, 0);
LABEL_11:
  if (self->_postAddParameters)
  {
    -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
    -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
  }
  channelMap = (uint64_t **)self->_channelMap;
  v20.var0 = (__CFString *)&v19;
  std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, (unsigned int *)&v19, (uint64_t)&std::piecewise_construct, &v20)[5] = (uint64_t *)v14;
  if (self->_postAddParameters)
    -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
  return v13;
}

- (BOOL)addPopupMenuWithNameAndTags:(id)a3 parmId:(unsigned int)a4 defaultValue:(unsigned int)a5 menuEntries:(id)a6 tags:(const int *)a7 tagCount:(int)a8 parmFlags:(unsigned int)a9
{
  _BOOL4 v16;
  const __CFString *v17;
  OZChannelEnum *v18;
  _QWORD *folderStack;
  unint64_t v20;
  uint64_t **channelMap;
  uint64_t **v22;
  PCString v24;
  unsigned int v25;
  PCString v26;

  v25 = a4;
  v16 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a4, 1, 1);
  if (v16)
  {
    v17 = (const __CFString *)objc_msgSend(a6, "componentsJoinedByString:", CFSTR("|"));
    v18 = (OZChannelEnum *)operator new();
    PCString::PCString(&v26, v17, 1);
    PCURL::PCURL((PCURL *)&v24, a3);
    folderStack = self->_folderStack;
    v20 = folderStack[5] + folderStack[4] - 1;
    OZChannelEnum::OZChannelEnum(v18, a5, &v26, &v24, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v20 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v20 & 0x1FF)), a4, 0, 0, 0);
    PCString::~PCString(&v24);
    PCString::~PCString(&v26);
    OZChannel::setMin((OZChannel *)v18, 0.0);
    OZChannelBase::setFlag((OZChannelBase *)v18, 0x100000000, 0);
    (*(void (**)(OZChannelEnum *, _QWORD))(*(_QWORD *)v18 + 288))(v18, 0);
    (*(void (**)(OZChannelEnum *, BOOL, _QWORD))(*(_QWORD *)v18 + 504))(v18, (a9 & 1) == 0, 0);
    if (a7)
      OZChannelEnum::setTags(v18, (char *)a7, a8);
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", a9, v18);
    if (self->_postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    channelMap = (uint64_t **)self->_channelMap;
    v26.var0 = (__CFString *)&v25;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v25, (uint64_t)&std::piecewise_construct, &v26)[5] = (uint64_t *)v18;
    v26.var0 = (__CFString *)&v25;
    v22 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->_paramCreationMap, &v25, (uint64_t)&std::piecewise_construct, &v26);
    v22[5] = (uint64_t *)PopupMenuTransactionFactory;
    v22[6] = (uint64_t *)IntRetrieval;
    v22[7] = 0;
    if (self->_postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
  }
  return v16;
}

- (BOOL)addPopupMenuWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(unsigned int)a5 menuEntries:(id)a6 parmFlags:(unsigned int)a7
{
  uint64_t v8;

  LODWORD(v8) = a7;
  return -[OZFxPlugParameterHandler addPopupMenuWithNameAndTags:parmId:defaultValue:menuEntries:tags:tagCount:parmFlags:](self, "addPopupMenuWithNameAndTags:parmId:defaultValue:menuEntries:tags:tagCount:parmFlags:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6, 0, 0, v8);
}

- (BOOL)addImageReferenceWithName:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5
{
  uint64_t v5;
  _BOOL4 v9;
  OZChanElementOrFootageRef *v10;
  _QWORD *folderStack;
  unint64_t v12;
  uint64_t **channelMap;
  uint64_t **v14;
  uint64_t v16;
  PCString v17;

  v5 = *(_QWORD *)&a5;
  LODWORD(v16) = a4;
  v9 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a4, 1, 1, v16);
  if (v9)
  {
    v10 = (OZChanElementOrFootageRef *)operator new();
    PCURL::PCURL((PCURL *)&v17, a3);
    folderStack = self->_folderStack;
    v12 = folderStack[5] + folderStack[4] - 1;
    OZChanElementOrFootageRef::OZChanElementOrFootageRef(v10, &v17, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v12 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v12 & 0x1FF)), a4, 0);
    PCString::~PCString(&v17);
    OZChannelBase::setFlag((OZChannelBase *)v10, 0x100000000, 0);
    (*(void (**)(OZChanElementOrFootageRef *, _QWORD))(*(_QWORD *)v10 + 288))(v10, 0);
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v5, v10);
    if (self->_postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    channelMap = (uint64_t **)self->_channelMap;
    v17.var0 = (__CFString *)&v16;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, (unsigned int *)&v16, (uint64_t)&std::piecewise_construct, &v17)[5] = (uint64_t *)v10;
    v17.var0 = (__CFString *)&v16;
    v14 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->_paramCreationMap, (unsigned int *)&v16, (uint64_t)&std::piecewise_construct, &v17);
    v14[5] = (uint64_t *)ImageTransactionFactory;
    v14[6] = (uint64_t *)NoOpRetrieval;
    v14[7] = 0;
    if (self->_postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
  }
  return v9;
}

- (BOOL)addCustomParameterWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(id)a5 parmFlags:(unsigned int)a6
{
  uint64_t v6;
  _BOOL4 v10;
  __shared_weak_count *cntrl;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  unsigned __int8 v18;
  char v19;
  unsigned int v20;
  _BOOL4 v21;
  int v22;
  int isXPCBasedPlugin;
  void *v24;
  int v25;
  char v26;
  void *v27;
  unint64_t v28;
  OZChannelColorCorrection *v29;
  _QWORD *folderStack;
  unint64_t v31;
  char v32;
  NSData *v33;
  _QWORD *v34;
  unint64_t v35;
  char v36;
  unsigned int *end;
  unsigned int *value;
  unsigned int *v39;
  unsigned int *begin;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  unsigned int *v46;
  unsigned int *v47;
  unsigned int v48;
  uint64_t **channelMap;
  OZChannelBlindData **v50;
  OZChannelBlindData **v51;
  OZChannelBlindData **v52;
  OZChannelBlindData **v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  OZChannelBlindData **v59;
  OZChannelBlindData **v60;
  OZChannelBlindData **v61;
  OZChannelBlindData **v62;
  OZChannelBlindData *v63;
  uint64_t **v64;
  PCString v66;
  void *v67;
  char v68;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v70;
  OZLocking *v71[2];
  unsigned int v72;
  PCString v73;

  v6 = *(_QWORD *)&a6;
  v72 = a4;
  v10 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a4, 1, 1);
  if (v10)
  {
    cntrl = self->_fxPlugLock.__cntrl_;
    ptr = self->_fxPlugLock.__ptr_;
    v70 = cntrl;
    if (cntrl)
    {
      v12 = (unint64_t *)((char *)cntrl + 8);
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    OZFxPlugLockSentinel::OZFxPlugLockSentinel(v71, (uint64_t)&ptr);
    v14 = (std::__shared_weak_count *)v70;
    if (v70)
    {
      v15 = (unint64_t *)((char *)v70 + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v17 = *(_QWORD *)v71[0];
    if (!*(_QWORD *)v71[0])
      goto LABEL_22;
    v18 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
    if ((v18 & 1) != 0)
      goto LABEL_22;
    v19 = *(_BYTE *)(v17 + 216);
    v20 = v72;
    v21 = v72 == 8888 && -[OZFxPlugParameterHandler isColorCorrection](self, "isColorCorrection");
    v22 = *(unsigned __int8 *)(v17 + 216);
    isXPCBasedPlugin = OZFxPlugSharedBase::isXPCBasedPlugin((OZFxPlugSharedBase *)v17);
    if (a5 && !v22)
    {
      v24 = *(void **)(v17 + 24);
      v25 = objc_msgSend(v24, "useLegacyCoding");
      isXPCBasedPlugin = v25 ^ 1;
      if (v24)
        v26 = v25;
      else
        v26 = 1;
      if ((v26 & 1) != 0)
      {
        if (!v24)
        {
LABEL_22:
          OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v71);
          LOBYTE(v10) = 0;
          return v10;
        }
      }
      else
      {
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
        objc_msgSend(v27, "encodeObject:forKey:", a5, CFSTR("Custom Data"));
        a5 = (id)objc_msgSend(v27, "encodedData");

      }
    }
    if (v21)
    {
      v28 = atomic_load(&-[OZFxPlugParameterHandler addCustomParameterWithName:parmId:defaultValue:parmFlags:]::once);
      if (v28 != -1)
      {
        v66.var0 = (__CFString *)&v68;
        v73.var0 = (__CFString *)&v66;
        std::__call_once(&-[OZFxPlugParameterHandler addCustomParameterWithName:parmId:defaultValue:parmFlags:]::once, &v73, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[OZFxPlugParameterHandler addCustomParameterWithName:parmId:defaultValue:parmFlags:]::$_0 &&>>);
      }
      v29 = (OZChannelColorCorrection *)operator new();
      PCURL::PCURL((PCURL *)&v66, a3);
      folderStack = self->_folderStack;
      v31 = folderStack[5] + folderStack[4] - 1;
      v20 = v72;
      OZChannelColorCorrection::OZChannelColorCorrection(v29, &v66, a5, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v31 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v31 & 0x1FF)), v72, isXPCBasedPlugin, 0);
      PCString::~PCString(&v66);
    }
    else
    {
      v66.var0 = (__CFString *)v20;
      v32 = v19;
      v67 = -[OZFxPlugParameterHandler getScene](self, "getScene");
      v33 = (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v66, 16);
      v29 = (OZChannelColorCorrection *)operator new();
      PCURL::PCURL((PCURL *)&v73, a3);
      v34 = self->_folderStack;
      v35 = v34[5] + v34[4] - 1;
      OZChannelBlindData::OZChannelBlindData((OZChannelBlindData *)v29, &v73, a5, *(OZChannelFolder **)(*(_QWORD *)(v34[1] + ((v35 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v35 & 0x1FF)), v20, 0, isXPCBasedPlugin, (NSData *(*)(NSData *, NSData *, float, void *))interpolateCustomParameter, v33, (BOOL (*)(NSData *, NSData *, void *))compareCustomParameter, v33);
      PCString::~PCString(&v73);
      v19 = v32;
      LOBYTE(v21) = 0;
    }
    *((_BYTE *)v29 + 384) = v19;
    OZChannelBase::setFlag((OZChannelBase *)v29, 0x100000000, 0);
    (*(void (**)(OZChannelColorCorrection *, _QWORD))(*(_QWORD *)v29 + 288))(v29, 0);
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v6, v29);
    OZChannelBase::resetFlag((OZChannelBase *)v29, 0x1000000000, 0);
    v36 = (v6 & 0x40) == 0 || v21;
    if ((v36 & 1) == 0)
    {
      if ((v6 & 0x800) != 0)
        OZChannelBase::setInspectorCtlrClassName((OZChannelBase *)v29, CFSTR("OZFxPlugCustomParameterController"));
      else
        OZChannelBase::setParameterCtlrClassName((OZChannelBase *)v29, CFSTR("OZFxPlugCustomParameterController"));
    }
    if (self->_postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v17 + 440))(v17) & 1) == 0)
      OZChannelBase::setFlag((OZChannelBase *)v29, 0x1000000000, 0);
    if ((v6 & 0x800) != 0)
    {
      end = self->_fullWidthCustomParams.__end_;
      value = self->_fullWidthCustomParams.__end_cap_.__value_;
      if (end >= value)
      {
        begin = self->_fullWidthCustomParams.__begin_;
        v41 = end - begin;
        if ((unint64_t)(v41 + 1) >> 62)
          std::vector<double>::__throw_length_error[abi:ne180100]();
        v42 = (char *)value - (char *)begin;
        v43 = ((char *)value - (char *)begin) >> 1;
        if (v43 <= v41 + 1)
          v43 = v41 + 1;
        if (v42 >= 0x7FFFFFFFFFFFFFFCLL)
          v44 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v44 = v43;
        if (v44)
        {
          v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&self->_fullWidthCustomParams.__end_cap_, v44);
          begin = self->_fullWidthCustomParams.__begin_;
          end = self->_fullWidthCustomParams.__end_;
        }
        else
        {
          v45 = 0;
        }
        v46 = (unsigned int *)&v45[4 * v41];
        v47 = (unsigned int *)&v45[4 * v44];
        *v46 = v20;
        v39 = v46 + 1;
        while (end != begin)
        {
          v48 = *--end;
          *--v46 = v48;
        }
        self->_fullWidthCustomParams.__begin_ = v46;
        self->_fullWidthCustomParams.__end_ = v39;
        self->_fullWidthCustomParams.__end_cap_.__value_ = v47;
        if (begin)
          operator delete(begin);
      }
      else
      {
        *end = v20;
        v39 = end + 1;
      }
      self->_fullWidthCustomParams.__end_ = v39;
    }
    channelMap = (uint64_t **)self->_channelMap;
    v66.var0 = (__CFString *)&v72;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v72, (uint64_t)&std::piecewise_construct, &v66)[5] = (uint64_t *)v29;
    v50 = self->_customParameterList.__end_cap_.__value_;
    v51 = self->_customParameterList.__end_;
    if (v51 >= v50)
    {
      v53 = self->_customParameterList.__begin_;
      v54 = v51 - v53;
      if ((unint64_t)(v54 + 1) >> 61)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v55 = (char *)v50 - (char *)v53;
      v56 = v55 >> 2;
      if (v55 >> 2 <= (unint64_t)(v54 + 1))
        v56 = v54 + 1;
      if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF8)
        v57 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v57 = v56;
      if (v57)
        v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&self->_customParameterList.__end_cap_, v57);
      else
        v58 = 0;
      v59 = (OZChannelBlindData **)&v58[8 * v54];
      v60 = (OZChannelBlindData **)&v58[8 * v57];
      *v59 = (OZChannelBlindData *)v29;
      v52 = v59 + 1;
      v62 = self->_customParameterList.__begin_;
      v61 = self->_customParameterList.__end_;
      if (v61 != v62)
      {
        do
        {
          v63 = *--v61;
          *--v59 = v63;
        }
        while (v61 != v62);
        v61 = self->_customParameterList.__begin_;
      }
      self->_customParameterList.__begin_ = v59;
      self->_customParameterList.__end_ = v52;
      self->_customParameterList.__end_cap_.__value_ = v60;
      if (v61)
        operator delete(v61);
    }
    else
    {
      *v51 = (OZChannelBlindData *)v29;
      v52 = v51 + 1;
    }
    self->_customParameterList.__end_ = v52;
    v66.var0 = (__CFString *)&v72;
    v64 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->_paramCreationMap, &v72, (uint64_t)&std::piecewise_construct, &v66);
    v64[5] = (uint64_t *)CustomParameterTransactionFactory;
    v64[6] = (uint64_t *)CustomRetrieval;
    v64[7] = 0;
    if (self->_postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v71);
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (BOOL)setCustomParameterDefaultValue:(id)a3 parmId:(unsigned int)a4
{
  uint64_t v4;
  _BOOL4 v7;
  _QWORD *channelMap;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  unsigned int v13;
  BOOL v14;
  char **v15;
  OZChannelBlindData *v16;
  __shared_weak_count *cntrl;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  unsigned __int8 v24;
  void *v25;
  void *v26;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v29;
  OZLocking *v30[2];

  v4 = *(_QWORD *)&a4;
  v7 = -[OZFxPlugParameterHandler safeToSetParameters](self, "safeToSetParameters");
  if (v7)
  {
    channelMap = self->_channelMap;
    v11 = (char *)channelMap[1];
    v9 = (char *)(channelMap + 1);
    v10 = v11;
    if (v11)
    {
      v12 = v9;
      do
      {
        v13 = *((_DWORD *)v10 + 8);
        v14 = v13 >= v4;
        if (v13 >= v4)
          v15 = (char **)v10;
        else
          v15 = (char **)(v10 + 8);
        if (v14)
          v12 = v10;
        v10 = *v15;
      }
      while (*v15);
      if (v12 != v9 && *((_DWORD *)v12 + 8) <= v4)
      {
        v16 = (OZChannelBlindData *)*((_QWORD *)v12 + 5);
        cntrl = self->_fxPlugLock.__cntrl_;
        ptr = self->_fxPlugLock.__ptr_;
        v29 = cntrl;
        if (cntrl)
        {
          v18 = (unint64_t *)((char *)cntrl + 8);
          do
            v19 = __ldxr(v18);
          while (__stxr(v19 + 1, v18));
        }
        OZFxPlugLockSentinel::OZFxPlugLockSentinel(v30, (uint64_t)&ptr);
        v20 = (std::__shared_weak_count *)v29;
        if (v29)
        {
          v21 = (unint64_t *)((char *)v29 + 8);
          do
            v22 = __ldaxr(v21);
          while (__stlxr(v22 - 1, v21));
          if (!v22)
          {
            ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
            std::__shared_weak_count::__release_weak(v20);
          }
        }
        v23 = *(_QWORD *)v30[0];
        if (*(_QWORD *)v30[0])
        {
          v24 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
          if ((v24 & 1) == 0)
          {
            if (!a3 || *(_BYTE *)(v23 + 216))
            {
LABEL_28:
              OZChannelBlindData::setDefaultValue(v16, a3);
              -[OZFxPlugParameterHandler _updateUIForParm:](self, "_updateUIForParm:", v4);
              OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v30);
              LOBYTE(v7) = 1;
              return v7;
            }
            v25 = *(void **)(v23 + 24);
            if (v25)
            {
              if ((objc_msgSend(v25, "useLegacyCoding", ptr) & 1) == 0)
              {
                v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
                objc_msgSend(v26, "encodeObject:forKey:", a3, CFSTR("Custom Data"));
                a3 = (id)objc_msgSend(v26, "encodedData");

              }
              goto LABEL_28;
            }
          }
        }
        OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v30);
      }
    }
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)startParameterSubGroup:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5
{
  _BOOL4 v9;
  OZChannelFolder *v10;
  _QWORD *folderStack;
  unint64_t v12;
  uint64_t *v13;
  uint64_t **channelMap;
  uint64_t **v15;
  uint64_t *v17;
  unsigned int v18;
  PCString v19;

  v18 = a4;
  v9 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a4, 1, 1);
  if (v9)
  {
    v10 = (OZChannelFolder *)operator new();
    PCURL::PCURL((PCURL *)&v19, a3);
    folderStack = self->_folderStack;
    v12 = folderStack[5] + folderStack[4] - 1;
    OZChannelFolder::OZChannelFolder(v10, &v19, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v12 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v12 & 0x1FF)), a4, 0, 0);
    v17 = (uint64_t *)v10;
    PCString::~PCString(&v19);
    if ((a5 & 8) != 0)
    {
      OZChannelFolder::setFoldFlag(v10, 4);
      if ((a5 & 0x20) == 0)
      {
LABEL_4:
        if ((a5 & 2) == 0)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
    else if ((a5 & 0x20) == 0)
    {
      goto LABEL_4;
    }
    OZChannelBase::resetFlag((OZChannelBase *)v10, 16, 0);
    if ((a5 & 2) == 0)
    {
LABEL_5:
      if ((a5 & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
LABEL_12:
    OZChannelBase::setFlag((OZChannelBase *)v10, 4259872, 0);
    if ((a5 & 0x200) == 0)
    {
LABEL_6:
      if ((a5 & 0x20000) == 0)
      {
LABEL_8:
        std::deque<OZChannelFolder *>::push_back((_QWORD *)self->_folderStack, &v17);
        v13 = v17;
        channelMap = (uint64_t **)self->_channelMap;
        v19.var0 = (__CFString *)&v18;
        std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v18, (uint64_t)&std::piecewise_construct, &v19)[5] = v13;
        v19.var0 = (__CFString *)&v18;
        v15 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->_paramCreationMap, &v18, (uint64_t)&std::piecewise_construct, &v19);
        v15[5] = (uint64_t *)GroupTransactionFactory;
        v15[6] = (uint64_t *)NoOpRetrieval;
        v15[7] = 0;
        return v9;
      }
LABEL_7:
      OZChannelBase::setFlag((OZChannelBase *)v10, 0x400000, 0);
      goto LABEL_8;
    }
LABEL_13:
    OZChannelBase::setFlag((OZChannelBase *)v10, 0x10000, 0);
    if ((a5 & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  return v9;
}

- (BOOL)endParameterSubGroup
{
  _QWORD *folderStack;

  folderStack = self->_folderStack;
  --folderStack[5];
  std::deque<unsigned long>::__maybe_remove_back_spare[abi:ne180100](folderStack, 1);
  return 1;
}

- (BOOL)addLevelsWithName:(id)a3 parmId:(unsigned int)a4 hideGamma:(BOOL)a5 parmFlags:(unsigned int)a6
{
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v11;
  OZChannelLevels *v12;
  _QWORD *folderStack;
  unint64_t v14;
  OZChannelBase *Gamma;
  uint64_t **channelMap;
  uint64_t v18;
  PCString v19;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  LODWORD(v18) = a4;
  v11 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a4, 1, 1, v18);
  if (v11)
  {
    v12 = (OZChannelLevels *)operator new();
    PCURL::PCURL((PCURL *)&v19, a3);
    folderStack = self->_folderStack;
    v14 = folderStack[5] + folderStack[4] - 1;
    OZChannelLevels::OZChannelLevels(v12, &v19, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v14 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v14 & 0x1FF)), a4, 0, 3u);
    PCString::~PCString(&v19);
    OZChannelBase::setFlag((OZChannelBase *)v12, 0x100000000, 0);
    (*(void (**)(OZChannelLevels *, _QWORD))(*(_QWORD *)v12 + 288))(v12, 0);
    if ((v6 & 8) != 0)
      OZChannelFolder::setFoldFlag((OZChannelFolder *)v12, 4);
    if (v7)
    {
      Gamma = (OZChannelBase *)OZChannelLevels::getGamma(v12);
      OZChannelBase::setFlag(Gamma, 4259872, 0);
    }
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v6, v12);
    if (self->_postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    channelMap = (uint64_t **)self->_channelMap;
    v19.var0 = (__CFString *)&v18;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, (unsigned int *)&v18, (uint64_t)&std::piecewise_construct, &v19)[5] = (uint64_t *)v12;
    if (self->_postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
  }
  return v11;
}

- (BOOL)addHistogramWithName:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5
{
  uint64_t v5;
  _BOOL4 v9;
  OZChannelHistogram *v10;
  _QWORD *folderStack;
  unint64_t v12;
  uint64_t **channelMap;
  uint64_t **v14;
  uint64_t v16;
  PCString v17;

  v5 = *(_QWORD *)&a5;
  LODWORD(v16) = a4;
  v9 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a4, 1, 1, v16);
  if (v9)
  {
    v10 = (OZChannelHistogram *)operator new();
    PCURL::PCURL((PCURL *)&v17, a3);
    folderStack = self->_folderStack;
    v12 = folderStack[5] + folderStack[4] - 1;
    OZChannelHistogram::OZChannelHistogram(v10, &v17, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v12 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v12 & 0x1FF)), a4, 0, 6u);
    PCString::~PCString(&v17);
    OZChannelBase::setFlag((OZChannelBase *)v10, 0x100000000, 0);
    (*(void (**)(OZChannelHistogram *, _QWORD))(*(_QWORD *)v10 + 288))(v10, 0);
    if ((v5 & 8) != 0)
      OZChannelFolder::setFoldFlag((OZChannelFolder *)v10, 4);
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v5, v10);
    if (self->_postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    channelMap = (uint64_t **)self->_channelMap;
    v17.var0 = (__CFString *)&v16;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, (unsigned int *)&v16, (uint64_t)&std::piecewise_construct, &v17)[5] = (uint64_t *)v10;
    v17.var0 = (__CFString *)&v16;
    v14 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->_paramCreationMap, (unsigned int *)&v16, (uint64_t)&std::piecewise_construct, &v17);
    v14[5] = (uint64_t *)HistogramTransactionFactory;
    v14[6] = (uint64_t *)HistogramRetrieval;
    v14[7] = 0;
    if (self->_postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
  }
  return v9;
}

- (BOOL)addGradientWithName:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5
{
  uint64_t v5;
  _BOOL4 v9;
  uint64_t v10;
  _QWORD *folderStack;
  unint64_t v12;
  int v13;
  uint64_t **channelMap;
  uint64_t **v15;
  uint64_t v17;
  PCString v18;

  v5 = *(_QWORD *)&a5;
  LODWORD(v17) = a4;
  v9 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a4, 1, 1, v17);
  if (v9)
  {
    v10 = operator new();
    PCURL::PCURL((PCURL *)&v18, a3);
    folderStack = self->_folderStack;
    v12 = folderStack[5] + folderStack[4] - 1;
    OZChannelGradient::OZChannelGradient((OZChannelGradient *)v10, &v18, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v12 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v12 & 0x1FF)), a4, 0);
    PCString::~PCString(&v18);
    if (a4 == 2989)
    {
      if (self->_isNewGradientColorize)
        *(_BYTE *)(v10 + 796) = 1;
      v13 = 2;
    }
    else
    {
      v13 = 1;
    }
    *(_DWORD *)(v10 + 792) = v13;
    OZChannelBase::setFlag((OZChannelBase *)v10, 0x100000000, 0);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v10 + 288))(v10, 0);
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v5, v10);
    if ((v5 & 8) != 0)
      OZChannelFolder::setFoldFlag((OZChannelFolder *)v10, 4);
    if (self->_postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    channelMap = (uint64_t **)self->_channelMap;
    v18.var0 = (__CFString *)&v17;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, (unsigned int *)&v17, (uint64_t)&std::piecewise_construct, &v18)[5] = (uint64_t *)v10;
    v18.var0 = (__CFString *)&v17;
    v15 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->_paramCreationMap, (unsigned int *)&v17, (uint64_t)&std::piecewise_construct, &v18);
    v15[5] = (uint64_t *)GradientTransactionFactory;
    v15[6] = (uint64_t *)NoOpRetrieval;
    v15[7] = 0;
    if (self->_postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
  }
  return v9;
}

- (BOOL)addGradientPositionedWithName:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5
{
  uint64_t v5;
  _BOOL4 v9;
  OZChannelGradientPositioned *v10;
  _QWORD *folderStack;
  unint64_t v12;
  uint64_t **channelMap;
  uint64_t v15;
  PCString v16;

  v5 = *(_QWORD *)&a5;
  LODWORD(v15) = a4;
  v9 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a4, 1, 1, v15);
  if (v9)
  {
    v10 = (OZChannelGradientPositioned *)operator new();
    PCURL::PCURL((PCURL *)&v16, a3);
    folderStack = self->_folderStack;
    v12 = folderStack[5] + folderStack[4] - 1;
    OZChannelGradientPositioned::OZChannelGradientPositioned(v10, &v16, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v12 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v12 & 0x1FF)), a4, 0);
    PCString::~PCString(&v16);
    *((_DWORD *)v10 + 198) = 0;
    OZChannelBase::setFlag((OZChannelBase *)v10, 0x100000000, 0);
    (*(void (**)(OZChannelGradientPositioned *, _QWORD))(*(_QWORD *)v10 + 288))(v10, 0);
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v5, v10);
    if ((v5 & 8) != 0)
      OZChannelFolder::setFoldFlag((OZChannelFolder *)v10, 4);
    if (self->_postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    channelMap = (uint64_t **)self->_channelMap;
    v16.var0 = (__CFString *)&v15;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, (unsigned int *)&v15, (uint64_t)&std::piecewise_construct, &v16)[5] = (uint64_t *)v10;
    if (self->_postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
  }
  return v9;
}

- (BOOL)addStringParameterWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(id)a5 parmFlags:(unsigned int)a6
{
  uint64_t v6;
  _BOOL4 v11;
  _QWORD *folderStack;
  unint64_t v13;
  OZChannelFolder *v14;
  OZChannelText *v15;
  uint64_t **channelMap;
  uint64_t **v17;
  PCString v19;
  PCString v20;
  unsigned int v21;
  unsigned int *v22;

  v6 = *(_QWORD *)&a6;
  v21 = a4;
  v11 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a4, 1, 1);
  if (v11)
  {
    PCURL::PCURL((PCURL *)&v20, a3);
    PCURL::PCURL((PCURL *)&v19, a5);
    folderStack = self->_folderStack;
    v13 = folderStack[5] + folderStack[4] - 1;
    v14 = *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v13 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v13 & 0x1FF));
    v15 = (OZChannelText *)operator new();
    OZChannelText::OZChannelText(v15, &v20, &v19, v14, a4, 0);
    OZChannelBase::setFlag((OZChannelBase *)v15, 0x100000000, 0);
    (*((void (**)(OZChannelText *, _QWORD))v15->var0 + 36))(v15, 0);
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v6, v15);
    if (self->_postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    channelMap = (uint64_t **)self->_channelMap;
    v22 = &v21;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v21, (uint64_t)&std::piecewise_construct, &v22)[5] = (uint64_t *)v15;
    v22 = &v21;
    v17 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->_paramCreationMap, &v21, (uint64_t)&std::piecewise_construct, &v22);
    v17[5] = (uint64_t *)StringTransactionFactory;
    v17[6] = (uint64_t *)StringRetrieval;
    v17[7] = 0;
    if (self->_postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
    PCString::~PCString(&v19);
    PCString::~PCString(&v20);
  }
  return v11;
}

- (BOOL)addPathPickerWithName:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  PCPrint("File %s, line %d should not have been reached:\n\t", (uint64_t)a2, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7, (char)"/Library/Caches/com.apple.xbs/Sources/MotioniOS/Ozone/Effects/FxFilter/OZFxPlugParameterHandler.mm");
  pcAbortImpl();
}

- (void)preGetCMTime:(id *)a3 forChannel:(OZChannelBase *)a4 atFxTime:(id)a5
{
  int64_t v8;
  __int128 v10;
  int64_t v11;
  __int128 v12;
  int64_t v13;

  if (self)
  {
    -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a5.var1, 0);
  }
  else
  {
    v12 = 0uLL;
    v13 = 0;
  }
  *(_OWORD *)&a3->var0 = v12;
  v8 = v13;
  a3->var3 = v13;
  v10 = *(_OWORD *)&a3->var0;
  v11 = v8;
  return -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v10, a4);
}

- (OZChannelBase)channelForParameterID:(unsigned int)a3
{
  _QWORD *channelMap;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  unsigned int v8;
  BOOL v9;
  char **v10;

  channelMap = self->_channelMap;
  v6 = (char *)channelMap[1];
  v4 = (char *)(channelMap + 1);
  v5 = v6;
  if (!v6)
    return 0;
  v7 = v4;
  do
  {
    v8 = *((_DWORD *)v5 + 8);
    v9 = v8 >= a3;
    if (v8 >= a3)
      v10 = (char **)v5;
    else
      v10 = (char **)(v5 + 8);
    if (v9)
      v7 = v5;
    v5 = *v10;
  }
  while (*v10);
  if (v7 != v4 && *((_DWORD *)v7 + 8) <= a3)
    return (OZChannelBase *)*((_QWORD *)v7 + 5);
  else
    return 0;
}

- (BOOL)_getFloatValue:(double *)a3 fromParm:(unsigned int)a4 atTime:(id)a5
{
  OZChannelBase *v8;
  void *v9;
  uint64_t v10;
  CMTime v12[2];
  CMTime v13;
  id v14;

  v8 = -[OZFxPlugParameterHandler channelForParameterID:](self, "channelForParameterID:", *(_QWORD *)&a4);
  if (v8)
  {
    if (self)
    {
      -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
      -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a5.var1, 0);
    }
    else
    {
      v14 = 0;
      memset(&v12[1], 0, sizeof(CMTime));
    }
    v13 = v12[1];
    v12[0] = v12[1];
    v9 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", v12, v8);
    OZChannel::getValueAsDouble((OZChannel *)v8, &v13, 0.0);
    *(_QWORD *)a3 = v10;
    -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v9);
    ProCore_Impl::PCNSRefImpl::release(&v14);
  }
  return v8 != 0;
}

- (BOOL)_getIntValue:(int *)a3 fromParm:(unsigned int)a4 atTime:(id)a5
{
  OZChannelBase *v8;
  void *v9;
  CMTime v11[2];
  CMTime v12;
  id v13;

  v8 = -[OZFxPlugParameterHandler channelForParameterID:](self, "channelForParameterID:", *(_QWORD *)&a4);
  if (v8)
  {
    if (self)
    {
      -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
      -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a5.var1, 0);
    }
    else
    {
      v13 = 0;
      memset(&v11[1], 0, sizeof(CMTime));
    }
    v12 = v11[1];
    v11[0] = v11[1];
    v9 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", v11, v8);
    *a3 = OZChannel::getValueAsInt((OZChannel *)v8, &v12, 0.0);
    -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v9);
    ProCore_Impl::PCNSRefImpl::release(&v13);
  }
  return v8 != 0;
}

- (BOOL)_getBoolValue:(BOOL *)a3 fromParm:(unsigned int)a4 atTime:(id)a5
{
  OZChannelBase *v8;
  void *v9;
  CMTime v11[2];
  CMTime v12;
  id v13;

  v8 = -[OZFxPlugParameterHandler channelForParameterID:](self, "channelForParameterID:", *(_QWORD *)&a4);
  if (v8)
  {
    if (self)
    {
      -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
      -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a5.var1, 0);
    }
    else
    {
      v13 = 0;
      memset(&v11[1], 0, sizeof(CMTime));
    }
    v12 = v11[1];
    v11[0] = v11[1];
    v9 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", v11, v8);
    *a3 = OZChannel::getValueAsInt((OZChannel *)v8, &v12, 0.0) != 0;
    -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v9);
    ProCore_Impl::PCNSRefImpl::release(&v13);
  }
  return v8 != 0;
}

- (BOOL)_getRedValue:(double *)a3 greenValue:(double *)a4 blueValue:(double *)a5 fromParm:(unsigned int)a6 atTime:(id)a7
{
  OZChannelBase *v12;
  void *v13;
  CGColorSpace *CGColorSpace;
  uint64_t v16;
  uint64_t v17;
  PCColor v18;
  __int128 v19;
  double v20;
  __int128 v21;
  double v22;
  id v23;

  v12 = -[OZFxPlugParameterHandler channelForParameterID:](self, "channelForParameterID:", *(_QWORD *)&a6);
  if (v12)
  {
    if (self)
    {
      -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
      -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a7.var1, 0);
    }
    else
    {
      v23 = 0;
      memset(&v18, 0, 24);
    }
    v21 = *(_OWORD *)&v18.var0.var0;
    v22 = v18.var0.var1[1];
    v19 = *(_OWORD *)&v18.var0.var0;
    v20 = v18.var0.var1[1];
    v13 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v19, v12);
    PCColor::PCColor(&v18);
    (*((void (**)(OZChannelBase *, __int128 *, PCColor *))v12->var0 + 104))(v12, &v21, &v18);
    v16 = 0;
    v17 = 0;
    if (OZChannelColorNoAlpha::isColor((OZChannelColorNoAlpha *)v12))
    {
      -[OZFxPlugParameterHandler getColorInFxPlugColorSpace:red:green:blue:alpha:](self, "getColorInFxPlugColorSpace:red:green:blue:alpha:", &v18, (char *)&v17 + 4, &v17, (char *)&v16 + 4, &v16);
    }
    else
    {
      CGColorSpace = PCColor::getCGColorSpace(&v18);
      PCColor::getRGBA(&v18, (float *)&v17 + 1, (float *)&v17, (float *)&v16 + 1, (float *)&v16, CGColorSpace);
    }
    *a3 = *((float *)&v17 + 1);
    *a4 = *(float *)&v17;
    *a5 = *((float *)&v16 + 1);
    -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v13);
    PCCFRef<CGColorSpace *>::~PCCFRef(&v18.var1._obj);
    ProCore_Impl::PCNSRefImpl::release(&v23);
  }
  return v12 != 0;
}

- (BOOL)_getRedValue:(double *)a3 greenValue:(double *)a4 blueValue:(double *)a5 alphaValue:(double *)a6 fromParm:(unsigned int)a7 atTime:(id)a8
{
  OZChannelBase *v14;
  void *v15;
  CGColorSpace *CGColorSpace;
  uint64_t v18;
  uint64_t v19;
  PCColor v20;
  __int128 v21;
  double v22;
  __int128 v23;
  double v24;
  id v25;

  v14 = -[OZFxPlugParameterHandler channelForParameterID:](self, "channelForParameterID:", *(_QWORD *)&a7);
  if (v14)
  {
    if (self)
    {
      -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
      -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a8.var1, 0);
    }
    else
    {
      v25 = 0;
      memset(&v20, 0, 24);
    }
    v23 = *(_OWORD *)&v20.var0.var0;
    v24 = v20.var0.var1[1];
    v21 = *(_OWORD *)&v20.var0.var0;
    v22 = v20.var0.var1[1];
    v15 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v21, v14);
    PCColor::PCColor(&v20);
    (*((void (**)(OZChannelBase *, __int128 *, PCColor *))v14->var0 + 104))(v14, &v23, &v20);
    v18 = 0;
    v19 = 0;
    if (OZChannelColorNoAlpha::isColor((OZChannelColorNoAlpha *)v14))
    {
      -[OZFxPlugParameterHandler getColorInFxPlugColorSpace:red:green:blue:alpha:](self, "getColorInFxPlugColorSpace:red:green:blue:alpha:", &v20, (char *)&v19 + 4, &v19, (char *)&v18 + 4, &v18);
    }
    else
    {
      CGColorSpace = PCColor::getCGColorSpace(&v20);
      PCColor::getRGBA(&v20, (float *)&v19 + 1, (float *)&v19, (float *)&v18 + 1, (float *)&v18, CGColorSpace);
    }
    *a3 = *((float *)&v19 + 1);
    *a4 = *(float *)&v19;
    *a5 = *((float *)&v18 + 1);
    *a6 = *(float *)&v18;
    -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v15);
    PCCFRef<CGColorSpace *>::~PCCFRef(&v20.var1._obj);
    ProCore_Impl::PCNSRefImpl::release(&v25);
  }
  return v14 != 0;
}

- (BOOL)_getXValue:(double *)a3 YValue:(double *)a4 fromParm:(unsigned int)a5 atTime:(id)a6
{
  OZChannelBase *v10;
  OZChannelBase *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __shared_weak_count *cntrl;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  const void *v22;
  unsigned __int8 v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v31;
  int v32;
  double v33;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v39;
  OZLocking *v40[2];
  CMTime v41[59];
  CMTime v42;
  CMTime v43;
  id v44;

  v10 = -[OZFxPlugParameterHandler channelForParameterID:](self, "channelForParameterID:", *(_QWORD *)&a5);
  if (v10)
  {
    v11 = v10;
    if (self)
    {
      -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
      v43 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
      -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a6.var1, 0);
    }
    else
    {
      v44 = 0;
      memset(v41, 0, 24);
    }
    v43 = v41[0];
    v42 = v41[0];
    v13 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v42, v11);
    if (a3)
    {
      OZChannel::getValueAsDouble((OZChannel *)&v11[1].var3, &v43, 0.0);
      *(_QWORD *)a3 = v14;
    }
    if (a4)
    {
      OZChannel::getValueAsDouble((OZChannel *)&v11[2].var8, &v43, 0.0);
      *(_QWORD *)a4 = v15;
    }
    if (-[OZFxPlugParameterHandler shouldFlipPoints](self, "shouldFlipPoints"))
      *a4 = 1.0 - *a4;
    if (!-[OZFxPlugParameterHandler useAbsolutePoints](self, "useAbsolutePoints"))
      goto LABEL_32;
    OZRenderParams::OZRenderParams((OZRenderParams *)v41);
    cntrl = self->_fxPlugLock.__cntrl_;
    ptr = self->_fxPlugLock.__ptr_;
    v39 = cntrl;
    if (cntrl)
    {
      v17 = (unint64_t *)((char *)cntrl + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    OZFxPlugLockSentinel::OZFxPlugLockSentinel(v40, (uint64_t)&ptr);
    v19 = (std::__shared_weak_count *)v39;
    if (v39)
    {
      v20 = (unint64_t *)((char *)v39 + 8);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    v22 = *(const void **)v40[0];
    if (!*(_QWORD *)v40[0] || (v23 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v23 & 1) != 0))
    {
      -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v13);
    }
    else
    {
      v35 = 0;
      v36 = 0;
      __asm { FMOV            V0.2D, #-1.0 }
      v37 = _Q0;
      if (v24)
      {
        v31 = 186;
        v25 = v24;
LABEL_29:
        (*(void (**)(_QWORD *, uint64_t *))(*v25 + 8 * v31))(v25, &v35);
        v32 = 0;
        v33 = *((double *)&v37 + 1);
        *a3 = *a3 / *(double *)&v37 + 0.5;
        *a4 = *a4 / v33 + 0.5;
LABEL_30:
        OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v40);
        OZRenderParams::~OZRenderParams((OZRenderParams *)v41);
        if (v32)
        {
          v12 = 0;
LABEL_33:
          ProCore_Impl::PCNSRefImpl::release(&v44);
          return v12;
        }
LABEL_32:
        -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v13, v35, v36);
        v12 = 1;
        goto LABEL_33;
      }
      if (v25)
      {
        v31 = 2;
        goto LABEL_29;
      }
      -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v13, v35, v36);
    }
    v32 = 1;
    goto LABEL_30;
  }
  return 0;
}

- (BOOL)_getAngle:(double *)a3 fromParm:(unsigned int)a4 atTime:(id)a5
{
  OZChannelBase *v8;
  void *v9;
  double v10;
  CMTime v12[2];
  CMTime v13;
  id v14;

  v8 = -[OZFxPlugParameterHandler channelForParameterID:](self, "channelForParameterID:", *(_QWORD *)&a4);
  if (v8)
  {
    if (self)
    {
      -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
      -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a5.var1, 0);
    }
    else
    {
      v14 = 0;
      memset(&v12[1], 0, sizeof(CMTime));
    }
    v13 = v12[1];
    v12[0] = v12[1];
    v9 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", v12, v8);
    OZChannel::getValueAsDouble((OZChannel *)v8, &v13, 0.0);
    *a3 = v10 * 57.2957795;
    -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v9);
    ProCore_Impl::PCNSRefImpl::release(&v14);
  }
  return v8 != 0;
}

- (BOOL)retrieveImage:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParm:(unsigned int)a7 atTime:(id)a8 retriever:(SEL)a9 ARGB:(BOOL)a10 imageType:(unint64_t)a11 forAnalysis:(BOOL)a12
{
  _BOOL4 v12;
  _QWORD *channelMap;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  unsigned int v23;
  char **v25;
  OZChannel *v26;
  OZScene *v27;
  void *v28;
  unsigned int ValueAsUint;
  void *Node;
  void *v31;
  void *v32;
  void *v33;
  OZImageElement *v34;
  __shared_weak_count *cntrl;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  OZFxPlugSharedBase *v41;
  const OZRenderParams *RenderParams;
  GLRenderer *v43;
  const LiAgent *Agent;
  int v49;
  char v50;
  CMTime v52;
  unint64_t PluginNCLC;
  int v54;
  FxColorDescription v55;
  _BYTE v56[24];
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  LiAgent *v65;
  OZFxPlugRenderContextManager *v66[2];
  _BYTE v67[1424];
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v69;
  OZLocking *v70[2];
  CMTime v71;
  CMTime v72;
  id v73;

  if (!self->_appTerminating)
  {
    *a3 = 0;
    v12 = -[OZFxPlugParameterHandler _setupRenderer](self, "_setupRenderer");
    if (!v12)
      return v12;
    channelMap = self->_channelMap;
    v21 = (char *)channelMap[1];
    v19 = (char *)(channelMap + 1);
    v20 = v21;
    if (!v21)
      goto LABEL_15;
    v22 = v19;
    do
    {
      v23 = *((_DWORD *)v20 + 8);
      _CF = v23 >= a7;
      if (v23 >= a7)
        v25 = (char **)v20;
      else
        v25 = (char **)(v20 + 8);
      if (_CF)
        v22 = v20;
      v20 = *v25;
    }
    while (*v25);
    if (v22 == v19 || *((_DWORD *)v22 + 8) > a7)
    {
LABEL_15:
      LOBYTE(v12) = 1;
      return v12;
    }
    v26 = (OZChannel *)*((_QWORD *)v22 + 5);
    v27 = -[OZFxPlugParameterHandler getScene](self, "getScene");
    if (self)
    {
      -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
      memset(&v72, 0, sizeof(v72));
      -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a8.var1, 0);
    }
    else
    {
      v73 = 0;
      memset(&v72, 0, sizeof(v72));
    }
    v71 = v72;
    v28 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v71, v26);
    ValueAsUint = OZChannel::getValueAsUint(v26, &v72, 0.0);
    if (v27)
    {
      Node = OZScene::getNode(v27, ValueAsUint);
      v31 = Node;
      if (Node)
      {
        if (v33)
        {
          if (v34)
            OZImageElement::isDropZone(v34);
          goto LABEL_26;
        }
        if (v32)
        {
LABEL_26:
          cntrl = self->_fxPlugLock.__cntrl_;
          ptr = self->_fxPlugLock.__ptr_;
          v69 = cntrl;
          if (cntrl)
          {
            v36 = (unint64_t *)((char *)cntrl + 8);
            do
              v37 = __ldxr(v36);
            while (__stxr(v37 + 1, v36));
          }
          OZFxPlugLockSentinel::OZFxPlugLockSentinel(v70, (uint64_t)&ptr);
          v38 = (std::__shared_weak_count *)v69;
          if (v69)
          {
            v39 = (unint64_t *)((char *)v69 + 8);
            do
              v40 = __ldaxr(v39);
            while (__stlxr(v40 - 1, v39));
            if (!v40)
            {
              ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
              std::__shared_weak_count::__release_weak(v38);
            }
          }
          v41 = *(OZFxPlugSharedBase **)v70[0];
          if (*(_QWORD *)v70[0])
          {
            RenderParams = (const OZRenderParams *)OZFxPlugRenderContextManager::getRenderParams(&self->_threadContextManager, *(OZFxPlugSharedBase **)v70[0]);
            OZRenderParams::OZRenderParams((OZRenderParams *)v67, RenderParams);
            OZFxPlugSharedBase::setupRenderParamsForRetrievingImage((OZFxPlugSharedBase *)v67, (OZRenderParams *)a6, v31, (OZSceneNode *)&v72, (const CMTime *)self->_renderer, v43);
            if (a12)
            {
              OZRenderParams::setReducedResolutionOverride((uint64_t)v67, 1);
              __asm { FMOV            V0.2D, #1.0 }
              *(_OWORD *)v56 = _Q0;
              OZRenderParams::setResolutionDynamic((uint64_t)v67, (__int128 *)v56);
            }
            OZFxRenderContextAgentSentry::OZFxRenderContextAgentSentry((OZFxRenderContextAgentSentry *)v66, &self->_threadContextManager);
            Agent = (const LiAgent *)OZFxRenderContextAgentSentry::getAgent(v66, v41);
            std::make_unique[abi:ne180100]<LiAgent,LiAgent&>(Agent, &v65);
            LiAgent::setImageSpace((uint64_t)v65, 0);
            v64 = 0x3FF0000000000000;
            v61 = 0x3FF0000000000000;
            v58 = 0x3FF0000000000000;
            *(_QWORD *)v56 = 0x3FF0000000000000;
            *(_OWORD *)&v56[8] = 0u;
            v57 = 0u;
            v59 = 0u;
            v60 = 0u;
            v62 = 0u;
            v63 = 0u;
            OZRenderParams::getResolution((OZRenderParams *)v67, (__n128 *)&v55);
            *(_OWORD *)&v56[8] = 0u;
            v57 = 0u;
            *(_QWORD *)v56 = v55._pcColorDesc._colorSpaceRef._obj;
            v58 = *(_QWORD *)&v55._pcColorDesc._dynamicRange;
            v59 = 0u;
            v60 = 0u;
            v62 = 0u;
            v63 = 0u;
            v61 = 0x3FF0000000000000;
            v64 = 0x3FF0000000000000;
            LiAgent::setPixelTransform((uint64_t)v65, (uint64_t)v56);
            -[OZFxPlugParameterHandler makeSourceFromSceneNode:withRenderParams:](self, "makeSourceFromSceneNode:withRenderParams:", v31, v67);
            OZFxPlugSharedBase::getPluginColorDescription((id *)v41, v65, &v55);
            OZFxPlugRenderContextManager::getImageList(&self->_threadContextManager);
            PluginNCLC = OZFxPlugSharedBase::getPluginNCLC((id *)v41, v65);
            v54 = v49;
            v52 = v72;
            OZFxPlug_TextureAndBitmapRetriever((uint64_t)a3, (uint64_t)v31, (uint64_t)&v52, a11, 0, 0, (uint64_t)v67, (uint64_t)v65);
          }
          -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v28);
          OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v70);
          v50 = 0;
LABEL_39:
          ProCore_Impl::PCNSRefImpl::release(&v73);
          LOBYTE(v12) = 1;
          if ((v50 & 1) != 0)
            return v12;
          goto LABEL_2;
        }
      }
    }
    -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v28);
    v50 = 1;
    goto LABEL_39;
  }
LABEL_2:
  LOBYTE(v12) = 0;
  return v12;
}

- (BOOL)imageSize:(CGSize *)a3 fromParameter:(unsigned int)a4 atTime:(id *)a5
{
  return 0;
}

- (BOOL)getBitmap:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParm:(unsigned int)a7 atTime:(double)a8
{
  __int128 v8;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[3];

  v8 = *(_OWORD *)&a6->var2;
  v12[0] = *(_OWORD *)&a6->var0.var0;
  v12[1] = v8;
  v12[2] = *(_OWORD *)&a6->var4;
  LOBYTE(v11) = 0;
  LOBYTE(v10) = 1;
  return -[OZFxPlugParameterHandler retrieveImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:retriever:ARGB:imageType:forAnalysis:](self, "retrieveImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:retriever:ARGB:imageType:forAnalysis:", a3, a4, a5, v12, *(_QWORD *)&a7, *(_QWORD *)&a8, sel_textureRetriever_, v10, 1, v11);
}

- (BOOL)getTexture:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParm:(unsigned int)a7 atTime:(double)a8
{
  __int128 v8;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[3];

  v8 = *(_OWORD *)&a6->var2;
  v12[0] = *(_OWORD *)&a6->var0.var0;
  v12[1] = v8;
  v12[2] = *(_OWORD *)&a6->var4;
  LOBYTE(v11) = 0;
  LOBYTE(v10) = 1;
  return -[OZFxPlugParameterHandler retrieveImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:retriever:ARGB:imageType:forAnalysis:](self, "retrieveImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:retriever:ARGB:imageType:forAnalysis:", a3, a4, a5, v12, *(_QWORD *)&a7, *(_QWORD *)&a8, sel_textureRetriever_, v10, 2, v11);
}

- (BOOL)getAnalysisTexture:(id *)a3 requestInfo:(id *)a4 fromParm:(unsigned int)a5 atFxTime:(id)a6
{
  __int128 v6;
  uint64_t v8;
  uint64_t v9;
  _OWORD v10[3];

  v6 = *(_OWORD *)&a4->var2;
  v10[0] = *(_OWORD *)&a4->var0.var0;
  v10[1] = v6;
  v10[2] = *(_OWORD *)&a4->var4;
  LOBYTE(v9) = 1;
  LOBYTE(v8) = 1;
  return -[OZFxPlugParameterHandler retrieveImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:retriever:ARGB:imageType:forAnalysis:](self, "retrieveImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:retriever:ARGB:imageType:forAnalysis:", a3, 0, 0, v10, *(_QWORD *)&a5, a6.var1, sel_textureRetriever_, v8, 2, v9);
}

- (void)setAgent:(void *)a3 toScaleTo:(const void *)a4
{
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v5 = *((_QWORD *)a4 + 1);
  v6 = *(_QWORD *)a4;
  v7 = 0u;
  v8 = 0u;
  v9 = v5;
  v10 = 0u;
  v11 = 0u;
  v12 = 0x3FF0000000000000;
  v13 = 0u;
  v14 = 0u;
  v15 = 0x3FF0000000000000;
  LiRenderingTechnology::setEnableMetalRendering((uint64_t)a3, 0);
  LiAgent::setImageSpace((uint64_t)a3, 0);
  LiAgent::setPixelTransform((uint64_t)a3, (uint64_t)&v6);
}

- (BOOL)getHeliumImage:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParm:(unsigned int)a7 atTime:(id)a8
{
  BOOL v13;
  _QWORD *channelMap;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  unsigned int v20;
  BOOL v21;
  char **v22;
  OZChannel *v23;
  OZScene *v24;
  void *v25;
  unsigned int ValueAsUint;
  OZChannelBase *Node;
  OZChannelBase *v28;
  void *v29;
  void *v30;
  OZImageElement *v31;
  __shared_weak_count *cntrl;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  OZFxPlugSharedBase *v38;
  const OZRenderParams *RenderParams;
  GLRenderer *v40;
  char isObjectRef;
  char v42;
  char v43;
  char v44;
  int v45;
  LiImageSource *v46;
  uint64_t Agent;
  __shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  id *v51;
  unsigned __int8 v52;
  _BOOL4 InputNode;
  _BOOL4 v54;
  __int128 v55;
  char v56;
  _BOOL4 IsSpecialLayer;
  char v58;
  char v59;
  _QWORD *v60;
  uint64_t v61;
  int v62;
  int v63;
  int64x2_t v64;
  float64x2_t v65;
  int v66;
  HGNode *v67;
  HGNode *v68;
  uint64_t v69;
  int v70;
  int v71;
  int v72;
  int v73;
  HGXForm *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  FxHeliumImage *v78;
  int64x2_t v79;
  float64x2_t v80;
  int32x2_t v81;
  int32x2_t v82;
  int64x2_t v83;
  FxHeliumImage *v84;
  HGRenderer *HeliumRenderer;
  uint64_t DOD;
  uint64_t v87;
  OZRenderParams *v88;
  char v89;
  void *v90;
  _QWORD v91[2];
  _OWORD v92[2];
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  _BYTE v98[40];
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  double v106;
  int v107;
  int v108;
  int v109;
  int v110;
  FxColorDescription v111;
  __int128 v112;
  HGNode *v113;
  _QWORD v114[2];
  OZLocking *v115[2];
  LiRenderParameters *v116[58];
  OZFxPlugRenderContextManager *v117[2];
  LiImageSource *v118;
  PCSharedCount v119;
  double v120[2];
  double v121;
  double v122;
  _BYTE v123[332];
  uint64_t v124;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v126;
  OZLocking *v127[2];
  CMTime v128;
  CMTime v129;
  uint64_t v130;
  char UseLiEdgeTextureNodeCache;

  *a3 = 0;
  if (-[OZFxPlugParameterHandler _setupRenderer](self, "_setupRenderer") && !self->_appTerminating)
  {
    UseLiEdgeTextureNodeCache = getUseLiEdgeTextureNodeCache();
    setUseLiEdgeTextureNodeCache(0);
    channelMap = self->_channelMap;
    v18 = (char *)channelMap[1];
    v16 = (char *)(channelMap + 1);
    v17 = v18;
    if (!v18)
      goto LABEL_16;
    v19 = v16;
    do
    {
      v20 = *((_DWORD *)v17 + 8);
      v21 = v20 >= a7;
      if (v20 >= a7)
        v22 = (char **)v17;
      else
        v22 = (char **)(v17 + 8);
      if (v21)
        v19 = v17;
      v17 = *v22;
    }
    while (*v22);
    if (v19 == v16 || *((_DWORD *)v19 + 8) > a7)
    {
LABEL_16:
      v13 = 1;
LABEL_17:
      setUseLiEdgeTextureNodeCache(UseLiEdgeTextureNodeCache);
      return v13;
    }
    v23 = (OZChannel *)*((_QWORD *)v19 + 5);
    v24 = -[OZFxPlugParameterHandler getScene](self, "getScene");
    if (self)
    {
      -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
      memset(&v129, 0, sizeof(v129));
      -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a8.var1, 0);
    }
    else
    {
      v130 = 0;
      memset(&v129, 0, sizeof(v129));
    }
    v128 = v129;
    v25 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v128, v23);
    ValueAsUint = OZChannel::getValueAsUint(v23, &v129, 0.0);
    if (v24)
    {
      Node = (OZChannelBase *)OZScene::getNode(v24, ValueAsUint);
      v28 = Node;
      if (Node)
      {
        if (v30)
        {
          if (v31)
            OZImageElement::isDropZone(v31);
LABEL_27:
          cntrl = self->_fxPlugLock.__cntrl_;
          ptr = self->_fxPlugLock.__ptr_;
          v126 = cntrl;
          if (cntrl)
          {
            v33 = (unint64_t *)((char *)cntrl + 8);
            do
              v34 = __ldxr(v33);
            while (__stxr(v34 + 1, v33));
          }
          OZFxPlugLockSentinel::OZFxPlugLockSentinel(v127, (uint64_t)&ptr);
          v35 = (std::__shared_weak_count *)v126;
          if (v126)
          {
            v36 = (unint64_t *)((char *)v126 + 8);
            do
              v37 = __ldaxr(v36);
            while (__stlxr(v37 - 1, v36));
            if (!v37)
            {
              ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
              std::__shared_weak_count::__release_weak(v35);
            }
          }
          v38 = *(OZFxPlugSharedBase **)v127[0];
          if (*(_QWORD *)v127[0])
          {
            RenderParams = (const OZRenderParams *)OZFxPlugRenderContextManager::getRenderParams(&self->_threadContextManager, *(OZFxPlugSharedBase **)v127[0]);
            OZRenderParams::OZRenderParams((OZRenderParams *)v123, RenderParams);
            OZFxPlugSharedBase::setupRenderParamsForRetrievingImage((OZFxPlugSharedBase *)v123, (OZRenderParams *)a6, v28, (OZSceneNode *)&v129, (const CMTime *)self->_renderer, v40);
            isObjectRef = OZChannelBase::isObjectRef(v28);
            v42 = isObjectRef;
            v90 = v25;
            if (v130)
              v43 = isObjectRef;
            else
              v43 = 0;
            OZFxPlug_GetBoundsFromSceneNode(v28, (uint64_t)v120);
            v44 = 1;
            if (v121 < 0.0)
            {
              v45 = 1;
            }
            else
            {
              v89 = v42;
              v45 = 1;
              if (v122 >= 0.0)
              {
                -[OZFxPlugParameterHandler makeSourceFromSceneNode:withRenderParams:](self, "makeSourceFromSceneNode:withRenderParams:", v28, v123, v122);
                if (!v118)
                  goto LABEL_96;
                OZFxRenderContextAgentSentry::OZFxRenderContextAgentSentry((OZFxRenderContextAgentSentry *)v117, &self->_threadContextManager);
                v46 = v118;
                Agent = OZFxRenderContextAgentSentry::getAgent(v117, v38);
                LiAgent::LiAgent((LiAgent *)v116, v46, *(const LiRenderParameters **)(Agent + 48));
                LiRenderingTechnology::setEnableMetalRendering((uint64_t)v116, 1);
                v105 = 0x3FF0000000000000;
                v102 = 0x3FF0000000000000;
                v99 = 0x3FF0000000000000;
                *(_QWORD *)v98 = 0x3FF0000000000000;
                memset(&v98[8], 0, 32);
                v100 = 0u;
                v101 = 0u;
                v103 = 0u;
                v104 = 0u;
                LiAgent::setPixelTransform((uint64_t)v116, (uint64_t)v98);
                v48 = self->_fxPlugLock.__cntrl_;
                v114[0] = self->_fxPlugLock.__ptr_;
                v114[1] = v48;
                if (v48)
                {
                  v49 = (unint64_t *)((char *)v48 + 8);
                  do
                    v50 = __ldxr(v49);
                  while (__stxr(v50 + 1, v49));
                }
                OZFxPlugLockSentinel::OZFxPlugLockSentinel(v115, (uint64_t)v114);
                std::shared_ptr<HGCPUComputeDevice const>::~shared_ptr[abi:ne180100]((uint64_t)v114);
                v51 = *(id **)v115[0];
                if (!*(_QWORD *)v115[0]
                  || (v52 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v52 & 1) != 0))
                {
                  v59 = 0;
                  v45 = 1;
                }
                else
                {
                  v113 = 0;
                  v112 = xmmword_1B30503B0;
                  OZFxPlugSharedBase::getPluginColorDescription(v51, (const LiAgent *)v116, &v111);
                  InputNode = OZFxPlug_GetInputNode((uint64_t *)&v113, (uint64_t)v116, (int32x2_t *)&v112, (__int128 *)&v129.value, 0, 0, (OZRenderParams *)v123, 3, v43, v118, v130, v28, (uint64_t)&v111);
                  v45 = InputNode;
                  if (v113)
                    v54 = InputNode;
                  else
                    v54 = 0;
                  if (v54)
                  {
                    LiAgent::getDOD((uint64_t)v116, (uint64_t)&v107);
                    v55 = v112;
                    if (v130)
                      v56 = v89;
                    else
                      v56 = 0;
                    if ((v56 & 1) != 0)
                    {
                      IsSpecialLayer = 0;
                    }
                    else
                    {
                      v60 = -[OZFxPlugParameterHandler getScene](self, "getScene");
                      if (v60 && (v61 = v60[198]) != 0)
                      {
                        v62 = *(_DWORD *)(v61 + 260);
                        v63 = *(_DWORD *)(v61 + 264);
                      }
                      else
                      {
                        v63 = 13;
                        v62 = 5;
                      }
                      IsSpecialLayer = OZFxPlug_IsSpecialLayer((const OZSceneNode *)v28, v62, v63);
                      v106 = 0.0;
                      v64.i64[0] = v107;
                      v64.i64[1] = v108;
                      v65 = vcvtq_f64_s64(v64);
                      v64.i64[0] = v109;
                      v64.i64[1] = v110;
                      *(float64x2_t *)v98 = v65;
                      *(float64x2_t *)&v98[16] = vcvtq_f64_s64(v64);
                      v66 = OZFxPlug_setPixelTransformToRestrictInputSizeForTemporalAPI((uint64_t)v116, (uint64_t)v98, IsSpecialLayer, &v106);
                      LODWORD(v112) = v112 * (int)v106;
                      DWORD1(v112) *= (int)v106;
                      DWORD2(v112) *= (int)v106;
                      HIDWORD(v112) *= (int)v106;
                      v120[0] = (double)(int)v112;
                      v120[1] = (double)SDWORD1(v112);
                      v121 = (double)SDWORD2(v112);
                      v122 = (double)SHIDWORD(v112);
                      if (v66)
                      {
                        LiAgent::getHelium((LiAgent *)v116, v118, (HGNode **)v98);
                        v67 = *(HGNode **)v98;
                        if (v113 == *(HGNode **)v98)
                        {
                          if (v113)
                            (*(void (**)(void))(*(_QWORD *)v113 + 24))();
                        }
                        else
                        {
                          if (v113)
                          {
                            (*(void (**)(void))(*(_QWORD *)v113 + 24))();
                            v67 = *(HGNode **)v98;
                          }
                          v113 = v67;
                        }
                      }
                    }
                    if (!v113)
                    {
                      v68 = (HGNode *)HGObject::operator new(0x1A0uLL);
                      HGNode::HGNode(v68);
                      if (v113 == v68)
                      {
                        if (v68)
                          (*(void (**)(HGNode *))(*(_QWORD *)v68 + 24))(v68);
                      }
                      else
                      {
                        if (v113)
                          (*(void (**)(void))(*(_QWORD *)v113 + 24))();
                        v113 = v68;
                      }
                    }
                    v69 = OZFxRenderContextAgentSentry::getAgent(v117, (OZFxPlugSharedBase *)v51);
                    if (IsSpecialLayer && *(int *)(v69 + 36) <= 2)
                    {
                      v70 = v107;
                      v71 = v108;
                      v72 = v109;
                      v73 = v110;
                      HGTransform::HGTransform((HGTransform *)v98);
                      HGTransform::Translate((HGTransform *)v98, -((double)v72 * 0.5 + (double)v70), -((double)v73 * 0.5 + (double)v71), 0.0);
                      v74 = (HGXForm *)HGObject::operator new(0x210uLL);
                      HGXForm::HGXForm(v74);
                      (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v74 + 576))(v74, v98);
                      (*(void (**)(HGXForm *, _QWORD, HGNode *))(*(_QWORD *)v74 + 120))(v74, 0, v113);
                      if (v113 != (HGNode *)v74)
                      {
                        if (v113)
                          (*(void (**)(void))(*(_QWORD *)v113 + 24))();
                        v113 = (HGNode *)v74;
                        (*(void (**)(HGXForm *))(*(_QWORD *)v74 + 16))(v74);
                      }
                      (*(void (**)(HGXForm *))(*(_QWORD *)v74 + 24))(v74);
                      HGTransform::~HGTransform((HGTransform *)v98);
                    }
                    -[OZFxPlugParameterHandler getPixelAspectRatioFromSceneNode:](self, "getPixelAspectRatioFromSceneNode:", v28);
                    v76 = v75;
                    v77 = v124;
                    v78 = [FxHeliumImage alloc];
                    v79.i64[0] = (int)v55;
                    v79.i64[1] = SDWORD1(v55);
                    v80 = vcvtq_f64_s64(v79);
                    v79.i64[0] = SDWORD2(v55);
                    v79.i64[1] = SHIDWORD(v55);
                    v81 = vmovn_s64(vcvtq_s64_f64(vrndmq_f64(vaddq_f64(v80, (float64x2_t)vdupq_n_s64(0x3E7AD7F29ABCAF48uLL)))));
                    v82 = vsub_s32(vmovn_s64(vcvtq_s64_f64(vrndpq_f64(vaddq_f64(v80, vcvtq_f64_s64(v79))))), v81);
                    v79.i64[0] = v77;
                    v79.i64[1] = HIDWORD(v77);
                    v83 = v79;
                    v79.i64[0] = v82.u32[0];
                    v79.i64[1] = v82.u32[1];
                    v92[0] = v79;
                    v92[1] = v83;
                    v94 = 0;
                    v95 = 0;
                    v93 = 3;
                    v96 = 1;
                    v97 = v76;
                    v84 = -[FxHeliumImage initWithInfo:andHeliumRef:](v78, "initWithInfo:andHeliumRef:", v92, &v113);
                    *a3 = v84;
                    v91[0] = v81;
                    v91[1] = v82;
                    if (-[OZFxPlugParameterHandler finalizeImage:withSceneNode:pixelBounds:agent:andRenderParams:atTime:](self, "finalizeImage:withSceneNode:pixelBounds:agent:andRenderParams:atTime:", v84, v28, v91, v116, v123, a8.var1))
                    {
                      HeliumRenderer = (HGRenderer *)LiAgent::getHeliumRenderer(v116);
                      DOD = HGRenderer::GetDOD(HeliumRenderer, v113);
                      objc_msgSend(*a3, "setDod:", DOD, v87);
                    }
                    else
                    {

                      v45 = 0;
                      *a3 = 0;
                    }
                    OZFxPlugSharedBase::cleanupRenderParams((OZFxPlugSharedBase *)v123, v88);
                  }
                  PCCFRef<CGColorSpace *>::~PCCFRef(&v111._pcColorDesc._colorSpaceRef._obj);
                  if (v113)
                    (*(void (**)(HGNode *))(*(_QWORD *)v113 + 24))(v113);
                  v59 = 1;
                }
                OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v115);
                LiAgent::~LiAgent((LiAgent *)v116);
                OZFxRenderContextAgentSentry::~OZFxRenderContextAgentSentry((OZFxRenderContextAgentSentry *)v117);
                if ((v59 & 1) == 0)
                {
                  PCSharedCount::~PCSharedCount(&v119);
                  v44 = 0;
                }
                else
                {
LABEL_96:
                  PCSharedCount::~PCSharedCount(&v119);
                  v44 = 1;
                }
              }
            }
            OZRenderParams::~OZRenderParams((OZRenderParams *)v123);
            OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v127);
            if ((v44 & 1) != 0)
            {
              v25 = v90;
              goto LABEL_57;
            }
            v58 = 0;
          }
          else
          {
            -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v25);
            OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v127);
            v58 = 0;
            v45 = 1;
          }
LABEL_58:
          ProCore_Impl::PCNSRefImpl::release((id *)&v130);
          v13 = v45 != 0;
          if ((v58 & 1) == 0)
            v13 = 0;
          goto LABEL_17;
        }
        if (v29)
          goto LABEL_27;
      }
    }
    v45 = 1;
LABEL_57:
    -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v25);
    v58 = 1;
    goto LABEL_58;
  }
  return 0;
}

- (BOOL)getCustomParameterValue:(id *)a3 fromParm:(unsigned int)a4
{
  OZChannelBase *v6;
  id v8;

  v6 = -[OZFxPlugParameterHandler channelForParameterID:](self, "channelForParameterID:", *(_QWORD *)&a4);
  if (v6)
  {
    if (self)
      -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
    else
      v8 = 0;
    *a3 = OZChannelBlindData::getPluginDataPtr((OZChannelBlindData *)v6, MEMORY[0x1E0CA2E68]);
    ProCore_Impl::PCNSRefImpl::release(&v8);
  }
  return v6 != 0;
}

- (BOOL)_getCustomParameterValue:(id *)a3 fromParm:(unsigned int)a4 atTime:(id)a5
{
  uint64_t v6;
  OZChannelBase *v9;
  OZChannelBlindData *v10;
  BOOL v11;
  __shared_weak_count *cntrl;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  void *v20;
  NSData *PluginDataPtr;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  CMTime v28;
  CMTime v29;
  CMTime v30;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v32;
  OZLocking *v33[2];
  id v34;

  v6 = *(_QWORD *)&a4;
  v9 = -[OZFxPlugParameterHandler channelForParameterID:](self, "channelForParameterID:", *(_QWORD *)&a4);
  if (v9)
  {
    v10 = (OZChannelBlindData *)v9;
    if (self)
      -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
    else
      v34 = 0;
    cntrl = self->_fxPlugLock.__cntrl_;
    ptr = self->_fxPlugLock.__ptr_;
    v32 = cntrl;
    if (cntrl)
    {
      v13 = (unint64_t *)((char *)cntrl + 8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    OZFxPlugLockSentinel::OZFxPlugLockSentinel(v33, (uint64_t)&ptr);
    v15 = (std::__shared_weak_count *)v32;
    if (v32)
    {
      v16 = (unint64_t *)((char *)v32 + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = *(_QWORD *)v33[0];
    if (!*(_QWORD *)v33[0] || (v19 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v19 & 1) != 0))
    {
      v11 = 0;
LABEL_29:
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v33);
      ProCore_Impl::PCNSRefImpl::release(&v34);
      return v11;
    }
    v30 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a5.var1, 0);
    v30 = v29;
    v28 = v29;
    v20 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v28, v10);
    PluginDataPtr = OZChannelBlindData::getPluginDataPtr(v10, &v30);
    *a3 = PluginDataPtr;
    if (*(_BYTE *)(v18 + 216))
      v22 = 1;
    else
      v22 = PluginDataPtr == 0;
    if (!v22)
    {
      v23 = *(void **)(v18 + 24);
      if (!v23)
      {
        v11 = 0;
        *a3 = 0;
        goto LABEL_28;
      }
      if ((objc_msgSend(v23, "useLegacyCoding") & 1) == 0)
      {
        v29.value = 0;
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", *a3, &v29);
        if (!v24)
        {
          v25 = (void *)MEMORY[0x1E0C99DA0];
          v26 = objc_msgSend((id)v29.value, "localizedFailureReason");
          objc_msgSend(v25, "raise:format:", *MEMORY[0x1E0C99850], CFSTR("%@"), v26);
        }
        *a3 = (id)objc_msgSend(v24, "decodeObjectOfClass:forKey:", objc_msgSend(*(id *)(v18 + 24), "classForCustomParameterID:", v6), CFSTR("Custom Data"));
        v11 = 1;

        goto LABEL_28;
      }
    }
    v11 = 1;
LABEL_28:
    -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v20);
    goto LABEL_29;
  }
  return 0;
}

- (id)decodeLegacyData:(id)a3 forParameterID:(unsigned int)a4
{
  uint64_t v4;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v18;
  OZLocking *v19[2];

  v4 = *(_QWORD *)&a4;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v18 = cntrl;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v19, (uint64_t)&ptr);
  v10 = (std::__shared_weak_count *)v18;
  if (v18)
  {
    v11 = (unint64_t *)((char *)v18 + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  if (*(_QWORD *)v19[0]
    && (v13 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v13 & 1) == 0)
    && (v14 = *(void **)(*(_QWORD *)v19[0] + 24), (objc_opt_respondsToSelector() & 1) != 0))
  {
    v15 = (void *)objc_msgSend(v14, "decodeLegacyData:forParameterID:", a3, v4, ptr);
  }
  else
  {
    v15 = 0;
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v19);
  return v15;
}

- (BOOL)getFloatValue:(double *)a3 fromParm:(unsigned int)a4 atTime:(double)a5
{
  return -[OZFxPlugParameterHandler _getFloatValue:fromParm:atTime:](self, "_getFloatValue:fromParm:atTime:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (BOOL)getIntValue:(int *)a3 fromParm:(unsigned int)a4 atTime:(double)a5
{
  return -[OZFxPlugParameterHandler _getIntValue:fromParm:atTime:](self, "_getIntValue:fromParm:atTime:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (BOOL)getBoolValue:(BOOL *)a3 fromParm:(unsigned int)a4 atTime:(double)a5
{
  return -[OZFxPlugParameterHandler _getBoolValue:fromParm:atTime:](self, "_getBoolValue:fromParm:atTime:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (BOOL)getRedValue:(double *)a3 greenValue:(double *)a4 blueValue:(double *)a5 fromParm:(unsigned int)a6 atTime:(double)a7
{
  return -[OZFxPlugParameterHandler _getRedValue:greenValue:blueValue:fromParm:atTime:](self, "_getRedValue:greenValue:blueValue:fromParm:atTime:", a3, a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

- (BOOL)getRedValue:(double *)a3 greenValue:(double *)a4 blueValue:(double *)a5 alphaValue:(double *)a6 fromParm:(unsigned int)a7 atTime:(double)a8
{
  return -[OZFxPlugParameterHandler _getRedValue:greenValue:blueValue:alphaValue:fromParm:atTime:](self, "_getRedValue:greenValue:blueValue:alphaValue:fromParm:atTime:", a3, a4, a5, a6, *(_QWORD *)&a7, *(_QWORD *)&a8);
}

- (BOOL)getXValue:(double *)a3 YValue:(double *)a4 fromParm:(unsigned int)a5 atTime:(double)a6
{
  return -[OZFxPlugParameterHandler _getXValue:YValue:fromParm:atTime:](self, "_getXValue:YValue:fromParm:atTime:", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
}

- (BOOL)getCustomParameterValue:(id *)a3 fromParm:(unsigned int)a4 atTime:(double)a5
{
  return -[OZFxPlugParameterHandler _getCustomParameterValue:fromParm:atTime:](self, "_getCustomParameterValue:fromParm:atTime:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (BOOL)getPathID:(void *)a3 fromParm:(unsigned int)a4 atTime:(double)a5
{
  return -[OZFxPlugParameterHandler _getPathID:fromParm:atTime:](self, "_getPathID:fromParm:atTime:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (BOOL)_getHistogramBlackIn:(double *)a3 BlackOut:(double *)a4 WhiteIn:(double *)a5 WhiteOut:(double *)a6 Gamma:(double *)a7 forChannel:(unint64_t)a8 fromParm:(unsigned int)a9 atTime:(id)a10
{
  int v10;
  OZChannelBase *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CMTime v25[2];
  CMTime v26;
  id v27;

  v10 = a8;
  v17 = -[OZFxPlugParameterHandler channelForParameterID:](self, "channelForParameterID:", a9);
  if (v17)
  {
    if (self)
    {
      -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
      -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a10.var1, 0);
    }
    else
    {
      v27 = 0;
      memset(&v25[1], 0, sizeof(CMTime));
    }
    v26 = v25[1];
    v25[0] = v25[1];
    v18 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", v25, v17);
    OZChannelHistogram::getBlackInValue((OZChannelHistogram *)v17, v10, &v26, 0.0);
    *(_QWORD *)a3 = v19;
    OZChannelHistogram::getBlackOutValue((OZChannelHistogram *)v17, v10, &v26, 0.0);
    *(_QWORD *)a4 = v20;
    OZChannelHistogram::getWhiteInValue((OZChannelHistogram *)v17, v10, &v26, 0.0);
    *(_QWORD *)a5 = v21;
    OZChannelHistogram::getWhiteOutValue((OZChannelHistogram *)v17, v10, &v26, 0.0);
    *(_QWORD *)a6 = v22;
    OZChannelHistogram::getGammaValue((OZChannelHistogram *)v17, v10, &v26, 0.0);
    *(_QWORD *)a7 = v23;
    -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v18);
    ProCore_Impl::PCNSRefImpl::release(&v27);
  }
  return v17 != 0;
}

- (BOOL)getHistogramBlackIn:(double *)a3 BlackOut:(double *)a4 WhiteIn:(double *)a5 WhiteOut:(double *)a6 Gamma:(double *)a7 forChannel:(unint64_t)a8 fromParm:(unsigned int)a9 atTime:(double)a10
{
  uint64_t v11;

  LODWORD(v11) = a9;
  return -[OZFxPlugParameterHandler _getHistogramBlackIn:BlackOut:WhiteIn:WhiteOut:Gamma:forChannel:fromParm:atTime:](self, "_getHistogramBlackIn:BlackOut:WhiteIn:WhiteOut:Gamma:forChannel:fromParm:atTime:", a3, a4, a5, a6, a7, a8, v11, *(_QWORD *)&a10);
}

- (BOOL)getLevelsBlack:(double *)a3 White:(double *)a4 Gamma:(double *)a5 fromParm:(unsigned int)a6 atTime:(id)a7
{
  OZChannelBase *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CMTime v18[2];
  CMTime v19;
  id v20;

  v12 = -[OZFxPlugParameterHandler channelForParameterID:](self, "channelForParameterID:", *(_QWORD *)&a6);
  if (v12)
  {
    if (self)
    {
      -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
      -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a7.var1, 0);
    }
    else
    {
      v20 = 0;
      memset(&v18[1], 0, sizeof(CMTime));
    }
    v19 = v18[1];
    v18[0] = v18[1];
    v13 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", v18, v12);
    OZChannelLevels::getBlackValue((OZChannelLevels *)v12, &v19, 0.0);
    *(_QWORD *)a3 = v14;
    OZChannelLevels::getWhiteValue((OZChannelLevels *)v12, &v19, 0.0);
    *(_QWORD *)a4 = v15;
    OZChannelLevels::getGammaValue((OZChannelLevels *)v12, &v19, 0.0);
    *(_QWORD *)a5 = v16;
    -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v13);
    ProCore_Impl::PCNSRefImpl::release(&v20);
  }
  return v12 != 0;
}

- (BOOL)_getGradientSamples:(void *)a3 numSamples:(unint64_t)a4 depth:(unint64_t)a5 fromParm:(unsigned int)a6 atTime:(id)a7
{
  OZFxPlugParameterHandler *v7;
  uint64_t **v12;
  CGColorSpace *CGColorSpace;
  int DynamicRange;
  PCToneMapMethod *ToneMapMethod;
  int isSDR;
  CGColorSpace *v17;
  PCToneMapMethod *v18;
  float *v19;
  uint64_t v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  int *v26;
  uint64_t v27;
  int v28;
  float *v29;
  uint64_t v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  CGColorSpace *v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  uint64_t v45;
  CGColorSpace *v46;
  uint64_t v47;
  void *__p[3];
  void *v49;
  _BYTE *v50;
  PCToneMapMethod v51;
  FxColorDescription v52;
  FxColorDescription v53;
  __int128 v54;
  uint64_t v55;
  CMTime pcColorDesc;
  id v57;

  v7 = self;
  LOBYTE(self) = 0;
  if (a5 <= 0x20 && ((1 << a5) & 0x100010116) != 0)
  {
    self = -[OZFxPlugParameterHandler channelForParameterID:](v7, "channelForParameterID:", *(_QWORD *)&a6);
    if (self)
    {
      v12 = (uint64_t **)self;
      if (v7)
      {
        -[OZFxPlugParameterHandler motionEffectRef](v7, "motionEffectRef");
        pcColorDesc = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
        -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](v7, "fxTimeToFigTime:withConversionData:", a7.var1, 0);
      }
      else
      {
        v57 = 0;
        memset(&v52, 0, 24);
      }
      pcColorDesc = (CMTime)v52._pcColorDesc;
      v54 = *(_OWORD *)&v52._pcColorDesc._colorSpaceRef._obj;
      v55 = *(_QWORD *)&v52._pcColorDesc._toneMapMethod._gain;
      v37 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](v7, "beginTimingOperation:forChannel:", &v54, v12);
      if (v7)
      {
        -[OZFxPlugParameterHandler getColorTransformInfo](v7, "getColorTransformInfo");
      }
      else
      {
        memset(&v53, 0, sizeof(v53));
        memset(&v52, 0, sizeof(v52));
      }
      CGColorSpace = (CGColorSpace *)FxColorDescription::getCGColorSpace(&v53);
      DynamicRange = FxColorDescription::getDynamicRange(&v53);
      if (FxColorDescription::isDynamicRangeManaged(&v52))
        ToneMapMethod = (PCToneMapMethod *)FxColorDescription::getToneMapMethod(&v52);
      else
        ToneMapMethod = (PCToneMapMethod *)&kPCNoToneMapMethod;
      v51 = *ToneMapMethod;
      if (FxColorDescription::isHDR(&v52))
        isSDR = FxColorDescription::isSDR(&v53);
      else
        isSDR = 0;
      std::vector<float>::vector(&v49, 4 * a4);
      if (isSDR)
      {
        v17 = PCGetNCLCColorSpace((unsigned int *)&kPCNCLC_Rec2020Linear);
        std::vector<float>::vector(__p, 4 * a4);
        OZChannelGradient::getGradient(v12, &pcColorDesc, v17, (uint64_t)__p[0], a4, 1, &v51);
        v43 = a4;
        v44 = __p[0];
        v45 = 4;
        v46 = v17;
        v47 = 0x100000001;
        v38 = a4;
        v39 = v49;
        v40 = 4;
        v41 = CGColorSpace;
        LODWORD(v42) = 1;
        HIDWORD(v42) = DynamicRange;
        v18 = (PCToneMapMethod *)FxColorDescription::getToneMapMethod(&v53);
        PCColorUtil::transformColorWithDynamicRange((uint64_t)&v43, (uint64_t)&v38, v18);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      else
      {
        OZChannelGradient::getGradient(v12, &pcColorDesc, CGColorSpace, (uint64_t)v49, a4, DynamicRange, &v51);
      }
      switch(a5)
      {
        case 1uLL:
        case 8uLL:
          v19 = (float *)v49;
          if (v50 != v49)
          {
            v20 = (v50 - (_BYTE *)v49) >> 2;
            do
            {
              v21 = *v19++;
              v22 = v21;
              v23 = 255.0;
              v24 = v21 * 255.0;
              if (v21 <= 1.0)
                v23 = v24;
              if (v22 >= 0.0)
                v25 = v23;
              else
                v25 = 0.0;
              *(_BYTE *)a3 = vcvtmd_s64_f64(v25 + 0.5 + 0.0000001);
              a3 = (char *)a3 + 1;
              --v20;
            }
            while (v20);
          }
          goto LABEL_44;
        case 2uLL:
          goto LABEL_36;
        case 3uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
          goto LABEL_44;
        case 4uLL:
          goto LABEL_32;
        default:
          if (a5 == 16)
          {
LABEL_36:
            v29 = (float *)v49;
            if (v50 != v49)
            {
              v30 = (v50 - (_BYTE *)v49) >> 2;
              do
              {
                v31 = *v29++;
                v32 = v31;
                v33 = 65536.0;
                v34 = v31 * 65536.0;
                if (v31 <= 1.0)
                  v33 = v34;
                if (v32 >= 0.0)
                  v35 = v33;
                else
                  v35 = 0.0;
                *(_WORD *)a3 = vcvtmd_s64_f64(v35 + 0.5 + 0.0000001);
                a3 = (char *)a3 + 2;
                --v30;
              }
              while (v30);
            }
          }
          else if (a5 == 32)
          {
LABEL_32:
            v26 = (int *)v49;
            if (v50 != v49)
            {
              v27 = (v50 - (_BYTE *)v49) >> 2;
              do
              {
                v28 = *v26++;
                *(_DWORD *)a3 = v28;
                a3 = (char *)a3 + 4;
                --v27;
              }
              while (v27);
            }
          }
LABEL_44:
          -[OZFxPlugParameterHandler endTimingOperation:](v7, "endTimingOperation:", v37, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47);
          if (v49)
          {
            v50 = v49;
            operator delete(v49);
          }
          PCCFRef<CGColorSpace *>::~PCCFRef(&v53._pcColorDesc._colorSpaceRef._obj);
          PCCFRef<CGColorSpace *>::~PCCFRef(&v52._pcColorDesc._colorSpaceRef._obj);
          ProCore_Impl::PCNSRefImpl::release(&v57);
          LOBYTE(self) = 1;
          break;
      }
    }
  }
  return (char)self;
}

- (BOOL)getGradientSamples:(void *)a3 numSamples:(unint64_t)a4 depth:(unint64_t)a5 fromParm:(unsigned int)a6 atTime:(double)a7
{
  return -[OZFxPlugParameterHandler _getGradientSamples:numSamples:depth:fromParm:atTime:](self, "_getGradientSamples:numSamples:depth:fromParm:atTime:", a3, a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

- (BOOL)getGradientStartEnd:(double *)a3 startY:(double *)a4 endX:(double *)a5 endY:(double *)a6 type:(int *)a7 fromParm:(unsigned int)a8 atTime:(id)a9
{
  OZChannelBase *v15;
  void *v16;
  CMTime v18[2];
  CMTime v19;
  id v20;

  v15 = -[OZFxPlugParameterHandler channelForParameterID:](self, "channelForParameterID:", *(_QWORD *)&a8);
  if (v15)
  {
    if (self)
    {
      -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
      -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a9.var1, 0);
    }
    else
    {
      v20 = 0;
      memset(&v18[1], 0, sizeof(CMTime));
    }
    v19 = v18[1];
    v18[0] = v18[1];
    v16 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", v18, v15);
    *a7 = OZChannel::getValueAsInt((OZChannel *)&v15[7].var2, &v19, 0.0);
    OZChannelPosition::getPosition((OZChannelPosition *)&v15[9].var6, &v19, a3, a4, 0.0);
    OZChannelPosition::getPosition((OZChannelPosition *)&v15[15].var10, &v19, a5, a6, 0.0);
    -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v16);
    ProCore_Impl::PCNSRefImpl::release(&v20);
  }
  return v15 != 0;
}

- (BOOL)getParameterFlags:(unsigned int *)a3 fromParm:(unsigned int)a4
{
  _QWORD *channelMap;
  char *v7;
  char *v8;
  char *v9;
  char *v11;
  unsigned int v12;
  BOOL v13;
  char **v14;
  OZChannelBase *v16;
  OZChannelFolder *v17;
  unsigned int *end;
  __int32 *v19;
  unsigned int *v20;
  id v21;

  if (!a3)
    return 0;
  *a3 = 0;
  channelMap = self->_channelMap;
  v9 = (char *)channelMap[1];
  v7 = (char *)(channelMap + 1);
  v8 = v9;
  if (!v9)
    return 0;
  v11 = v7;
  do
  {
    v12 = *((_DWORD *)v8 + 8);
    v13 = v12 >= a4;
    if (v12 >= a4)
      v14 = (char **)v8;
    else
      v14 = (char **)(v8 + 8);
    if (v13)
      v11 = v8;
    v8 = *v14;
  }
  while (*v14);
  if (v11 == v7 || *((_DWORD *)v11 + 8) > a4)
    return 0;
  v16 = (OZChannelBase *)*((_QWORD *)v11 + 5);
  if (!v16)
  {
    v17 = 0;
    if (self)
      goto LABEL_17;
LABEL_19:
    v21 = 0;
    goto LABEL_20;
  }
  if (!self)
    goto LABEL_19;
LABEL_17:
  -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
LABEL_20:
  if (((*((uint64_t (**)(OZChannelBase *))v16->var0 + 64))(v16) & 1) == 0)
    *a3 |= 1u;
  if ((~LODWORD(v16->var7) & 0x410020) == 0)
    *a3 |= 2u;
  if (OZChannelBase::testFlag(v16, 4))
    *a3 |= 4u;
  if (OZChannelBase::testFlag(v16, 8))
    *a3 |= 0x10u;
  if (OZChannelBase::testFlag(v16, 0x10000) && (~LODWORD(v16->var7) & 0x410020) != 0)
    *a3 |= 0x200u;
  if (!OZChannelBase::testFlag(v16, 16))
    *a3 |= 0x20u;
  if (v17 && OZChannelFolder::testFoldFlag(v17, 4))
    *a3 |= 8u;
  end = self->_fullWidthCustomParams.__end_;
  v19 = wmemchr((__int32 *)self->_fullWidthCustomParams.__begin_, a4, end - self->_fullWidthCustomParams.__begin_);
  if (v19)
    v20 = (unsigned int *)v19;
  else
    v20 = end;
  if (v20 != self->_fullWidthCustomParams.__end_)
    *a3 |= 0x800u;
  ProCore_Impl::PCNSRefImpl::release(&v21);
  return 1;
}

- (BOOL)getStringParameterValue:(id *)a3 fromParm:(unsigned int)a4
{
  OZChannelBase *v6;
  PCString v8;
  id v9;

  v6 = -[OZFxPlugParameterHandler channelForParameterID:](self, "channelForParameterID:", *(_QWORD *)&a4);
  if (v6)
  {
    if (self)
      -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
    else
      v9 = 0;
    (*((void (**)(PCString *__return_ptr, OZChannelBase *))v6->var0 + 106))(&v8, v6);
    *a3 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", PCString::ns_str(&v8));
    PCString::~PCString(&v8);
    ProCore_Impl::PCNSRefImpl::release(&v9);
  }
  return v6 != 0;
}

- (BOOL)_getPathID:(void *)a3 fromParm:(unsigned int)a4 atTime:(id)a5
{
  OZChannelBase *v7;
  id v9;

  v7 = -[OZFxPlugParameterHandler channelForParameterID:](self, "channelForParameterID:", *(_QWORD *)&a4);
  if (v7)
  {
    if (self)
      -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
    else
      v9 = 0;
    *a3 = OZChanSceneNodeRef::getNode(v7);
    ProCore_Impl::PCNSRefImpl::release(&v9);
  }
  return v7 != 0;
}

- (void)abortAndWait
{
  _QWORD *v3;
  OZChannelBase *v4;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v3 = -[OZFxPlugParameterHandler getScene](self, "getScene");
    if (v3)
    {
      v4 = (OZChannelBase *)v3[188];
      if (v4)
        OZChannelBase::setRangeName(v4, (const PCString *)1);
    }
  }
}

- (BOOL)suppressUpdates
{
  int v3;
  unint64_t v4;

  v3 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v3)
  {
    v4 = self->_suppressChannelChangesStack.c.__size_.__value_ + self->_suppressChannelChangesStack.c.__start_ - 1;
    LOBYTE(v3) = (*(BOOL **)((char *)self->_suppressChannelChangesStack.c.__map_.__begin_
                           + ((v4 >> 9) & 0x7FFFFFFFFFFFF8)))[v4 & 0xFFF];
  }
  return v3;
}

- (BOOL)safeToSetParameters
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  const __CFString *v9;
  PCString v11;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v13;
  OZLocking *v14[2];

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
    && !-[OZFxPlugParameterHandler isRendering](self, "isRendering"))
  {
    return 1;
  }
  if (!self->_showedParameterSettingWarning)
  {
    cntrl = self->_fxPlugLock.__cntrl_;
    ptr = self->_fxPlugLock.__ptr_;
    v13 = cntrl;
    if (cntrl)
    {
      v4 = (unint64_t *)((char *)cntrl + 8);
      do
        v5 = __ldxr(v4);
      while (__stxr(v5 + 1, v4));
    }
    OZFxPlugLockSentinel::OZFxPlugLockSentinel(v14, (uint64_t)&ptr);
    v6 = (std::__shared_weak_count *)v13;
    if (v13)
    {
      v7 = (unint64_t *)((char *)v13 + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    if (*(_QWORD *)v14[0])
    {
      OZFxPlugSharedBase::getDisplayName(*(id **)v14[0], &v11);
      v9 = PCString::ns_str(&v11);
      PCString::~PCString(&v11);
    }
    else
    {
      v9 = CFSTR("Unknown");
    }
    NSLog(CFSTR("ERROR in Plugin: %@:\n %@"), v9, CFSTR("Setting parameter values from a non-main thread is not allowed.\nPlease do not attempt to set parameter values from within -renderOutput, or\nanother method that may be called on a non-main thread.\nSetting parameters should typically be done in response to -parameterChanged, or\nin response to interactions with a custom UI or onscreen control.\nFor more information, consult the FxPlug documentation"));
    self->_showedParameterSettingWarning = 1;
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v14);
  }
  return 0;
}

- (BOOL)_setFloatValue:(double)a3 toParm:(unsigned int)a4 atTime:(id)a5
{
  uint64_t v6;
  _BOOL4 v9;
  _QWORD *channelMap;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  unsigned int v15;
  BOOL v16;
  char **v17;
  OZChannelBase *v18;
  _QWORD *v19;
  void *v20;
  __int128 v22;
  uint64_t v23;
  PCSharedCount v24[2];
  uint64_t v25;
  id v26;

  v6 = *(_QWORD *)&a4;
  v9 = -[OZFxPlugParameterHandler safeToSetParameters](self, "safeToSetParameters");
  if (v9)
  {
    channelMap = self->_channelMap;
    v13 = (char *)channelMap[1];
    v11 = (char *)(channelMap + 1);
    v12 = v13;
    if (!v13)
      goto LABEL_13;
    v14 = v11;
    do
    {
      v15 = *((_DWORD *)v12 + 8);
      v16 = v15 >= v6;
      if (v15 >= v6)
        v17 = (char **)v12;
      else
        v17 = (char **)(v12 + 8);
      if (v16)
        v14 = v12;
      v12 = *v17;
    }
    while (*v17);
    if (v14 != v11 && *((_DWORD *)v14 + 8) <= v6)
    {
      v18 = (OZChannelBase *)*((_QWORD *)v14 + 5);
      v19 = -[OZFxPlugParameterHandler getScene](self, "getScene");
      if (v19 && !*(_BYTE *)(v19[198] + 101) && !OZChannelBase::testFlag(v18, 8))
      {
        PCSharedCount::PCSharedCount(v24);
        (*((void (**)(OZChannelBase *, PCSharedCount *))v18->var0 + 43))(v18, v24);
        PCString::~PCString((PCString *)v24);
      }
      -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v18, 0);
      if (self)
      {
        -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
        v24[0].var0 = 0;
        v24[1].var0 = 0;
        v25 = 0;
        -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a5.var1, 0);
      }
      else
      {
        v25 = 0;
        v26 = 0;
        v24[0].var0 = 0;
        v24[1].var0 = 0;
      }
      v22 = *(_OWORD *)&v24[0].var0;
      v23 = v25;
      v20 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v22, v18);
      (*((void (**)(OZChannelBase *, PCSharedCount *, BOOL, double))v18->var0 + 89))(v18, v24, -[OZFxPlugParameterHandler isRendering](self, "isRendering"), a3);
      -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v20);
      -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v18, 0);
      if (self->_startActionCalled)
        ++self->_numWriteActions;
      -[OZFxPlugParameterHandler _updateUIForParm:](self, "_updateUIForParm:", v6);
      ProCore_Impl::PCNSRefImpl::release(&v26);
      LOBYTE(v9) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)_setIntValue:(int)a3 toParm:(unsigned int)a4 atTime:(id)a5
{
  uint64_t v6;
  _BOOL4 v9;
  _QWORD *channelMap;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  unsigned int v15;
  BOOL v16;
  char **v17;
  OZChannelBase *v18;
  _QWORD *v19;
  void *v20;
  __int128 v22;
  uint64_t v23;
  PCSharedCount v24[2];
  uint64_t v25;
  id v26;

  v6 = *(_QWORD *)&a4;
  v9 = -[OZFxPlugParameterHandler safeToSetParameters](self, "safeToSetParameters");
  if (v9)
  {
    channelMap = self->_channelMap;
    v13 = (char *)channelMap[1];
    v11 = (char *)(channelMap + 1);
    v12 = v13;
    if (!v13)
      goto LABEL_13;
    v14 = v11;
    do
    {
      v15 = *((_DWORD *)v12 + 8);
      v16 = v15 >= v6;
      if (v15 >= v6)
        v17 = (char **)v12;
      else
        v17 = (char **)(v12 + 8);
      if (v16)
        v14 = v12;
      v12 = *v17;
    }
    while (*v17);
    if (v14 != v11 && *((_DWORD *)v14 + 8) <= v6)
    {
      v18 = (OZChannelBase *)*((_QWORD *)v14 + 5);
      v19 = -[OZFxPlugParameterHandler getScene](self, "getScene");
      if (v19 && !*(_BYTE *)(v19[198] + 101) && !OZChannelBase::testFlag(v18, 8))
      {
        PCSharedCount::PCSharedCount(v24);
        (*((void (**)(OZChannelBase *, PCSharedCount *))v18->var0 + 43))(v18, v24);
        PCString::~PCString((PCString *)v24);
      }
      -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v18, 0);
      if (self)
      {
        -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
        v24[0].var0 = 0;
        v24[1].var0 = 0;
        v25 = 0;
        -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a5.var1, 0);
      }
      else
      {
        v25 = 0;
        v26 = 0;
        v24[0].var0 = 0;
        v24[1].var0 = 0;
      }
      v22 = *(_OWORD *)&v24[0].var0;
      v23 = v25;
      v20 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v22, v18);
      (*((void (**)(OZChannelBase *, PCSharedCount *, BOOL, double))v18->var0 + 89))(v18, v24, -[OZFxPlugParameterHandler isRendering](self, "isRendering"), (double)a3);
      -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v20);
      -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v18, 0);
      if (self->_startActionCalled)
        ++self->_numWriteActions;
      -[OZFxPlugParameterHandler _updateUIForParm:](self, "_updateUIForParm:", v6);
      ProCore_Impl::PCNSRefImpl::release(&v26);
      LOBYTE(v9) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)_setBoolValue:(BOOL)a3 toParm:(unsigned int)a4 atTime:(id)a5
{
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v9;
  _QWORD *channelMap;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  unsigned int v15;
  BOOL v16;
  char **v17;
  OZChannelBase *v18;
  _QWORD *v19;
  void *v20;
  __int128 v22;
  uint64_t v23;
  PCSharedCount v24[2];
  uint64_t v25;
  id v26;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v9 = -[OZFxPlugParameterHandler safeToSetParameters](self, "safeToSetParameters");
  if (v9)
  {
    channelMap = self->_channelMap;
    v13 = (char *)channelMap[1];
    v11 = (char *)(channelMap + 1);
    v12 = v13;
    if (!v13)
      goto LABEL_13;
    v14 = v11;
    do
    {
      v15 = *((_DWORD *)v12 + 8);
      v16 = v15 >= v6;
      if (v15 >= v6)
        v17 = (char **)v12;
      else
        v17 = (char **)(v12 + 8);
      if (v16)
        v14 = v12;
      v12 = *v17;
    }
    while (*v17);
    if (v14 != v11 && *((_DWORD *)v14 + 8) <= v6)
    {
      v18 = (OZChannelBase *)*((_QWORD *)v14 + 5);
      v19 = -[OZFxPlugParameterHandler getScene](self, "getScene");
      if (v19 && !*(_BYTE *)(v19[198] + 101) && !OZChannelBase::testFlag(v18, 8))
      {
        PCSharedCount::PCSharedCount(v24);
        (*((void (**)(OZChannelBase *, PCSharedCount *))v18->var0 + 43))(v18, v24);
        PCString::~PCString((PCString *)v24);
      }
      -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v18, 0);
      if (self)
      {
        -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
        v24[0].var0 = 0;
        v24[1].var0 = 0;
        v25 = 0;
        -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a5.var1, 0);
      }
      else
      {
        v25 = 0;
        v26 = 0;
        v24[0].var0 = 0;
        v24[1].var0 = 0;
      }
      v22 = *(_OWORD *)&v24[0].var0;
      v23 = v25;
      v20 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v22, v18);
      (*((void (**)(OZChannelBase *, PCSharedCount *, BOOL, double))v18->var0 + 89))(v18, v24, -[OZFxPlugParameterHandler isRendering](self, "isRendering"), (double)v7);
      -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v20);
      -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v18, 0);
      if (self->_startActionCalled)
        ++self->_numWriteActions;
      -[OZFxPlugParameterHandler _updateUIForParm:](self, "_updateUIForParm:", v6);
      ProCore_Impl::PCNSRefImpl::release(&v26);
      LOBYTE(v9) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)_setRedValue:(double)a3 greenValue:(double)a4 blueValue:(double)a5 toParm:(unsigned int)a6 atTime:(id)a7
{
  uint64_t v8;
  _BOOL4 v13;
  _QWORD *channelMap;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  unsigned int v19;
  BOOL v20;
  char **v21;
  OZChannelBase *v22;
  _QWORD *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  __int128 v30;
  uint64_t v31;
  PCColor v32;
  __int128 v33;
  uint64_t v34;
  id v35;

  v8 = *(_QWORD *)&a6;
  v13 = -[OZFxPlugParameterHandler safeToSetParameters](self, "safeToSetParameters");
  if (v13)
  {
    channelMap = self->_channelMap;
    v17 = (char *)channelMap[1];
    v15 = (char *)(channelMap + 1);
    v16 = v17;
    if (!v17)
      goto LABEL_13;
    v18 = v15;
    do
    {
      v19 = *((_DWORD *)v16 + 8);
      v20 = v19 >= v8;
      if (v19 >= v8)
        v21 = (char **)v16;
      else
        v21 = (char **)(v16 + 8);
      if (v20)
        v18 = v16;
      v16 = *v21;
    }
    while (*v21);
    if (v18 != v15 && *((_DWORD *)v18 + 8) <= v8)
    {
      v22 = (OZChannelBase *)*((_QWORD *)v18 + 5);
      v23 = -[OZFxPlugParameterHandler getScene](self, "getScene");
      if (v23 && !*(_BYTE *)(v23[198] + 101) && !OZChannelBase::testFlag(v22, 8))
      {
        PCSharedCount::PCSharedCount((PCSharedCount *)&v32);
        (*((void (**)(OZChannelBase *, PCColor *))v22->var0 + 43))(v22, &v32);
        PCString::~PCString((PCString *)&v32);
      }
      if (self)
      {
        -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
        v33 = 0uLL;
        v34 = 0;
        -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a7.var1, 0);
      }
      else
      {
        v35 = 0;
        v33 = 0uLL;
        v34 = 0;
      }
      PCColor::PCColor(&v32);
      *(float *)&v24 = a3;
      *(float *)&v25 = a4;
      *(float *)&v26 = a5;
      LODWORD(v27) = 1.0;
      -[OZFxPlugParameterHandler setColorFromFxPlugColorSpace:red:green:blue:alpha:](self, "setColorFromFxPlugColorSpace:red:green:blue:alpha:", &v32, v24, v25, v26, v27);
      v30 = v33;
      v31 = v34;
      v28 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v30, v22);
      -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v22, 0);
      (*((void (**)(OZChannelBase *, __int128 *, PCColor *, BOOL))v22->var0 + 105))(v22, &v33, &v32, -[OZFxPlugParameterHandler isRendering](self, "isRendering"));
      -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v22, 0);
      -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v28);
      if (self->_startActionCalled)
        ++self->_numWriteActions;
      -[OZFxPlugParameterHandler _updateUIForParm:](self, "_updateUIForParm:", v8);
      PCCFRef<CGColorSpace *>::~PCCFRef(&v32.var1._obj);
      ProCore_Impl::PCNSRefImpl::release(&v35);
      LOBYTE(v13) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v13) = 0;
    }
  }
  return v13;
}

- (BOOL)setRedValue:(double)a3 GreenValue:(double)a4 BlueValue:(double)a5 toParm:(unsigned int)a6 atTime:(double)a7
{
  return -[OZFxPlugParameterHandler _setRedValue:greenValue:blueValue:toParm:atTime:](self, "_setRedValue:greenValue:blueValue:toParm:atTime:", *(_QWORD *)&a6, *(_QWORD *)&a7, a3, a4, a5);
}

- (BOOL)_setRedValue:(double)a3 greenValue:(double)a4 blueValue:(double)a5 alphaValue:(double)a6 toParm:(unsigned int)a7 atTime:(id)a8
{
  uint64_t v9;
  _BOOL4 v15;
  _QWORD *channelMap;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  unsigned int v21;
  BOOL v22;
  char **v23;
  OZChannelBase *v24;
  _QWORD *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  __int128 v32;
  uint64_t v33;
  PCColor v34;
  __int128 v35;
  uint64_t v36;
  id v37;

  v9 = *(_QWORD *)&a7;
  v15 = -[OZFxPlugParameterHandler safeToSetParameters](self, "safeToSetParameters");
  if (v15)
  {
    channelMap = self->_channelMap;
    v19 = (char *)channelMap[1];
    v17 = (char *)(channelMap + 1);
    v18 = v19;
    if (!v19)
      goto LABEL_13;
    v20 = v17;
    do
    {
      v21 = *((_DWORD *)v18 + 8);
      v22 = v21 >= v9;
      if (v21 >= v9)
        v23 = (char **)v18;
      else
        v23 = (char **)(v18 + 8);
      if (v22)
        v20 = v18;
      v18 = *v23;
    }
    while (*v23);
    if (v20 != v17 && *((_DWORD *)v20 + 8) <= v9)
    {
      v24 = (OZChannelBase *)*((_QWORD *)v20 + 5);
      v25 = -[OZFxPlugParameterHandler getScene](self, "getScene");
      if (v25 && !*(_BYTE *)(v25[198] + 101) && !OZChannelBase::testFlag(v24, 8))
      {
        PCSharedCount::PCSharedCount((PCSharedCount *)&v34);
        (*((void (**)(OZChannelBase *, PCColor *))v24->var0 + 43))(v24, &v34);
        PCString::~PCString((PCString *)&v34);
      }
      if (self)
      {
        -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
        v35 = 0uLL;
        v36 = 0;
        -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a8.var1, 0);
      }
      else
      {
        v37 = 0;
        v35 = 0uLL;
        v36 = 0;
      }
      PCColor::PCColor(&v34);
      *(float *)&v26 = a3;
      *(float *)&v27 = a4;
      *(float *)&v28 = a5;
      *(float *)&v29 = a6;
      -[OZFxPlugParameterHandler setColorFromFxPlugColorSpace:red:green:blue:alpha:](self, "setColorFromFxPlugColorSpace:red:green:blue:alpha:", &v34, v26, v27, v28, v29);
      v32 = v35;
      v33 = v36;
      v30 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v32, v24);
      -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v24, 0);
      (*((void (**)(OZChannelBase *, __int128 *, PCColor *, BOOL))v24->var0 + 105))(v24, &v35, &v34, -[OZFxPlugParameterHandler isRendering](self, "isRendering"));
      -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v24, 0);
      -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v30);
      if (self->_startActionCalled)
        ++self->_numWriteActions;
      -[OZFxPlugParameterHandler _updateUIForParm:](self, "_updateUIForParm:", v9);
      PCCFRef<CGColorSpace *>::~PCCFRef(&v34.var1._obj);
      ProCore_Impl::PCNSRefImpl::release(&v37);
      LOBYTE(v15) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v15) = 0;
    }
  }
  return v15;
}

- (BOOL)setRedValue:(double)a3 GreenValue:(double)a4 BlueValue:(double)a5 AlphaValue:(double)a6 toParm:(unsigned int)a7 atTime:(double)a8
{
  return -[OZFxPlugParameterHandler _setRedValue:greenValue:blueValue:alphaValue:toParm:atTime:](self, "_setRedValue:greenValue:blueValue:alphaValue:toParm:atTime:", *(_QWORD *)&a7, *(_QWORD *)&a8, a3, a4, a5, a6);
}

- (BOOL)_setXValue:(double)a3 YValue:(double)a4 toParm:(unsigned int)a5 atTime:(id)a6
{
  uint64_t v7;
  _QWORD *channelMap;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  unsigned int v16;
  char **v18;
  OZChannelBase *v19;
  __shared_weak_count *cntrl;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  const void *v26;
  unsigned __int8 v27;
  void *v28;
  _QWORD *v29;
  _QWORD *v30;
  const void *v31;
  OZScene *v36;
  CGColorSpace *WorkingColorSpace;
  void *v38;
  char v39;
  _QWORD *v40;
  FxColorDescription v42[12];
  uint64_t v43;
  uint64_t v44;
  float64x2_t v45[2];
  CMTime v46;
  CMTime v47;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v49;
  OZLocking *v50[2];
  id v51;

  v7 = *(_QWORD *)&a5;
  if (!-[OZFxPlugParameterHandler safeToSetParameters](self, "safeToSetParameters"))
    goto LABEL_45;
  channelMap = self->_channelMap;
  v14 = (char *)channelMap[1];
  v12 = (char *)(channelMap + 1);
  v13 = v14;
  if (!v14)
    goto LABEL_45;
  v15 = v12;
  do
  {
    v16 = *((_DWORD *)v13 + 8);
    _CF = v16 >= v7;
    if (v16 >= v7)
      v18 = (char **)v13;
    else
      v18 = (char **)(v13 + 8);
    if (_CF)
      v15 = v13;
    v13 = *v18;
  }
  while (*v18);
  if (v15 == v12 || *((_DWORD *)v15 + 8) > v7)
    goto LABEL_45;
  v19 = (OZChannelBase *)*((_QWORD *)v15 + 5);
  if (self)
    -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
  else
    v51 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v49 = cntrl;
  if (cntrl)
  {
    v21 = (unint64_t *)((char *)cntrl + 8);
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v50, (uint64_t)&ptr);
  v23 = (std::__shared_weak_count *)v49;
  if (v49)
  {
    v24 = (unint64_t *)((char *)v49 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v26 = *(const void **)v50[0];
  if (!*(_QWORD *)v50[0] || (v27 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v27 & 1) != 0))
  {
    v39 = 0;
    LOBYTE(v31) = 1;
  }
  else
  {
    memset(&v47, 0, sizeof(v47));
    -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a6.var1, 0);
    v46 = v47;
    v28 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v46, v19);
    if (v29)
    {
      v30 = v29;
      v31 = (const void *)v29[3];
      if (v31)
      {
        v45[0] = 0uLL;
        __asm { FMOV            V0.2D, #-1.0 }
        v45[1] = _Q0;
        OZRenderParams::OZRenderParams((OZRenderParams *)v42);
        v42[0]._pcColorDesc = (PCColorDescription)v47;
        v43 = 0;
        v44 = 0;
        v36 = (OZScene *)(*(uint64_t (**)(_QWORD *))(*v30 + 296))(v30);
        WorkingColorSpace = (CGColorSpace *)OZScene::getWorkingColorSpace(v36);
        OZRenderParams::setWorkingColorSpace(v42, WorkingColorSpace);
        if (v38 && (*(unsigned int (**)(void *, FxColorDescription *))(*(_QWORD *)v38 + 2216))(v38, v42))
          OZScene::getSceneBounds((uint64_t)v36, v45);
        else
          (*(void (**)(const void *, float64x2_t *, FxColorDescription *))(*(_QWORD *)v31 + 80))(v31, v45, v42);
        OZRenderParams::~OZRenderParams((OZRenderParams *)v42);
        LOBYTE(v31) = 1;
      }
    }
    else
    {
      LOBYTE(v31) = 0;
    }
    if (-[OZFxPlugParameterHandler shouldFlipPoints](self, "shouldFlipPoints"))
      a4 = 1.0 - a4;
    v40 = -[OZFxPlugParameterHandler getScene](self, "getScene");
    if (v40 && !*(_BYTE *)(v40[198] + 101) && !OZChannelBase::testFlag(v19, 8))
    {
      PCSharedCount::PCSharedCount((PCSharedCount *)v42);
      (*((void (**)(OZChannelBase *, FxColorDescription *))v19->var0 + 43))(v19, v42);
      PCString::~PCString((PCString *)v42);
    }
    -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v19, 0);
    OZChannel2D::setValue((OZChannel2D *)v19, &v47, a3, a4, -[OZFxPlugParameterHandler isRendering](self, "isRendering"));
    -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v19, 0);
    -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v28);
    if (self->_startActionCalled)
      ++self->_numWriteActions;
    -[OZFxPlugParameterHandler _updateUIForParm:](self, "_updateUIForParm:", v7);
    v39 = 1;
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v50);
  ProCore_Impl::PCNSRefImpl::release(&v51);
  if ((v39 & 1) == 0)
LABEL_45:
    LOBYTE(v31) = 0;
  return (char)v31;
}

- (void)onVTBUserInteractionEventNotification:(id)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v28;
  OZLocking *v29[2];

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v28 = cntrl;
  if (cntrl)
  {
    v5 = (unint64_t *)((char *)cntrl + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v29, (uint64_t)&ptr);
  v7 = (std::__shared_weak_count *)v28;
  if (v28)
  {
    v8 = (unint64_t *)((char *)v28 + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (*(_QWORD *)v29[0])
  {
    v10 = *(void **)(*(_QWORD *)v29[0] + 24);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(a3, "userInfo", ptr);
      objc_msgSend((id)objc_msgSend(v11, "objectForKey:", CFSTR("X")), "doubleValue");
      v13 = v12;
      objc_msgSend((id)objc_msgSend(v11, "objectForKey:", CFSTR("Y")), "doubleValue");
      v15 = v14;
      objc_msgSend((id)objc_msgSend(v11, "objectForKey:", CFSTR("VelocityX")), "doubleValue");
      v17 = v16;
      objc_msgSend((id)objc_msgSend(v11, "objectForKey:", CFSTR("VelocityY")), "doubleValue");
      v19 = v18;
      objc_msgSend((id)objc_msgSend(v11, "objectForKey:", CFSTR("Scale")), "doubleValue");
      v21 = v20;
      objc_msgSend((id)objc_msgSend(v11, "objectForKey:", CFSTR("ScaleVelocity")), "doubleValue");
      v23 = v22;
      objc_msgSend((id)objc_msgSend(v11, "objectForKey:", CFSTR("Rotation")), "doubleValue");
      v25 = v24;
      objc_msgSend((id)objc_msgSend(v11, "objectForKey:", CFSTR("RotationVelocity")), "doubleValue");
      objc_msgSend(v10, "handleUIEventWithPosition:velocity:scale:scaleVelocity:rotation:rotationVelocity:", v13, 1.0 - v15, v17, -v19, v21, v23, v25, v26);
    }
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v29);
}

- (BOOL)setCustomParameterValue:(id)a3 toParm:(unsigned int)a4
{
  uint64_t v4;
  _BOOL4 v7;
  _QWORD *channelMap;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  unsigned int v13;
  BOOL v14;
  char **v15;
  OZChannelBase *v16;
  _QWORD *v17;
  __shared_weak_count *cntrl;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  char v28;
  int v29;
  char v30;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v33;
  PCSharedCount v34;
  id v35;

  v4 = *(_QWORD *)&a4;
  v7 = -[OZFxPlugParameterHandler safeToSetParameters](self, "safeToSetParameters");
  if (!v7)
    return v7;
  channelMap = self->_channelMap;
  v11 = (char *)channelMap[1];
  v9 = (char *)(channelMap + 1);
  v10 = v11;
  if (!v11)
    goto LABEL_41;
  v12 = v9;
  do
  {
    v13 = *((_DWORD *)v10 + 8);
    v14 = v13 >= v4;
    if (v13 >= v4)
      v15 = (char **)v10;
    else
      v15 = (char **)(v10 + 8);
    if (v14)
      v12 = v10;
    v10 = *v15;
  }
  while (*v15);
  if (v12 == v9 || *((_DWORD *)v12 + 8) > v4)
    goto LABEL_41;
  v16 = (OZChannelBase *)*((_QWORD *)v12 + 5);
  v17 = -[OZFxPlugParameterHandler getScene](self, "getScene");
  if (v17 && !*(_BYTE *)(v17[198] + 101) && !OZChannelBase::testFlag(v16, 8))
  {
    PCSharedCount::PCSharedCount(&v34);
    (*((void (**)(OZChannelBase *, PCSharedCount *))v16->var0 + 43))(v16, &v34);
    PCString::~PCString((PCString *)&v34);
  }
  -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v16, 0);
  if (self)
    -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
  else
    v35 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v33 = cntrl;
  if (cntrl)
  {
    v19 = (unint64_t *)((char *)cntrl + 8);
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v34, (uint64_t)&ptr);
  v21 = (std::__shared_weak_count *)v33;
  if (v33)
  {
    v22 = (unint64_t *)((char *)v33 + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = *(_QWORD *)v34.var0;
  if (!*(_QWORD *)v34.var0 || (v25 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v25 & 1) != 0))
  {
    -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v16, 0);
    v30 = 0;
    v29 = 1;
    goto LABEL_40;
  }
  if (a3 && !*(_BYTE *)(v24 + 216))
  {
    v26 = *(void **)(v24 + 24);
    if (!v26)
    {
      v29 = 0;
      goto LABEL_36;
    }
    if ((objc_msgSend(v26, "useLegacyCoding") & 1) == 0)
    {
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
      objc_msgSend(v27, "encodeObject:forKey:", a3, CFSTR("Custom Data"));
      a3 = (id)objc_msgSend(v27, "encodedData");

    }
  }
  v28 = -[OZFxPlugParameterHandler isRendering](self, "isRendering");
  v29 = 1;
  OZChannelBlindData::setPluginDataPtr((OZChannelBlindData *)v16, MEMORY[0x1E0CA2E68], a3, v28, 1, 1);
LABEL_36:
  -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v16, 0);
  if (self->_startActionCalled)
    ++self->_numWriteActions;
  -[OZFxPlugParameterHandler _updateUIForParm:](self, "_updateUIForParm:", v4);
  v30 = 1;
LABEL_40:
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v34);
  ProCore_Impl::PCNSRefImpl::release(&v35);
  LOBYTE(v7) = v29 != 0;
  if ((v30 & 1) == 0)
LABEL_41:
    LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)_setCustomParameterValue:(id)a3 toParm:(unsigned int)a4 atTime:(id)a5
{
  uint64_t v6;
  _BOOL4 v9;
  _QWORD *channelMap;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  unsigned int v15;
  BOOL v16;
  char **v17;
  OZChannelBlindData *v18;
  __shared_weak_count *cntrl;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  char v31;
  CMTime v33;
  CMTime v34;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v36;
  OZLocking *v37[2];
  id v38;

  v6 = *(_QWORD *)&a4;
  v9 = -[OZFxPlugParameterHandler safeToSetParameters](self, "safeToSetParameters");
  if (!v9)
    return v9;
  channelMap = self->_channelMap;
  v13 = (char *)channelMap[1];
  v11 = (char *)(channelMap + 1);
  v12 = v13;
  if (!v13)
    goto LABEL_37;
  v14 = v11;
  do
  {
    v15 = *((_DWORD *)v12 + 8);
    v16 = v15 >= v6;
    if (v15 >= v6)
      v17 = (char **)v12;
    else
      v17 = (char **)(v12 + 8);
    if (v16)
      v14 = v12;
    v12 = *v17;
  }
  while (*v17);
  if (v14 == v11 || *((_DWORD *)v14 + 8) > v6)
    goto LABEL_37;
  v18 = (OZChannelBlindData *)*((_QWORD *)v14 + 5);
  if (self)
    -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
  else
    v38 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v36 = cntrl;
  if (cntrl)
  {
    v20 = (unint64_t *)((char *)cntrl + 8);
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v37, (uint64_t)&ptr);
  v22 = (std::__shared_weak_count *)v36;
  if (v36)
  {
    v23 = (unint64_t *)((char *)v36 + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v25 = *(_QWORD *)v37[0];
  if (!*(_QWORD *)v37[0] || (v26 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v26 & 1) != 0))
  {
    v31 = 0;
    v30 = 1;
    goto LABEL_36;
  }
  memset(&v34, 0, sizeof(v34));
  -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a5.var1, 0);
  v33 = v34;
  v27 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v33, v18);
  -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v18, 0);
  if (a3 && !*(_BYTE *)(v25 + 216))
  {
    v28 = *(void **)(v25 + 24);
    if (!v28)
    {
      v30 = 0;
      goto LABEL_32;
    }
    if ((objc_msgSend(v28, "useLegacyCoding") & 1) == 0)
    {
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
      objc_msgSend(v29, "encodeObject:forKey:", a3, CFSTR("Custom Data"));
      a3 = (id)objc_msgSend(v29, "encodedData");

    }
  }
  v30 = 1;
  OZChannelBlindData::setPluginDataPtr(v18, &v34, a3, -[OZFxPlugParameterHandler isRendering](self, "isRendering"), 1, 1);
LABEL_32:
  -[OZFxPlugParameterHandler _updateUIForParm:](self, "_updateUIForParm:", v6);
  -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v18, 0);
  if (self->_startActionCalled)
    ++self->_numWriteActions;
  -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v27);
  v31 = 1;
LABEL_36:
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v37);
  ProCore_Impl::PCNSRefImpl::release(&v38);
  LOBYTE(v9) = v30 != 0;
  if ((v31 & 1) == 0)
LABEL_37:
    LOBYTE(v9) = 0;
  return v9;
}

- (BOOL)_setHistogramBlackIn:(double)a3 BlackOut:(double)a4 WhiteIn:(double)a5 WhiteOut:(double)a6 Gamma:(double)a7 forChannel:(unint64_t)a8 fromParm:(unsigned int)a9 atTime:(id)a10
{
  uint64_t v11;
  _BOOL4 v19;
  _QWORD *channelMap;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  unsigned int v25;
  BOOL v26;
  char **v27;
  OZChannelBase *v28;
  _QWORD *v29;
  void *v30;
  unint64_t *p_var7;
  _BOOL8 v32;
  __int128 v34;
  uint64_t v35;
  PCSharedCount v36[2];
  uint64_t v37;
  id v38;

  v11 = *(_QWORD *)&a9;
  v19 = -[OZFxPlugParameterHandler safeToSetParameters](self, "safeToSetParameters");
  if (v19)
  {
    channelMap = self->_channelMap;
    v23 = (char *)channelMap[1];
    v21 = (char *)(channelMap + 1);
    v22 = v23;
    if (!v23)
      goto LABEL_13;
    v24 = v21;
    do
    {
      v25 = *((_DWORD *)v22 + 8);
      v26 = v25 >= v11;
      if (v25 >= v11)
        v27 = (char **)v22;
      else
        v27 = (char **)(v22 + 8);
      if (v26)
        v24 = v22;
      v22 = *v27;
    }
    while (*v27);
    if (v24 != v21 && *((_DWORD *)v24 + 8) <= v11)
    {
      v28 = (OZChannelBase *)*((_QWORD *)v24 + 5);
      v29 = -[OZFxPlugParameterHandler getScene](self, "getScene");
      if (v29 && !*(_BYTE *)(v29[198] + 101) && !OZChannelBase::testFlag(v28, 8))
      {
        PCSharedCount::PCSharedCount(v36);
        (*((void (**)(OZChannelBase *, PCSharedCount *))v28->var0 + 43))(v28, v36);
        PCString::~PCString((PCString *)v36);
      }
      -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v28, 0);
      if (self)
      {
        -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
        v36[0].var0 = 0;
        v36[1].var0 = 0;
        v37 = 0;
        -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a10.var1, 0);
      }
      else
      {
        v37 = 0;
        v38 = 0;
        v36[0].var0 = 0;
        v36[1].var0 = 0;
      }
      v34 = *(_OWORD *)&v36[0].var0;
      v35 = v37;
      v30 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v34, v28);
      switch(a8)
      {
        case 1uLL:
          p_var7 = &v28[11].var7;
          break;
        case 2uLL:
          p_var7 = &v28[19].var7;
          break;
        case 3uLL:
          p_var7 = &v28[27].var7;
          break;
        case 4uLL:
          p_var7 = &v28[35].var7;
          break;
        default:
          p_var7 = &v28[3].var7;
          break;
      }
      v32 = -[OZFxPlugParameterHandler isRendering](self, "isRendering");
      (*(void (**)(unint64_t *, PCSharedCount *, _BOOL8, double))(p_var7[17] + 712))(p_var7 + 17, v36, v32, a3);
      (*(void (**)(unint64_t *, PCSharedCount *, _BOOL8, double))(p_var7[36] + 712))(p_var7 + 36, v36, v32, a4);
      (*(void (**)(unint64_t *, PCSharedCount *, _BOOL8, double))(p_var7[55] + 712))(p_var7 + 55, v36, v32, a5);
      (*(void (**)(unint64_t *, PCSharedCount *, _BOOL8, double))(p_var7[74] + 712))(p_var7 + 74, v36, v32, a6);
      (*(void (**)(unint64_t *, PCSharedCount *, _BOOL8, double))(p_var7[93] + 712))(p_var7 + 93, v36, v32, a7);
      -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v30);
      -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v28, 0);
      if (self->_startActionCalled)
        ++self->_numWriteActions;
      -[OZFxPlugParameterHandler _updateUIForParm:](self, "_updateUIForParm:", v11);
      ProCore_Impl::PCNSRefImpl::release(&v38);
      LOBYTE(v19) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v19) = 0;
    }
  }
  return v19;
}

- (BOOL)setHistogramBlackIn:(double)a3 BlackOut:(double)a4 WhiteIn:(double)a5 WhiteOut:(double)a6 Gamma:(double)a7 forChannel:(unint64_t)a8 fromParm:(unsigned int)a9 atTime:(double)a10
{
  return -[OZFxPlugParameterHandler _setHistogramBlackIn:BlackOut:WhiteIn:WhiteOut:Gamma:forChannel:fromParm:atTime:](self, "_setHistogramBlackIn:BlackOut:WhiteIn:WhiteOut:Gamma:forChannel:fromParm:atTime:", a8, *(_QWORD *)&a9, *(_QWORD *)&a10, a3, a4, a5, a6, a7);
}

- (BOOL)setLevelsBlack:(double)a3 White:(double)a4 Gamma:(double)a5 forParm:(unsigned int)a6 atTime:(id)a7
{
  uint64_t v8;
  _BOOL4 v13;
  _QWORD *channelMap;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  unsigned int v19;
  BOOL v20;
  char **v21;
  OZChannelBase *v22;
  _QWORD *v23;
  void *v24;
  CMTime v26;
  CMTime v27;
  id v28;

  v8 = *(_QWORD *)&a6;
  v13 = -[OZFxPlugParameterHandler safeToSetParameters](self, "safeToSetParameters");
  if (v13)
  {
    channelMap = self->_channelMap;
    v17 = (char *)channelMap[1];
    v15 = (char *)(channelMap + 1);
    v16 = v17;
    if (!v17)
      goto LABEL_13;
    v18 = v15;
    do
    {
      v19 = *((_DWORD *)v16 + 8);
      v20 = v19 >= v8;
      if (v19 >= v8)
        v21 = (char **)v16;
      else
        v21 = (char **)(v16 + 8);
      if (v20)
        v18 = v16;
      v16 = *v21;
    }
    while (*v21);
    if (v18 != v15 && *((_DWORD *)v18 + 8) <= v8)
    {
      v22 = (OZChannelBase *)*((_QWORD *)v18 + 5);
      v23 = -[OZFxPlugParameterHandler getScene](self, "getScene");
      if (v23 && !*(_BYTE *)(v23[198] + 101) && !OZChannelBase::testFlag(v22, 8))
      {
        PCSharedCount::PCSharedCount((PCSharedCount *)&v27);
        (*((void (**)(OZChannelBase *, CMTime *))v22->var0 + 43))(v22, &v27);
        PCString::~PCString((PCString *)&v27);
      }
      if (self)
      {
        -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
        memset(&v27, 0, sizeof(v27));
        -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a7.var1, 0);
      }
      else
      {
        v28 = 0;
        memset(&v27, 0, sizeof(v27));
      }
      v26 = v27;
      v24 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v26, v22);
      -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v22, 0);
      OZChannelLevels::setBlackValue((OZChannelLevels *)v22, &v27, a3, 0);
      OZChannelLevels::setWhiteValue((OZChannelLevels *)v22, &v27, a4, 0);
      OZChannelLevels::setGammaValue((OZChannelLevels *)v22, &v27, a5, 0);
      -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v22, 0);
      -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v24);
      if (self->_startActionCalled)
        ++self->_numWriteActions;
      -[OZFxPlugParameterHandler _updateUIForParm:](self, "_updateUIForParm:", v8);
      ProCore_Impl::PCNSRefImpl::release(&v28);
      LOBYTE(v13) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v13) = 0;
    }
  }
  return v13;
}

- (BOOL)addFlags:(unsigned int)a3 toParm:(unsigned int)a4
{
  return 1;
}

- (BOOL)removeFlags:(unsigned int)a3 fromParm:(unsigned int)a4
{
  return 1;
}

- (BOOL)setParameterFlags:(unsigned int)a3 toParm:(unsigned int)a4
{
  uint64_t v4;
  _BOOL4 v7;
  _QWORD *channelMap;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  unsigned int v13;
  BOOL v14;
  char **v15;
  OZChannelBase *v16;
  OZChannelFolder *v17;
  unint64_t var7;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  OZFxPlugParameterHandlerUIUpdate *v25;
  id v27;

  v4 = *(_QWORD *)&a4;
  v7 = -[OZFxPlugParameterHandler safeToSetParameters](self, "safeToSetParameters");
  if (v7)
  {
    channelMap = self->_channelMap;
    v11 = (char *)channelMap[1];
    v9 = (char *)(channelMap + 1);
    v10 = v11;
    if (!v11)
      goto LABEL_13;
    v12 = v9;
    do
    {
      v13 = *((_DWORD *)v10 + 8);
      v14 = v13 >= v4;
      if (v13 >= v4)
        v15 = (char **)v10;
      else
        v15 = (char **)(v10 + 8);
      if (v14)
        v12 = v10;
      v10 = *v15;
    }
    while (*v15);
    if (v12 != v9 && *((_DWORD *)v12 + 8) <= v4)
    {
      v16 = (OZChannelBase *)*((_QWORD *)v12 + 5);
      if (v16)
      else
        v17 = 0;
      -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v16, 1);
      if (self)
        -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
      else
        v27 = 0;
      if (!(a3 & 1) != (*((unsigned int (**)(OZChannelBase *))v16->var0 + 64))(v16))
        (*((void (**)(OZChannelBase *, BOOL, _QWORD))v16->var0 + 63))(v16, (a3 & 1) == 0, 0);
      var7 = v16->var7;
      v19 = 4259872;
      if ((a3 & 2) == 0)
        v19 = 0;
      v20 = v19 | a3 & 4 | (a3 >> 1) & 8;
      if ((a3 & 0x20) != 0)
        v21 = v20;
      else
        v21 = v20 | 0x10;
      v22 = var7 ^ v21;
      if (((var7 ^ v21) & 0x410030) != 0)
        v23 = 12;
      else
        v23 = 0;
      if (v21 != (var7 & 0x41003C))
      {
        OZChannelBase::setFlag(v16, v21 | 0x100000000, 1);
        OZChannelBase::resetFlag(v16, ~(_DWORD)v21 & 0x41003C, 1);
      }
      if ((a3 & 8) != 0 && v17 && !OZChannelFolder::testFoldFlag(v17, 4))
        OZChannelFolder::setFoldFlag(v17, 4);
      -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v16, 1);
      v24 = v23 & 0xFFFF7FFF | (((v22 >> 2) & 1) << 15);
      if (self->_startActionCalled)
        ++self->_numWriteActions;
      v25 = +[OZFxPlugParameterHandlerUIUpdate updateWithParamID:notificationFlags:](OZFxPlugParameterHandlerUIUpdate, "updateWithParamID:notificationFlags:", v4, v24);
      if (-[OZFxPlugParameterHandler isRendering](self, "isRendering"))
        -[OZFxPlugParameterHandler performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__updateUI_, v25, 0);
      ProCore_Impl::PCNSRefImpl::release(&v27);
      LOBYTE(v7) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (BOOL)setStringParameterValue:(id)a3 toParm:(unsigned int)a4
{
  uint64_t v4;
  _BOOL4 v7;
  _QWORD *channelMap;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  unsigned int v13;
  BOOL v14;
  char **v15;
  OZChannelBase *v16;
  _QWORD *v17;
  PCString v19;
  PCSharedCount v20;

  v4 = *(_QWORD *)&a4;
  v7 = -[OZFxPlugParameterHandler safeToSetParameters](self, "safeToSetParameters");
  if (v7)
  {
    channelMap = self->_channelMap;
    v11 = (char *)channelMap[1];
    v9 = (char *)(channelMap + 1);
    v10 = v11;
    if (!v11)
      goto LABEL_13;
    v12 = v9;
    do
    {
      v13 = *((_DWORD *)v10 + 8);
      v14 = v13 >= v4;
      if (v13 >= v4)
        v15 = (char **)v10;
      else
        v15 = (char **)(v10 + 8);
      if (v14)
        v12 = v10;
      v10 = *v15;
    }
    while (*v15);
    if (v12 != v9 && *((_DWORD *)v12 + 8) <= v4)
    {
      v16 = (OZChannelBase *)*((_QWORD *)v12 + 5);
      v17 = -[OZFxPlugParameterHandler getScene](self, "getScene");
      if (v17 && !*(_BYTE *)(v17[198] + 101) && !OZChannelBase::testFlag(v16, 8))
      {
        PCSharedCount::PCSharedCount(&v20);
        (*((void (**)(OZChannelBase *, PCSharedCount *))v16->var0 + 43))(v16, &v20);
        PCString::~PCString((PCString *)&v20);
      }
      -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v16, 0);
      if (self)
        -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
      else
        v20.var0 = 0;
      PCURL::PCURL((PCURL *)&v19, a3);
      (*((void (**)(OZChannelBase *, PCString *, BOOL, _QWORD))v16->var0 + 108))(v16, &v19, -[OZFxPlugParameterHandler isRendering](self, "isRendering"), 0);
      PCString::~PCString(&v19);
      -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v16, 0);
      if (self->_startActionCalled)
        ++self->_numWriteActions;
      -[OZFxPlugParameterHandler _updateUIForParm:](self, "_updateUIForParm:", v4);
      ProCore_Impl::PCNSRefImpl::release((id *)&v20.var0);
      LOBYTE(v7) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (BOOL)setGradientStartEnd:(double)a3 startY:(double)a4 endX:(double)a5 endY:(double)a6 toParm:(unsigned int)a7 atTime:(id)a8
{
  _QWORD *channelMap;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v13;
  char *v19;
  unsigned int v20;
  BOOL v21;
  char **v22;
  uint64_t v24;
  void *v25;
  OZChannelPosition *v26;
  CMTime v27;
  CMTime v28;
  id v29;

  channelMap = self->_channelMap;
  v11 = (char *)channelMap[1];
  v9 = (char *)(channelMap + 1);
  v10 = v11;
  if (!v11)
    return 0;
  v13 = *(_QWORD *)&a7;
  v19 = v9;
  do
  {
    v20 = *((_DWORD *)v10 + 8);
    v21 = v20 >= a7;
    if (v20 >= a7)
      v22 = (char **)v10;
    else
      v22 = (char **)(v10 + 8);
    if (v21)
      v19 = v10;
    v10 = *v22;
  }
  while (*v22);
  if (v19 == v9 || *((_DWORD *)v19 + 8) > a7)
    return 0;
  v24 = *((_QWORD *)v19 + 5);
  if (self)
  {
    -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
    memset(&v28, 0, sizeof(v28));
    -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a8.var1, 0);
  }
  else
  {
    v29 = 0;
    memset(&v28, 0, sizeof(v28));
  }
  v27 = v28;
  v25 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v27, v24);
  -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v24 + 1056, 0);
  OZChannelPosition::setPosition((OZChannelPosition *)(v24 + 1056), &v28, a3, a4, -[OZFxPlugParameterHandler isRendering](self, "isRendering"));
  -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v24 + 1056, 0);
  v26 = (OZChannelPosition *)(v24 + 1760);
  -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v26, 0);
  OZChannelPosition::setPosition(v26, &v28, a5, a6, -[OZFxPlugParameterHandler isRendering](self, "isRendering"));
  -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v26, 0);
  -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v25);
  -[OZFxPlugParameterHandler _updateUIForParm:](self, "_updateUIForParm:", v13);
  ProCore_Impl::PCNSRefImpl::release(&v29);
  return 1;
}

- (BOOL)setGradientFlags:(BOOL)a3 toParam:(unsigned int)a4
{
  _QWORD *channelMap;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  _BOOL4 v9;
  char *v11;
  unsigned int v12;
  BOOL v13;
  char **v14;
  uint64_t v16;
  id v17;

  channelMap = self->_channelMap;
  v7 = (char *)channelMap[1];
  v5 = (char *)(channelMap + 1);
  v6 = v7;
  if (!v7)
    return 0;
  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v11 = v5;
  do
  {
    v12 = *((_DWORD *)v6 + 8);
    v13 = v12 >= a4;
    if (v12 >= a4)
      v14 = (char **)v6;
    else
      v14 = (char **)(v6 + 8);
    if (v13)
      v11 = v6;
    v6 = *v14;
  }
  while (*v14);
  if (v11 == v5 || *((_DWORD *)v11 + 8) > a4)
    return 0;
  v16 = *((_QWORD *)v11 + 5);
  if (self)
    -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
  else
    v17 = 0;
  -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v16 + 1056, 1);
  if (v9)
    OZChannelBase::resetFlag((OZChannelBase *)(v16 + 1056), 0x8000, 0);
  else
    OZChannelBase::setFlag((OZChannelBase *)(v16 + 1056), 0x8000, 0);
  -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v16 + 1056, 1);
  -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v16 + 1760, 1);
  if (v9)
    OZChannelBase::resetFlag((OZChannelBase *)(v16 + 1760), 0x8000, 0);
  else
    OZChannelBase::setFlag((OZChannelBase *)(v16 + 1760), 0x8000, 0);
  -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v16 + 1760, 1);
  -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v16 + 800, 1);
  if (v9)
    OZChannelBase::resetFlag((OZChannelBase *)(v16 + 800), 0x8000, 0);
  else
    OZChannelBase::setFlag((OZChannelBase *)(v16 + 800), 0x8000, 0);
  -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v16 + 800, 1);
  -[OZFxPlugParameterHandler _updateUIForParm:](self, "_updateUIForParm:", v8);
  ProCore_Impl::PCNSRefImpl::release(&v17);
  return 1;
}

- (BOOL)setGradientHiddenWithOSC:(BOOL)a3 toParam:(unsigned int)a4
{
  _QWORD *channelMap;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  _BOOL4 v9;
  char *v11;
  unsigned int v12;
  BOOL v13;
  char **v14;
  _QWORD *v16;
  OZDocument *v17;
  OZChannelBase *v18;
  id v19;

  channelMap = self->_channelMap;
  v7 = (char *)channelMap[1];
  v5 = (char *)(channelMap + 1);
  v6 = v7;
  if (!v7)
    return 0;
  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v11 = v5;
  do
  {
    v12 = *((_DWORD *)v6 + 8);
    v13 = v12 >= a4;
    if (v12 >= a4)
      v14 = (char **)v6;
    else
      v14 = (char **)(v6 + 8);
    if (v13)
      v11 = v6;
    v6 = *v14;
  }
  while (*v14);
  if (v11 == v5 || *((_DWORD *)v11 + 8) > a4)
    return 0;
  v16 = -[OZFxPlugParameterHandler getScene](self, "getScene");
  if (v16)
  {
    v17 = (OZDocument *)v16[198];
    if (v17)
      OZDocument::postNotification(v17, 32);
  }
  v18 = (OZChannelBase *)*((_QWORD *)v11 + 5);
  if (self)
    -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
  else
    v19 = 0;
  -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", OZChannelBase::getChannelRootBase(v18), 1);
  if (v9)
    OZChannelBase::setFlag(v18, 2, 0);
  else
    OZChannelBase::resetFlag(v18, 2, 0);
  -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", OZChannelBase::getChannelRootBase(v18), 1);
  -[OZFxPlugParameterHandler _updateUIForParm:](self, "_updateUIForParm:", v8);
  ProCore_Impl::PCNSRefImpl::release(&v19);
  return 1;
}

- (BOOL)_setPathID:(void *)a3 toParm:(unsigned int)a4 atTime:(id)a5
{
  uint64_t v6;
  _BOOL4 v9;
  _QWORD *channelMap;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  unsigned int v15;
  BOOL v16;
  char **v17;
  OZChanSceneNodeRef *v18;
  void *v19;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  id v25;

  v6 = *(_QWORD *)&a4;
  v9 = -[OZFxPlugParameterHandler safeToSetParameters](self, "safeToSetParameters");
  if (v9)
  {
    channelMap = self->_channelMap;
    v13 = (char *)channelMap[1];
    v11 = (char *)(channelMap + 1);
    v12 = v13;
    if (!v13)
      goto LABEL_13;
    v14 = v11;
    do
    {
      v15 = *((_DWORD *)v12 + 8);
      v16 = v15 >= v6;
      if (v15 >= v6)
        v17 = (char **)v12;
      else
        v17 = (char **)(v12 + 8);
      if (v16)
        v14 = v12;
      v12 = *v17;
    }
    while (*v17);
    if (v14 != v11 && *((_DWORD *)v14 + 8) <= v6)
    {
      v18 = (OZChanSceneNodeRef *)*((_QWORD *)v14 + 5);
      if (self)
      {
        -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
        v23 = 0uLL;
        v24 = 0;
        -[OZFxPlugParameterHandler fxTimeToFigTime:withConversionData:](self, "fxTimeToFigTime:withConversionData:", a5.var1, 0);
      }
      else
      {
        v24 = 0;
        v25 = 0;
        v23 = 0uLL;
      }
      v21 = v23;
      v22 = v24;
      v19 = -[OZFxPlugParameterHandler beginTimingOperation:forChannel:](self, "beginTimingOperation:forChannel:", &v21, v18);
      -[OZFxPlugParameterHandler preChannelChange:flagsOnly:](self, "preChannelChange:flagsOnly:", v18, 0);
      OZChanSceneNodeRef::setNode(v18, (OZSceneNode *)a3);
      -[OZFxPlugParameterHandler postChannelChange:flagsOnly:](self, "postChannelChange:flagsOnly:", v18, 0);
      -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v19);
      -[OZFxPlugParameterHandler _updateUIForParm:](self, "_updateUIForParm:", v6);
      ProCore_Impl::PCNSRefImpl::release(&v25);
      LOBYTE(v9) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)setFloatValue:(double)a3 toParm:(unsigned int)a4 atTime:(double)a5
{
  return -[OZFxPlugParameterHandler _setFloatValue:toParm:atTime:](self, "_setFloatValue:toParm:atTime:", *(_QWORD *)&a4, *(_QWORD *)&a5, a3);
}

- (BOOL)setIntValue:(int)a3 toParm:(unsigned int)a4 atTime:(double)a5
{
  return -[OZFxPlugParameterHandler _setIntValue:toParm:atTime:](self, "_setIntValue:toParm:atTime:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (BOOL)setBoolValue:(BOOL)a3 toParm:(unsigned int)a4 atTime:(double)a5
{
  return -[OZFxPlugParameterHandler _setBoolValue:toParm:atTime:](self, "_setBoolValue:toParm:atTime:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (BOOL)setRedValue:(double)a3 greenValue:(double)a4 blueValue:(double)a5 toParm:(unsigned int)a6 atTime:(double)a7
{
  return -[OZFxPlugParameterHandler _setRedValue:greenValue:blueValue:toParm:atTime:](self, "_setRedValue:greenValue:blueValue:toParm:atTime:", *(_QWORD *)&a6, *(_QWORD *)&a7, a3, a4, a5);
}

- (BOOL)setRedValue:(double)a3 greenValue:(double)a4 blueValue:(double)a5 alphaValue:(double)a6 toParm:(unsigned int)a7 atTime:(double)a8
{
  return -[OZFxPlugParameterHandler _setRedValue:greenValue:blueValue:alphaValue:toParm:atTime:](self, "_setRedValue:greenValue:blueValue:alphaValue:toParm:atTime:", *(_QWORD *)&a7, *(_QWORD *)&a8, a3, a4, a5, a6);
}

- (BOOL)setXValue:(double)a3 YValue:(double)a4 toParm:(unsigned int)a5 atTime:(double)a6
{
  return -[OZFxPlugParameterHandler _setXValue:YValue:toParm:atTime:](self, "_setXValue:YValue:toParm:atTime:", *(_QWORD *)&a5, *(_QWORD *)&a6, a3, a4);
}

- (BOOL)setCustomParameterValue:(id)a3 toParm:(unsigned int)a4 atTime:(double)a5
{
  return -[OZFxPlugParameterHandler _setCustomParameterValue:toParm:atTime:](self, "_setCustomParameterValue:toParm:atTime:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (BOOL)setPathID:(void *)a3 toParm:(unsigned int)a4 atTime:(double)a5
{
  return -[OZFxPlugParameterHandler _setPathID:toParm:atTime:](self, "_setPathID:toParm:atTime:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (BOOL)startUndoGroup:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  PCString v7;

  v4 = -[OZFxPlugParameterHandler getScene](self, "getScene");
  if (v4)
  {
    v5 = v4[198];
    if (v5)
    {
      v7.var0 = 0;
      PCString::set(&v7, (CFStringRef)a3);
      OZDocument::startCaptureModifiedChannels(v5, &v7);
      PCString::~PCString(&v7);
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
}

- (BOOL)endUndoGroup
{
  OZChannelBase *var2;
  const PCString *v3;

  var2 = -[OZFxPlugParameterHandler getScene](self, "getScene");
  if (var2)
  {
    var2 = (OZChannelBase *)var2[14].var2;
    if (var2)
    {
      OZDocument::endCaptureModifiedChannels(var2, v3);
      LOBYTE(var2) = 1;
    }
  }
  return (char)var2;
}

- (void)_updateUIForParm:(int)a3
{
  OZFxPlugParameterHandlerUIUpdate *v4;

  v4 = +[OZFxPlugParameterHandlerUIUpdate updateWithParamID:notificationFlags:](OZFxPlugParameterHandlerUIUpdate, "updateWithParamID:notificationFlags:", *(_QWORD *)&a3, 8);
  if (-[OZFxPlugParameterHandler isRendering](self, "isRendering"))
    -[OZFxPlugParameterHandler performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__updateUI_, v4, 0);
  else
    -[OZFxPlugParameterHandler _updateUI:](self, "_updateUI:", v4);
}

- (void)_updateUI:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *channelMap;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  unsigned int v12;
  BOOL v13;
  char **v14;
  _QWORD *v15;
  OZDocument *v16;

  v5 = objc_msgSend(a3, "paramID");
  v6 = v5;
  channelMap = self->_channelMap;
  v10 = (char *)channelMap[1];
  v8 = (char *)(channelMap + 1);
  v9 = v10;
  if (!v10)
    goto LABEL_12;
  v11 = v8;
  do
  {
    v12 = *((_DWORD *)v9 + 8);
    v13 = v12 >= v5;
    if (v12 >= v5)
      v14 = (char **)v9;
    else
      v14 = (char **)(v9 + 8);
    if (v13)
      v11 = v9;
    v9 = *v14;
  }
  while (*v14);
  if (v11 != v8 && v5 >= *((_DWORD *)v11 + 8))
  {
    v15 = -[OZFxPlugParameterHandler getScene](self, "getScene");
    if (v15)
    {
      v16 = (OZDocument *)v15[198];
      if (v16)
        OZDocument::postNotification(v16, objc_msgSend(a3, "notificationFlags"));
      else
        NSLog(CFSTR("Unable to find document for parameter %d"), v6);
    }
    else
    {
      NSLog(CFSTR("Unable to find scene for parameter %d"), v6);
    }
  }
  else
  {
LABEL_12:
    NSLog(CFSTR("Unable to find parameter with id %d"), v5);
  }
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return &unk_1EF0A41C0 == a3
      || &unk_1EF0A4260 == a3
      || &unk_1EF0A4358 == a3
      || &unk_1EF0A4590 == a3
      || &unk_1EF0A4618 == a3
      || &unk_1EF0A4858 == a3
      || &unk_1EF0A48D8 == a3
      || &unk_1EF0A4A30 == a3
      || &unk_1EF0A4B18 == a3
      || &unk_1EF0A4BC8 == a3
      || &unk_1EF0A4F00 == a3
      || &unk_1EF0A52B8 == a3
      || &unk_1EF0A4F90 == a3
      || &unk_1EF0A5050 == a3;
}

- (void)setRenderParams:(const void *)a3 withLithiumInput:(void *)a4 withLithiumAgent:(void *)a5
{
  OZFxPlugRenderContextManager *p_threadContextManager;
  PCSharedCount v8;
  PCSharedCount v9;

  p_threadContextManager = &self->_threadContextManager;
  v8.var0 = *(PC_Sp_counted_base **)a4;
  PCSharedCount::PCSharedCount(&v9, (const PCSharedCount *)a4 + 1);
  OZFxPlugRenderContextManager::setThreadInfo((uint64_t)p_threadContextManager, &v8, (LiRenderParameters **)a5, (const OZRenderParams *)a3);
  PCSharedCount::~PCSharedCount(&v9);
}

- (void)getFieldMode:(int *)a3 fromFootage:(void *)a4
{
  CMTime v4;

  if (a4)
  {
    v4 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    *a3 = OZFootage::getFieldDominance((OZFootage *)a4, &v4);
  }
}

- (void)actionStarted
{
  self->_startActionCalled = 1;
  self->_numWriteActions = 0;
}

- (void)actionEnded
{
  self->_startActionCalled = 0;
  self->_numWriteActions = 0;
}

- (int)numWriteActions
{
  return self->_numWriteActions;
}

- (BOOL)hasValidParameterID:(int)a3 checkMix:(BOOL)a4 checkSpecialCheckboxIDs:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  __shared_weak_count *cntrl;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  unsigned __int8 v15;
  BOOL v16;
  BOOL v17;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v20;
  OZLocking *v21[2];

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v20 = cntrl;
  if (cntrl)
  {
    v10 = (unint64_t *)((char *)cntrl + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v21, (uint64_t)&ptr);
  v12 = (std::__shared_weak_count *)v20;
  if (v20)
  {
    v13 = (unint64_t *)((char *)v20 + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (!*(_QWORD *)v21[0])
    goto LABEL_19;
  v15 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
  if ((v15 & 1) != 0)
    goto LABEL_19;
  v16 = !a4;
  v17 = 1;
  if ((_DWORD)v7 != 10001)
    v16 = 0;
  if (!v16
    && (v7 - 9999) <= 0xFFFFD8F1
    && *(_BYTE *)(*(_QWORD *)v21[0] + 216)
    && ((v7 - 10006) < 0xFFFFFFFC || v5))
  {
    NSLog(CFSTR("FxPlug Error: Parameter %d has an invalid parameter ID. Parameter IDs must be in the range [1, 9998]."), v7);
LABEL_19:
    v17 = 0;
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v21);
  return v17;
}

- (BOOL)parameter:(int)a3 hasValidFlags:(unsigned int)a4
{
  unsigned int v4;

  v4 = a4 & 0xFFFDF480;
  if ((a4 & 0xFFFDF480) != 0)
    NSLog(CFSTR("FxPlug Error: Parameter %d has unrecognized parameter flags (%d). Parameter not added.\n"), a2, a3, *(_QWORD *)&a4);
  return v4 == 0;
}

- (BOOL)_floatParameter:(int)a3 hasValidMin:(double)a4 max:(double)a5 sliderMin:(double)a6 sliderMax:(double)a7 defaultValue:(double)a8 paramFlags:(unsigned int)a9
{
  uint64_t v9;
  uint64_t v15;
  _BOOL4 v17;
  _BOOL4 v18;

  v9 = *(_QWORD *)&a9;
  v15 = *(_QWORD *)&a3;
  v17 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a3, 0, 1);
  LOBYTE(v18) = 0;
  if (v17)
  {
    v18 = -[OZFxPlugParameterHandler parameter:hasValidFlags:](self, "parameter:hasValidFlags:", v15, v9);
    if ((v9 & 0x100) != 0 || !v18)
    {
      if (!v18)
        return v18;
    }
    else
    {
      if (a4 > a5)
      {
        NSLog(CFSTR("FxPlug Error: Parameter %d has invalid parameter min (%f) and max (%f). (min is greater than max) Parameter not added.\n"), v15, *(_QWORD *)&a4, *(_QWORD *)&a5);
LABEL_34:
        LOBYTE(v18) = 0;
        return v18;
      }
      if (a4 > a8 || a8 > a5)
      {
        NSLog(CFSTR("FxPlug Error: Parameter %d has a default value (%f) that is not between the parameter min (%f) and max (%f). Parameter not added.\n"), v15, *(_QWORD *)&a8, *(_QWORD *)&a4, *(_QWORD *)&a5);
        goto LABEL_34;
      }
      if (a6 < a4)
      {
        NSLog(CFSTR("FxPlug Error: Parameter %d has a slider min (%f) less than parameter min (%f). Parameter not added. Parameter not added.\n"), v15, *(_QWORD *)&a6, *(_QWORD *)&a4);
        goto LABEL_34;
      }
      if (a6 > a5)
      {
        NSLog(CFSTR("FxPlug Error: Parameter %d has a slider min (%f) greater than parameter max (%f). Parameter not added. Parameter not added.\n"), v15, *(_QWORD *)&a6, *(_QWORD *)&a5);
        goto LABEL_34;
      }
      if (a7 > a5)
      {
        NSLog(CFSTR("FxPlug Error: Parameter %d has a slider max (%f) greater than parameter max (%f). Parameter not added. Parameter not added.\n"), v15, *(_QWORD *)&a7, *(_QWORD *)&a5);
        goto LABEL_34;
      }
      if (a7 < a4)
      {
        NSLog(CFSTR("FxPlug Error: Parameter %d has a slider max (%f) less than parameter min (%f). Parameter not added. Parameter not added.\n"), v15, *(_QWORD *)&a7, *(_QWORD *)&a4);
        goto LABEL_34;
      }
    }
    if (fabs(a4) == INFINITY)
    {
      NSLog(CFSTR("FxPlug Error: Parameter %d has an invalid parameter min (%f). Parameter not added.\n"), v15, *(_QWORD *)&a4);
      goto LABEL_34;
    }
    if (fabs(a5) == INFINITY)
    {
      NSLog(CFSTR("FxPlug Error: Parameter %d has an invalid parameter max (%f). Parameter not added.\n"), v15, *(_QWORD *)&a5);
      goto LABEL_34;
    }
    if (fabs(a8) == INFINITY)
    {
      NSLog(CFSTR("FxPlug Error: Parameter %d has an invalid default value (%f). Parameter not added.\n"), v15, *(_QWORD *)&a8);
      goto LABEL_34;
    }
    if (fabs(a6) == INFINITY)
    {
      NSLog(CFSTR("FxPlug Error: Parameter %d has an invalid slider min (%f). Parameter not added.\n"), v15, *(_QWORD *)&a6);
      goto LABEL_34;
    }
    if (fabs(a7) == INFINITY)
    {
      NSLog(CFSTR("FxPlug Error: Parameter %d has an invalid slider max (%f). Parameter not added.\n"), v15, *(_QWORD *)&a7);
      goto LABEL_34;
    }
    if (a6 > a7)
    {
      NSLog(CFSTR("FxPlug Error: Parameter %d has invalid slider min (%f) and max (%f). (min is greater than max) Parameter not added.\n"), v15, *(_QWORD *)&a6, *(_QWORD *)&a7);
      goto LABEL_34;
    }
    if (a6 > a8 || a8 > a7)
    {
      NSLog(CFSTR("FxPlug Error: Parameter %d has a default value (%f) that is not between the slider min (%f) and max (%f). Parameter not added.\n"), v15, *(_QWORD *)&a8, *(_QWORD *)&a6, *(_QWORD *)&a7);
      goto LABEL_34;
    }
    LOBYTE(v18) = 1;
  }
  return v18;
}

- (BOOL)_intParameter:(int)a3 hasValidMin:(int)a4 max:(int)a5 sliderMin:(int)a6 sliderMax:(int)a7 defaultValue:(int)a8 paramFlags:(unsigned int)a9
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v16;

  v9 = *(_QWORD *)&a8;
  v10 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a5;
  v13 = *(_QWORD *)&a4;
  v14 = *(_QWORD *)&a3;
  v16 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a3, 1, 1);
  if (v16)
    v16 = -[OZFxPlugParameterHandler parameter:hasValidFlags:](self, "parameter:hasValidFlags:", v14, a9);
  if ((a9 & 0x100) != 0)
  {
LABEL_19:
    if ((int)v11 > (int)v10 && v16)
    {
      NSLog(CFSTR("FxPlug Error: Parameter %d has invalid slider min (%d) and max (%d). (min is greater than max) Parameter not added. Parameter not added.\n"), v14, v11, v10);
      goto LABEL_27;
    }
    if (v16)
    {
      if ((int)v11 > (int)v9 || (int)v9 > (int)v10)
      {
        NSLog(CFSTR("FxPlug Error: Parameter %d has a default value (%d) that is not between the slider min (%d) and max (%d). Parameter not added.\n"), v14, v9, v11, v10);
        goto LABEL_27;
      }
      LOBYTE(v16) = 1;
    }
    return v16;
  }
  if ((int)v13 > (int)v12)
  {
    NSLog(CFSTR("FxPlug Error: Parameter %d has invalid parameter min (%d) and max (%d). (min is greater than max) Parameter not added.\n"), v14, v13, v12);
LABEL_27:
    LOBYTE(v16) = 0;
    return v16;
  }
  if (v16)
  {
    if ((int)v13 > (int)v9 || (int)v9 > (int)v12)
    {
      NSLog(CFSTR("FxPlug Error: Parameter %d has a default value (%d) that is not between the parameter min (%d) and max (%d). Parameter not added.\n"), v14, v9, v13, v12);
      goto LABEL_27;
    }
    if ((int)v11 < (int)v13)
    {
      NSLog(CFSTR("FxPlug Error: Parameter %d has a slider min (%d) less than parameter min (%d). Parameter not added. Parameter not added.\n"), v14, v11, v13);
      goto LABEL_27;
    }
    if ((int)v11 > (int)v12)
    {
      NSLog(CFSTR("FxPlug Error: Parameter %d has a slider min (%d) greater than parameter max (%d). Parameter not added. Parameter not added.\n"), v14, v11, v12);
      goto LABEL_27;
    }
    if ((int)v10 > (int)v12)
    {
      NSLog(CFSTR("FxPlug Error: Parameter %d has a slider max (%d) greater than parameter max (%d). Parameter not added. Parameter not added.\n"), v14, v10, v12);
      goto LABEL_27;
    }
    if ((int)v10 < (int)v13)
    {
      NSLog(CFSTR("FxPlug Error: Parameter %d has a slider max (%d) less than parameter min (%d). Parameter not added. Parameter not added.\n"), v14, v10, v13);
      goto LABEL_27;
    }
    v16 = 1;
    goto LABEL_19;
  }
  return v16;
}

- (void)setIsRendering:(BOOL)a3
{
  OZFxPlugRenderContextManager::setIsRendering(&self->_threadContextManager, a3);
}

- (BOOL)isRendering
{
  return OZFxPlugRenderContextManager::isRendering(&self->_threadContextManager);
}

- (void)customParameterList
{
  return &self->_customParameterList;
}

- (void)setIsNewGradientColorize:(BOOL)a3
{
  self->_isNewGradientColorize = a3;
}

- (void)baseChannel
{
  return self->_baseChannel;
}

- (OZRenderState)getTempContextRenderState
{
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unsigned __int8 v11;
  const OZRenderState *RenderParams;
  OZRenderState *result;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v15;
  OZLocking *v16[2];

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v15 = cntrl;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v16, (uint64_t)&ptr);
  v8 = (std::__shared_weak_count *)v15;
  if (v15)
  {
    v9 = (unint64_t *)((char *)v15 + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (!*(_QWORD *)v16[0] || (v11 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v11 & 1) != 0))
  {
    OZRenderState::OZRenderState(retstr);
  }
  else
  {
    RenderParams = (const OZRenderState *)OZFxPlugRenderContextManager::getRenderParams(&self->_threadContextManager, *(OZFxPlugSharedBase **)v16[0]);
    OZRenderState::OZRenderState(retstr, RenderParams);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v16);
  return result;
}

- (void)getPointChannel:(OZChannel *)a3 nearestPoint:(PCVector2<double>)a4 atTime:(id *)a5
{
  uint64_t v5;
  $EBBD99E4BEE052F512DA5DADC73F537E v9;
  _QWORD *channelMap;
  _QWORD *v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  OZChannel *v13;
  double v14;
  const void *v15;
  OZChannel *v16;
  OZChannel *v17;
  double v18;
  _QWORD *v19;
  _QWORD *v20;
  BOOL v21;
  double v22;
  double v23;

  v9.var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)-[OZFxPlugParameterHandler figTimeToFxTime:withConversionData:](self, "figTimeToFxTime:withConversionData:", v5, 0, a4.var0, a4.var1);
  channelMap = self->_channelMap;
  v11 = (_QWORD *)*channelMap;
  if ((_QWORD *)*channelMap == channelMap + 1)
  {
    v13 = 0;
  }
  else
  {
    var1 = v9.var1;
    v13 = 0;
    v14 = 3.40282347e38;
    do
    {
      v15 = (const void *)v11[5];
      if (v15)
      {
        if (v16)
        {
          v17 = v16;
          v22 = 0.0;
          v23 = 0.0;
          -[OZFxPlugParameterHandler _getXValue:YValue:fromParm:atTime:](self, "_getXValue:YValue:fromParm:atTime:", &v23, &v22, *((unsigned int *)v11 + 8), var1);
          v18 = sqrt((v23 - *(double *)&a5->var0) * (v23 - *(double *)&a5->var0)+ (v22 - *(double *)&a5->var1) * (v22 - *(double *)&a5->var1));
          if (v18 < v14)
          {
            v13 = v17;
            v14 = v18;
          }
        }
      }
      v19 = (_QWORD *)v11[1];
      if (v19)
      {
        do
        {
          v20 = v19;
          v19 = (_QWORD *)*v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          v20 = (_QWORD *)v11[2];
          v21 = *v20 == (_QWORD)v11;
          v11 = v20;
        }
        while (!v21);
      }
      v11 = v20;
    }
    while (v20 != (_QWORD *)self->_channelMap + 1);
  }
  *a3 = v13;
}

- (BOOL)hasPointParameters
{
  return self->_hasPointParam;
}

- (PCRect<double>)getBoundsFromSceneNode:(void *)a3 withRenderParams:(void *)a4
{
  uint64_t v4;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  PCRect<double> result;

  *(_QWORD *)v4 = 0;
  *(_QWORD *)(v4 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v4 + 16) = _Q0;
  if (v12)
    v13 = v12;
  v14 = 1552;
  if (!v12)
    v14 = 16;
  (*(void (**)(void))(*v13 + v14))();
  if (self)
  {
    -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
    if (v19)
      -[OZFxPlugParameterHandler isImageWellMediaFlexoMediaForSceneNode:](self, "isImageWellMediaFlexoMediaForSceneNode:", a3);
  }
  else
  {
    v19 = 0;
  }
  ProCore_Impl::PCNSRefImpl::release(&v19);
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (PCPtr<LiImageSource>)makeSourceFromSceneNode:(void *)a3 withRenderParams:(void *)a4
{
  PCSharedCount *v4;
  PCSharedCount *v7;
  uint64_t *v8;
  LiImageSource *v9;
  PC_Sp_counted_base *v10;
  PC_Sp_counted_base *v11;
  PCSharedCount v12;
  _BYTE v13[72];
  _BYTE v14[64];
  uint64_t v15[20];
  uint64_t v16;
  PCSharedCount v17;
  PCPtr<LiImageSource> result;

  v7 = v4;
  v4->var0 = 0;
  v8 = (uint64_t *)&v4[1];
  PCSharedCount::PCSharedCount(v4 + 1);
  OZRenderGraphState::OZRenderGraphState((OZRenderGraphState *)v14);
  if (a3)
  Render360GroupAsEquirectSentry::Render360GroupAsEquirectSentry((Render360GroupAsEquirectSentry *)v13, (OZImageNode *)a3, (OZRenderParams *)a4);
  (*(void (**)(PC_Sp_counted_base **__return_ptr, void *, void *, _BYTE *, uint64_t))(*(_QWORD *)a3 + 176))(&v11, a3, a4, v14, 1);
  v7->var0 = v11;
  PCSharedCount::PCSharedCount(&v17, &v12);
  PCSharedCount::operator=(v8, (uint64_t *)&v17);
  PCSharedCount::~PCSharedCount(&v17);
  PCSharedCount::~PCSharedCount(&v12);
  Render360GroupAsEquirectSentry::~Render360GroupAsEquirectSentry((Render360GroupAsEquirectSentry *)v13);
  PCArray<LiLight,PCArray_Traits<LiLight>>::~PCArray((uint64_t)&v16);
  v9 = (LiImageSource *)std::__list_imp<unsigned int>::clear(v15);
  result.var1.var0 = v10;
  result.var0 = v9;
  return result;
}

- (double)getPixelAspectRatioFromSceneNode:(void *)a3
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  double result;
  uint64_t v8;

  if (!a3)
    return 1.0;
  if (v4)
  {
    (*(void (**)(void *))(*(_QWORD *)v4 + 1328))(v4);
    if (v5)
    {
      if (result != 1.0)
        return result;
      goto LABEL_8;
    }
  }
  else
  {
    if (v5)
    {
LABEL_8:
      v8 = 224;
LABEL_16:
      (*(void (**)(_QWORD *))(*v5 + 8 * v8))(v5);
      return result;
    }
    result = 1.0;
  }
  if (result == 1.0 && v6 != 0)
  {
    v8 = 5;
    v5 = v6;
    goto LABEL_16;
  }
  return result;
}

- (BOOL)finalizeImage:(id)a3 withSceneNode:(void *)a4 pixelBounds:(PCRect<int>)a5 agent:(void *)a6 andRenderParams:(const void *)a7 atTime:(id)a8
{
  const LiAgent *v8;
  _QWORD *v9;
  __shared_weak_count *cntrl;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  OZChannelBase *v18;
  unsigned __int8 v19;
  int isObjectRef;
  int v21;
  uint64_t v22;
  int64x2_t v23;
  float64x2_t v24;
  BOOL v25;
  __int128 *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _OWORD v34[8];
  double v35[16];
  float64x2_t v36;
  float64x2_t v37;
  FxColorDescription v38;
  unint64_t PluginNCLC;
  int v40;
  uint64_t v41;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v43;
  OZLocking *v44[2];
  unsigned int v45;
  const void *v46;

  v8 = *(const LiAgent **)&a5.var2;
  v9 = *(_QWORD **)&a5.var0;
  v46 = a7;
  v45 = *((_DWORD *)a6 + 123);
  if (a4)
  -[OZFxPlugParameterHandler getFieldMode:fromFootage:](self, "getFieldMode:fromFootage:", &v45, a4);
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v43 = cntrl;
  if (cntrl)
  {
    v13 = (unint64_t *)((char *)cntrl + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v44, (uint64_t)&ptr);
  v15 = (std::__shared_weak_count *)v43;
  if (v43)
  {
    v16 = (unint64_t *)((char *)v43 + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v18 = *(OZChannelBase **)v44[0];
  if (!*(_QWORD *)v44[0] || (v19 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v19 & 1) != 0))
  {
    v25 = 0;
  }
  else
  {
    v41 = v45;
    isObjectRef = OZChannelBase::isObjectRef(v18);
    objc_msgSend(a3, "setFieldOrder:", v41);
    objc_msgSend(a3, "setField:", isObjectRef);
    PluginNCLC = OZFxPlugSharedBase::getPluginNCLC((id *)&v18->var0, v8);
    v40 = v21;
    objc_msgSend(a3, "setNCLCValue:", FxConvertPCNCLCCodeToFxNCLCValue(&PluginNCLC));
    objc_msgSend(a3, "setColorSpace:", OZFxPlugSharedBase::getPluginColorSpace((id *)&v18->var0, v8));
    OZFxPlugSharedBase::getPluginColorDescription((id *)&v18->var0, v8, &v38);
    objc_msgSend(a3, "setDynamicRangeType:", OZFxPlug_ConvertDynamicRangeType(&v38));
    v22 = v9[1];
    v23.i64[0] = (int)*v9;
    v23.i64[1] = (int)HIDWORD(*v9);
    v24 = vcvtq_f64_s64(v23);
    v23.i64[0] = (int)v22;
    v23.i64[1] = SHIDWORD(v22);
    v36 = v24;
    v37 = vcvtq_f64_s64(v23);
    LiAgent::getInversePixelTransform(v8, 0.0, (uint64_t)v35);
    v25 = PCMatrix44Tmpl<double>::transformRect<double>(v35, v36.f64, (uint64_t)&v36);
    if (v25)
    {
      objc_msgSend(a3, "setBounds:", *(_OWORD *)&v36, *(_OWORD *)&v37);
      v26 = (__int128 *)*((_QWORD *)v8 + 20);
      v27 = v26[3];
      v29 = *v26;
      v28 = v26[1];
      v34[2] = v26[2];
      v34[3] = v27;
      v34[0] = v29;
      v34[1] = v28;
      v30 = v26[7];
      v32 = v26[4];
      v31 = v26[5];
      v34[6] = v26[6];
      v34[7] = v30;
      v34[4] = v32;
      v34[5] = v31;
      objc_msgSend(a3, "setPixelTransform:", FxMatrixFromPCMatrix((uint64_t)v34));
    }
    PCCFRef<CGColorSpace *>::~PCCFRef(&v38._pcColorDesc._colorSpaceRef._obj);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v44);
  return v25;
}

- (void)getLayerOffsetX:(double *)a3 andOffsetY:(double *)a4 fromSceneNode:(void *)a5 withRenderParams:(const void *)a6
{
  OZTransformNode *v9;
  CMTime v11;
  double v12;
  double v13;

  if (a5)
  {
    if (v9 && ((unint64_t)a3 | (unint64_t)a4) != 0)
    {
      v12 = 0.0;
      v13 = 0.0;
      v11 = *(CMTime *)a6;
      OZTransformNode::getTranslation(v9, &v13, &v12, &v11);
      if (a3)
        *a3 = v13;
      if (a4)
        *a4 = v12;
    }
  }
}

- (BOOL)_setupRenderer
{
  OZChannelBase *v3;

  if (!self->_renderer)
  {
    v3 = (OZChannelBase *)operator new();
    OZChannelBase::setRangeName(v3, (const PCString *)0x2D0);
    self->_renderer = (GLRenderer *)v3;
  }
  return 1;
}

- (GLRenderer)renderer
{
  return self->_renderer;
}

- (BOOL)isImageWellMediaFlexoMediaForSceneNode:(void *)a3
{
  return 0;
}

- (void)contextManager
{
  return &self->_threadContextManager;
}

- (unsigned)fxParameterFlagsForChannel:(OZChannelBase *)a3
{
  _QWORD *v4;
  OZChannelFolder *v5;
  unint64_t var7;
  int v7;
  int v8;
  int v9;
  int v10;
  double v11;
  double v13;

  if (a3)
  {
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  var7 = a3->var7;
  v7 = ~LODWORD(a3->var7);
  v8 = (*((uint64_t (**)(OZChannelBase *))a3->var0 + 64))(a3) ^ 1;
  if ((*(_QWORD *)&v7 & 0x410020) == 0)
    v8 |= 0x20202u;
  v9 = v8 | var7 & 4;
  if (v5 && OZChannelFolder::testFoldFlag(v5, 4))
    v9 |= 8u;
  if ((var7 & 0x10) != 0)
    v10 = v9 | (2 * var7) & 0x10;
  else
    v10 = v9 | (2 * var7) & 0x10 | 0x20;
  if (v4)
  {
    v13 = 0.0;
    (*(void (**)(_QWORD, double *))(**(_QWORD **)(v4[14] + 8) + 264))(*(_QWORD *)(v4[14] + 8), &v13);
    v11 = v13;
    if (v13 == -1.79769313e308)
    {
      v13 = 0.0;
      (*(void (**)(_QWORD, double *, double))(**(_QWORD **)(v4[14] + 8) + 256))(*(_QWORD *)(v4[14] + 8), &v13, v11);
      if (v13 == 1.79769313e308)
        v10 |= 0x100u;
    }
  }
  return (var7 >> 5) & 0x20000 | (var7 >> 7) & 0x200 | v10;
}

- (id)getAllParameterValuesAtTime:(id *)a3 transactionID:(unint64_t)a4 pluginSessionID:(unint64_t)a5
{
  return 0;
}

- (void)setupImageParamIDs:(void *)a3
{
  _QWORD *channelMap;
  _QWORD *v4;
  char *v7;
  const void *v8;
  _DWORD *v9;
  int v10;
  unint64_t v11;
  _DWORD *v12;
  _DWORD *v13;
  _DWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  int v21;
  _QWORD *v22;
  _QWORD *v23;
  BOOL v24;

  channelMap = self->_channelMap;
  v4 = (_QWORD *)*channelMap;
  if ((_QWORD *)*channelMap != channelMap + 1)
  {
    v7 = (char *)a3 + 16;
    do
    {
      v8 = (const void *)v4[5];
      if (v8)
      {
        if (v9)
        {
          v10 = v9[6];
          v12 = (_DWORD *)*((_QWORD *)a3 + 1);
          v11 = *((_QWORD *)a3 + 2);
          if ((unint64_t)v12 >= v11)
          {
            v14 = *(_DWORD **)a3;
            v15 = ((uint64_t)v12 - *(_QWORD *)a3) >> 2;
            v16 = v15 + 1;
            if ((unint64_t)(v15 + 1) >> 62)
              std::vector<double>::__throw_length_error[abi:ne180100]();
            v17 = v11 - (_QWORD)v14;
            if (v17 >> 1 > v16)
              v16 = v17 >> 1;
            if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL)
              v18 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v18 = v16;
            if (v18)
            {
              v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)v7, v18);
              v14 = *(_DWORD **)a3;
              v12 = (_DWORD *)*((_QWORD *)a3 + 1);
            }
            else
            {
              v19 = 0;
            }
            v20 = &v19[4 * v15];
            *(_DWORD *)v20 = v10;
            v13 = v20 + 4;
            while (v12 != v14)
            {
              v21 = *--v12;
              *((_DWORD *)v20 - 1) = v21;
              v20 -= 4;
            }
            *(_QWORD *)a3 = v20;
            *((_QWORD *)a3 + 1) = v13;
            *((_QWORD *)a3 + 2) = &v19[4 * v18];
            if (v14)
              operator delete(v14);
          }
          else
          {
            *v12 = v10;
            v13 = v12 + 1;
          }
          *((_QWORD *)a3 + 1) = v13;
        }
      }
      v22 = (_QWORD *)v4[1];
      if (v22)
      {
        do
        {
          v23 = v22;
          v22 = (_QWORD *)*v22;
        }
        while (v22);
      }
      else
      {
        do
        {
          v23 = (_QWORD *)v4[2];
          v24 = *v23 == (_QWORD)v4;
          v4 = v23;
        }
        while (!v24);
      }
      v4 = v23;
    }
    while (v23 != (_QWORD *)self->_channelMap + 1);
  }
}

- (BOOL)hasPathParameters
{
  return self->_hasPathParameters;
}

- (id)transactionForParameterID:(unsigned int)a3 atTime:(id *)a4 transactionID:(unint64_t)a5 pluginSessionID:(unint64_t)a6
{
  __shared_weak_count *cntrl;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  unsigned __int8 v17;
  const __CFString *v18;
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, ParameterTransactionHelpers>, void *>>> *p_pair1;
  unsigned int v21;
  BOOL v22;
  char **v23;
  void *v24;
  _QWORD *channelMap;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  unsigned int v31;
  BOOL v32;
  char **v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, _QWORD, __int128 *, unint64_t, const __CFString *, unint64_t);
  __int128 v36;
  int64_t var3;
  PCString v38;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v40;
  OZLocking *v41[2];

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v40 = cntrl;
  if (cntrl)
  {
    v12 = (unint64_t *)((char *)cntrl + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v41, (uint64_t)&ptr);
  v14 = (std::__shared_weak_count *)v40;
  if (v40)
  {
    v15 = (unint64_t *)((char *)v40 + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  if (!*(_QWORD *)v41[0])
    goto LABEL_22;
  v17 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
  if ((v17 & 1) != 0)
    goto LABEL_22;
  OZFxPlugSharedBase::getPluginUUID(*(const PCString **)v41[0], &v38);
  v18 = PCString::ns_str(&v38);
  PCString::~PCString(&v38);
  left = (char *)self->_paramCreationMap.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_22;
  p_pair1 = &self->_paramCreationMap.__tree_.__pair1_;
  do
  {
    v21 = *((_DWORD *)left + 8);
    v22 = v21 >= a3;
    if (v21 >= a3)
      v23 = (char **)left;
    else
      v23 = (char **)(left + 8);
    if (v22)
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, ParameterTransactionHelpers>, void *>>> *)left;
    left = *v23;
  }
  while (*v23);
  if (p_pair1 != &self->_paramCreationMap.__tree_.__pair1_ && LODWORD(p_pair1[4].__value_.__left_) <= a3)
  {
    channelMap = self->_channelMap;
    v29 = (char *)channelMap[1];
    v27 = (char *)(channelMap + 1);
    v28 = v29;
    if (!v29)
      goto LABEL_35;
    v30 = v27;
    do
    {
      v31 = *((_DWORD *)v28 + 8);
      v32 = v31 >= a3;
      if (v31 >= a3)
        v33 = (char **)v28;
      else
        v33 = (char **)(v28 + 8);
      if (v32)
        v30 = v28;
      v28 = *v33;
    }
    while (*v33);
    if (v30 == v27 || *((_DWORD *)v30 + 8) > a3)
LABEL_35:
      v30 = v27;
    v34 = *((_QWORD *)v30 + 5);
    v35 = (uint64_t (*)(uint64_t, _QWORD, __int128 *, unint64_t, const __CFString *, unint64_t))p_pair1[5].__value_.__left_;
    v36 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v24 = (void *)v35(v34, 0, &v36, a5, v18, a6);
  }
  else
  {
LABEL_22:
    v24 = 0;
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v41);
  return v24;
}

- (BOOL)isPerformingBulkChange
{
  return 0;
}

- (BOOL)isColorCorrection
{
  return self->_colorCorrection;
}

- (void)setColorCorrection:(BOOL)a3
{
  self->_colorCorrection = a3;
}

- (void).cxx_destruct
{
  unsigned int *begin;
  OZChannelBlindData **v4;

  std::shared_ptr<HGCPUComputeDevice const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_fxPlugLock);
  begin = self->_fullWidthCustomParams.__begin_;
  if (begin)
  {
    self->_fullWidthCustomParams.__end_ = begin;
    operator delete(begin);
  }
  std::deque<BOOL>::~deque[abi:ne180100](&self->_suppressChannelChangesStack.c.__map_.__first_);
  OZFxPlugRenderContextManager::~OZFxPlugRenderContextManager(&self->_threadContextManager);
  v4 = self->_customParameterList.__begin_;
  if (v4)
  {
    self->_customParameterList.__end_ = v4;
    operator delete(v4);
  }
  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&self->_paramCreationMap, (_QWORD *)self->_paramCreationMap.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  self->_paramCreationMap.__tree_.__pair1_.__value_.__left_ = 0;
  self->_paramCreationMap.__tree_.__pair3_.__value_ = 0;
  self->_paramCreationMap.__tree_.__begin_node_ = &self->_paramCreationMap.__tree_.__pair1_;
  self->_customParameterList.__end_ = 0;
  self->_customParameterList.__end_cap_.__value_ = 0;
  self->_customParameterList.__begin_ = 0;
  OZFxPlugRenderContextManager::OZFxPlugRenderContextManager(&self->_threadContextManager);
  *(_OWORD *)&self->_suppressChannelChangesStack.c.__map_.__end_ = 0u;
  *(_OWORD *)&self->_suppressChannelChangesStack.c.__start_ = 0u;
  *(_OWORD *)&self->_suppressChannelChangesStack.c.__map_.__first_ = 0u;
  self->_fullWidthCustomParams.__end_ = 0;
  self->_fullWidthCustomParams.__end_cap_.__value_ = 0;
  self->_fullWidthCustomParams.__begin_ = 0;
  self->_fxPlugLock.__ptr_ = 0;
  self->_fxPlugLock.__cntrl_ = 0;
  return self;
}

@end
