@implementation SBFPhysicalButtonSceneTarget

- (id)buttonTargetForButton:(unint64_t)a3
{
  NSMutableDictionary *targetsByButton;
  void *v4;
  void *v5;

  targetsByButton = self->_targetsByButton;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](targetsByButton, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (FBScene)scene
{
  return (FBScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[FBSSceneIdentity identifier](self->_sceneIdentity, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableDictionary count](self->_targetsByButton, "count"))
  {
    -[NSMutableDictionary allValues](self->_targetsByButton, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (%@)"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  else
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(" (empty)"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_initWithScene:(void *)a3 sceneIdentity:(void *)a4 targetsByButton:
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id v11;
  id v12;
  objc_super v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)SBFPhysicalButtonSceneTarget;
    v10 = (id *)objc_msgSendSuper2(&v14, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeWeak(v10 + 2, v7);
      objc_storeStrong(a1 + 3, a3);
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = a1[1];
      a1[1] = v11;

    }
  }

  return a1;
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_targetsByButton, "count");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SBFMutablePhysicalButtonSceneTarget *v4;
  id WeakRetained;
  FBSSceneIdentity *sceneIdentity;
  void *v7;
  id *v8;

  v4 = [SBFMutablePhysicalButtonSceneTarget alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  sceneIdentity = self->_sceneIdentity;
  v7 = (void *)-[NSMutableDictionary mutableCopy](self->_targetsByButton, "mutableCopy");
  v8 = -[SBFPhysicalButtonSceneTarget _initWithScene:sceneIdentity:targetsByButton:]((id *)&v4->super.super.isa, WeakRetained, sceneIdentity, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SBFPhysicalButtonSceneTarget *v4;
  void *v5;
  char isKindOfClass;
  id *v7;
  id WeakRetained;
  id v9;
  int v10;
  char v11;

  v4 = (SBFPhysicalButtonSceneTarget *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
      v9 = objc_loadWeakRetained(v7 + 2);
      v10 = BSEqualObjects();

      if (v10 && BSEqualObjects())
        v11 = BSEqualDictionaries();
      else
        v11 = 0;

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v4 = objc_msgSend(WeakRetained, "hash");
  v5 = -[FBSSceneIdentity hash](self->_sceneIdentity, "hash") ^ v4;
  v6 = v5 ^ -[NSMutableDictionary hash](self->_targetsByButton, "hash");

  return v6;
}

- (FBSSceneIdentity)sceneIdentity
{
  return self->_sceneIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentity, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_targetsByButton, 0);
}

@end
