@implementation CRFormFilterSurfacedFieldsStep

- (CRFormFilterSurfacedFieldsStep)initWithAssignGlobalOrder:(BOOL)a3
{
  CRFormFilterSurfacedFieldsStep *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRFormFilterSurfacedFieldsStep;
  result = -[CRFormFilterSurfacedFieldsStep init](&v5, sel_init);
  if (result)
    result->_assignGlobalOrder = a3;
  return result;
}

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  char v37;
  char v38;
  BOOL v39;
  uint8_t buf[4];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v30 = a4;
  v10 = a6;
  CROSLogForCategory(6);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v41 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_1D4FB8000, v11, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFilterSurfacedFieldsStep is running (#input:%lu).", buf, 0xCu);
  }

  objc_msgSend(v9, "_fieldsOfSource:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_fieldsOfSource:", 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_159);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ShouldSurfaceContourBasedFormFieldsOption"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ShouldSurfaceTextBasedFormFieldsOption"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  v17 = -[CRFormFilterSurfacedFieldsStep assignGlobalOrder](self, "assignGlobalOrder");
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_2;
  v33[3] = &unk_1E98DA038;
  v37 = (char)v13;
  v38 = v16;
  v20 = v29;
  v34 = v20;
  v21 = v12;
  v35 = v21;
  v39 = v17;
  v22 = v28;
  v36 = v22;
  v31[0] = v19;
  v31[1] = 3221225472;
  v31[2] = __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_6;
  v31[3] = &unk_1E98D9E10;
  v23 = v18;
  v32 = v23;
  +[CRFormPostProcessingManager enumerateFieldsInFields:filter:block:](CRFormPostProcessingManager, "enumerateFieldsInFields:filter:block:", v9, v33, v31);
  objc_msgSend(v23, "sortedArrayUsingComparator:", &__block_literal_global_163);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CRFormFilterSurfacedFieldsStep assignGlobalOrder](self, "assignGlobalOrder"))
    -[CRFormFilterSurfacedFieldsStep _setGlobalIndexesForFields:externalFields:](self, "_setGlobalIndexesForFields:externalFields:", v24, v30);
  CROSLogForCategory(6);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v26 = objc_msgSend(v24, "count");
    *(_DWORD *)buf = 134217984;
    v41 = v26;
    _os_log_impl(&dword_1D4FB8000, v25, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFilterSurfacedFieldsStep is completed (#output:%lu).", buf, 0xCu);
  }

  return v24;
}

BOOL __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  v3 = (objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v2, "hasMoved")
    && objc_msgSend(v2, "fieldSource") != 6;

  return v3;
}

BOOL __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  BOOL v5;
  int v6;
  char v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  char v25;
  _QWORD v26[4];
  id v27;

  v3 = a2;
  v4 = objc_msgSend(v3, "fieldSource");
  if (*(_BYTE *)(a1 + 56))
    v5 = objc_msgSend(v3, "fieldSource") == 2;
  else
    v5 = 0;
  v6 = *(unsigned __int8 *)(a1 + 57);
  if (*(_BYTE *)(a1 + 57))
    v6 = objc_msgSend(v3, "fieldSource") == 3;
  v7 = v4 == 1 || v5;
  if ((v7 & 1) != 0 || v6)
  {
    v9 = *(void **)(a1 + 32);
    v10 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_3;
    v26[3] = &unk_1E98D9FE8;
    v11 = v3;
    v27 = v11;
    v12 = objc_msgSend(v9, "indexOfObjectPassingTest:", v26);
    v13 = *(void **)(a1 + 40);
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_4;
    v23[3] = &unk_1E98DA010;
    v14 = v11;
    v24 = v14;
    v25 = *(_BYTE *)(a1 + 58);
    v15 = objc_msgSend(v13, "indexOfObjectPassingTest:", v23);
    v16 = *(void **)(a1 + 48);
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_5;
    v21[3] = &unk_1E98D9FE8;
    v22 = v14;
    v17 = objc_msgSend(v16, "indexOfObjectPassingTest:", v21);
    v8 = v12 == 0x7FFFFFFFFFFFFFFFLL && v15 == 0x7FFFFFFFFFFFFFFFLL && v17 == 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

BOOL __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  _BOOL8 v6;

  objc_msgSend(a2, "originalQuad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "boundingQuad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "boundingBoxIOUWithQuad:", v4);
  v6 = v5 > 0.9;

  return v6;
}

uint64_t __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat width;
  CGFloat height;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  CGFloat v36;
  void *v37;
  void *v38;
  CGFloat v39;
  CGFloat v40;
  double MinY;
  double MaxY;
  BOOL v44;
  double MinX;
  double MaxX;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  CGFloat rect;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  double v69;
  CGFloat y;
  CGFloat x;
  CGFloat v72;
  CGFloat v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  v3 = a2;
  objc_msgSend(v3, "boundingQuad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingBox");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "boundingQuad");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "boundingBox");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v74.origin.x = v6;
  v74.origin.y = v8;
  v74.size.width = v10;
  v74.size.height = v12;
  v67 = v17;
  v68 = v15;
  v97.origin.x = v15;
  v97.origin.y = v17;
  rect = v21;
  v66 = v19;
  v97.size.width = v19;
  v97.size.height = v21;
  v75 = CGRectIntersection(v74, v97);
  y = v75.origin.y;
  x = v75.origin.x;
  v22 = v10;
  width = v75.size.width;
  height = v75.size.height;
  v75.origin.x = v6;
  v75.origin.y = v8;
  v75.size.width = v10;
  v75.size.height = v12;
  v69 = CGRectGetWidth(v75);
  v25 = v6;
  v76.origin.x = v6;
  v76.origin.y = v8;
  v76.size.width = v22;
  v76.size.height = v12;
  v26 = CGRectGetHeight(v76);
  v72 = v25;
  v73 = v8;
  v77.origin.x = v25;
  v77.origin.y = v8;
  v27 = v22;
  v77.size.width = v22;
  v77.size.height = v12;
  v28 = CGRectGetWidth(v77);
  v29 = v12;
  v78.origin.x = v72;
  v78.origin.y = v73;
  v78.size.width = v27;
  v78.size.height = v12;
  v30 = CGRectGetHeight(v78);
  v79.origin.y = y;
  v79.origin.x = x;
  v79.size.width = width;
  v79.size.height = height;
  if (CGRectIsEmpty(v79) || (v31 = v69 * v26, v31 <= 0.0) || (v32 = v28 * v30, v32 <= 0.0))
  {
    v36 = v29;
    CRCastAsClass<CRFormFieldOutputRegion>(*(void **)(a1 + 32));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    v39 = v72;
    if (!v37
      || (v40 = v27, objc_msgSend(v37, "fieldType") != 1)
      || !*(_BYTE *)(a1 + 40)
      || objc_msgSend(*(id *)(a1 + 32), "textContentType") == 50)
    {
LABEL_11:
      v35 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v82.origin.x = v72;
    v82.origin.y = v73;
    v82.size.width = v27;
    v82.size.height = v36;
    MinY = CGRectGetMinY(v82);
    v83.origin.x = v15;
    v83.size.width = v66;
    v83.origin.y = v67;
    v83.size.height = rect;
    if (MinY >= CGRectGetMaxY(v83))
    {
      v44 = 0;
    }
    else
    {
      v84.origin.x = v72;
      v84.origin.y = v73;
      v84.size.width = v40;
      v84.size.height = v36;
      MaxY = CGRectGetMaxY(v84);
      v85.origin.x = v15;
      v85.size.width = v66;
      v85.origin.y = v67;
      v85.size.height = rect;
      v44 = MaxY > CGRectGetMinY(v85);
    }
    v86.origin.y = v73;
    v86.origin.x = v72;
    v86.size.width = v40;
    v86.size.height = v36;
    MinX = CGRectGetMinX(v86);
    v87.origin.x = v15;
    v87.size.width = v66;
    v87.origin.y = v67;
    v87.size.height = rect;
    if (MinX >= CGRectGetMaxX(v87))
      goto LABEL_21;
    v88.origin.x = v72;
    v88.origin.y = v73;
    v88.size.width = v40;
    v88.size.height = v36;
    MaxX = CGRectGetMaxX(v88);
    v89.origin.x = v15;
    v89.size.width = v66;
    v89.origin.y = v67;
    v89.size.height = rect;
    if (MaxX <= CGRectGetMinX(v89))
    {
LABEL_21:
      v90.origin.x = v72;
      v90.origin.y = v73;
      v90.size.width = v40;
      v90.size.height = v36;
      v48 = CGRectGetMinX(v90);
      v91.origin.x = v68;
      v91.size.width = v66;
      v91.origin.y = v67;
      v91.size.height = rect;
      v49 = CGRectGetMinX(v91);
      v92.origin.x = v72;
      v92.origin.y = v73;
      v92.size.width = v40;
      v92.size.height = v36;
      v50 = CGRectGetMaxX(v92);
      v93.origin.x = v68;
      v93.size.width = v66;
      v93.origin.y = v67;
      v93.size.height = rect;
      v51 = CGRectGetMaxX(v93);
      objc_msgSend(v3, "boundingQuad");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "normalizationSize");
      v54 = v53;

      if (v44)
      {
        if ((fmax(v48, v49) - fmin(v50, v51)) * v54 < 6.0)
        {
          v35 = 1;
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      LODWORD(v35) = 0;
      v39 = v72;
      v47 = v73;
    }
    else
    {
      v35 = 1;
      v47 = v73;
      if (v44)
        goto LABEL_12;
    }
    v55 = v39;
    v56 = v40;
    v57 = v36;
    v58 = CGRectGetMinY(*(CGRect *)(&v47 - 1));
    v94.origin.x = v68;
    v94.size.width = v66;
    v94.origin.y = v67;
    v94.size.height = rect;
    v59 = CGRectGetMinY(v94);
    v95.origin.x = v72;
    v95.origin.y = v73;
    v95.size.width = v40;
    v95.size.height = v36;
    v60 = CGRectGetMaxY(v95);
    v96.origin.x = v68;
    v96.size.width = v66;
    v96.origin.y = v67;
    v96.size.height = rect;
    v61 = CGRectGetMaxY(v96);
    objc_msgSend(v3, "boundingQuad");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "normalizationSize");
    v64 = (fmax(v58, v59) - fmin(v60, v61)) * v63;

    if (v64 < 6.0)
      v35 = v35;
    else
      v35 = 0;
    goto LABEL_12;
  }
  v80.origin.x = x;
  v80.origin.y = y;
  v80.size.width = width;
  v80.size.height = height;
  v33 = CGRectGetWidth(v80);
  v81.origin.x = x;
  v81.origin.y = y;
  v81.size.width = width;
  v81.size.height = height;
  v34 = v33 * CGRectGetHeight(v81);
  v35 = v34 > v32 * 0.02 || v34 > v31 * 0.02;
LABEL_13:

  return v35;
}

BOOL __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  _BOOL8 v6;

  objc_msgSend(a2, "originalQuad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "boundingQuad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "boundingBoxIOUWithQuad:", v4);
  v6 = v5 > 0.9;

  return v6;
}

uint64_t __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "fieldSource");
  if (v6 > objc_msgSend(v5, "fieldSource"))
    v7 = 1;
  else
    v7 = -1;

  return v7;
}

- (void)_setGlobalIndexesForFields:(id)a3 externalFields:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v20;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        CRCastAsClass<CRFormFieldOutputRegion>(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "precedingExternalField", (_QWORD)v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            if (v6)
              v16 = objc_msgSend(v6, "indexOfObject:", v15);
            else
              v16 = 0x7FFFFFFFFFFFFFFFLL;
            if (v16 <= v11)
              v17 = v11;
            else
              v17 = v16;
            v18 = v17 - v11;
            if (v11 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v18 = v16 + 1;
              v11 = v16;
            }
            else
            {
              v11 = v17;
            }
            v9 += v18;
          }
          objc_msgSend(v14, "setIndexInGlobalOrder:", v9);

          ++v9;
        }

        ++v12;
      }
      while (v8 != v12);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

}

- (BOOL)assignGlobalOrder
{
  return self->_assignGlobalOrder;
}

@end
