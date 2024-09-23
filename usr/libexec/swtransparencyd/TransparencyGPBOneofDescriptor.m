@implementation TransparencyGPBOneofDescriptor

- (TransparencyGPBOneofDescriptor)initWithName:(const char *)a3 fields:(id)a4
{
  TransparencyGPBOneofDescriptor *v6;
  TransparencyGPBOneofDescriptor *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];

  v17.receiver = self;
  v17.super_class = (Class)TransparencyGPBOneofDescriptor;
  v6 = -[TransparencyGPBOneofDescriptor init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    v6->name_ = a3;
    v6->fields_ = (NSArray *)a4;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(a4);
          *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i) + 16) = v7;
        }
        v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v9);
    }
    v7->caseSel_ = sub_1000A21FC(0, (char *)a3, "OneOfCase", 0);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBOneofDescriptor;
  -[TransparencyGPBOneofDescriptor dealloc](&v3, "dealloc");
}

- (NSString)name
{
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", self->name_);
}

- (id)fieldWithNumber:(unsigned int)a3
{
  NSArray *fields;
  id result;
  id v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  fields = self->fields_;
  result = -[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v10;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v7)
        objc_enumerationMutation(fields);
      result = *(id *)(*((_QWORD *)&v9 + 1) + 8 * v8);
      if (*(_DWORD *)(*((_QWORD *)result + 1) + 16) == a3)
        break;
      if (v6 == (id)++v8)
      {
        result = -[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        v6 = result;
        if (result)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

- (id)fieldWithName:(id)a3
{
  NSArray *fields;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  fields = self->fields_;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(fields);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend(objc_msgSend(v9, "name"), "isEqual:", a3) & 1) != 0)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (NSArray)fields
{
  return self->fields_;
}

@end
