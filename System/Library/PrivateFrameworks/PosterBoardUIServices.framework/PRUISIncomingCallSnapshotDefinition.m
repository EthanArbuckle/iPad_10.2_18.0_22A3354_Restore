@implementation PRUISIncomingCallSnapshotDefinition

- (PRUISIncomingCallSnapshotDefinition)initWithBaseIdentifier:(id)a3 context:(id)a4 attachmentUniqueIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  uint64_t v26;
  PRUISIncomingCallSnapshotDefinition *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  PRUISIncomingCallSnapshotDefinition *v35;
  PRUISIncomingCallSnapshotDefinition *v37;
  void *v38;
  id v39;
  id v40;
  id obj;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  objc_super v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  obj = a4;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(v8, "copy");
  _PRUISIncomingCallPosterSnapshotDefinitionLevelSetsForIdentifier(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v13, "containsLevel:", +[PRUISPosterAppearanceObservingAttachmentProvider obscurableContentAttachmentLevel](PRUISPosterAppearanceObservingAttachmentProvider, "obscurableContentAttachmentLevel"));
  v42 = v13;
  v14 = objc_msgSend(v13, "containsLevel:", +[PRUISPosterAppearanceObservingAttachmentProvider overlayContentAttachmentLevel](PRUISPosterAppearanceObservingAttachmentProvider, "overlayContentAttachmentLevel"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v9;
  if (!v10 || !objc_msgSend(v10, "count"))
  {
    v24 = 0;
    v23 = 0;
    if (!v9)
      goto LABEL_22;
    goto LABEL_20;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v40 = v10;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v16)
  {
    v17 = v16;
    v37 = self;
    v38 = v12;
    v39 = v8;
    v18 = 0;
    v19 = *(_QWORD *)v52;
    while (1)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v52 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v22 = _PRUISIncomingCallPosterSnapshotAttachmentTypeIdentifierIsPredefined(v21);
        v23 = _PRUISIncomingCallPosterSnapshotAttachmentTypeIdentifierWillIncludeName(v21);
        if (!v22)
        {
          v18 = 1;
LABEL_12:
          objc_msgSend(v45, "addObject:", v21);
          continue;
        }
        if ((objc_msgSend(v21, "isEqualToString:", PRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel) & v44 | v14) == 1)goto LABEL_12;
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (!v17)
      {
        v12 = v38;
        v8 = v39;
        v9 = v43;
        self = v37;
        goto LABEL_19;
      }
    }
  }
  v18 = 0;
  v23 = 0;
LABEL_19:

  v24 = v18 & 1;
  v10 = v40;
  if (v9)
  {
LABEL_20:
    objc_storeStrong((id *)&self->_context, obj);
    if ((v23 | v24) == 1)
    {
      objc_msgSend(v9, "identifierForSnapshotting");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("-%@"), v25);
      v26 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v26;
    }
  }
LABEL_22:
  v27 = self;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v28 = v10;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v48;
    do
    {
      v32 = 0;
      v33 = v11;
      do
      {
        if (*(_QWORD *)v48 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(v33, "stringByAppendingFormat:", CFSTR("-%@"), *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v32));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        ++v32;
        v33 = v11;
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v30);
  }

  objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("_%@"), &unk_2515430F8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v46.receiver = v27;
  v46.super_class = (Class)PRUISIncomingCallSnapshotDefinition;
  v35 = -[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:](&v46, sel_initWithUniqueIdentifier_includeHeaderElements_includesComplications_levelSets_isUnlocked_renderingContent_renderingMode_previewContent_, v34, 0, 0, v12, 0, 0, 1, 1);

  return v35;
}

- (void)applySceneSettings:(id)a3
{
  PRUISIncomingCallPosterContext *context;
  id v5;
  objc_super v6;

  context = self->_context;
  v5 = a3;
  -[PRUISIncomingCallPosterContext horizontalTitleBoundingRect](context, "horizontalTitleBoundingRect");
  objc_msgSend(v5, "pr_setHorizontalTitleBoundingRect:");
  -[PRUISIncomingCallPosterContext verticalTitleBoundingRect](self->_context, "verticalTitleBoundingRect");
  objc_msgSend(v5, "pr_setVerticalTitleBoundingRect:");
  v6.receiver = self;
  v6.super_class = (Class)PRUISIncomingCallSnapshotDefinition;
  -[PRPosterSnapshotDefinition applySceneSettings:](&v6, sel_applySceneSettings_, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
