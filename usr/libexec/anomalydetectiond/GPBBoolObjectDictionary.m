@implementation GPBBoolObjectDictionary

- (GPBBoolObjectDictionary)init
{
  return -[GPBBoolObjectDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:", 0, 0, 0);
}

- (GPBBoolObjectDictionary)initWithObjects:(const void *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5
{
  GPBBoolObjectDictionary *v8;
  GPBBoolObjectDictionary *v9;
  BOOL v10;
  id *values;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GPBBoolObjectDictionary;
  v8 = -[GPBBoolObjectDictionary init](&v16, "init");
  v9 = v8;
  if (v8)
    v10 = a5 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    values = v8->_values;
    do
    {
      if (!*a3)
        +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Attempting to add nil object to a Dictionary"));
      v13 = *(unsigned __int8 *)a4++;
      v12 = v13;

      v14 = (void *)*a3++;
      values[v12] = v14;
      --a5;
    }
    while (a5);
  }
  return v9;
}

- (GPBBoolObjectDictionary)initWithDictionary:(id)a3
{
  GPBBoolObjectDictionary *v4;
  GPBBoolObjectDictionary *v5;

  v4 = -[GPBBoolObjectDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:", 0, 0, 0);
  v5 = v4;
  if (a3 && v4)
  {
    v4->_values[0] = *((id *)a3 + 2);
    v5->_values[1] = *((id *)a3 + 3);
  }
  return v5;
}

- (GPBBoolObjectDictionary)initWithCapacity:(unint64_t)a3
{
  return -[GPBBoolObjectDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:", 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_autocreator)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBDictionary.m"), 11568, CFSTR("%@: Autocreator must be cleared before release, autocreator: %@"), objc_opt_class(self), self->_autocreator);

  v3.receiver = self;
  v3.super_class = (Class)GPBBoolObjectDictionary;
  -[GPBBoolObjectDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[GPBBoolObjectDictionary initWithDictionary:](+[GPBBoolObjectDictionary allocWithZone:](GPBBoolObjectDictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  unsigned int v8;

  if (self == a3)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v5 = objc_opt_class(GPBBoolObjectDictionary);
    if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0
      || (v6 = self->_values[0], (v6 != 0) == (*((_QWORD *)a3 + 2) == 0))
      || (v7 = self->_values[1], (v7 == 0) == (*((_QWORD *)a3 + 3) != 0)))
    {
      LOBYTE(v8) = 0;
      return v8;
    }
    if (v6)
    {
      v8 = objc_msgSend(self->_values[0], "isEqual:");
      if (!v8)
        return v8;
      v7 = self->_values[1];
    }
    if (!v7 || (v8 = objc_msgSend(v7, "isEqual:", *((_QWORD *)a3 + 3))) != 0)
      LOBYTE(v8) = 1;
  }
  return v8;
}

- (unint64_t)hash
{
  if (self->_values[0])
    return (self->_values[1] != 0) + 1;
  else
    return self->_values[1] != 0;
}

- (id)description
{
  NSMutableString *v3;
  NSMutableString *v4;

  v3 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@ %p> {"), objc_opt_class(self), self);
  v4 = v3;
  if (self->_values[0])
    -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("NO: %@"), self->_values[0]);
  if (self->_values[1])
    -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("YES: %@"), self->_values[1]);
  -[NSMutableString appendString:](v4, "appendString:", CFSTR(" }"));
  return v4;
}

- (unint64_t)count
{
  if (self->_values[0])
    return (self->_values[1] != 0) + 1;
  else
    return self->_values[1] != 0;
}

- (id)objectForKey:(BOOL)a3
{
  return self->_values[a3];
}

- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4
{
  id *v5;

  v5 = (id *)(&self->super.isa + a4->var0);

  v5[2] = a3->var7;
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_values[0])
    (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("false"));
  if (self->_values[1])
    (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("true"));
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v5;
  id v6;
  char v7;

  v7 = 0;
  v5 = self->_values[0];
  if (!v5 || ((*((void (**)(id, _QWORD, id, char *))a3 + 2))(a3, 0, v5, &v7), !v7))
  {
    v6 = self->_values[1];
    if (v6)
      (*((void (**)(id, uint64_t, id, char *))a3 + 2))(a3, 1, v6, &v7);
  }
}

- (BOOL)isInitialized
{
  id v3;
  unsigned int v4;
  id v5;

  v3 = self->_values[0];
  if (!v3 || (v4 = objc_msgSend(v3, "isInitialized")) != 0)
  {
    v5 = self->_values[1];
    if (!v5 || (v4 = objc_msgSend(v5, "isInitialized")) != 0)
      LOBYTE(v4) = 1;
  }
  return v4;
}

- (id)deepCopyWithZone:(_NSZone *)a3
{
  GPBBoolObjectDictionary *v5;
  uint64_t v6;
  id *values;
  char v8;
  char v9;
  id v10;

  v5 = objc_alloc_init(GPBBoolObjectDictionary);
  v6 = 0;
  values = self->_values;
  v8 = 1;
  do
  {
    v9 = v8;
    v10 = values[v6];
    if (v10)
      v5->_values[v6] = objc_msgSend(v10, "copyWithZone:", a3);
    v8 = 0;
    v6 = 1;
  }
  while ((v9 & 1) != 0);
  return v5;
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  id *values;
  char v9;
  char v10;
  id v11;
  uint64_t v12;
  char *v13;

  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = *(unsigned __int8 *)(*((_QWORD *)a3 + 1) + 30);
  values = self->_values;
  v9 = 1;
  do
  {
    v10 = v9;
    v11 = values[v4];
    if (v11)
    {
      ++v5;
      v12 = GPBComputeBoolSize(1);
      v13 = sub_10029D150(v11, v7);
      v6 += (uint64_t)&v13[v12 + GPBComputeRawVarint32SizeForInteger((int)v13 + (int)v12)];
    }
    v9 = 0;
    v4 = 1;
  }
  while ((v10 & 1) != 0);
  return v6 + GPBComputeWireFormatTagSize(*(_DWORD *)(*((_QWORD *)a3 + 1) + 16), 15) * v5;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  uint64_t v6;
  unsigned int v7;
  uint64_t Tag;
  char v9;
  uint64_t v10;
  id *values;
  char v12;
  char v13;
  uint64_t v14;
  int v15;

  v6 = *((_QWORD *)a4 + 1);
  v7 = *(unsigned __int8 *)(v6 + 30);
  Tag = GPBWireFormatMakeTag(*(_DWORD *)(v6 + 16), 2);
  v9 = 0;
  v10 = 0;
  values = self->_values;
  v12 = 1;
  do
  {
    v13 = v12;
    if (values[v10])
    {
      objc_msgSend(a3, "writeInt32NoTag:", Tag);
      v14 = v9 & 1;
      v15 = GPBComputeBoolSize(1);
      objc_msgSend(a3, "writeInt32NoTag:", sub_10029D150(values[v10], v7) + v15);
      objc_msgSend(a3, "writeBool:value:", 1, v14);
      sub_10029D360(a3, (uint64_t)values[v10], v7);
    }
    v12 = 0;
    v9 = 1;
    v10 = 1;
  }
  while ((v13 & 1) != 0);
}

- (void)addEntriesFromDictionary:(id)a3
{
  uint64_t v4;
  char *v5;
  id *values;
  char v7;
  char v8;
  GPBMessage *autocreator;

  if (a3)
  {
    v4 = 0;
    v5 = (char *)a3 + 16;
    values = self->_values;
    v7 = 1;
    do
    {
      v8 = v7;
      if (*(_QWORD *)&v5[8 * v4])
      {

        values[v4] = *(id *)&v5[8 * v4];
      }
      v7 = 0;
      v4 = 1;
    }
    while ((v8 & 1) != 0);
    autocreator = self->_autocreator;
    if (autocreator)
      GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)setObject:(id)a3 forKey:(BOOL)a4
{
  _BOOL4 v4;
  id *v7;
  GPBMessage *autocreator;

  v4 = a4;
  if (!a3)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Attempting to add nil object to a Dictionary"));
  v7 = (id *)(&self->super.isa + v4);

  v7[2] = a3;
  autocreator = self->_autocreator;
  if (autocreator)
    GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
}

- (void)removeObjectForKey:(BOOL)a3
{
  id *v3;

  v3 = (id *)(&self->super.isa + a3);

  v3[2] = 0;
}

- (void)removeAll
{

  self->_values[0] = 0;
  self->_values[1] = 0;
}

@end
