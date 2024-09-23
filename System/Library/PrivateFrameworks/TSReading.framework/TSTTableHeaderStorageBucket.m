@implementation TSTTableHeaderStorageBucket

- (TSTTableHeaderStorageBucket)initWithContext:(id)a3
{
  TSTTableHeaderStorageBucket *v3;
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSTTableHeaderStorageBucket;
  v3 = -[TSPObject initWithContext:](&v6, sel_initWithContext_, a3);
  if (v3)
  {
    v4 = (_QWORD *)operator new();
    v4[1] = 0;
    v4[2] = 0;
    *v4 = v4 + 1;
    v3->mMap = v4;
    v3->mHorizontalScaleFactor = 1.0;
  }
  return v3;
}

- (void)dealloc
{
  _QWORD **mMap;
  objc_super v4;

  mMap = (_QWORD **)self->mMap;
  if (mMap)
  {
    std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::destroy((uint64_t)self->mMap, mMap[1]);
    MEMORY[0x219A153B8](mMap, 0x1020C4062D53EE8);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSTTableHeaderStorageBucket;
  -[TSTTableHeaderStorageBucket dealloc](&v4, sel_dealloc);
}

- (unint64_t)flushableSize
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  return *((_QWORD *)self->mMap + 2) * class_getInstanceSize(v3);
}

- (id)packageLocator
{
  return CFSTR("Tables/HeaderStorageBucket");
}

- (id)headerForKey:(unsigned int)a3 willModify:(BOOL)a4
{
  _QWORD *mMap;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  unsigned int v11;
  BOOL v12;
  char **v13;

  if (a4)
    -[TSPObject willModify](self, "willModify");
  mMap = self->mMap;
  v9 = (char *)mMap[1];
  v7 = (char *)(mMap + 1);
  v8 = v9;
  if (!v9)
    return 0;
  v10 = v7;
  do
  {
    v11 = *((_DWORD *)v8 + 8);
    v12 = v11 >= a3;
    if (v11 >= a3)
      v13 = (char **)v8;
    else
      v13 = (char **)(v8 + 8);
    if (v12)
      v10 = v8;
    v8 = *v13;
  }
  while (*v13);
  if (v10 != v7 && *((_DWORD *)v10 + 8) <= a3)
    return (id)*((_QWORD *)v10 + 5);
  else
    return 0;
}

- (id)headerForKey:(unsigned int)a3 willModify:(BOOL)a4 createIfNotThere:(BOOL)a5
{
  _BOOL4 v5;
  _QWORD *mMap;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  unsigned int v13;
  BOOL v14;
  char **v15;
  TSTTableHeaderInfo *v16;
  uint64_t **v17;
  TSTTableHeaderInfo *v18;
  TSTTableHeaderInfo *v19;
  unsigned int v21;
  TSTTableHeaderInfo *v22;

  v5 = a5;
  if (a4)
    -[TSPObject willModify](self, "willModify");
  mMap = self->mMap;
  v11 = (char *)mMap[1];
  v9 = (char *)(mMap + 1);
  v10 = v11;
  if (!v11)
    goto LABEL_14;
  v12 = v9;
  do
  {
    v13 = *((_DWORD *)v10 + 8);
    v14 = v13 >= a3;
    if (v13 >= a3)
      v15 = (char **)v10;
    else
      v15 = (char **)(v10 + 8);
    if (v14)
      v12 = v10;
    v10 = *v15;
  }
  while (*v15);
  if (v12 != v9 && *((_DWORD *)v12 + 8) <= a3)
  {
    v16 = (TSTTableHeaderInfo *)*((_QWORD *)v12 + 5);
    if (v16)
      return v16;
  }
  else
  {
LABEL_14:
    v16 = 0;
  }
  if (v5)
  {
    v16 = objc_alloc_init(TSTTableHeaderInfo);
    v17 = (uint64_t **)self->mMap;
    v18 = v16;
    v21 = a3;
    v22 = v16;
    v19 = v16;
    std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,SFUtility::ObjcSharedPtr<NSObject>>>(v17, &v21, (uint64_t)&v21);

  }
  return v16;
}

- (void)setHeader:(id)a3 forKey:(unsigned int)a4
{
  uint64_t **mMap;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  unsigned int v12;
  id v13;

  -[TSPObject willModify](self, "willModify");
  mMap = (uint64_t **)self->mMap;
  if (!a3)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void p_SetHeaderForKey(TSTSortedIntKeyMap *, UInt32, TSTTableHeaderInfo *)");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableHeaderStorageBucket.mm"), 186, CFSTR("Tried to set nil header for key."));
  }
  v10 = a3;
  v12 = a4;
  v13 = a3;
  v11 = a3;
  std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,SFUtility::ObjcSharedPtr<NSObject>>>(mMap, &v12, (uint64_t)&v12);

}

- (void)removeHeaderForKey:(unsigned int)a3
{
  unsigned int v4;

  v4 = a3;
  -[TSPObject willModify](self, "willModify");
  std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__erase_unique<unsigned int>((uint64_t)self->mMap, &v4);
}

- (void)removeAllHeaders
{
  char *mMap;

  -[TSPObject willModify](self, "willModify");
  mMap = (char *)self->mMap;
  std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::destroy((uint64_t)mMap, *((_QWORD **)mMap + 1));
  *(_QWORD *)mMap = mMap + 8;
  *((_QWORD *)mMap + 2) = 0;
  *((_QWORD *)mMap + 1) = 0;
}

- (void)makeHeadersPerformSelector:(SEL)a3 willModify:(BOOL)a4
{
  _QWORD *mMap;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;

  if (a4)
    -[TSPObject willModify](self, "willModify");
  mMap = self->mMap;
  v7 = (_QWORD *)*mMap;
  if ((_QWORD *)*mMap != mMap + 1)
  {
    do
    {
      objc_msgSend((id)v7[5], "performSelector:", a3);
      v8 = (_QWORD *)v7[1];
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
          v9 = (_QWORD *)v7[2];
          v10 = *v9 == (_QWORD)v7;
          v7 = v9;
        }
        while (!v10);
      }
      v7 = v9;
    }
    while (v9 != (_QWORD *)self->mMap + 1);
  }
}

- (void)applyFunction:(void *)a3 withState:(void *)a4 willModify:(BOOL)a5
{
  _QWORD *mMap;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  BOOL v12;

  if (a5)
    -[TSPObject willModify](self, "willModify");
  mMap = self->mMap;
  v9 = (_QWORD *)*mMap;
  if ((_QWORD *)*mMap != mMap + 1)
  {
    do
    {
      ((void (*)(_QWORD, _QWORD, void *))a3)(*((unsigned int *)v9 + 8), v9[5], a4);
      v10 = (_QWORD *)v9[1];
      if (v10)
      {
        do
        {
          v11 = v10;
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          v11 = (_QWORD *)v9[2];
          v12 = *v11 == (_QWORD)v9;
          v9 = v11;
        }
        while (!v12);
      }
      v9 = v11;
    }
    while (v11 != (_QWORD *)self->mMap + 1);
  }
}

- (void)shiftKeysAtIndex:(unsigned int)a3 amount:(int)a4
{
  unsigned int v5;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  _QWORD *v11;
  char *v12;
  char *v13;
  unsigned int v14;
  BOOL v15;
  char **v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  unsigned int *v21;
  unsigned int v23;
  _QWORD *mMap;
  char *v25;
  char *v26;
  unsigned int v27;
  BOOL v28;
  char **v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  unsigned int *v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  id v38;

  v5 = a3;
  if ((int)(a4 + a3) < 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableHeaderStorageBucket shiftKeysAtIndex:amount:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableHeaderStorageBucket.mm"), 266, CFSTR("Can't shift indexes below zero!"));
  }
  -[TSPObject willModify](self, "willModify");
  v9 = -[TSTTableHeaderStorageBucket maxKey](self, "maxKey");
  v10 = v9;
  if (a4 < 0)
  {
    v36 = v5;
    if (v9 >= v5)
    {
      do
      {
        v23 = v5 + a4;
        v35 = v5 + a4;
        mMap = self->mMap;
        v25 = (char *)mMap[1];
        if (!v25)
          goto LABEL_36;
        v26 = (char *)(mMap + 1);
        do
        {
          v27 = *((_DWORD *)v25 + 8);
          v28 = v27 >= v5;
          if (v27 >= v5)
            v29 = (char **)v25;
          else
            v29 = (char **)(v25 + 8);
          if (v28)
            v26 = v25;
          v25 = *v29;
        }
        while (*v29);
        if (v26 != (char *)(mMap + 1) && *((_DWORD *)v26 + 8) <= v5 && (v30 = (void *)*((_QWORD *)v26 + 5)) != 0)
        {
          v31 = v30;
          v37 = v23;
          v38 = v30;
          v32 = v30;
          std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,SFUtility::ObjcSharedPtr<NSObject>>>((uint64_t **)mMap, &v37, (uint64_t)&v37);

          v33 = self->mMap;
          v34 = &v36;
        }
        else
        {
LABEL_36:
          v34 = &v35;
          v33 = self->mMap;
        }
        std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__erase_unique<unsigned int>((uint64_t)v33, v34);
        v5 = v36 + 1;
        v36 = v5;
      }
      while (v5 <= v10);
    }
  }
  else if ((int)v9 >= (int)v5)
  {
    do
    {
      v36 = v10 + a4;
      v11 = self->mMap;
      v12 = (char *)v11[1];
      if (!v12)
        goto LABEL_18;
      v13 = (char *)(v11 + 1);
      do
      {
        v14 = *((_DWORD *)v12 + 8);
        v15 = v14 >= v10;
        if (v14 >= v10)
          v16 = (char **)v12;
        else
          v16 = (char **)(v12 + 8);
        if (v15)
          v13 = v12;
        v12 = *v16;
      }
      while (*v16);
      if (v13 != (char *)(v11 + 1) && *((_DWORD *)v13 + 8) <= v10 && (v17 = (void *)*((_QWORD *)v13 + 5)) != 0)
      {
        v18 = v17;
        v37 = v10 + a4;
        v38 = v17;
        v19 = v17;
        std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,SFUtility::ObjcSharedPtr<NSObject>>>((uint64_t **)v11, &v37, (uint64_t)&v37);

        v20 = self->mMap;
        v37 = v10;
        v21 = &v37;
      }
      else
      {
LABEL_18:
        v21 = &v36;
        v20 = self->mMap;
      }
      std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__erase_unique<unsigned int>((uint64_t)v20, v21);
    }
    while ((int)v10-- > (int)v5);
  }
}

- (int64_t)count
{
  return *((_QWORD *)self->mMap + 2);
}

- (unsigned)minKey
{
  _QWORD *mMap;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  unsigned int result;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;

  mMap = self->mMap;
  v5 = (_QWORD *)*mMap;
  v3 = mMap + 1;
  v4 = v5;
  if (v5 == v3)
    return 0;
  result = *((_DWORD *)v4 + 8);
  do
  {
    if (result >= *((_DWORD *)v4 + 8))
      result = *((_DWORD *)v4 + 8);
    v7 = (_QWORD *)v4[1];
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
        v8 = (_QWORD *)v4[2];
        v9 = *v8 == (_QWORD)v4;
        v4 = v8;
      }
      while (!v9);
    }
    v4 = v8;
  }
  while (v8 != v3);
  return result;
}

- (unsigned)maxKey
{
  _QWORD *mMap;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  unsigned int result;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;

  mMap = self->mMap;
  v5 = (_QWORD *)*mMap;
  v3 = mMap + 1;
  v4 = v5;
  if (v5 == v3)
    return 0;
  result = *((_DWORD *)v4 + 8);
  do
  {
    if (result <= *((_DWORD *)v4 + 8))
      result = *((_DWORD *)v4 + 8);
    v7 = (_QWORD *)v4[1];
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
        v8 = (_QWORD *)v4[2];
        v9 = *v8 == (_QWORD)v4;
        v4 = v8;
      }
      while (!v9);
    }
    v4 = v8;
  }
  while (v8 != v3);
  return result;
}

- (unsigned)upperBound:(unsigned int)a3
{
  _QWORD *mMap;
  char *v4;
  char *v5;
  char *v6;
  unsigned int v7;
  BOOL v8;
  char **v9;

  mMap = self->mMap;
  v6 = (char *)mMap[1];
  v4 = (char *)(mMap + 1);
  v5 = v6;
  if (v6)
  {
    do
    {
      v7 = *((_DWORD *)v5 + 8);
      v8 = v7 > a3;
      if (v7 <= a3)
        v9 = (char **)(v5 + 8);
      else
        v9 = (char **)v5;
      if (v8)
        v4 = v5;
      v5 = *v9;
    }
    while (*v9);
  }
  return *((_DWORD *)v4 + 8);
}

- (unsigned)lowerBound:(unsigned int)a3
{
  _QWORD *mMap;
  char *v4;
  char *v5;
  char *v6;
  unsigned int v7;
  BOOL v8;
  char **v9;

  mMap = self->mMap;
  v6 = (char *)mMap[1];
  v4 = (char *)(mMap + 1);
  v5 = v6;
  if (v6)
  {
    do
    {
      v7 = *((_DWORD *)v5 + 8);
      v8 = v7 >= a3;
      if (v7 >= a3)
        v9 = (char **)v5;
      else
        v9 = (char **)(v5 + 8);
      if (v8)
        v4 = v5;
      v5 = *v9;
    }
    while (*v9);
  }
  return *((_DWORD *)v4 + 8);
}

- (double)horizontalScaleFactor
{
  return self->mHorizontalScaleFactor;
}

- (void)setHorizontalScaleFactor:(double)a3
{
  self->mHorizontalScaleFactor = a3;
}

@end
