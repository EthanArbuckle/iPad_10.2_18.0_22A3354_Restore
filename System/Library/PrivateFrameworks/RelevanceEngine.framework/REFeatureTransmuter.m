@implementation REFeatureTransmuter

- (id)_buildGraph
{
  REDependencyGraph *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = -[REDependencyGraph initWithPointerFunctions:]([REDependencyGraph alloc], "initWithPointerFunctions:", 0);
  -[REFeatureSet allFeatures](self->_outputSet, "allFeatures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  while (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeLastObject");
    objc_msgSend(v6, "member:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v7)
    {
      if (!-[REDependencyGraph containsItem:](v3, "containsItem:", v7))
        -[REDependencyGraph addItem:](v3, "addItem:", v7);
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v7, "_dependentFeatures", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
            if (!-[REDependencyGraph containsItem:](v3, "containsItem:", v14))
              -[REDependencyGraph addItem:](v3, "addItem:", v14);
            -[REDependencyGraph markItem:dependentOnItem:](v3, "markItem:dependentOnItem:", v7, v14);
            objc_msgSend(v5, "addObject:", v14);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v11);
      }

    }
  }

  return v3;
}

- (REFeatureSet)outputFeatures
{
  return self->_outputSet;
}

void __86__REFeatureTransmuter_initWithInputFeatures_outputFeatures_outputFeatureMapGenerator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_supportedFeature:") & 1) == 0)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Feature %@ isn't supported"), v3, v4, v5, v6, v7, v8, (uint64_t)v9);

}

- (BOOL)_supportedFeature:(id)a3
{
  void *v3;

  v3 = (void *)objc_opt_class();
  if ((objc_msgSend(v3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(v3, "isSubclassOfClass:", objc_opt_class());
  }
}

- (REFeatureTransmuter)initWithInputFeatures:(id)a3 outputFeatures:(id)a4 outputFeatureMapGenerator:(id)a5
{
  id v8;
  id v9;
  id v10;
  REFeatureTransmuter *v11;
  REFeatureTransmuter *v12;
  uint64_t v13;
  REFeatureSet *inputSet;
  uint64_t v15;
  REFeatureSet *outputSet;
  void *v17;
  REFeatureTransmuter *v18;
  uint64_t v19;
  NSArray *orderedFeatures;
  REFeatureMapGenerator *v21;
  REFeatureMapGenerator *orderedFeatureMapGenerator;
  uint64_t v23;
  REFeatureMap *scratchValues;
  _QWORD v26[4];
  REFeatureTransmuter *v27;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)REFeatureTransmuter;
  v11 = -[REFeatureTransmuter init](&v28, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_outputFeatureMapGenerator, a5);
    v13 = objc_msgSend(v8, "copy");
    inputSet = v12->_inputSet;
    v12->_inputSet = (REFeatureSet *)v13;

    v15 = objc_msgSend(v9, "copy");
    outputSet = v12->_outputSet;
    v12->_outputSet = (REFeatureSet *)v15;

    REOptimizeFeatureSetGraph(v12->_outputSet);
    -[REFeatureTransmuter _buildGraph](v12, "_buildGraph");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __86__REFeatureTransmuter_initWithInputFeatures_outputFeatures_outputFeatureMapGenerator___block_invoke;
    v26[3] = &unk_24CF8CEE0;
    v18 = v12;
    v27 = v18;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v26);
    objc_msgSend(v17, "topologicalSortedItems");
    v19 = objc_claimAutoreleasedReturnValue();
    orderedFeatures = v18->_orderedFeatures;
    v18->_orderedFeatures = (NSArray *)v19;

    v21 = -[REFeatureMapGenerator initWithFeatureList:]([REFeatureMapGenerator alloc], "initWithFeatureList:", v18->_orderedFeatures);
    orderedFeatureMapGenerator = v18->_orderedFeatureMapGenerator;
    v18->_orderedFeatureMapGenerator = v21;

    -[REFeatureMapGenerator createFeatureMap](v18->_orderedFeatureMapGenerator, "createFeatureMap");
    v23 = objc_claimAutoreleasedReturnValue();
    scratchValues = v18->_scratchValues;
    v18->_scratchValues = (REFeatureMap *)v23;

    v18->_scratchTaggedValues = (unint64_t *)malloc_type_calloc(-[REFeatureMap featureCount](v18->_scratchValues, "featureCount"), 8uLL, 0x100004000313F17uLL);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_scratchTaggedValues);
  v3.receiver = self;
  v3.super_class = (Class)REFeatureTransmuter;
  -[REFeatureTransmuter dealloc](&v3, sel_dealloc);
}

- (id)transformFeatureMaps:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t (**v8)(_QWORD, _QWORD);
  NSArray *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  const void *v33;
  uint64_t v34;
  const void *v35;
  id v36;
  id v38;
  id v39;
  NSArray *v40;
  uint64_t v41;
  void (**v42)(_QWORD, _QWORD, _QWORD);
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[5];
  id v60;
  _QWORD v61[5];
  id v62;
  id v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[REFeatureMapGenerator createFeatureMap](self->_outputFeatureMapGenerator, "createFeatureMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REFeatureMap removeAllValues](self->_scratchValues, "removeAllValues");
  v6 = MEMORY[0x24BDAC760];
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = __44__REFeatureTransmuter_transformFeatureMaps___block_invoke;
  v61[3] = &unk_24CF8CF08;
  v61[4] = self;
  v39 = v4;
  v62 = v39;
  v7 = v5;
  v63 = v7;
  v8 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x2199B2434](v61);
  v59[0] = v6;
  v59[1] = 3221225472;
  v59[2] = __44__REFeatureTransmuter_transformFeatureMaps___block_invoke_2;
  v59[3] = &unk_24CF8CF30;
  v59[4] = self;
  v38 = v7;
  v60 = v38;
  v42 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199B2434](v59);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v9 = self->_orderedFeatures;
  v44 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
  if (v44)
  {
    v43 = *(_QWORD *)v56;
    v40 = v9;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v56 != v43)
          objc_enumerationMutation(v9);
        v11 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "transformer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v11;
          objc_msgSend(v11, "_dependentFeatures");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
          if (v15)
          {
            v16 = v15;
            v17 = 0;
            v18 = *(_QWORD *)v52;
            while (2)
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v52 != v18)
                  objc_enumerationMutation(v14);
                v20 = v8[2](v8, *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
                if (!v20)
                {

                  goto LABEL_30;
                }
                self->_scratchTaggedValues[v17++] = v20;
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
              if (v16)
                continue;
              break;
            }
          }
          else
          {
            v17 = 0;
          }

          v35 = (const void *)objc_msgSend(v12, "_createTransformFromValues:count:", self->_scratchTaggedValues, v17);
          ((void (**)(_QWORD, void *, const void *))v42)[2](v42, v45, v35);
          REReleaseFeatureValueTaggedPointer(v35);
LABEL_30:

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v41 = i;
            v46 = v11;
            objc_msgSend(v11, "features");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v23 = v21;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
            if (v24)
            {
              v25 = v24;
              v26 = 0;
              v27 = *(_QWORD *)v48;
              while (2)
              {
                for (k = 0; k != v25; ++k)
                {
                  if (*(_QWORD *)v48 != v27)
                    objc_enumerationMutation(v23);
                  v29 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * k);
                  v30 = ((uint64_t (**)(_QWORD, void *))v8)[2](v8, v29);
                  if (!v30)
                  {

                    goto LABEL_32;
                  }
                  self->_scratchTaggedValues[v26++] = v30;
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v29, "_bitCount"));
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "addObject:", v31);

                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
                if (v25)
                  continue;
                break;
              }
            }

            v32 = RECrossFeatureValues((uint64_t)self->_scratchTaggedValues, v22);
            v33 = (const void *)RECreateIntegerFeatureValueTaggedPointer(v32);
            ((void (**)(_QWORD, void *, const void *))v42)[2](v42, v46, v33);
            REReleaseFeatureValueTaggedPointer(v33);
LABEL_32:

            v9 = v40;
            i = v41;
          }
          else
          {
            v34 = ((uint64_t (**)(_QWORD, void *))v8)[2](v8, v11);
            ((void (**)(_QWORD, void *, uint64_t))v42)[2](v42, v11, v34);
          }
        }
      }
      v44 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    }
    while (v44);
  }

  v36 = v38;
  return v36;
}

uint64_t __44__REFeatureTransmuter_transformFeatureMaps___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "containsFeature:", v3))
  {
    v4 = (id *)(a1 + 40);
  }
  else if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsFeature:", v3))
  {
    v4 = (id *)(a1 + 48);
  }
  else
  {
    v4 = (id *)(*(_QWORD *)(a1 + 32) + 40);
  }
  v5 = objc_msgSend(*v4, "valueForFeature:", v3);

  return v5;
}

void __44__REFeatureTransmuter_transformFeatureMaps___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id *v6;
  id v7;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v7 = a2;
  if (objc_msgSend(v5, "containsFeature:"))
    v6 = (id *)(a1 + 40);
  else
    v6 = (id *)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*v6, "setValue:forFeature:", a3, v7);

}

- (REFeatureSet)inputFeatures
{
  return self->_inputSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureValuesCacheLock, 0);
  objc_storeStrong((id *)&self->_featureValuesCache, 0);
  objc_storeStrong((id *)&self->_outputFeatureMapGenerator, 0);
  objc_storeStrong((id *)&self->_scratchValues, 0);
  objc_storeStrong((id *)&self->_orderedFeatureMapGenerator, 0);
  objc_storeStrong((id *)&self->_orderedFeatures, 0);
  objc_storeStrong((id *)&self->_outputSet, 0);
  objc_storeStrong((id *)&self->_inputSet, 0);
}

@end
