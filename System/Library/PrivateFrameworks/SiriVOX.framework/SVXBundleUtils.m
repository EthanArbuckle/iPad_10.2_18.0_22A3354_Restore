@implementation SVXBundleUtils

- (SVXBundleUtils)init
{
  void *v3;
  SVXBundleUtils *v4;

  objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SVXBundleUtils initWithLocalization:](self, "initWithLocalization:", v3);

  return v4;
}

- (SVXBundleUtils)initWithLocalization:(id)a3
{
  id v5;
  SVXBundleUtils *v6;
  SVXBundleUtils *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXBundleUtils;
  v6 = -[SVXBundleUtils init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_afLocalization, a3);

  return v7;
}

- (id)getSiriVOXFramework
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SVXBundleUtils_getSiriVOXFramework__block_invoke;
  block[3] = &unk_24D24EFF0;
  block[4] = self;
  if (getSiriVOXFramework_onceToken != -1)
    dispatch_once(&getSiriVOXFramework_onceToken, block);
  return (id)getSiriVOXFramework_bundle;
}

- (id)getLocalizedStringWithBundle:(id)a3 table:(id)a4 key:(id)a5 languageCode:(id)a6 gender:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  AFLocalization *afLocalization;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  AFLocalization *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    afLocalization = self->_afLocalization;
    if (v11)
    {
      -[AFLocalization localizedStringForKey:gender:table:bundle:languageCode:](self->_afLocalization, "localizedStringForKey:gender:table:bundle:languageCode:", v13, a7, v12, v11, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SVXBundleUtils getSiriVOXFramework](self, "getSiriVOXFramework");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFLocalization localizedStringForKey:gender:table:bundle:languageCode:](afLocalization, "localizedStringForKey:gender:table:bundle:languageCode:", v13, a7, v12, v30, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    if (!v11)
      goto LABEL_6;
    objc_msgSend(v11, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXBundleUtils getSiriVOXFramework](self, "getSiriVOXFramework");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "isEqualToString:", v19);

    if (!v20)
    {
      -[AFLocalization localizedStringForKey:gender:table:bundle:languageCode:](self->_afLocalization, "localizedStringForKey:gender:table:bundle:languageCode:", v13, a7, 0, v11, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
    }
    else
    {
LABEL_6:
      v21 = v14;
      v22 = v13;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      SVXLocalizationGetAllTables();
      obj = (id)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v36 != v25)
              objc_enumerationMutation(obj);
            v27 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
            v28 = self->_afLocalization;
            if (v11)
            {
              -[AFLocalization localizedStringForKey:gender:table:bundle:languageCode:](self->_afLocalization, "localizedStringForKey:gender:table:bundle:languageCode:", v22, a7, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i), v11, v21);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
                goto LABEL_18;
            }
            else
            {
              -[SVXBundleUtils getSiriVOXFramework](self, "getSiriVOXFramework");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[AFLocalization localizedStringForKey:gender:table:bundle:languageCode:](v28, "localizedStringForKey:gender:table:bundle:languageCode:", v22, a7, v27, v29, v21);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
                goto LABEL_18;
            }
          }
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v24);
      }
      v16 = 0;
LABEL_18:

      v12 = 0;
      v13 = v22;
      v14 = v21;
    }
  }
  objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\ESC"), CFSTR("\x1B"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)_getSystemFrameworkWithName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.%@"), v3);
  objc_msgSend(v4, "bundleWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x24BDD1488];
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("/System/Library/PrivateFrameworks/%@.framework"), v3);
    objc_msgSend(v7, "bundleWithPath:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v9 = (void *)MEMORY[0x24BDD1488];
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("/System/Library/Frameworks/%@.framework"), v3);
      objc_msgSend(v9, "bundleWithPath:", v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_afLocalization, 0);
}

void __37__SVXBundleUtils_getSiriVOXFramework__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_getSystemFrameworkWithName:", CFSTR("SiriVOX"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)getSiriVOXFramework_bundle;
  getSiriVOXFramework_bundle = v1;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_8659);
  return (id)sharedInstance_singleton;
}

void __32__SVXBundleUtils_sharedInstance__block_invoke()
{
  SVXBundleUtils *v0;
  void *v1;

  v0 = objc_alloc_init(SVXBundleUtils);
  v1 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v0;

}

@end
