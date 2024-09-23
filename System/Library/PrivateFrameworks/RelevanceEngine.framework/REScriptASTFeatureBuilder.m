@implementation REScriptASTFeatureBuilder

- (id)objectTypeErrorDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)buildObjectWithIdentifierNode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[REScriptASTObjectBuilder table](self, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (objc_msgSend(v7, "typeForDefinition:type:", v8, &v17) && !v17)
  {
    objc_msgSend(v7, "objectValueForDefinition:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v9;
      a4 = (id *)v9;
    }
    else
    {
      objc_msgSend(v7, "nodeValueForDefinition:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[REScriptASTObjectBuilder buildObjectWithNode:error:](self, "buildObjectWithNode:error:", v12, a4);
        a4 = (id *)objc_claimAutoreleasedReturnValue();
      }
      else if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Feature %@ doesn't have a definition"), v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = CFSTR("REErrorTokenKey");
        objc_msgSend(v6, "token");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v14;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        RECreateErrorWithCodeMessageAndUseInfo(210, v13, v15);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        a4 = 0;
      }

    }
    goto LABEL_12;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Undefined feature %@"), v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("REErrorTokenKey");
    objc_msgSend(v6, "token");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    RECreateErrorWithCodeMessageAndUseInfo(210, v9, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
LABEL_12:

  }
  return a4;
}

- (id)buildObjectWithBinaryExpressionNode:(id)a3 previousExpression:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v20;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "binaryOperator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "type");

  if (v11 == 28)
  {
    objc_msgSend(v8, "expression");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[REScriptASTObjectBuilder buildObjectWithNode:error:](self, "buildObjectWithNode:error:", v12, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      a5 = 0;
      goto LABEL_8;
    }
    v22[0] = v9;
    v22[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v14);
    a5 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (a5)
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "binaryOperator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    REDescriptionForTokenType(objc_msgSend(v16, "type"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Unsupported binary operator %@ for constructing feature"), v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = CFSTR("REErrorTokenKey");
    objc_msgSend(v8, "binaryOperator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    RECreateErrorWithCodeMessageAndUseInfo(209, v13, v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
LABEL_6:

  }
LABEL_8:

  return a5;
}

- (id)buildObjectWithFunctionNode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  RETransformerInvocation *v16;
  void *v17;
  RETransformerInvocation *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  RETransformerInvocation *v24;
  REScriptASTFeatureBuilder *v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  const __CFString *v40;
  id v41;
  const __CFString *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[REScriptASTObjectBuilder table](self, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "functionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0;
  v10 = objc_msgSend(v7, "typeForDefinition:type:", v9, &v39);
  if (v39 == 4)
    v11 = v10;
  else
    v11 = 0;
  if (v11 != 1)
    goto LABEL_11;
  if ((objc_msgSend((id)objc_msgSend(v7, "objectValueForDefinition:", v9), "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    v12 = (void *)objc_opt_new();
    if (v12)
    {
      v13 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(v6, "arguments");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = 0;
      v36 = &v35;
      v37 = 0x2020000000;
      v38 = 1;
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__14;
      v33 = __Block_byref_object_dispose__14;
      v34 = 0;
      v16 = objc_alloc_init(RETransformerInvocation);
      objc_msgSend(v6, "arguments");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __63__REScriptASTFeatureBuilder_buildObjectWithFunctionNode_error___block_invoke;
      v23[3] = &unk_24CF8DBB8;
      v18 = v16;
      v24 = v18;
      v25 = self;
      v27 = &v29;
      v28 = &v35;
      v19 = v15;
      v26 = v19;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", v23);

      objc_msgSend(v12, "configureWithInvocation:", v18);
      if (a4)
        *a4 = objc_retainAutorelease((id)v30[5]);
      if (*((_BYTE *)v36 + 24))
      {
        -[REScriptASTFeatureBuilder _buildTransformedFeature:features:node:error:](self, "_buildTransformedFeature:features:node:error:", v12, v19, v6, a4);
        a4 = (id *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        a4 = 0;
      }

      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(&v35, 8);
      goto LABEL_18;
    }
LABEL_11:
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Undefined function %@"), v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("REErrorTokenKey");
      objc_msgSend(v6, "token");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v41 = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      RECreateErrorWithCodeMessageAndUseInfo(210, v12, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
      a4 = 0;
LABEL_18:

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Function %@ doesn't have a definition"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = CFSTR("REErrorTokenKey");
    objc_msgSend(v6, "functionIdentifier");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v43[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    RECreateErrorWithCodeMessageAndUseInfo(210, v12, v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
LABEL_19:

  return a4;
}

void __63__REScriptASTFeatureBuilder_buildObjectWithFunctionNode_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const void *v15;
  id v16;
  id obj;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "token");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    switch(objc_msgSend(v16, "type"))
    {
      case 3:
        objc_msgSend(v16, "value");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", objc_msgSend(v9, "longLongValue"));
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 4:
        objc_msgSend(v16, "value");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v8 = (void *)v10;
        goto LABEL_11;
      case 5:
        objc_msgSend(v16, "value");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        +[REFeatureValue featureValueWithString:](REFeatureValue, "featureValueWithString:", v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        break;
      case 9:
        v14 = 1;
        goto LABEL_14;
      case 10:
        v14 = 0;
LABEL_14:
        +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", v14, v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        break;
    }
    v15 = (const void *)RECreateFeatureValueTaggedPointer(v8);
    objc_msgSend(*(id *)(a1 + 32), "setArgument:atIndex:", v15, a3);
    REReleaseFeatureValueTaggedPointer(v15);

  }
  else
  {
    v11 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v12 + 40);
    objc_msgSend(v11, "buildObjectWithNode:error:", v7, &obj);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)(v12 + 40), obj);
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);
    }
    else
    {
      *a4 = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }

  }
}

- (id)buildObjectWithSubscriptExpressionNode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "expression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REScriptASTObjectBuilder buildObjectWithNode:error:](self, "buildObjectWithNode:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_8;
  v9 = objc_msgSend(v8, "_bitCount");
  if (v9 > 0)
  {
    v10 = v9;
    v22 = 0;
    v23 = 0;
    objc_msgSend(v6, "startIndex");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (!-[REScriptASTFeatureBuilder _loadIndexFromNode:index:error:](self, "_loadIndexFromNode:index:error:", v11, &v23, a4))
      {
        a4 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      v23 = 0;
    }
    objc_msgSend(v6, "endIndex");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (!-[REScriptASTFeatureBuilder _loadIndexFromNode:index:error:](self, "_loadIndexFromNode:index:error:", v17, &v22, a4))
      {
        a4 = 0;
        goto LABEL_16;
      }
      v18 = v22;
    }
    else
    {
      v18 = v10 - 1;
      v22 = v10 - 1;
    }
    +[REFeatureTransformer maskAndShiftTransformWithStartIndex:endIndex:](REFeatureTransformer, "maskAndShiftTransformWithStartIndex:endIndex:", v23, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[REScriptASTFeatureBuilder _buildTransformedFeature:features:node:error:](self, "_buildTransformedFeature:features:node:error:", v19, v20, v6, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    goto LABEL_17;
  }
  if (a4)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Unable to slice feature %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = CFSTR("REErrorTokenKey");
    objc_msgSend(v6, "token");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    RECreateErrorWithCodeMessageAndUseInfo(211, v14, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
    a4 = 0;
  }
LABEL_18:

  return a4;
}

- (id)_buildTransformedFeature:(id)a3 features:(id)a4 node:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_loadIndexFromNode:(id)a3 index:(unint64_t *)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v8, "token");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "type");

    if (v10 == 3)
    {
      if (a4)
      {
        objc_msgSend(v8, "token");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = objc_msgSend(v12, "integerValue");

      }
      LOBYTE(a5) = 1;
      goto LABEL_11;
    }
    if (!a5)
    {
LABEL_11:

      goto LABEL_12;
    }
    v18 = CFSTR("REErrorTokenKey");
    objc_msgSend(v8, "token");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    RECreateErrorWithCodeMessageAndUseInfo(204, CFSTR("Unexpected literal. Expecting integer"), v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    LOBYTE(a5) = 0;
    goto LABEL_11;
  }
  if (a5)
  {
    v16 = CFSTR("REErrorTokenKey");
    objc_msgSend(v7, "token");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    RECreateErrorWithCodeMessageAndUseInfo(204, CFSTR("Unexpected token. Expecting index"), v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_12:

  return (char)a5;
}

@end
