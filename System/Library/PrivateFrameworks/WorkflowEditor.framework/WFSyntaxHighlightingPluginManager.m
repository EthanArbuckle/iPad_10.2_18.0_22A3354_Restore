@implementation WFSyntaxHighlightingPluginManager

- (id)configurationFilesForAppearance:(unint64_t)a3
{
  if (a3 == 1)
    return &unk_24EE46B40;
  else
    return &unk_24EE46B68;
}

- (WFSyntaxHighlightingPluginManager)init
{
  WFSyntaxHighlightingPluginManager *v2;
  WFSyntaxHighlightingPluginManager *v3;
  uint64_t v4;
  NSMutableArray *tokenLines;
  id v6;
  id v7;
  uint64_t v8;
  JSContext *context;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  WFSyntaxHighlightingPluginManager *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WFSyntaxHighlightingPluginManager;
  v2 = -[WFSyntaxHighlightingPluginManager init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_syntaxHighlightingType = xmmword_2268A2A30;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    tokenLines = v3->_tokenLines;
    v3->_tokenLines = (NSMutableArray *)v4;

    v3->_minimumChangedLine = -1;
    v6 = objc_alloc(MEMORY[0x24BDDA720]);
    v7 = objc_alloc_init(MEMORY[0x24BDDA738]);
    v8 = objc_msgSend(v6, "initWithVirtualMachine:", v7);
    context = v3->_context;
    v3->_context = (JSContext *)v8;

    -[JSContext setObject:forKeyedSubscript:](v3->_context, "setObject:forKeyedSubscript:", v3, CFSTR("PluginAPI"));
    v10 = objc_opt_class();
    -[JSContext objectForKeyedSubscript:](v3->_context, "objectForKeyedSubscript:", CFSTR("PluginAPI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("Token"));

    objc_msgSend(MEMORY[0x24BDDA730], "valueWithNewObjectInContext:", v3->_context);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", *MEMORY[0x24BEBB368], CFSTR("color"));
    -[JSContext objectForKeyedSubscript:](v3->_context, "objectForKeyedSubscript:", CFSTR("PluginAPI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("AttributeNames"));

    -[JSContext setExceptionHandler:](v3->_context, "setExceptionHandler:", &__block_literal_global_3169);
    -[JSContext setObject:forKeyedSubscript:](v3->_context, "setObject:forKeyedSubscript:", &__block_literal_global_136, CFSTR("log"));
    -[WFSyntaxHighlightingPluginManager loadPlugins](v3, "loadPlugins");
    v14 = v3;

  }
  return v3;
}

- (void)dealloc
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[WFSyntaxHighlightingPluginManager unloadPlugins](self, "unloadPlugins");
  if (-[NSMutableArray count](self->_tokenLines, "count"))
  {
    v3 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_tokenLines, "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "count"))
      {
        v5 = 0;
        do
        {
          objc_msgSend(v4, "objectAtIndex:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          -[JSContext virtualMachine](self->_context, "virtualMachine");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "removeManagedReference:withOwner:", v6, self);

          ++v5;
        }
        while (v5 < objc_msgSend(v4, "count"));
      }

      ++v3;
    }
    while (v3 < -[NSMutableArray count](self->_tokenLines, "count"));
  }
  v8.receiver = self;
  v8.super_class = (Class)WFSyntaxHighlightingPluginManager;
  -[WFSyntaxHighlightingPluginManager dealloc](&v8, sel_dealloc);
}

- (void)setSyntaxHighlightingType:(unint64_t)a3
{
  if (self->_syntaxHighlightingType != a3)
  {
    self->_syntaxHighlightingType = a3;
    -[WFSyntaxHighlightingPluginManager reloadPlugins](self, "reloadPlugins");
  }
}

- (void)setSyntaxHighlightingAppearance:(unint64_t)a3
{
  if (self->_syntaxHighlightingAppearance != a3)
  {
    self->_syntaxHighlightingAppearance = a3;
    -[WFSyntaxHighlightingPluginManager reloadPlugins](self, "reloadPlugins");
  }
}

- (void)didAddLineAtIndex:(unint64_t)a3
{
  unint64_t v5;
  NSMutableArray *tokenLines;
  id v7;

  v5 = -[NSMutableArray count](self->_tokenLines, "count");
  tokenLines = self->_tokenLines;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 <= a3)
    -[NSMutableArray addObject:](tokenLines, "addObject:", v7);
  else
    -[NSMutableArray insertObject:atIndex:](tokenLines, "insertObject:atIndex:", v7, a3);

}

- (void)didRemoveLineAtIndex:(unint64_t)a3
{
  -[WFSyntaxHighlightingPluginManager discardManagedReferencesForLineNumber:](self, "discardManagedReferencesForLineNumber:");
  -[NSMutableArray removeObjectAtIndex:](self->_tokenLines, "removeObjectAtIndex:", a3);
}

- (BOOL)didChangeLine:(unint64_t)a3 string:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  char v28;
  uint64_t v30;
  void *v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (self->_minimumChangedLine > a3)
    self->_minimumChangedLine = a3;
  if (self->_maxChangedLine < a3)
    self->_maxChangedLine = a3;
  v7 = 0;
  v8 = a3 - 1;
  while ((v8 & 0x8000000000000000) == 0)
  {
    -[NSMutableArray objectAtIndex:](self->_tokenLines, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "lastObject");
    v10 = objc_claimAutoreleasedReturnValue();
    --v8;
    v7 = v9;
    if (v10)
    {
      v11 = (void *)v10;
      goto LABEL_10;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
LABEL_10:
  -[JSManagedValue value](self->_syntaxPlugin, "value", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("nextToken"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  for (i = 0; ; v11 = i)
  {
    v32[0] = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v16;
    v32[2] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "callWithArguments:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "toObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      break;
    v20 = objc_msgSend(v19, "range");
    objc_msgSend(v6, "substringWithRange:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setString:", v22);

    objc_msgSend(v13, "addObject:", v19);
    -[JSContext virtualMachine](self->_context, "virtualMachine");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addManagedReference:withOwner:", v19, self);

    LODWORD(v23) = objc_msgSend(v19, "start");
    v14 = objc_msgSend(v19, "length") + v23;
    i = v19;

  }
  -[NSMutableArray objectAtIndex:](self->_tokenLines, "objectAtIndex:", v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSyntaxHighlightingPluginManager discardManagedReferencesForLineNumber:](self, "discardManagedReferencesForLineNumber:", v30);
  -[NSMutableArray setObject:atIndexedSubscript:](self->_tokenLines, "setObject:atIndexedSubscript:", v13, v30);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == v26)
    {
      v28 = 0;
    }
    else if (!v25 || (v27 = objc_msgSend(v11, "overflows"), v27 == objc_msgSend(v25, "overflows")))
    {
      v28 = objc_msgSend(v11, "overflows");
    }
    else
    {
      v28 = 1;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (void)discardManagedReferencesForLineNumber:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[NSMutableArray objectAtIndex:](self->_tokenLines, "objectAtIndex:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[JSContext virtualMachine](self->_context, "virtualMachine");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeManagedReference:withOwner:", v5, self);

      ++v4;
    }
    while (v4 < objc_msgSend(v7, "count"));
  }

}

- (void)highlightAllTokensWithCallback:(id)a3
{
  void (**v4)(id, unint64_t, uint64_t, _QWORD, void *);
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  WFSyntaxHighlightingPluginManager *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, unint64_t, uint64_t, _QWORD, void *))a3;
  -[JSManagedValue value](self->_highlightingPlugin, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tokenAttributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSMutableArray count](self->_tokenLines, "count"))
  {
    v7 = 0;
    v16 = self;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_tokenLines, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        v9 = 0;
        do
        {
          objc_msgSend(v8, "objectAtIndex:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = v10;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "callWithArguments:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "toDictionary");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = objc_msgSend(v10, "range");
          v4[2](v4, v7, v14, v15, v13);

          ++v9;
        }
        while (v9 < objc_msgSend(v8, "count"));
      }
      ++v7;

      self = v16;
    }
    while (v7 < -[NSMutableArray count](v16->_tokenLines, "count"));
  }
  *(_OWORD *)&self->_minimumChangedLine = xmmword_2268AB390;

}

- (void)loadPlugins
{
  -[WFSyntaxHighlightingPluginManager loadSyntaxPlugin](self, "loadSyntaxPlugin");
  -[WFSyntaxHighlightingPluginManager loadColorSchemePlugin](self, "loadColorSchemePlugin");
  -[WFSyntaxHighlightingPluginManager loadHighlightingPlugin](self, "loadHighlightingPlugin");
}

- (void)reloadPlugins
{
  -[WFSyntaxHighlightingPluginManager unloadPlugins](self, "unloadPlugins");
  -[WFSyntaxHighlightingPluginManager loadPlugins](self, "loadPlugins");
}

- (void)unloadPlugins
{
  void *v3;
  void *v4;
  id v5;

  -[JSContext virtualMachine](self->_context, "virtualMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeManagedReference:withOwner:", self->_colorScheme, self);

  -[JSContext virtualMachine](self->_context, "virtualMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeManagedReference:withOwner:", self->_highlightingPlugin, self);

  -[JSContext virtualMachine](self->_context, "virtualMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeManagedReference:withOwner:", self->_syntaxPlugin, self);

}

- (id)loadPluginUsingConfigWithModuleName:(id)a3 module:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[WFSyntaxHighlightingPluginManager configurationFilesForAppearance:](self, "configurationFilesForAppearance:", -[WFSyntaxHighlightingPluginManager syntaxHighlightingAppearance](self, "syntaxHighlightingAppearance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByDeletingPathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathForResource:ofType:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v13, 4, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(function(%@) { %@ })"), v7, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[JSContext evaluateScript:](self->_context, "evaluateScript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDDA730], "valueWithNewObjectInContext:", self->_context);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v16, "callWithArguments:", v17);

  return v6;
}

- (void)loadColorSchemePlugin
{
  void *v3;
  JSManagedValue *v4;
  JSManagedValue *colorScheme;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDDA730], "valueWithNewObjectInContext:", self->_context);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &__block_literal_global_153, CFSTR("makeColor"));
  -[WFSyntaxHighlightingPluginManager loadPluginUsingConfigWithModuleName:module:](self, "loadPluginUsingConfigWithModuleName:module:", CFSTR("colorScheme"), v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDDA728], "managedValueWithValue:", v3);
    v4 = (JSManagedValue *)objc_claimAutoreleasedReturnValue();
    colorScheme = self->_colorScheme;
    self->_colorScheme = v4;

    -[JSContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", CFSTR("PluginAPI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, CFSTR("ColorScheme"));

  }
}

- (void)loadHighlightingPlugin
{
  void *v3;
  JSManagedValue *v4;
  JSManagedValue *highlightingPlugin;
  void *v6;
  void *v7;

  -[WFSyntaxHighlightingPluginManager loadPluginUsingConfigWithModuleName:module:](self, "loadPluginUsingConfigWithModuleName:module:", CFSTR("highlighting"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    objc_msgSend(MEMORY[0x24BDDA728], "managedValueWithValue:", v3);
    v4 = (JSManagedValue *)objc_claimAutoreleasedReturnValue();
    highlightingPlugin = self->_highlightingPlugin;
    self->_highlightingPlugin = v4;

    -[JSContext virtualMachine](self->_context, "virtualMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addManagedReference:withOwner:", self->_highlightingPlugin, self);

    v3 = v7;
  }

}

- (void)loadSyntaxPlugin
{
  void *v3;
  JSManagedValue *v4;
  JSManagedValue *syntaxPlugin;
  void *v6;
  void *v7;

  -[WFSyntaxHighlightingPluginManager loadPluginUsingConfigWithModuleName:module:](self, "loadPluginUsingConfigWithModuleName:module:", CFSTR("syntax"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    objc_msgSend(MEMORY[0x24BDDA728], "managedValueWithValue:", v3);
    v4 = (JSManagedValue *)objc_claimAutoreleasedReturnValue();
    syntaxPlugin = self->_syntaxPlugin;
    self->_syntaxPlugin = v4;

    -[JSContext virtualMachine](self->_context, "virtualMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addManagedReference:withOwner:", self->_syntaxPlugin, self);

    v3 = v7;
  }

}

- (UIColor)defaultBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[JSManagedValue value](self->_colorScheme, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("defaultBackgroundColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "toBool") & 1) != 0)
  {
    objc_msgSend(v3, "callWithArguments:", MEMORY[0x24BDBD1A8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIColor *)v5;
}

- (UIColor)defaultForegroundColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[JSManagedValue value](self->_colorScheme, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("defaultForegroundColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "toBool") & 1) != 0)
  {
    objc_msgSend(v3, "callWithArguments:", MEMORY[0x24BDBD1A8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIColor *)v5;
}

- (unint64_t)syntaxHighlightingType
{
  return self->_syntaxHighlightingType;
}

- (unint64_t)syntaxHighlightingAppearance
{
  return self->_syntaxHighlightingAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syntaxPlugin, 0);
  objc_storeStrong((id *)&self->_highlightingPlugin, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_tokenLines, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

id __58__WFSyntaxHighlightingPluginManager_loadColorSchemePlugin__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  float v15;
  void *v16;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("alpha"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_24EE469C8;
  objc_msgSend(v3, "floatValue");
  v6 = v5 / 255.0;

  v7 = (void *)MEMORY[0x24BEBD4B8];
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("red"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = (float)(v9 / 255.0);
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("green"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = (float)(v12 / 255.0);
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("blue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "floatValue");
  objc_msgSend(v7, "colorWithRed:green:blue:alpha:", v10, v13, (float)(v15 / 255.0), v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __41__WFSyntaxHighlightingPluginManager_init__block_invoke_134(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  getWFGeneralLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[WFSyntaxHighlightingPluginManager init]_block_invoke";
    v6 = 2114;
    v7 = v2;
    _os_log_impl(&dword_226666000, v3, OS_LOG_TYPE_INFO, "%s Log from syntax highlighting JSContext: %{public}@", (uint8_t *)&v4, 0x16u);
  }

}

void __41__WFSyntaxHighlightingPluginManager_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  getWFGeneralLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315394;
    v6 = "-[WFSyntaxHighlightingPluginManager init]_block_invoke";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_226666000, v4, OS_LOG_TYPE_FAULT, "%s Exception from syntax highlighting JSContext: %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

@end
