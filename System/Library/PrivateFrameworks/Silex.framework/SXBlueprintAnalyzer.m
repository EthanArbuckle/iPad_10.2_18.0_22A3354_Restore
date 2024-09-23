@implementation SXBlueprintAnalyzer

- (void)analyzeBlueprint:(id)a3 DOMObjectProvider:(id)a4 onMarkerFound:(id)a5 then:(id)a6 onEndReached:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  if (v12 && a4 && a5 && a6 && a7)
  {
    v13 = a7;
    v14 = a6;
    v15 = a5;
    v16 = a4;
    v17 = (void *)objc_opt_new();
    objc_msgSend(v16, "components");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXBlueprintAnalyzer markersFromBlueprint:components:DOMObjectProvider:cursor:](self, "markersFromBlueprint:components:DOMObjectProvider:cursor:", v12, v18, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)SXInsertionLog;
    if (os_log_type_enabled((os_log_t)SXInsertionLog, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = 134218240;
      v23 = objc_msgSend(v19, "count");
      v24 = 2048;
      v25 = v12;
      _os_log_impl(&dword_217023000, v21, OS_LOG_TYPE_DEFAULT, "Found %lu marker(s) available for insertion, blueprint=%p", (uint8_t *)&v22, 0x16u);

    }
    -[SXBlueprintAnalyzer iterateMarkers:onMarkerFound:then:onEndReached:](self, "iterateMarkers:onMarkerFound:then:onEndReached:", v19, v15, v14, v13);

  }
}

- (void)iterateMarkers:(id)a3 onMarkerFound:(id)a4 then:(id)a5 onEndReached:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  SXBlueprintAnalyzer *v23;
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_msgSend(v10, "mutableCopy");
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __70__SXBlueprintAnalyzer_iterateMarkers_onMarkerFound_then_onEndReached___block_invoke;
  v20[3] = &unk_24D689BA8;
  v21 = v10;
  v22 = v14;
  v23 = self;
  v24 = v11;
  v25 = v12;
  v26 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v14;
  v18 = v11;
  v19 = v10;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v20);

}

void __70__SXBlueprintAnalyzer_iterateMarkers_onMarkerFound_then_onEndReached___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  id v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "count");
  if ((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))() == 1)
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v8);
  v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  if (v6 == 2)
    goto LABEL_6;
  if (v6 == 1)
  {
    objc_msgSend(*(id *)(a1 + 48), "iterateMarkers:onMarkerFound:then:onEndReached:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
LABEL_6:
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v8 && (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))() == 1)
  {
    objc_msgSend(*(id *)(a1 + 48), "iterateMarkers:onMarkerFound:then:onEndReached:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    *a4 = 1;
  }

}

- (id)markersFromBlueprint:(id)a3 components:(id)a4 DOMObjectProvider:(id)a5 cursor:(id)a6
{
  id v9;
  id v10;
  id *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id *v31;
  void *v32;
  void *v33;
  char isKindOfClass;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  _UNKNOWN **v46;
  double MinY;
  double MaxY;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t i;
  void *v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  SXComponentAnchor *v65;
  void *v66;
  SXComponentAnchor *v67;
  SXBlueprintMarker *v68;
  void *v69;
  SXBlueprintMarker *v70;
  id v71;
  double v72;
  void *v73;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  void *v80;
  id *v81;
  void *v82;
  unint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;

  v9 = a3;
  v10 = a4;
  v78 = a5;
  v11 = (id *)a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v13 = 0;
    v81 = v11;
    v82 = v12;
    v76 = v10;
    v77 = v9;
    while (1)
    {
      objc_msgSend(v10, "componentAtIndex:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentBlueprintForComponentIdentifier:", v15);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v13 + 1;
      v83 = v16;
      if (v16 >= objc_msgSend(v10, "count"))
      {
        v19 = 0;
        v17 = 0;
      }
      else
      {
        objc_msgSend(v10, "componentAtIndex:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentBlueprintForComponentIdentifier:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

      }
      v84 = (void *)v19;
      objc_opt_class();
      v85 = v17;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
LABEL_16:
      objc_msgSend(v17, "anchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "targetComponentIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "isEqualToString:", v39))
      {

        v13 = v83;
LABEL_18:

        v40 = v86;
        v41 = v84;
        goto LABEL_25;
      }
      objc_msgSend(v14, "anchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "targetComponentIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v43, "isEqualToString:", v44);

      v11 = v81;
      v46 = &off_24D684000;

      v13 = v83;
      v41 = v84;
      v40 = v86;
      if ((v45 & 1) == 0)
      {
        objc_msgSend(v84, "absoluteFrame");
        MinY = CGRectGetMinY(v87);
        objc_msgSend(v86, "absoluteFrame");
        MaxY = CGRectGetMaxY(v88);
        v49 = MaxY;
        if (!v85 || MinY >= MaxY)
        {
          if (!v84
            || (objc_msgSend(v84, "absoluteFrame"),
                v50 = CGRectGetMinY(v89),
                v50 >= -[SXBlueprintAnalyzerCursor highestMaxY]((uint64_t)v81)))
          {
            if (!-[SXBlueprintAnalyzer componentPlacedAboveComponentBlueprint:blueprint:](self, "componentPlacedAboveComponentBlueprint:blueprint:", v86, v9))
            {
              v53 = v82;
              if (objc_msgSend(v14, "role") == 3)
              {
                objc_msgSend(v86, "infoFromLayouting");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "objectForKey:", CFSTR("TextLayouter"));
                v55 = (void *)objc_claimAutoreleasedReturnValue();

                v80 = v55;
                objc_msgSend(v55, "paragraphRanges");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = objc_msgSend(v56, "count");
                if (v57 >= 2)
                {
                  v58 = v57;
                  for (i = 1; i != v58; ++i)
                  {
                    objc_msgSend(v56, "objectAtIndex:", i);
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    v61 = objc_msgSend(v60, "rangeValue");

                    objc_msgSend(v80, "verticalLocationOfCharacterAtIndex:", v61);
                    v63 = v62;
                    objc_msgSend(v86, "absoluteFrame");
                    v64 = v63 + CGRectGetMinY(v91);
                    v65 = [SXComponentAnchor alloc];
                    objc_msgSend(v14, "identifier");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    v67 = -[SXComponentAnchor initWithTargetComponentIdentifier:](v65, "initWithTargetComponentIdentifier:", v66);

                    -[SXComponentAnchor setRange:](v67, "setRange:", v61, 1);
                    v68 = [SXBlueprintMarker alloc];
                    -[SXBlueprintAnalyzerCursor path](v81);
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    v70 = -[SXBlueprintMarker initWithLeadingComponent:trailingComponent:approximateLocation:path:](v68, "initWithLeadingComponent:trailingComponent:approximateLocation:path:", v14, v85, v69, 0.0, v64);

                    -[SXBlueprintMarker setComponentAnchor:](v70, "setComponentAnchor:", v67);
                    objc_msgSend(v82, "addObject:", v70);

                  }
                }

                v11 = v81;
                v53 = v82;
                v13 = v83;
                v46 = &off_24D684000;
              }
              v71 = objc_alloc((Class)v46[252]);
              v72 = -[SXBlueprintAnalyzerCursor highestMaxY]((uint64_t)v11);
              if (v72 >= v49)
                v49 = v72;
              -[SXBlueprintAnalyzerCursor path](v11);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = (void *)objc_msgSend(v71, "initWithLeadingComponent:trailingComponent:approximateLocation:path:", v14, v85, v73, 0.0, v49);

              objc_msgSend(v53, "addObject:", v37);
              goto LABEL_18;
            }
          }
        }
      }
LABEL_25:
      objc_msgSend(v40, "absoluteFrame");
      v51 = CGRectGetMaxY(v90);
      v52 = -[SXBlueprintAnalyzerCursor highestMaxY]((uint64_t)v11);
      if (v51 >= v52)
        v52 = v51;
      -[SXBlueprintAnalyzerCursor setHighestMaxY:]((uint64_t)v11, v52);

      v12 = v82;
      if (v13 >= objc_msgSend(v10, "count"))
        goto LABEL_37;
    }
    v20 = v14;
    v21 = v86;
    objc_msgSend(v20, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsForContainerComponentWithIdentifier:", v22);
    v79 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "layoutOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "columnLayout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "numberOfColumns");
    objc_msgSend(v21, "columnRange");
    v27 = v26;

    objc_msgSend(v20, "contentDisplay");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v78, "componentStyleForComponent:", v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "fill");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = (void *)v79;
      v31 = v81;
    }
    else
    {
      objc_msgSend(v29, "fill");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      v35 = v25 == v27;
      v32 = (void *)v79;
      v31 = v81;
      if (!v35 || v28 || (isKindOfClass & 1) != 0)
        goto LABEL_15;
      -[SXBlueprintAnalyzerCursor addPathComponent:]((uint64_t)v81, (uint64_t)v20);
      objc_msgSend(v21, "layoutBlueprint");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXBlueprintAnalyzer markersFromBlueprint:components:DOMObjectProvider:cursor:](self, "markersFromBlueprint:components:DOMObjectProvider:cursor:", v36, v79, v78, v81);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v82, "addObjectsFromArray:", v30);
      -[SXBlueprintAnalyzerCursor removePathComponent:]((uint64_t)v81, (uint64_t)v20);
    }

LABEL_15:
    v10 = v76;
    v9 = v77;
    v17 = v85;
    v11 = v31;
    goto LABEL_16;
  }
LABEL_37:

  return v12;
}

- (BOOL)componentPlacedAboveComponentBlueprint:(id)a3 blueprint:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  double MaxY;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  BOOL v27;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "componentIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "component");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "indexOfObject:", v9);

  objc_msgSend(v6, "componentIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v10 + 1 >= v12)
  {
    v27 = 0;
  }
  else
  {
    objc_msgSend(v6, "componentIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subarrayWithRange:", v10 + 1, objc_msgSend(v14, "count") - (v10 + 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v15;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(obj);
          objc_msgSend(v6, "componentBlueprintForComponentIdentifier:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "absoluteFrame");
          MaxY = CGRectGetMaxY(v36);
          objc_msgSend(v20, "absoluteFrame");
          if (MaxY > CGRectGetMinY(v37))
          {

            v27 = 1;
            goto LABEL_15;
          }
          objc_msgSend(v20, "columnRange");
          v23 = v22;
          objc_msgSend(v6, "layoutOptions");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "columnLayout");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "numberOfColumns");

          if (v23 == v26)
            goto LABEL_13;
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        v27 = 0;
        if (v17)
          continue;
        break;
      }
    }
    else
    {
LABEL_13:
      v27 = 0;
    }
LABEL_15:

  }
  return v27;
}

@end
