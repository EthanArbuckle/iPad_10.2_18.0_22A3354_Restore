@implementation OAXTableStyleCache

- (OAXTableStyleCache)init
{
  OAXTableStyleCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OAXTableStyleCache;
  v2 = -[OAXTableStyleCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mCache = v2->mCache;
    v2->mCache = v3;

  }
  return v2;
}

- (void)setDefaultStyleId:(id)a3
{
  objc_storeStrong((id *)&self->mDefaultStyleId, a3);
}

- (_xmlNode)defaultStyleNode
{
  return -[OAXTableStyleCache styleNodeForId:](self, "styleNodeForId:", self->mDefaultStyleId);
}

- (_xmlNode)styleNodeForId:(id)a3
{
  id v4;
  void *v5;
  _xmlNode *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  _xmlDoc *v10;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->mCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_xmlNode *)objc_msgSend(v5, "pointerValue");

  if (!v6)
  {
    +[TCBundleResourceManager instance](TCBundleResourceManager, "instance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "length");
    if (v8 < 2)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v4, "substringWithRange:", 1, v8 - 2);
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = (_xmlDoc *)objc_msgSend(v7, "xmlDocumentForResource:ofType:inPackage:", v9, CFSTR("xml"), CFSTR("DefaultTableStyles"));
      if (v10)
        v6 = OCXGetRootElement(v10);
      else
        v6 = 0;
      v4 = (id)v9;
    }

  }
  return v6;
}

- (void)setStyleNode:(_xmlNode *)a3 forId:(id)a4
{
  NSMutableDictionary *mCache;
  void *v7;
  id v8;

  v8 = a4;
  mCache = self->mCache;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mCache, "setObject:forKey:", v7, v8);

}

- (void)setStylesPart:(id)a3
{
  objc_storeStrong((id *)&self->mStylesPart, a3);
}

- (id)defaultStyleId
{
  return self->mDefaultStyleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCache, 0);
  objc_storeStrong((id *)&self->mDefaultStyleId, 0);
  objc_storeStrong((id *)&self->mStylesPart, 0);
}

@end
