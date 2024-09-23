@implementation SXTextInteractionContextProvider

- (SXTextInteractionContextProvider)initWithTangierController:(id)a3 actionManager:(id)a4
{
  id v7;
  id v8;
  SXTextInteractionContextProvider *v9;
  SXTextInteractionContextProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXTextInteractionContextProvider;
  v9 = -[SXTextInteractionContextProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tangierController, a3);
    objc_storeStrong((id *)&v10->_actionManager, a4);
  }

  return v10;
}

- (id)contextMenuAtLocation:(CGPoint)a3 viewport:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67__SXTextInteractionContextProvider_contextMenuAtLocation_viewport___block_invoke;
  v11[3] = &unk_24D68A970;
  v11[4] = self;
  v8 = v7;
  v12 = v8;
  v13 = &v14;
  -[SXTextInteractionContextProvider repAndHyperlinkAtLocation:viewport:block:](self, "repAndHyperlinkAtLocation:viewport:block:", v8, v11, x, y);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __67__SXTextInteractionContextProvider_contextMenuAtLocation_viewport___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = *(void **)(a1 + 32);
    v8 = objc_msgSend(v6, "range");
    objc_msgSend(v7, "viewportRectForLinkInRep:range:viewport:", v25, v8, v9, *(_QWORD *)(a1 + 40));
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(*(id *)(a1 + 32), "actionManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "action");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contextMenuConfigurationForAction:sourceView:sourceRect:", v19, v20, v11, v13, v15, v17);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "tangierController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "endSelection");

    }
  }

}

- (void)commitPreviewViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXTextInteractionContextProvider actionManager](self, "actionManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commitPreviewViewController:", v4);

}

- (id)targetedPreviewAtLocation:(CGPoint)a3 viewport:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__SXTextInteractionContextProvider_targetedPreviewAtLocation_viewport___block_invoke;
  v11[3] = &unk_24D68A970;
  v11[4] = self;
  v8 = v7;
  v12 = v8;
  v13 = &v14;
  -[SXTextInteractionContextProvider repAndHyperlinkAtLocation:viewport:block:](self, "repAndHyperlinkAtLocation:viewport:block:", v8, v11, x, y);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __71__SXTextInteractionContextProvider_targetedPreviewAtLocation_viewport___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  id obj;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v68 = v5;
  if (v5 && v6)
  {
    v8 = *(void **)(a1 + 32);
    v9 = objc_msgSend(v6, "range");
    objc_msgSend(v8, "viewportRectForLinkInRep:range:viewport:", v5, v9, v10, *(_QWORD *)(a1 + 40));
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(*(id *)(a1 + 40), "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, v12, v14, v16, v18, *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v20, "setFrame:", v12, v14, v16, v18);
      objc_msgSend(*(id *)(a1 + 40), "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v20);

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "columns");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v66 = v7;
      v25 = objc_msgSend(v7, "range");
      v65 = v24;
      objc_msgSend(v24, "rectsForSelectionRange:selectionType:", v25, v26, 0);
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v70 != v29)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "CGRectValue");
            objc_msgSend(v68, "convertNaturalRectToUnscaledCanvas:");
            v32 = v31;
            v34 = v33;
            v36 = v35;
            v38 = v37;
            objc_msgSend(*(id *)(a1 + 32), "tangierController");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "icc");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "convertUnscaledToBoundsRect:", v32, v34, v36, v38);
            v42 = v41;
            v44 = v43;
            v46 = v45;
            v48 = v47;

            objc_msgSend(*(id *)(a1 + 32), "tangierController");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "icc");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "canvasView");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "convertRect:fromView:", v51, v42, v44, v46, v48);
            v53 = v52;
            v55 = v54;
            v57 = v56;
            v59 = v58;

            objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v53, v55, v57, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v60);

          }
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
        }
        while (v28);
      }
      v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6CC8]), "initWithTextLineRects:", v22);
      v62 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E90]), "initWithView:parameters:", v20, v61);
      v63 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v64 = *(void **)(v63 + 40);
      *(_QWORD *)(v63 + 40) = v62;

      v7 = v66;
    }

  }
}

- (id)toolTipAtLocation:(CGPoint)a3 viewport:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__SXTextInteractionContextProvider_toolTipAtLocation_viewport___block_invoke;
  v11[3] = &unk_24D68A970;
  v11[4] = self;
  v8 = v7;
  v12 = v8;
  v13 = &v14;
  -[SXTextInteractionContextProvider repAndHyperlinkAtLocation:viewport:block:](self, "repAndHyperlinkAtLocation:viewport:block:", v8, v11, x, y);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __63__SXTextInteractionContextProvider_toolTipAtLocation_viewport___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)a1[4];
    v7 = v5;
    v8 = objc_msgSend(v7, "range");
    objc_msgSend(v6, "viewportRectForLinkInRep:range:viewport:", v24, v8, v9, a1[5]);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)MEMORY[0x24BDF6F00];
    objc_msgSend(v7, "url");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "absoluteString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "configurationWithToolTip:inRect:", v20, v11, v13, v15, v17);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1[6] + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

  }
}

- (void)repAndHyperlinkAtLocation:(CGPoint)a3 viewport:(id)a4 block:(id)a5
{
  double y;
  double x;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  -[SXTextInteractionContextProvider tangierController](self, "tangierController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "icc");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "canvasView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:toView:", v13, x, y);
  v15 = v14;
  v17 = v16;

  -[SXTextInteractionContextProvider tangierController](self, "tangierController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "icc");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "convertBoundsToUnscaledPoint:", v15, v17);
  v21 = v20;
  v23 = v22;

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = 0;
  -[SXTextInteractionContextProvider tangierController](self, "tangierController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "icc");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __77__SXTextInteractionContextProvider_repAndHyperlinkAtLocation_viewport_block___block_invoke;
  v27[3] = &unk_24D68A998;
  *(double *)&v27[5] = v21;
  *(double *)&v27[6] = v23;
  v27[4] = &v28;
  objc_msgSend(v25, "hitRep:withGesture:passingTest:", 0, v27, v21, v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v10[2](v10, v26, v29[5]);
  _Block_object_dispose(&v28, 8);

}

BOOL __77__SXTextInteractionContextProvider_repAndHyperlinkAtLocation_viewport_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "convertNaturalPointFromUnscaledCanvas:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    objc_msgSend(v3, "smartFieldAtPoint:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v4);

  }
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;

  return v5;
}

- (CGRect)viewportRectForLinkInRep:(id)a3 range:(_NSRange)a4 viewport:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGRect result;

  length = a4.length;
  location = a4.location;
  v9 = (void *)MEMORY[0x24BEB3B68];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "selectionWithRange:", location, length);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rectForSelection:", v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(v11, "convertNaturalRectToUnscaledCanvas:", v14, v16, v18, v20);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  -[SXTextInteractionContextProvider tangierController](self, "tangierController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "icc");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "convertUnscaledToBoundsRect:", v22, v24, v26, v28);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  -[SXTextInteractionContextProvider tangierController](self, "tangierController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "icc");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "canvasView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:fromView:", v41, v32, v34, v36, v38);
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;

  v50 = v43;
  v51 = v45;
  v52 = v47;
  v53 = v49;
  result.size.height = v53;
  result.size.width = v52;
  result.origin.y = v51;
  result.origin.x = v50;
  return result;
}

- (SXTangierController)tangierController
{
  return self->_tangierController;
}

- (SXActionManager)actionManager
{
  return self->_actionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_tangierController, 0);
}

@end
