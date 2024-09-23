@implementation ESDContainer

+ (void)pbReadChildrenOfObject:(EshObject *)a3 toArray:(id)a4 state:(id)a5
{
  id v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  PptObjectFactory *v15;
  EshRoot *Object;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  v8 = a5;
  v9 = objc_msgSend(v8, "reader");
  v10 = (*((uint64_t (**)(EshObject *))a3->var0 + 5))(a3);
  if (v10)
  {
    v11 = 0;
    do
    {
      v12 = (*((uint64_t (**)(EshObject *, uint64_t))a3->var0 + 6))(a3, v11);
      v13 = (*((uint64_t (**)(EshObject *, uint64_t))a3->var0 + 7))(a3, v11);
      if (v14)
        (*(void (**)(uint64_t, void *, uint64_t))(*(_QWORD *)v9 + 56))(v9, v14, v11);
      if ((_DWORD)v12 == 1)
      {
        v15 = (PptObjectFactory *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 216))(v9);
        Object = PptObjectFactory::createObject(v15, (PptObjectFactory *)1, v13);
        if (Object)
        else
          v17 = 0;
        (*(void (**)(uint64_t, void *))(*(_QWORD *)v9 + 72))(v9, v17);
        objc_msgSend(a1, "pbReadChildrenOfObject:toArray:state:", v17, v19, v8);
        if (v17)
          (*(void (**)(void *))(*(_QWORD *)v17 + 8))(v17);
      }
      else
      {
        v18 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initPBWithType:version:state:", v12, v13, v8);
        if (v18)
          objc_msgSend(v19, "addObject:", v18);

      }
      v11 = (v11 + 1);
    }
    while (v10 != (_DWORD)v11);
  }

}

- (ESDContainer)initWithEshObject:(EshObject *)a3
{
  ESDContainer *v3;
  NSMutableArray *v4;
  NSMutableArray *mChildren;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ESDContainer;
  v3 = -[ESDObject initWithEshObject:](&v7, sel_initWithEshObject_, a3);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mChildren = v3->mChildren;
    v3->mChildren = v4;

  }
  return v3;
}

- (id)firstChildOfType:(unsigned __int16)a3
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  -[NSMutableArray objectEnumerator](self->mChildren, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  do
  {
    objc_msgSend(v4, "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      break;
    v7 = objc_msgSend(v6, "eshObject");
    v5 = v6;
  }
  while ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v7 + 16))(v7) != v3);

  return v6;
}

- (unint64_t)childCount
{
  return -[NSMutableArray count](self->mChildren, "count");
}

- (id)childAt:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mChildren, "objectAtIndex:", a3);
}

- (id)childOfType:(unsigned __int16)a3 instance:(signed __int16)a4
{
  int v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  const void *v9;
  EshRecord *v10;

  v4 = a4;
  v5 = a3;
  -[NSMutableArray objectEnumerator](self->mChildren, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  while (1)
  {
    objc_msgSend(v6, "nextObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      break;
    v9 = (const void *)objc_msgSend(v8, "eshObject");
    v7 = v8;
    if ((*(unsigned int (**)(const void *))(*(_QWORD *)v9 + 16))(v9) == v5)
    {
      if ((unsigned __int16)(v5 - 2) < 0x1Bu)
        break;
      v7 = v8;
      if (EshRecord::getInstance(v10) == v4)
        break;
    }
  }

  return v8;
}

- (unint64_t)indexOfFirstChildOfType:(unsigned __int16)a3 afterIndex:(unint64_t)a4
{
  int v5;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;

  v5 = a3;
  v7 = -[ESDContainer childCount](self, "childCount");
  while (++a4 < v7)
  {
    -[ESDContainer childAt:](self, "childAt:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "eshObject");
    v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 16))(v9);

    if (v10 == v5)
      return a4;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)addChild:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[NSMutableArray addObject:](self->mChildren, "addObject:");
  objc_storeWeak(v4 + 2, self);
  EshContainer::addChild((EshContainer *)-[ESDContainer eshContainer](self, "eshContainer"), (EshObject *)objc_msgSend(v4, "eshObject"));

}

- (void)eshContainer
{
  void *result;

  result = self->super.mEshObject;
  if (result)
  return result;
}

+ (void)readChildrenOfObject:(EshObject *)a3 reader:(OcReader *)a4 toArray:(id)a5
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a5;
  v7 = (*((uint64_t (**)(EshObject *))a3->var0 + 5))(a3);
  if (v7)
  {
    v8 = 0;
    do
    {
      v9 = (*((uint64_t (**)(EshObject *, uint64_t))a3->var0 + 6))(a3, v8);
      v10 = (*((uint64_t (**)(EshObject *, uint64_t))a3->var0 + 7))(a3, v8);
      v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initFromReader:type:version:", a4, v9, v10);
      if (v11)
        objc_msgSend(v12, "addObject:", v11);

      v8 = (v8 + 1);
    }
    while (v7 != (_DWORD)v8);
  }

}

- (void)eshGroup
{
  void *v3;
  const void *v4;
  void *v5;
  objc_super v7;

  if (!-[ESDContainer childCount](self, "childCount"))
    goto LABEL_6;
  -[ESDContainer childAt:](self, "childAt:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (const void *)objc_msgSend(v3, "eshObject");
  if (!v4)
  {

LABEL_6:
    v7.receiver = self;
    v7.super_class = (Class)ESDContainer;
    return -[ESDObject eshGroup](&v7, sel_eshGroup);
  }

  if (!v5)
    goto LABEL_6;
  return v5;
}

- (id)shapeContainer
{
  return -[ESDContainer childAt:](self, "childAt:", 1);
}

- (id)initFromReader:(OcReader *)a3 type:(unsigned __int16)a4 version:(unsigned __int16)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ESDContainer;
  v6 = -[ESDObject initFromReader:type:version:](&v12, sel_initFromReader_type_version_, a3, a4, a5);
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "readChildrenOfObject:reader:toArray:", *((_QWORD *)v6 + 1), a3, *((_QWORD *)v6 + 4));
    objc_msgSend(*((id *)v6 + 4), "objectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      objc_msgSend(v7, "nextObject");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (!v8)
        break;
      objc_storeWeak((id *)(v8 + 16), v6);

    }
  }
  v10 = v6;

  return v10;
}

- (id)addEshChild:(EshObject *)a3
{
  void *v5;

  (*((uint64_t (**)(EshObject *, SEL))a3->var0 + 11))(a3, a2);
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEshObject:", a3);
  -[ESDContainer addChild:](self, "addChild:", v5);
  return v5;
}

- (id)addChildOfType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;

  v3 = a3;
  +[ESDObjectFactory threadLocalFactory](ESDObjectFactory, "threadLocalFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "createObjectWithType:", v3);

  return -[ESDContainer addEshChild:](self, "addEshChild:", v6);
}

- (id)addContainerChildOfType:(unsigned __int16)a3
{
  EshContainer *v5;

  v5 = (EshContainer *)operator new(0x38uLL);
  EshContainer::EshContainer(v5, a3);
  return -[ESDContainer addEshChild:](self, "addEshChild:", v5);
}

- (EshObject)addAtomChildOfType:(unsigned __int16)a3
{
  void *v3;
  EshObject *v4;

  -[ESDContainer addChildOfType:](self, "addChildOfType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (EshObject *)objc_msgSend(v3, "eshObject");

  return v4;
}

- (void)insertChild:(id)a3 at:(unint64_t)a4
{
  unsigned int v4;
  id *v6;

  v4 = a4;
  v6 = (id *)a3;
  -[NSMutableArray insertObject:atIndex:](self->mChildren, "insertObject:atIndex:");
  objc_storeWeak(v6 + 2, self);
  EshContainer::insertChild((EshContainer *)-[ESDContainer eshContainer](self, "eshContainer"), (EshObject *)objc_msgSend(v6, "eshObject"), v4);

}

- (id)insertEshChild:(EshObject *)a3 at:(unint64_t)a4
{
  id *v7;

  (*((uint64_t (**)(EshObject *, SEL))a3->var0 + 11))(a3, a2);
  v7 = (id *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEshObject:", a3);
  -[NSMutableArray insertObject:atIndex:](self->mChildren, "insertObject:atIndex:", v7, a4);
  objc_storeWeak(v7 + 2, self);
  EshContainer::insertChild((EshContainer *)-[ESDContainer eshContainer](self, "eshContainer"), (EshObject *)objc_msgSend(v7, "eshObject"), a4);
  return v7;
}

- (void)removeChild:(id)a3
{
  uint64_t v4;
  id *v5;

  v5 = (id *)a3;
  v4 = -[NSMutableArray indexOfObject:](self->mChildren, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->mChildren, "removeObjectAtIndex:", v4);
    objc_storeWeak(v5 + 2, 0);
    EshContainer::removeChild((EshContainer *)-[ESDContainer eshContainer](self, "eshContainer"), v4);
  }

}

- (id)firstChildOfType:(unsigned __int16)a3 afterChild:(id)a4
{
  int v4;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  id v10;
  uint64_t v11;

  v4 = a3;
  v6 = a4;
  -[NSMutableArray objectEnumerator](self->mChildren, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = 0;
  while (1)
  {
    objc_msgSend(v7, "nextObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (!v10)
      break;
    if (v8)
    {
      v11 = objc_msgSend(v10, "eshObject");
      v8 = 1;
      v9 = v10;
      if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11) == v4)
        break;
    }
    else
    {
      v8 = v10 == v6;
      v9 = v10;
    }
  }

  return v10;
}

- (id)firstChildOfType:(unsigned __int16)a3 afterIndex:(unint64_t)a4
{
  unint64_t v5;
  void *v6;

  v5 = -[ESDContainer indexOfFirstChildOfType:afterIndex:](self, "indexOfFirstChildOfType:afterIndex:", a3, a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    -[ESDContainer childAt:](self, "childAt:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)containerFromObject:(id)a3 mustExist:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;

  v4 = a4;
  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      TCVerifyInputMeetsCondition(0);
    v6 = v5;
  }
  else if (v4)
  {
    TCVerifyInputMeetsCondition(0);
  }

  return v5;
}

- (id)firstContainerChildOfType:(unsigned __int16)a3 mustExist:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  -[ESDContainer firstChildOfType:](self, "firstChildOfType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ESDContainer containerFromObject:mustExist:](self, "containerFromObject:mustExist:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)containerChildOfType:(unsigned __int16)a3 instance:(signed __int16)a4 mustExist:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;

  v5 = a5;
  -[ESDContainer childOfType:instance:](self, "childOfType:instance:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ESDContainer containerFromObject:mustExist:](self, "containerFromObject:mustExist:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)containerChildAt:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[ESDContainer childAt:](self, "childAt:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ESDContainer containerFromObject:mustExist:](self, "containerFromObject:mustExist:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)writeToWriter:(OcWriter *)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ESDContainer;
  -[ESDObject writeToWriter:](&v8, sel_writeToWriter_);
  -[NSMutableArray objectEnumerator](self->mChildren, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(v5, "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      break;
    objc_msgSend(v6, "writeToWriter:", a3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mChildren, 0);
}

- (id)initForExcelBinaryWithType:(unsigned __int16)a3 version:(unsigned __int16)a4 state:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  _QWORD *v9;
  char *v10;
  _QWORD *v11;
  void *v12;
  id v13;
  objc_super v15;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = (_QWORD *)objc_msgSend(v8, "xlReader");
  if (v9)
    v10 = (char *)v9 + *(_QWORD *)(*v9 - 24);
  else
    v10 = 0;
  v15.receiver = self;
  v15.super_class = (Class)ESDContainer;
  v11 = -[ESDObject initFromReader:type:version:](&v15, sel_initFromReader_type_version_, v10, v6, v5);
  v12 = v11;
  if (v11)
    +[EBEscher readChildrenOfObject:toArray:state:](EBEscher, "readChildrenOfObject:toArray:state:", v11[1], v11[4], v8);
  v13 = v12;

  return v13;
}

- (id)initPBWithType:(unsigned __int16)a3 version:(unsigned __int16)a4 state:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  objc_super v15;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ESDContainer;
  v9 = -[ESDObject initPBWithType:version:state:](&v15, sel_initPBWithType_version_state_, v6, v5, v8);
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "pbReadChildrenOfObject:toArray:state:", *((_QWORD *)v9 + 1), *((_QWORD *)v9 + 4), v8);
    objc_msgSend(*((id *)v9 + 4), "objectEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      objc_msgSend(v10, "nextObject");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (!v11)
        break;
      objc_storeWeak((id *)(v11 + 16), v9);

    }
  }
  v13 = v9;

  return v13;
}

- (id)addPptContainerChildOfType:(unsigned __int16)a3
{
  EshContainer *v5;

  v5 = (EshContainer *)operator new(0x48uLL);
  EshContainer::EshContainer(v5, a3);
  *(_QWORD *)v5 = &off_24F3B4BB0;
  *((_QWORD *)v5 + 7) = &unk_24F3B4C60;
  *((_BYTE *)v5 + 64) = 0;
  *((_DWORD *)v5 + 17) = -1;
  return -[ESDContainer addEshChild:](self, "addEshChild:", v5);
}

- (EshObject)addPptAtomChildOfType:(unsigned __int16)a3
{
  EshObject *PowerPointObject;
  id v5;

  PowerPointObject = (EshObject *)PptObjectFactory::createPowerPointObject((PptObjectFactory *)a3, 0);
  v5 = -[ESDContainer addEshChild:](self, "addEshChild:", PowerPointObject);
  return PowerPointObject;
}

- (id)addPptEshClientChildOfType:(unsigned __int16)a3
{
  int v3;
  int v5;
  char *mEshObject;
  PptEshClientContainer *v7;
  int v8;
  PptEshClientContainer *v9;
  char *v10;
  void *v11;
  id v12;

  v3 = a3;
  v5 = (*((uint64_t (**)(EshObject *, SEL))self->super.mEshObject->var0 + 2))(self->super.mEshObject, a2);
  mEshObject = (char *)self->super.mEshObject;
  if (v5 == 7)
  {
    if (mEshObject)
    v7 = (PptEshClientContainer *)(mEshObject + 576);
  }
  else
  {
    v8 = (*(uint64_t (**)(char *))(*(_QWORD *)mEshObject + 16))(mEshObject);
    mEshObject = (char *)self->super.mEshObject;
    if (v8 == 6)
    {
      if (mEshObject)
      v7 = (PptEshClientContainer *)(mEshObject + 368);
    }
    else
    {
      if ((*(unsigned int (**)(char *))(*(_QWORD *)mEshObject + 16))(mEshObject) != 12)
      {
        v9 = 0;
        goto LABEL_16;
      }
      mEshObject = (char *)self->super.mEshObject;
      if (mEshObject)
      v7 = (PptEshClientContainer *)(mEshObject + 328);
    }
  }
  if (mEshObject)
    v9 = v7;
  else
    v9 = 0;
LABEL_16:
  switch(v3)
  {
    case 61453:
      v10 = (char *)operator new(0x38uLL);
      PptEshClientTextBox::PptEshClientTextBox((PptEshClientTextBox *)v10);
      break;
    case 61457:
      v10 = (char *)operator new(0x38uLL);
      PptEshClientData::PptEshClientData((PptEshClientData *)v10);
      break;
    case 61456:
      v10 = (char *)operator new(0x30uLL);
      PptEshClientAnchor::PptEshClientAnchor((PptEshClientAnchor *)v10);
      break;
    default:
      v11 = 0;
      return v11;
  }
  v11 = 0;
  if (v10 && v9)
  {
    PptEshClientContainer::addChild(v9, (const EshHeader *)(v10 + 12));
    (*(uint64_t (**)(char *))(*(_QWORD *)v10 + 80))(v10);
    v12 = objc_alloc((Class)objc_opt_class());
    v11 = (void *)objc_msgSend(v12, "initWithEshObject:", v10);

    -[NSMutableArray addObject:](self->mChildren, "addObject:", v11);
  }
  return v11;
}

- (void)addCStringWithNSString:(id)a3 instance:(int)a4
{
  __int16 v4;
  PptCString *v6;
  id v7;
  id v8;

  v4 = a4;
  v8 = a3;
  v6 = (PptCString *)operator new(0x48uLL);
  PptCString::PptCString(v6);
  EshRecord::setInstance((uint64_t)v6, v4);
  v7 = -[ESDContainer addEshChild:](self, "addEshChild:", v6);
  objc_msgSend(v8, "copyToCsString:", (char *)v6 + 48);

}

- (void)addCStringWithChar2String:(const unsigned __int16 *)a3 instance:(int)a4
{
  __int16 v4;
  CsString *v7;
  id v8;

  v4 = a4;
  v7 = (CsString *)operator new(0x48uLL);
  PptCString::PptCString((PptCString *)v7);
  EshRecord::setInstance((uint64_t)v7, v4);
  v8 = -[ESDContainer addEshChild:](self, "addEshChild:", v7);
  CsString::append(v7 + 2, a3);
}

@end
