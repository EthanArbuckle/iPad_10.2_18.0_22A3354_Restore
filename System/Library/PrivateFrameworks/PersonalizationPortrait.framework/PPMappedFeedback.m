@implementation PPMappedFeedback

- (PPMappedFeedback)initWithExplicitlyEngagedString:(id)a3 mappingId:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  PPMappedFeedback *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PPMappedFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:", v9, 0, 0, 0, 0, v7, v12, v13);
  return v10;
}

- (PPMappedFeedback)initWithExplicitlyRejectedString:(id)a3 mappingId:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  PPMappedFeedback *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PPMappedFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:", 0, v9, 0, 0, 0, v7, v12, v13);
  return v10;
}

- (PPMappedFeedback)initWithImplicitlyEngagedString:(id)a3 mappingId:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  PPMappedFeedback *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PPMappedFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:", 0, 0, v9, 0, 0, v7, v12, v13);
  return v10;
}

- (PPMappedFeedback)initWithImplicitlyRejectedString:(id)a3 mappingId:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  PPMappedFeedback *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PPMappedFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:", 0, 0, 0, v9, 0, v7, v12, v13);
  return v10;
}

- (PPMappedFeedback)initWithOfferedString:(id)a3 mappingId:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  PPMappedFeedback *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PPMappedFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:", 0, 0, 0, 0, v9, v7, v12, v13);
  return v10;
}

- (PPMappedFeedback)initWithExplicitlyEngagedStrings:(id)a3 explicitlyRejectedStrings:(id)a4 implicitlyEngagedStrings:(id)a5 implicitlyRejectedStrings:(id)a6 mappingId:(id)a7
{
  return -[PPMappedFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:", a3, a4, a5, a6, 0, a7);
}

- (PPMappedFeedback)initWithExplicitlyEngagedStrings:(id)a3 implicitlyEngagedStrings:(id)a4 offeredStrings:(id)a5 mappingId:(id)a6
{
  return -[PPMappedFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:", a3, 0, a4, 0, a5, a6);
}

- (PPMappedFeedback)initWithExplicitlyEngagedStrings:(id)a3 explicitlyRejectedStrings:(id)a4 implicitlyEngagedStrings:(id)a5 implicitlyRejectedStrings:(id)a6 offeredStrings:(id)a7 mappingId:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  PPFeedbackItem *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  PPFeedbackItem *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  PPFeedbackItem *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  PPFeedbackItem *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  PPFeedbackItem *v47;
  void *v48;
  PPMappedFeedback *v49;
  id v51;
  id v52;
  void *v53;
  objc_super v55;
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
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v51 = a7;
  v52 = a8;
  v17 = (void *)objc_opt_new();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v18 = v13;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v73;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v73 != v21)
          objc_enumerationMutation(v18);
        v23 = -[PPFeedbackItem initWithItemString:itemFeedbackType:]([PPFeedbackItem alloc], "initWithItemString:itemFeedbackType:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v22), 1, v51);
        objc_msgSend(v17, "addObject:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    }
    while (v20);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v24 = v14;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v69;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v69 != v27)
          objc_enumerationMutation(v24);
        v29 = -[PPFeedbackItem initWithItemString:itemFeedbackType:]([PPFeedbackItem alloc], "initWithItemString:itemFeedbackType:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v28), 3);
        objc_msgSend(v17, "addObject:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
    }
    while (v26);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v30 = v15;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v65;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v65 != v33)
          objc_enumerationMutation(v30);
        v35 = -[PPFeedbackItem initWithItemString:itemFeedbackType:]([PPFeedbackItem alloc], "initWithItemString:itemFeedbackType:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v34), 2);
        objc_msgSend(v17, "addObject:", v35);

        ++v34;
      }
      while (v32 != v34);
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
    }
    while (v32);
  }
  v53 = v18;

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v36 = v16;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v61;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v61 != v39)
          objc_enumerationMutation(v36);
        v41 = -[PPFeedbackItem initWithItemString:itemFeedbackType:]([PPFeedbackItem alloc], "initWithItemString:itemFeedbackType:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v40), 4);
        objc_msgSend(v17, "addObject:", v41);

        ++v40;
      }
      while (v38 != v40);
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
    }
    while (v38);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v42 = v51;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v57;
    do
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v57 != v45)
          objc_enumerationMutation(v42);
        v47 = -[PPFeedbackItem initWithItemString:itemFeedbackType:]([PPFeedbackItem alloc], "initWithItemString:itemFeedbackType:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v46), 5);
        objc_msgSend(v17, "addObject:", v47);

        ++v46;
      }
      while (v44 != v46);
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
    }
    while (v44);
  }

  v48 = (void *)objc_msgSend(v17, "copy");
  v55.receiver = self;
  v55.super_class = (Class)PPMappedFeedback;
  v49 = -[PPBaseFeedback initWithFeedbackItems:mappingId:](&v55, sel_initWithFeedbackItems_mappingId_, v48, v52);

  return v49;
}

@end
