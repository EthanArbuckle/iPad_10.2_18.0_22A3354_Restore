@implementation CRFormFieldTextOverlapCleanupStep

+ (CGRect)_clipRectangle:(CGRect)a3 intersectionRectangle:(CGRect)a4 type:(unint64_t)a5
{
  CGFloat width;
  CGFloat y;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat MinX;
  double MinY;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat MaxX;
  CGFloat v35;
  CGFloat MaxY;
  CGFloat x;
  CGFloat height;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect result;

  x = a4.origin.x;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  MinX = CGRectGetMinX(a3);
  v39.origin.x = v11;
  v39.origin.y = v10;
  v39.size.width = v9;
  v39.size.height = v8;
  MaxX = CGRectGetMaxX(v39);
  v40.origin.x = v11;
  v40.origin.y = v10;
  v40.size.width = v9;
  v40.size.height = v8;
  MinY = CGRectGetMinY(v40);
  v41.origin.x = v11;
  v41.origin.y = v10;
  v41.size.width = v9;
  v41.size.height = v8;
  v35 = MinX;
  MaxY = CGRectGetMaxY(v41);
  if (a5)
  {
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    v14 = CGRectGetMinY(v42);
    v43.origin.x = v11;
    v43.origin.y = v10;
    v43.size.width = v9;
    v43.size.height = v8;
    v15 = v14 - CGRectGetMinY(v43);
    v44.origin.x = v11;
    v44.origin.y = v10;
    v44.size.width = v9;
    v44.size.height = v8;
    v16 = CGRectGetMaxY(v44);
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    v17 = v16 - CGRectGetMaxY(v45) < v15;
    v18 = y;
    v19 = x;
    if (v17)
    {
      v27 = MaxX;
      v26 = v35;
      if (a5 == 1)
      {
        v20 = width;
        v21 = height;
        v22 = CGRectGetMinY(*(CGRect *)&v19);
        goto LABEL_9;
      }
    }
    else
    {
      v24 = width;
      v25 = height;
      MinY = CGRectGetMaxY(*(CGRect *)&v19);
      v27 = MaxX;
      v26 = v35;
    }
    v22 = MaxY;
LABEL_9:
    if (v22 > MinY + 4.0)
    {
      v22 = v22 + -2.0;
      MinY = MinY + 2.0;
    }
    goto LABEL_15;
  }
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v32 = CGRectGetMinX(v46);
  v47.origin.x = v11;
  v47.origin.y = v10;
  v47.size.width = v9;
  v47.size.height = v8;
  v33 = v32 - CGRectGetMinX(v47);
  v48.origin.x = v11;
  v48.origin.y = v10;
  v48.size.width = v9;
  v48.size.height = v8;
  v23 = CGRectGetMaxX(v48);
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  if (v23 - CGRectGetMaxX(v49) >= v33)
  {
    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = height;
    v26 = CGRectGetMaxX(v51);
    v27 = MaxX;
  }
  else
  {
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    v27 = CGRectGetMinX(v50);
    v26 = MinX;
  }
  v22 = MaxY;
  if (v27 > v26 + 4.0)
  {
    v27 = v27 + -2.0;
    v26 = v26 + 2.0;
  }
LABEL_15:
  v28 = v27 - v26;
  v29 = v22 - MinY;
  v30 = v26;
  v31 = MinY;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

+ (id)cleanupTextOverlapForFields:(id)a3 document:(id)a4 underlinedFieldsOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  BOOL v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v5 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v29 = a4;
  if (+[CRFormFieldTextOverlapCleanupStep cleanupTextOverlapForFields:document:underlinedFieldsOnly:]::onceToken != -1)
    dispatch_once(&+[CRFormFieldTextOverlapCleanupStep cleanupTextOverlapForFields:document:underlinedFieldsOnly:]::onceToken, &__block_literal_global_55);
  objc_msgSend(v29, "contentsWithTypes:", 8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_opt_new();
  v26 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v10 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __95__CRFormFieldTextOverlapCleanupStep_cleanupTextOverlapForFields_document_underlinedFieldsOnly___block_invoke_2;
  v33[3] = &unk_1E98D9EA8;
  v11 = v9;
  v34 = v11;
  v39 = v5;
  v12 = v28;
  v35 = v12;
  v13 = v27;
  v36 = v13;
  v38 = a1;
  v14 = v26;
  v37 = v14;
  v15 = (void *)MEMORY[0x1D826E9A8](v33);
  if (v5)
  {
    +[CRFormPostProcessingManager enumerateAllFieldsInFields:block:](CRFormPostProcessingManager, "enumerateAllFieldsInFields:block:", v8, v15, v26, v27, v28);
    CROSLogForCategory(6);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = objc_msgSend(v8, "count");
      v18 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 136315650;
      v41 = "+[CRFormFieldTextOverlapCleanupStep cleanupTextOverlapForFields:document:underlinedFieldsOnly:]";
      v42 = 2048;
      v43 = v17;
      v44 = 2048;
      v45 = v18;
      _os_log_impl(&dword_1D4FB8000, v16, OS_LOG_TYPE_DEBUG, "%s: Processed %lu fields; Returning %lu fields.",
        buf,
        0x20u);
    }

    v19 = v11;
  }
  else
  {
    +[CRFormPostProcessingManager enumerateContourBasedDetectedFields:block:](CRFormPostProcessingManager, "enumerateContourBasedDetectedFields:block:", v8, v15, v26, v27, v28);
    +[CRFormPostProcessingManager enumerateTextBasedDetectedFields:block:](CRFormPostProcessingManager, "enumerateTextBasedDetectedFields:block:", v8, v15);
    v20 = objc_msgSend(v14, "count");
    v21 = objc_msgSend(v13, "count");
    v30[0] = v10;
    v30[1] = 3221225472;
    v30[2] = __95__CRFormFieldTextOverlapCleanupStep_cleanupTextOverlapForFields_document_underlinedFieldsOnly___block_invoke_64;
    v30[3] = &unk_1E98D9ED0;
    v31 = v13;
    v22 = v14;
    v32 = v22;
    +[CRFormPostProcessingManager enumerateAllFieldsInFields:block:](CRFormPostProcessingManager, "enumerateAllFieldsInFields:block:", v8, v30);
    CROSLogForCategory(6);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = objc_msgSend(v22, "count");
      *(_DWORD *)buf = 136315906;
      v41 = "+[CRFormFieldTextOverlapCleanupStep cleanupTextOverlapForFields:document:underlinedFieldsOnly:]";
      v42 = 2048;
      v43 = v21 - v20;
      v44 = 2048;
      v45 = v20;
      v46 = 2048;
      v47 = v24;
      _os_log_impl(&dword_1D4FB8000, v23, OS_LOG_TYPE_DEBUG, "%s: Fields removed %lu, Updated: %lu, Total number of fields preserved: %lu.", buf, 0x2Au);
    }

    objc_msgSend(v22, "array");
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

void __95__CRFormFieldTextOverlapCleanupStep_cleanupTextOverlapForFields_document_underlinedFieldsOnly___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("ー一－-_.…,"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[CRFormFieldTextOverlapCleanupStep cleanupTextOverlapForFields:document:underlinedFieldsOnly:]::_trimmableCharSet;
  +[CRFormFieldTextOverlapCleanupStep cleanupTextOverlapForFields:document:underlinedFieldsOnly:]::_trimmableCharSet = v0;

}

void __95__CRFormFieldTextOverlapCleanupStep_cleanupTextOverlapForFields_document_underlinedFieldsOnly___block_invoke_2(uint64_t a1, void *a2)
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
  double Height;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v36;
  _QWORD *v37;
  double v38;
  double v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  __int128 v49;
  char *v50;
  char *v51;
  uint64_t v52;
  unint64_t v53;
  CGFloat *v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat *v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  int v72;
  void *v73;
  uint64_t v74;
  double v75;
  double v76;
  id v77;
  CRImageSpaceQuad *v78;
  CRNormalizedQuad *v79;
  void *v80;
  CRNormalizedQuad *v81;
  NSObject *v82;
  id v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  id v87;
  void *v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  double rect2;
  double v97;
  CGFloat rect;
  CGFloat recta;
  CGFloat v100;
  double v101;
  CGFloat v102;
  double v103;
  CGFloat v104;
  double v105;
  CGFloat v106;
  double v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  void *__p;
  _QWORD *v113;
  char *v114;
  uint8_t buf[4];
  uint64_t v116;
  __int16 v117;
  uint64_t v118;
  _BYTE v119[128];
  uint64_t v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;

  v120 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "boundingQuad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingBox");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v121.origin.x = v6;
  v121.origin.y = v8;
  v121.size.width = v10;
  v121.size.height = v12;
  if (CGRectGetWidth(v121) < 0.1)
  {
    v122.origin.x = v6;
    v122.origin.y = v8;
    v122.size.width = v10;
    v122.size.height = v12;
    if (CGRectGetHeight(v122) < 0.1)
    {
      v123.origin.x = v6;
      v123.origin.y = v8;
      v123.size.width = v10;
      v123.size.height = v12;
      Height = CGRectGetHeight(v123);
      v124.origin.x = v6;
      v124.origin.y = v8;
      v124.size.width = v10;
      v124.size.height = v12;
      if (Height > CGRectGetWidth(v124) * 0.5 && objc_msgSend(v3, "fieldSource") != 3)
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
        goto LABEL_92;
      }
    }
  }
  if (*(_BYTE *)(a1 + 72))
  {
    CRCastAsClass<CRFormTextFieldOutputRegion>(v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14
      || !objc_msgSend(v14, "hasBoundedWidth")
      || objc_msgSend(v15, "hasBoundedHeight"))
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

      goto LABEL_92;
    }

  }
  objc_msgSend(v3, "boundingQuad");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "denormalizedQuad");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v88 = v17;
  objc_msgSend(v17, "boundingBox");
  v104 = v19;
  v106 = v18;
  v100 = v21;
  v102 = v20;
  __p = 0;
  v113 = 0;
  v114 = 0;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v22 = *(id *)(a1 + 40);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v108, v119, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v109;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v109 != v24)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * i), "boundingBoxEstimateAfterTrimmingCharacters:", +[CRFormFieldTextOverlapCleanupStep cleanupTextOverlapForFields:document:underlinedFieldsOnly:]::_trimmableCharSet);
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v149.size.height = v32;
        v125.origin.y = v104;
        v125.origin.x = v106;
        v125.size.height = v100;
        v125.size.width = v102;
        v149.origin.x = v27;
        v149.origin.y = v29;
        v149.size.width = v31;
        rect = v149.size.height;
        v126 = CGRectIntersection(v125, v149);
        x = v126.origin.x;
        y = v126.origin.y;
        width = v126.size.width;
        v36 = v126.size.height;
        if (CGRectIsEmpty(v126))
        {
          v37 = v113;
        }
        else
        {
          v127.origin.x = x;
          v127.origin.y = y;
          v127.size.width = width;
          v127.size.height = v36;
          v38 = CGRectGetWidth(v127);
          v128.origin.y = v104;
          v128.origin.x = v106;
          v128.size.height = v100;
          v128.size.width = v102;
          if (v38 > CGRectGetWidth(v128) * 0.5)
          {
            v129.origin.x = x;
            v129.origin.y = y;
            v129.size.width = width;
            v129.size.height = v36;
            v39 = CGRectGetHeight(v129);
            v130.origin.y = v104;
            v130.origin.x = v106;
            v130.size.height = v100;
            v130.size.width = v102;
            if (v39 > CGRectGetHeight(v130) * 0.5)
            {
LABEL_74:
              objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
              objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
              goto LABEL_88;
            }
          }
          v40 = v113;
          if (v113 >= (_QWORD *)v114)
          {
            v41 = __p;
            v42 = ((char *)v113 - (_BYTE *)__p) >> 5;
            v43 = v42 + 1;
            if ((unint64_t)(v42 + 1) >> 59)
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            v44 = v114 - (_BYTE *)__p;
            if ((v114 - (_BYTE *)__p) >> 4 > v43)
              v43 = v44 >> 4;
            if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFE0)
              v45 = 0x7FFFFFFFFFFFFFFLL;
            else
              v45 = v43;
            if (v45)
            {
              v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v114, v45);
              v41 = __p;
              v40 = v113;
            }
            else
            {
              v46 = 0;
            }
            v47 = &v46[32 * v42];
            *(CGFloat *)v47 = v27;
            *((CGFloat *)v47 + 1) = v29;
            *((CGFloat *)v47 + 2) = v31;
            *((CGFloat *)v47 + 3) = rect;
            if (v40 == v41)
            {
              v50 = &v46[32 * v42];
            }
            else
            {
              v48 = &v46[32 * v42];
              do
              {
                v49 = *((_OWORD *)v40 - 1);
                v50 = v48 - 32;
                *((_OWORD *)v48 - 2) = *((_OWORD *)v40 - 2);
                *((_OWORD *)v48 - 1) = v49;
                v40 -= 4;
                v48 -= 32;
              }
              while (v40 != v41);
            }
            v37 = v47 + 32;
            __p = v50;
            v113 = v47 + 32;
            v114 = &v46[32 * v45];
            if (v41)
              operator delete(v41);
          }
          else
          {
            *(CGFloat *)v113 = v27;
            *((CGFloat *)v40 + 1) = v29;
            v37 = v40 + 4;
            *((CGFloat *)v40 + 2) = v31;
            *((CGFloat *)v40 + 3) = rect;
          }
          v113 = v37;
        }
        if ((unint64_t)((char *)v37 - (_BYTE *)__p) > 0x40)
          goto LABEL_74;
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v108, v119, 16);
      if (v23)
        continue;
      break;
    }
  }

  v51 = (char *)__p;
  if (v113 != __p)
  {
    v52 = 0;
    v53 = 0;
    v54 = (CGFloat *)MEMORY[0x1E0C9D628];
    v56 = v104;
    v55 = v106;
    v58 = v100;
    v57 = v102;
    while (1)
    {
      v59 = (CGFloat *)&v51[v52];
      v60 = *v59;
      v61 = v59[1];
      v62 = v59[2];
      v150.size.height = v59[3];
      v105 = v56;
      v107 = v55;
      v101 = v58;
      v103 = v57;
      v150.origin.x = *v59;
      v150.origin.y = v61;
      v150.size.width = v62;
      rect2 = v150.size.height;
      v131 = CGRectIntersection(*(CGRect *)&v55, v150);
      v63 = v131.origin.x;
      v64 = v131.origin.y;
      v65 = v131.size.width;
      v66 = v131.size.height;
      if (objc_msgSend(v3, "fieldSource") == 3)
        v67 = 0.8;
      else
        v67 = 1.0;
      v132.origin.x = v63;
      v132.origin.y = v64;
      v132.size.width = v65;
      v132.size.height = v66;
      if (CGRectIsEmpty(v132))
      {
        v69 = v101;
        v68 = v103;
        v71 = v105;
        v70 = v107;
      }
      else
      {
        v97 = fmax(rect2 * v67, 8.0);
        v90 = v61;
        v91 = v60;
        v89 = v62;
        if (*(_BYTE *)(a1 + 72))
          goto LABEL_52;
        objc_msgSend((id)objc_opt_class(), "_clipRectangle:intersectionRectangle:type:", 0, v107, v105, v103, v101, v63, v64, v65, v66);
        v94 = v133.origin.y;
        v95 = v133.origin.x;
        v92 = v133.size.height;
        v93 = v133.size.width;
        if (CGRectGetHeight(v133) <= v97
          || (v134.origin.y = v94,
              v134.origin.x = v95,
              v134.size.height = v92,
              v134.size.width = v93,
              CGRectGetWidth(v134) <= v97))
        {
LABEL_52:
          v94 = v54[1];
          v95 = *v54;
          v92 = v54[3];
          v93 = v54[2];
        }
        v72 = *(unsigned __int8 *)(a1 + 72);
        v73 = (void *)objc_opt_class();
        if (v72)
          v74 = 2;
        else
          v74 = 1;
        objc_msgSend(v73, "_clipRectangle:intersectionRectangle:type:", v74, v107, v105, v103, v101, v63, v64, v65, v66);
        recta = v135.origin.y;
        v70 = v135.origin.x;
        v68 = v135.size.width;
        v69 = v135.size.height;
        if (CGRectGetHeight(v135) <= v97
          || (v136.origin.x = v70,
              v136.origin.y = recta,
              v136.size.width = v68,
              v136.size.height = v69,
              CGRectGetWidth(v136) <= v97))
        {
          v70 = *v54;
          recta = v54[1];
          v68 = v54[2];
          v69 = v54[3];
        }
        if (*(_BYTE *)(a1 + 72))
          goto LABEL_62;
        v137.origin.x = v63;
        v137.origin.y = v64;
        v137.size.width = v65;
        v137.size.height = v66;
        v75 = CGRectGetHeight(v137);
        v138.origin.y = v105;
        v138.origin.x = v107;
        v138.size.height = v101;
        v138.size.width = v103;
        if (v75 <= CGRectGetHeight(v138) * 0.5
          || (v139.origin.y = v94, v139.origin.x = v95,
                                   v139.size.height = v92,
                                   v139.size.width = v93,
                                   CGRectIsNull(v139)))
        {
LABEL_62:
          v140.origin.x = v63;
          v140.origin.y = v64;
          v140.size.width = v65;
          v140.size.height = v66;
          v76 = CGRectGetWidth(v140);
          v141.origin.y = v105;
          v141.origin.x = v107;
          v141.size.height = v101;
          v141.size.width = v103;
          if (v76 <= CGRectGetWidth(v141) * 0.5)
          {
            v142.origin.y = v105;
            v142.origin.x = v107;
            v142.size.height = v101;
            v142.size.width = v103;
            v151.origin.y = v90;
            v151.origin.x = v91;
            v151.size.width = v89;
            v151.size.height = rect2;
            if (!CGRectContainsRect(v142, v151))
              goto LABEL_65;
          }
          v143.origin.x = v70;
          v143.origin.y = recta;
          v143.size.width = v68;
          v143.size.height = v69;
          if (!CGRectIsNull(v143))
          {
            v71 = recta;
          }
          else
          {
LABEL_65:
            v144.size.height = v69;
            v144.size.width = v68;
            v144.origin.y = recta;
            v144.origin.x = v70;
            v71 = recta;
            if (CGRectGetHeight(v144) <= v97
              || (v145.size.height = v69,
                  v145.size.width = v68,
                  v145.origin.y = recta,
                  v145.origin.x = v70,
                  CGRectIsNull(v145)))
            {
              v146.origin.y = v94;
              v146.origin.x = v95;
              v146.size.height = v92;
              v146.size.width = v93;
              if (CGRectGetHeight(v146) <= v97)
                goto LABEL_85;
              v147.origin.y = v94;
              v147.origin.x = v95;
              v147.size.height = v92;
              v147.size.width = v93;
              v69 = v92;
              v68 = v93;
              v71 = v94;
              v70 = v95;
              if (CGRectIsNull(v147))
              {
LABEL_85:
                objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
                objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
                goto LABEL_89;
              }
            }
          }
        }
        else
        {
          v69 = v92;
          v68 = v93;
          v71 = v94;
          v70 = v95;
        }
      }
      ++v53;
      v51 = (char *)__p;
      v52 += 32;
      v55 = v70;
      v56 = v71;
      v57 = v68;
      v58 = v69;
      if (v53 >= ((char *)v113 - (_BYTE *)__p) >> 5)
        goto LABEL_76;
    }
  }
  v69 = v100;
  v68 = v102;
  v71 = v104;
  v70 = v106;
LABEL_76:
  v77 = v3;
  objc_msgSend(v88, "boundingBox");
  v152.origin.x = v70;
  v152.origin.y = v71;
  v152.size.width = v68;
  v152.size.height = v69;
  if (CGRectEqualToRect(v148, v152))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v77);
    v22 = v77;
  }
  else
  {
    v78 = -[CRImageSpaceQuad initWithBoundingBox:]([CRImageSpaceQuad alloc], "initWithBoundingBox:", v70, v71, v68, v69);
    v79 = [CRNormalizedQuad alloc];
    objc_msgSend(v77, "boundingQuad");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "normalizationSize");
    v81 = -[CRNormalizedQuad initWithDenormalizedQuad:size:](v79, "initWithDenormalizedQuad:size:", v78);

    CROSLogForCategory(6);
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v88, "description");
      v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v84 = objc_msgSend(v83, "UTF8String");
      -[CRImageSpaceQuad description](v78, "description");
      v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v86 = objc_msgSend(v85, "UTF8String");
      *(_DWORD *)buf = 136315394;
      v116 = v84;
      v117 = 2080;
      v118 = v86;
      _os_log_impl(&dword_1D4FB8000, v82, OS_LOG_TYPE_DEBUG, "CRFormFieldTextOverlapCleanupStep: updating rectangle from %s to %s", buf, 0x16u);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v87 = v77;
      v22 = (id)objc_msgSend(v87, "copy");

      objc_msgSend(v22, "setBoundingQuad:", v81);
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v22);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v77);
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v22);
    }
    else
    {
      v22 = v77;
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v77);
    }

  }
LABEL_88:

LABEL_89:
  if (__p)
  {
    v113 = __p;
    operator delete(__p);
  }

LABEL_92:
}

void __95__CRFormFieldTextOverlapCleanupStep_cleanupTextOverlapForFields_document_underlinedFieldsOnly___block_invoke_64(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  id v11;
  void *v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  CROSLogForCategory(6);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = 136315138;
    v15 = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_1D4FB8000, v9, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: %s is running.", (uint8_t *)&v14, 0xCu);

  }
  objc_msgSend((id)objc_opt_class(), "cleanupTextOverlapForFields:document:underlinedFieldsOnly:", v7, v8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
