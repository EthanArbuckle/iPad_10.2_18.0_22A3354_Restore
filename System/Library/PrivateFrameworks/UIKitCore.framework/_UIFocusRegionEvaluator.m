@implementation _UIFocusRegionEvaluator

+ (id)subregionFromRegion:(id)a3 withSnapshotFrame:(CGRect)a4 inSnapshot:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v13 = a5;
  v14 = v13;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusRegionEvaluator.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("region"));

    if (v14)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusRegionEvaluator.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshot"));

    goto LABEL_3;
  }
  if (!v13)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v14, "coordinateSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_focusRegionWithAdjustedFrame:coordinateSpace:", v15, x, y, width, height);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "_trackSubregion:forRegion:", v16, v12);
  return v16;
}

+ (CGRect)frameForRegion:(id)a3 inCoordinateSpace:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
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
  void *v27;
  void *v28;
  CGRect result;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusRegionEvaluator.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("region"));

    if (v9)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusRegionEvaluator.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinateSpace"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_8;
LABEL_3:
  objc_msgSend(v7, "regionCoordinateSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "regionFrame");
  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  if (v10 && v10 != v9)
  {
    objc_msgSend(v9, "convertRect:fromCoordinateSpace:", v10, v11, v12, v13, v14);
    v15 = v19;
    v16 = v20;
    v17 = v21;
    v18 = v22;
  }

  v23 = v15;
  v24 = v16;
  v25 = v17;
  v26 = v18;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

+ (id)_visibleSubregionsWhenRegion:(id)a3 occludedByRegion:(id)a4 inSnapshot:(id)a5
{
  id v9;
  id v10;
  id v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  _BOOL4 v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  id v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double MaxX;
  double MinY;
  double MaxY;
  double MinX;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  double v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  double v84;
  CGFloat rect;
  CGFloat v86;
  double v87;
  _QWORD v88[2];
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
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
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;

  v88[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusRegionEvaluator.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("occludedRegion"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusRegionEvaluator.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("occludingRegion"));

LABEL_3:
  if (v9 == v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusRegionEvaluator.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("occludedRegion != occludingRegion"));

    if (v11)
      goto LABEL_5;
  }
  else if (v11)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusRegionEvaluator.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshot"));

LABEL_5:
  objc_msgSend(v11, "snapshotFrameForRegion:", v9);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v11, "snapshotFrameForRegion:", v10);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v89.origin.x = v13;
  v86 = v17;
  v87 = v15;
  v89.origin.y = v15;
  v89.size.width = v17;
  rect = v19;
  v89.size.height = v19;
  if (CGRectIsNull(v89))
    goto LABEL_29;
  v90.origin.x = v21;
  v90.origin.y = v23;
  v90.size.width = v25;
  v90.size.height = v27;
  if (CGRectIsNull(v90))
    goto LABEL_29;
  v76 = v13;
  v91.origin.x = v13;
  v91.size.width = v17;
  v91.origin.y = v15;
  v91.size.height = v19;
  v92 = CGRectStandardize(v91);
  x = v92.origin.x;
  y = v92.origin.y;
  width = v92.size.width;
  height = v92.size.height;
  v70 = v23;
  v72 = v21;
  v92.origin.x = v21;
  v92.origin.y = v23;
  v74 = v25;
  v92.size.width = v25;
  v92.size.height = v27;
  v93 = CGRectStandardize(v92);
  v32 = v93.origin.x;
  v33 = v93.origin.y;
  v34 = v93.size.width;
  v35 = v93.size.height;
  v80 = y;
  v82 = x;
  v93.origin.x = x;
  v93.origin.y = y;
  v78 = width;
  v93.size.width = width;
  v36 = height;
  v37 = v32;
  v93.size.height = v36;
  v38 = CGRectGetMinX(v93) + 0.0001;
  v94.origin.x = v37;
  v94.origin.y = v33;
  v94.size.width = v34;
  v94.size.height = v35;
  if (v38 <= CGRectGetMaxX(v94))
  {
    v95.origin.y = v80;
    v95.origin.x = x;
    v95.size.width = v78;
    v95.size.height = v36;
    v40 = CGRectGetMaxX(v95) + -0.0001;
    v96.origin.x = v37;
    v96.origin.y = v33;
    v96.size.width = v34;
    v96.size.height = v35;
    v39 = v40 >= CGRectGetMinX(v96);
  }
  else
  {
    v39 = 0;
  }
  v97.origin.y = v80;
  v97.origin.x = x;
  v97.size.width = v78;
  v97.size.height = v36;
  v41 = CGRectGetMinY(v97) + 0.0001;
  v98.origin.x = v37;
  v98.origin.y = v33;
  v98.size.width = v34;
  v98.size.height = v35;
  if (v41 > CGRectGetMaxY(v98))
    goto LABEL_29;
  v99.origin.y = v80;
  v99.origin.x = v82;
  v99.size.width = v78;
  v99.size.height = v36;
  v42 = CGRectGetMaxY(v99) + -0.0001;
  v100.origin.x = v37;
  v100.origin.y = v33;
  v100.size.width = v34;
  v100.size.height = v35;
  if (v42 < CGRectGetMinY(v100) || !v39)
  {
LABEL_29:
    v88[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 1);
    v44 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v101.origin.x = v76;
    v101.origin.y = v87;
    v101.size.width = v86;
    v101.size.height = rect;
    v121.origin.y = v70;
    v121.origin.x = v72;
    v121.size.width = v74;
    v121.size.height = v27;
    v102 = CGRectIntersection(v101, v121);
    v45 = v102.origin.x;
    v46 = v102.origin.y;
    v47 = v102.size.width;
    v48 = v102.size.height;
    v122.origin.x = v76;
    v122.origin.y = v87;
    v122.size.width = v86;
    v122.size.height = rect;
    if (!CGRectEqualToRect(v102, v122))
    {
      v103.origin.x = v45;
      v103.origin.y = v46;
      v103.size.width = v47;
      v103.size.height = v48;
      MinX = CGRectGetMinX(v103);
      v104.origin.x = v76;
      v104.origin.y = v87;
      v104.size.width = v86;
      v104.size.height = rect;
      MinY = CGRectGetMinY(v104);
      v105.origin.x = v45;
      v105.origin.y = v46;
      v105.size.width = v47;
      v105.size.height = v48;
      v77 = CGRectGetWidth(v105);
      v106.origin.x = v45;
      v106.origin.y = v46;
      v106.size.width = v47;
      v106.size.height = v48;
      v71 = CGRectGetMinY(v106);
      v107.origin.x = v76;
      v107.origin.y = v87;
      v107.size.width = v86;
      v107.size.height = rect;
      v68 = CGRectGetMinY(v107);
      v108.origin.x = v45;
      v108.origin.y = v46;
      v108.size.width = v47;
      v108.size.height = v48;
      v49 = CGRectGetMinX(v108);
      v109.size.height = rect;
      v83 = v49;
      v109.origin.x = v76;
      v109.origin.y = v87;
      v109.size.width = v86;
      v81 = v83 - CGRectGetMinX(v109);
      v110.origin.x = v76;
      v110.origin.y = v87;
      v110.size.width = v86;
      v110.size.height = rect;
      v79 = CGRectGetHeight(v110);
      v111.origin.x = v45;
      v111.origin.y = v46;
      v111.size.width = v47;
      v111.size.height = v48;
      v67 = CGRectGetMinX(v111);
      v112.origin.x = v45;
      v112.origin.y = v46;
      v112.size.width = v47;
      v112.size.height = v48;
      MaxY = CGRectGetMaxY(v112);
      v113.origin.x = v45;
      v113.origin.y = v46;
      v113.size.width = v47;
      v113.size.height = v48;
      v84 = CGRectGetWidth(v113);
      v114.origin.x = v76;
      v114.origin.y = v87;
      v114.size.width = v86;
      v114.size.height = rect;
      v73 = CGRectGetMaxY(v114);
      v115.origin.x = v45;
      v115.origin.y = v46;
      v115.size.width = v47;
      v115.size.height = v48;
      v69 = CGRectGetMaxY(v115);
      v116.origin.x = v45;
      v116.origin.y = v46;
      v116.size.width = v47;
      v116.size.height = v48;
      MaxX = CGRectGetMaxX(v116);
      v117.origin.x = v76;
      v117.origin.y = v87;
      v117.size.width = v86;
      v117.size.height = rect;
      v62 = CGRectGetMinY(v117);
      v118.origin.x = v76;
      v118.origin.y = v87;
      v118.size.width = v86;
      v118.size.height = rect;
      v75 = CGRectGetMaxX(v118);
      v119.origin.x = v45;
      v119.origin.y = v46;
      v119.size.width = v47;
      v119.size.height = v48;
      v50 = CGRectGetMaxX(v119);
      v120.origin.x = v76;
      v120.origin.y = v87;
      v120.size.width = v86;
      v120.size.height = rect;
      v51 = CGRectGetHeight(v120);
      if (v77 > 0.0 && v71 - v68 > 0.0)
      {
        objc_msgSend(a1, "subregionFromRegion:withSnapshotFrame:inSnapshot:", v9, v11, MinX, MinY, v77, v71 - v68);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v52);

      }
      if (v81 > 0.0 && v79 > 0.0)
      {
        objc_msgSend(a1, "subregionFromRegion:withSnapshotFrame:inSnapshot:", v9, v11, v76, v87, v81, v79);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v53);

      }
      v54 = v75 - v50;
      if (v84 > 0.0 && v73 - v69 > 0.0)
      {
        objc_msgSend(a1, "subregionFromRegion:withSnapshotFrame:inSnapshot:", v9, v11, v67, MaxY, v84, v73 - v69);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v55);

      }
      if (v54 > 0.0 && v51 > 0.0)
      {
        objc_msgSend(a1, "subregionFromRegion:withSnapshotFrame:inSnapshot:", v9, v11, MaxX, v62, v54, v51);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v56);

      }
    }
    objc_msgSend(v11, "_trackOccludingRegion:forRegion:", v10, v9);
  }

  return v44;
}

+ (id)__regionsByEvaluatingOcclusionsForBaseRegions:(id)a3 occludingRegions:(id)a4 baseRegionsCanOccludeEachOther:(BOOL)a5 inSnapshot:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  id v45;
  void *v46;
  void *v47;
  id obj;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v54;
  _BOOL4 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v7 = a5;
  v66 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = v10;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusRegionEvaluator.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("occludingRegions"));

    v10 = v45;
  }
  v47 = v10;
  if (!v10)
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
LABEL_44:
    v18 = v14;
    goto LABEL_45;
  }
  v13 = objc_msgSend(v10, "count");
  v14 = v10;
  if (!v13)
    goto LABEL_44;
  if (objc_msgSend(v10, "count") == 1)
  {
    v15 = objc_msgSend(v11, "count");
    v14 = v10;
    if (!v15)
      goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v10;
  v18 = (id)v16;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  objc_msgSend(v17, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
  if (!v51)
    goto LABEL_42;
  v50 = *(_QWORD *)v61;
  v49 = !v7;
  do
  {
    for (i = 0; i != v51; ++i)
    {
      if (*(_QWORD *)v61 != v50)
        objc_enumerationMutation(obj);
      v54 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
      v20 = objc_msgSend(v11, "count");
      if (!v20)
      {
        v36 = 0;
LABEL_36:
        objc_msgSend(v18, "insertObject:atIndex:", v54, 0);
        v39 = 0;
        goto LABEL_37;
      }
      v21 = v20;
      v52 = i;
      v22 = 0;
      v55 = 0;
      v23 = 0;
      while (!v22)
      {
        v24 = v54;
LABEL_18:
        v25 = v24;
        objc_msgSend(v11, "objectAtIndex:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "originalRegionForRegion:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "originalRegionForRegion:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "_canBeOccludedByRegionsAbove") && v27 != v28)
        {
          objc_msgSend(a1, "_visibleSubregionsWhenRegion:occludedByRegion:inSnapshot:", v25, v26, v12);
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = v22;
          v31 = v21;
          v32 = v12;
          v33 = v11;
          v34 = (void *)v29;

          v55 = objc_msgSend(v34, "count") == 0;
          v35 = v34;
          v11 = v33;
          v12 = v32;
          v21 = v31;
          v22 = v35;
        }
        ++v23;

        if (v21 == v23)
          goto LABEL_27;
      }
      if (objc_msgSend(v22, "count") == 1)
      {
        objc_msgSend(v22, "firstObject");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      if (v55)
      {
        v36 = 1;
        i = v52;
        goto LABEL_28;
      }
      v37 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v37, "removeObjectsInRange:", 0, v23);
      objc_msgSend(a1, "__regionsByEvaluatingOcclusionsForBaseRegions:occludingRegions:baseRegionsCanOccludeEachOther:inSnapshot:", v22, v37, 0, v12);
      v38 = objc_claimAutoreleasedReturnValue();

      v55 = 0;
      v22 = (void *)v38;
LABEL_27:
      i = v52;
      v36 = v55;
      if (!v22)
        goto LABEL_36;
LABEL_28:
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v39 = v22;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v57;
        do
        {
          for (j = 0; j != v41; ++j)
          {
            if (*(_QWORD *)v57 != v42)
              objc_enumerationMutation(v39);
            objc_msgSend(v18, "insertObject:atIndex:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j), 0);
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
        }
        while (v41);
      }

LABEL_37:
      if (((v49 | v36) & 1) == 0 && objc_msgSend(v54, "_canOccludeRegionsBelow"))
        objc_msgSend(v11, "insertObject:atIndex:", v54, 0);

    }
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
  }
  while (v51);
LABEL_42:

LABEL_45:
  return v18;
}

+ (id)regionsByEvaluatingOcclusionsForRegions:(id)a3 inSnapshot:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusRegionEvaluator.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regions"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusRegionEvaluator.m"), 214, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshot"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "__regionsByEvaluatingOcclusionsForBaseRegions:occludingRegions:baseRegionsCanOccludeEachOther:inSnapshot:", v7, v10, 1, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)regionsByOccludingRegions:(id)a3 beneathRegions:(id)a4 inSnapshot:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusRegionEvaluator.m"), 223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("occludingRegions"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusRegionEvaluator.m"), 224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshot"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusRegionEvaluator.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regions"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  v12 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(a1, "__regionsByEvaluatingOcclusionsForBaseRegions:occludingRegions:baseRegionsCanOccludeEachOther:inSnapshot:", v9, v12, 0, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
