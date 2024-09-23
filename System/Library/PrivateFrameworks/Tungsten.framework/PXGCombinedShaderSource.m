@implementation PXGCombinedShaderSource

- (PXGCombinedShaderSource)initWithEffects:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  PXGCombinedShaderSource *v29;
  PXGCombinedShaderSource *v30;
  id obj;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  objc_super v49;
  _QWORD v50[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  PXGUniformAlias *(*v62)(uint64_t, void *);
  void *v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v45 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v36 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v3;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v38)
  {
    v6 = 0;
    v37 = *(_QWORD *)v66;
    v34 = v5;
    v35 = v4;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v66 != v37)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "shader");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "source");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v40 = i;
          objc_msgSend(v4, "addObject:", v9);
          v39 = v8;
          objc_msgSend(v8, "uniforms");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = MEMORY[0x24BDAC760];
          v61 = 3221225472;
          v62 = __43__PXGCombinedShaderSource_initWithEffects___block_invoke;
          v63 = &__block_descriptor_40_e32___PXGUniform_16__0__PXGUniform_8l;
          v41 = v6;
          v64 = v6;
          PXMap();
          v11 = objc_claimAutoreleasedReturnValue();

          v44 = (void *)v11;
          objc_msgSend(v5, "addObjectsFromArray:", v11);
          v58 = 0u;
          v59 = 0u;
          v57 = 0u;
          v56 = 0u;
          +[PXGShaderFunction shaderFunctions](PXGShaderFunction, "shaderFunctions");
          v42 = (id)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
          if (v47)
          {
            v46 = *(_QWORD *)v57;
            v43 = v9;
            do
            {
              for (j = 0; j != v47; ++j)
              {
                if (*(_QWORD *)v57 != v46)
                  objc_enumerationMutation(v42);
                v13 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j);
                objc_msgSend(v9, "sourceForShaderFunction:", v13);
                v14 = objc_claimAutoreleasedReturnValue();
                v15 = (void *)v14;
                if (v14)
                {
                  v48 = (void *)v14;
                  objc_msgSend(v45, "objectForKeyedSubscript:", v13);
                  v16 = (id)objc_claimAutoreleasedReturnValue();
                  if (!v16)
                  {
                    v16 = objc_alloc_init(MEMORY[0x24BDD16A8]);
                    objc_msgSend(v45, "setObject:forKeyedSubscript:", v16, v13);
                  }
                  objc_msgSend(v16, "appendString:", CFSTR("{\n"));
                  v54 = 0u;
                  v55 = 0u;
                  v52 = 0u;
                  v53 = 0u;
                  v17 = v44;
                  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
                  if (v18)
                  {
                    v19 = v18;
                    v20 = *(_QWORD *)v53;
                    do
                    {
                      for (k = 0; k != v19; ++k)
                      {
                        if (*(_QWORD *)v53 != v20)
                          objc_enumerationMutation(v17);
                        v22 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * k);
                        objc_msgSend(v22, "original");
                        v23 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v23, "declaration");
                        v24 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v22, "name");
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v16, "appendFormat:", CFSTR("%@ = %@;\n"), v24, v25);

                      }
                      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
                    }
                    while (v19);
                  }

                  v15 = v48;
                  objc_msgSend(v16, "appendString:", v48);
                  objc_msgSend(v16, "appendString:", CFSTR("\n}\n"));

                  v9 = v43;
                }

              }
              v47 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
            }
            while (v47);
          }

          v8 = v39;
          objc_msgSend(v39, "source");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "otherSource");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "appendString:", v27);

          v6 = v41 + 1;
          v5 = v34;
          v4 = v35;
          i = v40;
        }

      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v38);
  }

  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __43__PXGCombinedShaderSource_initWithEffects___block_invoke_2;
  v50[3] = &unk_251A6EC58;
  v28 = v36;
  v51 = v28;
  objc_msgSend(v45, "enumerateKeysAndObjectsUsingBlock:", v50);
  v49.receiver = self;
  v49.super_class = (Class)PXGCombinedShaderSource;
  v29 = -[PXGShaderSource initWithSource:](&v49, sel_initWithSource_, v28);
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_combinedUniforms, v5);
    objc_storeStrong((id *)&v30->_combinedShaderSources, v4);
    v30->_isEmpty = objc_msgSend(v28, "length") == 0;
  }

  return v30;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p _combinedUniforms:%@"), v5, self, self->_combinedUniforms);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isValidForEffects:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  BOOL v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_combinedShaderSources;
  v6 = objc_msgSend(v4, "count");
  if (v6 == -[NSArray count](v5, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v20 = v4;
      v10 = 0;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "shader");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "source");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v10 + i);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if (v14 == v15)
          {

          }
          else
          {
            v16 = v15;
            v17 = objc_msgSend(v14, "isEqual:", v15);

            if ((v17 & 1) == 0)
            {
              v18 = 0;
              goto LABEL_15;
            }
          }
        }
        v10 += i;
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
      v18 = 1;
LABEL_15:
      v4 = v20;
    }
    else
    {
      v18 = 1;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)aliasedUniformsForEffects:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__PXGCombinedShaderSource_aliasedUniformsForEffects___block_invoke;
  v8[3] = &unk_251A6EC80;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

- (BOOL)isEmpty
{
  return self->_isEmpty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedUniforms, 0);
  objc_storeStrong((id *)&self->_combinedShaderSources, 0);
}

void __53__PXGCombinedShaderSource_aliasedUniformsForEffects___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  PXGUniformAlias *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a2, "shader", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniforms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(a1 + 32);
        v12 = -[PXGUniformAlias initWithIndex:aliasing:]([PXGUniformAlias alloc], "initWithIndex:aliasing:", a3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        objc_msgSend(v11, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

PXGUniformAlias *__43__PXGCombinedShaderSource_initWithEffects___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PXGUniformAlias *v4;

  v3 = a2;
  v4 = -[PXGUniformAlias initWithIndex:aliasing:]([PXGUniformAlias alloc], "initWithIndex:aliasing:", *(_QWORD *)(a1 + 32), v3);

  return v4;
}

uint64_t __43__PXGCombinedShaderSource_initWithEffects___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("void %@() {\n"), v7);

  objc_msgSend(*(id *)(a1 + 32), "appendString:", v6);
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("}\n"));
}

@end
