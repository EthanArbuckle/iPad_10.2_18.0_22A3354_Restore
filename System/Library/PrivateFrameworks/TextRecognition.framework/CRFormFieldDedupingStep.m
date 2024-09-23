@implementation CRFormFieldDedupingStep

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  char v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  CROSLogForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFieldDedupingStep is running.", buf, 2u);
  }

  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __67__CRFormFieldDedupingStep_process_externalFields_document_options___block_invoke_2;
  v35[3] = &unk_1E98D9E10;
  v10 = v25;
  v36 = v10;
  +[CRFormPostProcessingManager enumerateFieldsInFields:filter:block:](CRFormPostProcessingManager, "enumerateFieldsInFields:filter:block:", v6, &__block_literal_global_151, v35);
  v30[0] = v9;
  v30[1] = 3221225472;
  v30[2] = __67__CRFormFieldDedupingStep_process_externalFields_document_options___block_invoke_4;
  v30[3] = &unk_1E98D9F58;
  v11 = v10;
  v31 = v11;
  v12 = v8;
  v32 = v12;
  v34 = 1;
  v13 = v6;
  v33 = v13;
  +[CRFormPostProcessingManager enumerateFieldsInFields:filter:block:](CRFormPostProcessingManager, "enumerateFieldsInFields:filter:block:", v13, &__block_literal_global_152, v30);
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v43, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v15);
        v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((objc_msgSend(v12, "containsObject:", v19) & 1) == 0)
          objc_msgSend(v14, "addObject:", v19);
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v43, 16);
    }
    while (v16);
  }

  CROSLogForCategory(6);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = objc_msgSend(v12, "count");
    v22 = objc_msgSend(v15, "count");
    v23 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 134218496;
    v38 = v21;
    v39 = 2048;
    v40 = v22;
    v41 = 2048;
    v42 = v23;
    _os_log_impl(&dword_1D4FB8000, v20, OS_LOG_TYPE_DEBUG, "CRFormFieldDedupingStep removed %ld contour fields from %ld fields, preserving %ld fields.", buf, 0x20u);
  }

  return v14;
}

BOOL __67__CRFormFieldDedupingStep_process_externalFields_document_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fieldSource") == 2;
}

uint64_t __67__CRFormFieldDedupingStep_process_externalFields_document_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

BOOL __67__CRFormFieldDedupingStep_process_externalFields_document_options___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fieldSource") == 1;
}

void __67__CRFormFieldDedupingStep_process_externalFields_document_options___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  id v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  BOOL v26;
  double width;
  double height;
  double v29;
  double v30;
  id v31;
  uint64_t v32;
  int v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  CRNormalizedQuad *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CRImageSpaceQuad *v59;
  CRNormalizedQuad *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  id v66;
  uint64_t v67;
  void *v69;
  double v70;
  BOOL v71;
  NSObject *v72;
  id v73;
  double v74;
  double v75;
  CGFloat v76;
  CGFloat v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t v86[128];
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  double v92;
  __int16 v93;
  double v94;
  _BYTE v95[128];
  uint64_t v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;

  v96 = *MEMORY[0x1E0C80C00];
  v73 = a2;
  objc_msgSend(v73, "boundingQuad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "boundingBox");
  v76 = v5;
  v77 = v4;
  v7 = v6;
  v9 = v8;

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v10 = *(id *)(a1 + 32);
  v11 = 0;
  v12 = 0;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v83;
    v74 = 0.0;
    v75 = 0.0;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v83 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v15);
        if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v16) & 1) == 0)
        {
          objc_msgSend(v16, "boundingQuad");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "boundingBox");
          v19 = v18;
          v21 = v20;
          v23 = v22;
          v25 = v24;

          v97.origin.x = v19;
          v97.origin.y = v21;
          v97.size.width = v23;
          v97.size.height = v25;
          v103.origin.y = v76;
          v103.origin.x = v77;
          v103.size.width = v7;
          v103.size.height = v9;
          if (CGRectContainsRect(v97, v103))
          {
            v26 = 1;
          }
          else
          {
            v98.origin.y = v76;
            v98.origin.x = v77;
            v98.size.width = v7;
            v98.size.height = v9;
            v104.origin.x = v19;
            v104.origin.y = v21;
            v104.size.width = v23;
            v104.size.height = v25;
            v26 = CGRectContainsRect(v98, v104);
          }
          v99.origin.y = v76;
          v99.origin.x = v77;
          v99.size.width = v7;
          v99.size.height = v9;
          v105.origin.x = v19;
          v105.origin.y = v21;
          v105.size.width = v23;
          v105.size.height = v25;
          v100 = CGRectIntersection(v99, v105);
          width = v100.size.width;
          height = v100.size.height;
          if (!CGRectIsNull(v100))
          {
            v101.origin.y = v76;
            v101.origin.x = v77;
            v101.size.width = v7;
            v101.size.height = v9;
            v106.origin.x = v19;
            v106.origin.y = v21;
            v106.size.width = v23;
            v106.size.height = v25;
            v102 = CGRectUnion(v101, v106);
            v29 = v102.size.width;
            if (v102.size.width != 0.0 && v102.size.height != 0.0)
            {
              v30 = width * height / (v102.size.width * v102.size.height);
              if (v30 > v75)
              {
                v31 = v16;

                v11 = v26;
                v12 = v31;
                v74 = width / v29;
                v75 = v30;
              }
            }
          }
        }
        ++v15;
      }
      while (v13 != v15);
      v32 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
      v13 = v32;
    }
    while (v32);
  }
  else
  {
    v74 = 0.0;
    v75 = 0.0;
  }

  if (!objc_msgSend(v12, "hasBoundedWidth") || (objc_msgSend(v12, "hasBoundedHeight") & 1) != 0)
  {
    if (objc_msgSend(v12, "hasBoundedWidth"))
    {
      v33 = objc_msgSend(v12, "hasBoundedHeight");
      v34 = v75 > 0.6 ? v33 : 0;
      if (v34 == 1 && *(_BYTE *)(a1 + 56))
      {
        CROSLogForCategory(6);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v12, "boundingQuad");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "boundingQuad");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v88 = v36;
          v89 = 2112;
          v90 = v37;
          v91 = 2048;
          v92 = v75 * 100.0;
          _os_log_impl(&dword_1D4FB8000, v35, OS_LOG_TYPE_DEBUG, "CRFormFieldDedupingStep copying quad geometry from boxed contour based field (quad %@) to detected field (quad %@) - iou = %.2f%%", buf, 0x20u);

        }
        objc_msgSend(v12, "boundingQuad");
        v38 = (CRNormalizedQuad *)objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
      }
    }
LABEL_51:
    v38 = 0;
    goto LABEL_52;
  }
  if (v74 <= 0.8 || !*(_BYTE *)(a1 + 56))
    goto LABEL_51;
  CROSLogForCategory(6);
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v12, "boundingQuad");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "boundingQuad");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v88 = v40;
    v89 = 2112;
    v90 = v41;
    v91 = 2048;
    v92 = v75 * 100.0;
    v93 = 2048;
    v94 = v74 * 100.0;
    _os_log_impl(&dword_1D4FB8000, v39, OS_LOG_TYPE_DEBUG, "CRFormFieldDedupingStep copying quad geometry from underlined contour based field (quad %@) to detected field (quad %@) - iou = %.2f%%, horizontal iou = %.2f%%", buf, 0x2Au);

  }
  objc_msgSend(v73, "boundingQuad");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "denormalizedQuad");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "boundingQuad");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "denormalizedQuad");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bottomLeft");
  v47 = v46;
  v49 = v48;

  objc_msgSend(v12, "boundingQuad");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "denormalizedQuad");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "bottomRight");
  v53 = v52;
  v55 = v54;

  objc_msgSend(v43, "bottomLeft");
  v57 = v56;
  objc_msgSend(v43, "topLeft");
  v59 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v47, v49 + 2.0 - (v57 - v58), v53, v55 + 2.0 - (v57 - v58), v53, v55 + 2.0, v47);
  v60 = [CRNormalizedQuad alloc];
  objc_msgSend(v73, "boundingQuad");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "normalizationSize");
  v38 = -[CRNormalizedQuad initWithDenormalizedQuad:size:](v60, "initWithDenormalizedQuad:size:", v59);

LABEL_36:
  if (v38)
  {
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v62 = *(id *)(a1 + 48);
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
    if (v63)
    {
      v64 = *(_QWORD *)v79;
      while (2)
      {
        for (i = 0; i != v63; ++i)
        {
          if (*(_QWORD *)v79 != v64)
            objc_enumerationMutation(v62);
          v66 = *(id *)(*((_QWORD *)&v78 + 1) + 8 * i);
          if (objc_msgSend(v66, "fieldSource") != 2)
          {
            v67 = objc_msgSend(v66, "fieldSource");
            if (v66 != v73 && v67 != 3)
            {
              objc_msgSend(v66, "boundingQuad");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "boundingBoxIOUWithQuad:", v38);
              v71 = v70 <= 0.05;

              if (!v71)
              {

                CROSLogForCategory(6);
                v72 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D4FB8000, v72, OS_LOG_TYPE_DEBUG, "CRFormFieldDedupingStep reverting contour based geometry update to a field because of overlap with another detected field.", buf, 2u);
                }

                goto LABEL_52;
              }
            }
          }
        }
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
        if (v63)
          continue;
        break;
      }
    }

    objc_msgSend(v73, "setBoundingQuad:", v38);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
  }
LABEL_52:
  if (v11)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);

}

@end
