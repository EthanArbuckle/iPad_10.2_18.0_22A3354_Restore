@implementation PGFeatureAugmenterSupervisedMixUp

+ (id)name
{
  return CFSTR("SupervisedMixUp");
}

- (id)labeledFloatVectorsWithLabeledFloatVectors:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  PGLabeledFloatVector *v27;
  PGFeatureAugmenterSupervisedMixUp *v29;
  id *v30;
  void *v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  if (objc_msgSend(v32, "count"))
  {
    v29 = self;
    v30 = a4;
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v32, "count"));
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v6 = v32;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v39 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v11 = objc_alloc(MEMORY[0x1E0D42A48]);
          objc_msgSend(v10, "floatVector");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "data");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v11, "initWithData:", v13);

          objc_msgSend(v10, "label");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "appendVector:", v15);

          objc_msgSend(v33, "addObject:", v14);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v7);
    }

    -[PGFeatureAugmenterMixUp floatVectorsWithFloatVectors:error:](self, "floatVectorsWithFloatVectors:error:", v33, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatVector");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v31, "count"));
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v20 = v31;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v35 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          objc_msgSend(v24, "sliceFromStart:toEnd:", 0, v18, v29);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "sliceFromStart:toEnd:", v18, objc_msgSend(v24, "count"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[PGLabeledFloatVector initWithFloatVector:label:]([PGLabeledFloatVector alloc], "initWithFloatVector:label:", v25, v26);
          objc_msgSend(v19, "addObject:", v27);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v21);
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

@end
