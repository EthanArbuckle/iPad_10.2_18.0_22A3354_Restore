@implementation PXGShader

- (PXGShader)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGShader.m"), 27, CFSTR("%s is not available as initializer"), "-[PXGShader init]");

  abort();
}

- (PXGShader)initWithOpcodes:(id)a3 source:(id)a4 uniforms:(id)a5 components:(id)a6
{
  unsigned int var2;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  PXGShader *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  NSMutableData *valueUniformsData;
  uint64_t v31;
  NSArray *valueUniforms;
  uint64_t v33;
  NSArray *texture2DUniforms;
  uint64_t v35;
  NSArray *texture3DUniforms;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  uint64_t v52;

  var2 = a3.var2;
  v10 = *(_QWORD *)&a3.var0;
  v52 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v50.receiver = self;
  v50.super_class = (Class)PXGShader;
  v15 = -[PXGShader init](&v50, sel_init);
  if (v15)
  {
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("PXGShader.m"), 33, CFSTR("Doesn't support binding of components yet, see <rdar://problem/71347132>."));

    }
    v45 = v12;
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("PXGShader.m"), 34, CFSTR("Dynamic shader source is not currently supported, see rdar://78532560"));

      if ((_DWORD)v10 != PXGShaderOpcodesNull || qword_2578659CC != __PAIR64__(var2, HIDWORD(v10)))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("PXGShader.m"), 35, CFSTR("Mixing opcodes and source isn't currently supported: %@"), v15);

      }
    }
    *(_QWORD *)&v15->_opcodes.fragmentTextureCoordinateOpcodes = v10;
    v15->_opcodes.fragmentAlphaOpcodes = var2;
    objc_storeStrong((id *)&v15->_source, a4);
    if (v13)
      v16 = v13;
    else
      v16 = (void *)MEMORY[0x24BDBD1A8];
    objc_storeStrong((id *)&v15->_uniforms, v16);
    if (v14)
      v17 = v14;
    else
      v17 = (void *)MEMORY[0x24BDBD1B8];
    objc_storeStrong((id *)&v15->_components, v17);
    v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v44 = v13;
    v21 = v13;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v47 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          v27 = objc_msgSend(v26, "type");
          v28 = v18;
          if (v27 < 4)
            goto LABEL_21;
          if (v27 == 5)
          {
            v28 = v20;
LABEL_21:
            objc_msgSend(v28, "addObject:", v26);
            continue;
          }
          v28 = v19;
          if (v27 == 4)
            goto LABEL_21;
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v23);
    }

    if (objc_msgSend(v18, "count"))
    {
      v29 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 16 * objc_msgSend(v18, "count"));
      valueUniformsData = v15->_valueUniformsData;
      v15->_valueUniformsData = (NSMutableData *)v29;
    }
    else
    {
      valueUniformsData = v15->_valueUniformsData;
      v15->_valueUniformsData = 0;
    }
    v12 = v45;

    v31 = objc_msgSend(v18, "copy");
    valueUniforms = v15->_valueUniforms;
    v15->_valueUniforms = (NSArray *)v31;

    v33 = objc_msgSend(v19, "copy");
    texture2DUniforms = v15->_texture2DUniforms;
    v15->_texture2DUniforms = (NSArray *)v33;

    v35 = objc_msgSend(v20, "copy");
    texture3DUniforms = v15->_texture3DUniforms;
    v15->_texture3DUniforms = (NSArray *)v35;

    if ((unint64_t)objc_msgSend(v19, "count") >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("PXGShader.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("texture2DUniforms.count <= PXGSHADER_MAX_STATIC_2DTEXTURES"));

    }
    v13 = v44;
    if ((unint64_t)objc_msgSend(v20, "count") >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("PXGShader.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("texture3DUniforms.count <= PXGSHADER_MAX_STATIC_3DTEXTURES"));

    }
    v15->_sampler = 1;

  }
  return v15;
}

- (id)description
{
  objc_class *v3;
  unint64_t v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v18 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXGShader opcodes](self, "opcodes");
  PXGShaderOpcodesDescription(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary allKeys](self->_sourceByShaderFunction, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "valueForKeyPath:", CFSTR("name"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGShader uniforms](self, "uniforms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKeyPath:", CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGShader components](self, "components");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@:%p; opcodes:%@ functions:[%@] uniforms:[%@] components:[%@]>"),
    v16,
    self,
    v6,
    v7,
    v10,
    v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isOpaque
{
  int v3;
  char v4;
  void *v5;
  void *v6;

  -[PXGShader opcodes](self, "opcodes");
  if (v3)
    return 0;
  -[PXGShader source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXGShader source](self, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isOpaque");

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)isEquivalentToShader:(id)a3
{
  PXGShader *v4;
  PXGShader *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  char v20;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  BOOL v27;
  char v28;
  void *v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  void *v33;
  _QWORD v34[4];
  PXGShader *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  v4 = (PXGShader *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 != self)
    {
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v40 = 0;
      -[PXGShader source](self, "source");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "hash");
      -[PXGShader source](v5, "source");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = v7 == objc_msgSend(v8, "hash");

      v40 = v7;
      v9 = v38;
      if (*((_BYTE *)v38 + 24))
      {
        -[PXGShader source](self, "source");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGShader source](v5, "source");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v10;
        v13 = v11;
        if (v12 == v13)
          v14 = 1;
        else
          v14 = objc_msgSend(v12, "isEqual:", v13);

        *((_BYTE *)v38 + 24) = v14;
        v9 = v38;
        if (*((_BYTE *)v38 + 24))
        {
          -[PXGShader components](self, "components");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXGShader components](v5, "components");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v16;
          v19 = v17;
          if (v18 == v19)
            v20 = 1;
          else
            v20 = objc_msgSend(v18, "isEqual:", v19);

          *((_BYTE *)v38 + 24) = v20;
          v9 = v38;
          if (*((_BYTE *)v38 + 24))
          {
            v22 = -[PXGShader opcodes](self, "opcodes");
            v24 = v23;
            v25 = -[PXGShader opcodes](v5, "opcodes");
            v9 = v38;
            if ((_DWORD)v22 == (_DWORD)v25)
            {
              v27 = HIDWORD(v22) == HIDWORD(v25) && v24 == v26;
              v28 = v27;
              *((_BYTE *)v38 + 24) = v28;
              if (v27)
              {
                -[PXGShader uniforms](self, "uniforms");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "count");
                -[PXGShader uniforms](v5, "uniforms");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = v30 == objc_msgSend(v31, "count");
                *((_BYTE *)v38 + 24) = v32;

                if (*((_BYTE *)v38 + 24))
                {
                  -[PXGShader uniforms](self, "uniforms");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34[0] = MEMORY[0x24BDAC760];
                  v34[1] = 3221225472;
                  v34[2] = __34__PXGShader_isEquivalentToShader___block_invoke;
                  v34[3] = &unk_251A6E1A8;
                  v36 = &v37;
                  v35 = v5;
                  objc_msgSend(v33, "enumerateObjectsUsingBlock:", v34);

                  v15 = *((_BYTE *)v38 + 24) != 0;
                }
                else
                {
                  v15 = 0;
                }
                goto LABEL_16;
              }
LABEL_15:
              v15 = 0;
              *((_BYTE *)v9 + 24) = 0;
LABEL_16:
              _Block_object_dispose(&v37, 8);
              goto LABEL_17;
            }
          }
LABEL_14:
          *((_BYTE *)v9 + 24) = 0;
          goto LABEL_15;
        }
      }
      else
      {
        *((_BYTE *)v38 + 24) = 0;
      }
      *((_BYTE *)v9 + 24) = 0;
      goto LABEL_14;
    }
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }
LABEL_17:

  return v15;
}

- (id)parameterBindingDeclarations
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[PXGShader uniforms](self, "uniforms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v5, "addObject:", &stru_251A6EE00);
  v21 = xmmword_24945F5E0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PXGShader uniforms](self, "uniforms", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "bindType");
        ++*((_QWORD *)&v21 + v12);
        objc_msgSend(v11, "parameterDeclarationWithBindingIndex:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(",\n"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)encodeBindableArgumentsWithEncoder:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  BOOL v19;
  NSMutableData *valueUniformsData;
  _OWORD *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  __int128 v27;
  NSArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  NSArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[PXGShader source](self, "source");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_8;
  v7 = (void *)v6;
  v8 = -[PXGShader opcodes](self, "opcodes");
  if ((_DWORD)v8 != PXGShaderOpcodesNull)
  {

LABEL_53:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGShader.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self.source || PXGShaderOpcodesEqualToOpcodes(self.opcodes, PXGShaderOpcodesNull)"));

    goto LABEL_8;
  }
  v10 = v9;
  v11 = HIDWORD(qword_2578659CC);
  v12 = HIDWORD(*(_QWORD *)&PXGShaderOpcodesNull);
  v13 = HIDWORD(v8);

  if ((_DWORD)v13 != (_DWORD)v12 || v11 != v10)
    goto LABEL_53;
LABEL_8:
  objc_msgSend(v5, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXGMetalRenderContext privateContextWithDevice:](PXGMetalRenderContext, "privateContextWithDevice:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[PXGShader opcodes](self, "opcodes");
  if ((_DWORD)v17 == PXGShaderOpcodesNull
    && (HIDWORD(v17) == (_DWORD)qword_2578659CC ? (v19 = HIDWORD(qword_2578659CC) == v18) : (v19 = 0), v19))
  {
    -[PXGShader source](self, "source");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v42)
      goto LABEL_37;
    v71 = xmmword_24945F5E0;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    -[PXGShader uniforms](self, "uniforms");
    v35 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v43 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v55 != v45)
            objc_enumerationMutation(v35);
          v47 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          v48 = objc_msgSend(v47, "bindType");
          v49 = *(_QWORD *)&v72[8 * v48 - 16];
          *(_QWORD *)&v72[8 * v48 - 16] = v49 + 1;
          v50 = objc_msgSend(v47, "bindType");
          if (v50 == 1)
          {
            objc_msgSend(v47, "bindableTextureForContext:", v16);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setFragmentTexture:atIndex:", v52, v49);

          }
          else if (!v50 && objc_msgSend(v47, "bytesLength") >= 1)
          {
            v51 = objc_retainAutorelease(v47);
            objc_msgSend(v5, "setFragmentBytes:length:atIndex:", objc_msgSend(v51, "bytes"), objc_msgSend(v51, "bytesLength"), v49);
          }
        }
        v44 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
      }
      while (v44);
    }
  }
  else
  {
    valueUniformsData = self->_valueUniformsData;
    if (valueUniformsData)
    {
      v21 = (_OWORD *)-[NSMutableData bytes](valueUniformsData, "bytes");
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v22 = self->_valueUniforms;
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v67;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v67 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * j), "encodableValue");
            *v21++ = v27;
          }
          v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
        }
        while (v24);
      }

      objc_msgSend(v5, "setFragmentBytes:length:atIndex:", -[NSMutableData bytes](self->_valueUniformsData, "bytes"), -[NSMutableData length](self->_valueUniformsData, "length"), 5);
    }
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v28 = self->_texture2DUniforms;
    v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v63;
      v32 = 5;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v63 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * k), "bindableTextureForContext:", v16);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setFragmentTexture:atIndex:", v34, v32 + k);

        }
        v32 += k;
        v30 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
      }
      while (v30);
    }

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v35 = self->_texture3DUniforms;
    v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v59;
      v39 = 8;
      do
      {
        for (m = 0; m != v37; ++m)
        {
          if (*(_QWORD *)v59 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * m), "bindableTextureForContext:", v16);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setFragmentTexture:atIndex:", v41, v39 + m);

        }
        v39 += m;
        v37 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
      }
      while (v37);
    }
  }

LABEL_37:
}

- ($938B03310D06493B2963E5A84CB75A7E)opcodes
{
  unsigned int fragmentAlphaOpcodes;
  uint64_t v3;
  $938B03310D06493B2963E5A84CB75A7E result;

  fragmentAlphaOpcodes = self->_opcodes.fragmentAlphaOpcodes;
  v3 = *(_QWORD *)&self->_opcodes.fragmentTextureCoordinateOpcodes;
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  result.var2 = fragmentAlphaOpcodes;
  return result;
}

- (PXGShaderSource)source
{
  return self->_source;
}

- (NSArray)uniforms
{
  return self->_uniforms;
}

- (NSDictionary)components
{
  return self->_components;
}

- (unint64_t)sampler
{
  return self->_sampler;
}

- (void)setSampler:(unint64_t)a3
{
  self->_sampler = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_uniforms, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_valueUniformsData, 0);
  objc_storeStrong((id *)&self->_texture3DUniforms, 0);
  objc_storeStrong((id *)&self->_texture2DUniforms, 0);
  objc_storeStrong((id *)&self->_valueUniforms, 0);
  objc_storeStrong((id *)&self->_sourceByShaderFunction, 0);
}

void __34__PXGShader_isEquivalentToShader___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = v7;
  if (*(_BYTE *)(v8 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniforms");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v11, "isEquivalentToUniform:", v10);

  }
  else
  {
    *(_BYTE *)(v8 + 24) = 0;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;

}

@end
