@implementation CRFormAddTextBasedDetectionFieldsStep

- (id)findMatchesForPattern:(id)a3 fields:(id)a4 lines:(id)a5
{
  id v7;
  unint64_t v8;
  int64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  unint64_t v28;
  id v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v7 = a4;
  v29 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v28 = objc_msgSend(v7, "count");
  v9 = v28 >> 1;
  while (v8 < objc_msgSend(v29, "count"))
  {
    objc_msgSend(v29, "objectAtIndexedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28 >= 2)
    {
      v12 = 0;
      v11 = 0;
      do
      {
        objc_msgSend(v10, "children");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v11 + v12 < (unint64_t)objc_msgSend(v13, "count");

        if (!v14)
          break;
        objc_msgSend(v10, "children");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", v11 + v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "text");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "objectAtIndexedSubscript:", (2 * v11) | 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqualToString:", v20);
        if (v21)
          ++v11;
        else
          v11 = 0;

        v12 += v21 ^ 1u;
      }
      while (v11 < v9);
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
    if (v11 == v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v22;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v24);

    }
    ++v8;
  }

  return v27;
}

- (id)rectangleEstimatesForPatternFields:(id)a3 matching:(id)a4 recognizedTextLines:(id)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double MaxX;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  _OWORD *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  double v60;
  double v61;
  __int128 v62;
  void *v63;
  __int128 v64;
  double v65;
  double v66;
  double v67;
  CGFloat v68;
  CGFloat v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  unint64_t v79;
  double MinX;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  void *v87;
  int v88;
  double v89;
  __int128 v90;
  void *v91;
  __int128 v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  id v103;
  void *v104;
  uint64_t v105;
  id v106;
  void *v107;
  _OWORD v108[2];
  _OWORD v109[2];
  _QWORD v110[4];
  _QWORD v111[4];
  _OWORD v112[2];
  _OWORD v113[2];
  _QWORD v114[5];
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;

  v7 = a3;
  v103 = a4;
  v106 = a5;
  v107 = v7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  objc_msgSend(v103, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v103, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  v97 = v8;
  v102 = v8 >> 1;
  if (v8 >= 2)
  {
    v15 = 0;
    v12 = 0;
    v16 = 0;
    if (v8 >> 1 <= 1)
      v17 = 1;
    else
      v17 = v8 >> 1;
    v14 = 0.0;
    v18 = 1;
    do
    {
      objc_msgSend(v106, "objectAtIndexedSubscript:", v105, v97);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "children");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", v11 + v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "boundingQuad");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "size");
      v23 = v22;
      if (v16)
      {
        objc_msgSend(v107, "objectAtIndexedSubscript:", v18 - 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "intValue");

        objc_msgSend(v107, "objectAtIndexedSubscript:", v18);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v12 += v25 + objc_msgSend(v26, "length");

      }
      v14 = v14 + v23;
      ++v16;
      v18 += 2;
      v15 = v13;
    }
    while (v17 != v16);
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 0.0;
  }
  objc_msgSend(v106, "objectAtIndexedSubscript:", v105, v97);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "boundingQuad");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "normalizationSize");
  v30 = v29;
  v32 = v31;

  objc_msgSend(v106, "objectAtIndexedSubscript:", v105);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "children");
  v99 = v11 + v102;
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "objectAtIndexedSubscript:", v11 + v102 - 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "boundingQuad");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "boundingBox");
  MaxX = CGRectGetMaxX(v115);
  objc_msgSend(v106, "objectAtIndexedSubscript:", v105);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "children");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectAtIndexedSubscript:", v11);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "boundingQuad");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "boundingBox");
  v40 = v14 / (double)v102;
  v41 = MaxX - CGRectGetMinX(v116);

  v42 = v40 * v32 / v30 * 0.75;
  if (v41 < v42 * (double)v12)
  {
    v43 = (id)MEMORY[0x1E0C9AA60];
    v44 = v104;
    goto LABEL_35;
  }
  if (v11 < 1)
  {
    v49 = 0.0;
  }
  else
  {
    objc_msgSend(v106, "objectAtIndexedSubscript:", v105);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "children");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectAtIndexedSubscript:", v11 - 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "boundingQuad");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "boundingBox");
    v49 = CGRectGetMaxX(v117);

  }
  if (v98 >= 2)
  {
    v50 = 0;
    if ((unint64_t)v102 <= 1)
      v51 = 1;
    else
      v51 = v102;
    v52 = (_OWORD *)MEMORY[0x1E0C9D648];
    v53 = v13;
    do
    {
      objc_msgSend(v106, "objectAtIndexedSubscript:", v105);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "children");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectAtIndexedSubscript:", v11);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "boundingQuad");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v107, "objectAtIndexedSubscript:", v50);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v55) = objc_msgSend(v57, "intValue");

      if ((int)v55 < 1)
      {
        v64 = v52[1];
        v112[0] = *v52;
        v112[1] = v64;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v112, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "addObject:", v63);
      }
      else
      {
        objc_msgSend(v107, "objectAtIndexedSubscript:", v50);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "intValue");

        objc_msgSend(v13, "topLeft");
        v60 = v42 * (double)v59;
        if (v61 - v60 >= v49)
        {
          objc_msgSend(v13, "topLeft");
          v66 = v65;
          objc_msgSend(v13, "topLeft");
          v68 = v67;
          v69 = v66 - v60;
          *(CGFloat *)v114 = v69;
          *(double *)&v114[1] = v67;
          *(double *)&v114[2] = v42 * (double)v59;
          *(double *)&v114[3] = v40;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v114, "{CGRect={CGPoint=dd}{CGSize=dd}}");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "addObject:", v70);

          v118.origin.x = v69;
          v118.origin.y = v68;
          v118.size.width = v42 * (double)v59;
          v118.size.height = v40;
          v49 = CGRectGetMaxX(v118);
          goto LABEL_26;
        }
        v62 = v52[1];
        v113[0] = *v52;
        v113[1] = v62;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v113, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "addObject:", v63);
      }

LABEL_26:
      v71 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v13, "boundingBox");
      v111[0] = v72;
      v111[1] = v73;
      v111[2] = v74;
      v111[3] = v75;
      objc_msgSend(v71, "valueWithBytes:objCType:", v111, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "addObject:", v76);

      v50 += 2;
      ++v11;
      v53 = v13;
      --v51;
    }
    while (v51);
  }
  objc_msgSend(v106, "objectAtIndexedSubscript:", v105);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "children");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v78, "count");

  MinX = 1.0;
  if (v99 < v79)
  {
    objc_msgSend(v106, "objectAtIndexedSubscript:", v105);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "children");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "objectAtIndexedSubscript:", v99);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "boundingQuad");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "boundingBox");
    MinX = CGRectGetMinX(v119);

  }
  objc_msgSend(v107, "lastObject");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "intValue");

  if (v86 < 1)
  {
    v92 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v108[0] = *MEMORY[0x1E0C9D648];
    v108[1] = v92;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v108, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "addObject:", v91);
  }
  else
  {
    objc_msgSend(v107, "lastObject");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "intValue");

    objc_msgSend(v13, "topRight");
    if (v42 * (double)v88 + v89 <= MinX)
    {
      objc_msgSend(v13, "topRight");
      v94 = v93;
      objc_msgSend(v13, "topRight");
      v110[0] = v94;
      v110[1] = v95;
      *(double *)&v110[2] = v42 * (double)v88;
      *(double *)&v110[3] = v40;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v110, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "addObject:", v91);
    }
    else
    {
      v90 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      v109[0] = *MEMORY[0x1E0C9D648];
      v109[1] = v90;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v109, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "addObject:", v91);
    }
  }

  v44 = v104;
  v43 = v104;
LABEL_35:

  return v43;
}

- (void)resolveAssignmentForPatternFields:(id)a3 matching:(id)a4 estimates:(id)a5 recognizedTextLines:(id)a6 detectedFields:(id)a7 outNewFields:(id *)a8 outFieldsToDelete:(id *)a9 normalizationSize:(CGSize)a10
{
  double height;
  double width;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  unint64_t i;
  void *v35;
  void *v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  BOOL v41;
  CRNormalizedQuad *v42;
  CRFormTextFieldOutputRegion *v43;
  BOOL v44;
  uint64_t v45;
  id v46;
  id v48;
  _QWORD v49[10];
  CGRect v50;
  CGRect v51;
  CGRect v52;

  height = a10.height;
  width = a10.width;
  v46 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v48 = a7;
  v19 = objc_msgSend(v46, "count");
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "integerValue");
  v22 = v19 >> 1;

  v23 = 0;
  do
  {
    objc_msgSend(v17, "objectAtIndexedSubscript:", 2 * v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rectValue");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;

    v50.origin.x = v26;
    v50.origin.y = v28;
    v50.size.width = v30;
    v50.size.height = v32;
    v33 = v16;
    if (!CGRectIsEmpty(v50))
    {
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __178__CRFormAddTextBasedDetectionFieldsStep_resolveAssignmentForPatternFields_matching_estimates_recognizedTextLines_detectedFields_outNewFields_outFieldsToDelete_normalizationSize___block_invoke;
      v49[3] = &__block_descriptor_72_e39_B32__0___CRFormFieldProviding__8Q16_B24l;
      *(double *)&v49[4] = v26;
      *(double *)&v49[5] = v28;
      *(double *)&v49[6] = v30;
      *(double *)&v49[7] = v32;
      v49[8] = a9;
      if (objc_msgSend(v48, "indexOfObjectPassingTest:", v49) == 0x7FFFFFFFFFFFFFFFLL)
      {
        for (i = 0; i < objc_msgSend(v18, "count"); ++i)
        {
          if (v21 != i)
          {
            objc_msgSend(v18, "objectAtIndexedSubscript:", i);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "boundingQuad");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "boundingBox");
            v52.origin.x = v37;
            v52.origin.y = v38;
            v52.size.width = v39;
            v52.size.height = v40;
            v51.origin.x = v26;
            v51.origin.y = v28;
            v51.size.width = v30;
            v51.size.height = v32;
            v41 = CGRectIntersectsRect(v51, v52);

            if (v41)
              goto LABEL_10;
          }
        }
        v42 = -[CRNormalizedQuad initWithNormalizedBoundingBox:size:]([CRNormalizedQuad alloc], "initWithNormalizedBoundingBox:size:", v26, v28, v30, v32, width, height);
        LOBYTE(v45) = 0;
        v43 = -[CRFormTextFieldOutputRegion initWithQuad:labelRegion:subFields:contentType:source:hasBoundedWidth:hasBoundedHeight:]([CRFormTextFieldOutputRegion alloc], "initWithQuad:labelRegion:subFields:contentType:source:hasBoundedWidth:hasBoundedHeight:", v42, 0, 0, 0, 1, 0, v45);
        objc_msgSend(*a8, "addObject:", v43);

      }
    }
LABEL_10:
    v44 = v23++ == v22;
    v16 = v33;
  }
  while (!v44);

}

uint64_t __178__CRFormAddTextBasedDetectionFieldsStep_resolveAssignmentForPatternFields_matching_estimates_recognizedTextLines_detectedFields_outNewFields_outFieldsToDelete_normalizationSize___block_invoke(uint64_t a1, void *a2)
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
  _BOOL4 IsEmpty;
  uint64_t v14;
  CGRect v16;
  CGRect v17;

  v3 = a2;
  objc_msgSend(v3, "boundingQuad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingBox");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v17.origin.x = v6;
  v17.origin.y = v8;
  v17.size.width = v10;
  v17.size.height = v12;
  v16 = CGRectIntersection(*(CGRect *)(a1 + 32), v17);
  IsEmpty = CGRectIsEmpty(v16);
  if (objc_msgSend(v3, "fieldSource") == 1)
    v14 = (objc_msgSend(**(id **)(a1 + 64), "containsObject:", v3) | IsEmpty) ^ 1;
  else
    v14 = 0;

  return v14;
}

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  NSObject *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t i;
  void *v18;
  unint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  _BYTE buf[24];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v32 = a4;
  v36 = a5;
  v33 = a6;
  CROSLogForCategory(6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = objc_msgSend(v12, "UTF8String");
    _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: %s is running.", buf, 0xCu);

  }
  objc_msgSend(v36, "contentsWithTypes:", 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  *(_QWORD *)buf = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsSeparatedByCharactersInSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsJoinedByString:", &stru_1E98DC948);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; ; i = v19 + 1)
  {
    objc_msgSend(&unk_1E993F968, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = i;
    v20 = i < objc_msgSend(v18, "count");

    if (!v20)
      break;
    objc_msgSend(&unk_1E993F968, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(&unk_1E993F968, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "containsString:", v22))
    {
      -[CRFormAddTextBasedDetectionFieldsStep findMatchesForPattern:fields:lines:](self, "findMatchesForPattern:fields:lines:", v22, v23, v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      for (j = 0; j < objc_msgSend(v24, "count"); ++j)
      {
        objc_msgSend(v24, "objectAtIndexedSubscript:", j);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRFormAddTextBasedDetectionFieldsStep rectangleEstimatesForPatternFields:matching:recognizedTextLines:](self, "rectangleEstimatesForPatternFields:matching:recognizedTextLines:", v23, v26, v13);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v27, "count"))
        {
          objc_msgSend(v24, "objectAtIndexedSubscript:", j);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "boundingQuad");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "normalizationSize");
          -[CRFormAddTextBasedDetectionFieldsStep resolveAssignmentForPatternFields:matching:estimates:recognizedTextLines:detectedFields:outNewFields:outFieldsToDelete:normalizationSize:](self, "resolveAssignmentForPatternFields:matching:estimates:recognizedTextLines:detectedFields:outNewFields:outFieldsToDelete:normalizationSize:", v23, v28, v27, v13, v35, &v37, buf);

        }
      }

    }
  }
  if (objc_msgSend(*(id *)buf, "count") || objc_msgSend(v37, "count"))
  {
    v30 = (void *)objc_msgSend(v35, "mutableCopy");
    objc_msgSend(v30, "removeObjectsInArray:", *(_QWORD *)buf);
    objc_msgSend(v30, "addObjectsFromArray:", v37);

  }
  else
  {
    v30 = v35;
  }

  return v30;
}

@end
