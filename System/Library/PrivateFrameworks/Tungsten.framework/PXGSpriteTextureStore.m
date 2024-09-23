@implementation PXGSpriteTextureStore

- (PXGSpriteTextureStore)init
{
  PXGSpriteTextureStore *v2;
  uint64_t i;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXGSpriteTextureStore;
  v2 = -[PXGSpriteTextureStore init](&v7, sel_init);
  if (v2)
  {
    for (i = 8; i != 32; i += 8)
    {
      objc_msgSend(MEMORY[0x24BDD1650], "weakToWeakObjectsMapTable");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(Class *)((char *)&v2->super.isa + i);
      *(Class *)((char *)&v2->super.isa + i) = (Class)v4;

    }
  }
  return v2;
}

- (id)storedTextureForTexture:(id)a3 key:(id)a4 presentationType:(unsigned __int8)a5 policy:(unsigned __int8)a6
{
  int v6;
  uint64_t v7;
  id v10;
  id v11;
  id v12;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  if (v6
    || (-[PXGSpriteTextureStore textureForKey:presentationType:](self, "textureForKey:presentationType:", v11, v7),
        (v12 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[PXGSpriteTextureStore storeTexture:forKey:presentationType:](self, "storeTexture:forKey:presentationType:", v10, v11, v7);
    v12 = v10;
  }

  return v12;
}

- (id)textureForKey:(id)a3 presentationType:(unsigned __int8)a4
{
  return -[NSMapTable objectForKey:](self->_textureByKeyByPresentationType[a4], "objectForKey:", a3);
}

- (void)storeTexture:(id)a3 forKey:(id)a4 presentationType:(unsigned __int8)a5
{
  -[NSMapTable setObject:forKey:](self->_textureByKeyByPresentationType[a5], "setObject:forKey:", a3, a4);
}

- (void)enumerateTexturesWithHandler:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  unint64_t v5;
  NSMapTable **textureByKeyByPresentationType;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v5 = 0;
  v16 = 0;
  textureByKeyByPresentationType = self->_textureByKeyByPresentationType;
  do
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSMapTable objectEnumerator](textureByKeyByPresentationType[v5], "objectEnumerator", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11), &v16);
        if (v16)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

    if (v5 > 1)
      break;
    ++v5;
  }
  while (!v16);

}

- (void)removeAllTexturesForPresentationType:(unsigned __int8)a3
{
  -[NSMapTable removeAllObjects](self->_textureByKeyByPresentationType[a3], "removeAllObjects");
}

- (void).cxx_destruct
{
  uint64_t v3;

  v3 = 24;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end
