@implementation TVMediaQueryEvaluator

+ (id)evaluatorForTemplateElement:(id)a3 inWindow:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "evaluatorForTemplateElement:inWindow:traitEnvironment:", v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)evaluatorForTemplateElement:(id)a3 inWindow:(id)a4 traitEnvironment:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = evaluatorForTemplateElement_inWindow_traitEnvironment__onceToken;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  if (v8 != -1)
    dispatch_once(&evaluatorForTemplateElement_inWindow_traitEnvironment__onceToken, &__block_literal_global_37);
  v12 = (void *)evaluatorForTemplateElement_inWindow_traitEnvironment__evaluatorClassByTemplate;
  objc_msgSend(v11, "elementName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    a1 = v14;

  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTemplateElement:inWindow:traitEnvironment:", v11, v10, v9);
  return v15;
}

void __79__TVMediaQueryEvaluator_evaluatorForTemplateElement_inWindow_traitEnvironment___block_invoke()
{
  uint64_t v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = CFSTR("stackTemplate");
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)evaluatorForTemplateElement_inWindow_traitEnvironment__evaluatorClassByTemplate;
  evaluatorForTemplateElement_inWindow_traitEnvironment__evaluatorClassByTemplate = v0;

}

- (TVMediaQueryEvaluator)initWithTemplateElement:(id)a3
{
  return -[TVMediaQueryEvaluator initWithTemplateElement:inWindow:](self, "initWithTemplateElement:inWindow:", a3, 0);
}

- (TVMediaQueryEvaluator)initWithTemplateElement:(id)a3 inWindow:(id)a4
{
  return -[TVMediaQueryEvaluator initWithTemplateElement:inWindow:traitEnvironment:](self, "initWithTemplateElement:inWindow:traitEnvironment:", a3, a4, a4);
}

- (TVMediaQueryEvaluator)initWithTemplateElement:(id)a3 inWindow:(id)a4 traitEnvironment:(id)a5
{
  id v9;
  id v10;
  id v11;
  TVMediaQueryEvaluator *v12;
  TVMediaQueryEvaluator *v13;
  void *v14;
  _TVWindowSizeAdaptor *v15;
  _TVWindowSizeAdaptor *windowSizeAdaptor;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)TVMediaQueryEvaluator;
  v12 = -[TVMediaQueryEvaluator init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_templateElement, a3);
    if (v11)
      v14 = v11;
    else
      v14 = v10;
    objc_storeWeak((id *)&v13->_traitEnvironment, v14);
    if (v10)
    {
      v15 = -[_TVWindowSizeAdaptor initWithWindow:]([_TVWindowSizeAdaptor alloc], "initWithWindow:", v10);
      windowSizeAdaptor = v13->_windowSizeAdaptor;
      v13->_windowSizeAdaptor = v15;

    }
    *(_BYTE *)&v13->_implFlags = *(_BYTE *)&v13->_implFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  }

  return v13;
}

- (BOOL)evaluateMediaQuery:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  objc_msgSend(v4, "mediaType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = IsTemplateMediaType(v5);
  v7 = MEMORY[0x24BDAC760];
  if (v6)
  {
    -[TVMediaQueryEvaluator templateElement](self, "templateElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v24 + 24) = v8 != 0;

    v22 = v7;
    v9 = __44__TVMediaQueryEvaluator_evaluateMediaQuery___block_invoke;
    v10 = &v22;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("-tv-device")))
  {
    *((_BYTE *)v24 + 24) = 1;
    v21 = v7;
    v9 = __44__TVMediaQueryEvaluator_evaluateMediaQuery___block_invoke_2;
    v10 = &v21;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE51870]))
    {
      v11 = 0;
      goto LABEL_8;
    }
    *((_BYTE *)v24 + 24) = 1;
    v20 = v7;
    v9 = __44__TVMediaQueryEvaluator_evaluateMediaQuery___block_invoke_3;
    v10 = &v20;
  }
  v10[1] = 3221225472;
  v10[2] = (uint64_t)v9;
  v10[3] = (uint64_t)&unk_24EB871C0;
  v10[4] = (uint64_t)self;
  v11 = (void *)MEMORY[0x22767F470]();
LABEL_8:
  objc_msgSend(v4, "featureValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __44__TVMediaQueryEvaluator_evaluateMediaQuery___block_invoke_4;
  v16[3] = &unk_24EB871E8;
  v16[4] = self;
  v13 = v5;
  v17 = v13;
  v14 = v11;
  v18 = v14;
  v19 = &v23;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v16);

  LOBYTE(v12) = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return (char)v12;
}

uint64_t __44__TVMediaQueryEvaluator_evaluateMediaQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "_evaluateTemplateFeatureType:withValue:", v5, v6) & 1) != 0)
    v7 = 1;
  else
    v7 = objc_msgSend(*(id *)(a1 + 32), "_evaluateAllMediaFeatureType:withValue:", v5, v6);

  return v7;
}

uint64_t __44__TVMediaQueryEvaluator_evaluateMediaQuery___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateDeviceFeatureType:withValue:", a2, a3);
}

uint64_t __44__TVMediaQueryEvaluator_evaluateMediaQuery___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateAllMediaFeatureType:withValue:", a2, a3);
}

void __44__TVMediaQueryEvaluator_evaluateMediaQuery___block_invoke_4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  _BYTE *v13;
  uint64_t v14;
  char v15;

  v7 = a2;
  v8 = a3;
  v15 = 0;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "evaluator:evaluteForMediaType:featureType:value:result:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v7, v8, &v15);

    if ((v12 & 1) != 0)
      goto LABEL_8;
  }
  if ((v13 = *(_BYTE **)(a1 + 32), (v13[16] & 1) != 0)
    && (objc_msgSend(v13, "evaluteForMediaType:featureType:value:result:", *(_QWORD *)(a1 + 40), v7, v8, &v15) & 1) != 0
    || (v14 = *(_QWORD *)(a1 + 48)) == 0)
  {
LABEL_8:
    if (!v15)
    {
LABEL_9:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  else if (!(*(unsigned int (**)(uint64_t, id, id))(v14 + 16))(v14, v7, v8))
  {
    goto LABEL_9;
  }

}

+ (id)_productType
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__TVMediaQueryEvaluator__productType__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_productType_onceToken != -1)
    dispatch_once(&_productType_onceToken, block);
  return (id)_productType_productType;
}

void __37__TVMediaQueryEvaluator__productType__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_mobileGestaltStringForKey:", CFSTR("ProductType"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_productType_productType;
  _productType_productType = v0;

  objc_msgSend((id)_productType_productType, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), CFSTR("-"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_productType_productType;
  _productType_productType = v2;

}

- (BOOL)_evaluateDeviceFeatureType:(id)a3 withValue:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("-tv-product-type")))
  {
    objc_msgSend((id)objc_opt_class(), "_productType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_evaluateTemplateFeatureType:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *k;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *m;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t n;
  void *v38;
  id v39;
  BOOL v40;
  int v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *jj;
  void *v47;
  void *v48;
  uint64_t v49;
  void *ii;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t kk;
  void *v57;
  _BOOL4 v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  id v68;
  id v69;
  TVMediaQueryEvaluator *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("-tv-uber")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("-tv-banner")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("-tv-hero-img")))
  {
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v70 = self;
    -[TVMediaQueryEvaluator templateElement](self, "templateElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unfilteredChildren");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v100;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v100 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v13, "tv_elementType") == 12)
          {
            v10 = v13;
            goto LABEL_14;
          }
        }
        v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_14:

    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    objc_msgSend(v10, "unfilteredChildren");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v96;
      while (2)
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v96 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
          if (objc_msgSend(v19, "tv_elementType") == 16 && objc_msgSend(v19, "tv_imageType") == 3)
          {
            v20 = v19;
            goto LABEL_25;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
        if (v16)
          continue;
        break;
      }
    }
    v20 = 0;
LABEL_25:

    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    objc_msgSend(v10, "unfilteredChildren");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v92;
      while (2)
      {
        for (k = 0; k != v22; k = (char *)k + 1)
        {
          if (*(_QWORD *)v92 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)k);
          if (objc_msgSend(v25, "tv_elementType") == 4)
          {
            v22 = v25;
            goto LABEL_35;
          }
        }
        v22 = (id)objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
        if (v22)
          continue;
        break;
      }
    }
LABEL_35:

    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    objc_msgSend(v22, "unfilteredChildren");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (id)objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v87, v107, 16);
    if (v27)
    {
      v28 = v20;
      v29 = *(_QWORD *)v88;
      while (2)
      {
        for (m = 0; m != v27; m = (char *)m + 1)
        {
          if (*(_QWORD *)v88 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)m);
          if (objc_msgSend(v31, "tv_elementType") == 16 && !objc_msgSend(v31, "tv_imageType"))
          {
            v27 = v31;
            goto LABEL_46;
          }
        }
        v27 = (id)objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v87, v107, 16);
        if (v27)
          continue;
        break;
      }
LABEL_46:
      v20 = v28;
    }

    if (objc_msgSend(v6, "isEqualToString:", CFSTR("-tv-uber")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v69 = v20;
        if (v27)
          goto LABEL_106;
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        -[TVMediaQueryEvaluator templateElement](v70, "templateElement");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "unfilteredChildren");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v83, v106, 16);
        v68 = v7;
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v84;
          while (2)
          {
            for (n = 0; n != v35; ++n)
            {
              if (*(_QWORD *)v84 != v36)
                objc_enumerationMutation(v33);
              v38 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * n);
              if (objc_msgSend(v38, "tv_elementType") == 4)
              {
                v81 = 0u;
                v82 = 0u;
                v79 = 0u;
                v80 = 0u;
                objc_msgSend(v38, "unfilteredChildren");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = (id)objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v79, v105, 16);
                if (v39)
                {
                  v49 = *(_QWORD *)v80;
                  while (2)
                  {
                    for (ii = 0; ii != v39; ii = (char *)ii + 1)
                    {
                      if (*(_QWORD *)v80 != v49)
                        objc_enumerationMutation(v48);
                      v51 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)ii);
                      if (objc_msgSend(v51, "tv_elementType") == 16 && !objc_msgSend(v51, "tv_imageType"))
                      {
                        v39 = v51;
                        goto LABEL_104;
                      }
                    }
                    v39 = (id)objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v79, v105, 16);
                    if (v39)
                      continue;
                    break;
                  }
                }
LABEL_104:

                goto LABEL_105;
              }
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v83, v106, 16);
            if (v35)
              continue;
            break;
          }
        }
        v39 = 0;
LABEL_105:

        objc_msgSend(v39, "style");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "tv_imageTreatment");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "isEqualToString:", CFSTR("blurOverlay"));

        v7 = v68;
        if (v61)
        {
LABEL_106:
          -[TVMediaQueryEvaluator templateElement](v70, "templateElement");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "elementName");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "isEqualToString:", CFSTR("compilationTemplate"));

          if (v64)
          {
            objc_msgSend(v10, "attributes");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("floating"));
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v66, "length"))
              v41 = objc_msgSend(v66, "BOOLValue");
            else
              v41 = 1;
            v20 = v69;

            goto LABEL_114;
          }
          v41 = 1;
        }
        else
        {
          v41 = 0;
        }
        v20 = v69;
LABEL_114:

        LOBYTE(v41) = v41 != 0;
        goto LABEL_115;
      }
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("-tv-banner"))
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v40 = v10 == 0;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("-tv-hero-img"))
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v41 = 0;
        goto LABEL_114;
      }
      v40 = v20 == 0;
    }
    v41 = !v40;
    goto LABEL_114;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("-tv-bg-uber")))
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    -[TVMediaQueryEvaluator templateElement](self, "templateElement");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "unfilteredChildren");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = (id)objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v75, v104, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v76;
      while (2)
      {
        for (jj = 0; jj != v44; jj = (char *)jj + 1)
        {
          if (*(_QWORD *)v76 != v45)
            objc_enumerationMutation(v43);
          v47 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)jj);
          if (objc_msgSend(v47, "tv_elementType") == 4)
          {
            v44 = v47;
            goto LABEL_91;
          }
        }
        v44 = (id)objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v75, v104, 16);
        if (v44)
          continue;
        break;
      }
    }
LABEL_91:

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    objc_msgSend(v44, "unfilteredChildren");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v71, v103, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v72;
      while (2)
      {
        for (kk = 0; kk != v54; ++kk)
        {
          if (*(_QWORD *)v72 != v55)
            objc_enumerationMutation(v52);
          v57 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * kk);
          if (objc_msgSend(v57, "tv_elementType") == 16 && !objc_msgSend(v57, "tv_imageType"))
          {
            v58 = v57 != 0;
            goto LABEL_102;
          }
        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v71, v103, 16);
        if (v54)
          continue;
        break;
      }
    }
    v58 = 0;
LABEL_102:

    objc_opt_class();
    v41 = v58 & objc_opt_isKindOfClass();

  }
  else
  {
    LOBYTE(v41) = 0;
  }
LABEL_115:

  return v41;
}

- (BOOL)_evaluateAllMediaFeatureType:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  double v23;
  BOOL v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  BOOL v29;
  float v30;
  float v31;
  float v32;
  BOOL v33;
  float v34;
  float v35;
  float v36;
  float v37;
  double v38;
  void *v39;
  double Width;
  float v41;
  double v42;
  double v43;
  float v44;
  double v45;
  double Height;
  float v47;
  float v48;
  float v49;
  void *v50;
  unint64_t v51;
  const __CFString *v52;
  void *v53;
  BOOL v54;
  BOOL v55;
  void *v56;
  int64_t v57;
  uint64_t v58;
  __CFString *v59;
  uint64_t v60;
  uint64_t v61;
  NSString *v62;
  void *v63;
  NSString *v64;
  uint64_t v65;
  BOOL v67;
  const __CFString *v68;
  uint64_t v69;
  const __CFString *v70;
  uint64_t v72;
  BOOL v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v7 && objc_msgSend(v7, "length")
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("ax-text")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("small")) & 1) != 0)
  {

  }
  else
  {
    v20 = objc_msgSend(v6, "isEqualToString:", CFSTR("large"));

    if ((v20 & 1) == 0)
    {
      v21 = 0;
      goto LABEL_105;
    }
  }
  if (_evaluateAllMediaFeatureType_withValue__onceToken != -1)
    dispatch_once(&_evaluateAllMediaFeatureType_withValue__onceToken, &__block_literal_global_115);
  objc_msgSend((id)_evaluateAllMediaFeatureType_withValue__sFeatureLookup, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  -[TVMediaQueryEvaluator traitEnvironment](self, "traitEnvironment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVWindowSizeAdaptor adjustedWindowSize](self->_windowSizeAdaptor, "adjustedWindowSize");
  v14 = v13;
  v16 = v15;
  switch(v10)
  {
    case 0:
      -[TVMediaQueryEvaluator templateElement](self, "templateElement");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        -[TVMediaQueryEvaluator templateElement](self, "templateElement");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = +[TVMLUtilities interfaceStyleForTemplateElement:](TVMLUtilities, "interfaceStyleForTemplateElement:", v18);

      }
      else
      {
        v19 = objc_msgSend(v12, "userInterfaceStyle");
      }

      v68 = CFSTR("dark");
      if (v19 != 2)
        v68 = 0;
      if (v19 == 1)
        v52 = CFSTR("light");
      else
        v52 = v68;
      goto LABEL_98;
    case 1:
      v22 = objc_msgSend(v7, "integerValue");
      objc_msgSend(v12, "displayScale");
      v24 = v22 == (uint64_t)v23;
      goto LABEL_20;
    case 2:
      v25 = objc_msgSend(v7, "integerValue");
      objc_msgSend(v12, "displayScale");
      v21 = v25 <= (uint64_t)v26;
      goto LABEL_104;
    case 3:
      v27 = objc_msgSend(v7, "integerValue");
      objc_msgSend(v12, "displayScale");
      v29 = v27 < (uint64_t)v28;
      goto LABEL_24;
    case 4:
      objc_msgSend(v7, "floatValue");
      v24 = v14 == v30;
      goto LABEL_20;
    case 5:
      objc_msgSend(v7, "floatValue");
      v29 = v14 < v31;
      goto LABEL_24;
    case 6:
      objc_msgSend(v7, "floatValue");
      v33 = v14 > v32;
      goto LABEL_28;
    case 7:
      objc_msgSend(v7, "floatValue");
      v24 = v16 == v34;
LABEL_20:
      v21 = v24;
      goto LABEL_104;
    case 8:
      objc_msgSend(v7, "floatValue");
      v29 = v16 < v35;
LABEL_24:
      v21 = !v29;
      goto LABEL_104;
    case 9:
      objc_msgSend(v7, "floatValue");
      v33 = v16 > v36;
LABEL_28:
      v21 = !v33;
      goto LABEL_104;
    case 10:
      objc_msgSend(v7, "floatValue");
      v38 = v37;
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "bounds");
      Width = CGRectGetWidth(v75);
      goto LABEL_35;
    case 11:
      objc_msgSend(v7, "floatValue");
      v42 = v41;
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "bounds");
      v43 = CGRectGetWidth(v76);
      goto LABEL_39;
    case 12:
      objc_msgSend(v7, "floatValue");
      v45 = v44;
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "bounds");
      Height = CGRectGetWidth(v77);
      goto LABEL_37;
    case 13:
      objc_msgSend(v7, "floatValue");
      v38 = v47;
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "bounds");
      Width = CGRectGetHeight(v78);
LABEL_35:
      v21 = Width == v38;
      goto LABEL_103;
    case 14:
      objc_msgSend(v7, "floatValue");
      v45 = v48;
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "bounds");
      Height = CGRectGetHeight(v79);
LABEL_37:
      v21 = Height >= v45;
      goto LABEL_103;
    case 15:
      objc_msgSend(v7, "floatValue");
      v42 = v49;
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "bounds");
      v43 = CGRectGetHeight(v80);
LABEL_39:
      v21 = v43 <= v42;
      goto LABEL_103;
    case 16:
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "userInterfaceIdiom");

      if (v51 > 2)
        v52 = 0;
      else
        v52 = off_24EB87228[v51];
      goto LABEL_98;
    case 17:
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "systemVersion");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "compare:options:", v7, 64) == 0;
      goto LABEL_61;
    case 18:
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "systemVersion");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v53, "compare:options:", v7, 64) == -1;
      goto LABEL_45;
    case 19:
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "systemVersion");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v53, "compare:options:", v7, 64) == 1;
LABEL_45:
      v21 = !v55;
      goto LABEL_102;
    case 20:
      -[TVMediaQueryEvaluator templateElement](self, "templateElement");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = +[TVMLUtilities semanticContentAttributeForTemplateElement:](TVMLUtilities, "semanticContentAttributeForTemplateElement:", v56);

      v52 = CFSTR("ltr");
      if (v57 != 3)
      {
        if (v57 == 4)
        {
          v52 = CFSTR("rtl");
        }
        else
        {
          v69 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection");
          v70 = CFSTR("rtl");
          if (v69 != 1)
            v70 = 0;
          if (v69)
            v52 = v70;
        }
      }
LABEL_98:
      objc_msgSend(v7, "lowercaseString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (__CFString *)v52;
      goto LABEL_99;
    case 21:
      if (objc_msgSend(v12, "horizontalSizeClass") == 1)
        goto LABEL_54;
      v58 = objc_msgSend(v12, "horizontalSizeClass");
      goto LABEL_69;
    case 22:
      if (objc_msgSend(v12, "verticalSizeClass") == 1)
      {
LABEL_54:
        objc_msgSend(v7, "lowercaseString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = CFSTR("compact");
        goto LABEL_99;
      }
      v58 = objc_msgSend(v12, "verticalSizeClass");
LABEL_69:
      if (v58 != 2)
        goto LABEL_73;
      objc_msgSend(v7, "lowercaseString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = CFSTR("regular");
      goto LABEL_99;
    case 23:
      v60 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "interfaceOrientation");
      if ((unint64_t)(v60 - 1) > 1)
      {
        if ((unint64_t)(v60 - 3) > 1)
        {
LABEL_73:
          v21 = 0;
          goto LABEL_104;
        }
        objc_msgSend(v7, "lowercaseString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = CFSTR("landscape");
      }
      else
      {
        objc_msgSend(v7, "lowercaseString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = CFSTR("portrait");
      }
LABEL_99:
      v21 = -[__CFString isEqualToString:](v59, "isEqualToString:", v39);
      goto LABEL_103;
    case 24:
      objc_msgSend(v7, "lowercaseString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(CFSTR("phone"), "isEqual:", v39))
      {
        objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v53, "userInterfaceIdiom");
        v54 = v14 <= 639.0 || v61 == 0;
LABEL_61:
        v21 = v54;
      }
      else if (objc_msgSend(CFSTR("pad"), "isEqual:", v39))
      {
        objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v53, "userInterfaceIdiom");
        v67 = v14 > 639.0 && v65 == 1;
        if (v14 == 1366.0)
          v67 = 0;
        v21 = v16 != 1366.0 && v67;
      }
      else
      {
        if (!objc_msgSend(CFSTR("pad-l"), "isEqual:", v39))
          goto LABEL_111;
        v72 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "interfaceOrientation");
        objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v53, "userInterfaceIdiom") == 1)
        {
          if ((unint64_t)(v72 - 3) <= 1 && v14 == 1366.0)
          {
            v21 = 1;
          }
          else
          {
            v74 = v16 == 1366.0 && (unint64_t)(v72 - 1) < 2;
            v21 = v14 == 1024.0 && v74;
          }
        }
        else
        {
          v21 = 0;
        }
      }
      goto LABEL_102;
    case 25:
      objc_msgSend(v7, "lowercaseString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(CFSTR("small"), "isEqual:", v39))
      {
        objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "preferredContentSizeCategory");
        v62 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (UIContentSizeCategoryCompareToCategory(v62, (UIContentSizeCategory)*MEMORY[0x24BDF7678]) == NSOrderedDescending)
        {
          objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "preferredContentSizeCategory");
          v64 = (NSString *)objc_claimAutoreleasedReturnValue();
          v21 = UIContentSizeCategoryCompareToCategory(v64, (UIContentSizeCategory)*MEMORY[0x24BDF7650]) == NSOrderedAscending;

        }
        else
        {
          v21 = 0;
        }
      }
      else
      {
        if (!objc_msgSend(CFSTR("large"), "isEqual:", v39))
        {
LABEL_111:
          v21 = 0;
          goto LABEL_103;
        }
        objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "preferredContentSizeCategory");
        v62 = (NSString *)objc_claimAutoreleasedReturnValue();
        v21 = UIContentSizeCategoryCompareToCategory(v62, (UIContentSizeCategory)*MEMORY[0x24BDF7658]) == NSOrderedDescending;
      }

LABEL_102:
LABEL_103:

LABEL_104:
      break;
    default:
      goto LABEL_73;
  }
LABEL_105:

  return v21;
}

void __64__TVMediaQueryEvaluator__evaluateAllMediaFeatureType_withValue___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[28];
  _QWORD v3[29];

  v3[28] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("appearance");
  v2[1] = CFSTR("-tv-theme");
  v3[0] = &unk_24EBCCDA8;
  v3[1] = &unk_24EBCCDA8;
  v2[2] = CFSTR("tv-theme");
  v2[3] = CFSTR("pixel-ratio");
  v3[2] = &unk_24EBCCDA8;
  v3[3] = &unk_24EBCCDC0;
  v2[4] = CFSTR("min-pixel-ratio");
  v2[5] = CFSTR("max-pixel-ratio");
  v3[4] = &unk_24EBCCDD8;
  v3[5] = &unk_24EBCCDF0;
  v2[6] = CFSTR("width");
  v2[7] = CFSTR("min-width");
  v3[6] = &unk_24EBCCE08;
  v3[7] = &unk_24EBCCE20;
  v2[8] = CFSTR("max-width");
  v2[9] = CFSTR("height");
  v3[8] = &unk_24EBCCE38;
  v3[9] = &unk_24EBCCE50;
  v2[10] = CFSTR("min-height");
  v2[11] = CFSTR("max-height");
  v3[10] = &unk_24EBCCE68;
  v3[11] = &unk_24EBCCE80;
  v2[12] = CFSTR("device-width");
  v2[13] = CFSTR("min-device-width");
  v3[12] = &unk_24EBCCE98;
  v3[13] = &unk_24EBCCEB0;
  v2[14] = CFSTR("max-device-width");
  v2[15] = CFSTR("device-height");
  v3[14] = &unk_24EBCCEC8;
  v3[15] = &unk_24EBCCEE0;
  v2[16] = CFSTR("min-device-height");
  v2[17] = CFSTR("max-device-height");
  v3[16] = &unk_24EBCCEF8;
  v3[17] = &unk_24EBCCF10;
  v2[18] = CFSTR("interface-idiom");
  v2[19] = CFSTR("tv-os-version");
  v3[18] = &unk_24EBCCF28;
  v3[19] = &unk_24EBCCF40;
  v2[20] = CFSTR("tv-min-os-version");
  v2[21] = CFSTR("tv-max-os-version");
  v3[20] = &unk_24EBCCF58;
  v3[21] = &unk_24EBCCF70;
  v2[22] = CFSTR("layout-direction");
  v2[23] = CFSTR("size-horizontal");
  v3[22] = &unk_24EBCCF88;
  v3[23] = &unk_24EBCCFA0;
  v2[24] = CFSTR("size-vertical");
  v2[25] = CFSTR("orientation");
  v3[24] = &unk_24EBCCFB8;
  v3[25] = &unk_24EBCCFD0;
  v2[26] = CFSTR("layout");
  v2[27] = CFSTR("ax-text");
  v3[26] = &unk_24EBCCFE8;
  v3[27] = &unk_24EBCD000;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 28);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_evaluateAllMediaFeatureType_withValue__sFeatureLookup;
  _evaluateAllMediaFeatureType_withValue__sFeatureLookup = v0;

}

+ (id)_mobileGestaltStringForKey:(__CFString *)a3
{
  const void *v3;
  const void *v4;
  CFTypeID v5;
  void *v6;

  v3 = (const void *)MGCopyAnswer();
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (IKViewElement)templateElement
{
  return self->_templateElement;
}

- (void)setTemplateElement:(id)a3
{
  objc_storeStrong((id *)&self->_templateElement, a3);
}

- (UITraitEnvironment)traitEnvironment
{
  return (UITraitEnvironment *)objc_loadWeakRetained((id *)&self->_traitEnvironment);
}

- (_TVWindowSizeAdaptor)windowSizeAdaptor
{
  return self->_windowSizeAdaptor;
}

- (TVMediaQueryEvaluatorDelegate)delegate
{
  return (TVMediaQueryEvaluatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_traitEnvironment);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_windowSizeAdaptor, 0);
}

@end
