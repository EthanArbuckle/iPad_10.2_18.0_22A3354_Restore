@implementation ESDObject

- (ESDObject)initWithType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  ESDObject *v6;

  v3 = a3;
  +[ESDObjectFactory threadLocalFactory](ESDObjectFactory, "threadLocalFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ESDObject initWithEshObject:](self, "initWithEshObject:", objc_msgSend(v5, "createObjectWithType:", v3));

  return v6;
}

- (ESDObject)initWithEshObject:(EshObject *)a3
{
  ESDObject *v3;
  ESDObject *v4;
  objc_super v6;

  v3 = (ESDObject *)a3;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)ESDObject;
    v4 = -[ESDObject init](&v6, sel_init);
    if (v4)
    {
      v4->mEshObject = (EshObject *)v3;
      v4->mIsChart = 0;
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (EshObject)eshObject
{
  return self->mEshObject;
}

- (void)eshShape
{
  void *result;

  result = self->mEshObject;
  if (result)
  return result;
}

- (BOOL)isChart
{
  return self->mIsChart;
}

- (void)dealloc
{
  EshObject *mEshObject;
  objc_super v4;

  mEshObject = self->mEshObject;
  if (mEshObject)
    (*((void (**)(EshObject *, SEL))mEshObject->var0 + 1))(mEshObject, a2);
  self->mEshObject = 0;
  v4.receiver = self;
  v4.super_class = (Class)ESDObject;
  -[ESDObject dealloc](&v4, sel_dealloc);
}

- (id)initFromReader:(OcReader *)a3 type:(unsigned __int16)a4 version:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v9;
  uint64_t v10;
  ESDObject *v11;

  v5 = a5;
  v6 = a4;
  +[ESDObjectFactory threadLocalFactory](ESDObjectFactory, "threadLocalFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "createObjectWithType:version:", v6, v5);

  if (!v10)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Cannot create object"));
  (*((void (**)(OcReader *, uint64_t))a3->var0 + 16))(a3, v10);
  v11 = -[ESDObject initWithEshObject:](self, "initWithEshObject:", v10);

  return v11;
}

- (id)parent
{
  return objc_loadWeakRetained((id *)&self->mParent);
}

- (void)setChart:(BOOL)a3
{
  self->mIsChart = a3;
}

- (void)writeToWriter:(OcWriter *)a3
{
  (*((void (**)(OcWriter *, EshObject *))a3->var0 + 8))(a3, -[ESDObject eshObject](self, "eshObject"));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mParent);
}

- (void)eshGroup
{
  void *result;

  result = self->mEshObject;
  if (result)
  return result;
}

- (int)shapeID
{
  _QWORD *v3;
  uint64_t v4;
  EshContentProperties *v5;

  v3 = -[ESDObject eshShape](self, "eshShape");
  if (v3)
  {
    v4 = 21;
  }
  else
  {
    v3 = -[ESDObject eshGroup](self, "eshGroup");
    v4 = 17;
  }
  v5 = (EshContentProperties *)(*(uint64_t (**)(void))(*v3 + 8 * v4))();
  return EshContentProperties::getShapeID(v5);
}

- (id)initForExcelBinaryWithType:(unsigned __int16)a3 version:(unsigned __int16)a4 state:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  _QWORD *v9;
  char *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = (_QWORD *)objc_msgSend(v8, "xlReader");
  if (v9)
    v10 = (char *)v9 + *(_QWORD *)(*v9 - 24);
  else
    v10 = 0;
  v11 = -[ESDObject initFromReader:type:version:](self, "initFromReader:type:version:", v10, v6, v5);

  return v11;
}

- (id)initPBWithType:(unsigned __int16)a3 version:(unsigned __int16)a4 state:(id)a5
{
  unsigned __int8 v5;
  PptObjectFactory *v6;
  id v8;
  uint64_t v9;
  PptObjectFactory *v10;
  EshRoot *Object;
  ESDObject *v12;

  v5 = a4;
  v6 = (PptObjectFactory *)a3;
  v8 = a5;
  v9 = objc_msgSend(v8, "reader");
  v10 = (PptObjectFactory *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 216))(v9);
  Object = PptObjectFactory::createObject(v10, v6, v5);
  if (!Object)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("An object couldn't be created."));
  (*(void (**)(uint64_t, EshRoot *))(*(_QWORD *)v9 + 80))(v9, Object);
  v12 = -[ESDObject initWithEshObject:](self, "initWithEshObject:", Object);

  return v12;
}

@end
