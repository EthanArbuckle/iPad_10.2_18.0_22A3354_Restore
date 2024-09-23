@implementation OZFxPlugAPIManager

- (OZFxPlugAPIManager)init
{
  OZFxPlugAPIManager *v2;
  NSMutableDictionary *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OZFxPlugAPIManager;
  v2 = -[OZFxPlugAPIManager init](&v5, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 20);
    v2->_apis = v3;
    if (!v3)

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_apis = 0;
  v3.receiver = self;
  v3.super_class = (Class)OZFxPlugAPIManager;
  -[OZFxPlugAPIManager dealloc](&v3, sel_dealloc);
}

- (void)registerAPIObject:(id)a3 forProtocol:(id)a4 version:(unsigned int)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PCRecursiveMutex *p_mutex;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", protocol_getName((Protocol *)a4));
  p_mutex = &self->_mutex;
  PCMutex::lock((PCMutex *)&self->_mutex);
  v8 = (void *)-[NSMutableDictionary objectForKey:](self->_apis, "objectForKey:", v7);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("RefCount"));
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "intValue") + 1);
    -[NSMutableDictionary setObject:forKey:](self->_apis, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(v9, "objectForKey:", CFSTR("API Object")), CFSTR("API Object"), v11, CFSTR("RefCount"), 0, p_mutex), v7);
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_apis, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a3, CFSTR("API Object"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1), CFSTR("RefCount"), 0, p_mutex), v7);
  }

  PCMutex::unlock((PCMutex *)&self->_mutex);
}

- (void)unregisterAPIForProtocol:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", protocol_getName((Protocol *)a3));
  PCMutex::lock((PCMutex *)&self->_mutex);
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_apis, "objectForKey:", v10);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("RefCount"));
    if (objc_msgSend(v8, "intValue") == 1)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_apis, "removeObjectForKey:", v10);
    }
    else
    {
      v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "intValue") - 1);
      -[NSMutableDictionary setObject:forKey:](self->_apis, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(v7, "objectForKey:", CFSTR("API Object")), CFSTR("API Object"), v9, CFSTR("RefCount"), 0), v10);
    }
  }
  PCMutex::unlock((PCMutex *)&self->_mutex);

}

- (id)apiForProtocol:(id)a3
{
  void *v4;
  PCMutex *p_mutex;
  void *v6;
  uint64_t v8;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", protocol_getName((Protocol *)a3));
  p_mutex = (PCMutex *)&self->_mutex;
  PCMutex::lock((PCMutex *)&self->_mutex);
  LOBYTE(v8) = 1;
  v6 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_apis, "objectForKey:", v4, &self->_mutex, v8), "objectForKey:", CFSTR("API Object"));

  PCMutex::unlock(p_mutex);
  return v6;
}

- (void).cxx_destruct
{
  PCMutex::~PCMutex((PCMutex *)&self->_mutex);
}

- (id).cxx_construct
{
  PCMutex::PCMutex((PCMutex *)&self->_mutex, 1);
  self->_mutex._vptr$PCMutex = (void **)&unk_1E64E2000;
  return self;
}

@end
