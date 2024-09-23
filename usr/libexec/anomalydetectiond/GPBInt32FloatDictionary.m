@implementation GPBInt32FloatDictionary

- (GPBInt32FloatDictionary)init
{
  return -[GPBInt32FloatDictionary initWithFloats:forKeys:count:](self, "initWithFloats:forKeys:count:", 0, 0, 0);
}

- (GPBInt32FloatDictionary)initWithFloats:(const float *)a3 forKeys:(const int *)a4 count:(unint64_t)a5
{
  GPBInt32FloatDictionary *v8;
  double v9;
  NSMutableDictionary *dictionary;
  int v11;
  NSNumber *v12;
  unsigned int v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GPBInt32FloatDictionary;
  v8 = -[GPBInt32FloatDictionary init](&v15, "init");
  if (v8)
  {
    v8->_dictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (a4)
    {
      if (a3 && a5)
      {
        do
        {
          dictionary = v8->_dictionary;
          v11 = *(_DWORD *)a3++;
          LODWORD(v9) = v11;
          v12 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9);
          v13 = *a4++;
          -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v12, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v13));
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (GPBInt32FloatDictionary)initWithDictionary:(id)a3
{
  GPBInt32FloatDictionary *v4;
  GPBInt32FloatDictionary *v5;

  v4 = -[GPBInt32FloatDictionary initWithFloats:forKeys:count:](self, "initWithFloats:forKeys:count:", 0, 0, 0);
  v5 = v4;
  if (a3 && v4)
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
  return v5;
}

- (GPBInt32FloatDictionary)initWithCapacity:(unint64_t)a3
{
  return -[GPBInt32FloatDictionary initWithFloats:forKeys:count:](self, "initWithFloats:forKeys:count:", 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_autocreator)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBDictionary.m"), 4143, CFSTR("%@: Autocreator must be cleared before release, autocreator: %@"), objc_opt_class(self), self->_autocreator);

  v3.receiver = self;
  v3.super_class = (Class)GPBInt32FloatDictionary;
  -[GPBInt32FloatDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[GPBInt32FloatDictionary initWithDictionary:](+[GPBInt32FloatDictionary allocWithZone:](GPBInt32FloatDictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(GPBInt32FloatDictionary);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
    return -[NSMutableDictionary isEqual:](self->_dictionary, "isEqual:", *((_QWORD *)a3 + 2));
  else
    return 0;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSMutableDictionary count](self->_dictionary, "count");
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p> { %@ }"), objc_opt_class(self), self, self->_dictionary);
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableDictionary count](self->_dictionary, "count");
}

- (void)enumerateKeysAndFloatsUsingBlock:(id)a3
{
  NSMutableDictionary *dictionary;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  char v10;

  v10 = 0;
  dictionary = self->_dictionary;
  v5 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  do
  {
    v6 = objc_msgSend(v5, "nextObject");
    if (!v6)
      break;
    v7 = v6;
    v8 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6);
    v9 = objc_msgSend(v7, "intValue");
    objc_msgSend(v8, "floatValue");
    (*((void (**)(id, id, char *))a3 + 2))(a3, v9, &v10);
  }
  while (!v10);
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  NSMutableDictionary *dictionary;
  unint64_t result;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  dictionary = self->_dictionary;
  result = (unint64_t)-[NSMutableDictionary count](dictionary, "count");
  if (result)
  {
    v6 = result;
    v7 = *(unsigned __int8 *)(*((_QWORD *)a3 + 1) + 30);
    v8 = objc_msgSend(a3, "mapKeyDataType");
    v9 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
    v10 = objc_msgSend(v9, "nextObject");
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      do
      {
        v13 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v11);
        v14 = sub_10029E810(objc_msgSend(v11, "intValue"), 1, v8);
        objc_msgSend(v13, "floatValue");
        v15 = sub_1002A0DD4(v7) + v14;
        v12 += v15 + GPBComputeRawVarint32SizeForInteger(v15);
        v11 = objc_msgSend(v9, "nextObject");
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }
    return v12 + GPBComputeWireFormatTagSize(*(_DWORD *)(*((_QWORD *)a3 + 1) + 16), 15) * v6;
  }
  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  unsigned int v7;
  unsigned int v8;
  uint64_t Tag;
  NSMutableDictionary *dictionary;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  int v17;
  double v18;

  v7 = *(unsigned __int8 *)(*((_QWORD *)a4 + 1) + 30);
  v8 = objc_msgSend(a4, "mapKeyDataType");
  Tag = GPBWireFormatMakeTag(*(_DWORD *)(*((_QWORD *)a4 + 1) + 16), 2);
  dictionary = self->_dictionary;
  v11 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  v12 = objc_msgSend(v11, "nextObject");
  if (v12)
  {
    v13 = v12;
    do
    {
      v14 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v13);
      objc_msgSend(a3, "writeInt32NoTag:", Tag);
      v15 = objc_msgSend(v13, "intValue");
      objc_msgSend(v14, "floatValue");
      v17 = v16;
      LODWORD(v14) = sub_10029E810(v15, 1, v8);
      objc_msgSend(a3, "writeInt32NoTag:", sub_1002A0DD4(v7) + v14);
      sub_10029EA1C(a3, (uint64_t)v15, 1, v8);
      LODWORD(v18) = v17;
      sub_1002A0F90(a3, v7, v18);
      v13 = objc_msgSend(v11, "nextObject");
    }
    while (v13);
  }
}

- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4
{
  double v4;

  LODWORD(v4) = a3->var1;
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a4->var3));
}

- (void)enumerateForTextFormat:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002A5F7C;
  v3[3] = &unk_100364FD8;
  v3[4] = a3;
  -[GPBInt32FloatDictionary enumerateKeysAndFloatsUsingBlock:](self, "enumerateKeysAndFloatsUsingBlock:", v3);
}

- (BOOL)getFloat:(float *)a3 forKey:(int)a4
{
  id v5;
  id v6;
  int v7;

  v5 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a4));
  v6 = v5;
  if (a3 && v5)
  {
    objc_msgSend(v5, "floatValue");
    *(_DWORD *)a3 = v7;
  }
  return v6 != 0;
}

- (void)addEntriesFromDictionary:(id)a3
{
  GPBMessage *autocreator;

  if (a3)
  {
    -[NSMutableDictionary addEntriesFromDictionary:](self->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
    autocreator = self->_autocreator;
    if (autocreator)
      GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)setFloat:(float)a3 forKey:(int)a4
{
  GPBMessage *autocreator;

  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a4));
  autocreator = self->_autocreator;
  if (autocreator)
    GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
}

- (void)removeFloatForKey:(int)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a3));
}

- (void)removeAll
{
  -[NSMutableDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
}

@end
