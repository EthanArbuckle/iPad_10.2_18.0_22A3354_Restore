@implementation CRLImmutableBrushStrokeStorage

- (CRLImmutableBrushStrokeStorage)initWithImage:(id)a3 paths:(id)a4 bounds:(id)a5 textureIndices:(id)a6 options:(id)a7 lineEnds:(id)a8
{
  id v15;
  id v16;
  id v17;
  CRLImmutableBrushStrokeStorage *v18;
  CRLImmutableBrushStrokeStorage *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v15 = a4;
  v22 = a5;
  v21 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CRLImmutableBrushStrokeStorage;
  v18 = -[CRLImmutableBrushStrokeStorage init](&v24, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_image, a3);
    objc_storeStrong((id *)&v19->_paths, a4);
    objc_storeStrong((id *)&v19->_bounds, a5);
    objc_storeStrong((id *)&v19->_textureIndices, a6);
    objc_storeStrong((id *)&v19->_options, a7);
    objc_storeStrong((id *)&v19->_lineEnds, a8);
    v19->_totalSectionCount = +[CRLImmutableBrushStrokeStorage p_totalSectionCountWithPaths:](CRLImmutableBrushStrokeStorage, "p_totalSectionCountWithPaths:", v15);
  }

  return v19;
}

+ (unint64_t)p_totalSectionCountWithPaths:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i)));
        v7 += (unint64_t)objc_msgSend(v10, "count");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)deepCopy
{
  void *v3;
  void *v4;
  void *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CRLBrushStrokeStorageBezierPathContainer *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  CRLBrushStrokeStorageBezierPathContainer *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  CRLLineEnd *v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  double v74;
  double v75;
  double v76;
  double v77;
  id v78;
  void *v79;
  CRLLineEnd *v80;
  CRLImmutableBrushStrokeStorage *v81;
  void *v83;
  id v84;
  id v85;
  id obj;
  id obja;
  uint64_t v88;
  void *v89;
  void *v90;
  char *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  char *v95;
  id v96;
  id v97;
  id v98;
  CRLImmutableBrushStrokeStorage *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImmutableBrushStrokeStorage image](self, "image"));
  v84 = objc_msgSend(v3, "copy");

  v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v99 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImmutableBrushStrokeStorage paths](self, "paths"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));

  obj = v5;
  v91 = (char *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v128, v139, 16);
  if (v91)
  {
    v88 = *(_QWORD *)v129;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v129 != v88)
          objc_enumerationMutation(obj);
        v95 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * (_QWORD)v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v124 = 0u;
        v125 = 0u;
        v126 = 0u;
        v127 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImmutableBrushStrokeStorage paths](v99, "paths"));
        v93 = v7;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));

        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v124, v138, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v125;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v125 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)v14);
              v16 = [CRLBrushStrokeStorageBezierPathContainer alloc];
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "originalPath"));
              v18 = objc_msgSend(v17, "copy");
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pathWithPossibleSmoothing"));
              v20 = objc_msgSend(v19, "copy");
              v21 = -[CRLBrushStrokeStorageBezierPathContainer initWithOriginalPath:pathWithPossibleSmoothing:](v16, "initWithOriginalPath:pathWithPossibleSmoothing:", v18, v20);
              objc_msgSend(v8, "addObject:", v21);

              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v124, v138, 16);
          }
          while (v12);
        }

        objc_msgSend(v90, "setObject:forKeyedSubscript:", v8, v93);
        v6 = v95 + 1;
      }
      while (v95 + 1 != v91);
      v91 = (char *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v139, 16);
    }
    while (v91);
  }

  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImmutableBrushStrokeStorage bounds](v99, "bounds"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allKeys"));

  v96 = v23;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v120, v137, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v121;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v121 != v26)
          objc_enumerationMutation(v96);
        v28 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v116 = 0u;
        v117 = 0u;
        v118 = 0u;
        v119 = 0u;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImmutableBrushStrokeStorage bounds](v99, "bounds"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v28));

        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v116, v136, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v117;
          do
          {
            v35 = 0;
            do
            {
              if (*(_QWORD *)v117 != v34)
                objc_enumerationMutation(v31);
              v36 = objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)v35), "copy");
              objc_msgSend(v29, "addObject:", v36);

              v35 = (char *)v35 + 1;
            }
            while (v33 != v35);
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v116, v136, 16);
          }
          while (v33);
        }

        objc_msgSend(v94, "setObject:forKeyedSubscript:", v29, v28);
        v27 = (char *)v27 + 1;
      }
      while (v27 != v25);
      v25 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v120, v137, 16);
    }
    while (v25);
  }

  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImmutableBrushStrokeStorage textureIndices](v99, "textureIndices"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "allKeys"));

  v97 = v38;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v112, v135, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v113;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v113 != v41)
          objc_enumerationMutation(v97);
        v43 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImmutableBrushStrokeStorage textureIndices](v99, "textureIndices"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", v43));

        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v108, v134, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v109;
          do
          {
            v50 = 0;
            do
            {
              if (*(_QWORD *)v109 != v49)
                objc_enumerationMutation(v46);
              v51 = objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)v50), "copy");
              objc_msgSend(v44, "addObject:", v51);

              v50 = (char *)v50 + 1;
            }
            while (v48 != v50);
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v108, v134, 16);
          }
          while (v48);
        }

        objc_msgSend(v92, "setObject:forKeyedSubscript:", v44, v43);
        v42 = (char *)v42 + 1;
      }
      while (v42 != v40);
      v40 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v112, v135, 16);
    }
    while (v40);
  }

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImmutableBrushStrokeStorage options](v99, "options"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "allKeys"));

  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v104, v133, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v105;
    do
    {
      v58 = 0;
      do
      {
        if (*(_QWORD *)v105 != v57)
          objc_enumerationMutation(v54);
        v59 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)v58);
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImmutableBrushStrokeStorage options](v99, "options"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKeyedSubscript:", v59));

        v62 = objc_msgSend(v61, "copy");
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v62, v59);

        v58 = (char *)v58 + 1;
      }
      while (v56 != v58);
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v104, v133, 16);
    }
    while (v56);
  }
  v83 = v52;

  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImmutableBrushStrokeStorage lineEnds](v99, "lineEnds"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "allKeys"));

  v85 = v64;
  v98 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v100, v132, 16);
  if (v98)
  {
    obja = *(id *)v101;
    do
    {
      v65 = 0;
      do
      {
        if (*(id *)v101 != obja)
          objc_enumerationMutation(v85);
        v66 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)v65);
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImmutableBrushStrokeStorage lineEnds](v99, "lineEnds", v83));
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", v66));

        v69 = [CRLLineEnd alloc];
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "path"));
        v71 = objc_msgSend(v70, "copy");
        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "wrapPath"));
        v73 = objc_msgSend(v72, "copy");
        objc_msgSend(v68, "endPoint");
        v75 = v74;
        v77 = v76;
        v78 = objc_msgSend(v68, "isFilled");
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "identifier"));
        v80 = -[CRLLineEnd initWithBezierPath:wrapPath:endPoint:isFilled:identifier:lineJoin:](v69, "initWithBezierPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", v71, v73, v78, v79, objc_msgSend(v68, "lineJoin"), v75, v77);
        objc_msgSend(v89, "setObject:forKeyedSubscript:", v80, v66);

        v65 = (char *)v65 + 1;
      }
      while (v98 != v65);
      v98 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v100, v132, 16);
    }
    while (v98);
  }

  v81 = -[CRLImmutableBrushStrokeStorage initWithImage:paths:bounds:textureIndices:options:lineEnds:]([CRLImmutableBrushStrokeStorage alloc], "initWithImage:paths:bounds:textureIndices:options:lineEnds:", v84, v90, v94, v92, v83, v89);
  return v81;
}

- (CRLImage)image
{
  return self->_image;
}

- (NSDictionary)paths
{
  return self->_paths;
}

- (NSDictionary)bounds
{
  return self->_bounds;
}

- (NSDictionary)textureIndices
{
  return self->_textureIndices;
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSDictionary)lineEnds
{
  return self->_lineEnds;
}

- (unint64_t)totalSectionCount
{
  return self->_totalSectionCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineEnds, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_textureIndices, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
