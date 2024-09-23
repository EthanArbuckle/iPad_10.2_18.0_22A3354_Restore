@implementation PPFeedback

- (PPFeedback)initWithExplicitlyEngagedString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PPFeedback *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PPFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:", v6, 0, 0, 0, 0, v9, v10);
  return v7;
}

- (PPFeedback)initWithExplicitlyRejectedString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PPFeedback *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PPFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:", 0, v6, 0, 0, 0, v9, v10);
  return v7;
}

- (PPFeedback)initWithImplicitlyEngagedString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PPFeedback *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PPFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:", 0, 0, v6, 0, 0, v9, v10);
  return v7;
}

- (PPFeedback)initWithImplicitlyRejectedString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PPFeedback *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PPFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:", 0, 0, 0, v6, 0, v9, v10);
  return v7;
}

- (PPFeedback)initWithOfferedString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PPFeedback *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PPFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:", 0, 0, 0, 0, v6, v9, v10);
  return v7;
}

- (PPFeedback)initWithExplicitlyEngagedStrings:(id)a3 implicitlyEngagedStrings:(id)a4 offeredStrings:(id)a5
{
  return -[PPFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:", a3, 0, a4, 0, a5);
}

- (PPFeedback)initWithExplicitlyEngagedStrings:(id)a3 explicitlyRejectedStrings:(id)a4 implicitlyEngagedStrings:(id)a5 implicitlyRejectedStrings:(id)a6
{
  return -[PPFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:", a3, a4, a5, a6, 0);
}

- (PPFeedback)initWithExplicitlyEngagedStrings:(id)a3 explicitlyRejectedStrings:(id)a4 implicitlyEngagedStrings:(id)a5 implicitlyRejectedStrings:(id)a6 offeredStrings:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  PPFeedbackItem *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  PPFeedbackItem *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  PPFeedbackItem *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  PPFeedbackItem *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  PPFeedbackItem *v45;
  void *v46;
  PPFeedback *v47;
  id v49;
  void *v50;
  objc_super v52;
  __int128 v53;
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
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v49 = a7;
  v15 = (void *)objc_opt_new();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v70;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v70 != v19)
          objc_enumerationMutation(v16);
        v21 = -[PPFeedbackItem initWithItemString:itemFeedbackType:]([PPFeedbackItem alloc], "initWithItemString:itemFeedbackType:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v20), 1);
        objc_msgSend(v15, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    }
    while (v18);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v22 = v12;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v66;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v66 != v25)
          objc_enumerationMutation(v22);
        v27 = -[PPFeedbackItem initWithItemString:itemFeedbackType:]([PPFeedbackItem alloc], "initWithItemString:itemFeedbackType:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * v26), 3);
        objc_msgSend(v15, "addObject:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
    }
    while (v24);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v28 = v13;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v62;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v62 != v31)
          objc_enumerationMutation(v28);
        v33 = -[PPFeedbackItem initWithItemString:itemFeedbackType:]([PPFeedbackItem alloc], "initWithItemString:itemFeedbackType:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v32), 2);
        objc_msgSend(v15, "addObject:", v33);

        ++v32;
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
    }
    while (v30);
  }
  v50 = v16;

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v34 = v14;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v58;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v58 != v37)
          objc_enumerationMutation(v34);
        v39 = -[PPFeedbackItem initWithItemString:itemFeedbackType:]([PPFeedbackItem alloc], "initWithItemString:itemFeedbackType:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v38), 4);
        objc_msgSend(v15, "addObject:", v39);

        ++v38;
      }
      while (v36 != v38);
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
    }
    while (v36);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v40 = v49;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v54;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v54 != v43)
          objc_enumerationMutation(v40);
        v45 = -[PPFeedbackItem initWithItemString:itemFeedbackType:]([PPFeedbackItem alloc], "initWithItemString:itemFeedbackType:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v44), 5);
        objc_msgSend(v15, "addObject:", v45);

        ++v44;
      }
      while (v42 != v44);
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
    }
    while (v42);
  }

  v46 = (void *)objc_msgSend(v15, "copy");
  v52.receiver = self;
  v52.super_class = (Class)PPFeedback;
  v47 = -[PPBaseFeedback initWithFeedbackItems:mappingId:](&v52, sel_initWithFeedbackItems_mappingId_, v46, 0);

  return v47;
}

@end
