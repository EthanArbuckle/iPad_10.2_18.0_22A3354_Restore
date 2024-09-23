@implementation PXGShaderFunction

- (PXGShaderFunction)initWithName:(id)a3 assignmentVariable:(id)a4 isOpaque:(BOOL)a5
{
  id v8;
  id v9;
  PXGShaderFunction *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSString *assignmentVariable;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXGShaderFunction;
  v10 = -[PXGShaderFunction init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    assignmentVariable = v10->_assignmentVariable;
    v10->_assignmentVariable = (NSString *)v13;

    v10->_isOpaque = a5;
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGShaderFunction name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGShaderFunction assignmentVariable](self, "assignmentVariable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXGShaderFunction isOpaque](self, "isOpaque");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  v10 = v9;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; name:%@ assignmentVariable:%@ isOpaque:%@>"),
    v5,
    self,
    v6,
    v7,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXGShaderFunction name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)assignmentVariable
{
  return self->_assignmentVariable;
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assignmentVariable, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (NSArray)shaderFunctions
{
  if (shaderFunctions_onceToken != -1)
    dispatch_once(&shaderFunctions_onceToken, &__block_literal_global_382);
  return (NSArray *)(id)shaderFunctions_shaderFunctions;
}

+ (NSDictionary)shaderFunctionByName
{
  if (shaderFunctionByName_onceToken != -1)
    dispatch_once(&shaderFunctionByName_onceToken, &__block_literal_global_13);
  return (NSDictionary *)(id)shaderFunctionByName_shaderFunctionByName;
}

void __41__PXGShaderFunction_shaderFunctionByName__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[PXGShaderFunction shaderFunctions](PXGShaderFunction, "shaderFunctions", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v6, "name");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "setObject:forKeyedSubscript:", v6, v7);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

  v8 = (void *)shaderFunctionByName_shaderFunctionByName;
  shaderFunctionByName_shaderFunctionByName = (uint64_t)v0;

}

void __36__PXGShaderFunction_shaderFunctions__block_invoke()
{
  PXGShaderFunction *v0;
  PXGShaderFunction *v1;
  PXGShaderFunction *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v0 = -[PXGShaderFunction initWithName:assignmentVariable:isOpaque:]([PXGShaderFunction alloc], "initWithName:assignmentVariable:isOpaque:", CFSTR("fragmentTextureCoordinates"), CFSTR("textureCoordinates"), 1);
  v1 = -[PXGShaderFunction initWithName:assignmentVariable:isOpaque:]([PXGShaderFunction alloc], "initWithName:assignmentVariable:isOpaque:", CFSTR("fragmentColor"), CFSTR("color.rgb"), 1, v0);
  v5[1] = v1;
  v2 = -[PXGShaderFunction initWithName:assignmentVariable:isOpaque:]([PXGShaderFunction alloc], "initWithName:assignmentVariable:isOpaque:", CFSTR("fragmentAlpha"), CFSTR("maskAlpha"), 0);
  v5[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)shaderFunctions_shaderFunctions;
  shaderFunctions_shaderFunctions = v3;

}

@end
