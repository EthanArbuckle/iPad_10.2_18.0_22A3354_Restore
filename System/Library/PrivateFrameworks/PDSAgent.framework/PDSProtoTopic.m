@implementation PDSProtoTopic

- (void)clearAppInfos
{
  -[NSMutableArray removeAllObjects](self->_appInfos, "removeAllObjects");
}

- (void)addAppInfo:(id)a3
{
  id v4;
  NSMutableArray *appInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  appInfos = self->_appInfos;
  v8 = v4;
  if (!appInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_appInfos;
    self->_appInfos = v6;

    v4 = v8;
    appInfos = self->_appInfos;
  }
  -[NSMutableArray addObject:](appInfos, "addObject:", v4);

}

- (unint64_t)appInfosCount
{
  return -[NSMutableArray count](self->_appInfos, "count");
}

- (id)appInfoAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_appInfos, "objectAtIndex:", a3);
}

+ (Class)appInfoType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PDSProtoTopic;
  -[PDSProtoTopic description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSProtoTopic dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  NSString *qualifier;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  qualifier = self->_qualifier;
  if (qualifier)
    objc_msgSend(v4, "setObject:forKey:", qualifier, CFSTR("qualifier"));
  if (-[NSMutableArray count](self->_appInfos, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_appInfos, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = self->_appInfos;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("app_info"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PDSProtoTopicReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_name)
    -[PDSProtoTopic writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_qualifier)
    -[PDSProtoTopic writeTo:].cold.2();
  PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_appInfos;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setName:", self->_name);
  objc_msgSend(v8, "setQualifier:", self->_qualifier);
  if (-[PDSProtoTopic appInfosCount](self, "appInfosCount"))
  {
    objc_msgSend(v8, "clearAppInfos");
    v4 = -[PDSProtoTopic appInfosCount](self, "appInfosCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[PDSProtoTopic appInfoAtIndex:](self, "appInfoAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAppInfo:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_qualifier, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_appInfos;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addAppInfo:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  NSString *qualifier;
  NSMutableArray *appInfos;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((name = self->_name, !((unint64_t)name | v4[2])) || -[NSString isEqual:](name, "isEqual:"))
    && ((qualifier = self->_qualifier, !((unint64_t)qualifier | v4[3]))
     || -[NSString isEqual:](qualifier, "isEqual:")))
  {
    appInfos = self->_appInfos;
    if ((unint64_t)appInfos | v4[1])
      v8 = -[NSMutableArray isEqual:](appInfos, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_qualifier, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_appInfos, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[PDSProtoTopic setName:](self, "setName:");
  if (*((_QWORD *)v4 + 3))
    -[PDSProtoTopic setQualifier:](self, "setQualifier:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[PDSProtoTopic addAppInfo:](self, "addAppInfo:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)qualifier
{
  return self->_qualifier;
}

- (void)setQualifier:(id)a3
{
  objc_storeStrong((id *)&self->_qualifier, a3);
}

- (NSMutableArray)appInfos
{
  return self->_appInfos;
}

- (void)setAppInfos:(id)a3
{
  objc_storeStrong((id *)&self->_appInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_appInfos, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[PDSProtoTopic writeTo:]", "PDSProtoTopic.m", 137, "nil != self->_name");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[PDSProtoTopic writeTo:]", "PDSProtoTopic.m", 142, "nil != self->_qualifier");
}

@end
