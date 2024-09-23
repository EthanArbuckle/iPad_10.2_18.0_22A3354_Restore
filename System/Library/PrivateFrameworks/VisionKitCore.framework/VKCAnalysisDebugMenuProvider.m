@implementation VKCAnalysisDebugMenuProvider

- (void)presentDebugMenuProvider:(id)a3 fromView:(id)a4 rect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  VKQuad *v16;
  id v17;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = (objc_class *)MEMORY[0x1E0CEA4B8];
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend([v11 alloc], "initWithDelegate:", self);
  -[VKCAnalysisDebugMenuProvider setContextMenuInteraction:](self, "setContextMenuInteraction:", v14);

  -[VKCAnalysisDebugMenuProvider contextMenuInteraction](self, "contextMenuInteraction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addInteraction:", v15);

  -[VKCAnalysisDebugMenuProvider setProvider:](self, "setProvider:", v13);
  -[VKCAnalysisDebugMenuProvider contextMenuInteraction](self, "contextMenuInteraction");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v16 = -[VKQuad initWithRect:]([VKQuad alloc], "initWithRect:", x, y, width, height);
  -[VKQuad bottomRight](v16, "bottomRight");
  objc_msgSend(v17, "_presentMenuAtLocation:");

}

- (id)menuFromProvider:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  float v48;
  const __CFString *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  unint64_t v89;
  VKCAnalysisDebugMenuProvider *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;

  v4 = a3;
  objc_msgSend(v4, "analysisResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  objc_msgSend(v4, "selectedRange");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "totalQuadTextArea");
  v10 = v9;
  objc_msgSend(v4, "totalBoundingBoxTextArea");
  v12 = v11;
  v90 = self;
  v91 = (void *)v6;
  if (v4)
  {
    objc_msgSend(v4, "visibleTextAreaInfo");
    v13 = 0.0 * 100.0;
    v14 = (int)0.0;
    v15 = v14;
    v86 = v14;
  }
  else
  {
    v86 = 0;
    v15 = 0;
    v14 = 0;
    v13 = 0.0;
  }
  v16 = v10 * 100.0;
  v17 = v12 * 100.0;
  v89 = objc_msgSend(v4, "subjectRequestStatus");
  objc_msgSend(v4, "subjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v18, "subjectCount");
  v88 = v18;
  objc_msgSend(v18, "animatedStickerScore");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "analysisResult");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "request");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForAnalysisTypes(objc_msgSend(v21, "analysisTypes"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("AnalysisTypes"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v23);

  VKMUIStringForAnalysisInteractionTypes(objc_msgSend(v4, "activeInteractionTypes"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("Interaction Types"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v25);

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("Visible Quad Height (In Window)"), v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v26);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("Characters"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v28);

  v29 = (void *)MEMORY[0x1E0CEA2A8];
  VKMUIStringForVKRange(v94);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "vk_itemWithTitle:subtitle:", CFSTR("SelectedRange"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v31);

  if (objc_msgSend(v94, "length"))
  {
    objc_msgSend(v93, "vk_substringWithVKRange:", v94);
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = CFSTR("(none)");
  }

  v33 = (void *)MEMORY[0x1E0CEA2A8];
  -[__CFString vk_substringToIndex:](v32, "vk_substringToIndex:", 50);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "vk_itemWithTitle:subtitle:", CFSTR("Selected Text"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v35);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bounding Box:%.02f%%"), *(_QWORD *)&v13);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("Visible Text Area"), v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v37);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Box:%.02f%% Quad:%.02f%%"), *(_QWORD *)&v17, *(_QWORD *)&v16);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("Full Image Text Area"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v39);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("max:%d min:%d avg:%d"), v14, v15, v86);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("Visible Quad Height (In Window)"), v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v41);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v87);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "description");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("Subject Count"), v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v44);

  VKMUIStringForSubjectRequestStatus(v89);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("Subject Request Status"), v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v46);

  if (v88)
  {
    if (v92)
    {
      v47 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v92, "floatValue");
      objc_msgSend(v47, "stringWithFormat:", CFSTR("Sticker Score: %.02f"), v48);
      v49 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = CFSTR("StickerScore: nil");
    }

    objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", v49, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v50);

    v45 = (void *)v49;
  }
  objc_msgSend(v4, "contentsRect");
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v58 = v57;
  objc_msgSend(v4, "visibleImageRect");
  v60 = v59;
  v62 = v61;
  v64 = v63;
  v66 = v65;
  v67 = (void *)MEMORY[0x1E0CB3940];
  VKMUIStringForRect(v52, v54, v56, v58);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "stringWithFormat:", CFSTR("%@"), v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("ContentsRect"), v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v70);

  v71 = (void *)MEMORY[0x1E0CB3940];
  VKMUIStringForRect(v60, v62, v64, v66);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "stringWithFormat:", CFSTR("%@"), v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("VisibleRect"), v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v74);

  objc_msgSend(v5, "textDataDetectorElements");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCAnalysisDebugMenuProvider menuFromElements:title:](v90, "menuFromElements:title:", v75, CFSTR("Data Detectors"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v76);

  objc_msgSend(v5, "mrcDataDetectorElements");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCAnalysisDebugMenuProvider menuFromElements:title:](v90, "menuFromElements:title:", v77, CFSTR("MRC DD"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v78);

  objc_msgSend(v5, "visualSearchResult");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "resultItems");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCAnalysisDebugMenuProvider menuFromElements:title:](v90, "menuFromElements:title:", v80, CFSTR("Visual Search"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v81);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v91);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", v82, 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v83);

  objc_msgSend(MEMORY[0x1E0CEA740], "vk_menuWithItems:title:", v19, 0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  return v84;
}

- (id)menuFromElements:(id)a3 title:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@: (%lu)"), v6, objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "vk_compactMap:", &__block_literal_global_8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA740], "vk_menuWithItems:title:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __55__VKCAnalysisDebugMenuProvider_menuFromElements_title___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "debugMenu");
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0CEA4B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__VKCAnalysisDebugMenuProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v9[3] = &unk_1E9463488;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_msgSend(v6, "configurationWithIdentifier:previewProvider:actionProvider:", 0, &__block_literal_global_82, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

uint64_t __86__VKCAnalysisDebugMenuProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke()
{
  return 0;
}

id __86__VKCAnalysisDebugMenuProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "menuFromProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEACE0], "defaultStyle", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredLayout:", 3);
  return v4;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(v5, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeInteraction:", v5);

}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setContextMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, a3);
}

- (VKAnalysisDebugInfoProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
}

@end
