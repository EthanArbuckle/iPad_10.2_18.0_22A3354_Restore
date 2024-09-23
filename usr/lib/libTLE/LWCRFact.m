@implementation LWCRFact

- (void)dealloc
{
  objc_super v3;

  if (self->fact.type == 1)
    CEReleaseManagedContext();
  v3.receiver = self;
  v3.super_class = (Class)LWCRFact;
  -[LWCRFact dealloc](&v3, sel_dealloc);
}

- (void)bindName:(id)a3
{
  id v4;
  id v5;

  v4 = objc_retainAutorelease(a3);
  self->fact.name.data = (char *)objc_msgSend(v4, "UTF8String");
  v5 = objc_retainAutorelease(v4);
  self->fact.name.length = strlen((const char *)objc_msgSend(v5, "UTF8String"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->dataFactStorage, 0);
  objc_storeStrong((id *)&self->stringFactStorage, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

+ (id)BOOLFact:(BOOL)a3
{
  _BOOL4 v3;
  LWCRFact *v4;

  v3 = a3;
  v4 = objc_alloc_init(LWCRFact);
  v4->fact.type = 5;
  v4->fact.value.integer = v3;
  return v4;
}

+ (id)integerFact:(id)a3
{
  id v3;
  LWCRFact *v4;

  v3 = a3;
  v4 = objc_alloc_init(LWCRFact);
  v4->fact.type = 3;
  v4->fact.value.integer = objc_msgSend(v3, "longLongValue");

  return v4;
}

+ (id)stringFact:(id)a3
{
  id v3;
  LWCRFact *v4;
  uint64_t v5;
  NSString *stringFactStorage;

  v3 = a3;
  v4 = objc_alloc_init(LWCRFact);
  v4->fact.type = 4;
  v5 = objc_msgSend(v3, "copy");
  stringFactStorage = v4->stringFactStorage;
  v4->stringFactStorage = (NSString *)v5;

  v4->fact.value.integer = (int64_t)-[NSString UTF8String](v4->stringFactStorage, "UTF8String");
  v4->fact.value.string.length = strlen(-[NSString UTF8String](v4->stringFactStorage, "UTF8String"));

  return v4;
}

+ (id)entitlementsFact:(id)a3
{
  id v3;
  LWCRFact *v4;
  uint64_t v5;
  _QWORD *v6;
  NSData *dataFactStorage;
  LWCRFact *v8;

  v3 = a3;
  v4 = objc_alloc_init(LWCRFact);
  v4->fact.type = 1;
  v5 = CESerializeCFDictionary();
  v6 = (_QWORD *)MEMORY[0x24BED3CF0];
  if (v5 == *MEMORY[0x24BED3CF0]
    && (dataFactStorage = v4->dataFactStorage,
        v4->dataFactStorage = 0,
        dataFactStorage,
        CEManagedContextFromCFData() == *v6))
  {
    v8 = v4;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)dataFact:(id)a3
{
  id v3;
  LWCRFact *v4;
  uint64_t v5;
  NSData *dataFactStorage;

  v3 = a3;
  v4 = objc_alloc_init(LWCRFact);
  v4->fact.type = 6;
  v5 = objc_msgSend(v3, "copy");
  dataFactStorage = v4->dataFactStorage;
  v4->dataFactStorage = (NSData *)v5;

  v4->fact.value.integer = (int64_t)-[NSData bytes](v4->dataFactStorage, "bytes");
  v4->fact.value.string.length = -[NSData length](v4->dataFactStorage, "length");

  return v4;
}

@end
