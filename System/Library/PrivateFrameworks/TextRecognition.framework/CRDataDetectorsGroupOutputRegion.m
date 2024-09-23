@implementation CRDataDetectorsGroupOutputRegion

- (CRDataDetectorsGroupOutputRegion)initWithDDRegions:(id)a3 children:(id)a4 groupType:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  double v19;
  unsigned int v20;
  CRDataDetectorsGroupOutputRegion *v21;
  CRDataDetectorsGroupOutputRegion *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  uint64_t v40;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    v12 = 0.0;
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v49;
      LODWORD(v15) = 2;
      v16 = 0.0;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v49 != v14)
            objc_enumerationMutation(v10);
          v18 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(v18, "baselineAngle");
          v16 = v16 + v19;
          v20 = objc_msgSend(v18, "confidence");
          if (v20 >= v15)
            v15 = v15;
          else
            v15 = v20;
        }
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v13);
    }
    else
    {
      v15 = 2;
      v16 = 0.0;
    }

    if (objc_msgSend(v10, "count"))
      v12 = v16 / (double)(unint64_t)objc_msgSend(v10, "count");
    v47.receiver = self;
    v47.super_class = (Class)CRDataDetectorsGroupOutputRegion;
    v22 = -[CROutputRegion initWithConfidence:baselineAngle:](&v47, sel_initWithConfidence_baselineAngle_, v15, v12);
    if (v22)
    {
      v42 = v9;
      v23 = (void *)objc_msgSend(v10, "copy");
      -[CROutputRegion setChildren:](v22, "setChildren:", v23);

      v24 = (void *)objc_msgSend(v8, "copy");
      -[CROutputRegion setDataDetectorRegions:](v22, "setDataDetectorRegions:", v24);

      v22->_groupType = a5;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      -[CROutputRegion dataDetectorRegions](v22, "dataDetectorRegions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      if (v26)
      {
        v27 = v26;
        v28 = 0;
        v29 = 0;
        v30 = *(_QWORD *)v44;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v44 != v30)
              objc_enumerationMutation(v25);
            v32 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
            if (v28)
            {
              objc_msgSend(v28, "baselineAngle");
              v34 = v33;
              objc_msgSend(v32, "baselineAngle");
              v36 = v35 + v34 * (double)v29++;
              v37 = v36 / (double)v29;
              objc_msgSend(v32, "boundingQuad");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(float *)&v39 = v37;
              objc_msgSend(v28, "unionWithNormalizedQuad:baselineAngle:", v38, v39);
              v40 = objc_claimAutoreleasedReturnValue();

              v28 = (void *)v40;
            }
            else
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "boundingQuad");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              ++v29;
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        }
        while (v27);
      }
      else
      {
        v28 = 0;
      }

      -[CROutputRegion setBoundingQuad:](v22, "setBoundingQuad:", v28);
      v9 = v42;
    }
    self = v22;
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CRDataDetectorsGroupOutputRegion groupType](self, "groupType");
  -[CROutputRegion dataDetectorRegions](self, "dataDetectorRegions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[CROutputRegion children](self, "children");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@] type:%lu #DD:%lu #Non-DD:%lu"), v6, v7, v9, objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[CROutputRegion dataDetectorRegions](self, "dataDetectorRegions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v16), "debugDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("- DD: %@"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v19);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v14);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[CROutputRegion dataDetectorRegions](self, "dataDetectorRegions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v24), "debugDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("- Non-DD: %@"), v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v27);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v22);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (unint64_t)type
{
  return 4096;
}

- (BOOL)computesBoundsFromChildren
{
  return 1;
}

- (BOOL)computesTranscriptFromChildren
{
  return 1;
}

- (unint64_t)groupType
{
  return self->_groupType;
}

@end
