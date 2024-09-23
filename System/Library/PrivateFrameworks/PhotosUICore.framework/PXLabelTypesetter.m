@implementation PXLabelTypesetter

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXLabelTypesetter;
  -[PXLabelTypesetter didPerformChanges](&v3, sel_didPerformChanges);
  -[PXLabelTypesetter _updateLines](self, "_updateLines");
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXLabelTypesetter;
  -[PXLabelTypesetter performChanges:](&v3, sel_performChanges_, a3);
}

- (NSArray)lines
{
  return self->_lines;
}

- (void)_updateLines
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  CGContext *v14;
  unint64_t v15;
  PXCTFramesetter *v16;
  int64_t v17;
  double v18;
  int v19;
  void *v20;
  uint64_t v21;
  void (**v22)(void);
  void (**v23)(_QWORD);
  double v24;
  double v25;
  _BOOL4 v26;
  double v28;
  double v29;
  unint64_t v30;
  double v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  const __CFAttributedString *v37;
  const __CTLine *v38;
  const __CTLine *v39;
  double TypographicBounds;
  double v41;
  NSObject *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  unint64_t v50;
  unint64_t v51;
  double v53;
  NSObject *v54;
  double v55;
  uint64_t v56;
  void *v57;
  double v58;
  NSObject *v59;
  NSObject *v60;
  double v61;
  void *v62;
  _BOOL4 v63;
  double Width;
  double v65;
  double v66;
  double MidX;
  double v68;
  id v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  int v78;
  void (**v79)(void);
  void (**v80)(void);
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[11];
  _QWORD v86[4];
  void (**v87)(void);
  uint64_t *v88;
  uint64_t *v89;
  _QWORD aBlock[4];
  PXCTFramesetter *v91;
  uint64_t *v92;
  uint64_t *v93;
  uint64_t *v94;
  _QWORD *v95;
  uint64_t *v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;
  uint64_t v104;
  double *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  double *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  _QWORD v114[3];
  char v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  CGRect *v121;
  uint64_t v122;
  void *v123;
  double v124;
  double v125;
  double v126;
  double v127;
  uint8_t v128[128];
  uint8_t buf[4];
  PXLabelTypesetter *v130;
  __int16 v131;
  double v132;
  __int16 v133;
  double v134;
  __int16 v135;
  double v136;
  uint64_t v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;

  v137 = *MEMORY[0x1E0C80C00];
  -[PXLabelTypesetter attributedString](self, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXLabelTypesetter bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (objc_msgSend(v4, "length"))
  {
    v138.origin.x = v6;
    v138.origin.y = v8;
    v138.size.width = v10;
    v138.size.height = v12;
    if (!CGRectIsEmpty(v138))
    {
      v14 = -[PXLabelTypesetter context](self, "context");
      v15 = -[PXLabelTypesetter maximumNumberOfLines](self, "maximumNumberOfLines");
      v16 = -[PXCTFramesetter initWithAttributedString:context:]([PXCTFramesetter alloc], "initWithAttributedString:context:", v4, v14);
      v17 = -[PXLabelTypesetter typesettingMode](self, "typesettingMode");
      if (v17 != 1)
      {
        if (v17 == 2)
        {
          -[PXCTFramesetter frameWithRect:maximumLineCount:allowTruncation:](v16, "frameWithRect:maximumLineCount:allowTruncation:", v15, 0, v6, v8, v10, v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lines");
          v13 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLabelTypesetter.m"), 73, CFSTR("Code which should be unreachable has been reached"));

            abort();
          }
          v13 = 0;
        }
LABEL_74:
        objc_msgSend(v4, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0, *(_QWORD *)&v77);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXLabelTypesetter shiftLinesVerticallyToAvoidOverlap:referenceFont:](self, "shiftLinesVerticallyToAvoidOverlap:referenceFont:", v13, v75);

        goto LABEL_75;
      }
      v120 = 0;
      v121 = (CGRect *)&v120;
      v122 = 0x4010000000;
      v123 = &unk_1A7E74EE7;
      v124 = v6;
      v125 = v8;
      v126 = v10;
      v127 = v12;
      v116 = 0;
      v117 = &v116;
      v118 = 0x2020000000;
      v119 = v15;
      if (v15 && -[PXLabelTypesetter allowTruncation](self, "allowTruncation") && objc_msgSend(v4, "length"))
      {
        -[PXLabelTypesetter minimumTruncatedScaleFactor](self, "minimumTruncatedScaleFactor");
        if (v18 <= 0.0)
        {
          v56 = objc_msgSend(v4, "length");
          objc_msgSend(v4, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], v56 - 1, 0);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "lineHeight");
          v121[1].size.height = v121[1].size.height + v58 * 2.0;
          ++v117[3];

          v19 = 2;
        }
        else
        {
          v19 = 1;
        }
        v78 = v19;
      }
      else
      {
        v78 = 0;
      }
      v114[0] = 0;
      v114[1] = v114;
      v114[2] = 0x2020000000;
      v115 = 0;
      v108 = 0;
      v109 = (double *)&v108;
      v110 = 0x3032000000;
      v111 = __Block_byref_object_copy__280578;
      v112 = __Block_byref_object_dispose__280579;
      v113 = 0;
      v104 = 0;
      v105 = (double *)&v104;
      v106 = 0x2020000000;
      v107 = 0;
      v98 = 0;
      v99 = &v98;
      v100 = 0x3032000000;
      v101 = __Block_byref_object_copy__280578;
      v102 = __Block_byref_object_dispose__280579;
      v21 = MEMORY[0x1E0C809B0];
      v103 = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __33__PXLabelTypesetter__updateLines__block_invoke;
      aBlock[3] = &unk_1E5144890;
      v92 = &v108;
      v91 = v16;
      v93 = &v120;
      v94 = &v116;
      v95 = v114;
      v96 = &v104;
      v97 = &v98;
      v22 = (void (**)(void))_Block_copy(aBlock);
      v22[2]();
      v86[0] = v21;
      v86[1] = 3221225472;
      v86[2] = __33__PXLabelTypesetter__updateLines__block_invoke_2;
      v86[3] = &unk_1E51448B8;
      v88 = &v104;
      v89 = &v120;
      v80 = v22;
      v87 = v80;
      v23 = (void (**)(_QWORD))_Block_copy(v86);
      v85[0] = v21;
      v85[1] = 3221225472;
      v85[2] = __33__PXLabelTypesetter__updateLines__block_invoke_3;
      v85[3] = &unk_1E51448E0;
      v85[4] = self;
      v85[5] = v114;
      *(double *)&v85[7] = v6;
      *(double *)&v85[8] = v8;
      *(double *)&v85[9] = v10;
      *(double *)&v85[10] = v12;
      v85[6] = &v120;
      v79 = (void (**)(void))_Block_copy(v85);
      -[PXLabelTypesetter minimumScaleFactor](self, "minimumScaleFactor");
      v25 = v24;
      v26 = -[PXLabelTypesetter adjustsFontSizeToFitWidth](self, "adjustsFontSizeToFitWidth");
      if (v25 > 0.0 && v26)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v29 = v28;
        v139.origin.x = v6;
        v139.origin.y = v8;
        v139.size.width = v10;
        v139.size.height = v12;
        v30 = 0;
        v31 = CGRectGetWidth(v139) / v25;
        while (v30 < objc_msgSend((id)v99[5], "count") - 1)
        {
          objc_msgSend((id)v99[5], "objectAtIndexedSubscript:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "stringRange");
          v35 = v33 + v34;
          v36 = -[PXLabelTypesetter _adjustCutoffLocation:forLineStartingAtIndex:](self, "_adjustCutoffLocation:forLineStartingAtIndex:", v33 + v34, v33);
          if (v36 != v35)
          {
            objc_msgSend(v4, "attributedSubstringFromRange:", v33, v36 - v33);
            v37 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();
            v38 = CTLineCreateWithAttributedString(v37);
            v39 = v38;
            if (v38)
            {
              TypographicBounds = CTLineGetTypographicBounds(v38, 0, 0, 0);
              CFRelease(v39);
              v41 = ceil(TypographicBounds);
              if (v41 > v105[3] && v41 <= v31)
                v23[2](v23);
            }

          }
          ++v30;
        }
        PLUIGetLog();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          *(_DWORD *)buf = 138412546;
          v130 = self;
          v131 = 2048;
          v132 = (v44 - v29) * 1000.0;
          _os_log_impl(&dword_1A6789000, v43, OS_LOG_TYPE_DEBUG, "[%@] adjusted line cutoffs in %0.3fms", buf, 0x16u);
        }

        if (objc_msgSend(*((id *)v109 + 5), "isTruncated"))
        {
          v45 = v105[3];
          ((void (*)(void (**)(_QWORD), double))v23[2])(v23, v31);
          if ((objc_msgSend(*((id *)v109 + 5), "isTruncated") & 1) == 0)
          {
            v46 = v105[3];
            +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "textAutoscalingPrecision");
            v49 = v48;

            if (v46 - v45 <= v49)
            {
              v53 = 0.0;
            }
            else
            {
              v77 = v29;
              v50 = -1;
              do
              {
                v51 = v50;
                ((void (*)(void (**)(_QWORD), double))v23[2])(v23, (v45 + v46) * 0.5);
                if (objc_msgSend(*((id *)v109 + 5), "isTruncated"))
                  v45 = v105[3];
                else
                  v46 = v105[3];
                v50 = v51 + 1;
              }
              while (v46 - v45 > v49 && v51 + 1 < 0x1D);
              *(_QWORD *)&v53 = v51 + 2;
              if (v50 >= 0x1D)
              {
                PLUIGetLog();
                v54 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  v55 = v109[5];
                  *(_DWORD *)buf = 138412546;
                  v130 = self;
                  v131 = 2112;
                  v132 = v55;
                  _os_log_impl(&dword_1A6789000, v54, OS_LOG_TYPE_DEFAULT, "[%@] maximum number of iterations reached for autoscaling, failing gracefully (currentFrame = %@)", buf, 0x16u);
                }

              }
            }
            PLUIGetLog();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138413058;
              v130 = self;
              v131 = 2048;
              v132 = v53;
              v133 = 2048;
              v134 = v45;
              v135 = 2048;
              v136 = v46;
              _os_log_impl(&dword_1A6789000, v59, OS_LOG_TYPE_DEBUG, "[%@] autoscaled text in %li iterations (low: %f, high: %f)", buf, 0x2Au);
            }

            ((void (*)(void (**)(_QWORD), double))v23[2])(v23, v46);
          }
        }
        PLUIGetLog();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          *(_DWORD *)buf = 138412546;
          v130 = self;
          v131 = 2048;
          v132 = (v61 - v29) * 1000.0;
          _os_log_impl(&dword_1A6789000, v60, OS_LOG_TYPE_DEBUG, "[%@] autoscaled text in %0.3fms", buf, 0x16u);
        }

      }
      if (v78 == 2)
      {
        v121[1].size.height = v12;
        v117[3] = v15;
        objc_msgSend(*((id *)v109 + 5), "lines");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "count") > v15;

        if (!v63)
        {
LABEL_63:
          ((void (*)(void (**)(void)))v22[2])(v80);
LABEL_64:
          Width = CGRectGetWidth(v121[1]);
          v140.origin.x = v6;
          v140.origin.y = v8;
          v140.size.width = v10;
          v140.size.height = v12;
          if (Width != CGRectGetWidth(v140))
          {
            v141.origin.x = v6;
            v141.origin.y = v8;
            v141.size.width = v10;
            v141.size.height = v12;
            v65 = CGRectGetWidth(v141);
            v66 = CGRectGetWidth(v121[1]);
            v142.origin.x = v6;
            v142.origin.y = v8;
            v142.size.width = v10;
            v142.size.height = v12;
            MidX = CGRectGetMidX(v142);
            v68 = CGRectGetMidX(v121[1]);
            v83 = 0u;
            v84 = 0u;
            v81 = 0u;
            v82 = 0u;
            v69 = (id)v99[5];
            v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v81, v128, 16);
            if (v70)
            {
              v71 = MidX - v65 / v66 * v68;
              v72 = *(_QWORD *)v82;
              do
              {
                for (i = 0; i != v70; ++i)
                {
                  if (*(_QWORD *)v82 != v72)
                    objc_enumerationMutation(v69);
                  v74 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
                  objc_msgSend(v74, "scaleBy:", v65 / v66, *(_QWORD *)&v77);
                  objc_msgSend(v74, "translateHorizontallyBy:", v71);
                }
                v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v81, v128, 16);
              }
              while (v70);
            }

          }
          v13 = (id)v99[5];

          _Block_object_dispose(&v98, 8);
          _Block_object_dispose(&v104, 8);
          _Block_object_dispose(&v108, 8);

          _Block_object_dispose(v114, 8);
          _Block_object_dispose(&v116, 8);
          _Block_object_dispose(&v120, 8);
          goto LABEL_74;
        }
      }
      else if (v78 != 1 || (objc_msgSend(*((id *)v109 + 5), "isTruncated") & 1) == 0)
      {
        goto LABEL_64;
      }
      v79[2]();
      goto LABEL_63;
    }
  }
  v13 = 0;
LABEL_75:
  -[PXLabelTypesetter _setLines:](self, "_setLines:", v13);

}

void __33__PXLabelTypesetter__updateLines__block_invoke(uint64_t a1)
{
  double *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = *(double **)(*(_QWORD *)(a1 + 48) + 8);
  objc_msgSend(*(id *)(a1 + 32), "frameWithRect:maximumLineCount:allowTruncation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), v2[4], v2[5], v2[6], v2[7]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = CGRectGetWidth(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                          + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "lines");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (void)shiftLinesVerticallyToAvoidOverlap:(id)a3 referenceFont:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double MinY;
  uint64_t i;
  void *v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGRect v29;
  CGRect v30;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7
    && !-[PXLabelTypesetter _allowTextOverlapForFont:](self, "_allowTextOverlapForFont:", v7)
    && (unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    objc_msgSend(v7, "ascender");
    v9 = v8;
    objc_msgSend(v7, "descender");
    v11 = v10;
    objc_msgSend(v7, "leading");
    v13 = v12;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = v6;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = (v9 - v11 + v13) * 0.0500000007;
      v18 = *(_QWORD *)v24;
      MinY = 1.79769313e308;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v14);
          v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v21, "imageBounds", (_QWORD)v23);
          v22 = MinY - CGRectGetMaxY(v29);
          if (v22 < v17)
            objc_msgSend(v21, "translateVerticallyBy:", v22 - v17);
          objc_msgSend(v21, "imageBounds");
          MinY = CGRectGetMinY(v30);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v16);
    }

  }
}

- (BOOL)_allowTextOverlapForFont:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  char v7;

  v3 = _allowTextOverlapForFont__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_allowTextOverlapForFont__onceToken, &__block_literal_global_280566);
  v5 = (void *)_allowTextOverlapForFont__handwritingFontFamilyNames;
  objc_msgSend(v4, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "containsObject:", v6);
  return v7;
}

- (int64_t)typesettingMode
{
  return self->_typesettingMode;
}

- (void)setTypesettingMode:(int64_t)a3
{
  self->_typesettingMode = a3;
}

- (void)setMinimumTruncatedScaleFactor:(double)a3
{
  self->_minimumTruncatedScaleFactor = a3;
}

- (void)setMinimumScaleFactor:(double)a3
{
  self->_minimumScaleFactor = a3;
}

- (void)setMaximumNumberOfLines:(unint64_t)a3
{
  self->_maximumNumberOfLines = a3;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (void)setAttributedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setAllowTruncation:(BOOL)a3
{
  self->_allowTruncation = a3;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  self->_adjustsFontSizeToFitWidth = a3;
}

- (double)minimumTruncatedScaleFactor
{
  return self->_minimumTruncatedScaleFactor;
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (unint64_t)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (CGContext)context
{
  return self->_context;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (BOOL)allowTruncation
{
  return self->_allowTruncation;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return self->_adjustsFontSizeToFitWidth;
}

- (void)_setLines:(id)a3
{
  NSArray *v5;
  char v6;
  NSArray *v7;

  v7 = (NSArray *)a3;
  v5 = self->_lines;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSArray isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lines, a3);
      -[PXLabelTypesetter signalChange:](self, "signalChange:", 1);
    }
  }

}

- (PXLabelTypesetter)initWithContext:(CGContext *)a3
{
  PXLabelTypesetter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXLabelTypesetter;
  result = -[PXLabelTypesetter init](&v5, sel_init);
  if (result)
  {
    result->_context = a3;
    result->_allowTruncation = 1;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

void __46__PXLabelTypesetter__allowTextOverlapForFont___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Dear Joe Four"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_allowTextOverlapForFont__handwritingFontFamilyNames;
  _allowTextOverlapForFont__handwritingFontFamilyNames = v0;

}

- (PXLabelTypesetter)init
{
  return -[PXLabelTypesetter initWithContext:](self, "initWithContext:", 0);
}

- (unint64_t)_adjustCutoffLocation:(unint64_t)a3 forLineStartingAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  uint64_t *v14;
  _QWORD v15[4];
  __int128 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = a3;
  -[PXLabelTypesetter attributedString](self, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && objc_msgSend(v7, "length") > a3)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3010000000;
    v15[3] = &unk_1A7E74EE7;
    v16 = xmmword_1A7C0C330;
    v8 = objc_msgSend(v7, "length") - a4;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__PXLabelTypesetter__adjustCutoffLocation_forLineStartingAtIndex___block_invoke;
    v11[3] = &unk_1E5144908;
    v13 = v15;
    v12 = v7;
    v14 = &v17;
    objc_msgSend(v12, "enumerateSubstringsInRange:options:usingBlock:", a4, v8, 3, v11);

    _Block_object_dispose(v15, 8);
  }
  v9 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __66__PXLabelTypesetter__adjustCutoffLocation_forLineStartingAtIndex___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v13 = *(_QWORD *)(a1[5] + 8);
  *(_QWORD *)(v13 + 32) = a5;
  *(_QWORD *)(v13 + 40) = a6;
  v14 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "rangeOfCharacterFromSet:options:range:", v15, 4, a3 + a4, a5 + a6 - (a3 + a4));

  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = v16 - *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 32);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40)
                                               + *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 32);
  *a7 = 1;
}

_QWORD *__33__PXLabelTypesetter__updateLines__block_invoke_2(_QWORD *result, double a2)
{
  double v2;

  v2 = *(double *)(*(_QWORD *)(result[5] + 8) + 24);
  if (v2 != a2)
  {
    *(double *)(*(_QWORD *)(result[6] + 8) + 48) = a2;
    *(double *)(*(_QWORD *)(result[6] + 8) + 56) = a2 / v2 * *(double *)(*(_QWORD *)(result[6] + 8) + 56);
    return (_QWORD *)(*(uint64_t (**)(void))(result[4] + 16))();
  }
  return result;
}

void __33__PXLabelTypesetter__updateLines__block_invoke_3(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "minimumTruncatedScaleFactor");
  if (v2 > 0.0)
  {
    v3 = CGRectGetWidth(*(CGRect *)(a1 + 56)) / v2;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(double *)(v4 + 48) < v3)
      v3 = *(double *)(v4 + 48);
    *(double *)(v4 + 48) = v3;
  }
}

@end
