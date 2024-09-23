@implementation CRLWPColumn

- (BOOL)lastLineIsEmptyAndHasListLabel
{
  _QWORD *ptr;

  ptr = self->_lineFragmentArray.__ptr_;
  if (ptr)
  {
    ptr = (_QWORD *)sub_100038988(ptr);
    if (ptr)
      LOBYTE(ptr) = (*(_QWORD *)(sub_100038998(self->_lineFragmentArray.__ptr_, (unint64_t)ptr - 1) + 24) & 0x2004800) == 33570816;
  }
  return (char)ptr;
}

- (BOOL)terminatedByBreak
{
  return (BYTE1(self->_layoutResultFlags) >> 3) & 1;
}

+ (id)contentRectsToAvoidPencilAnnotationOverlapWithColumns:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v3, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v10 = objc_msgSend(v9, "range", (_QWORD)v15);
          objc_msgSend(v9, "columnRectForRange:", v10, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:"));
          objc_msgSend(v4, "addObject:", v12);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

  }
  v13 = objc_msgSend(v4, "copy", (_QWORD)v15);

  return v13;
}

+ (CGRect)frameBoundsOfColumns:(id)a3
{
  id v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  CGRect v25;
  CGRect v26;
  CGRect result;
  CGRect v28;

  v3 = a3;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11), "frameBounds", (_QWORD)v20);
        v28.origin.x = v12;
        v28.origin.y = v13;
        v28.size.width = v14;
        v28.size.height = v15;
        v25.origin.x = x;
        v25.origin.y = y;
        v25.size.width = width;
        v25.size.height = height;
        v26 = CGRectUnion(v25, v28);
        x = v26.origin.x;
        y = v26.origin.y;
        width = v26.size.width;
        height = v26.size.height;
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

+ (CGRect)caretRectForInsertionPoint:(id)a3 withColumns:(id)a4
{
  id v5;
  id v6;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect result;
  CGRect v65;

  v5 = a3;
  v6 = a4;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v54;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v54 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "caretRectForSelection:", v5);
        x = v16;
        y = v17;
        width = v18;
        height = v19;
        if (objc_msgSend(v15, "textIsVertical"))
        {
          if (width > 0.0)
          {
            height = fmax(height, 1.0);
            goto LABEL_14;
          }
        }
        else if (height > 0.0)
        {
          width = fmax(width, 1.0);
          goto LABEL_14;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_14:

  v65.origin.x = CGRectNull.origin.x;
  v65.origin.y = CGRectNull.origin.y;
  v65.size.width = CGRectNull.size.width;
  v65.size.height = CGRectNull.size.height;
  v58.origin.x = x;
  v58.origin.y = y;
  v58.size.width = width;
  v58.size.height = height;
  if (!CGRectEqualToRect(v58, v65))
  {
    v20 = objc_msgSend(v5, "caretAffinity");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPColumn columnForCharIndex:allowEndOfColumn:withColumns:](CRLWPColumn, "columnForCharIndex:allowEndOfColumn:withColumns:", objc_msgSend(v5, "start"), v20 == (id)1, v11));
    if (v21)
    {
      v52 = 0;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v21, "lineMetricsAtCharIndex:allowEndOfLine:", objc_msgSend(v5, "start"), v20 == (id)1);
      v59.origin = 0u;
      v59.size = 0u;
      if (!CGRectIsNull(v59))
      {
        objc_msgSend(v21, "transformToWP");
        v60.origin.x = x;
        v60.origin.y = y;
        v60.size.width = width;
        v60.size.height = height;
        v61 = CGRectApplyAffineTransform(v60, &v31);
        v22 = v61.origin.x;
        v23 = v61.size.width;
        v24 = v61.size.height;
        v25 = *((double *)&v32 + 1);
        objc_msgSend(v21, "transformFromWP");
        v62.origin.x = v22;
        v62.origin.y = v25;
        v62.size.width = v23;
        v62.size.height = v24;
        v63 = CGRectApplyAffineTransform(v62, &v30);
        x = v63.origin.x;
        y = v63.origin.y;
        width = v63.size.width;
        height = v63.size.height;
      }
    }

  }
  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

+ (CGRect)rectForSelection:(id)a3 withColumns:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(a1, "rectForSelection:withColumns:useParagraphModeRects:", a3, a4, 1);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)rectForSelection:(id)a3 withColumns:(id)a4 useParagraphModeRects:(BOOL)a5
{
  id v6;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  NSUInteger v35;
  NSUInteger v36;
  char *v37;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *j;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  NSRange v70;
  NSRange v71;
  CGRect v72;
  CGRect v73;
  CGRect result;

  v6 = a3;
  v59 = a4;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  if (objc_msgSend(v6, "isValid"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "firstObject"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "firstObject"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storage"));

      if (v13)
      {
        v58 = v13;
        v14 = objc_msgSend(v6, "insertionChar");
        if (v14 > objc_msgSend(v13, "length"))
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012446E0);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E0C488();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101244700);
          v15 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
          {
            objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            sub_100DE7E60();
          }

          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPColumn rectForSelection:withColumns:useParagraphModeRects:]"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 333, 0, "selection is past the end of storage");

        }
        if (objc_msgSend(v6, "isInsertionPoint"))
        {
          v18 = objc_msgSend(v6, "insertionChar");
          if (v18 <= objc_msgSend(v13, "length"))
          {
            v20 = (char *)objc_msgSend(v13, "wordAtCharIndex:includePreviousWord:", objc_msgSend(v6, "range"), 1);
            if (v20 != (char *)0x7FFFFFFFFFFFFFFFLL)
            {
              v21 = v19;
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPColumn columnForCharIndex:allowEndOfColumn:withColumns:](CRLWPColumn, "columnForCharIndex:allowEndOfColumn:withColumns:", objc_msgSend(v6, "range"), objc_msgSend(v6, "isAtEndOfLine"), v59));
              if (v22)
              {
                v23 = objc_msgSend(v22, "lineIndexForCharIndex:eol:", objc_msgSend(v6, "range"), objc_msgSend(v6, "isAtEndOfLine"));
                if (v23 == objc_msgSend(v22, "lineIndexForCharIndex:eol:", v20, 0)
                  && v23 == objc_msgSend(v22, "lineIndexForCharIndex:eol:", &v20[v21], objc_msgSend(v6, "isAtEndOfLine")))
                {
                  v24 = objc_msgSend(v6, "copyWithNewRange:", v20, v21);

                  v6 = v24;
                }
              }

            }
          }
        }
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v25 = v59;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v65;
          while (2)
          {
            for (i = 0; i != v26; i = (char *)i + 1)
            {
              if (*(_QWORD *)v65 != v27)
                objc_enumerationMutation(v25);
              v29 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v6, "isInsertionPoint"))
              {
                objc_msgSend(v29, "caretRectForSelection:", v6);
                x = v30;
                y = v31;
                width = v32;
                height = v33;
                if (objc_msgSend(v29, "textIsVertical"))
                {
                  if (width > 0.0)
                  {
                    height = fmax(height, 1.0);
                    goto LABEL_51;
                  }
                }
                else if (height > 0.0)
                {
                  width = fmax(width, 1.0);
                  goto LABEL_51;
                }
              }
              else
              {
                v34 = objc_msgSend(v29, "range");
                v36 = v35;
                v37 = (char *)objc_msgSend(v29, "lineCount");
                if (v37 && (*((_QWORD *)objc_msgSend(v29, "lineFragmentAtIndex:", v37 - 1) + 3) & 0x101) == 1)
                  ++v36;
                v70.location = (NSUInteger)objc_msgSend(v6, "range");
                v71.location = (NSUInteger)v34;
                v71.length = v36;
                if (NSIntersectionRange(v70, v71).length)
                {
                  v38 = objc_msgSend(v6, "range");
                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:includePaginatedAttachments:", v38, v39, objc_msgSend(v6, "type"), 0, 0, 0));
                  objc_msgSend(v29, "frameBounds");
                  v62 = 0u;
                  v63 = 0u;
                  v60 = 0u;
                  v61 = 0u;
                  v41 = v40;
                  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
                  if (v42)
                  {
                    v43 = *(_QWORD *)v61;
                    do
                    {
                      for (j = 0; j != v42; j = (char *)j + 1)
                      {
                        if (*(_QWORD *)v61 != v43)
                          objc_enumerationMutation(v41);
                        objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)j), "CGRectValue");
                        v47 = v46;
                        v49 = v48;
                        v51 = v50;
                        v52 = fmax(v45, 1.0);
                        if (v50 <= 0.0)
                          v53 = v45;
                        else
                          v53 = v52;
                        v72.origin.x = x;
                        v72.origin.y = y;
                        v72.size.width = width;
                        v72.size.height = height;
                        v73 = CGRectUnion(v72, *(CGRect *)&v47);
                        x = v73.origin.x;
                        y = v73.origin.y;
                        width = v73.size.width;
                        height = v73.size.height;
                      }
                      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
                    }
                    while (v42);
                  }

                }
              }
            }
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
            if (v26)
              continue;
            break;
          }
        }
LABEL_51:

        v13 = v58;
      }

    }
  }

  v54 = x;
  v55 = y;
  v56 = width;
  v57 = height;
  result.size.height = v57;
  result.size.width = v56;
  result.origin.y = v55;
  result.origin.x = v54;
  return result;
}

+ (void)calculateSelectionPinRectsForSelection:(id)a3 inColumns:(id)a4 outSelectionPinRect:(CGRect *)a5 outSelectionTailPinRect:(CGRect *)a6
{
  id v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  CGSize size;
  CGSize v23;
  id v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  char *v32;
  char *v33;
  id v34;
  char *v35;
  char *v36;
  uint64_t v37;
  CGFloat *p_y;
  CGSize *p_size;
  CGFloat *p_height;
  const CGRect *v41;
  CGFloat *v42;
  CGSize *v43;
  CGFloat *v44;
  const CGRect *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *i;
  double v51;
  double y;
  CGFloat v53;
  CGFloat height;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  double MinY;
  double v59;
  BOOL v60;
  double MaxY;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  BOOL IsEmpty;
  CGFloat MinX;
  CGFloat v69;
  double v70;
  double v71;
  double v72;
  BOOL v73;
  double v74;
  double v75;
  BOOL v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double MaxX;
  double v85;
  double v86;
  CGFloat v87;
  CGFloat v88;
  double v89;
  double v90;
  BOOL v91;
  double v92;
  double v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  double v98;
  double v99;
  double v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  double v104;
  CGFloat v105;
  double v106;
  double v107;
  double v108;
  CGFloat v109;
  CGFloat v110;
  double v111;
  char *v112;
  unint64_t v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  CGFloat v123;
  CGFloat v124;
  CGFloat v125;
  CGFloat v126;
  CGSize *v127;
  CGFloat v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  CKRecordID v147;
  Swift::String v148;
  id v149;
  id obj;
  uint64_t v151;
  uint64_t v152;
  id v153;
  uint64_t v154;
  void *v155;
  void *v156;
  char *v157;
  CGFloat v158;
  unsigned int v159;
  unint64_t v160;
  CGFloat v161;
  CGFloat v162;
  CGFloat v163;
  CGFloat v164;
  CGFloat v165;
  CGFloat width;
  CGFloat v167;
  CGFloat x;
  CGFloat v169;
  CGFloat v170;
  CGFloat v171;
  CGFloat v172;
  CGFloat rect2;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  CGAffineTransform v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  _BYTE v189[128];
  void *v190;
  _BYTE v191[128];
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;
  CGRect v233;
  CGRect v234;

  v9 = a3;
  v149 = a4;
  v156 = v9;
  v10 = (unint64_t)objc_msgSend(v9, "type");
  v157 = (char *)objc_msgSend(v9, "range");
  v151 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "firstObject"));
  v159 = objc_msgSend(v12, "textIsVertical");

  if (!a5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244720);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0C508();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244740);
    v129 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v129, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d illegal nil parameter", v130, v131, v132, v133, v134, v135, v136, (uint64_t)"+[CRLWPColumn calculateSelectionPinRectsForSelection:inColumns:outSelectionPinRect:outSelectionTailPinRect:]");
    v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPColumn calculateSelectionPinRectsForSelection:inColumns:outSelectionPinRect:outSelectionTailPinRect:]"));
    v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v137, v138, 431, 1, "illegal nil parameter");
LABEL_168:

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v147, v148);
    abort();
  }
  if (!a6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244760);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0C588();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244780);
    v139 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v139, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d illegal nil parameter", v140, v141, v142, v143, v144, v145, v146, (uint64_t)"+[CRLWPColumn calculateSelectionPinRectsForSelection:inColumns:outSelectionPinRect:outSelectionTailPinRect:]");
    v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPColumn calculateSelectionPinRectsForSelection:inColumns:outSelectionPinRect:outSelectionTailPinRect:]"));
    v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v137, v138, 432, 1, "illegal nil parameter");
    goto LABEL_168;
  }
  if (v10 == 7)
  {
    v13 = (char *)objc_msgSend(v9, "headCharIndex");
    v14 = (char *)objc_msgSend(v9, "tailCharIndex");
    if (v14 >= v13)
      v15 = v13;
    else
      v15 = v14;
    v16 = (char *)objc_msgSend(v156, "headCharIndex");
    v17 = (char *)objc_msgSend(v156, "tailCharIndex");
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    if (v15 == (char *)0x7FFFFFFFFFFFFFFFLL)
      v19 = v157;
    else
      v19 = v15;
    if (v18 == (char *)0x7FFFFFFFFFFFFFFFLL)
      v20 = &v157[v151];
    else
      v20 = v18 + 1;
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    if (v19 < v20)
      v20 = v19;
    v157 = v20;
    v151 = v21 - v20;
  }
  size = CGRectNull.size;
  a5->origin = CGRectNull.origin;
  a5->size = size;
  v23 = CGRectNull.size;
  a6->origin = CGRectNull.origin;
  a6->size = v23;
  v185 = 0u;
  v186 = 0u;
  v187 = 0u;
  v188 = 0u;
  obj = v149;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v185, v191, 16);
  if (v24)
  {
    v152 = *(_QWORD *)v186;
    v160 = (unint64_t)&v157[v151];
    do
    {
      v25 = 0;
      v153 = v24;
      do
      {
        if (*(_QWORD *)v186 != v152)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * v25);
        objc_msgSend(v26, "frameBounds");
        v171 = v28;
        v172 = v27;
        v169 = v30;
        v170 = v29;
        v31 = objc_msgSend(v156, "headCharIndex");
        v32 = v157;
        if (v31 != (id)0x7FFFFFFFFFFFFFFFLL)
          v32 = (char *)objc_msgSend(v156, "headCharIndex", v157);
        v33 = (char *)objc_msgSend(v26, "lineFragmentForCharIndex:knobTag:selectionType:", v32, 11, v10);
        v34 = objc_msgSend(v156, "tailCharIndex");
        v35 = &v157[v151];
        if (v34 != (id)0x7FFFFFFFFFFFFFFFLL)
          v35 = (char *)objc_msgSend(v156, "tailCharIndex", v160);
        v36 = (char *)objc_msgSend(v26, "lineFragmentForCharIndex:knobTag:selectionType:", v35, 10, v10);
        v37 = (uint64_t)v36;
        p_y = &CGRectNull.origin.y;
        p_size = &CGRectNull.size;
        p_height = &CGRectNull.size.height;
        if (v33)
        {
          v41 = (const CGRect *)(v33 + 40);
          v42 = (CGFloat *)(v33 + 48);
          v43 = (CGSize *)(v33 + 56);
          v44 = (CGFloat *)(v33 + 64);
          if (!v36)
            goto LABEL_35;
        }
        else
        {
          v44 = &CGRectNull.size.height;
          v43 = &CGRectNull.size;
          v42 = &CGRectNull.origin.y;
          v41 = &CGRectNull;
          if (!v36)
          {
LABEL_35:
            v45 = &CGRectNull;
            goto LABEL_36;
          }
        }
        v45 = (const CGRect *)(v36 + 40);
        p_y = (CGFloat *)(v36 + 48);
        p_size = (CGSize *)(v36 + 56);
        p_height = (CGFloat *)(v36 + 64);
LABEL_36:
        v167 = *v42;
        x = v41->origin.x;
        v165 = *v44;
        width = v43->width;
        v163 = p_size->width;
        v164 = *p_height;
        v161 = *p_y;
        v162 = v45->origin.x;
        if (v10 == 7 && objc_msgSend(v156, "validVisualRanges"))
        {
          v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "visualRangesArray"));
        }
        else
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", v157, v151));
          v190 = v46;
          v155 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v190, 1));

        }
        v183 = 0u;
        v184 = 0u;
        v181 = 0u;
        v182 = 0u;
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "rectsForSelectionRanges:selectionType:", v155, v10));
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v181, v189, 16);
        v154 = v25;
        if (v48)
        {
          v49 = *(_QWORD *)v182;
          do
          {
            for (i = 0; i != v48; i = (char *)i + 1)
            {
              if (*(_QWORD *)v182 != v49)
                objc_enumerationMutation(v47);
              objc_msgSend(*(id *)(*((_QWORD *)&v181 + 1) + 8 * (_QWORD)i), "CGRectValue");
              v230.origin.y = v171;
              v230.origin.x = v172;
              v230.size.height = v169;
              v230.size.width = v170;
              v193 = CGRectIntersection(v192, v230);
              v51 = v193.origin.x;
              y = v193.origin.y;
              v53 = v193.size.width;
              height = v193.size.height;
              if (v26)
                objc_msgSend(v26, "transformToWP");
              else
                memset(&v180, 0, sizeof(v180));
              v194.origin.x = v51;
              v194.origin.y = y;
              v194.size.width = v53;
              v194.size.height = height;
              v195 = CGRectApplyAffineTransform(v194, &v180);
              v55 = v195.origin.x;
              v56 = v195.origin.y;
              v57 = v195.size.width;
              rect2 = v195.size.height;
              if (v10 == 7)
              {
                if (v33)
                {
                  v196.origin.y = v167;
                  v196.origin.x = x;
                  v196.size.height = v165;
                  v196.size.width = width;
                  v231.origin.x = v55;
                  v231.origin.y = v56;
                  v231.size.width = v57;
                  v231.size.height = rect2;
                  if (CGRectIntersectsRect(v196, v231))
                  {
                    v197.origin.y = v167;
                    v197.origin.x = x;
                    v197.size.height = v165;
                    v197.size.width = width;
                    MinY = CGRectGetMinY(v197);
                    v198.origin.x = v55;
                    v198.origin.y = v56;
                    v198.size.width = v57;
                    v198.size.height = rect2;
                    v59 = CGRectGetMinY(v198);
                    v60 = MinY < v59 || MinY == v59;
                    if (v60 || vabdd_f64(MinY, v59) < 0.01)
                    {
                      v199.origin.x = v55;
                      v199.origin.y = v56;
                      v199.size.width = v57;
                      v199.size.height = rect2;
                      MaxY = CGRectGetMaxY(v199);
                      v200.origin.y = v167;
                      v200.origin.x = x;
                      v200.size.height = v165;
                      v200.size.width = width;
                      v62 = CGRectGetMaxY(v200);
                      if (MaxY <= v62 || vabdd_f64(MaxY, v62) < 0.01)
                      {
                        v63 = a5->origin.x;
                        v64 = a5->origin.y;
                        v65 = a5->size.width;
                        v66 = a5->size.height;
                        if ((v33[25] & 0x10) != 0)
                        {
                          if (CGRectIsEmpty(*(CGRect *)&v63)
                            || (MaxX = CGRectGetMaxX(*a5),
                                v207.origin.x = v51,
                                v207.origin.y = y,
                                v207.size.width = v53,
                                v207.size.height = height,
                                MaxX < CGRectGetMaxX(v207)))
                          {
                            v85 = v51;
                            v86 = y;
                            v87 = v53;
                            v88 = height;
                            if (v159)
                            {
                              MinX = CGRectGetMinX(*(CGRect *)&v85);
                              v208.origin.x = v51;
                              v208.origin.y = y;
                              v208.size.width = v53;
                              v208.size.height = height;
                              v158 = CGRectGetMaxY(v208);
                              v209.origin.x = v51;
                              v209.origin.y = y;
                              v209.size.width = v53;
                              v209.size.height = height;
                              v70 = CGRectGetWidth(v209);
                              v71 = 1.0;
                            }
                            else
                            {
                              MinX = CGRectGetMaxX(*(CGRect *)&v85);
                              v210.origin.x = v51;
                              v210.origin.y = y;
                              v210.size.width = v53;
                              v210.size.height = height;
                              v158 = CGRectGetMinY(v210);
                              v211.origin.x = v51;
                              v211.origin.y = y;
                              v211.size.width = v53;
                              v211.size.height = height;
                              v71 = CGRectGetHeight(v211);
                              v70 = 1.0;
                            }
                            v69 = v158;
LABEL_89:
                            a5->origin.x = MinX;
                            a5->origin.y = v69;
                            a5->size.width = v70;
                            a5->size.height = v71;
                          }
                        }
                        else
                        {
                          IsEmpty = CGRectIsEmpty(*(CGRect *)&v63);
                          MinX = v51;
                          v69 = y;
                          v70 = v53;
                          v71 = height;
                          if (IsEmpty)
                            goto LABEL_89;
                          v72 = CGRectGetMinX(*a5);
                          v201.origin.x = v51;
                          v201.origin.y = y;
                          v201.size.width = v53;
                          v201.size.height = height;
                          v73 = v72 <= CGRectGetMinX(v201);
                          MinX = v51;
                          v69 = y;
                          v70 = v53;
                          v71 = height;
                          if (!v73)
                            goto LABEL_89;
                        }
                      }
                    }
                  }
                }
                if (v37)
                {
                  v212.origin.y = v161;
                  v212.origin.x = v162;
                  v212.size.width = v163;
                  v212.size.height = v164;
                  v233.origin.x = v55;
                  v233.origin.y = v56;
                  v233.size.width = v57;
                  v233.size.height = rect2;
                  if (CGRectIntersectsRect(v212, v233))
                  {
                    v213.origin.y = v161;
                    v213.origin.x = v162;
                    v213.size.width = v163;
                    v213.size.height = v164;
                    v89 = CGRectGetMinY(v213);
                    v214.origin.x = v55;
                    v214.origin.y = v56;
                    v214.size.width = v57;
                    v214.size.height = rect2;
                    v90 = CGRectGetMinY(v214);
                    v91 = v89 < v90 || v89 == v90;
                    if (v91 || vabdd_f64(v89, v90) < 0.01)
                    {
                      v215.origin.x = v55;
                      v215.origin.y = v56;
                      v215.size.width = v57;
                      v215.size.height = rect2;
                      v92 = CGRectGetMaxY(v215);
                      v216.origin.y = v161;
                      v216.origin.x = v162;
                      v216.size.width = v163;
                      v216.size.height = v164;
                      v93 = CGRectGetMaxY(v216);
                      if (v92 <= v93 || vabdd_f64(v92, v93) < 0.01)
                      {
                        v94 = a6->origin.x;
                        v95 = a6->origin.y;
                        v96 = a6->size.width;
                        v97 = a6->size.height;
                        if ((*(_BYTE *)(v37 + 25) & 0x10) != 0)
                        {
                          if (CGRectIsEmpty(*(CGRect *)&v94)
                            || (v106 = CGRectGetMinX(*a6),
                                v220.origin.x = v51,
                                v220.origin.y = y,
                                v220.size.width = v53,
                                v220.size.height = height,
                                v106 > CGRectGetMinX(v220)))
                          {
                            a6->origin.x = v51;
                            a6->origin.y = y;
                            a6->size.width = v53;
                            a6->size.height = height;
                            if (!v159)
                            {
                              v111 = v51 + -1.0;
LABEL_132:
                              a6->origin.x = v111;
                              continue;
                            }
                            v107 = y + -1.0;
LABEL_135:
                            a6->origin.y = v107;
                            continue;
                          }
                        }
                        else if (CGRectIsEmpty(*(CGRect *)&v94)
                               || (v98 = CGRectGetMaxX(*a6),
                                   v217.origin.x = v51,
                                   v217.origin.y = y,
                                   v217.size.width = v53,
                                   v217.size.height = height,
                                   v98 < CGRectGetMaxX(v217)))
                        {
                          v99 = v51;
                          v100 = y;
                          v101 = v53;
                          v102 = height;
                          if (v159)
                          {
                            v103 = CGRectGetMinX(*(CGRect *)&v99);
                            v218.origin.x = v51;
                            v218.origin.y = y;
                            v218.size.width = v53;
                            v218.size.height = height;
                            v104 = CGRectGetMaxY(v218);
                            v219.origin.x = v51;
                            v219.origin.y = y;
                            v219.size.width = v53;
                            v219.size.height = height;
                            v105 = CGRectGetWidth(v219);
                            a6->origin.x = v103;
                            a6->origin.y = v104 + -1.0;
                            a6->size.width = v105;
                            a6->size.height = 1.0;
                          }
                          else
                          {
                            v108 = CGRectGetMaxX(*(CGRect *)&v99);
                            v221.origin.x = v51;
                            v221.origin.y = y;
                            v221.size.width = v53;
                            v221.size.height = height;
                            v109 = CGRectGetMinY(v221);
                            v222.origin.x = v51;
                            v222.origin.y = y;
                            v222.size.width = v53;
                            v222.size.height = height;
                            v110 = CGRectGetHeight(v222);
                            a6->origin.x = v108 + -1.0;
                            a6->origin.y = v109;
                            a6->size.width = 1.0;
                            a6->size.height = v110;
                          }
                        }
                      }
                    }
                  }
                }
                continue;
              }
              if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 0)
                continue;
              if (v33)
              {
                v202.origin.y = v167;
                v202.origin.x = x;
                v202.size.height = v165;
                v202.size.width = width;
                v232.origin.x = v55;
                v232.origin.y = v56;
                v232.size.width = v57;
                v232.size.height = rect2;
                if (CGRectIntersectsRect(v202, v232))
                {
                  v203.origin.y = v167;
                  v203.origin.x = x;
                  v203.size.height = v165;
                  v203.size.width = width;
                  v74 = CGRectGetMinY(v203);
                  v204.origin.x = v55;
                  v204.origin.y = v56;
                  v204.size.width = v57;
                  v204.size.height = rect2;
                  v75 = CGRectGetMinY(v204);
                  v76 = v74 < v75 || v74 == v75;
                  if (v76 || vabdd_f64(v74, v75) < 0.01)
                  {
                    v205.origin.x = v55;
                    v205.origin.y = v56;
                    v205.size.width = v57;
                    v205.size.height = rect2;
                    v77 = CGRectGetMaxY(v205);
                    v206.origin.y = v167;
                    v206.origin.x = x;
                    v206.size.height = v165;
                    v206.size.width = width;
                    v78 = CGRectGetMaxY(v206);
                    if (v77 <= v78 || vabdd_f64(v77, v78) < 0.01)
                    {
                      a5->origin.x = v51;
                      a5->origin.y = y;
                      a5->size.width = v53;
                      a5->size.height = height;
                      v79 = sub_100145044((uint64_t)v33, (unint64_t)v157, 1);
                      v80 = v79;
                      if (v159)
                      {
                        if (v26)
                        {
                          objc_msgSend(v26, "transformFromWP");
                          v81 = *((double *)&v177 + 1);
                          v82 = *((double *)&v178 + 1);
                          v83 = *((double *)&v179 + 1);
                        }
                        else
                        {
                          v178 = 0u;
                          v179 = 0u;
                          v83 = 0.0;
                          v82 = 0.0;
                          v81 = 0.0;
                          v177 = 0u;
                        }
                        a5->origin.y = v83 + v82 * 0.0 + v81 * v80;
                      }
                      else
                      {
                        a5->origin.x = v79;
                      }
                    }
                  }
                }
              }
              v112 = (char *)objc_msgSend(v26, "range");
              if (v160 < (unint64_t)v112 || v160 - (unint64_t)v112 >= v113)
              {
                if (!v37 || (char *)v160 != &v112[v113])
                  continue;
              }
              else if (!v37)
              {
                continue;
              }
              v223.origin.y = v161;
              v223.origin.x = v162;
              v223.size.width = v163;
              v223.size.height = v164;
              v234.origin.x = v55;
              v234.origin.y = v56;
              v234.size.width = v57;
              v234.size.height = rect2;
              if (CGRectIntersectsRect(v223, v234))
              {
                v224.origin.y = v161;
                v224.origin.x = v162;
                v224.size.width = v163;
                v224.size.height = v164;
                v114 = CGRectGetMinY(v224);
                v225.origin.x = v55;
                v225.origin.y = v56;
                v225.size.width = v57;
                v225.size.height = rect2;
                v115 = CGRectGetMinY(v225);
                if (v114 <= v115 || vabdd_f64(v114, v115) < 0.01)
                {
                  v226.origin.x = v55;
                  v226.origin.y = v56;
                  v226.size.width = v57;
                  v226.size.height = rect2;
                  v116 = CGRectGetMaxY(v226);
                  v227.origin.y = v161;
                  v227.origin.x = v162;
                  v227.size.width = v163;
                  v227.size.height = v164;
                  v117 = CGRectGetMaxY(v227);
                  if (v116 <= v117 || vabdd_f64(v116, v117) < 0.01)
                  {
                    v118 = sub_100145044(v37, v160, 0);
                    v119 = v118;
                    a6->origin.x = v51;
                    a6->origin.y = y;
                    a6->size.width = v53;
                    a6->size.height = height;
                    if (!v159)
                    {
                      v111 = v118 + -1.0;
                      goto LABEL_132;
                    }
                    if (v26)
                    {
                      objc_msgSend(v26, "transformFromWP");
                      v120 = *((double *)&v174 + 1);
                      v121 = *((double *)&v175 + 1);
                      v122 = *((double *)&v176 + 1);
                    }
                    else
                    {
                      v175 = 0u;
                      v176 = 0u;
                      v122 = 0.0;
                      v121 = 0.0;
                      v120 = 0.0;
                      v174 = 0u;
                    }
                    v107 = v122 + v121 * 0.0 + v120 * v119 + -1.0;
                    goto LABEL_135;
                  }
                }
              }
            }
            v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v181, v189, 16);
          }
          while (v48);
        }

        v25 = v154 + 1;
      }
      while ((id)(v154 + 1) != v153);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v185, v191, 16);
    }
    while (v24);
  }

  v123 = a5->origin.x;
  v124 = a5->origin.y;
  v125 = a5->size.width;
  v126 = a5->size.height;
  if (v159)
  {
    if (!CGRectIsNull(*(CGRect *)&v123))
      a5->size.height = 1.0;
    v228.origin.x = a6->origin.x;
    v228.origin.y = a6->origin.y;
    v228.size.width = a6->size.width;
    v128 = a6->size.height;
    v127 = (CGSize *)&a6->size.height;
    v228.size.height = v128;
    if (!CGRectIsNull(v228))
LABEL_144:
      v127->width = 1.0;
  }
  else
  {
    if (!CGRectIsNull(*(CGRect *)&v123))
      a5->size.width = 1.0;
    v229 = *a6;
    v127 = &a6->size;
    if (!CGRectIsNull(v229))
      goto LABEL_144;
  }

}

+ (id)selectionRectsforColumns:(id)a3 forSelection:(id)a4
{
  NSMutableArray *v5;
  id v6;
  id v7;
  void *i;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *j;
  double x;
  double y;
  double width;
  double height;
  void *v30;
  id v32;
  id obj;
  uint64_t v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  void *v46;
  _BYTE v47[128];
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v32 = a3;
  v36 = a4;
  v5 = objc_opt_new(NSMutableArray);
  v6 = objc_msgSend(v36, "type");
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v32;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v7)
  {
    v34 = *(_QWORD *)v42;
    do
    {
      v35 = v7;
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v34)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "boundsIncludingDropCapRectsForSelectionType:", v6);
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        if (v6 == (id)7 && objc_msgSend(v36, "validVisualRanges"))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "visualRangesArray"));
        }
        else
        {
          v19 = objc_msgSend(v36, "range");
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", v19, v20));
          v46 = v21;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));

        }
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rectsForSelectionRanges:selectionType:", v18, v6));
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v38;
          do
          {
            for (j = 0; j != v23; j = (char *)j + 1)
            {
              if (*(_QWORD *)v38 != v24)
                objc_enumerationMutation(v22);
              objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j), "CGRectValue");
              v50.origin.x = v11;
              v50.origin.y = v13;
              v50.size.width = v15;
              v50.size.height = v17;
              v49 = CGRectIntersection(v48, v50);
              x = v49.origin.x;
              y = v49.origin.y;
              width = v49.size.width;
              height = v49.size.height;
              if (!CGRectIsNull(v49))
              {
                v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height));
                -[NSMutableArray addObject:](v5, "addObject:", v30);

              }
            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          }
          while (v23);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v7);
  }

  return v5;
}

+ (void)populateHeadAndTailCharIndicesInSelection:(id)a3 forColumns:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  __int128 *v12;
  CGFloat *p_y;
  CGSize *p_size;
  CGFloat *p_height;
  const CGRect *v16;
  CGFloat *v17;
  CGSize *v18;
  CGFloat *v19;
  CGFloat v20;
  const CGRect *v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  CGFloat v32;
  CGFloat y;
  CGFloat v34;
  CGFloat height;
  id v36;
  double MinY;
  double MaxY;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double MinX;
  id v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id obj;
  uint64_t v56;
  id v57;
  id v58;
  char *v59;
  void *v60;
  CGFloat rect;
  CGFloat v62;
  CGFloat x;
  CGFloat width;
  CGFloat v65;
  char v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  void *v76;
  _BYTE v77[128];
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

  v5 = a3;
  v53 = a4;
  v57 = objc_msgSend(v5, "type");
  if (objc_msgSend(v5, "type") == (id)7
    && (objc_msgSend(v5, "headCharIndex") == (id)0x7FFFFFFFFFFFFFFFLL
     || objc_msgSend(v5, "tailCharIndex") == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v59 = (char *)objc_msgSend(v5, "range");
    v54 = v6;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    obj = v53;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    if (v7)
    {
      v56 = *(_QWORD *)v72;
      do
      {
        v8 = 0;
        v58 = v7;
        do
        {
          if (*(_QWORD *)v72 != v56)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)v8);
          v10 = (char *)objc_msgSend((id)v9, "lineFragmentForCharIndex:knobTag:selectionType:", v59, 11, 7);
          v11 = (char *)objc_msgSend((id)v9, "lineFragmentForCharIndex:knobTag:selectionType:", &v59[v54 - 1], 10, v57);
          v12 = (__int128 *)v11;
          p_y = &CGRectNull.origin.y;
          p_size = &CGRectNull.size;
          p_height = &CGRectNull.size.height;
          v16 = (const CGRect *)(v10 + 40);
          v17 = (CGFloat *)(v10 + 48);
          v18 = (CGSize *)(v10 + 56);
          v19 = (CGFloat *)(v10 + 64);
          if (!v10)
          {
            v19 = &CGRectNull.size.height;
            v18 = &CGRectNull.size;
            v17 = &CGRectNull.origin.y;
            v16 = &CGRectNull;
          }
          width = v18->width;
          v65 = *v19;
          v62 = *v17;
          x = v16->origin.x;
          if (v11)
            p_height = (CGFloat *)(v11 + 64);
          rect = *p_height;
          if (v11)
            p_size = (CGSize *)(v11 + 56);
          v20 = p_size->width;
          v21 = (const CGRect *)(v11 + 40);
          if (!v11)
            v21 = &CGRectNull;
          v22 = v21->origin.x;
          if (v11)
            p_y = (CGFloat *)(v11 + 48);
          v23 = *p_y;
          if (objc_msgSend(v5, "validVisualRanges"))
          {
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visualRangesArray"));
          }
          else
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", v59, v54));
            v76 = v24;
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v76, 1));

          }
          v25 = objc_msgSend(v5, "superRange");
          BYTE2(v52) = 0;
          LOWORD(v52) = 0;
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v9, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:", v25, v26, 7, 1, 1, 0, v52, v60, 0));
          v69 = 0u;
          v70 = 0u;
          v67 = 0u;
          v68 = 0u;
          v28 = v27;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
          if (v29)
          {
            v30 = *(_QWORD *)v68;
            do
            {
              for (i = 0; i != v29; i = (char *)i + 1)
              {
                if (*(_QWORD *)v68 != v30)
                  objc_enumerationMutation(v28);
                objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i), "CGRectValue");
                v79 = CGRectIntersection(v78, *(CGRect *)(v9 + 16));
                v32 = v79.origin.x;
                y = v79.origin.y;
                v34 = v79.size.width;
                height = v79.size.height;
                v36 = objc_msgSend(v5, "headCharIndex");
                if (v10)
                {
                  if (v36 == (id)0x7FFFFFFFFFFFFFFFLL)
                  {
                    v80.origin.x = v32;
                    v80.origin.y = y;
                    v80.size.width = v34;
                    v80.size.height = height;
                    MinY = CGRectGetMinY(v80);
                    v81.origin.y = v62;
                    v81.origin.x = x;
                    v81.size.width = width;
                    v81.size.height = v65;
                    if (MinY >= CGRectGetMinY(v81))
                    {
                      v82.origin.x = v32;
                      v82.origin.y = y;
                      v82.size.width = v34;
                      v82.size.height = height;
                      MaxY = CGRectGetMaxY(v82);
                      v83.origin.y = v62;
                      v83.origin.x = x;
                      v83.size.width = width;
                      v83.size.height = v65;
                      if (MaxY <= CGRectGetMaxY(v83))
                      {
                        v66 = 0;
                        v39 = v32;
                        v40 = y;
                        v41 = v34;
                        v42 = height;
                        if ((v10[25] & 0x10) != 0)
                          MinX = CGRectGetMaxX(*(CGRect *)&v39) + -1.0;
                        else
                          MinX = CGRectGetMinX(*(CGRect *)&v39);
                        objc_msgSend(v5, "setHeadCharIndex:", sub_1001464C4((__int128 *)v10, 0, 0, &v66, 0, MinX));
                      }
                    }
                  }
                }
                v44 = objc_msgSend(v5, "tailCharIndex");
                if (v12)
                {
                  if (v44 == (id)0x7FFFFFFFFFFFFFFFLL)
                  {
                    v84.origin.x = v32;
                    v84.origin.y = y;
                    v84.size.width = v34;
                    v84.size.height = height;
                    v45 = CGRectGetMinY(v84);
                    v85.origin.x = v22;
                    v85.origin.y = v23;
                    v85.size.width = v20;
                    v85.size.height = rect;
                    if (v45 >= CGRectGetMinY(v85))
                    {
                      v86.origin.x = v32;
                      v86.origin.y = y;
                      v86.size.width = v34;
                      v86.size.height = height;
                      v46 = CGRectGetMaxY(v86);
                      v87.origin.x = v22;
                      v87.origin.y = v23;
                      v87.size.width = v20;
                      v87.size.height = rect;
                      if (v46 <= CGRectGetMaxY(v87))
                      {
                        v66 = 0;
                        v47 = v32;
                        v48 = y;
                        v49 = v34;
                        v50 = height;
                        if ((*((_BYTE *)v12 + 25) & 0x10) != 0)
                          v51 = CGRectGetMinX(*(CGRect *)&v47);
                        else
                          v51 = CGRectGetMaxX(*(CGRect *)&v47) + -1.0;
                        objc_msgSend(v5, "setTailCharIndex:", sub_1001464C4(v12, 0, 0, &v66, 0, v51));
                      }
                    }
                  }
                }
              }
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
            }
            while (v29);
          }

          v8 = (char *)v8 + 1;
        }
        while (v8 != v58);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
      }
      while (v7);
    }

  }
}

+ (id)commentKnobBaseOriginForHighlightAtTextRange:(_NSRange)a3 withColumns:(id)a4 positionForRTL:(BOOL)a5
{
  _BOOL4 v5;
  NSUInteger location;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  double *v12;
  void *v13;
  unsigned int v14;
  double v15;
  double v16;
  unsigned int v17;
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
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  NSRange v38;
  NSRange v39;

  v5 = a5;
  location = a3.location;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v38.location = (NSUInteger)objc_msgSend(v11, "range");
        v39.location = location;
        v39.length = 1;
        if (NSIntersectionRange(v38, v39).length)
        {
          v12 = (double *)objc_msgSend(v11, "lineFragmentForCharIndex:knobTag:selectionType:", location, 11, 0);
          if (v12)
          {
            if (v5)
              v14 = objc_msgSend(v11, "textIsVertical") ^ 1;
            else
              v14 = 0;
            v15 = v12[15];
            v16 = v12[17];
            v17 = objc_msgSend(v11, "textIsVertical");
            v18 = v12[4];
            objc_msgSend(v11, "frameBounds");
            if (v17)
              v21 = v18;
            else
              v21 = v16 + v18 + (v15 + v16) * -0.5;
            if (v14)
              v22 = v19 + v20;
            else
              v22 = v19;
            if (v11)
            {
              objc_msgSend(v11, "transformFromWP");
              v24 = *((double *)&v30 + 1);
              v23 = *(double *)&v30;
              v25 = *((double *)&v31 + 1);
              v26 = *(double *)&v31;
              v27 = *((double *)&v32 + 1);
              v28 = *(double *)&v32;
            }
            else
            {
              v31 = 0u;
              v32 = 0u;
              v30 = 0u;
              v27 = 0.0;
              v25 = 0.0;
              v24 = 0.0;
              v28 = 0.0;
              v26 = 0.0;
              v23 = 0.0;
            }
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v28 + v21 * v26 + v23 * v22, v27 + v21 * v25 + v24 * v22, v30, v31, v32, (_QWORD)v33));
            goto LABEL_24;
          }
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_24:

  return v13;
}

+ (CGPoint)connectionLinePointForChangeRange:(_NSRange)a3 withColumns:(id)a4 layoutTarget:(id)a5
{
  NSUInteger location;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char *v13;
  id v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  char *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  unsigned int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const char *v44;
  _BYTE v45[128];
  NSRange v46;
  NSRange v47;
  CGPoint result;

  location = a3.location;
  v7 = a4;
  v29 = v7;
  if (a5)
  {
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v32;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v11);
          v46.location = (NSUInteger)objc_msgSend(v12, "range");
          v47.location = location;
          v47.length = 1;
          if (NSIntersectionRange(v46, v47).length)
          {
            v30 = 0;
            v13 = (char *)objc_msgSend(v12, "pRemapCharIndex:outIsAfterBreak:outWithTextSource:", location, 0, &v30);
            v14 = v30;
            v15 = (char *)objc_msgSend(v12, "range");
            if (v13 == &v15[v16])
              v17 = 0;
            else
              v17 = 11;
            if (!objc_msgSend(v12, "lineFragmentForCharIndex:knobTag:selectionType:", location, v17, 0))
            {
              v18 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_1012447E0);
              v19 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67110146;
                v36 = v18;
                v37 = 2082;
                v38 = "+[CRLWPColumn connectionLinePointForChangeRange:withColumns:layoutTarget:]";
                v39 = 2082;
                v40 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm";
                v41 = 1024;
                v42 = 684;
                v43 = 2082;
                v44 = "lineFragment";
                _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
              }
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101244800);
              v20 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
              {
                v23 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                *(_DWORD *)buf = 67109378;
                v36 = v18;
                v37 = 2114;
                v38 = v23;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              }
              v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPColumn connectionLinePointForChangeRange:withColumns:layoutTarget:]"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 684, 0, "invalid nil value for '%{public}s'", "lineFragment", v29);

            }
          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
      }
      while (v9);
    }

  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012447A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0C608();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012447C0);
    v24 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPColumn connectionLinePointForChangeRange:withColumns:layoutTarget:]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 667, 0, "invalid nil value for '%{public}s'", "layoutTarget", v29);

  }
  v27 = INFINITY;
  v28 = INFINITY;
  result.y = v28;
  result.x = v27;
  return result;
}

+ (id)closestColumnInColumnsArray:(id)a3 forPoint:(CGPoint)a4 ignoreEmptyColumns:(BOOL)a5 ignoreDrawableOnlyColumns:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  double y;
  double x;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  double v14;
  void *i;
  void *v16;
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
  id v29;
  id v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  CGPoint v37;
  CGRect v38;

  v6 = a6;
  v7 = a5;
  y = a4.y;
  x = a4.x;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = a3;
  v11 = 0;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v33;
    v14 = INFINITY;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v16, "frameBounds", (_QWORD)v32);
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        if ((!v7 || objc_msgSend(v16, "lineCount"))
          && (!v6
           || objc_msgSend(v16, "lineCount") != (id)1
           || (*((_BYTE *)objc_msgSend(v16, "lineFragmentAtIndex:", 0) + 24) & 0x40) == 0))
        {
          v38.origin.x = v18;
          v38.origin.y = v20;
          v38.size.width = v22;
          v38.size.height = v24;
          v37.x = x;
          v37.y = y;
          if (CGRectContainsPoint(v38, v37))
          {
            v30 = v16;

            v11 = v30;
            goto LABEL_18;
          }
          v25 = sub_1000613A8(x, y, v18, v20, v22, v24);
          v27 = sub_10006010C(x, y, v25, v26);
          if (v27 < v14)
          {
            v28 = v27;
            v29 = v16;

            v11 = v29;
            v14 = v28;
          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_18:

  return v11;
}

+ (_NSRange)charRangeForPencilAnnotationStartPoint:(CGPoint)a3 toEndPoint:(CGPoint)a4 inLayoutTarget:(id)a5 onSingleLineFragment:(BOOL)a6
{
  _BOOL4 v6;
  double v7;
  double v8;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  id v16;
  void *v17;
  _BYTE *v18;
  double v19;
  _BYTE *v20;
  _BYTE *v21;
  _BYTE *v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  double y;
  double x;
  __int128 *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _NSRange result;

  v6 = a6;
  y = a4.y;
  x = a4.x;
  v7 = a3.y;
  v8 = a3.x;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "columns"));
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "transformToWP");
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v29 = 0u;
  }

  v13 = v29;
  v14 = v30;
  v15 = v31;
  v16 = objc_msgSend(a1, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", v10, 1, 0, sub_100061A8C(v8, v7, x, y, 0.5));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v28 = 0;
  v18 = objc_msgSend(v17, "p_charIndexWithTextClosestToWPPoint:pastCenterGoesToNextChar:outFragment:leadingEdge:", 1, &v28, 0, *(double *)&v15 + v7 * *(double *)&v14 + *(double *)&v13 * v8, *((double *)&v15 + 1) + v7 * *((double *)&v14 + 1) + *((double *)&v13 + 1) * v8);
  v19 = *(double *)&v15 + y * *(double *)&v14 + *(double *)&v13 * x;
  if (v6 && v17 && v28)
    v20 = (_BYTE *)sub_1001464C4(v28, 1, 0, 0, 1, v19);
  else
    v20 = objc_msgSend(v17, "p_charIndexWithTextClosestToWPPoint:pastCenterGoesToNextChar:outFragment:leadingEdge:", 1, 0, 0, v19, *((double *)&v15 + 1) + y * *((double *)&v14 + 1) + *((double *)&v13 + 1) * x);
  if (v18 <= v20)
    v21 = v20;
  else
    v21 = v18;
  if (v18 >= v20)
    v22 = v20;
  else
    v22 = v18;
  v23 = v21 - v22;

  v24 = (NSUInteger)v22;
  v25 = v23;
  result.length = v25;
  result.location = v24;
  return result;
}

+ (unint64_t)charIndexForPoint:(CGPoint)a3 inColumnsArray:(id)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 ignoreEmptyColumns:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 leadingEdge:(BOOL *)a9
{
  return (unint64_t)objc_msgSend(a1, "charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:ignoreEmptyColumns:isAtEndOfLine:leadingEdge:", a4, a5, a6, 1, 0, a7, a3.x, a3.y, a8, a9);
}

+ (unint64_t)charIndexForPoint:(CGPoint)a3 inColumnsArray:(id)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 pastCenterGoesToNextChar:(BOOL)a7 ignoreEmptyColumns:(BOOL)a8 isAtEndOfLine:(BOOL *)a9 leadingEdge:(BOOL *)a10
{
  return (unint64_t)objc_msgSend(a1, "charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:ignoreEmptyColumns:isAtEndOfLine:leadingEdge:", a4, a5, a6, a7, 0, a8, a3.x, a3.y, a9, a10);
}

+ (unint64_t)charIndexForPoint:(CGPoint)a3 inColumnsArray:(id)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 pastCenterGoesToNextChar:(BOOL)a7 constrainToAscentAndDescent:(BOOL)a8 ignoreEmptyColumns:(BOOL)a9 isAtEndOfLine:(BOOL *)a10 leadingEdge:(BOOL *)a11
{
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  double y;
  double x;
  void *v17;
  void *v18;
  unint64_t v19;
  CGPoint v21;
  CGRect v22;

  v11 = a8;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  y = a3.y;
  x = a3.x;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", a4, a9, 1));
  v18 = v17;
  if (v13 && (objc_msgSend(v17, "frameBounds"), v21.x = x, v21.y = y, !CGRectContainsPoint(v22, v21)))
    v19 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v19 = (unint64_t)objc_msgSend(v18, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:", v14, v12, v13, v11, a10, a11, x, y);

  return v19;
}

+ (CGPoint)p_pinPoint:(CGPoint)a3 toRect:(CGRect)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = sub_1000613A8(a3.x, a3.y, a4.origin.x, a4.origin.y, a4.size.width + -1.0, a4.size.height + -1.0);
  result.y = v5;
  result.x = v4;
  return result;
}

+ (CGPoint)pinToNaturalBounds:(CGPoint)a3 andLastLineFragment:(BOOL)a4 inLayoutTarget:(id)a5
{
  _BOOL4 v5;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  char *v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double MaxY;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat rect;
  double v49;
  double v50;
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
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  CGPoint result;
  CGPoint v67;
  CGRect v68;
  CGRect v69;

  v5 = a4;
  y = a3.y;
  x = a3.x;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geometry"));
  objc_msgSend(v10, "size");
  v11 = sub_10005FDDC();
  objc_msgSend(a1, "p_pinPoint:toRect:", x, y, v11, v12, v13, v14);
  v16 = v15;
  v18 = v17;

  if (v5)
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "columns"));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v62;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v62 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v23, "frameBounds");
          v67.x = v16;
          v67.y = v18;
          if (CGRectContainsPoint(v68, v67))
          {
            v24 = (char *)objc_msgSend(v23, "lineCount");
            if (v24)
            {
              objc_msgSend(v23, "boundsOfLineFragmentAtIndex:", v24 - 1);
              rect = v25;
              v27 = v26;
              v29 = v28;
              v31 = v30;
              if (v23)
              {
                objc_msgSend(v23, "transformToWP");
                v32 = v56;
                v33 = v58;
                v45 = v57;
                v34 = v60;
                v46 = v59;
                v47 = v55;
              }
              else
              {
                v34 = 0.0;
                v33 = 0.0;
                v32 = 0.0;
                v45 = 0.0;
                v46 = 0.0;
                v47 = 0.0;
              }
              v69.origin.x = v29;
              v69.origin.y = v31;
              v69.size.width = v27;
              v69.size.height = rect;
              MaxY = CGRectGetMaxY(v69);
              if (v34 + v18 * v33 + v32 * v16 > MaxY)
              {
                if (v23)
                {
                  objc_msgSend(v23, "transformFromWP");
                  v36 = v50;
                  v37 = v49;
                  v38 = v52;
                  v39 = v51;
                  v40 = v54;
                  v41 = v53;
                }
                else
                {
                  v40 = 0.0;
                  v38 = 0.0;
                  v36 = 0.0;
                  v41 = 0.0;
                  v39 = 0.0;
                  v37 = 0.0;
                }
                v42 = v46 + v18 * v45 + v47 * v16;
                v16 = v41 + MaxY * v39 + v37 * v42;
                v18 = v40 + MaxY * v38 + v36 * v42;
              }
            }
            goto LABEL_20;
          }
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
        if (v20)
          continue;
        break;
      }
    }
LABEL_20:

  }
  v43 = v16;
  v44 = v18;
  result.y = v44;
  result.x = v43;
  return result;
}

+ (unint64_t)charIndexForPointWithPinning:(CGPoint)a3 inLayoutTarget:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_msgSend(a1, "pinToNaturalBounds:andLastLineFragment:inLayoutTarget:", 1, v7, x, y);
  v8 = objc_msgSend(a1, "charIndexFromPoint:allowPastBreak:constrainToAscentAndDescent:isAtEndOfLine:inLayoutTarget:", 1, 0, 0, v7);

  return (unint64_t)v8;
}

+ (unint64_t)charIndexForPointWithPinning:(CGPoint)a3 isTail:(BOOL)a4 selectionType:(unint64_t)a5 inLayoutTarget:(id)a6
{
  _BOOL8 v7;
  double y;
  double x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  void *v20;

  v7 = a4;
  y = a3.y;
  x = a3.x;
  v11 = a6;
  objc_msgSend(a1, "pinToNaturalBounds:andLastLineFragment:inLayoutTarget:", 1, v11, x, y);
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "columns"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](CRLWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", v16, 0, 1, v13, v15));

  if (v17)
  {
    v18 = objc_msgSend(v17, "charIndexForSelectionFromPoint:isTail:", v7, x, y);
    v19 = (unint64_t)v18;
    if (a5 != 7 && v7 && v18 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storage"));
      v19 = (unint64_t)objc_msgSend(v20, "nextCharacterIndex:", v19);

    }
  }
  else
  {
    v19 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v19;
}

+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 isAtEndOfLine:(BOOL *)a5 inLayoutTarget:(id)a6
{
  return (unint64_t)objc_msgSend(a1, "charIndexFromPoint:allowPastBreak:constrainToAscentAndDescent:isAtEndOfLine:inLayoutTarget:", a4, 0, a5, a6, a3.x, a3.y);
}

+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 constrainToAscentAndDescent:(BOOL)a5 isAtEndOfLine:(BOOL *)a6 inLayoutTarget:(id)a7
{
  return (unint64_t)_objc_msgSend(a1, "charIndexFromPoint:allowPastBreak:allowNotFound:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:inLayoutTarget:", a4, 0, a5, a6, 0, a7, a3.x, a3.y);
}

+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 isAtEndOfLine:(BOOL *)a6 leadingEdge:(BOOL *)a7 inLayoutTarget:(id)a8
{
  return (unint64_t)objc_msgSend(a1, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:inLayoutTarget:", a4, a5, 1, 0, a6, a7, a3.x, a3.y, a8);
}

+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 constrainToAscentAndDescent:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8 inLayoutTarget:(id)a9
{
  return (unint64_t)objc_msgSend(a1, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:inLayoutTarget:", a4, a5, 1, a6, a7, a8, a3.x, a3.y, a9);
}

+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 pastCenterGoesToNextChar:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8 inLayoutTarget:(id)a9
{
  return (unint64_t)objc_msgSend(a1, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:inLayoutTarget:", a4, a5, a6, 0, a7, a8, a3.x, a3.y, a9);
}

+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 pastCenterGoesToNextChar:(BOOL)a6 constrainToAscentAndDescent:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 leadingEdge:(BOOL *)a9 inLayoutTarget:(id)a10
{
  uint64_t v11;

  LOBYTE(v11) = 0;
  return (unint64_t)objc_msgSend(a1, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:ignoreEmptyColumns:inLayoutTarget:", a4, a5, a6, a7, a8, a9, a3.x, a3.y, v11, a10);
}

+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 pastCenterGoesToNextChar:(BOOL)a6 constrainToAscentAndDescent:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 leadingEdge:(BOOL *)a9 ignoreEmptyColumns:(BOOL)a10 inLayoutTarget:(id)a11
{
  _BOOL8 v13;
  _BOOL8 v14;
  _BOOL8 v15;
  double y;
  double x;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  unint64_t v27;
  _BOOL4 v29;
  CGPoint v30;
  CGRect v31;

  v29 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  y = a3.y;
  x = a3.x;
  v18 = a11;
  v19 = v18;
  if (!v14 && (objc_msgSend(v18, "layoutIsValid") & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244820);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0C694();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244840);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPColumn charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:ignoreEmptyColumns:inLayoutTarget:]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 874, 0, "Should not call when layout has not been validated");

  }
  if (objc_msgSend(v19, "layoutIsValid"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "columns"));
    if (objc_msgSend(v23, "count")
      || v14
      || (v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "geometry")),
          objc_msgSend(v24, "frame"),
          v30.x = x,
          v30.y = y,
          v25 = CGRectContainsPoint(v31, v30),
          v24,
          !v25))
    {
      v27 = +[CRLWPColumn charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:ignoreEmptyColumns:isAtEndOfLine:leadingEdge:](CRLWPColumn, "charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:ignoreEmptyColumns:isAtEndOfLine:leadingEdge:", v23, v15, v14, v13, v29, a10, x, y, a8, a9);
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "storage"));
      v27 = (unint64_t)objc_msgSend(v26, "length");

      if (a8)
        *a8 = 0;
      if (a9)
        *a9 = 1;
    }

  }
  else
  {
    v27 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v27;
}

+ (id)smartFieldWithAttributeKind:(unint64_t)a3 inColumnArray:(id)a4 atPoint:(CGPoint)a5
{
  double y;
  double x;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  CGPoint v13;
  CGRect v14;

  y = a5.y;
  x = a5.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](CRLWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", a4, 0, 1));
  v9 = v8;
  if (v8
    && (objc_msgSend(v8, "frameBounds"), v13.x = x, v13.y = y, CGRectContainsPoint(v14, v13))
    && (v10 = objc_msgSend(v9, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:leadingEdge:", 0, 0, 1, 0, 0, x, y), v10 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "smartFieldAtCharIndex:attributeKind:", v10, a3));
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)pathForHighlightWithRange:(_NSRange)a3 columnArray:(id)a4 pathStyle:(int)a5
{
  void *v6;
  id v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  void *v15;
  id v17;
  id obj;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  CGRect v31;
  CGRect v32;

  v17 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v17;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:includePaginatedAttachments:", a3.location, a3.length, 0, 0, a5 == 1, 0));
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v10);
              v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j);
              objc_msgSend(v14, "CGRectValue");
              if (a5 == 2)
              {
                objc_msgSend(v14, "CGRectValue");
                v32 = CGRectInset(v31, -3.0, -3.0);
                v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithLegacyRoundedRect:cornerRadius:](CRLBezierPath, "bezierPathWithLegacyRoundedRect:cornerRadius:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height, 3.0));
                objc_msgSend(v6, "appendBezierPath:", v15);

              }
              else
              {
                objc_msgSend(v6, "appendBezierPathWithRect:");
              }
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v11);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  return v6;
}

+ (CGRect)boundsRectForSelection:(id)a3 columnArray:(id)a4 includeRuby:(BOOL)a5 includePaginatedAttachments:(BOOL)a6
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id obj;
  _BOOL4 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  CGRect v45;
  CGRect v46;
  CGRect result;
  CGRect v48;

  v34 = a6;
  v6 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  if (v8)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v9;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v40;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v40 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v17);
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v19 = objc_msgSend(v8, "range");
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:includePaginatedAttachments:", v19, v20, objc_msgSend(v8, "type"), 0, v6, v34));
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v22)
          {
            v23 = *(_QWORD *)v36;
            do
            {
              v24 = 0;
              do
              {
                if (*(_QWORD *)v36 != v23)
                  objc_enumerationMutation(v21);
                objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v24), "CGRectValue");
                v48.origin.x = v25;
                v48.origin.y = v26;
                v48.size.width = v27;
                v48.size.height = v28;
                v45.origin.x = x;
                v45.origin.y = y;
                v45.size.width = width;
                v45.size.height = height;
                v46 = CGRectUnion(v45, v48);
                x = v46.origin.x;
                y = v46.origin.y;
                width = v46.size.width;
                height = v46.size.height;
                v24 = (char *)v24 + 1;
              }
              while (v22 != v24);
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            }
            while (v22);
          }

          v17 = (char *)v17 + 1;
        }
        while (v17 != v15);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v15);
    }

  }
  v29 = x;
  v30 = y;
  v31 = width;
  v32 = height;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

+ (id)columnForCharIndex:(unint64_t)a3 allowEndOfColumn:(BOOL)a4 withColumns:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  unsigned int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  char *v23;
  id v24;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  unsigned int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  _BYTE v40[128];

  v5 = a4;
  v7 = a5;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "storage"));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v9)
  {
    v10 = v5;
    v11 = *(_QWORD *)v29;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "storage"));
        v15 = v8 == v14;

        if (!v15)
        {
          v16 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101244860);
          v17 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v33 = v16;
            v34 = 2082;
            v35 = "+[CRLWPColumn columnForCharIndex:allowEndOfColumn:withColumns:]";
            v36 = 2082;
            v37 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm";
            v38 = 1024;
            v39 = 1068;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d unexpected column storage", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101244880);
          v18 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
          {
            v23 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v33 = v16;
            v34 = 2114;
            v35 = v23;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPColumn columnForCharIndex:allowEndOfColumn:withColumns:]"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 1068, 0, "unexpected column storage");

        }
        v21 = objc_msgSend(v13, "range");
        if ((unint64_t)v21 + v22 + v10 > a3)
        {
          v24 = v13;
          goto LABEL_21;
        }
        v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (v9)
        continue;
      break;
    }
  }
  v24 = 0;
LABEL_21:

  return v24;
}

+ (_NSRange)rangeOfColumns:(id)a3
{
  id v3;
  unint64_t v4;
  NSUInteger v5;
  void *v6;
  NSUInteger v7;
  void *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  v3 = a3;
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = 0;
  if (objc_msgSend(v3, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
    v4 = (unint64_t)objc_msgSend(v6, "range");
    v5 = v7;

  }
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", (char *)objc_msgSend(v3, "count") - 1));
    v9 = (char *)objc_msgSend(v8, "range");
    if (v4 <= (unint64_t)&v9[v10])
      v11 = &v9[v10];
    else
      v11 = (char *)v4;
    if (v4 >= (unint64_t)&v9[v10])
      v4 = (unint64_t)&v9[v10];
    v5 = (NSUInteger)&v11[-v4];

  }
  v12 = v4;
  v13 = v5;
  result.length = v13;
  result.location = v12;
  return result;
}

- (CRLWPColumn)initWithStorage:(id)a3 frameBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  CRLWPColumn *v11;
  CRLWPColumn *v12;
  int64x2_t v13;
  objc_super v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLWPColumn;
  v11 = -[CRLWPColumn init](&v15, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_storage, a3);
    v12->_frameBounds.origin.x = x;
    v12->_frameBounds.origin.y = y;
    v12->_frameBounds.size.width = width;
    v12->_frameBounds.size.height = height;
    v13 = vdupq_n_s64(0x7FF8000000000000uLL);
    *(int64x2_t *)&v12->_transformFromWP.a = v13;
    *(int64x2_t *)&v12->_transformFromWP.c = v13;
    *(int64x2_t *)&v12->_transformFromWP.tx = v13;
    v12->_anchoredAttachmentRange = (_NSRange)xmmword_100EEE418;
    v12->_scaleTextPercent = 100;
    v12->_nextLinePosition = NAN;
    operator new();
  }

  return 0;
}

- (id)initForTestingWithStorage:(id)a3 frameBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CRLWPColumn *v10;
  __int128 v11;
  _OWORD v13[3];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = -[CRLWPColumn initWithStorage:frameBounds:](self, "initWithStorage:frameBounds:", v9, x, y, width, height);
  v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v13[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v13[1] = v11;
  v13[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[CRLWPColumn setTransformFromWP:](v10, "setTransformFromWP:", v13);

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  sub_100202FE0(&self->_lineFragmentArray.__ptr_);
  v3.receiver = self;
  v3.super_class = (Class)CRLWPColumn;
  -[CRLWPColumn dealloc](&v3, "dealloc");
}

- (double)logicalBoundsTop
{
  return CGRectGetMinY(self->_frameBounds);
}

- (double)logicalBoundsBottom
{
  return CGRectGetMaxY(self->_frameBounds);
}

- (_NSRange)range
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v3 = -[CRLWPColumn startCharIndex](self, "startCharIndex");
  v4 = -[CRLWPColumn characterCount](self, "characterCount");
  v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  NSUInteger length;

  length = a3.length;
  -[CRLWPColumn setStartCharIndex:](self, "setStartCharIndex:", a3.location);
  -[CRLWPColumn setCharacterCount:](self, "setCharacterCount:", length);
}

- (unint64_t)startAnchoredCharIndex
{
  return self->_anchoredAttachmentRange.location;
}

- (unint64_t)anchoredCharCount
{
  return self->_anchoredAttachmentRange.length;
}

- (_NSRange)anchoredRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_anchoredAttachmentRange.length;
  location = self->_anchoredAttachmentRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setAnchoredRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;

  length = a3.length;
  location = a3.location;
  if (a3.length >= 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012448A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0C714();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012448C0);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn setAnchoredRange:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1235, 0, "Illegal anchored range");

  }
  self->_anchoredAttachmentRange.location = location;
  self->_anchoredAttachmentRange.length = length;
}

- (CGSize)maxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_frameBounds.size.width;
  height = self->_frameBounds.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGAffineTransform)transformFromWP
{
  CGAffineTransform *result;
  __int128 v4;

  result = &self->_transformFromWP;
  v4 = *(_OWORD *)&result->c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&result->a;
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&result->tx;
  return result;
}

- (double)minimumHeightForLayoutOnPage
{
  uint64_t v3;
  double MinY;
  double v5;
  double v6;
  double result;
  double v8;
  double contentBottom;
  double v10;

  if (-[CRLWPColumn lineCount](self, "lineCount"))
  {
    v3 = sub_100038998(self->_lineFragmentArray.__ptr_, 0);
    MinY = CGRectGetMinY(*(CGRect *)(v3 + 40));
    -[CRLWPColumn logicalBoundsTop](self, "logicalBoundsTop");
    v6 = v5;
    result = 0.0;
    if (MinY > v6)
      return result;
    if (*(_BYTE *)(v3 + 488))
      v8 = *(double *)(v3 + 160);
    else
      v8 = 0.0;
    contentBottom = *(double *)(v3 + 32) + *(double *)(v3 + 136) + v8;
  }
  else
  {
    contentBottom = self->_contentBottom;
  }
  -[CRLWPColumn logicalBoundsTop](self, "logicalBoundsTop");
  return contentBottom - v10;
}

- (CGRect)erasableBounds:(unint64_t)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  NSMutableArray *paragraphAdornments;
  NSMutableArray *v16;
  id v17;
  uint64_t v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGAffineTransform v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v36;
  CGRect v37;

  x = self->_frameBounds.origin.x;
  y = self->_frameBounds.origin.y;
  width = self->_frameBounds.size.width;
  height = self->_frameBounds.size.height;
  v36.origin.x = sub_100038B50((uint64_t *)self->_lineFragmentArray.__ptr_, a3).n64_f64[0];
  v36.origin.y = v8;
  v36.size.width = v9;
  v36.size.height = v10;
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v31 = CGRectUnion(v30, v36);
  v11 = v31.origin.x;
  v12 = v31.origin.y;
  v13 = v31.size.width;
  v14 = v31.size.height;
  paragraphAdornments = self->_paragraphAdornments;
  if (paragraphAdornments && -[NSMutableArray count](paragraphAdornments, "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = self->_paragraphAdornments;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v26;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v19), "rect");
          v37.origin.x = v20;
          v37.origin.y = v21;
          v37.size.width = v22;
          v37.size.height = v23;
          v32.origin.x = v11;
          v32.origin.y = v12;
          v32.size.width = v13;
          v32.size.height = v14;
          v33 = CGRectUnion(v32, v37);
          v11 = v33.origin.x;
          v12 = v33.origin.y;
          v13 = v33.size.width;
          v14 = v33.size.height;
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v17);
    }

  }
  -[CRLWPColumn transformFromWP](self, "transformFromWP");
  v34.origin.x = v11;
  v34.origin.y = v12;
  v34.size.width = v13;
  v34.size.height = v14;
  return CGRectApplyAffineTransform(v34, &v24);
}

- (double)textBlockBottom
{
  double v3;
  double v4;
  uint64_t v5;

  -[CRLWPColumn logicalBoundsTop](self, "logicalBoundsTop");
  v4 = v3;
  v5 = sub_1000389BC(self->_lineFragmentArray.__ptr_);
  if (v5)
    return CGRectGetMaxY(*(CGRect *)(v5 + 40));
  else
    return v4;
}

- (double)textHeight
{
  double v3;
  double v4;
  double v5;

  -[CRLWPColumn textBlockBottom](self, "textBlockBottom");
  v4 = v3;
  -[CRLWPColumn logicalBoundsTop](self, "logicalBoundsTop");
  return v4 - v5;
}

- (BOOL)requiresGlyphVectorsForHeightMeasurement
{
  _QWORD **v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;

  v2 = -[CRLWPColumn lineFragmentArray](self, "lineFragmentArray");
  v3 = sub_100038988(*v2);
  if (v3)
  {
    v4 = v3;
    v5 = sub_100038998(*v2, 0);
    if ((sub_100143F64(v5) & 1) != 0)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      v6 = 1;
      do
      {
        v7 = v6;
        if (v4 == v6)
          break;
        v8 = sub_100038998(*v2, v6);
        v9 = sub_100143F64(v8);
        v6 = v7 + 1;
      }
      while (!v9);
      LOBYTE(v3) = v7 < v4;
    }
  }
  return v3;
}

- (void)addAdornmentRect:(id)a3
{
  -[NSMutableArray addObject:](self->_paragraphAdornments, "addObject:", a3);
}

- (void)clearAdornments
{
  -[NSMutableArray removeAllObjects](self->_paragraphAdornments, "removeAllObjects");
}

- (CGRect)frameBounds
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGAffineTransform v6;
  CGRect v7;

  x = self->_frameBounds.origin.x;
  y = self->_frameBounds.origin.y;
  width = self->_frameBounds.size.width;
  height = self->_frameBounds.size.height;
  -[CRLWPColumn transformFromWP](self, "transformFromWP");
  v7.origin.x = x;
  v7.origin.y = y;
  v7.size.width = width;
  v7.size.height = height;
  return CGRectApplyAffineTransform(v7, &v6);
}

- (CGAffineTransform)transformToWP
{
  CGAffineTransform v5;

  -[CRLWPColumn transformFromWP](self, "transformFromWP");
  return CGAffineTransformInvert(retstr, &v5);
}

+ (CGPoint)pinPoint:(CGPoint)a3 toBottomOfLineFragmentInColumns:(id)a4
{
  double y;
  double x;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  char *v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double MaxY;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat rect;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  CGPoint result;
  CGPoint v54;
  CGRect v55;
  CGRect v56;

  y = a3.y;
  x = a3.x;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "frameBounds");
        v54.x = x;
        v54.y = y;
        if (CGRectContainsPoint(v55, v54))
        {
          v11 = (char *)objc_msgSend(v10, "lineCount");
          if (v11)
          {
            objc_msgSend(v10, "boundsOfLineFragmentAtIndex:", v11 - 1);
            rect = v12;
            v14 = v13;
            v16 = v15;
            v18 = v17;
            if (v10)
            {
              objc_msgSend(v10, "transformToWP");
              v19 = v43;
              v20 = v45;
              v32 = v44;
              v21 = v47;
              v33 = v46;
              v34 = v42;
            }
            else
            {
              v21 = 0.0;
              v20 = 0.0;
              v19 = 0.0;
              v32 = 0.0;
              v33 = 0.0;
              v34 = 0.0;
            }
            v56.origin.x = v16;
            v56.origin.y = v18;
            v56.size.width = v14;
            v56.size.height = rect;
            MaxY = CGRectGetMaxY(v56);
            if (v21 + y * v20 + v19 * x > MaxY)
            {
              if (v10)
              {
                objc_msgSend(v10, "transformFromWP");
                v23 = v37;
                v24 = v36;
                v25 = v39;
                v26 = v38;
                v27 = v41;
                v28 = v40;
              }
              else
              {
                v27 = 0.0;
                v25 = 0.0;
                v23 = 0.0;
                v28 = 0.0;
                v26 = 0.0;
                v24 = 0.0;
              }
              v29 = v33 + y * v32 + v34 * x;
              x = v28 + MaxY * v26 + v24 * v29;
              y = v27 + MaxY * v25 + v23 * v29;
            }
          }
          goto LABEL_19;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_19:

  v30 = x;
  v31 = y;
  result.y = v31;
  result.x = v30;
  return result;
}

- (unint64_t)lineCount
{
  return sub_100038988(self->_lineFragmentArray.__ptr_);
}

- (const)lineFragmentArray
{
  return &self->_lineFragmentArray;
}

- (const)lineFragmentArrayForUnitTests
{
  return &self->_lineFragmentArray;
}

- (void)setLineFragmentArray:(const void *)a3
{
  sub_1001316E4(&self->_lineFragmentArray.__ptr_, (uint64_t *)a3);
}

- (const)lineFragmentAtIndex:(unint64_t)a3
{
  return (const void *)sub_100038998(self->_lineFragmentArray.__ptr_, a3);
}

- (void)offsetLineFragmentsBy:(CGSize)a3
{
  uint64_t v4;

  if (a3.width != 0.0 || a3.height != 0.0)
  {
    v4 = *(_QWORD *)&a3.height;
    sub_100038BCC((double ***)self->_lineFragmentArray.__ptr_, a3.width, a3.height);
    *(float64x2_t *)&self->_contentBottom = vaddq_f64((float64x2_t)vdupq_lane_s64(v4, 0), *(float64x2_t *)&self->_contentBottom);
  }
}

- (unint64_t)lineFragmentCountForBaseline:(double)a3
{
  return sub_100038C18((uint64_t *)self->_lineFragmentArray.__ptr_, a3);
}

- (void)makeEmpty:(unint64_t)a3 anchoredRange:(_NSRange)a4 layoutResultFlags:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;

  length = a4.length;
  location = a4.location;
  -[CRLWPColumn setStartCharIndex:](self, "setStartCharIndex:");
  -[CRLWPColumn setCharacterCount:](self, "setCharacterCount:", 0);
  -[CRLWPColumn setAnchoredRange:](self, "setAnchoredRange:", location, length);
  self->_contentBottom = 0.0;
  self->_erasableContentBottom = 0.0;
  self->_layoutResultFlags = a5;
  -[CRLWPColumn setNextWidowPullsDownFromCharIndex:](self, "setNextWidowPullsDownFromCharIndex:", a3);
  sub_100038B14((uint64_t *)self->_lineFragmentArray.__ptr_);
  -[CRLWPColumn clearAdornments](self, "clearAdornments");
}

- (CGRect)boundsOfLineFragmentAtIndex:(unint64_t)a3
{
  double *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGAffineTransform v9;
  CGRect v10;

  v4 = (double *)sub_100038998(self->_lineFragmentArray.__ptr_, a3);
  v5 = v4[5];
  v6 = v4[6];
  v7 = v4[7];
  v8 = v4[8];
  -[CRLWPColumn transformFromWP](self, "transformFromWP");
  v10.origin.x = v5;
  v10.origin.y = v6;
  v10.size.width = v7;
  v10.size.height = v8;
  return CGRectApplyAffineTransform(v10, &v9);
}

- (id)partitionedLayoutOfLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v3;

  v3 = sub_100038998(self->_lineFragmentArray.__ptr_, a3);
  return sub_10013E758(v3);
}

- (CGRect)rawGlyphRectOfRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  NSRange *v13;
  NSRange v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSRange v23;
  CGRect result;

  length = a3.length;
  location = a3.location;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v10 = -[CRLWPColumn lineIndexForCharIndex:eol:](self, "lineIndexForCharIndex:eol:", a3.location, 0);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = -[CRLWPColumn lineFragmentAtIndex:](self, "lineFragmentAtIndex:", v10);
    v12 = (uint64_t)v11;
    if (v11[3] < 0)
      v13 = (NSRange *)&xmmword_100EEE418;
    else
      v13 = (NSRange *)v11;
    v23.location = location;
    v23.length = length;
    v14 = NSIntersectionRange(v23, *v13);
    if (location == v14.location && length == v14.length)
    {
      x = sub_100142320(v12, location, length, self);
      y = v16;
      width = v17;
      height = v18;
    }
  }
  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CRLWPFontHeightInfo)fontHeightInfoAtCharIndex:(SEL)a3
{
  CRLWPFontHeightInfo *result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[6];

  *retstr = *(CRLWPFontHeightInfo *)byte_100EED860;
  result = -[CRLWPColumn lineIndexForCharIndex:eol:](self, "lineIndexForCharIndex:eol:", a4, 0);
  if (result != (CRLWPFontHeightInfo *)0x7FFFFFFFFFFFFFFFLL)
  {
    sub_100143774((uint64_t)-[CRLWPColumn lineFragmentAtIndex:](self, "lineFragmentAtIndex:", result), a4, self, (uint64_t)v11);
    v8 = v11[3];
    *(_OWORD *)&retstr->descent = v11[2];
    *(_OWORD *)&retstr->leadingBelow = v8;
    v9 = v11[5];
    *(_OWORD *)&retstr->verticalHeight = v11[4];
    *(_OWORD *)&retstr->underlinePosition = v9;
    v10 = v11[1];
    *(_OWORD *)&retstr->spaceBefore = v11[0];
    *(_OWORD *)&retstr->ascent = v10;
  }
  return result;
}

- (double)baselineOfLineFragmentAtIndex:(unint64_t)a3
{
  return *(double *)(sub_100038998(self->_lineFragmentArray.__ptr_, a3) + 32);
}

- (_NSRange)rangeOfLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v3;
  NSUInteger *v4;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v3 = sub_100038998(self->_lineFragmentArray.__ptr_, a3);
  if (*(uint64_t *)(v3 + 24) < 0)
    v4 = (NSUInteger *)&xmmword_100EEE418;
  else
    v4 = (NSUInteger *)v3;
  v5 = *v4;
  v6 = v4[1];
  result.length = v6;
  result.location = v5;
  return result;
}

- (unsigned)hyphenCharOfLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_100038998(self->_lineFragmentArray.__ptr_, a3);
  if (v3 && (v4 = v3, sub_1001448FC(v3)))
    return sub_1001492FC(v4);
  else
    return 0;
}

- ($3D3C930936AA0606C6A30FFE5E4C6F36)lineMetricsAtCharIndex:(SEL)a3 allowEndOfLine:(unint64_t)a4
{
  _BOOL8 v5;
  $3D3C930936AA0606C6A30FFE5E4C6F36 *result;
  uint64_t *v10;
  uint64_t v11;
  CGSize size;
  __int128 *v13;
  void *v14;
  id v15;
  uint64_t v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *i;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  const __CTFont *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  BOOL v34;
  _BYTE v35[128];
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v5 = a5;
  memcpy(retstr, &unk_100EEFA70, sizeof($3D3C930936AA0606C6A30FFE5E4C6F36));
  result = -[CRLWPColumn lineIndexForCharIndex:eol:](self, "lineIndexForCharIndex:eol:", a4, v5);
  if (result != ($3D3C930936AA0606C6A30FFE5E4C6F36 *)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = -[CRLWPColumn lineFragmentAtIndex:](self, "lineFragmentAtIndex:", result);
    v11 = (uint64_t)v10;
    v34 = 0;
    size = CGRectNull.size;
    retstr->var0.origin = CGRectNull.origin;
    retstr->var0.size = size;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    if (v10[3] < 0)
      v13 = &xmmword_100EEE418;
    else
      v13 = (__int128 *)v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPColumn rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:includePaginatedAttachments:](self, "rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:includePaginatedAttachments:", *(_QWORD *)v13, *((_QWORD *)v13 + 1), 0, 0, 0, 0));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v31;
      x = retstr->var0.origin.x;
      y = retstr->var0.origin.y;
      width = retstr->var0.size.width;
      height = retstr->var0.size.height;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i), "CGRectValue");
          v38.origin.x = v22;
          v38.origin.y = v23;
          v38.size.width = v24;
          v38.size.height = v25;
          v36.origin.x = x;
          v36.origin.y = y;
          v36.size.width = width;
          v36.size.height = height;
          v37 = CGRectUnion(v36, v38);
          x = v37.origin.x;
          y = v37.origin.y;
          width = v37.size.width;
          height = v37.size.height;
          retstr->var0 = v37;
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v15);
    }

    retstr->var1 = *(double *)(v11 + 32);
    *(_OWORD *)&retstr->var2.descent = *(_OWORD *)(v11 + 136);
    *(_OWORD *)&retstr->var2.leadingBelow = *(_OWORD *)(v11 + 152);
    *(_OWORD *)&retstr->var2.verticalHeight = *(_OWORD *)(v11 + 168);
    *(_OWORD *)&retstr->var2.underlinePosition = *(_OWORD *)(v11 + 184);
    *(_OWORD *)&retstr->var2.spaceBefore = *(_OWORD *)(v11 + 104);
    *(_OWORD *)&retstr->var2.ascent = *(_OWORD *)(v11 + 120);
    if (sub_10013E640(v11))
    {
      v26 = (const __CTFont *)sub_100145610((unint64_t *)v11, a4, &v34);
      retstr->var3 = CTFontGetXHeight(v26);
    }
    result = -[CRLWPColumn transformToWP](self, "transformToWP");
    *(_OWORD *)&retstr->var7.a = v27;
    *(_OWORD *)&retstr->var7.c = v28;
    *(_OWORD *)&retstr->var7.tx = v29;
  }
  return result;
}

- (double)horizontalOffsetForCharIndex:(unint64_t)a3 lineFragmentIndex:(unint64_t)a4 bumpPastHyphen:(BOOL)a5 allowPastLineBounds:(BOOL)a6
{
  _BOOL8 v7;
  uint64_t v9;

  v7 = a5;
  v9 = sub_100038998(self->_lineFragmentArray.__ptr_, a4);
  return sub_10013F8F8(v9, a3, v7, a6, 0);
}

- (const)lineFragmentClosestToPoint:(CGPoint)a3 knobTag:(unint64_t)a4
{
  double y;
  double x;
  _QWORD **v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  unint64_t v12;
  double v13;
  double v14;
  double *v15;
  double v16;
  double v17;
  double v19;
  double v20;
  double v21;

  y = a3.y;
  x = a3.x;
  -[CRLWPColumn transformToWP](self, "transformToWP");
  v8 = -[CRLWPColumn lineFragmentArray](self, "lineFragmentArray");
  v9 = sub_100038988(*v8);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = 0;
  v12 = 0;
  v13 = v21 + y * v20 + v19 * x;
  v14 = INFINITY;
  do
  {
    v15 = (double *)sub_100038998(*v8, v12);
    sub_100260E54(a4, v15[5], v15[6], v15[7], v15[8]);
    v17 = vabdd_f64(v13, v16);
    if (v17 < v14)
    {
      v11 = v15;
      v14 = v17;
    }
    ++v12;
  }
  while (v10 != v12);
  return v11;
}

- (const)lineFragmentForCharIndex:(unint64_t)a3 knobTag:(unint64_t)a4 selectionType:(unint64_t)a5
{
  id v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  _QWORD **v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v21;
  BOOL v22;
  __int128 *v23;
  char *v24;
  unint64_t v25;
  char *v26;
  char *v27;
  BOOL v28;
  int v29;
  unint64_t v30;
  int v31;
  _BOOL4 v32;
  BOOL v34;
  char v36;
  int v37;
  void *v38;
  id v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  uint64_t v47;
  char *v48;
  char v51;
  id v52;
  char v53;
  uint8_t buf[4];
  unsigned int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  unint64_t v63;
  __int16 v64;
  id v65;

  v53 = 0;
  v7 = -[CRLWPColumn range](self, "range");
  if (a3 >= (unint64_t)v7 && a3 - (unint64_t)v7 < v8
    || (v9 = (char *)-[CRLWPColumn range](self, "range"), &v9[v10] == (char *)a3))
  {
    v52 = 0;
    v11 = -[CRLWPColumn pRemapCharIndex:outIsAfterBreak:outWithTextSource:](self, "pRemapCharIndex:outIsAfterBreak:outWithTextSource:", a3, &v53, &v52);
    v12 = v52;
    buf[0] = 0;
    v51 = 0;
    v48 = (char *)v11;
    -[CRLWPColumn pInfoForCharIndex:isAtStart:isAtEnd:](self, "pInfoForCharIndex:isAtStart:isAtEnd:", v11, &v51, buf);
    v13 = -[CRLWPColumn lineFragmentArray](self, "lineFragmentArray");
    v14 = sub_100038988(*v13);
    v15 = v14;
    if (v14)
    {
      v16 = 0;
      v47 = v14 - 1;
      do
      {
        v17 = sub_100038998(*v13, v16);
        v18 = v17;
        v19 = *(_QWORD *)(v17 + 24);
        if ((v19 & 0x40) == 0)
        {
          v21 = (v19 & 0x1000) == 0 || a5 != 7;
          v22 = v19 < 0;
          v23 = &xmmword_100EEE418;
          if (!v22)
            v23 = (__int128 *)v17;
          v25 = *(_QWORD *)v23;
          v24 = (char *)*((_QWORD *)v23 + 1);
          v26 = (char *)objc_msgSend(v12, "charIndexRemappedFromStorage:", *(_QWORD *)v23);
          v27 = (char *)objc_msgSend(v12, "charIndexRemappedFromStorage:", &v24[v25]);
          v28 = (unint64_t)v48 < v25 || &v48[-v25] >= v24;
          if (!v28 || (v29 = 0, buf[0]) && v48 == v26)
          {
            v29 = 1;
            if (a4 == 11 && v48 == v26)
            {
              v30 = *(_QWORD *)(v18 + 24);
              if ((v30 & 1) != 0)
                v29 = (v30 >> 9) & 1;
              else
                v29 = 1;
            }
          }
          if (a5 == 7)
          {
            v26 = (char *)sub_100144974(v18);
            v27 = (char *)sub_1001449A4(v18);
            v31 = (a4 == 11) ^ v21 ^ 1;
          }
          else
          {
            v31 = a4 == 11;
          }
          v32 = v48 == v27;
          if (v48 == v27 && v31 != 0)
          {
            if (buf[0])
              v34 = v53 == 0;
            else
              v34 = 0;
            v32 = v34 && v47 == v16;
          }
          v36 = v31 ^ 1;
          if (v48 != v26)
            v36 = 1;
          if ((v36 & 1) != 0)
            LOBYTE(v37) = 0;
          else
            v37 = (*(unsigned __int8 *)(v18 + 25) >> 1) & 1;
          if (((v29 | v32) & 1) != 0 || (v37 & 1) != 0)
            goto LABEL_63;
        }
      }
      while (v15 != ++v16);
    }
  }
  else
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPColumn storage](self, "storage"));
    v39 = objc_msgSend(v38, "length");

    if ((unint64_t)v39 >= a3)
      return 0;
    v40 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244920);
    v41 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPColumn storage](self, "storage"));
      *(_DWORD *)buf = 67110402;
      v55 = v40;
      v56 = 2082;
      v57 = "-[CRLWPColumn lineFragmentForCharIndex:knobTag:selectionType:]";
      v58 = 2082;
      v59 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm";
      v60 = 1024;
      v61 = 1670;
      v62 = 2048;
      v63 = a3;
      v64 = 2048;
      v65 = objc_msgSend(v46, "length");
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v41, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d charIndex %lu beyond storage length: %lu", buf, 0x36u);

    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244940);
    v42 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn lineFragmentForCharIndex:knobTag:selectionType:]"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPColumn storage](self, "storage"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v43, 1670, 0, "charIndex %lu beyond storage length: %lu", a3, objc_msgSend(v44, "length"));

  }
  v18 = 0;
LABEL_63:

  return (const void *)v18;
}

- (const)nearestLineFragmentWithSameVerticalPositionAs:(unint64_t)a3 xPos:(double)a4
{
  unint64_t v5;
  double MinY;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  unint64_t v12;
  double *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v5 = a3;
  v21 = *(CGRect *)(sub_100038998(self->_lineFragmentArray.__ptr_, a3) + 40);
  MinY = CGRectGetMinY(v21);
  do
  {
    v8 = v5;
    if (!v5)
      break;
    --v5;
    v22 = *(CGRect *)(sub_100038998(self->_lineFragmentArray.__ptr_, v8 - 1) + 40);
  }
  while (CGRectGetMinY(v22) >= MinY);
  v9 = -[CRLWPColumn lineCount](self, "lineCount");
  if (v8 < v9)
  {
    v10 = v9;
    v11 = INFINITY;
    v12 = v8;
    do
    {
      v13 = (double *)sub_100038998(self->_lineFragmentArray.__ptr_, v12);
      v14 = v13[5];
      v15 = v13[6];
      v16 = v13[7];
      v17 = v13[8];
      v23.origin.x = v14;
      v23.origin.y = v15;
      v23.size.width = v16;
      v23.size.height = v17;
      if (MinY != CGRectGetMinY(v23))
        break;
      v24.origin.x = v14;
      v24.origin.y = v15;
      v24.size.width = v16;
      v24.size.height = v17;
      v18 = vabdd_f64(a4, CGRectGetMinX(v24));
      v25.origin.x = v14;
      v25.origin.y = v15;
      v25.size.width = v16;
      v25.size.height = v17;
      v19 = vabdd_f64(a4, CGRectGetMaxX(v25));
      if (v19 >= v18)
        v19 = v18;
      if (v19 < v11)
      {
        v11 = v19;
        v8 = v12;
      }
      ++v12;
    }
    while (v12 < v10);
  }
  return -[CRLWPColumn lineFragmentAtIndex:](self, "lineFragmentAtIndex:", v8);
}

- (void)pInfoForCharIndex:(unint64_t)a3 isAtStart:(BOOL *)a4 isAtEnd:(BOOL *)a5
{
  int64_t v8;

  v8 = -[CRLWPStorage length](self->_storage, "length");
  *a4 = a3 == 0;
  *a5 = v8 == a3;
}

- (unint64_t)pRemapCharIndex:(unint64_t)a3 outIsAfterBreak:(BOOL *)a4 outWithTextSource:(id *)a5
{
  _TtC8Freeform12CRLWPStorage *v9;
  int64_t v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  int v14;
  unsigned __int8 v15;
  int64_t v16;

  v9 = self->_storage;
  v10 = -[CRLWPStorage charIndexMappedFromStorage:](v9, "charIndexMappedFromStorage:", a3);
  v11 = a3;
  if (v10)
    v11 = sub_1001AEAA8(a3, v9);
  if (a4)
  {
    if (v11 == a3)
    {
      v12 = 0;
    }
    else
    {
      v13 = -[CRLWPStorage characterAtIndex:](self->_storage, "characterAtIndex:");
      v14 = v13;
      v15 = sub_1001AE2A0(v13);
      if (v14 == 8232)
        v12 = 1;
      else
        v12 = v15;
    }
    *a4 = v12;
  }
  if (a5)
    *a5 = objc_retainAutorelease(v9);
  v16 = -[CRLWPStorage charIndexRemappedFromStorage:](v9, "charIndexRemappedFromStorage:", a3);

  return v16;
}

- (unint64_t)lineIndexForCharIndex:(unint64_t)a3 eol:(BOOL)a4
{
  unint64_t v6;
  id v7;
  _QWORD **v8;
  uint64_t v9;
  unint64_t v10;
  __int128 *v11;
  __int128 *v12;
  __int128 *v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  BOOL v17;
  _BOOL4 v18;
  BOOL v19;
  _BOOL4 v20;
  BOOL v21;
  BOOL v22;
  __int16 v24;
  id v25;
  char v26;

  v26 = 0;
  v25 = 0;
  v6 = -[CRLWPColumn pRemapCharIndex:outIsAfterBreak:outWithTextSource:](self, "pRemapCharIndex:outIsAfterBreak:outWithTextSource:", a3, &v26, &v25);
  v7 = v25;
  v24 = 0;
  -[CRLWPColumn pInfoForCharIndex:isAtStart:isAtEnd:](self, "pInfoForCharIndex:isAtStart:isAtEnd:", v6, &v24, (char *)&v24 + 1);
  v8 = -[CRLWPColumn lineFragmentArray](self, "lineFragmentArray");
  v9 = sub_100038988(*v8);
  if (v9)
  {
    v10 = 0;
    while (1)
    {
      v11 = (__int128 *)sub_100038998(*v8, v10);
      v12 = v11;
      v13 = *((uint64_t *)v11 + 3) < 0 ? &xmmword_100EEE418 : v11;
      v15 = *(_QWORD *)v13;
      v14 = *((_QWORD *)v13 + 1);
      v16 = objc_msgSend(v7, "charRangeRemappedFromStorage:", *(_QWORD *)v13, v14);
      v17 = v6 < v15 || v6 - v15 >= v14;
      v18 = !v17;
      v19 = HIBYTE(v24) && v6 == (_QWORD)v16;
      v20 = v19;
      if (v6 == v15 + v14)
      {
        v21 = HIBYTE(v24) || a4;
        if (v26)
          v21 = 0;
        v22 = (*((_QWORD *)v12 + 3) & 0x100000100) == 0 && v21;
      }
      else
      {
        v22 = 0;
      }
      if (v18 || v20 || v22)
        break;
      if (v9 == ++v10)
        goto LABEL_31;
    }
  }
  else
  {
LABEL_31:
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (CGRect)caretRectForSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double x;
  double y;
  double width;
  double height;
  char *v12;
  id v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  BOOL v22;
  unint64_t v23;
  double *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  __int128 *v37;
  unint64_t v38;
  __int128 *v39;
  id v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  char *v45;
  unsigned __int8 v46;
  unint64_t v47;
  int v48;
  unsigned __int8 v49;
  char v50;
  char v51;
  __int128 *v52;
  char *v53;
  unint64_t v54;
  __int128 *v55;
  BOOL v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  unsigned int v65;
  unsigned int v66;
  double v67;
  double v68;
  uint64_t v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CFTypeRef cf;
  void *v75;
  void *v76;
  id v77;
  CGAffineTransform v78;
  double v79;
  double v80;
  double v81;
  double v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  BOOL v89;
  __int16 v90;
  id v91;
  char v92;
  CGFloat v93[4];
  CGRect v94;
  CGRect v95;
  CGRect result;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244960);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0C920();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244980);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn caretRectForSelection:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1856, 0, "invalid nil value for '%{public}s'", "selection");

  }
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v12 = (char *)objc_msgSend(v4, "range");
  v13 = objc_msgSend(v4, "caretAffinity");
  v14 = (char *)-[CRLWPColumn range](self, "range");
  v16 = v15;
  v17 = (char *)-[CRLWPStorage range](self->_storage, "range");
  if (v12 <= &v17[v18])
  {
    v92 = 0;
    v91 = 0;
    v19 = -[CRLWPColumn pRemapCharIndex:outIsAfterBreak:outWithTextSource:](self, "pRemapCharIndex:outIsAfterBreak:outWithTextSource:", v12, &v92, &v91);
    v77 = v91;
    v90 = 0;
    -[CRLWPColumn pInfoForCharIndex:isAtStart:isAtEnd:](self, "pInfoForCharIndex:isAtStart:isAtEnd:", v19, &v90, (char *)&v90 + 1);
    if ((char *)v19 == &v14[v16])
      v20 = 1;
    else
      v20 = (uint64_t)v13;
    if ((char *)v19 == v12)
      v21 = v13;
    else
      v21 = (id)v20;
    if (v19 < (unint64_t)v14
      || v19 - (unint64_t)v14 >= v16
      || v19 <= (unint64_t)v14 && !(_BYTE)v90 && v21 == (id)1 && !v92)
    {
      if ((char *)v19 != &v14[v16])
        goto LABEL_108;
      v22 = v21 == (id)1 && v92 == 0;
      if (!v22 && !HIBYTE(v90))
        goto LABEL_108;
    }
    v23 = -[CRLWPColumn lineIndexForCharIndex:eol:](self, "lineIndexForCharIndex:eol:", v12, v21 == (id)1);
    if (v23 >= -[CRLWPColumn lineCount](self, "lineCount"))
      goto LABEL_108;
    v24 = -[CRLWPColumn lineFragmentAtIndex:](self, "lineFragmentAtIndex:", v23);
    if (!v24)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012449A0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0C894();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012449C0);
      v25 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn caretRectForSelection:]"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 1898, 0, "invalid nil value for '%{public}s'", "lineFragment");

    }
    if (!sub_10013E640((uint64_t)v24))
    {
      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(0, *(Swift::String *)&v28);
      x = v32;
      y = v33;
      width = v34;
      height = v35;
      v36 = *((_QWORD *)v24 + 3);
      if (v36 < 0)
        v37 = &xmmword_100EEE418;
      else
        v37 = (__int128 *)v24;
      v38 = *((_QWORD *)v37 + 1);
      if (v38)
      {
        if (v36 < 0)
          v39 = &xmmword_100EEE418;
        else
          v39 = (__int128 *)v24;
        x = v32 + (double)(v19 - *(_QWORD *)v39) / (double)v38;
      }
      goto LABEL_108;
    }
    v89 = 0;
    v30 = v92 - 1;
    if (v19 <= (unint64_t)v17)
      v30 = 0;
    v31 = sub_100145610((unint64_t *)v24, v30 + v19, &v89);
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorage characterStyleAtCharIndex:before:effectiveRange:](self->_storage, "characterStyleAtCharIndex:before:effectiveRange:", v19, v92 == 0, 0));
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorage paragraphStyleAtCharIndex:](self->_storage, "paragraphStyleAtCharIndex:", v19));
    if (v31)
    {
      cf = 0;
    }
    else
    {
      v31 = (void *)sub_1001B16F4(v75, v76, self->_scaleTextPercent);
      cf = v31;
      if (!v31)
      {
LABEL_107:

LABEL_108:
        -[CRLWPColumn transformFromWP](self, "transformFromWP");
        v94.origin.x = x;
        v94.origin.y = y;
        v94.size.width = width;
        v94.size.height = height;
        v95 = CGRectApplyAffineTransform(v94, &v78);
        x = v95.origin.x;
        y = v95.origin.y;
        width = v95.size.width;
        height = v95.size.height;

        goto LABEL_109;
      }
    }
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    sub_1001B21AC((uint64_t)v31, &v83);
    v40 = sub_1001B1190(v75, v76, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = v41;
    if (v41)
    {
      objc_msgSend(v41, "doubleValue");
      v44 = v43;
    }
    else
    {
      v44 = 0.0;
    }
    v45 = (char *)objc_msgSend(v77, "charIndexRemappedFromStorage:", objc_msgSend(v4, "insertionChar"));
    v46 = objc_msgSend(v4, "leadingEdge");
    v47 = -[CRLWPColumn lineIndexForCharIndex:eol:](self, "lineIndexForCharIndex:eol:", objc_msgSend(v4, "insertionChar"), v21 == (id)1);
    if (v47 == v23 || v47 >= -[CRLWPColumn lineCount](self, "lineCount"))
      v48 = 0;
    else
      v48 = *((_BYTE *)-[CRLWPColumn lineFragmentAtIndex:](self, "lineFragmentAtIndex:", v47) + 28) & 1;
    if ((v46 & 1) != 0
      || ((v49 = objc_msgSend(v4, "isAtEndOfLine"), (unint64_t)v45 >= v19)
        ? (v50 = 1)
        : (v50 = v49),
          (v50 & 1) != 0))
    {
      if (!v48)
        goto LABEL_74;
    }
    else
    {
      if (v19 == *(_QWORD *)v24)
        v51 = 1;
      else
        v51 = v48;
      if ((v51 & 1) == 0)
      {
        v46 = 0;
        goto LABEL_74;
      }
    }
    v46 = 1;
    v45 = (char *)v19;
LABEL_74:
    v52 = &xmmword_100EEE418;
    if (*((uint64_t *)v24 + 3) >= 0)
      v52 = (__int128 *)v24;
    v55 = v52;
    v54 = *(_QWORD *)v52;
    v53 = (char *)*((_QWORD *)v55 + 1);
    v56 = &v45[-v54] < v53 && (unint64_t)v45 >= v54;
    if (v56 || v45 == &v53[v54])
    {
      sub_1001459A4((uint64_t)v24, (unint64_t)v45, v46, (int)objc_msgSend(v4, "isVisual"), 0);
      x = v60;
      v61 = v24[4];
      v93[0] = 0.0;
      v81 = 0.0;
      v82 = 0.0;
      v79 = 0.0;
      v80 = 0.0;
      v62 = v61 - v44;
      if (sub_100148240(v24, v19, v93, &v82, &v81, &v80, &v79))
      {
        v63 = floor(v62 + v82 * 0.5 - v93[0]);
        width = v81 + v80 + v79;
        x = x - width;
        v64 = 0.0;
      }
      else
      {
        v65 = -[CRLWPColumn textIsVertical](self, "textIsVertical");
        if (v89)
          v66 = 0;
        else
          v66 = v65;
        v67 = *(double *)&v84;
        v68 = *(double *)&v85;
        if (v66 == 1)
        {
          v68 = (*(double *)&v84 + *(double *)&v85) * 0.5;
          *(double *)&v85 = v68;
          *(double *)&v84 = v68;
          v67 = v68;
        }
        v63 = floor(v62 - v67 - *((double *)&v85 + 1));
        v64 = ceil(v62 + v68) - v63;
        width = 0.0;
      }
      v69 = *((_QWORD *)v24 + 3);
      if ((v69 & 1) != 0)
        height = v24[8];
      else
        height = v64;
      if ((v69 & 1) != 0)
        y = v24[6];
      else
        y = v63;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012449E0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0C814();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101244A00);
      v57 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn caretRectForSelection:]"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v58, v59, 1948, 0, "invalid charIndex for line fragment");

    }
    if (cf)
      CFRelease(cf);

    goto LABEL_107;
  }
LABEL_109:

  v70 = x;
  v71 = y;
  v72 = width;
  v73 = height;
  result.size.height = v73;
  result.size.width = v72;
  result.origin.y = v71;
  result.origin.x = v70;
  return result;
}

- (CGRect)glyphRectForRange:(_NSRange)a3 includingLabel:(BOOL)a4
{
  NSUInteger length;
  NSUInteger location;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  CRLWPLineFragmentArray *ptr;
  uint64_t *v16;
  uint64_t *v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger *v21;
  NSUInteger v22;
  NSUInteger v23;
  NSRange v24;
  BOOL v25;
  NSUInteger v26;
  NSRange v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double MaxX;
  uint64_t v40;
  uint64_t v41;
  NSUInteger v42;
  id v43;
  uint64_t v44;
  void *v45;
  NSUInteger v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  id v54;
  void *v55;
  const __CTLine *v56;
  CGContext *v57;
  double v58;
  double v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CGFloat v74;
  CGFloat v75;
  NSUInteger v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  double v80;
  NSRange range2;
  CGAffineTransform v82;
  NSRange v83;
  NSRange v84;
  NSRange v85;
  NSRange v86;
  NSRange v87;
  NSRange v88;
  NSRange v89;
  NSRange v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect ImageBounds;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect result;
  CGRect v110;
  CGRect v111;
  CGRect v112;

  length = a3.length;
  location = a3.location;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v87.location = (NSUInteger)-[CRLWPColumn range](self, "range");
  v87.length = v12;
  range2.location = location;
  v83.location = location;
  v83.length = length;
  v13 = sub_1001E966C(v83, v87, length == 0);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    ptr = self->_lineFragmentArray.__ptr_;
    v16 = *(uint64_t **)ptr;
    v17 = (uint64_t *)*((_QWORD *)ptr + 1);
    if (*(uint64_t **)ptr != v17)
    {
      v18 = v13;
      v19 = v14;
      v76 = v13 + v14;
      v20 = location + length;
      do
      {
        v21 = (NSUInteger *)*v16;
        if (*(uint64_t *)(*v16 + 24) < 0)
          v21 = (NSUInteger *)&xmmword_100EEE418;
        v23 = *v21;
        v22 = v21[1];
        v84.location = *v21;
        v84.length = v22;
        v88.location = v18;
        v88.length = v19;
        v24.location = sub_1001E966C(v84, v88, v19 == 0);
        if (v24.location != 0x7FFFFFFFFFFFFFFFLL || (!v22 ? (v25 = v23 == v76) : (v25 = 0), v25))
        {
          v26 = v24.location + v24.length;
          if (v24.location + v24.length >= v20)
            v26 = v20;
          if (v24.location < v26)
          {
            v85 = NSIntersectionRange(v24, v24);
            v89.location = range2.location;
            v89.length = length;
            v27 = NSIntersectionRange(v85, v89);
            if (v27.length)
            {
              v77 = height;
              v79 = width;
              v74 = y;
              v75 = x;
              v28 = sub_1001436B0(*v16, v27.location, v27.length, self);
              v30 = v29;
              v32 = v31;
              v34 = v33;
              v91.origin.x = sub_100143C9C(*v16, v27.location, v27.length);
              v35 = v91.origin.x;
              v36 = v91.origin.y;
              v37 = v91.size.width;
              v38 = v91.size.height;
              if (!CGRectIsEmpty(v91))
              {
                v92.origin.x = v28;
                v92.origin.y = v30;
                v92.size.width = v32;
                v92.size.height = v34;
                v110.origin.x = v35;
                v110.origin.y = v36;
                v110.size.width = v37;
                v110.size.height = v38;
                v93 = CGRectUnion(v92, v110);
                v28 = v93.origin.x;
                v30 = v93.origin.y;
                v32 = v93.size.width;
                v34 = v93.size.height;
              }
              v94.origin.x = v28;
              v94.origin.y = v30;
              v94.size.width = v32;
              v94.size.height = v34;
              if (!CGRectIsEmpty(v94))
              {
                v95.origin.x = v28;
                v95.origin.y = v30;
                v95.size.width = v32;
                v95.size.height = v34;
                v96 = CGRectIntegral(v95);
                v28 = v96.origin.x;
                v30 = v96.origin.y;
                v32 = v96.size.width;
                v34 = v96.size.height;
                MaxX = CGRectGetMaxX(v96);
                if (MaxX == rint(CGRectGetMaxX(self->_frameBounds)) + -1.0)
                  v32 = v32 + 1.0;
              }
              v111.size.height = v77;
              v111.size.width = v79;
              v97.origin.x = v28;
              v97.origin.y = v30;
              v97.size.width = v32;
              v97.size.height = v34;
              v111.origin.x = v75;
              v111.origin.y = v74;
              v98 = CGRectUnion(v97, v111);
              x = v98.origin.x;
              y = v98.origin.y;
              width = v98.size.width;
              height = v98.size.height;
            }
          }
          v40 = *v16;
          if ((*(_BYTE *)(*v16 + 25) & 0x10) != 0)
            v41 = sub_1001449A4(v40);
          else
            v41 = sub_100144974(v40);
          v42 = v41;
          if (a4)
          {
            v43 = sub_10013E750(*v16);
            v44 = objc_claimAutoreleasedReturnValue(v43);
            if (v44)
            {
              v45 = (void *)v44;
              v86.location = v42;
              v86.length = 0;
              v90.location = range2.location;
              v90.length = length;
              v46 = sub_1001E966C(v86, v90, 1);

              if (v46 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v47 = sub_10014409C(*v16);
                v49 = v48;
                v51 = v50;
                v53 = v52;
                v54 = sub_10013E750(*v16);
                v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
                v56 = (const __CTLine *)objc_msgSend(v55, "textLine");
                if (v56)
                {
                  v78 = height;
                  v80 = width;
                  v57 = (CGContext *)sub_1001422A4();
                  ImageBounds = CTLineGetImageBounds(v56, v57);
                  v58 = ImageBounds.origin.x;
                  v59 = ImageBounds.origin.y;
                  v60 = ImageBounds.size.width;
                  v61 = ImageBounds.size.height;
                  v62 = sub_100144258(*v16);
                  v64 = v63;
                  if (objc_msgSend(v55, "isLabelTateChuYoko"))
                  {
                    CGAffineTransformMakeRotation(&v82, 1.57079633);
                    v100.origin.x = v58;
                    v100.origin.y = v59;
                    v100.size.width = v60;
                    v100.size.height = v61;
                    v101 = CGRectApplyAffineTransform(v100, &v82);
                    v58 = v101.origin.x;
                    v59 = v101.origin.y;
                    v60 = v101.size.width;
                    v61 = v101.size.height;
                  }
                  v102.origin.x = v62 + v58;
                  v102.origin.y = v64 - v59 - v61;
                  v102.size.width = v60;
                  v102.size.height = v61;
                  v103 = CGRectIntegral(v102);
                  v47 = v103.origin.x;
                  v49 = v103.origin.y;
                  v51 = v103.size.width;
                  v53 = v103.size.height;
                  height = v78;
                  width = v80;
                }
                v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "shadow"));
                if (objc_msgSend(v65, "isEnabled"))
                {
                  objc_msgSend(v65, "shadowBoundsForRect:", v47, v49, v51, v53);
                  v47 = v66;
                  v49 = v67;
                  v51 = v68;
                  v53 = v69;
                }
                v104.origin.x = x;
                v104.origin.y = y;
                v104.size.width = width;
                v104.size.height = height;
                v112.origin.x = v47;
                v112.origin.y = v49;
                v112.size.width = v51;
                v112.size.height = v53;
                v105 = CGRectUnion(v104, v112);
                x = v105.origin.x;
                y = v105.origin.y;
                width = v105.size.width;
                height = v105.size.height;

              }
            }
          }
        }
        v16 += 2;
      }
      while (v16 != v17);
    }
    v106.origin.x = x;
    v106.origin.y = y;
    v106.size.width = width;
    v106.size.height = height;
    if (!CGRectIsNull(v106))
    {
      -[CRLWPColumn transformFromWP](self, "transformFromWP");
      v107.origin.x = x;
      v107.origin.y = y;
      v107.size.width = width;
      v107.size.height = height;
      v108 = CGRectApplyAffineTransform(v107, (CGAffineTransform *)&range2.length);
      x = v108.origin.x;
      y = v108.origin.y;
      width = v108.size.width;
      height = v108.size.height;
    }
  }
  v70 = x;
  v71 = y;
  v72 = width;
  v73 = height;
  result.size.height = v73;
  result.size.width = v72;
  result.origin.y = v71;
  result.origin.x = v70;
  return result;
}

- (unsigned)fontTraitsForRange:(_NSRange)a3 includingLabel:(BOOL)a4
{
  NSUInteger location;
  _QWORD *v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  CRLWPLineFragmentArray *ptr;
  uint64_t *v11;
  NSRange v12;
  NSUInteger *v13;
  NSUInteger v14;
  NSUInteger v15;
  BOOL v16;
  uint64_t v17;
  const __CTLine *v18;
  CFArrayRef GlyphRuns;
  void *v20;
  id v21;
  uint64_t v22;
  void *i;
  const __CTRun *v24;
  CFRange StringRange;
  id v26;
  void *v27;
  id v28;
  NSUInteger v29;
  NSUInteger v30;
  unsigned int v31;
  NSUInteger v33;
  uint64_t *v34;
  NSRange v35;
  id obj;
  NSUInteger range2;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  int v46;
  _BYTE v47[128];
  NSRange v48;
  NSRange v49;
  NSRange v50;
  NSRange v51;
  NSRange v52;

  range2 = a3.length;
  location = a3.location;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100205F70;
  v42[3] = &unk_101244A28;
  v42[4] = &v43;
  v6 = objc_retainBlock(v42);
  v51.location = (NSUInteger)-[CRLWPColumn range](self, "range");
  v51.length = v7;
  v48.length = range2;
  v48.location = location;
  v8 = sub_1001E966C(v48, v51, range2 == 0);
  v35.length = v9;
  v35.location = v8;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    ptr = self->_lineFragmentArray.__ptr_;
    v11 = *(uint64_t **)ptr;
    v34 = (uint64_t *)*((_QWORD *)ptr + 1);
    if (*(uint64_t **)ptr != v34)
    {
      v33 = v8 + v9;
      do
      {
        v12 = v35;
        v13 = (NSUInteger *)*v11;
        if (*(uint64_t *)(*v11 + 24) < 0)
          v13 = (NSUInteger *)&xmmword_100EEE418;
        v15 = *v13;
        v14 = v13[1];
        v49.location = *v13;
        v49.length = v14;
        if (sub_1001E966C(v49, v12, v35.length == 0) != 0x7FFFFFFFFFFFFFFFLL
          || (!v14 ? (v16 = v15 == v33) : (v16 = 0), v16))
        {
          if (sub_10013E640(*v11))
          {
            v17 = sub_10013E664(*v11, 0);
            v18 = (const __CTLine *)sub_10019FA78(v17);
            if (v18)
            {
              GlyphRuns = CTLineGetGlyphRuns(v18);
              v20 = (void *)objc_claimAutoreleasedReturnValue(GlyphRuns);
              v40 = 0u;
              v41 = 0u;
              v38 = 0u;
              v39 = 0u;
              obj = v20;
              v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
              if (v21)
              {
                v22 = *(_QWORD *)v39;
                do
                {
                  for (i = 0; i != v21; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v39 != v22)
                      objc_enumerationMutation(obj);
                    v24 = *(const __CTRun **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
                    StringRange = CTRunGetStringRange(v24);
                    v26 = sub_10013DFB8(*v11);
                    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
                    v28 = objc_msgSend(v27, "charRangeMappedToStorage:", StringRange.location, StringRange.length);
                    v30 = v29;

                    v50.location = (NSUInteger)v28;
                    v50.length = v30;
                    v52.location = location;
                    v52.length = range2;
                    if (NSIntersectionRange(v50, v52).length)
                      ((void (*)(_QWORD *, const __CTRun *))v6[2])(v6, v24);
                  }
                  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
                }
                while (v21);
              }

            }
          }
        }
        v11 += 2;
      }
      while (v11 != v34);
    }
  }
  v31 = *((_DWORD *)v44 + 6);

  _Block_object_dispose(&v43, 8);
  return v31;
}

- (CGRect)glyphRectForRubyFieldAtCharIndex:(unint64_t)a3 glyphRange:(_NSRange)a4
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CRLWPLineFragmentArray *ptr;
  uint64_t *v9;
  uint64_t *v10;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGAffineTransform v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  ptr = self->_lineFragmentArray.__ptr_;
  v9 = *(uint64_t **)ptr;
  v10 = (uint64_t *)*((_QWORD *)ptr + 1);
  if (v9 != v10)
  {
    while (1)
    {
      v12 = *(uint64_t *)(*v9 + 24) < 0 ? (unint64_t *)&xmmword_100EEE418 : (unint64_t *)*v9;
      v15 = v12;
      v13 = *v12;
      v14 = v15[1];
      v17 = a3 >= v13;
      v16 = a3 - v13;
      v17 = !v17 || v16 >= v14;
      if (!v17)
        break;
      v9 += 2;
      if (v9 == v10)
        goto LABEL_14;
    }
    v18 = sub_100143A34(*v9, a3, a4.location, a4.length);
    x = v18;
    y = v19;
    width = v20;
    height = v21;
    if (!CGRectIsNull(*(CGRect *)&v18))
    {
      -[CRLWPColumn transformFromWP](self, "transformFromWP");
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      v28 = CGRectApplyAffineTransform(v27, &v26);
      x = v28.origin.x;
      y = v28.origin.y;
      width = v28.size.width;
      height = v28.size.height;
    }
  }
LABEL_14:
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (unint64_t)glyphCountForRubyFieldAtCharIndex:(unint64_t)a3
{
  CRLWPLineFragmentArray *ptr;
  uint64_t *v4;
  uint64_t *v5;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v14;
  uint64_t v15;
  const __CTLine *v16;

  ptr = self->_lineFragmentArray.__ptr_;
  v5 = *(uint64_t **)ptr;
  v4 = (uint64_t *)*((_QWORD *)ptr + 1);
  if (v5 != v4)
  {
    while (1)
    {
      v7 = *(uint64_t *)(*v5 + 24) < 0 ? (unint64_t *)&xmmword_100EEE418 : (unint64_t *)*v5;
      v10 = v7;
      v8 = *v7;
      v9 = v10[1];
      v12 = a3 >= v8;
      v11 = a3 - v8;
      v12 = !v12 || v11 >= v9;
      if (!v12)
        break;
      v5 += 2;
      if (v5 == v4)
        return 0;
    }
    v14 = *(_QWORD *)sub_10013E67C(*v5);
    v15 = *(_QWORD *)(sub_10013E67C(*v5) + 8);
    while (v14 != v15)
    {
      if (*(_QWORD *)(v14 + 24) == a3)
      {
        v16 = (const __CTLine *)sub_10019FA78(v14);
        return CTLineGetGlyphCount(v16);
      }
      v14 += 104;
    }
  }
  return 0;
}

+ (CGRect)columnRectForRange:(_NSRange)a3 withColumns:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  NSRange v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  NSRange v30;
  NSRange v31;
  CGRect v32;
  CGRect v33;
  CGRect result;
  CGRect v35;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v30.location = (NSUInteger)objc_msgSend(v15, "range", (_QWORD)v25);
        v31.location = location;
        v31.length = length;
        v16 = NSIntersectionRange(v30, v31);
        if (v16.length)
        {
          objc_msgSend(v15, "columnRectForRange:", v16.location, v16.length);
          v35.origin.x = v17;
          v35.origin.y = v18;
          v35.size.width = v19;
          v35.size.height = v20;
          v32.origin.x = x;
          v32.origin.y = y;
          v32.size.width = width;
          v32.size.height = height;
          v33 = CGRectUnion(v32, v35);
          x = v33.origin.x;
          y = v33.origin.y;
          width = v33.size.width;
          height = v33.size.height;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

+ (CGRect)labelRectForCharIndex:(unint64_t)a3 withColumns:(id)a4
{
  id v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  unint64_t v16;
  _BOOL4 v17;
  id v19;
  __int128 *v20;
  __int128 *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGAffineTransform v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  _BYTE v59[128];
  CGRect v60;
  CGRect v61;
  CGRect result;

  v5 = a4;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v59, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v15 = objc_msgSend(v14, "range");
        v17 = a3 - (unint64_t)v15 < v16 && a3 >= (unint64_t)v15;
        if ((id)a3 == v15 || v17)
        {
          v19 = objc_msgSend(v14, "lineIndexForCharIndex:eol:", a3, 0);
          if (v19 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v20 = (__int128 *)objc_msgSend(v14, "lineFragmentAtIndex:", v19);
            if (v20)
            {
              if (*((uint64_t *)v20 + 3) < 0)
                v21 = &xmmword_100EEE418;
              else
                v21 = v20;
              if (*(_QWORD *)v21 == a3)
              {
                v58 = 0;
                v56 = 0u;
                v57 = 0u;
                v54 = 0u;
                v55 = 0u;
                v52 = 0u;
                v53 = 0u;
                v50 = 0u;
                v51 = 0u;
                v48 = 0u;
                v49 = 0u;
                v46 = 0u;
                v47 = 0u;
                v44 = 0u;
                v45 = 0u;
                v42 = 0u;
                v43 = 0u;
                v40 = 0u;
                v41 = 0u;
                v38 = 0u;
                v39 = 0u;
                if (v14)
                {
                  objc_msgSend(v14, "lineMetricsAtCharIndex:allowEndOfLine:", a3, 0);
                  v22 = *((double *)&v47 + 1);
                  v23 = *(double *)&v47;
                  v24 = *((double *)&v48 + 1);
                  v25 = *(double *)&v48;
                  objc_msgSend(v14, "transformFromWP");
                }
                else
                {
                  v24 = 0.0;
                  v25 = 0.0;
                  v22 = 0.0;
                  v23 = 0.0;
                  memset(&v33, 0, sizeof(v33));
                }
                v60.origin.x = v23;
                v60.origin.y = v22;
                v60.size.width = v25;
                v60.size.height = v24;
                v61 = CGRectApplyAffineTransform(v60, &v33);
                x = v61.origin.x;
                y = v61.origin.y;
                width = v61.size.width;
                height = v61.size.height;
              }
            }
            else
            {
              +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101244A48);
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                sub_100E0C9AC();
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101244A68);
              v26 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
              {
                objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                sub_100DE7E60();
              }

              v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPColumn labelRectForCharIndex:withColumns:]"));
              v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 2304, 0, "invalid nil value for '%{public}s'", "lf");

            }
          }
          goto LABEL_36;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v59, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_36:

  v29 = x;
  v30 = y;
  v31 = width;
  v32 = height;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGRect)columnRectForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  NSUInteger v10;
  CRLWPLineFragmentArray *ptr;
  unint64_t **v12;
  unint64_t **v13;
  NSRange *v14;
  NSRange v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGAffineTransform v26;
  void *__p[3];
  NSRange v28;
  NSRange v29;
  NSRange v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v35;

  length = a3.length;
  location = a3.location;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v30.location = (NSUInteger)-[CRLWPColumn range](self, "range");
  v30.length = v10;
  v28.location = location;
  v28.length = length;
  if (NSIntersectionRange(v28, v30).length)
  {
    ptr = self->_lineFragmentArray.__ptr_;
    v12 = *(unint64_t ***)ptr;
    v13 = (unint64_t **)*((_QWORD *)ptr + 1);
    if (*(unint64_t ***)ptr != v13)
    {
      do
      {
        v14 = (NSRange *)*v12;
        if (((*v12)[3] & 0x8000000000000000) != 0)
          v14 = (NSRange *)&xmmword_100EEE418;
        v29.location = location;
        v29.length = length;
        v15 = NSIntersectionRange(v29, *v14);
        if (v15.length)
        {
          sub_10013E9D0(*v12, v15.location, v15.length, 1, 1, 0, 0, (char **)__p);
          sub_1001B29B0((CGRect **)__p);
          v17 = v16;
          v19 = v18;
          v21 = v20;
          v23 = v22;
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          v31.origin.x = x;
          v31.origin.y = y;
          v31.size.width = width;
          v31.size.height = height;
          v35.origin.x = v17;
          v35.origin.y = v19;
          v35.size.width = v21;
          v35.size.height = v23;
          v32 = CGRectUnion(v31, v35);
          x = v32.origin.x;
          y = v32.origin.y;
          width = v32.size.width;
          height = v32.size.height;
        }
        v12 += 2;
      }
      while (v12 != v13);
    }
  }
  v24 = self->_frameBounds.origin.x;
  v25 = self->_frameBounds.size.width;
  -[CRLWPColumn transformFromWP](self, "transformFromWP");
  v33.origin.x = v24;
  v33.origin.y = y;
  v33.size.width = v25;
  v33.size.height = height;
  return CGRectApplyAffineTransform(v33, &v26);
}

- (CGRect)typographicBounds
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CRLWPLineFragmentArray *ptr;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  CGAffineTransform v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v16;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  ptr = self->_lineFragmentArray.__ptr_;
  v8 = *(uint64_t **)ptr;
  v9 = (uint64_t *)*((_QWORD *)ptr + 1);
  while (v8 != v9)
  {
    v10 = *v8;
    v8 += 2;
    v12.origin.x = sub_100144908(v10);
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v13 = CGRectUnion(v12, v16);
    x = v13.origin.x;
    y = v13.origin.y;
    width = v13.size.width;
    height = v13.size.height;
  }
  -[CRLWPColumn transformFromWP](self, "transformFromWP");
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  return CGRectApplyAffineTransform(v14, &v11);
}

- (id)lineSelectionsForSelection:(id)a3
{
  CRLWPSelection *v4;
  void *v5;
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  NSRange v9;
  CRLWPLineFragmentArray *ptr;
  NSUInteger **v11;
  NSUInteger **v12;
  NSUInteger v13;
  NSUInteger *v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  BOOL v18;
  CRLWPSelection *v20;
  NSRange v21;
  CRLWPSelection *v22;
  CRLWPSelection *v25;
  NSRange v26;
  NSRange v27;
  NSRange v28;
  NSRange v29;
  NSRange v30;
  NSRange v31;

  v4 = (CRLWPSelection *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
  v6 = -[CRLWPColumn range](self, "range");
  v8 = v7;
  v27.location = (NSUInteger)-[CRLWPSelection range](v4, "range");
  v28.location = (NSUInteger)v6;
  v28.length = v8;
  v9 = NSIntersectionRange(v27, v28);
  if (!v9.length
    || (ptr = self->_lineFragmentArray.__ptr_,
        v11 = *(NSUInteger ***)ptr,
        v12 = (NSUInteger **)*((_QWORD *)ptr + 1),
        *(NSUInteger ***)ptr == v12))
  {
    v22 = v4;
    goto LABEL_27;
  }
  v13 = v9.length + v9.location - 1;
  while (1)
  {
    v14 = *v11;
    if (((*v11)[3] & 0x8000000000000000) != 0)
      v14 = (NSUInteger *)&xmmword_100EEE418;
    v16 = *v14;
    v15 = v14[1];
    v18 = v9.location >= *v14;
    v17 = v9.location - *v14;
    v18 = !v18 || v17 >= v15;
    if (v18)
      break;
    v20 = [CRLWPSelection alloc];
    v30.location = v16;
    v30.length = v15;
    v21 = NSIntersectionRange(v9, v30);
    v22 = -[CRLWPSelection initWithRange:](v20, "initWithRange:", v21.location, v21.length);

    objc_msgSend(v5, "addObject:", v22);
    if (v13 >= v16 && v13 - v16 < v15)
      goto LABEL_27;
LABEL_24:
    v11 += 2;
    v4 = v22;
    if (v11 == v12)
      goto LABEL_27;
  }
  if (v13 < v16 || v13 - v16 >= v15)
  {
    v29.location = v16;
    v29.length = v15;
    if (NSIntersectionRange(v9, v29).length)
    {
      v22 = -[CRLWPSelection initWithRange:]([CRLWPSelection alloc], "initWithRange:", v16, v15);

      objc_msgSend(v5, "addObject:", v22);
    }
    else
    {
      v22 = v4;
    }
    goto LABEL_24;
  }
  v25 = [CRLWPSelection alloc];
  v31.location = v16;
  v31.length = v15;
  v26 = NSIntersectionRange(v9, v31);
  v22 = -[CRLWPSelection initWithRange:](v25, "initWithRange:", v26.location, v26.length);

  objc_msgSend(v5, "addObject:", v22);
LABEL_27:

  return v5;
}

+ (BOOL)partitionedAttachmentStartsAtCharIndex:(unint64_t)a3 withColumns:(id)a4
{
  unint64_t v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPColumn columnForCharIndex:allowEndOfColumn:withColumns:](CRLWPColumn, "columnForCharIndex:allowEndOfColumn:withColumns:", a3, 1, a4));
  LOBYTE(v4) = objc_msgSend(v5, "p_isFirstPartitionForCharIndex:", v4);

  return v4;
}

- (BOOL)p_isFirstPartitionForCharIndex:(unint64_t)a3
{
  CRLWPLineFragmentArray *ptr;
  __int128 **v4;
  __int128 **v5;
  __int128 *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __int128 *v10;
  BOOL v11;
  uint64_t v12;

  ptr = self->_lineFragmentArray.__ptr_;
  v4 = *(__int128 ***)ptr;
  v5 = (__int128 **)*((_QWORD *)ptr + 1);
  if (v4 == v5)
    return 0;
  while (1)
  {
    v6 = *v4;
    v7 = *((_QWORD *)*v4 + 3);
    if ((v7 & 0x200) != 0)
    {
      if (v7 < 0)
        v6 = &xmmword_100EEE418;
      v10 = v6;
      v8 = *(_QWORD *)v6;
      v9 = *((_QWORD *)v10 + 1);
      v11 = a3 - v8 < v9 && a3 >= v8;
      v12 = v8 + v9;
      if (v11 || v12 == a3)
        break;
    }
    v4 += 2;
    if (v4 == v5)
      return 0;
  }
  return 1;
}

- (CGRect)firstRectForSelection:(id)a3 includeSpaceAfter:(BOOL)a4 includeSpaceBefore:(BOOL)a5 includeLeading:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  CGRect result;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v15 = objc_msgSend(v10, "range");
  BYTE2(v28) = 0;
  LOWORD(v28) = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:", v15, v16, objc_msgSend(v10, "type"), v8, v7, v6, v28, 0, 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPColumn pTransformReturnRects:](self, "pTransformReturnRects:", v17));

  if (objc_msgSend(v18, "count"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
    objc_msgSend(v19, "CGRectValue");
    x = v20;
    y = v21;
    width = v22;
    height = v23;

  }
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (const)pColumnEndingPartitionedLineFragmentInSelectionRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  const void *result;

  length = a3.length;
  location = a3.location;
  result = -[CRLWPColumn lineCount](self, "lineCount");
  if (result)
  {
    result = -[CRLWPColumn lineFragmentAtIndex:](self, "lineFragmentAtIndex:", (char *)result - 1);
    if ((*((_QWORD *)result + 3) & 0x101) == 1)
    {
      if (*(_QWORD *)result - location >= length || *(_QWORD *)result < location)
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)pMutableRectsForSelectionRange:(_NSRange)a3 selectionType:(unint64_t)a4 includeSpaceAfter:(BOOL)a5 includeSpaceBefore:(BOOL)a6 includeLeading:(BOOL)a7 forParagraphMode:(BOOL)a8 includeRuby:(BOOL)a9 includePaginatedAttachments:(BOOL)a10 inranges:(id)a11 outranges:(id *)a12
{
  id v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  NSUInteger v19;
  double v20;
  NSRange v21;
  NSUInteger length;
  void *v23;
  CRLWPLineFragmentArray *ptr;
  unint64_t **v25;
  char *v26;
  NSUInteger *v27;
  NSUInteger v28;
  NSUInteger v29;
  CGFloat MaxY;
  double v31;
  NSRange v32;
  uint64_t v33;
  int v34;
  unsigned __int8 v35;
  char v36;
  double *v37;
  void *v38;
  unint64_t *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *i;
  NSUInteger v45;
  NSRange v46;
  BOOL v47;
  BOOL v48;
  char *v49;
  _BYTE *v50;
  _BYTE *v51;
  unsigned int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double *v57;
  double *v58;
  unsigned int v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  void *v71;
  _BYTE *v72;
  _BYTE *v73;
  void *v74;
  double x;
  double v76;
  CGFloat y;
  double v78;
  CGFloat width;
  double v80;
  CGFloat height;
  void *v82;
  double v83;
  CGFloat v84;
  double v85;
  double v86;
  double v87;
  CGFloat v88;
  double v89;
  double v90;
  void *v91;
  BOOL v92;
  BOOL v93;
  _BYTE *v94;
  _BYTE *v95;
  id v96;
  void *v97;
  double v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  void *v109;
  double *v110;
  uint64_t v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  unint64_t v118;
  void *v119;
  __int128 *v120;
  void *v121;
  id v122;
  id v123;
  double v124;
  NSUInteger v125;
  NSUInteger range1;
  double v127;
  CRLWPColumn *v128;
  unint64_t **v129;
  NSUInteger v130;
  NSUInteger v131;
  char *v132;
  double v133;
  id v135;
  id v136;
  NSUInteger v137;
  NSUInteger location;
  _BOOL4 v139;
  _BOOL4 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  void *__p;
  void *__dst;
  uint64_t v147;
  uint8_t buf[8];
  _BYTE v149[10];
  __int16 v150;
  const char *v151;
  __int16 v152;
  int v153;
  __int16 v154;
  uint64_t v155;
  __int16 v156;
  id v157;
  _BYTE v158[128];
  NSRange v159;
  NSRange v160;
  NSRange v161;
  NSRange v162;
  NSRange v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;

  v139 = a6;
  v140 = a5;
  range1 = a3.length;
  location = a3.location;
  v14 = a11;
  v128 = self;
  v15 = -[CRLWPStorage length](self->_storage, "length");
  if (a12)
  {
    v136 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1)));
    *a12 = v136;
  }
  else
  {
    v136 = 0;
  }
  if (v15 < location + range1 || (v16 = -[CRLWPColumn range](v128, "range"), v15 < (unint64_t)v16 + v17))
  {
    v135 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    goto LABEL_7;
  }
  v135 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
  v161.location = (NSUInteger)-[CRLWPColumn range](v128, "range");
  v161.length = v19;
  v159.location = location;
  v159.length = range1;
  v21 = NSIntersectionRange(v159, v161);
  length = v21.length;
  if (v21.length)
  {
    if (v14)
    {
      if (a4 == 7)
        a4 = 0;
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", location, range1));
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v23));

    }
    ptr = v128->_lineFragmentArray.__ptr_;
    v25 = *(unint64_t ***)ptr;
    v129 = (unint64_t **)*((_QWORD *)ptr + 1);
    if (*(unint64_t ***)ptr != v129)
    {
      v26 = 0;
      v137 = location + range1 - 1;
      v125 = v21.length + v21.location - 1;
      v133 = -1.0;
      v127 = 0.0;
      v124 = 0.0;
      v122 = v14;
      while (1)
      {
        while (1)
        {
          v27 = (NSUInteger *)&xmmword_100EEE418;
          if (((*v25)[3] & 0x8000000000000000) == 0)
            v27 = *v25;
          v29 = *v27;
          v28 = v27[1];
          if (*((double *)*v25 + 4) != v133)
          {
            v26 = (char *)objc_msgSend(v135, "count");
            MaxY = CGRectGetMaxY(*(CGRect *)(*v25 + 5));
            v133 = *((double *)*v25 + 4);
            v124 = *((double *)*v25 + 17);
            v31 = MaxY - (v133 + v124);
            if (*((double *)*v25 + 19) < v31)
              v31 = *((double *)*v25 + 19);
            v127 = fmax(v31, 0.0);
          }
          v160.location = v21.location;
          v160.length = length;
          v162.location = v29;
          v162.length = v28;
          v32 = NSIntersectionRange(v160, v162);
          if (v32.length)
            break;
          v25 += 2;
          if (v25 == v129)
            goto LABEL_104;
        }
        if (v32.length == 1)
        {
          v33 = -[CRLWPStorage characterAtIndex:](v128->_storage, "characterAtIndex:", v32.location);
          v34 = v33;
          v35 = sub_1001AE2A0(v33);
          if (v34 == 8232)
            v36 = 1;
          else
            v36 = v35;
        }
        else
        {
          v36 = 0;
        }
        v131 = v28;
        v132 = v26;
        v130 = v29;
        if (a8)
        {
          v37 = (double *)*v25;
        }
        else
        {
          if (!a10)
            goto LABEL_40;
          v37 = (double *)*v25;
          if (((*v25)[3] & 1) == 0)
            v36 = 1;
          if ((v36 & 1) != 0)
          {
LABEL_40:
            if (v136)
              v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            else
              v40 = 0;
            __p = 0;
            __dst = 0;
            v147 = 0;
            v141 = 0u;
            v142 = 0u;
            v143 = 0u;
            v144 = 0u;
            v41 = v14;
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v141, v158, 16);
            if (v42)
            {
              v43 = *(_QWORD *)v142;
              do
              {
                for (i = 0; i != v42; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v142 != v43)
                    objc_enumerationMutation(v41);
                  v163.location = (NSUInteger)objc_msgSend(*(id *)(*((_QWORD *)&v141 + 1) + 8 * (_QWORD)i), "rangeValue");
                  v163.length = v45;
                  v46 = NSIntersectionRange(v32, v163);
                  if (v46.length)
                  {
                    if (a4 != 7
                      || (location >= v46.location ? (v47 = location - v46.location >= v46.length) : (v47 = 1),
                          v47 && (v137 >= v46.location ? (v48 = v137 - v46.location >= v46.length) : (v48 = 1), v48)))
                    {
                      sub_10013E9D0(*v25, v46.location, v46.length, v140, v139, a9, v40, (char **)buf);
                    }
                    else
                    {
                      sub_100141BAC((uint64_t)*v25, v46.location, v46.length, location, v137, v140, v139, a9, (void **)buf, v40);
                    }
                    v49 = *(char **)buf;
                    sub_100134D10((uint64_t)&__p, (uint64_t)__dst, *(char **)buf, *(char **)v149, (uint64_t)(*(_QWORD *)v149 - *(_QWORD *)buf) >> 5);
                    if (v49)
                      operator delete(v49);
                  }
                }
                v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v141, v158, 16);
              }
              while (v42);
            }

            v14 = v122;
            v123 = objc_msgSend(v135, "count");
            if (v136)
            {
              v51 = __p;
              v50 = __dst;
              if (objc_msgSend(v40, "count") != (id)((v50 - v51) >> 5))
              {
                v52 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_101244A88);
                v53 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_ERROR))
                {
                  v95 = __p;
                  v94 = __dst;
                  v96 = objc_msgSend(v40, "count");
                  *(_DWORD *)buf = 67110402;
                  *(_DWORD *)&buf[4] = v52;
                  *(_WORD *)v149 = 2082;
                  *(_QWORD *)&v149[2] = "-[CRLWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:inc"
                                        "ludeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAtta"
                                        "chments:inranges:outranges:]";
                  v150 = 2082;
                  v151 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm";
                  v152 = 1024;
                  v153 = 2541;
                  v154 = 2048;
                  v155 = (v94 - v95) >> 5;
                  v156 = 2048;
                  v157 = v96;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v53, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Mismatch between rect & range count: %lu vs. %lu", buf, 0x36u);
                }

                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_101244AA8);
                v54 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_ERROR))
                {
                  v97 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&buf[4] = v52;
                  *(_WORD *)v149 = 2114;
                  *(_QWORD *)&v149[2] = v97;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v54, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

                }
                v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:]"));
                v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"));
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v55, v56, 2541, 0, "Mismatch between rect & range count: %lu vs. %lu", ((_BYTE *)__dst - (_BYTE *)__p) >> 5, objc_msgSend(v40, "count"));

              }
            }
            v57 = (double *)__p;
            v58 = (double *)__dst;
            if (__p != __dst)
            {
              v59 = 0;
              do
              {
                v60 = *v57;
                v61 = v57[1];
                v63 = v57[2];
                v62 = v57[3];
                if (a7)
                {
                  v64 = *((double *)*v25 + 4);
                  v65 = *((double *)*v25 + 17);
                  v66 = *((double *)*v25 + 19);
                  v67 = *v57;
                  v68 = *((_QWORD *)v57 + 1);
                  v69 = *((_QWORD *)v57 + 2);
                  v70 = CGRectGetMaxY(*(CGRect *)(&v62 - 3));
                  if (v70 < v64 + v65 + v66)
                    v70 = v64 + v65 + v66;
                  v62 = v70 - v61;
                }
                v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v60, v61, v63, v62));
                objc_msgSend(v135, "addObject:", v71);

                if (v136)
                {
                  v73 = __p;
                  v72 = __dst;
                  if (objc_msgSend(v40, "count") == (id)((v72 - v73) >> 5))
                  {
                    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectAtIndexedSubscript:", v59));
                    objc_msgSend(v136, "addObject:", v74);

                    ++v59;
                  }
                }
                v57 += 4;
              }
              while (v57 != v58);
            }
            if (a4 == 2)
            {
              x = sub_10014409C((uint64_t)*v25);
              y = v76;
              width = v78;
              height = v80;
            }
            else
            {
              x = CGRectNull.origin.x;
              y = CGRectNull.origin.y;
              width = CGRectNull.size.width;
              height = CGRectNull.size.height;
            }
            v164.origin.x = x;
            v164.origin.y = y;
            v164.size.width = width;
            v164.size.height = height;
            if (!CGRectIsEmpty(v164) && v123 < objc_msgSend(v135, "count"))
            {
              v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "objectAtIndexedSubscript:", v123));
              objc_msgSend(v82, "CGRectValue");
              v84 = v83;
              v86 = v85;
              v88 = v87;
              v90 = v89;

              v165.origin.x = v84;
              v165.origin.y = v86;
              v165.size.width = v88;
              v165.size.height = v90;
              v168.origin.x = x;
              v168.origin.y = y;
              v168.size.width = width;
              v168.size.height = height;
              v166 = CGRectUnion(v165, v168);
              v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v166.origin.x, v86, v166.size.width, v90));
              objc_msgSend(v135, "setObject:atIndexedSubscript:", v91, v123);

            }
            if (__p)
            {
              __dst = __p;
              operator delete(__p);
            }
            goto LABEL_95;
          }
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v37[5], v37[6], v37[7], v37[8]));
        objc_msgSend(v135, "addObject:", v38);

        if (v136)
        {
          v39 = *v25;
          if (((*v25)[3] & 0x8000000000000000) != 0)
            v39 = (unint64_t *)&xmmword_100EEE418;
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", *v39, v39[1]));
          objc_msgSend(v136, "addObject:", v40);
LABEL_95:

        }
        length = v21.length;
        v92 = v125 - v130 < v131 && v125 >= v130;
        v25 += 2;
        v93 = v92 || v25 == v129;
        v26 = v132;
        if (v93)
        {
LABEL_104:
          v20 = v127;
          if (v127 > 0.0 && v140)
          {
            v98 = v133 + v124 + v127;
            while (v26 < objc_msgSend(v135, "count"))
            {
              v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "objectAtIndexedSubscript:", v26));
              objc_msgSend(v99, "CGRectValue");
              v101 = v100;
              v103 = v102;
              v105 = v104;
              v107 = v106;

              v167.origin.x = v101;
              v167.origin.y = v103;
              v167.size.width = v105;
              v167.size.height = v107;
              v108 = CGRectGetMaxY(v167);
              if (v98 == v108 || vabdd_f64(v98, v108) < 0.00999999978)
              {
                v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v101, v103, v105, v107 - v127));
                objc_msgSend(v135, "setObject:atIndexedSubscript:", v109, v26);

              }
              ++v26;
            }
          }
          break;
        }
      }
    }
  }
  v110 = -[CRLWPColumn pColumnEndingPartitionedLineFragmentInSelectionRange:](v128, "pColumnEndingPartitionedLineFragmentInSelectionRange:", location, range1, v20);
  v111 = (uint64_t)v110;
  if (v110)
  {
    v112 = v110[6];
    v113 = v110[8];
    if (a8)
    {
      v114 = v110[5];
      v115 = v110[7];
    }
    else
    {
      if (!v140)
        v113 = v110[17] + v110[13] + v110[18] + v110[15];
      if (v139)
        v116 = -0.0;
      else
        v116 = v110[13];
      if (v139)
        v117 = 0.0;
      else
        v117 = v110[13];
      v118 = *(_QWORD *)v110;
      v114 = sub_10013F8F8((uint64_t)v110, *(_QWORD *)v110, 1, 1, 0);
      v112 = v112 + v116;
      v113 = v113 - v117;
      v115 = sub_10013F8F8(v111, v118 + 1, 1, 1, 0) - v114;
    }
    v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v114, v112, v115, v113));
    objc_msgSend(v135, "addObject:", v119);

    if (v136)
    {
      if (*(uint64_t *)(v111 + 24) < 0)
        v120 = &xmmword_100EEE418;
      else
        v120 = (__int128 *)v111;
      v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", *(_QWORD *)v120, *((_QWORD *)v120 + 1)));
      objc_msgSend(v136, "addObject:", v121);

    }
  }
LABEL_7:

  return v135;
}

- (id)pTransformReturnRects:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  CGAffineTransform v18;
  CGRect v19;
  CGRect v20;

  v4 = a3;
  if (-[CRLWPColumn textIsVertical](self, "textIsVertical"))
  {
    v5 = (char *)objc_msgSend(v4, "count");
    if (v5)
    {
      v6 = 0;
      do
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v6));
        objc_msgSend(v7, "CGRectValue");
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;

        -[CRLWPColumn transformFromWP](self, "transformFromWP");
        v19.origin.x = v9;
        v19.origin.y = v11;
        v19.size.width = v13;
        v19.size.height = v15;
        v20 = CGRectApplyAffineTransform(v19, &v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height));
        objc_msgSend(v4, "setObject:atIndexedSubscript:", v16, v6);

        ++v6;
      }
      while (v5 != v6);
    }
  }
  return v4;
}

- (id)rectsForSelectionRanges:(id)a3 selectionType:(unint64_t)a4
{
  NSUInteger v6;
  NSUInteger v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  NSUInteger v14;
  id location;
  NSUInteger length;
  NSRange v17;
  void *v18;
  void *v19;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  NSRange v27;
  NSRange v28;

  v6 = 0x7FFFFFFFFFFFFFFFLL;
  v7 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (v6 == 0x7FFFFFFFFFFFFFFFLL && v7 == 0)
        {
          location = objc_msgSend(v12, "rangeValue");
        }
        else
        {
          v28.location = (NSUInteger)objc_msgSend(v12, "rangeValue");
          v28.length = v14;
          v27.location = v6;
          v27.length = v7;
          v17 = NSUnionRange(v27, v28);
          length = v17.length;
          location = (id)v17.location;
        }
        v6 = (NSUInteger)location;
        v7 = length;
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  BYTE2(v21) = 0;
  LOWORD(v21) = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:", v6, v7, a4, 1, 1, 0, v21, v8, 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPColumn pTransformReturnRects:](self, "pTransformReturnRects:", v18));

  return v19;
}

- (id)rectsForSelectionRange:(_NSRange)a3 selectionType:(unint64_t)a4 forParagraphMode:(BOOL)a5 includeRuby:(BOOL)a6 includePaginatedAttachments:(BOOL)a7
{
  void *v8;
  void *v9;
  uint64_t v11;

  BYTE2(v11) = a7;
  BYTE1(v11) = a6;
  LOBYTE(v11) = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:", a3.location, a3.length, a4, 1, 1, 0, v11, 0, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPColumn pTransformReturnRects:](self, "pTransformReturnRects:", v8));

  return v9;
}

- (id)rectsForSelection:(id)a3 ranges:(id *)a4
{
  return (id)objc_claimAutoreleasedReturnValue(-[CRLWPColumn rectsForSelection:ranges:includePaginatedAttachments:](self, "rectsForSelection:ranges:includePaginatedAttachments:", a3, a4, 0));
}

- (id)naturalRectsForSelection:(id)a3 ranges:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v6 = a3;
  v7 = objc_msgSend(v6, "range");
  BYTE2(v11) = 0;
  LOWORD(v11) = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:", v7, v8, objc_msgSend(v6, "type"), 1, 1, 0, v11, 0, a4));

  return v9;
}

- (id)rectsForSelection:(id)a3 ranges:(id *)a4 includePaginatedAttachments:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v8 = a3;
  v9 = objc_msgSend(v8, "range");
  BYTE2(v14) = a5;
  LOWORD(v14) = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:", v9, v10, objc_msgSend(v8, "type"), 1, 1, 0, v14, 0, a4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPColumn pTransformReturnRects:](self, "pTransformReturnRects:", v11));

  return v12;
}

- (CGRect)erasableRectForSelectionRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSUInteger v10;
  NSRange v11;
  CRLWPLineFragmentArray *ptr;
  NSRange **v13;
  NSRange **v14;
  NSRange *v15;
  CGAffineTransform v16;
  NSRange v17;
  NSRange v18;
  CGRect v19;
  CGRect v20;
  CGRect v22;

  length = a3.length;
  location = a3.location;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v18.location = (NSUInteger)-[CRLWPColumn range](self, "range");
  v18.length = v10;
  v17.location = location;
  v17.length = length;
  v11 = NSIntersectionRange(v17, v18);
  if (v11.length)
  {
    ptr = self->_lineFragmentArray.__ptr_;
    v13 = *(NSRange ***)ptr;
    v14 = (NSRange **)*((_QWORD *)ptr + 1);
    if (*(NSRange ***)ptr != v14)
    {
      do
      {
        v15 = *v13;
        if (((*v13)[1].length & 0x8000000000000000) != 0)
          v15 = (NSRange *)&xmmword_100EEE418;
        if (NSIntersectionRange(v11, *v15).length)
        {
          v22.origin.x = x;
          v22.origin.y = y;
          v22.size.width = width;
          v22.size.height = height;
          v19 = CGRectUnion(*(CGRect *)&(*v13)[4].length, v22);
          x = v19.origin.x;
          y = v19.origin.y;
          width = v19.size.width;
          height = v19.size.height;
        }
        v13 += 2;
      }
      while (v13 != v14);
    }
  }
  -[CRLWPColumn transformFromWP](self, "transformFromWP");
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  return CGRectApplyAffineTransform(v20, &v16);
}

- (id)drawableIntersectionRectsForSelection:(id)a3 inTarget:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double x;
  double v16;
  double width;
  double v18;
  CGFloat height;
  double MinX;
  double v21;
  unint64_t v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double MinY;
  unint64_t characterCount;
  unint64_t startCharIndex;
  double MaxX;
  void *v36;
  void *v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat MaxY;
  CGFloat v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  char *v58;
  char *v59;
  void *v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  id v80;
  id v81;
  CGFloat rect;
  CGFloat recta;
  _QWORD v84[4];
  CGAffineTransform v85;
  _QWORD v86[4];
  _QWORD v87[4];
  _QWORD v88[4];
  _QWORD v89[5];
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

  v80 = a3;
  v81 = a4;
  v6 = objc_msgSend(v80, "range");
  BYTE2(v75) = 0;
  LOWORD(v75) = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:", v6, v7, objc_msgSend(v80, "type"), 1, 1, 0, v75, 0, 0));
  v9 = (char *)objc_msgSend(v8, "count");
  if (v9)
  {
    v10 = 0;
    v11 = 1;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v10));
      objc_msgSend(v12, "CGRectValue");
      rect = v13;
      x = v14;
      width = v16;
      height = v18;

      if (v10 || (unint64_t)objc_msgSend(v80, "start") < self->_startCharIndex)
      {
        v90.origin.x = x;
        v90.origin.y = rect;
        v90.size.width = width;
        v90.size.height = height;
        MinX = CGRectGetMinX(v90);
        v21 = MinX - CGRectGetMinX(self->_frameBounds);
        x = x - v21;
        width = width + v21;
      }
      v22 = (unint64_t)(v10 + 1);
      if (v10 + 1 < v9)
      {
        while (1)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v10 + 1));
          objc_msgSend(v23, "CGRectValue");
          v25 = v24;
          v27 = v26;
          v29 = v28;
          v31 = v30;

          v91.origin.x = v25;
          v91.origin.y = v27;
          v91.size.width = v29;
          v91.size.height = v31;
          MinY = CGRectGetMinY(v91);
          v92.origin.x = x;
          v92.origin.y = rect;
          v92.size.width = width;
          v92.size.height = height;
          if (MinY != CGRectGetMinY(v92))
            break;
          v93.origin.x = x;
          v93.origin.y = rect;
          v93.size.width = width;
          v93.size.height = height;
          v101.origin.x = v25;
          v101.origin.y = v27;
          v101.size.width = v29;
          v101.size.height = v31;
          v94 = CGRectUnion(v93, v101);
          rect = v94.origin.y;
          x = v94.origin.x;
          width = v94.size.width;
          height = v94.size.height;
          objc_msgSend(v8, "removeObjectAtIndex:", v10 + 1);
          if (v22 >= (unint64_t)--v9)
          {
            v9 = (char *)v11;
            break;
          }
        }
      }
      if (v10 != v9 - 1
        || (startCharIndex = self->_startCharIndex,
            characterCount = self->_characterCount,
            characterCount + startCharIndex <= (unint64_t)objc_msgSend(v80, "end")))
      {
        MaxX = CGRectGetMaxX(self->_frameBounds);
        v95.origin.x = x;
        v95.origin.y = rect;
        v95.size.width = width;
        v95.size.height = height;
        width = width + MaxX - CGRectGetMaxX(v95);
      }
      *(double *)v89 = x;
      *(CGFloat *)&v89[1] = rect;
      *(double *)&v89[2] = width;
      *(CGFloat *)&v89[3] = height;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v89, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
      objc_msgSend(v8, "setObject:atIndexedSubscript:", v36, v10);

      ++v11;
      ++v10;
    }
    while (v22 < (unint64_t)v9);
  }
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    objc_msgSend(v37, "CGRectValue");
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
    objc_msgSend(v46, "CGRectValue");
    recta = v47;
    v78 = v49;
    v79 = v48;
    v77 = v50;

    v76 = CGRectGetMinX(self->_frameBounds);
    v96.origin.x = v39;
    v96.origin.y = v41;
    v96.size.width = v43;
    v96.size.height = v45;
    MaxY = CGRectGetMaxY(v96);
    v52 = CGRectGetWidth(self->_frameBounds);
    v97.origin.x = recta;
    v97.size.width = v78;
    v97.origin.y = v79;
    v97.size.height = v77;
    v53 = CGRectGetMinY(v97);
    v98.origin.x = v39;
    v98.origin.y = v41;
    v98.size.width = v43;
    v98.size.height = v45;
    v54 = CGRectGetMaxY(v98);
    objc_msgSend(v8, "removeAllObjects");
    *(CGFloat *)v88 = v39;
    *(CGFloat *)&v88[1] = v41;
    *(CGFloat *)&v88[2] = v43;
    *(CGFloat *)&v88[3] = v45;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v88, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
    objc_msgSend(v8, "addObject:", v55);

    *(CGFloat *)v87 = v76;
    *(CGFloat *)&v87[1] = MaxY;
    *(CGFloat *)&v87[2] = v52;
    *(double *)&v87[3] = v53 - v54;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v87, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
    objc_msgSend(v8, "addObject:", v56);

    *(CGFloat *)v86 = recta;
    *(CGFloat *)&v86[1] = v79;
    *(CGFloat *)&v86[2] = v78;
    *(CGFloat *)&v86[3] = v77;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v86, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
    objc_msgSend(v8, "addObject:", v57);

  }
  v58 = (char *)objc_msgSend(v8, "count");
  if (v58)
  {
    v59 = 0;
    do
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v59));
      objc_msgSend(v60, "CGRectValue");
      v62 = v61;
      v64 = v63;
      v66 = v65;
      v68 = v67;

      -[CRLWPColumn transformFromWP](self, "transformFromWP");
      v99.origin.x = v62;
      v99.origin.y = v64;
      v99.size.width = v66;
      v99.size.height = v68;
      v100 = CGRectApplyAffineTransform(v99, &v85);
      objc_msgSend(v81, "rectInRoot:", v100.origin.x, v100.origin.y, v100.size.width, v100.size.height);
      v84[0] = v69;
      v84[1] = v70;
      v84[2] = v71;
      v84[3] = v72;
      v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v84, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
      objc_msgSend(v8, "setObject:atIndexedSubscript:", v73, v59);

      ++v59;
    }
    while (v58 != v59);
  }

  return v8;
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 constrainToAscentAndDescent:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 leadingEdge:(BOOL *)a9
{
  return -[CRLWPColumn charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:constrainToAscentAndDescent:isAtEndOfLine:outFragment:leadingEdge:](self, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:constrainToAscentAndDescent:isAtEndOfLine:outFragment:leadingEdge:", a4, a5, a6, a7, a8, 0, a3.x, a3.y, a9);
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8
{
  return -[CRLWPColumn charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:constrainToAscentAndDescent:isAtEndOfLine:outFragment:leadingEdge:](self, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:constrainToAscentAndDescent:isAtEndOfLine:outFragment:leadingEdge:", a4, a5, a6, 0, a7, 0, a3.x, a3.y, a8);
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 outFragment:(const CRLWPLineFragment *)a8 leadingEdge:(BOOL *)a9
{
  return -[CRLWPColumn charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:constrainToAscentAndDescent:isAtEndOfLine:outFragment:leadingEdge:](self, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:constrainToAscentAndDescent:isAtEndOfLine:outFragment:leadingEdge:", a4, a5, a6, 0, a7, a8, a3.x, a3.y, a9);
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 constrainToAscentAndDescent:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 outFragment:(const CRLWPLineFragment *)a9 leadingEdge:(BOOL *)a10
{
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  float64x2_t v17;
  uint64_t v18;
  __int128 *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  void *v24;
  unint64_t v25;
  unsigned int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  unsigned int v34;
  int v35;
  uint64_t v36;
  __int128 *v37;
  uint64_t v38;
  _TtC8Freeform12CRLWPStorage *v39;
  uint64_t v40;
  id v41;
  _TtC8Freeform12CRLWPStorage *v42;
  double y;
  double x;
  __int128 *v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  BOOL v50;
  uint8_t buf[4];
  unsigned int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  unint64_t v60;
  __int16 v61;
  unint64_t v62;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  y = a3.y;
  x = a3.x;
  v50 = 1;
  -[CRLWPColumn transformToWP](self, "transformToWP");
  v17 = vaddq_f64(v49, vmlaq_n_f64(vmulq_n_f64(v48, y), v47, x));
  v46 = 0;
  if (a8)
    *a8 = 0;
  v18 = -[CRLWPColumn charIndexFromWPPoint:pastCenterGoesToNextChar:allowNotFound:constrainToAscentAndDescent:outFragment:leadingEdge:](self, "charIndexFromWPPoint:pastCenterGoesToNextChar:allowNotFound:constrainToAscentAndDescent:outFragment:leadingEdge:", v14, v13, v12, &v46, &v50, *(_OWORD *)&v17);
  if (v46 && v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (*((uint64_t *)v46 + 3) < 0)
      v19 = &xmmword_100EEE418;
    else
      v19 = v46;
    v21 = *(_QWORD *)v19;
    v20 = *((_QWORD *)v19 + 1);
    v22 = v18;
    if (!v50)
    {
      v23 = sub_10013DFB8((uint64_t)v46);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v22 = sub_1001AF294(v18, v24);

    }
    if (v20 && v22 == v21 + v20)
    {
      v25 = -[CRLWPStorage length](self->_storage, "length");
      if (v22 <= v25)
      {
        v31 = v22 - 1;
        v32 = -[CRLWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", v31);
        v33 = v32;
        v34 = sub_1001AE2A0(v32);
        if (v33 == 8232)
          v35 = 1;
        else
          v35 = v34;
        if (v35 != 1 || a4)
        {
          if (a8)
            *a8 = 1;
        }
        else
        {
          v50 = 1;
          v18 = v31;
        }
      }
      else
      {
        v26 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101244AC8);
        v27 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67110402;
          v52 = v26;
          v53 = 2082;
          v54 = "-[CRLWPColumn charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:constrainToAscent"
                "AndDescent:isAtEndOfLine:outFragment:leadingEdge:]";
          v55 = 2082;
          v56 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm";
          v57 = 1024;
          v58 = 2801;
          v59 = 2048;
          v60 = v22;
          v61 = 2048;
          v62 = v25;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Bad charIndex %lu <= %lu", buf, 0x36u);
        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101244AE8);
        v28 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:constrainToAscentAndDescent:isAtEndOfLine:outFragment:leadingEdge:]"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 2801, 0, "Bad charIndex %lu <= %lu", v22, v25);

        v18 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    if (a9)
      *a9 = (const CRLWPLineFragment *)v46;
  }
  if (a10)
  {
    *a10 = v50;
    return v18;
  }
  if (!v50 && v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v46)
    {
      v36 = sub_100144A40(v46, v18);
      v37 = v46;
      if (!a4)
      {
        v38 = (*((_BYTE *)v46 + 25) & 0x10) != 0 ? sub_1001449A4((uint64_t)v46) : sub_100144974((uint64_t)v46);
        v40 = v38;
        v37 = v46;
        if (v18 == v40 && (v36 != 1) == (*((_BYTE *)v46 + 25) & 0x10) >> 4)
        {
          v42 = 0;
LABEL_47:

          return v18;
        }
      }
      v41 = sub_10013DFB8((uint64_t)v37);
      v39 = (_TtC8Freeform12CRLWPStorage *)objc_claimAutoreleasedReturnValue(v41);
    }
    else
    {
      v39 = self->_storage;
    }
    v42 = v39;
    if (v39)
      v18 = sub_1001AF294(v18, v39);
    goto LABEL_47;
  }
  return v18;
}

- (unint64_t)charIndexForSelectionFromPoint:(CGPoint)a3 isTail:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t result;
  void *v7;
  void *v8;
  void *v9;
  CRLWPLineFragmentArray *ptr;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  double MinY;
  CGFloat v23;
  __int128 *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  unint64_t v33;
  int64_t v34;
  BOOL v35;
  int64_t v36;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  __int128 *v42;
  unint64_t startCharIndex;
  unint64_t characterCount;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  double y;
  double x;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[CRLWPColumn transformToWP](self, "transformToWP");
  v45 = v52;
  v46 = v53;
  v47 = v51;
  v50 = vaddq_f64(v53, vmlaq_n_f64(vmulq_n_f64(v52, y), v51, x));
  if (v50.f64[1] < CGRectGetMinY(self->_frameBounds))
  {
    result = 0x7FFFFFFFFFFFFFFFLL;
    if (!v4)
    {
      result = self->_startCharIndex;
      if (result == 0x7FFFFFFFFFFFFFFFLL)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101244B08);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E0CA38();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101244B28);
        v7 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn charIndexForSelectionFromPoint:isTail:]"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 2860, 0, "column has unexpected start");

        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    return result;
  }
  ptr = self->_lineFragmentArray.__ptr_;
  v11 = *(uint64_t **)ptr;
  if (*(_QWORD *)ptr == *((_QWORD *)ptr + 1))
    goto LABEL_68;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    v13 = *v11;
    v14 = *(double *)(*v11 + 40);
    v15 = *(double *)(*v11 + 48);
    v16 = *(double *)(*v11 + 56);
    v17 = *(double *)(*v11 + 64);
    v54.origin.x = v14;
    v54.origin.y = v15;
    v54.size.width = v16;
    v54.size.height = v17;
    if (v50.f64[1] < CGRectGetMinY(v54))
      goto LABEL_65;
    if ((*(_BYTE *)(v13 + 28) & 1) != 0)
    {
      v18 = sub_1000610A4(v50.f64[0], v50.f64[1], v14, v15, v16, v17);
      v12 = sub_1001460C8(v13, -1, 0, v50.f64[0]);
      if (v18 == 0.0)
        goto LABEL_65;
      if ((*(_BYTE *)(v13 + 28) & 1) != 0)
      {
        v11 += 2;
        if (v11 == *((uint64_t **)self->_lineFragmentArray.__ptr_ + 1))
          goto LABEL_65;
        v13 = *v11;
        v14 = *(double *)(*v11 + 40);
        v15 = *(double *)(*v11 + 48);
        v16 = *(double *)(*v11 + 56);
        v17 = *(double *)(*v11 + 64);
      }
    }
    else
    {
      v18 = INFINITY;
    }
    v19 = 16;
    do
    {
      v20 = v19;
      v21 = (char *)v11 + v19;
      if (v21 == *((char **)self->_lineFragmentArray.__ptr_ + 1))
        break;
      MinY = CGRectGetMinY(*(CGRect *)(*(_QWORD *)v21 + 40));
      v55.origin.x = v14;
      v55.origin.y = v15;
      v55.size.width = v16;
      v55.size.height = v17;
      v23 = CGRectGetMinY(v55);
      v19 = v20 + 16;
    }
    while (MinY == v23);
    v56.origin.x = v14;
    v56.origin.y = v15;
    v56.size.width = v16;
    v56.size.height = v17;
    if (v50.f64[1] <= CGRectGetMaxY(v56))
      break;
    if (*(uint64_t *)(v13 + 24) < 0)
      v24 = &xmmword_100EEE418;
    else
      v24 = (__int128 *)v13;
    v25 = *(_QWORD *)v24 + *((_QWORD *)v24 + 1);
    if (v12 <= v25)
      v26 = v25;
    else
      v26 = v12;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      v12 = v25;
    else
      v12 = v26;
    if (v4)
      v12 = -[CRLWPStorage previousCharacterIndex:](self->_storage, "previousCharacterIndex:", v12);
    v11 += 2;
    if (v11 == *((uint64_t **)self->_lineFragmentArray.__ptr_ + 1))
      goto LABEL_65;
  }
  if (!v20)
  {
    v27 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_64;
  }
  v27 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    v13 = *v11;
    if ((*(_QWORD *)(*v11 + 24) & 0x40) == 0 && (*(_QWORD *)(*v11 + 24) & 0x201) != 1)
      break;
    v34 = v27;
LABEL_60:
    v11 += 2;
    v27 = v34;
    v20 -= 16;
    if (!v20)
      goto LABEL_64;
  }
  v29 = *(double *)(v13 + 56);
  v28 = *(double *)(v13 + 64);
  v31 = *(double *)(v13 + 40);
  v30 = *(double *)(v13 + 48);
  v32 = sub_1000610A4(v50.f64[0], v50.f64[1], v31, v30, v29, v28);
  v33 = sub_1001460C8(v13, !v4, 0, v50.f64[0]);
  v34 = v33;
  if (v32 != 0.0)
  {
    v35 = v32 < v18;
    if (v32 >= v18)
    {
      v36 = v27;
    }
    else
    {
      v18 = v32;
      v36 = v33;
    }
    if (!v35 || !v4)
    {
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      v34 = v36;
    }
    else
    {
      v38 = v31;
      v39 = v30;
      v40 = v29;
      v41 = v28;
      if (v50.f64[0] <= CGRectGetMaxX(*(CGRect *)&v38))
      {
        if (*(uint64_t *)(v13 + 24) < 0)
          v42 = &xmmword_100EEE418;
        else
          v42 = (__int128 *)v13;
        v34 = -[CRLWPStorage previousCharacterIndex:](self->_storage, "previousCharacterIndex:", *(_QWORD *)v42, *(_OWORD *)&v45, *(_OWORD *)&v46, *(_OWORD *)&v47);
      }
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      v18 = v32;
    }
    goto LABEL_60;
  }
  v12 = v33;
LABEL_64:
  result = v12;
  v12 = v27;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_65:
    result = v12;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v13)
      {
        startCharIndex = *(_QWORD *)v13;
        characterCount = *(_QWORD *)(v13 + 8);
        return characterCount + startCharIndex;
      }
LABEL_68:
      startCharIndex = self->_startCharIndex;
      characterCount = self->_characterCount;
      return characterCount + startCharIndex;
    }
  }
  return result;
}

- (unint64_t)charIndexFromWPPoint:(CGPoint)a3 pastCenterGoesToNextChar:(BOOL)a4 allowNotFound:(BOOL)a5 constrainToAscentAndDescent:(BOOL)a6 outFragment:(const CRLWPLineFragment *)a7 leadingEdge:(BOOL *)a8
{
  BOOL *v8;
  _BOOL4 v10;
  double y;
  double x;
  _BOOL4 v15;
  unint64_t startCharIndex;
  uint64_t v17;
  CRLWPLineFragmentArray *ptr;
  uint64_t *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double MinY;
  double v25;
  unint64_t *p_startCharIndex;
  unint64_t *p_characterCount;
  uint64_t *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  char *v47;
  char v48;
  CGPoint v49;
  CGPoint v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v8 = a8;
  v10 = a4;
  y = a3.y;
  x = a3.x;
  if (a6)
    return -[CRLWPColumn p_charIndexWithTextClosestToWPPoint:pastCenterGoesToNextChar:outFragment:leadingEdge:](self, "p_charIndexWithTextClosestToWPPoint:pastCenterGoesToNextChar:outFragment:leadingEdge:", a4, a7, a8, a3.x, a3.y);
  v15 = a5;
  if (a3.y >= CGRectGetMinY(self->_frameBounds))
  {
    ptr = self->_lineFragmentArray.__ptr_;
    v19 = *(uint64_t **)ptr;
    if (*(_QWORD *)ptr != *((_QWORD *)ptr + 1))
    {
      while (1)
      {
        v17 = *v19;
        if (!-[CRLWPColumn p_pencilAnnotationsShouldSkipLineFragment:](self, "p_pencilAnnotationsShouldSkipLineFragment:", *v19))
        {
          v20 = *(double *)(v17 + 40);
          v21 = *(double *)(v17 + 48);
          v22 = *(double *)(v17 + 56);
          v23 = *(double *)(v17 + 64);
          v51.origin.x = v20;
          v51.origin.y = v21;
          v51.size.width = v22;
          v51.size.height = v23;
          MinY = CGRectGetMinY(v51);
          v25 = MinY;
          if (v15 && y < MinY)
            goto LABEL_21;
          v52.origin.x = v20;
          v52.origin.y = v21;
          v52.size.width = v22;
          v52.size.height = v23;
          if (y <= CGRectGetMaxY(v52))
          {
            v29 = (uint64_t *)*((_QWORD *)self->_lineFragmentArray.__ptr_ + 1);
            v47 = (char *)v8;
            startCharIndex = 0x7FFFFFFFFFFFFFFFLL;
            if ((*(_BYTE *)(v17 + 28) & 1) != 0)
            {
              if (v19 != v29)
              {
                v39 = 0;
                v40 = 0;
                v41 = INFINITY;
                while (1)
                {
                  v30 = v19[v39];
                  v42 = *(double *)(v30 + 40);
                  v43 = *(double *)(v30 + 48);
                  v44 = *(double *)(v30 + 56);
                  v45 = *(double *)(v30 + 64);
                  v56.origin.x = v42;
                  v56.origin.y = v43;
                  v56.size.width = v44;
                  v56.size.height = v45;
                  if (y <= CGRectGetMinY(v56))
                    break;
                  if (!(v39 * 8))
                  {
                    if ((*(_BYTE *)(*v19 + 25) & 0x10) != 0)
                    {
                      v58.origin.x = v42;
                      v58.origin.y = v43;
                      v58.size.width = v44;
                      v58.size.height = v45;
                      if (x > CGRectGetMaxX(v58))
                        goto LABEL_65;
                    }
                    else
                    {
                      v57.origin.x = v42;
                      v57.origin.y = v43;
                      v57.size.width = v44;
                      v57.size.height = v45;
                      if (x < CGRectGetMinX(v57))
                        goto LABEL_65;
                    }
                  }
                  v59.origin.x = v42;
                  v59.origin.y = v43;
                  v59.size.width = v44;
                  v59.size.height = v45;
                  v50.x = x;
                  v50.y = y;
                  if (CGRectContainsPoint(v59, v50))
                  {
                    v48 = 1;
                    v37 = sub_1001464C4((__int128 *)v30, v10, 1, &v48, 1, x);
                    if (v47)
                      *v47 = v48;
                    if (v37 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      v17 = v30;
                      goto LABEL_70;
                    }
                  }
                  if (v39 * 8)
                  {
                    v46 = sub_1000610A4(x, y, *(CGFloat *)(v30 + 40), *(CGFloat *)(v30 + 48), *(CGFloat *)(v30 + 56), *(CGFloat *)(v30 + 64));
                    if (v46 < v41)
                    {
                      v40 = v30;
                      v41 = v46;
                    }
                  }
                  v39 += 2;
                  v30 = v40;
                  if (&v19[v39] == *((uint64_t **)self->_lineFragmentArray.__ptr_ + 1))
                    goto LABEL_65;
                }
                if (v39 * 8)
                {
                  v30 = v40;
                  if (!v40)
                    v30 = *v19;
                }
LABEL_65:
                startCharIndex = 0x7FFFFFFFFFFFFFFFLL;
                v8 = (BOOL *)v47;
                if (!v15 && v30)
                {
                  startCharIndex = sub_1001464C4((__int128 *)v30, v10, 0, v47, 1, x);
                  v17 = v30;
                }
              }
            }
            else if (v19 != v29)
            {
              v30 = 0;
              v31 = INFINITY;
              while (1)
              {
                v32 = *v19;
                v33 = *(double *)(*v19 + 40);
                v34 = *(double *)(*v19 + 48);
                v35 = *(double *)(*v19 + 56);
                v36 = *(double *)(*v19 + 64);
                v54.origin.x = v33;
                v54.origin.y = v34;
                v54.size.width = v35;
                v54.size.height = v36;
                v49.x = x;
                v49.y = y;
                if (CGRectContainsPoint(v54, v49))
                {
                  v37 = sub_1001464C4((__int128 *)v32, v10, 1, (char *)v8, 1, x);
                  if (v37 != 0x7FFFFFFFFFFFFFFFLL)
                    break;
                }
                v38 = sub_1000610A4(x, y, *(CGFloat *)(v32 + 40), *(CGFloat *)(v32 + 48), *(CGFloat *)(v32 + 56), *(CGFloat *)(v32 + 64));
                if (v38 < v31)
                  v30 = v32;
                v55.origin.x = v33;
                v55.origin.y = v34;
                v55.size.width = v35;
                v55.size.height = v36;
                if (y > CGRectGetMinY(v55))
                {
                  if (v38 < v31)
                    v31 = v38;
                  v19 += 2;
                  if (v19 != *((uint64_t **)self->_lineFragmentArray.__ptr_ + 1))
                    continue;
                }
                goto LABEL_65;
              }
              v17 = v32;
LABEL_70:
              startCharIndex = v37;
              v8 = (BOOL *)v47;
            }
            goto LABEL_22;
          }
          if (v19 != *(uint64_t **)self->_lineFragmentArray.__ptr_ && y < v25)
          {
            v17 = *(v19 - 2);
            v53.origin.x = v20;
            v53.origin.y = v21;
            v53.size.width = v22;
            v53.size.height = v23;
            if (x > CGRectGetMaxX(v53))
            {
              startCharIndex = sub_1001464C4((__int128 *)v17, v10, v15, (char *)v8, 1, x);
              goto LABEL_22;
            }
          }
        }
        v19 += 2;
        if (v19 == *((uint64_t **)self->_lineFragmentArray.__ptr_ + 1))
          goto LABEL_21;
      }
    }
  }
  else if (!v15)
  {
    startCharIndex = self->_startCharIndex;
    if (sub_100038988(self->_lineFragmentArray.__ptr_))
      v17 = sub_100038998(self->_lineFragmentArray.__ptr_, 0);
    else
      v17 = 0;
    goto LABEL_22;
  }
  v17 = 0;
LABEL_21:
  startCharIndex = 0x7FFFFFFFFFFFFFFFLL;
LABEL_22:
  if (a7)
    *a7 = (const CRLWPLineFragment *)v17;
  if (!v15 && startCharIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    p_startCharIndex = &self->_startCharIndex;
    p_characterCount = &self->_characterCount;
    if (v17)
    {
      p_characterCount = (unint64_t *)(v17 + 8);
      p_startCharIndex = (unint64_t *)v17;
    }
    startCharIndex = *p_characterCount + *p_startCharIndex;
    if (v8)
      *v8 = 1;
  }
  return startCharIndex;
}

- (unint64_t)p_charIndexWithTextClosestToWPPoint:(CGPoint)a3 pastCenterGoesToNextChar:(BOOL)a4 outFragment:(const CRLWPLineFragment *)a5 leadingEdge:(BOOL *)a6
{
  CRLWPLineFragmentArray *ptr;
  __int128 **v8;
  __int128 **v9;
  unint64_t v10;
  _BOOL4 v12;
  CGFloat y;
  double x;
  __int128 *v16;
  double v17;
  __int128 *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  uint64_t v24;
  double v25;
  CGPoint v27;
  CGRect v28;

  ptr = self->_lineFragmentArray.__ptr_;
  v8 = *(__int128 ***)ptr;
  v9 = (__int128 **)*((_QWORD *)ptr + 1);
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (*(__int128 ***)ptr == v9)
  {
    v18 = 0;
    if (!a5)
      return v10;
  }
  else
  {
    v12 = a4;
    y = a3.y;
    x = a3.x;
    v16 = 0;
    v17 = INFINITY;
    do
    {
      v18 = *v8;
      if (!-[CRLWPColumn p_pencilAnnotationsShouldSkipLineFragment:](self, "p_pencilAnnotationsShouldSkipLineFragment:", *v8))
      {
        v19 = *((double *)v18 + 4);
        v20 = *((double *)v18 + 5);
        v21 = v19 - *((double *)v18 + 15);
        v22 = *((double *)v18 + 7);
        v23 = v19 + *((double *)v18 + 17) - v21;
        v28.origin.x = v20;
        v28.origin.y = v21;
        v28.size.width = v22;
        v28.size.height = v23;
        v27.x = x;
        v27.y = y;
        if (CGRectContainsPoint(v28, v27))
        {
          v24 = sub_1001464C4(v18, v12, 1, (char *)a6, 1, x);
          if (v24 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v10 = v24;
            if (a5)
              goto LABEL_15;
            return v10;
          }
        }
        v25 = sub_1000610A4(x, y, v20, v21, v22, v23);
        if (v25 < v17)
        {
          v17 = v25;
          v16 = v18;
        }
      }
      v8 += 2;
    }
    while (v8 != v9);
    if (v16)
    {
      v10 = sub_1001464C4(v16, v12, 0, (char *)a6, 1, x);
      v18 = v16;
      if (a5)
        goto LABEL_15;
      return v10;
    }
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a5)
      return v10;
  }
LABEL_15:
  *a5 = (const CRLWPLineFragment *)v18;
  return v10;
}

- (BOOL)p_pencilAnnotationsShouldSkipLineFragment:(const void *)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)a3 + 3);
  return (v3 & 0x201) == 1 || (v3 & 0x40) != 0;
}

- (void)renderWithRenderer:(id)a3 currentSelection:(id)a4 limitSelection:(id)a5 listRange:(_NSRange)a6 rubyGlyphRange:(_NSRange)a7 isCanvasInteractive:(BOOL)a8 isInDrawingMode:(BOOL)a9 spellChecker:(id)a10 suppressedMisspellingRange:(_NSRange)a11 blackAndWhite:(BOOL)a12 dictationInterpretations:(id)a13 autocorrections:(id)a14 markedRange:(_NSRange)a15 markedText:(id)a16 renderMode:(unint64_t)a17 pageCount:(unint64_t)a18 suppressInvisibles:(BOOL)a19 currentCanvasSelection:(id)a20
{
  NSUInteger v20;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double x;
  double y;
  double width;
  double height;
  uint64_t v61;
  CRLWPLineFragmentArray *ptr;
  __int128 **v63;
  __int128 **v64;
  uint64_t v65;
  uint64_t v66;
  __int128 *v67;
  unint64_t v68;
  __int128 *v69;
  id v70;
  id v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  CRLWPLineFragmentArray *v76;
  __int128 **v77;
  __int128 **v78;
  __int128 *v79;
  unint64_t v80;
  __int128 *v81;
  char *v82;
  CGSize size;
  CGContext *v85;
  int v86;
  CRLWPLineFragmentArray *v87;
  __int128 **v88;
  __int128 **v89;
  __int128 *v90;
  unint64_t v91;
  __int128 *v92;
  char *v93;
  id v95;
  id obj;
  id v97;
  id v98;
  id v99;
  id v100;
  void *v101;
  void *v102;
  char *length;
  id v104;
  CGRect v105;
  CGAffineTransform v106;
  char v107[96];
  CFTypeRef cf;
  CGColorRef color;
  CGColorRef v110;
  id location;
  id v112[5];
  id v113;
  id v114[2];
  CGColorRef v115;
  BOOL v116;
  BOOL v117;
  BOOL v118;
  char v119;
  unsigned __int8 v120;
  char v121;
  uint64_t v122;
  id v123;
  id v124;
  _NSRange v125;
  id v126;
  id v127[3];
  _NSRange v128;
  unint64_t v129;
  _NSRange v130;
  id v131;
  char v132;
  id v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;

  length = (char *)a6.length;
  v20 = a6.location;
  v24 = a3;
  v100 = a4;
  obj = a5;
  v25 = a5;
  v104 = a10;
  v97 = a13;
  v98 = a14;
  v99 = a16;
  v95 = a20;
  v101 = v25;
  v26 = sub_100411820((uint64_t)objc_msgSend(v24, "context"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(v26);
  objc_msgSend(v102, "beginTextColumn:limitSelection:", self, v25);
  v131 = 0;
  v133 = 0;
  location = 0;
  v112[0] = 0;
  v113 = 0;
  v114[0] = 0;
  v123 = 0;
  v124 = 0;
  v126 = 0;
  v127[0] = 0;
  bzero(&location, 0xE8uLL);
  objc_storeStrong(&location, self->_storage);
  objc_storeStrong(v112, self);
  -[CRLWPColumn frameBounds](self, "frameBounds");
  v112[1] = v27;
  v112[2] = v28;
  v112[3] = v29;
  v112[4] = v30;
  v114[1] = (id)self->_scaleTextPercent;
  objc_storeStrong(&v113, a4);
  objc_storeStrong(v114, obj);
  v127[1] = (id)v20;
  v127[2] = length;
  v128 = a7;
  v119 = 0;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor clearColor](CRLColor, "clearColor"));
  v115 = CGColorRetain((CGColorRef)objc_msgSend(v31, "CGColor"));

  if (v104)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "misspelledRanges"));
    v33 = v123;
    v123 = v32;

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "ungrammaticRanges"));
    v35 = v124;
    v124 = v34;

  }
  v125 = a11;
  v116 = a12;
  objc_storeStrong(&v126, a13);
  objc_storeStrong(v127, a14);
  v130 = a15;
  objc_storeStrong(&v131, a16);
  v129 = a18;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorage parentInfo](self->_storage, "parentInfo"));
  if ((objc_opt_respondsToSelector(v36, "shouldHideEmptyBullets") & 1) != 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorage parentInfo](self->_storage, "parentInfo"));
    v120 = objc_msgSend(v37, "shouldHideEmptyBullets");

  }
  else
  {
    v120 = 0;
  }

  v117 = a8;
  v118 = a9;
  v121 = 0;
  objc_storeStrong(&v133, a20);
  bzero(v107, 0xA0uLL);
  if (!v25 && (a7.location != 0x7FFFFFFFFFFFFFFFLL || a7.length))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244B48);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0CAB8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244B68);
    v38 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn renderWithRenderer:currentSelection:limitSelection:listRange:rubyGlyphRange:isCanvasInteractive:isInDrawingMode:spellChecker:suppressedMisspellingRange:blackAndWhite:dictationInterpretations:autocorrections:markedRange:markedText:renderMode:pageCount:suppressInvisibles:currentCanvasSelection:]"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v39, v40, 3510, 0, "ruby glyph range is meaningless without limitSelection");

  }
  objc_msgSend(v24, "willRenderFragmentsWithDrawingState:", &location);
  objc_msgSend(v24, "getClipBoundingBox");
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;
  -[CRLWPColumn erasableBounds:](self, "erasableBounds:", 0);
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;
  -[CRLWPColumn transformToWP](self, "transformToWP");
  v134.origin.x = v50;
  v134.origin.y = v52;
  v134.size.width = v54;
  v134.size.height = v56;
  v138 = CGRectApplyAffineTransform(v134, &v106);
  v135.origin.x = v42;
  v135.origin.y = v44;
  v135.size.width = v46;
  v135.size.height = v48;
  v136 = CGRectIntersection(v135, v138);
  x = v136.origin.x;
  y = v136.origin.y;
  width = v136.size.width;
  height = v136.size.height;
  if (v120 && objc_msgSend(v100, "isInsertionPoint"))
    v61 = (uint64_t)objc_msgSend(v100, "start");
  else
    v61 = 0x7FFFFFFFFFFFFFFFLL;
  if ((a17 & 2) != 0)
  {
    objc_msgSend(v24, "drawAdornmentRects:forColumn:foreground:drawingState:", self->_paragraphAdornments, self, 0, &location);
    v122 = 0;
    ptr = self->_lineFragmentArray.__ptr_;
    v63 = *(__int128 ***)ptr;
    v64 = (__int128 **)*((_QWORD *)ptr + 1);
    if (*(__int128 ***)ptr != v64)
    {
      v65 = 0;
      do
      {
        v66 = *((_QWORD *)*v63 + 3);
        if (v66 < 0)
          v67 = &xmmword_100EEE418;
        else
          v67 = *v63;
        v68 = *(_QWORD *)v67;
        if (v20 > v68
          || (v66 < 0 ? (v69 = &xmmword_100EEE418) : (v69 = *v63),
              (unint64_t)&length[v20] < *((_QWORD *)v69 + 1) + v68))
        {
          objc_msgSend(v24, "drawFragment:updateRect:drawingState:runState:lineDrawFlags:", x, y, width, height);
          v65 = v122;
        }
        v122 = ++v65;
        v63 += 2;
      }
      while (v63 != v64);
    }
  }
  if ((a17 & 1) != 0)
  {
    v70 = objc_msgSend(v97, "rangeCount");
    v71 = objc_msgSend(v98, "rangeCount");
    v72 = 4098;
    if ((a17 & 4) == 0)
      v72 = 2;
    v73 = v72 & 0xFFFFFFFFFFFFDFFFLL | (((a17 >> 3) & 1) << 13);
    v74 = v73 | 0x18;
    if (!v104)
      v74 = v73;
    if (v70)
      v74 |= 0x200uLL;
    if (v71)
      v74 |= 0x800uLL;
    if (v99)
      v75 = v74 | 0x400;
    else
      v75 = v74;
    v132 = 0;
    v122 = 0;
    v76 = self->_lineFragmentArray.__ptr_;
    v77 = *(__int128 ***)v76;
    v78 = (__int128 **)*((_QWORD *)v76 + 1);
    if (*(__int128 ***)v76 != v78)
    {
      do
      {
        if (*((uint64_t *)*v77 + 3) < 0)
          v79 = &xmmword_100EEE418;
        else
          v79 = *v77;
        v81 = v79;
        v80 = *(_QWORD *)v79;
        v82 = (char *)(v80 + *((_QWORD *)v81 + 1));
        if (v20 > v80 || &length[v20] < v82)
        {
          v75 = v75 & 0xFFFFFFFFFFFFFEFFLL | ((unint64_t)(v80 == v61) << 8);
          if (!v114[0] || objc_msgSend(v114[0], "intersectsRange:", v80))
            objc_msgSend(v24, "drawFragment:updateRect:drawingState:runState:lineDrawFlags:", x, y, width, height);
        }
        ++v122;
        v77 += 2;
      }
      while (v77 != v78);
    }
    v137.origin.x = x;
    v137.origin.y = y;
    v137.size.width = width;
    v137.size.height = height;
    if (!CGRectIsNull(v137))
    {
      size = CGRectZero.size;
      v105.origin = CGRectZero.origin;
      v105.size = size;
      if (v132
        && objc_msgSend(v24, "shouldClipFragment:drawingState:lineDrawFlags:updateRect:outClipRect:", 0, &location, v75, &v105, x, y, width, height))
      {
        CGContextSaveGState((CGContextRef)objc_msgSend(v24, "context"));
        v85 = (CGContext *)objc_msgSend(v24, "context");
        CGContextClipToRect(v85, v105);
        v86 = 1;
      }
      else
      {
        v86 = 0;
      }
      objc_msgSend(v24, "drawCharacterFillAdornmentRects:forColumn:excludeRange:drawingState:", self->_paragraphAdornments, self, v20, length, &location);
      objc_msgSend(v24, "drawCharacterStrokeAdornmentRects:forColumn:excludeRange:drawingState:", self->_paragraphAdornments, self, v20, length, &location);
      if (v86)
        CGContextRestoreGState((CGContextRef)objc_msgSend(v24, "context"));
    }
    v122 = 0;
    v87 = self->_lineFragmentArray.__ptr_;
    v88 = *(__int128 ***)v87;
    v89 = (__int128 **)*((_QWORD *)v87 + 1);
    if (*(__int128 ***)v87 != v89)
    {
      do
      {
        if (*((uint64_t *)*v88 + 3) < 0)
          v90 = &xmmword_100EEE418;
        else
          v90 = *v88;
        v92 = v90;
        v91 = *(_QWORD *)v90;
        v93 = (char *)(v91 + *((_QWORD *)v92 + 1));
        if (v20 > v91 || &length[v20] < v93)
        {
          v75 = v75 & 0xFFFFFFFFFFFFFEFFLL | ((unint64_t)(v91 == v61) << 8);
          if (!v114[0] || objc_msgSend(v114[0], "intersectsRange:", v91))
            objc_msgSend(v24, "drawAdornmentsForFragment:updateRect:drawingState:runState:lineDrawFlags:", x, y, width, height);
        }
        ++v122;
        v88 += 2;
      }
      while (v88 != v89);
    }
    objc_msgSend(v24, "drawAdornmentRects:forColumn:foreground:drawingState:", self->_paragraphAdornments, self, 1, &location);
  }
  objc_msgSend(v24, "didRenderFragments");
  if (cf)
    CFRelease(cf);
  if (color)
    CGColorRelease(color);
  if (v110)
    CGColorRelease(v110);
  if (v115)
    CGColorRelease(v115);
  objc_msgSend(v102, "endTextColumn:", self);

}

- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unint64_t)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPColumn storage](self, "storage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "smartFieldAtCharIndex:attributeKind:effectiveRange:", a3, a4, 0));

  return v7;
}

- (void)enumerateParagraphAdornmentsUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *paragraphAdornments;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  paragraphAdornments = self->_paragraphAdornments;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10020A43C;
  v7[3] = &unk_101244B90;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](paragraphAdornments, "enumerateObjectsUsingBlock:", v7);

}

- (unint64_t)nextWidowPullsDownFromCharIndex
{
  return self->nextWidowPullsDownFromCharIndex;
}

- (void)setNextWidowPullsDownFromCharIndex:(unint64_t)a3
{
  self->nextWidowPullsDownFromCharIndex = a3;
}

- (void)setFrameBounds:(CGRect)a3
{
  self->_frameBounds = a3;
}

- (_TtC8Freeform12CRLWPStorage)storage
{
  return self->_storage;
}

- (double)contentBlockBottom
{
  return self->_contentBlockBottom;
}

- (void)setContentBlockBottom:(double)a3
{
  self->_contentBlockBottom = a3;
}

- (unint64_t)layoutResultFlags
{
  return self->_layoutResultFlags;
}

- (void)setLayoutResultFlags:(unint64_t)a3
{
  self->_layoutResultFlags = a3;
}

- (unint64_t)scaleTextPercent
{
  return self->_scaleTextPercent;
}

- (void)setScaleTextPercent:(unint64_t)a3
{
  self->_scaleTextPercent = a3;
}

- (unint64_t)storageChangeCount
{
  return self->_storageChangeCount;
}

- (void)setStorageChangeCount:(unint64_t)a3
{
  self->_storageChangeCount = a3;
}

- (void)setTransformFromWP:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transformFromWP.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transformFromWP.tx = v4;
  *(_OWORD *)&self->_transformFromWP.a = v3;
}

- (unint64_t)startCharIndex
{
  return self->_startCharIndex;
}

- (void)setStartCharIndex:(unint64_t)a3
{
  self->_startCharIndex = a3;
}

- (unint64_t)characterCount
{
  return self->_characterCount;
}

- (void)setCharacterCount:(unint64_t)a3
{
  self->_characterCount = a3;
}

- (double)nextLinePosition
{
  return self->_nextLinePosition;
}

- (void)setNextLinePosition:(double)a3
{
  self->_nextLinePosition = a3;
}

- (double)erasableContentBottom
{
  return self->_erasableContentBottom;
}

- (void)setErasableContentBottom:(double)a3
{
  self->_erasableContentBottom = a3;
}

- (unint64_t)columnIndex
{
  return self->_columnIndex;
}

- (void)setColumnIndex:(unint64_t)a3
{
  self->_columnIndex = a3;
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (void)setPageNumber:(unint64_t)a3
{
  self->_pageNumber = a3;
}

- (CRLWPStyleProvider)styleProvider
{
  return (CRLWPStyleProvider *)objc_loadWeakRetained((id *)&self->_styleProvider);
}

- (void)setStyleProvider:(id)a3
{
  objc_storeWeak((id *)&self->_styleProvider, a3);
}

- (BOOL)textIsVertical
{
  return self->_textIsVertical;
}

- (void)setTextIsVertical:(BOOL)a3
{
  self->_textIsVertical = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_styleProvider);
  objc_storeStrong((id *)&self->_paragraphAdornments, 0);
  sub_100038CC0((uint64_t)&self->_lineFragmentArray);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = 0;
  return self;
}

@end
