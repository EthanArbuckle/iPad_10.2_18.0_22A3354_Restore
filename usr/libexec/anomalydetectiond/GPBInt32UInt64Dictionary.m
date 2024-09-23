@implementation GPBInt32UInt64Dictionary

- (GPBInt32UInt64Dictionary)init
{
  return -[GPBInt32UInt64Dictionary initWithUInt64s:forKeys:count:](self, "initWithUInt64s:forKeys:count:", 0, 0, 0);
}

- (GPBInt32UInt64Dictionary)initWithUInt64s:(const unint64_t *)a3 forKeys:(const int *)a4 count:(unint64_t)a5
{
  GPBInt32UInt64Dictionary *v8;
  NSMutableDictionary *dictionary;
  uint64_t v10;
  NSNumber *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)GPBInt32UInt64Dictionary;
  v8 = -[GPBInt32UInt64Dictionary init](&v13, "init");
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
          v10 = *a3++;
          v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v10);
          LODWORD(v10) = *a4++;
          -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v11, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10));
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (GPBInt32UInt64Dictionary)initWithDictionary:(id)a3
{
  GPBInt32UInt64Dictionary *v4;
  GPBInt32UInt64Dictionary *v5;

  v4 = -[GPBInt32UInt64Dictionary initWithUInt64s:forKeys:count:](self, "initWithUInt64s:forKeys:count:", 0, 0, 0);
  v5 = v4;
  if (a3 && v4)
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
  return v5;
}

- (GPBInt32UInt64Dictionary)initWithCapacity:(unint64_t)a3
{
  return -[GPBInt32UInt64Dictionary initWithUInt64s:forKeys:count:](self, "initWithUInt64s:forKeys:count:", 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_autocreator)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBDictionary.m"), 3594, CFSTR("%@: Autocreator must be cleared before release, autocreator: %@"), objc_opt_class(self), self->_autocreator);

  v3.receiver = self;
  v3.super_class = (Class)GPBInt32UInt64Dictionary;
  -[GPBInt32UInt64Dictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[GPBInt32UInt64Dictionary initWithDictionary:](+[GPBInt32UInt64Dictionary allocWithZone:](GPBInt32UInt64Dictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(GPBInt32UInt64Dictionary);
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

- (void)enumerateKeysAndUInt64sUsingBlock:(id)a3
{
  NSMutableDictionary *dictionary;
  id v5;
  id v6;
  char v7;

  v7 = 0;
  dictionary = self->_dictionary;
  v5 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  do
  {
    v6 = objc_msgSend(v5, "nextObject");
    if (!v6)
      break;
    (*((void (**)(id, id, id, char *))a3 + 2))(a3, objc_msgSend(v6, "intValue"), objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "unsignedLongLongValue"), &v7);
  }
  while (!v7);
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
        v15 = sub_10029F1B0((unint64_t)objc_msgSend(v13, "unsignedLongLongValue"), 2, v7) + v14;
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
  id v16;
  int v17;

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
      v16 = objc_msgSend(v14, "unsignedLongLongValue");
      v17 = sub_10029E810(v15, 1, v8);
      objc_msgSend(a3, "writeInt32NoTag:", sub_10029F1B0((unint64_t)v16, 2, v7) + v17);
      sub_10029EA1C(a3, (uint64_t)v15, 1, v8);
      sub_10029F39C(a3, (uint64_t)v16, 2, v7);
      v13 = objc_msgSend(v11, "nextObject");
    }
    while (v13);
  }
}

- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3->var2), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a4->var3));
}

- (void)enumerateForTextFormat:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002A478C;
  v3[3] = &unk_100364F60;
  v3[4] = a3;
  -[GPBInt32UInt64Dictionary enumerateKeysAndUInt64sUsingBlock:](self, "enumerateKeysAndUInt64sUsingBlock:", v3);
}

- (BOOL)getUInt64:(unint64_t *)a3 forKey:(int)a4
{
  id v5;
  id v6;

  v5 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a4));
  v6 = v5;
  if (a3 && v5)
    *a3 = (unint64_t)objc_msgSend(v5, "unsignedLongLongValue");
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

- (void)setUInt64:(unint64_t)a3 forKey:(int)a4
{
  GPBMessage *autocreator;

  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a4));
  autocreator = self->_autocreator;
  if (autocreator)
    GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
}

- (void)removeUInt64ForKey:(int)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a3));
}

- (void)removeAll
{
  -[NSMutableDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
}

@end
