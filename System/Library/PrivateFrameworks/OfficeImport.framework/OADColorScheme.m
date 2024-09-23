@implementation OADColorScheme

- (OADColorScheme)init
{
  OADColorScheme *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mColors;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADColorScheme;
  v2 = -[OADColorScheme init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mColors = v2->mColors;
    v2->mColors = v3;

  }
  return v2;
}

- (void)addColor:(id)a3 index:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", v4);
  -[NSMutableDictionary setObject:forKey:](self->mColors, "setObject:forKey:", v7, v6);

}

- (id)colorForIndex:(int)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", *(_QWORD *)&a3);
  -[NSMutableDictionary objectForKey:](self->mColors, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)colorCount
{
  return -[NSMutableDictionary count](self->mColors, "count");
}

- (id)copyWithZone:(_NSZone *)a3
{
  OADColorScheme *v4;

  v4 = objc_alloc_init(OADColorScheme);
  -[NSMutableDictionary setDictionary:](v4->mColors, "setDictionary:", self->mColors);
  return v4;
}

- (void)setColor:(id)a3 index:(int)a4
{
  uint64_t v4;
  NSMutableDictionary *mColors;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v8 = a3;
  mColors = self->mColors;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mColors, "setObject:forKey:", v8, v7);

}

- (BOOL)isEmpty
{
  return -[NSMutableDictionary count](self->mColors, "count") == 0;
}

- (void)validateColorScheme
{
  id *v3;
  id v4;
  xmlDoc *v5;
  xmlNodePtr v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (id *)objc_opt_new();
  +[TCXmlUtilities bundlePathForXmlResource:](TCXmlUtilities, "bundlePathForXmlResource:", CFSTR("DefaultColorScheme"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (xmlDoc *)sfaxmlParseFile(objc_msgSend(v4, "fileSystemRepresentation"));
  v6 = OCXGetRootElement(v5);
  if (v6)
  {
    +[OAXColorScheme readFromXmlNode:toColorScheme:](OAXColorScheme, "readFromXmlNode:toColorScheme:", v6, v3);
    xmlFreeDoc(v5);
    -[OADColorScheme name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (!v8)
    {
      objc_msgSend(v3, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADColorScheme setName:](self, "setName:", v9);

    }
    v10 = v3[2];
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->mColors, "objectForKeyedSubscript:", v15, (_QWORD)v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16 == 0;

          if (v17)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->mColors, "setObject:forKeyedSubscript:", v18, v15);

          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

  }
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    v5 = -[NSMutableDictionary isEqualToDictionary:](self->mColors, "isEqualToDictionary:", v4[2]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->mName, "hash");
  return -[NSMutableDictionary count](self->mColors, "count") + (v3 << 8);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADColorScheme;
  -[OADColorScheme description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColors, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

@end
