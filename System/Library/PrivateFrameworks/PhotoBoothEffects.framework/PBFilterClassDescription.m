@implementation PBFilterClassDescription

+ (id)classDescriptionForClass:(Class)a3
{
  void *value;

  value = 0;
  pthread_mutex_lock(&classDescriptionForClass__mutex);
  if (classDescriptionForClass__table)
  {
    if (CFDictionaryGetValueIfPresent((CFDictionaryRef)classDescriptionForClass__table, a3, (const void **)&value))
      goto LABEL_8;
  }
  else
  {
    classDescriptionForClass__table = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x24BDBD6B0]);
  }
  pthread_mutex_unlock(&classDescriptionForClass__mutex);
  value = -[PBFilterClassDescription initWithClass:]([PBFilterClassDescription alloc], "initWithClass:", a3);
  pthread_mutex_lock(&classDescriptionForClass__mutex);
  if (value && classDescriptionForClass__table)
    CFDictionarySetValue((CFMutableDictionaryRef)classDescriptionForClass__table, a3, value);
LABEL_8:
  pthread_mutex_unlock(&classDescriptionForClass__mutex);
  return value;
}

- (PBFilterClassDescription)initWithClass:(Class)a3
{
  PBFilterClassDescription *v4;
  void *v5;
  Ivar *v6;
  Ivar *v7;
  unint64_t i;
  const char *Name;
  int v10;
  uint64_t v11;
  uint64_t v12;
  objc_property_t *v13;
  objc_property_t *v14;
  unint64_t j;
  const char *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int outCount;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PBFilterClassDescription;
  v4 = -[PBFilterClassDescription init](&v22, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    outCount = 0;
    v6 = class_copyIvarList(a3, &outCount);
    if (v6)
    {
      v7 = v6;
      if (outCount)
      {
        for (i = 0; i < outCount; ++i)
        {
          Name = ivar_getName(v7[i]);
          v10 = strlen(Name);
          v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", Name, 1);
          if (v10 >= 6)
          {
            v12 = v11;
            if (!strncmp("input", Name, 5uLL) && (objc_msgSend(v5, "containsObject:", v12) & 1) == 0)
              objc_msgSend(v5, "addObject:", v12);
          }
        }
      }
      free(v7);
    }
    v13 = class_copyPropertyList(a3, &outCount);
    if (v13)
    {
      v14 = v13;
      if (outCount)
      {
        for (j = 0; j < outCount; ++j)
        {
          v16 = property_getName(v14[j]);
          v17 = strlen(v16);
          v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 1);
          if (v17 >= 6)
          {
            v19 = v18;
            if (!strncmp("input", v16, 5uLL) && (objc_msgSend(v5, "containsObject:", v19) & 1) == 0)
              objc_msgSend(v5, "addObject:", v19);
          }
        }
      }
      free(v14);
    }
    v4->_inputKeys = (NSArray *)objc_msgSend(v5, "copy");
  }
  return v4;
}

- (id)attributes
{
  return self->_attributes;
}

- (id)inputKeys
{
  return self->_inputKeys;
}

@end
