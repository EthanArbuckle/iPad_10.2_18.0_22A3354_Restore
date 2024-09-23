@implementation VKResourceManager

id __45__VKResourceManager_dataForResourceWithName___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_localNameForResourceName:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_localNameForResourceName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@%lux"), 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_%lux"), 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@%lux"), 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_%lux"), 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringByAppendingPathExtension:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)dataForResourceWithName:(id)a3
{
  id v4;
  void *v5;
  NSBundle *vkBundle;
  void *v7;
  _QWORD v9[5];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D27410], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  vkBundle = self->_vkBundle;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__VKResourceManager_dataForResourceWithName___block_invoke;
  v9[3] = &unk_1E42F38D8;
  v9[4] = self;
  objc_msgSend(v5, "dataForResourceWithName:fallbackBundle:fallbackNameHandler:", v4, vkBundle, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (VKResourceManager)init
{
  VKResourceManager *v2;
  uint64_t v3;
  NSBundle *vkBundle;
  VKResourceManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKResourceManager;
  v2 = -[VKResourceManager init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.VectorKit"));
    v3 = objc_claimAutoreleasedReturnValue();
    vkBundle = v2->_vkBundle;
    v2->_vkBundle = (NSBundle *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)dataForResourceWithName:(id)a3 fallbackNameHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D27410], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataForResourceWithName:fallbackBundle:fallbackNameHandler:", v6, self->_vkBundle, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isDevResourceWithName:(id)a3
{
  id v4;
  void *v5;
  NSBundle *vkBundle;
  _QWORD v8[5];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D27410], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  vkBundle = self->_vkBundle;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__VKResourceManager_isDevResourceWithName___block_invoke;
  v8[3] = &unk_1E42F38D8;
  v8[4] = self;
  LOBYTE(self) = objc_msgSend(v5, "isDevResourceWithName:fallbackBundle:fallbackNameHandler:", v4, vkBundle, v8);

  return (char)self;
}

- (id)pathForResourceWithName:(id)a3
{
  id v4;
  void *v5;
  NSBundle *vkBundle;
  void *v7;
  _QWORD v9[5];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D27410], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  vkBundle = self->_vkBundle;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__VKResourceManager_pathForResourceWithName___block_invoke;
  v9[3] = &unk_1E42F38D8;
  v9[4] = self;
  objc_msgSend(v5, "pathForResourceWithName:fallbackBundle:fallbackNameHandler:", v4, vkBundle, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vkBundle, 0);
}

id __43__VKResourceManager_isDevResourceWithName___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_localNameForResourceName:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __45__VKResourceManager_pathForResourceWithName___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_localNameForResourceName:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
