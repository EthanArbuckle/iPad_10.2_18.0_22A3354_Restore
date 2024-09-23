@implementation PXGShaderSource

- (PXGShaderSource)initWithSource:(id)a3
{
  id v6;
  PXGShaderSource *v7;
  PXGShaderSource *v8;
  void *v9;
  PXGShaderSource *v10;
  void *v12;
  _QWORD v13[4];
  PXGShaderSource *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  objc_super v20;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGShaderSource.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source != nil"));

  }
  v20.receiver = self;
  v20.super_class = (Class)PXGShaderSource;
  v7 = -[PXGShaderSource init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_source, a3);
    -[PXGShaderSource _parseShader](v8, "_parseShader");
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 1;
    +[PXGShaderFunction shaderFunctions](PXGShaderFunction, "shaderFunctions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __34__PXGShaderSource_initWithSource___block_invoke;
    v13[3] = &unk_251A6EB80;
    v10 = v8;
    v14 = v10;
    v15 = &v16;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

    v10->_isOpaque = *((_BYTE *)v17 + 24);
    _Block_object_dispose(&v16, 8);
  }

  return v8;
}

- (PXGShaderSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGShaderSource.m"), 55, CFSTR("%s is not available as initializer"), "-[PXGShaderSource init]");

  abort();
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXGShaderSource source](self, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXGShaderSource source](self, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
      v8 = 1;
    else
      v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)length
{
  void *v2;
  int64_t v3;

  -[PXGShaderSource source](self, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (id)sourceForShaderFunction:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_sourceByShaderFunction, "objectForKeyedSubscript:", a3);
}

- (void)_parseShader
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *sourceByShaderFunction;
  NSString *v11;
  NSString *otherSource;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  SEL v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[5];

  +[PXGShaderFunction shaderFunctionByName](PXGShaderFunction, "shaderFunctionByName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGShaderSource source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v14 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__2176;
  v36[4] = __Block_byref_object_dispose__2177;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__2176;
  v34[4] = __Block_byref_object_dispose__2177;
  v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__2176;
  v32[4] = __Block_byref_object_dispose__2177;
  v33 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__2176;
  v30[4] = __Block_byref_object_dispose__2177;
  v31 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __31__PXGShaderSource__parseShader__block_invoke;
  v18[3] = &unk_251A6EBD0;
  v23 = &v38;
  v24 = v30;
  v18[4] = self;
  v25 = v34;
  v26 = v36;
  v29 = a2;
  v5 = v17;
  v19 = v5;
  v27 = v42;
  v28 = v32;
  v6 = v16;
  v20 = v6;
  v7 = v15;
  v21 = v7;
  v8 = v14;
  v22 = v8;
  objc_msgSend(v4, "enumerateLinesUsingBlock:", v18);
  if (v39[3])
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGShaderSource.m"), 214, CFSTR("Incorrect parsing of:%@"), v4);

  }
  v9 = (NSDictionary *)objc_msgSend(v6, "copy");
  sourceByShaderFunction = self->_sourceByShaderFunction;
  self->_sourceByShaderFunction = v9;

  v11 = (NSString *)objc_msgSend(v8, "copy");
  otherSource = self->_otherSource;
  self->_otherSource = v11;

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v42, 8);

}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (NSString)otherSource
{
  return self->_otherSource;
}

- (NSString)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_otherSource, 0);
  objc_storeStrong((id *)&self->_sourceByShaderFunction, 0);
}

void __31__PXGShaderSource__parseShader__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  int8x16_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;

  v3 = a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    goto LABEL_9;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (!v4)
  {
    v31 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^([^\\s/]*)[\\s]+([^\\s]+)\\([^\\(\\)]*\\)[^\\(\\)]*$"), 0, &v31);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v31;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v5;

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 32), CFSTR("PXGShaderSource.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!error"));

    }
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  }
  objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "px_matchAtIndex:forString:", 2, v3);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
LABEL_9:
    v17 = objc_msgSend(v3, "length");
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __31__PXGShaderSource__parseShader__block_invoke_2;
    v23[3] = &unk_251A6EBA8;
    v27 = *(_QWORD *)(a1 + 72);
    v28 = vextq_s8(*(int8x16_t *)(a1 + 96), *(int8x16_t *)(a1 + 96), 8uLL);
    v29 = *(_QWORD *)(a1 + 112);
    v24 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 56);
    v19 = *(_QWORD *)(a1 + 88);
    v25 = v18;
    v30 = v19;
    v26 = *(id *)(a1 + 64);
    objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v17, 2, v23);
    v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if (v20 && (v20 != 1 || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40)))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "appendString:", CFSTR("\n"));
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      if (*(_QWORD *)(v21 + 24) == 4)
        *(_QWORD *)(v21 + 24) = 2;
    }

  }
}

void __31__PXGShaderSource__parseShader__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  void *v32;

  v9 = a2;
  v10 = v9;
  v32 = v9;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 2)
  {
    v11 = objc_msgSend(v9, "isEqualToString:", CFSTR("}"));
    v10 = v32;
    if (v11)
    {
      if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v14 = *(void **)(v13 + 40);
        if (v12)
        {
          v15 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v12, "assignmentVariable");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR("$1%@ = $2"), v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "replaceOccurrencesOfString:withString:options:range:", CFSTR("([ ]*)return (.*)"), v17, 1024, 0, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "length"));

          v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
          objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v20, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

        }
        else
        {
          objc_msgSend(*(id *)(v13 + 40), "appendString:", CFSTR("}\n"));
          if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40)) & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
            objc_msgSend(*(id *)(a1 + 48), "appendString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
            objc_msgSend(*(id *)(a1 + 48), "appendString:", CFSTR("\n"));
          }
        }
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "deleteCharactersInRange:", 0, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "length"));
        *a7 = 1;
        v10 = v32;
      }
    }
  }
  v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v21)
  {
    if (v21 == 1 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
LABEL_14:
      v22 = objc_msgSend(v10, "isEqualToString:", CFSTR("{"));
      v10 = v32;
      if (v22)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
LABEL_16:
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v24 = *(_QWORD *)(v23 + 24) + 1;
LABEL_17:
        *(_QWORD *)(v23 + 24) = v24;
      }
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "appendString:", v10);
      v10 = v32;
      switch(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        case 0:
          goto LABEL_13;
        case 1:
          goto LABEL_14;
        case 2:
          if (objc_msgSend(v32, "isEqualToString:", CFSTR("/")))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v26 = 3;
LABEL_32:
            *(_QWORD *)(v25 + 24) = v26;
            v10 = v32;
          }
          else
          {
            v30 = objc_msgSend(v32, "isEqualToString:", CFSTR("{"));
            v10 = v32;
            if (v30)
              goto LABEL_16;
          }
          break;
        case 3:
          if (objc_msgSend(v32, "isEqualToString:", CFSTR("/")))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v26 = 4;
          }
          else
          {
            v31 = objc_msgSend(v32, "isEqualToString:", CFSTR("*"));
            v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            if (v31)
LABEL_31:
              v26 = 5;
            else
LABEL_27:
              v26 = 2;
          }
          goto LABEL_32;
        case 4:
          v27 = objc_msgSend(v32, "isEqualToString:", CFSTR("\n"));
          v10 = v32;
          if (!v27)
            break;
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v24 = 2;
          goto LABEL_17;
        case 5:
          v28 = objc_msgSend(v32, "isEqualToString:", CFSTR("*"));
          v10 = v32;
          if (!v28)
            break;
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v24 = 6;
          goto LABEL_17;
        case 6:
          v29 = objc_msgSend(v32, "isEqualToString:", CFSTR("/"));
          v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          if (v29)
            goto LABEL_27;
          goto LABEL_31;
        default:
          break;
      }
    }
  }
  else
  {
LABEL_13:
    *a7 = 1;
  }

}

void __34__PXGShaderSource_initWithSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sourceForShaderFunction:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_msgSend(v4, "isOpaque") & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

@end
