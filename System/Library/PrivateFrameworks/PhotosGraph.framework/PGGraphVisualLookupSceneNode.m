@implementation PGGraphVisualLookupSceneNode

- (PGGraphVisualLookupSceneNode)initWithSceneIdentifier:(unint64_t)a3 name:(id)a4 sceneDomain:(unsigned __int8)a5 isSensitive:(BOOL)a6
{
  id v11;
  PGGraphVisualLookupSceneNode *v12;
  PGGraphVisualLookupSceneNode *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PGGraphVisualLookupSceneNode;
  v12 = -[PGGraphNode init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_label, a4);
    v13->_sceneIdentifier = a3;
    v13->_sceneDomain = a5;
    v13->_isSensitive = a6;
  }

  return v13;
}

- (PGGraphVisualLookupSceneNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  uint64_t v14;
  PGGraphVisualLookupSceneNode *v15;

  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sceneIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sceneDomain"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isSensitive"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "BOOLValue");
  v15 = -[PGGraphVisualLookupSceneNode initWithSceneIdentifier:name:sceneDomain:isSensitive:](self, "initWithSceneIdentifier:name:sceneDomain:isSensitive:", v10, v8, v12, v14);

  return v15;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sceneIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "unsignedIntegerValue") != self->_sceneIdentifier)
      goto LABEL_11;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isSensitive"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      if (self->_isSensitive != objc_msgSend(v8, "BOOLValue"))
        goto LABEL_11;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sceneDomain"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9 && objc_msgSend(v9, "unsignedIntegerValue") != self->_sceneDomain)
LABEL_11:
      v10 = 0;
    else
      v10 = 1;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)propertyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("sceneIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_sceneIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("isSensitive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSensitive);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("sceneDomain");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_sceneDomain);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  const __CFString *v2;

  if (self->_isSensitive)
    v2 = CFSTR("Sensitive");
  else
    v2 = CFSTR("NotSensitive");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGGraphVisualLookupSceneNode (%@, %d, %@)"), self->_label, self->_sceneDomain, v2);
}

- (NSString)name
{
  return -[NSString lowercaseString](self->_label, "lowercaseString");
}

- (BOOL)isSensitive
{
  return self->_isSensitive;
}

- (unint64_t)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (unsigned)sceneDomain
{
  return self->_sceneDomain;
}

- (unsigned)domain
{
  return 602;
}

- (PGGraphVisualLookupSceneNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphVisualLookupSceneNodeCollection alloc], "initWithNode:", self);
}

- (id)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, 602);
}

@end
