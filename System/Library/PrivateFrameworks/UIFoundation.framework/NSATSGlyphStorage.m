@implementation NSATSGlyphStorage

- (void)setAdvance:(CGSize)a3 forIndex:(int64_t)a4
{
  CGSize *v4;

  v4 = (CGSize *)(*(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8100]) + 16 * a4);
  if (v4->width != a3.width || v4->height != a3.height)
  {
    *v4 = a3;
    (*(_DWORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8118]))[a4] |= 0x80000u;
  }
}

- (id)setGlyphRange:(uint64_t)a3 characterRange:(uint64_t)a4
{
  unint64_t v9;
  _WORD *v10;
  int *v11;
  double *v12;
  int *v13;
  _DWORD *v14;
  int *v15;
  uint64_t *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  objc_class *v36;
  NSString *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  BOOL v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  long double v49;
  int v50;
  long double v51;
  void *v52;
  int v53;
  BOOL v54;
  id v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  __int128 v79;
  int v80;
  int v81;
  void *v82;
  double v83;
  uint64_t v84;
  int v85;
  void *v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  _WORD *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  double v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  double *v114;
  double v115;
  double v116;
  __CFArray *v117;
  uint64_t v118;
  const void *MutableWithInterface;
  double *v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  int v125;
  void *v126;
  _WORD *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  unint64_t v137;
  unint64_t v138;
  _BYTE v139[128];
  char v140;
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v132 = (uint64_t)result;
    v122 = objc_msgSend(result[10], "_getATSTypesetterGuts");
    __NSATSGlyphStorageInitBuffer(v132, a2, a3, a4, a5, a3);
    v128 = objc_msgSend(*(id *)(v132 + 80), "attributedString");
    v9 = *(_QWORD *)(v132 + 128);
    v10 = *(_WORD **)(v132 + (int)*MEMORY[0x1E0CA8110]);
    v11 = (int *)MEMORY[0x1E0CA8100];
    v12 = *(double **)(v132 + (int)*MEMORY[0x1E0CA8100]);
    v13 = (int *)MEMORY[0x1E0CA8118];
    v137 = 0;
    v138 = 0;
    v14 = *(_DWORD **)(v132 + (int)*MEMORY[0x1E0CA8118]);
    v15 = (int *)MEMORY[0x1E0CA8120];
    v16 = *(uint64_t **)(v132 + (int)*MEMORY[0x1E0CA8120]);
    objc_msgSend(*(id *)(v132 + 80), "typesetterBehavior");
    v123 = objc_msgSend((id)objc_msgSend(*(id *)(v132 + 80), "currentTextContainer"), "layoutOrientation");
    v17 = objc_msgSend(*(id *)(v132 + 80), "_forceOriginalFontBaseline");
    v18 = v132;
    v121 = v17;
    v19 = *(_QWORD *)(v132 + 88);
    if (v19)
    {
      v20 = *(_QWORD *)(v132 + 104);
    }
    else
    {
      v19 = NSAllocateScannedUncollectable();
      v18 = v132;
      *(_QWORD *)(v132 + 88) = v19;
      v20 = 8;
      *(_QWORD *)(v132 + 104) = 8;
    }
    LODWORD(v21) = 128;
    if (*(_QWORD *)(v18 + 152))
      v22 = *(_QWORD *)(v18 + 152);
    else
      v22 = v18;
    v23 = (_QWORD *)(v18 + 128);
    if (v9 < *(_QWORD *)(v18 + 136) + *(_QWORD *)(v18 + 128))
    {
      v125 = 0;
      v131 = *(_QWORD *)(v22 + 128);
      v24 = v19 + 104 * v20;
      v25 = 0x1EE06F000;
      v26 = (void *)v128;
      while (1)
      {
        v27 = v19;
        while (1)
        {
          if (v27 >= v24)
          {
            v28 = v27 - *(_QWORD *)(v18 + 88);
            *(_QWORD *)(v18 + 104) += 8;
            v29 = NSReallocateScannedUncollectable();
            v18 = v132;
            *(_QWORD *)(v132 + 88) = v29;
            v27 = v29 + v28;
            v26 = (void *)v128;
            v25 = 0x1EE06F000uLL;
            v24 = v29 + 104 * *(_QWORD *)(v132 + 104);
            LODWORD(v21) = 128;
          }
          v30 = (void *)objc_msgSend(v26, "attributesAtIndex:longestEffectiveRange:inRange:", v9, &v137, *(_QWORD *)(v18 + (int)v21), *(_QWORD *)(v18 + (int)v21 + 8));
          *(_QWORD *)v27 = v30;
          v31 = objc_msgSend(v30, "objectForKey:", CFSTR("NSAttachment"));
          v32 = (void *)v31;
          v33 = v137;
          if (v137 == v9)
            goto LABEL_34;
          if (v137 < v9 && v31 != 0 && v138 >= 2)
          {
            v47 = v137 - v9 + v138;
            goto LABEL_33;
          }
          if ((void *)setGlyphRange_characterRange__lastAttributedString == v26)
          {
            v41 = v132;
          }
          else
          {
            v36 = (objc_class *)objc_opt_class();
            v37 = NSStringFromClass(v36);
            v38 = *(int *)(v25 + 712);
            v39 = v24;
            v40 = (uint64_t)v26;
            v41 = v132;
            NSLog((NSString *)CFSTR("%@: %@ (%p) returned run range {%lu %lu} for attributes at %ld in character range {%lu %lu}. Since attribute run ranges are in inconsistent state, there might be layout issues such as garbled text or incorrect glyph spacings"), v132, v37, v40, v137, v138, v9, *(_QWORD *)(v132 + v38), *(_QWORD *)(v132 + v38 + 8));
            setGlyphRange_characterRange__lastAttributedString = v40;
            v24 = v39;
            v25 = 0x1EE06F000;
            v33 = v137;
          }
          v21 = *(int *)(v25 + 712);
          v23 = (_QWORD *)(v41 + v21);
          v42 = *(_QWORD *)(v41 + v21);
          v43 = v33 - v9;
          if (v33 >= v9)
            break;
          v18 = v41;
          v26 = (void *)v128;
          if (v9 == v42)
            goto LABEL_32;
          v44 = v138 + v33;
          v45 = v44 > v9;
          v46 = v44 - v9;
          if (!v45)
          {
            v47 = 1;
LABEL_33:
            v137 = v9;
            v138 = v47;
            goto LABEL_34;
          }
          *(_QWORD *)(v27 - 88) += v46;
          v9 = v138 + v137;
          if (v138 + v137 >= v23[1] + *v23)
          {
            v19 = v27;
            goto LABEL_146;
          }
        }
        if (v9 == v42)
        {
LABEL_32:
          v47 = v43 + v138;
          goto LABEL_33;
        }
        *(_QWORD *)(v27 - 88) += v43;
LABEL_34:
        v48 = (void *)objc_msgSend(*(id *)v27, "objectForKey:", CFSTR("NSExpansion"));
        v126 = v32;
        if (v48)
          objc_msgSend(v48, "doubleValue");
        else
          v49 = 0.0;
        v50 = v125;
        v124 = v24;
        v51 = exp(v49);
        *(long double *)(v27 + 48) = v51;
        if (v51 != 1.0)
          v50 = 1;
        v125 = v50;
        v52 = (void *)objc_msgSend(*(id *)v27, "objectForKey:", CFSTR("CTVerticalForms"));
        if ((objc_msgSend(v52, "BOOLValue") & 1) != 0)
        {
          v53 = 1;
        }
        else
        {
          if (v52)
            v54 = 1;
          else
            v54 = v123 == 0;
          v53 = !v54;
        }
        v55 = *(id *)v27;
        if (!*(_QWORD *)v27)
          goto LABEL_51;
        v56 = (void *)objc_msgSend(*(id *)v27, "objectForKey:", CFSTR("NSFont"));
        if (objc_msgSend((id)objc_msgSend(v55, "objectForKey:", CFSTR("CTVerticalForms")), "BOOLValue"))
          v56 = (void *)objc_msgSend(v56, "verticalFont");
        if (!v56)
LABEL_51:
          v56 = (void *)NSDefaultFont();
        *(_QWORD *)(v27 + 8) = v56;
        *(_DWORD *)(v27 + 96) &= ~0x80u;
        if (objc_msgSend(v56, "isEqual:", v56))
        {
          v56 = *(void **)(v27 + 8);
          if (!v53)
            goto LABEL_59;
        }
        else
        {
          *(_QWORD *)(v27 + 8) = v56;
          *(_DWORD *)(v27 + 96) |= 0x80u;
          if (!v53)
            goto LABEL_59;
        }
        v57 = objc_msgSend(v56, "verticalFont");
        if (v57)
          v56 = (void *)v57;
        *(_QWORD *)(v27 + 8) = v56;
LABEL_59:
        *(_QWORD *)(v27 + 8) = objc_msgSend(*(id *)(v132 + 80), "substituteFontForFont:", v56);
        v58 = *(id *)v27;
        if (!*(_QWORD *)v27)
          goto LABEL_66;
        if (!v121 || (v59 = (void *)objc_msgSend(*(id *)v27, "objectForKey:", _NSOriginalFontAttributeName)) == 0)
          v59 = (void *)objc_msgSend(v58, "objectForKey:", CFSTR("NSFont"));
        if (objc_msgSend((id)objc_msgSend(v58, "objectForKey:", CFSTR("CTVerticalForms")), "BOOLValue"))
          v59 = (void *)objc_msgSend(v59, "verticalFont");
        if (!v59)
LABEL_66:
          v59 = (void *)NSDefaultFont();
        v60 = (uint64_t)v59;
        if (v53)
          v60 = objc_msgSend(v59, "verticalFont");
        if (v60)
          v59 = (void *)v60;
        if ((objc_msgSend(*(id *)(v132 + 80), "usesFontLeading") & 1) == 0)
          objc_msgSend(*(id *)(v132 + 80), "paragraphSeparatorGlyphRange");
        objc_msgSend(v59, "_defaultLineHeightForUILayout");
        *(double *)(v27 + 32) = v61 + 0.0;
        objc_msgSend(v59, "ascender");
        *(_QWORD *)(v27 + 40) = v62;
        *(_QWORD *)(v27 + 56) = 0;
        if (v123 && (objc_msgSend(v59, "isVertical") & 1) == 0)
        {
          v63 = *(double *)(v27 + 32);
          v64 = ceil(v63 * 0.5);
          if (v63 <= 2.0)
            v65 = v63 * 0.5;
          else
            v65 = v64;
          *(double *)(v27 + 56) = v65 - *(double *)(v27 + 40);
          *(double *)(v27 + 40) = v65;
        }
        v66 = (void *)objc_msgSend(*(id *)v27, "objectForKey:", CFSTR("NSBaselineOffset"));
        if (v66)
          objc_msgSend(v66, "doubleValue");
        else
          v67 = 0.0;
        *(double *)(v27 + 56) = v67 + *(double *)(v27 + 56);
        v68 = (void *)objc_msgSend(*(id *)v27, "objectForKey:", CFSTR("NSSuperScript"));
        if (v68)
          *(double *)(v27 + 56) = *(double *)(v27 + 56)
                                + ceil(*(double *)(v27 + 32) * (double)objc_msgSend(v68, "integerValue") * 0.4);
        if ((*(_BYTE *)(v132 + 224) & 0x10) != 0)
        {
          v71 = objc_msgSend(*(id *)(v132 + 80), "glyphRangeForCharacterRange:actualCharacterRange:", v137, v138, 0);
          v69 = v72;
          v129 = v71;
          v70 = v71 - *(_QWORD *)(v132 + 112);
        }
        else
        {
          v69 = v138;
          v70 = v137 - *(_QWORD *)(v132 + 128);
          v129 = *(_QWORD *)(v132 + 112) + v70;
        }
        *(_QWORD *)(v27 + 24) = v70;
        if ((*(_BYTE *)(*(_QWORD *)(v122 + 40) + 217) & 0x80) == 0)
        {
          v73 = (void *)objc_msgSend(*(id *)v27, "objectForKey:", CFSTR("NSWritingDirection"));
          if (v73)
          {
            v74 = v73;
            v135 = 0u;
            v136 = 0u;
            v133 = 0u;
            v134 = 0u;
            v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v133, v139, 16);
            if (v75)
            {
              v76 = v75;
              v77 = *(_QWORD *)v134;
              while (2)
              {
                for (i = 0; i != v76; ++i)
                {
                  if (*(_QWORD *)v134 != v77)
                    objc_enumerationMutation(v74);
                  if ((objc_msgSend(*(id *)(*((_QWORD *)&v133 + 1) + 8 * i), "integerValue") & 1) != 0)
                  {
                    *(_DWORD *)(*(_QWORD *)(v122 + 40) + 216) |= 0x8000u;
                    *(_DWORD *)(v122 + 88) &= 0xFFFFFFFC;
                    goto LABEL_99;
                  }
                }
                v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v133, v139, 16);
                if (v76)
                  continue;
                break;
              }
            }
          }
        }
LABEL_99:
        v79 = *(_OWORD *)(MEMORY[0x1E0CB3438] + 16);
        *(_OWORD *)(v27 + 64) = *MEMORY[0x1E0CB3438];
        *(_OWORD *)(v27 + 80) = v79;
        *(_DWORD *)(v27 + 96) &= ~2u;
        if (objc_msgSend(*(id *)(v27 + 8), "_isDefaultFace"))
          v80 = 4;
        else
          v80 = 0;
        *(_DWORD *)(v27 + 96) = *(_DWORD *)(v27 + 96) & 0xFFFFFFFB | v80;
        *(_DWORD *)(v27 + 96) = *(_DWORD *)(v27 + 96) & 0xFFFFFFE7 | (16
                                                                    * (objc_msgSend(*(id *)(v27 + 8), "renderingMode") != 1));
        if (objc_msgSend(*(id *)(v27 + 8), "isVertical"))
          v81 = 64;
        else
          v81 = 0;
        *(_DWORD *)(v27 + 96) = *(_DWORD *)(v27 + 96) & 0xFFFFFFBF | v81;
        v82 = (void *)objc_msgSend(*(id *)(v27 + 8), "_kernOverride");
        *(_DWORD *)(v27 + 96) = *(_DWORD *)(v27 + 96) & 0xFFFFFFDF | (32 * (v82 != 0));
        if (v82)
        {
          objc_msgSend(v82, "doubleValue");
          if (v83 == 0.0)
            *(_DWORD *)(v27 + 96) |= 0x10u;
        }
        if (!v126)
        {
          *(_DWORD *)(v27 + 96) &= ~1u;
          if (v69 < 1)
          {
            v18 = v132;
          }
          else
          {
            v18 = v132;
            v88 = v129;
            v127 = &v10[v69];
            do
            {
              v130 = v88;
              v89 = objc_msgSend(*(id *)(v18 + 80), "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:");
              objc_msgSend(*(id *)(v27 + 8), "getAdvancements:forCGGlyphs:count:", v12, v10, v89);
              if (v89 < 1)
              {
                v18 = v132;
              }
              else
              {
                v90 = &v10[v89];
                v91 = 0x7FFFFFFFFFFFFFFFLL;
                v92 = &v140;
                v93 = v131;
                v18 = v132;
                do
                {
                  v94 = (unint64_t)(*(double *)(v27 + 48) != 1.0) << 19;
                  if ((*(_QWORD *)v92 & 2) != 0)
                  {
                    v95 = v94 | 0x10000;
                    if ((*(_BYTE *)(v27 + 96) & 4) == 0)
                    {
                      v96 = objc_msgSend(*(id *)(v18 + 80), "actionForControlCharacterAtIndex:", *v16);
                      v93 = v131;
                      v18 = v132;
                      *v12 = 0.0;
                      if ((v96 & 6) != 0)
                      {
                        v95 = v94 | 0x110000 | v96 & 4;
                        *(_DWORD *)(v27 + 96) |= 2u;
                        *(_DWORD *)(v132 + 224) |= 2u;
                      }
                    }
                    *v10 = 0;
                  }
                  else
                  {
                    if ((*(_QWORD *)v92 & 1) != 0
                      || (v95 = (unint64_t)(*(double *)(v27 + 48) != 1.0) << 19, !*v10))
                    {
                      *v12 = 0.0;
                      v95 = v94 | 0x20;
                    }
                    if (v91 == *v16)
                    {
                      v95 |= 0x80uLL;
                      *(v14 - 1) |= 0x80u;
                    }
                  }
                  v97 = (*(_QWORD *)v92 >> 2) & 1 | v95;
                  if ((*(_QWORD *)v92 & 8) != 0)
                  {
                    LODWORD(v97) = v97 | 0x40;
                    *(_DWORD *)(v27 + 96) |= 8u;
                  }
                  v98 = *(double *)(v27 + 48);
                  if (v98 != 1.0)
                    *v12 = v98 * *v12;
                  ++v10;
                  v92 += 8;
                  *v14++ = v97;
                  v12 += 2;
                  v91 = *v16;
                  *v16++ -= v93;
                }
                while (v10 < v90);
              }
              v88 = v89 + v130;
            }
            while (v10 < v127);
          }
          goto LABEL_141;
        }
        v84 = objc_msgSend(v126, "attachmentCell");
        v85 = *(_DWORD *)(v27 + 96);
        *(_DWORD *)(v27 + 96) = v85 | 1;
        if (v84)
        {
          v86 = (void *)v84;
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            objc_msgSend(v86, "cellSize");
            v100 = v99;
            v102 = v101;
            v103 = objc_opt_respondsToSelector();
            v104 = 0;
            v105 = 0;
            if ((v103 & 1) != 0)
              objc_msgSend(v86, "cellBaselineOffset", 0.0, 0.0);
            *(_QWORD *)(v27 + 64) = v104;
            *(_QWORD *)(v27 + 72) = v105;
            *(_QWORD *)(v27 + 80) = v100;
            *(_QWORD *)(v27 + 88) = v102;
            v18 = v132;
            goto LABEL_140;
          }
          v87 = *(_DWORD *)(v27 + 96) | 2;
        }
        else
        {
          v87 = v85 | 3;
        }
        *(_DWORD *)(v27 + 96) = v87;
        v18 = v132;
        *(_DWORD *)(v132 + 224) |= 2u;
LABEL_140:
        *v10++ = 0;
        *v14++ = 0x10000;
        *v12 = *(double *)(v27 + 80);
        v12[1] = 0.0;
        v12 += 2;
        *v16++ = v137 - v131;
        v138 = 1;
LABEL_141:
        v19 = v27 + 104;
        v21 = v137;
        v106 = v138;
        *(_QWORD *)(v27 + 16) = v138;
        v9 = v106 + v21;
        LODWORD(v21) = 128;
        v23 = (_QWORD *)(v18 + 128);
        v26 = (void *)v128;
        v24 = v124;
        v25 = 0x1EE06F000uLL;
        if (v9 >= *(_QWORD *)(v18 + 136) + *(_QWORD *)(v18 + 128))
        {
LABEL_146:
          v11 = (int *)MEMORY[0x1E0CA8100];
          v15 = (int *)MEMORY[0x1E0CA8120];
          v13 = (int *)MEMORY[0x1E0CA8118];
          break;
        }
      }
    }
    *(_QWORD *)(v18 + 96) = 0x4EC4EC4EC4EC4EC5 * ((v19 - *(_QWORD *)(v18 + 88)) >> 3);
    if (!*(_QWORD *)(v18 + 152))
    {
      *(_QWORD *)(v18 + 168) = v23[1] + *v23;
      *(_QWORD *)(v18 + 176) = 0;
      v107 = *(_QWORD *)(v18 + *v13);
      v108 = *(_QWORD *)(v18 + 120);
      if ((*(_BYTE *)(v107 + 4 * v108 - 4) & 1) != 0)
      {
        v109 = *(_QWORD *)(v18 + *v11);
        v110 = 4 * v108;
        do
        {
          v111 = v110;
          v112 = v107 + v110;
          if (v107 + v110 - 4 <= v107)
            break;
          v110 -= 4;
        }
        while ((*(_BYTE *)(v112 - 8) & 1) != 0);
        v113 = v111 - 4;
        *(_QWORD *)(v18 + 168) = *(_QWORD *)(*(_QWORD *)(v18 + *v15) + 2 * v113) + *v23;
        if (v113 >> 2 < v108)
        {
          v114 = (double *)(v109 + 16 * (v113 >> 2));
          v115 = 0.0;
          do
          {
            v116 = *v114;
            v114 += 2;
            v115 = v116 + v115;
            *(double *)(v18 + 176) = v115;
          }
          while ((unint64_t)v114 < v109 + 16 * v108);
        }
      }
    }
    v117 = *(__CFArray **)(v18 + 72);
    if (v117)
    {
      CFArrayRemoveAllValues(v117);
      v18 = v132;
    }
    if (*(_QWORD *)(v18 + 64))
    {
      result = (id *)MEMORY[0x18D790F44]();
      v118 = v132;
    }
    else
    {
      MutableWithInterface = (const void *)CTGlyphStorageCreateMutableWithInterface();
      result = (id *)CFMakeCollectable(MutableWithInterface);
      v118 = v132;
      *(_QWORD *)(v132 + 64) = result;
    }
    v120 = *(double **)(v118 + *v11);
    if (*v120 < 0.0)
      *v120 = fabs(*v120);
  }
  return result;
}

- (uint64_t)_resolvePositionalStakeGlyphsForLineFragment:(CFIndex *)a3 lineFragmentRect:(CGFloat)a4 minPosition:(CGFloat)a5 maxPosition:(CGFloat)a6 maxLineFragmentWidth:(CGFloat)a7 breakHint:(double)a8
{
  uint64_t v17;
  CFIndex Count;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  double v27;
  double v28;
  _OWORD *v29;
  const __CFString *v30;
  const char *CStringPtr;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double *v35;
  CFIndex v36;
  _BOOL4 v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  CFIndex v41;
  const __CTRun *ValueAtIndex;
  CFRange StringRange;
  uint64_t GlyphStorage;
  _QWORD *v45;
  _QWORD *v46;
  unint64_t v47;
  unint64_t v48;
  BOOL v50;
  uint64_t v51;
  CFIndex v52;
  double *v53;
  int v54;
  int v55;
  double v56;
  double *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  CGFloat v62;
  double x;
  double y;
  double width;
  double height;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  CGFloat v76;
  _BOOL4 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  BOOL v83;
  char v84;
  double *v85;
  uint64_t v86;
  char v87;
  uint64_t *v88;
  double *v89;
  uint64_t v90;
  double v91;
  unsigned int v92;
  int v93;
  uint64_t v94;
  UniChar *v95;
  double *v96;
  uint64_t v97;
  UniChar v98;
  int IsLongCharacterMember;
  double v100;
  double v101;
  _BOOL4 v102;
  uint64_t v103;
  void *v104;
  void *v105;
  int v106;
  double v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v112;
  uint64_t v113;
  double *v114;
  uint64_t v115;
  double v116;
  double v117;
  BOOL v118;
  double v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  void *v131;
  CGFloat v132;
  CGFloat v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  unint64_t v147;
  CFIndex v149;
  double v150;
  uint64_t v151;
  double v152;
  CFIndex *v153;
  uint64_t v154;
  double v155;
  double v156;
  uint64_t v157;
  _OWORD *v158;
  double v159;
  double v160;
  uint64_t v161;
  double v162;
  double v163;
  char v164;
  CGFloat v165;
  CGFloat v166;
  CGFloat v167;
  CGFloat v168;
  uint64_t v169;
  double *v170;
  int v171;
  uint64_t v172;
  uint64_t v175;
  const __CFCharacterSet *theSet;
  BOOL v177;
  int v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  const __CFArray *theArray;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  const __CTRun *run;
  UniChar buffer[8];
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  CFStringRef theString[2];
  _OWORD v196[2];
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  _OWORD v200[8];
  uint64_t v201;
  CFRange v202;
  CFRange v203;
  NSRect v204;
  NSRect v205;
  CGRect v206;
  CGRect v207;
  NSRect v208;
  NSRect v209;
  NSRect v210;
  NSRect v211;
  NSRect v212;
  CGRect v213;
  NSRect v214;

  v201 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v17 = a1;
  v172 = objc_msgSend(*(id *)(a1 + 80), "currentTextContainer");
  theArray = CTLineGetGlyphRuns(a2);
  Count = CFArrayGetCount(theArray);
  v199 = 0;
  v198 = 0;
  objc_msgSend(*(id *)(v17 + 80), "lineFragmentPadding");
  v20 = v19;
  v21 = objc_msgSend(*(id *)(v17 + 80), "_baseWritingDirection");
  v22 = objc_msgSend(*(id *)(v17 + 80), "applicationFrameworkContext");
  memset(v200, 0, sizeof(v200));
  v197 = 0;
  memset(v196, 0, sizeof(v196));
  v194 = 0u;
  *(_OWORD *)theString = 0u;
  v192 = 0u;
  v193 = 0u;
  v190 = 0u;
  v191 = 0u;
  v188 = 0u;
  v189 = 0u;
  *(_OWORD *)buffer = 0u;
  if ((*(_BYTE *)(v17 + 224) & 2) == 0)
    return 1;
  v24 = v22;
  v25 = v21 == 1;
  v155 = v20;
  if (v21 == 1)
    v26 = -1;
  else
    v26 = 1;
  if (v21 == 1)
    v27 = a6 + v20 * -2.0 - a9;
  else
    v27 = a8;
  if (a10 <= 0.0)
    v28 = 0.0;
  else
    v28 = v27 + a10;
  v183 = Count;
  if (Count < 17)
    v29 = v200;
  else
    v29 = NSZoneMalloc(0, 8 * Count);
  v30 = (const __CFString *)objc_msgSend((id)objc_msgSend(*(id *)(v17 + 80), "attributedString"), "string");
  theString[0] = v30;
  *(_OWORD *)((char *)v196 + 8) = *(_OWORD *)(v17 + 128);
  theString[1] = (CFStringRef)CFStringGetCharactersPtr(v30);
  if (theString[1])
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(v30, 0x600u);
  *((_QWORD *)&v196[1] + 1) = 0;
  v197 = 0;
  *(_QWORD *)&v196[0] = CStringPtr;
  if (v183 < 1)
    goto LABEL_208;
  v153 = a3;
  v151 = v24;
  v177 = 0;
  v178 = a3 != 0;
  v152 = a8;
  v32 = 0;
  v33 = v21;
  v34 = 0;
  v35 = 0;
  theSet = 0;
  v169 = 0;
  v36 = 0;
  v185 = v33;
  v83 = v33 == 1;
  v37 = v33 != 1;
  v38 = v83;
  v157 = v38;
  v158 = v29;
  v167 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  v168 = *MEMORY[0x1E0CB3438];
  v165 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  v166 = *(double *)(MEMORY[0x1E0CB3438] + 16);
  v156 = a9 + 0.001;
  v154 = 2 * v37;
  v162 = a6 - v155;
  v179 = 4 * v26;
  v180 = 16 * v26;
  v181 = 8 * v26;
  v161 = 2 * v25;
  v184 = v161;
  v39 = 0.0;
  v159 = a6;
  v160 = a7;
  v40 = v183;
  v175 = v17;
  do
  {
    if (v185 == 1)
      v41 = v40 + ~v34;
    else
      v41 = v34;
    ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(theArray, v41);
    StringRange = CTRunGetStringRange(ValueAtIndex);
    run = ValueAtIndex;
    GlyphStorage = CTRunGetGlyphStorage();
    v45 = (_QWORD *)MEMORY[0x18D790F38](GlyphStorage);
    v46 = v45;
    v47 = v45[11];
    v48 = v47 + 104 * v45[12];
    v50 = v47 <= v32 && v32 < v48 && v36 <= StringRange.location;
    if (!v50)
    {
      if (v45[25] && v45[26] <= StringRange.location)
      {
        v32 = *(_QWORD *)(v17 + 200);
        v36 = *(_QWORD *)(v17 + 208);
      }
      else
      {
        v51 = v45[19];
        if (v51)
          v36 = v45[16] - *(_QWORD *)(v51 + 128);
        else
          v36 = 0;
        v32 = v45[11];
      }
    }
    if (!v32 || v32 >= v48)
    {
      v52 = v36;
LABEL_47:
      NSLog((NSString *)CFSTR("NSATSGlyphStorage inconsistency. Cannot find run storage for character range {%ld %ld} for CTRun %p. Ignoring the run..."), StringRange.location, StringRange.length, run);
      v32 = 0;
      v36 = v52;
      goto LABEL_48;
    }
    while (1)
    {
      v52 = *(_QWORD *)(v32 + 16) + v36;
      if (StringRange.location < v52)
        break;
      v32 += 104;
      v36 = v52;
      if (v32 >= v48)
        goto LABEL_47;
    }
    v53 = (double *)(*(_QWORD *)((char *)v45 + (int)*MEMORY[0x1E0CA8100]) + 16 * v198);
    v54 = (v185 == 1) ^ ((CTRunGetStatus(run) & 1) == 0);
    v178 &= v54;
    v55 = *(_DWORD *)(v32 + 96);
    if ((v55 & 1) != 0)
    {
      v56 = *v53;
      v57 = v53;
      if ((v55 & 2) != 0 && (v58 = (void *)objc_msgSend(*(id *)v32, "objectForKey:", CFSTR("NSAttachment"))) != 0)
      {
        v59 = v58;
        v170 = v53;
        v60 = (void *)objc_msgSend(v58, "attachmentCell");
        objc_msgSend(v59, "lineLayoutPadding");
        v62 = v61;
        v204.origin.x = a4;
        v204.origin.y = a5;
        v204.size.width = a6;
        v204.size.height = a7;
        v163 = v62;
        v205 = NSInsetRect(v204, v62, 0.0);
        x = v205.origin.x;
        y = v205.origin.y;
        width = v205.size.width;
        height = v205.size.height;
        if (v60)
        {
          v67 = v205.size.width - v155 - v27;
          if (v185 != 1)
            v67 = v27;
          objc_msgSend(v60, "cellFrameForTextContainer:proposedLineFragment:glyphPosition:characterIndex:", v172, *(_QWORD *)(v17 + 128) + StringRange.location, x, v205.origin.y, v205.size.width, v205.size.height, x + v67, v205.origin.y);
          v69 = v68;
          v71 = v70;
          v73 = v72;
          v75 = v74;
          v40 = v183;
          v57 = v53;
          v76 = v163;
        }
        else
        {
          v57 = v53;
          v125 = v172;
          v40 = v183;
          if (!v172)
          {
            if (objc_msgSend(v59, "_allocatesTextContainer"))
              v125 = objc_msgSend(*(id *)(v17 + 80), "_textContainerForAttachmentProtocol");
            else
              v125 = 0;
          }
          v126 = width - v155 - v27;
          if (v185 != 1)
            v126 = v27;
          v150 = x + v126;
          objc_msgSend(v59, "attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:", v125, *(_QWORD *)(v17 + 128) + StringRange.location, x, y, width, height);
          v69 = v127;
          v71 = v128;
          v73 = v129;
          v75 = v130;
          if (v151 == 2)
          {
            objc_msgSend(v59, "bounds");
            if (CGRectIsEmpty(v206))
            {
              if (objc_msgSend((id)objc_msgSend(v59, "image"), "conformsToProtocol:", &unk_1EE095188))
              {
                v131 = (void *)objc_msgSend(v59, "image");
                objc_msgSend(v131, "size");
                v213.size.width = v132;
                v213.size.height = v133;
                v213.origin.x = 0.0;
                v213.origin.y = 0.0;
                v207.origin.x = v69;
                v207.origin.y = v71;
                v207.size.width = v73;
                v207.size.height = v75;
                if (CGRectEqualToRect(v207, v213)
                  && objc_msgSend(v131, "willProvideAdaptedImageForPresentation"))
                {
                  objc_msgSend(v131, "attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:", *(_QWORD *)v32, 0, v125, v69, v71, v73, v75, v150, y);
                  v69 = v134;
                  v71 = v135;
                  v73 = v136;
                  v75 = v137;
                }
                v40 = v183;
                v57 = v170;
              }
            }
          }
          objc_msgSend(v59, "lineLayoutPadding");
          v76 = v163;
          if (v163 != v138)
          {
            objc_msgSend(v59, "lineLayoutPadding");
            v76 = v139;
            v208.origin.x = a4;
            v208.origin.y = a5;
            v208.size.width = v159;
            v208.size.height = v160;
            v209 = NSInsetRect(v208, v76, 0.0);
            v140 = v209.size.width - v155 - v27;
            if (v185 != 1)
              v140 = v27;
            objc_msgSend(v59, "attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:", v125, *(_QWORD *)(v17 + 128) + StringRange.location, v209.origin.x, v209.origin.y, v209.size.width, v209.size.height, v209.origin.x + v140, v209.origin.y);
            v69 = v141;
            v71 = v142;
            v73 = v143;
            v75 = v144;
          }
        }
        if (v76 != 0.0)
        {
          v210.origin.x = v69;
          v210.origin.y = v71;
          v210.size.width = v73;
          v210.size.height = v75;
          v211 = NSInsetRect(v210, -v76, 0.0);
          v69 = v211.origin.x;
          v71 = v211.origin.y;
          v73 = v211.size.width;
          v75 = v211.size.height;
        }
        v77 = objc_msgSend(v59, "embeddingType") == 1;
        if ((v40 == 1 || v27 == v152) && v28 > 0.0 && v27 + v73 > v28)
          v56 = v28 - v27;
        else
          v56 = v73;
      }
      else
      {
        v77 = 0;
        v75 = v165;
        v73 = v166;
        v71 = v167;
        v69 = v168;
        v40 = v183;
      }
      if (v35)
      {
        if (v184 == 1)
          v145 = v56 * 0.5;
        else
          v145 = v56;
        if (v145 >= v39)
        {
          v56 = v56 - v39;
          *v35 = 0.0;
          v35 = 0;
        }
        else
        {
          if (v184 == 1)
            v56 = v56 * 0.5;
          else
            v56 = 0.0;
          v39 = v39 - v145;
        }
      }
      v27 = v27 + v56;
      if (v28 <= 0.0)
        goto LABEL_200;
      if (v34 <= 0)
        v77 = 0;
      if (v27 <= v28 && !v77)
      {
LABEL_200:
        v212.origin.x = v69;
        v212.origin.y = v71;
        v212.size.width = v73;
        v212.size.height = v75;
        v214.origin.y = v167;
        v214.origin.x = v168;
        v214.size.height = v165;
        v214.size.width = v166;
        if (!NSEqualRects(v212, v214))
        {
          *(double *)(v32 + 64) = v69;
          *(double *)(v32 + 72) = v71;
          *(double *)(v32 + 80) = v73;
          *(double *)(v32 + 88) = v75;
          *v57 = v73;
          *((_QWORD *)v158 + v169++) = run;
        }
        a6 = v159;
        a7 = v160;
        goto LABEL_49;
      }
      if (v178)
      {
        v124 = *(_QWORD *)(v17 + 128) + StringRange.location;
LABEL_220:
        *v153 = v124;
      }
      goto LABEL_221;
    }
    if ((v55 & 2) == 0 && !v35)
    {
      v202.location = 0;
      v202.length = 0;
      v35 = 0;
      v27 = v27 + CTRunGetTypographicBounds(run, v202, 0, 0, 0);
      if (v28 > 0.0)
      {
        v40 = v183;
        if (v27 <= v28)
          goto LABEL_49;
        if (v178)
        {
          v149 = StringRange.location + StringRange.length + *(_QWORD *)(v17 + 128);
          if (v149 >= *v153)
            v149 = *v153;
          *v153 = v149;
        }
LABEL_221:
        v23 = 0;
        v29 = v158;
        goto LABEL_209;
      }
LABEL_48:
      v40 = v183;
      goto LABEL_49;
    }
    v78 = v199;
    v79 = v199 - 1;
    v80 = *(_QWORD *)((char *)v46 + (int)*MEMORY[0x1E0CA8118]);
    v81 = *(_QWORD *)((char *)v46 + (int)*MEMORY[0x1E0CA8120]);
    if (v185 != 1)
      v79 = 0;
    v82 = *(_QWORD *)(v81 + 8 * v198 + 8 * v79);
    --v199;
    if (v78 < 1)
    {
      v91 = v27;
      v40 = v183;
      v89 = v35;
      goto LABEL_154;
    }
    v83 = v183 == 1 && StringRange.length == 1;
    v84 = v83;
    v85 = &v53[2 * v79];
    v86 = v80 + 4 * v198 + 4 * v79;
    if (v28 > 0.0)
      v87 = v84;
    else
      v87 = 0;
    v164 = v87;
    v171 = v54 ^ 1;
    v88 = (uint64_t *)(v81 + v181 + 8 * v79 + 8 * v198);
    v89 = v35;
    v90 = v82;
    while (1)
    {
      v91 = v27;
      v92 = *(_DWORD *)v86;
      v93 = *(_DWORD *)v86 & 4;
      if (!v89)
        goto LABEL_88;
      if (!v93)
      {
        if (!theSet)
          goto LABEL_102;
        if (v90 < 0 || (v94 = *(_QWORD *)&v196[1], *(uint64_t *)&v196[1] <= v90))
        {
          v96 = v89;
          v98 = 0;
        }
        else
        {
          v95 = (UniChar *)theString[1];
          if (theString[1])
          {
            v96 = v89;
            v97 = *((_QWORD *)&v196[0] + 1) + v90;
            goto LABEL_84;
          }
          if (*(_QWORD *)&v196[0])
          {
            v96 = v89;
            v98 = *(char *)(*(_QWORD *)&v196[0] + *((_QWORD *)&v196[0] + 1) + v90);
          }
          else
          {
            v96 = v89;
            if (v197 <= v90 || (v121 = *((_QWORD *)&v196[1] + 1), *((uint64_t *)&v196[1] + 1) > v90))
            {
              v122 = v90 - 4;
              if ((unint64_t)v90 < 4)
                v122 = 0;
              if (v122 + 64 < *(uint64_t *)&v196[1])
                v94 = v122 + 64;
              *((_QWORD *)&v196[1] + 1) = v122;
              v197 = v94;
              v203.location = *((_QWORD *)&v196[0] + 1) + v122;
              v203.length = v94 - v122;
              CFStringGetCharacters(theString[0], v203, buffer);
              v121 = *((_QWORD *)&v196[1] + 1);
            }
            v97 = v90 - v121;
            v95 = buffer;
LABEL_84:
            v98 = v95[v97];
          }
        }
        IsLongCharacterMember = CFCharacterSetIsLongCharacterMember(theSet, v98);
        v89 = v96;
        if (!IsLongCharacterMember)
        {
LABEL_102:
          v100 = *v85;
          goto LABEL_103;
        }
      }
      *v89 = v39;
LABEL_88:
      v100 = *v85;
      if (!v93)
      {
        v89 = 0;
LABEL_103:
        if ((*(_BYTE *)(v86 + 2) & 0x10) != 0)
        {
          v112 = *(void **)(v175 + 80);
          v113 = v34;
          v114 = v89;
          v115 = objc_msgSend(v112, "glyphRangeForCharacterRange:actualCharacterRange:", *(_QWORD *)(v175 + 128) + v90, 1, 0);
          if (v185 == 1)
            v116 = v162 - v27;
          else
            v116 = v27;
          objc_msgSend(v112, "boundingBoxForControlGlyphAtIndex:forTextContainer:proposedLineFragment:glyphPosition:characterIndex:", v115, v172, *(_QWORD *)(v175 + 128) + v90, a4, a5, a6, a7, a4 + v116, a5);
          v89 = v114;
          v34 = v113;
          v102 = 0;
          if ((v164 & (v27 + v117 > v28)) != 0)
            v100 = v28 - v27;
          else
            v100 = v117;
          v101 = v100;
        }
        else
        {
          v102 = 0;
          v101 = 0.0;
        }
        v103 = v184;
LABEL_124:
        if (v89)
        {
          if (v103 == 1)
            v119 = v100 * 0.5;
          else
            v119 = v100;
          v102 = 0;
          if (v119 >= v39)
          {
            v100 = v100 - v39;
            *v89 = 0.0;
            v89 = 0;
          }
          else
          {
            if (v103 == 1)
              v100 = v100 * 0.5;
            else
              v100 = 0.0;
            v39 = v39 - v119;
          }
        }
        goto LABEL_134;
      }
      if (v177)
      {
        v89 = 0;
        v101 = 0.0;
        v102 = 1;
        v177 = 1;
        v103 = v184;
        goto LABEL_134;
      }
      v104 = (void *)objc_msgSend(*(id *)(v175 + 80), "textTabForGlyphLocation:writingDirection:maxLocation:", v157, v27, v156);
      v177 = v104 == 0;
      if (v104)
      {
        v105 = v104;
        v106 = (v92 >> 2) & 1;
        objc_msgSend(v104, "location");
        v100 = v107 - v27;
        v108 = objc_msgSend(v105, "alignment");
        if (v108 == 3)
          v109 = 0;
        else
          v109 = v108;
        v110 = objc_msgSend((id)objc_msgSend(v105, "options"), "objectForKey:", CFSTR("NSTabColumnTerminatorsAttributeName"));
        theSet = (const __CFCharacterSet *)v110;
        if (v109 != 4 || v110 == 0)
          v103 = v109;
        else
          v103 = v154;
      }
      else
      {
        if (v28 > 0.0)
        {
          if (!v178)
            goto LABEL_221;
          v124 = *(_QWORD *)(v175 + 128) + v90;
          goto LABEL_220;
        }
        v106 = 0;
        theSet = 0;
        v100 = 0.0;
        v103 = v161;
      }
      v118 = v161 == v103 || v103 == 4;
      if (!v118)
        v39 = v100;
      v101 = 0.0;
      if (v118)
      {
        v101 = v100;
        v89 = 0;
      }
      else
      {
        v89 = v85;
      }
      v102 = v106 != 0;
      if (!v106)
        goto LABEL_124;
LABEL_134:
      v27 = v27 + v100;
      v184 = v103;
      if (v28 > 0.0 && v27 > v28)
        break;
      if ((*(_BYTE *)(v86 + 2) & 0x10) != 0)
      {
        *v85 = v101;
        if (((v102 | v171) & 1) == 0)
          *(_DWORD *)v86 &= ~0x100000u;
      }
      v120 = v199;
      v90 = *v88;
      --v199;
      v85 = (double *)((char *)v85 + v180);
      v86 += v179;
      v88 = (uint64_t *)((char *)v88 + v181);
      if (v120 <= 0)
      {
        v91 = v91 + v100;
        v17 = v175;
        v40 = v183;
        goto LABEL_154;
      }
    }
    if (!v178)
      goto LABEL_221;
    v123 = v90;
    v17 = v175;
    v124 = *(_QWORD *)(v175 + 128) + v123;
    v40 = v183;
    v34 = v183;
    if (v124 < *v153)
      goto LABEL_220;
LABEL_154:
    v35 = v89;
    if ((*(_BYTE *)(v32 + 96) & 2) != 0)
    {
      *((_QWORD *)v158 + v169) = run;
      v27 = v91;
      ++v169;
    }
    else
    {
      v27 = v91;
    }
LABEL_49:
    ++v34;
  }
  while (v34 < v40);
  if (v35)
    *v35 = v39;
  v147 = v169;
  v29 = v158;
  if (v169 >= 1)
  {
    do
    {
      CTRunSyncWithStorage();
      v50 = v147-- > 1;
    }
    while (v50);
    CTLineSyncWithRuns();
  }
LABEL_208:
  v23 = 1;
LABEL_209:
  if (v29 != v200)
    NSZoneFree(0, v29);
  return v23;
}

- (uint64_t)_collectElasticRangeSurroundingCharacterAtIndex:(uint64_t)a3 minimumCharacterIndex:
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  char *v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  _BYTE *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  int *v36;
  int *v37;
  uint64_t v38;
  int *v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  int v48;
  _QWORD *v49;
  uint64_t v50;
  int64_t *v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  int64_t *v59;
  int64_t *v60;
  int64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  _BYTE *v70;
  unint64_t v71;
  _BYTE *v72;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  _BYTE *v80;
  unint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  _BYTE *v87;
  uint64_t v88;
  uint64_t *v89;
  _BYTE *v90;
  uint64_t v91;
  uint64_t v92;
  BOOL v93;
  uint64_t v94;
  BOOL v95;
  _BYTE *v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _BYTE *v102;
  _BYTE v103[128];
  _QWORD v104[18];

  v104[16] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if ((*(_BYTE *)(a1 + 224) & 4) != 0 || objc_msgSend(*(id *)(a1 + 80), "_bidiLevels"))
  {
    v6 = objc_msgSend(*(id *)(a1 + 80), "glyphRangeForCharacterRange:actualCharacterRange:", a2, *(_QWORD *)(a1 + 128) - a2 + *(_QWORD *)(a1 + 136), 0);
    v8 = v6 + v7;
    if (v6 < v6 + v7)
    {
      v9 = v6;
      while (1)
      {
        v10 = v8 - v9 >= 0x10 ? 16 : v8 - v9;
        v11 = objc_msgSend(*(id *)(a1 + 80), "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", v9, v10, 0, v103, v104, 0);
        if (v11)
          break;
LABEL_13:
        v9 += v11;
        if (v9 >= v8)
          goto LABEL_14;
      }
      v12 = v104;
      v13 = v103;
      v14 = v11;
      while (1)
      {
        v15 = *v13;
        v13 += 8;
        if ((v15 & 4) == 0)
          break;
        ++v12;
        if (!--v14)
          goto LABEL_13;
      }
    }
LABEL_14:
    v16 = objc_msgSend(*(id *)(a1 + 80), "glyphRangeForCharacterRange:actualCharacterRange:", a3, a2 - a3, 0);
    v18 = v16 + v17;
    if (v16 < v16 + v17)
    {
      v19 = v16;
      while (1)
      {
        v20 = v18 - v19 >= 0x10 ? 16 : v18 - v19;
        v18 -= v20;
        v21 = objc_msgSend(*(id *)(a1 + 80), "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", v18);
        if (v21)
          break;
LABEL_22:
        if (v19 >= v18)
          return a3;
      }
      while ((*(_QWORD *)&v103[8 * v21 - 8] & 4) != 0)
      {
        if (!--v21)
          goto LABEL_22;
      }
      return v104[v21 - 1] + 1;
    }
    return a3;
  }
  v23 = *(_QWORD *)(a1 + 128);
  v24 = a2 - v23;
  v25 = a3 - v23;
  v26 = (int *)MEMORY[0x1E0CA8118];
  if ((*(_BYTE *)(a1 + 224) & 0x10) == 0)
  {
    v27 = *(_QWORD *)(a1 + (int)*MEMORY[0x1E0CA8118]);
    v28 = v27 + 4 * v24;
    v29 = *(_QWORD *)(a1 + 120);
    if (v24 < v29)
    {
      v30 = v27 + 4 * v29;
      v31 = v27 - 4 * v23 + 4 * a2 + 4;
      do
      {
        v32 = (_BYTE *)v31;
        if ((*(_BYTE *)(v31 - 4) & 1) == 0)
          break;
        if (v31 >= v30)
          break;
        v28 += 4;
        v31 += 4;
      }
      while ((*v32 & 0x40) == 0);
    }
    v98 = v27 + 4 * v25;
    v99 = v27 - 4;
    v100 = 4 * a2 - 4 * v23;
    do
    {
      v101 = v100;
      v102 = (_BYTE *)(v99 + v100);
      if (v99 + v100 < v98)
        break;
      v100 -= 4;
    }
    while ((*v102 & 1) != 0);
    return v23 + (v101 >> 2);
  }
  v33 = *(_QWORD *)(a1 + 88);
  v34 = v33 + 104 * *(_QWORD *)(a1 + 96);
  if (*(_QWORD *)(a1 + 200))
  {
    if (*(_QWORD *)(a1 + 208) > v25)
    {
      v35 = 0;
    }
    else
    {
      v33 = *(_QWORD *)(a1 + 200);
      v35 = *(_QWORD *)(a1 + 208);
    }
  }
  else
  {
    v35 = 0;
  }
  v36 = (int *)MEMORY[0x1E0CA80F8];
  v37 = (int *)MEMORY[0x1E0CA8108];
  if (v33 >= v34)
  {
    v38 = 0;
    v40 = v34;
    goto LABEL_122;
  }
  v38 = 0;
  v39 = (int *)MEMORY[0x1E0CA8120];
  v40 = v34;
  v41 = (_QWORD *)v33;
  while (1)
  {
    if (v25 >= v35 && v25 < v41[2] + v35)
    {
      if ((unint64_t)v24 >= *(_QWORD *)(a1 + 136))
      {
        v33 = (unint64_t)v41;
        goto LABEL_122;
      }
      *(_QWORD *)(a1 + 200) = v41;
      *(_QWORD *)(a1 + 208) = v35;
      v33 = (unint64_t)v41;
    }
    v42 = v41[2] + v35;
    if (v24 < v42)
      break;
LABEL_118:
    v41 += 13;
    v35 = v42;
    if ((unint64_t)v41 >= v34)
      goto LABEL_122;
  }
  v43 = v41[3];
  v44 = *(_QWORD *)(a1 + *v36);
  v45 = (uint64_t *)(v44 + 8 * v43);
  if (v44)
    v46 = (uint64_t *)(v44 + 8 * v43);
  else
    v46 = 0;
  if (v35 > v24)
  {
    v47 = 0;
    v48 = *v26;
    goto LABEL_103;
  }
  if ((unint64_t)(v41 + 13) >= v34)
    v49 = (_QWORD *)(a1 + *v37);
  else
    v49 = v41 + 16;
  v50 = *(_QWORD *)(a1 + *v39);
  v51 = (int64_t *)(v50 + 8 * v43);
  v52 = v50 + 8 * *v49;
  v53 = *(_DWORD *)(a1 + 224);
  if ((v53 & 0x20) != 0)
  {
    v47 = 0;
  }
  else
  {
    if (!v46)
    {
      v47 = 0;
LABEL_67:
      v58 = v52 - 8 * v47 - 8;
      if ((unint64_t)v51 <= v58)
      {
        v59 = v51;
        do
        {
          v60 = &v59[(uint64_t)(v58 - (_QWORD)v59) >> 4];
          if (v24 >= *v60)
          {
            if (v24 <= *v60)
            {
              v46 = 0;
              v51 = v60;
              goto LABEL_75;
            }
            v59 = v60 + 1;
          }
          else
          {
            v58 = (unint64_t)(v60 - 1);
          }
        }
        while ((unint64_t)v59 <= v58);
      }
      v46 = 0;
      goto LABEL_75;
    }
    if (*(_QWORD *)(a1 + 96) == 1)
    {
      v54 = *(_QWORD *)(a1 + *v37);
      if (v54 >= 1001)
      {
        if ((v53 & 0x40) == 0)
        {
          v55 = v44 + 8 * v54;
          v56 = *(_QWORD *)(a1 + 216);
          if ((unint64_t)v45 < v55 - 8 * v56)
          {
            do
            {
              v57 = *v45++;
              v56 += v57;
              *(_QWORD *)(a1 + 216) = v56;
            }
            while ((unint64_t)v45 < v55 - 8 * v56);
            v53 = *(_DWORD *)(a1 + 224);
          }
          *(_DWORD *)(a1 + 224) = v53 | 0x40;
        }
        v47 = *(_QWORD *)(a1 + 216);
        goto LABEL_67;
      }
    }
    v47 = 0;
    v46 = v45;
  }
LABEL_75:
  if ((unint64_t)v51 >= v52 - 8 * v47)
    return a2;
  v61 = v51;
  while (*v51 < v24)
  {
    if (v46)
    {
      v62 = *v46++;
      v47 += v62;
    }
    ++v51;
    ++v61;
    if ((unint64_t)v51 >= v52 - 8 * v47)
      return a2;
  }
  if (*v51 != v24)
    return a2;
  v63 = (uint64_t)v61 - *(_QWORD *)(a1 + *v39);
  v43 = v63 >> 3;
  v64 = *(_QWORD *)(a1 + *v36);
  if (v46)
    v65 = 1;
  else
    v65 = v64 == 0;
  v66 = (uint64_t *)(v64 + (v63 & 0xFFFFFFFFFFFFFFF8));
  if (!v65)
    v46 = v66;
  v48 = *v26;
  if (v35 < v24)
  {
    v67 = *(_QWORD *)(a1 + v48);
    v68 = v67 + 4 * v43;
    v69 = v67 + 4 * v41[3];
    if (v68 - 4 >= v69 && (*(_BYTE *)(v68 - 4) & 1) != 0)
    {
      v71 = v67 + 4 * v43 - 8;
      while (1)
      {
        v72 = (_BYTE *)v71;
        if (v46)
        {
          if (*--v46)
            break;
        }
        if (v71 >= v69)
        {
          v71 -= 4;
          if ((*v72 & 1) != 0)
            continue;
        }
        v70 = v72 + 4;
        goto LABEL_100;
      }
      v70 = (_BYTE *)(v71 + 8);
    }
    else
    {
      v70 = (_BYTE *)(v67 + 4 * v43);
    }
LABEL_100:
    v74 = v68 - (_QWORD)v70;
    a2 -= v74 >> 2;
    v38 += v74 >> 2;
    if (v70 != (_BYTE *)v69)
      v33 = (unint64_t)v41;
  }
  v40 = (unint64_t)v41;
LABEL_103:
  if ((unint64_t)(v41 + 13) >= v34)
    v75 = (_QWORD *)(a1 + *v37);
  else
    v75 = v41 + 16;
  v76 = *(_QWORD *)(a1 + v48);
  v77 = v76 + 4 * v43;
  v78 = v76 + 4 * *v75 - 4 * v47;
  if (v77 >= v78)
  {
    v81 = v77;
LABEL_117:
    v38 += (uint64_t)(v81 - v77) >> 2;
    v42 = v41[2] + v35;
    goto LABEL_118;
  }
  v79 = 0;
  while ((*(_BYTE *)(v77 + v79) & 1) != 0)
  {
    v80 = (_BYTE *)(v77 + v79 + 4);
    if ((unint64_t)v80 < v78 && (*v80 & 0x40) != 0)
      break;
    if (v46)
    {
      if (*v46 > 0)
        break;
      ++v46;
    }
    v79 += 4;
    v81 = v77 + v79;
    if (v77 + v79 >= v78)
      goto LABEL_117;
  }
  v38 += v79 >> 2;
  do
  {
LABEL_122:
    if (v40 - 104 < v33)
      break;
    v82 = (uint64_t *)(v40 >= v34 ? a1 + *v37 : v40 + 24);
    v83 = *(_QWORD *)(a1 + *v26);
    v84 = *(_QWORD *)(v40 - 80);
    v85 = *v82;
    v86 = v83 + 4 * *v82;
    if (v84 >= v85)
    {
      v87 = 0;
    }
    else
    {
      v87 = 0;
      v88 = *(_QWORD *)(a1 + *v36);
      v89 = (uint64_t *)(v88 + 8 * v84);
      if (!v88)
        v89 = 0;
      v90 = (_BYTE *)(v83 + 4 * v84 + 4);
      do
      {
        if (v87 || (v87 = v90 - 4, (*(v90 - 4) & 1) == 0) || (unint64_t)v90 < v86 && (*v90 & 0x40) != 0)
          v87 = 0;
        if (v89)
        {
          v92 = *v89++;
          v91 = v92;
          v93 = v92 <= 0;
          v94 = v92 > 0 ? -v91 : 0;
          v86 += 4 * v94;
          if (!v93)
            v87 = 0;
        }
        v95 = (unint64_t)v90 >= v86;
        v90 += 4;
      }
      while (!v95);
    }
    v96 = (_BYTE *)(v83 + 4 * v84);
    v97 = (uint64_t)(v86 - (_QWORD)v87) >> 2;
    if (!v87)
      v97 = 0;
    v38 += v97;
    a2 -= v97;
    v40 -= 104;
  }
  while (v87 == v96);
  return a2;
}

- (double)_widthForStringRange:(uint64_t)a3
{
  double v3;
  unint64_t v5;
  unint64_t v6;
  CFIndex v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  double *v12;
  double v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v18;
  uint64_t v19;
  int64_t v20;
  double *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  _QWORD *v28;
  int64_t v29;
  char *v30;
  char *v31;
  unint64_t *v32;
  CFIndex v33;
  uint64_t v35;
  CFIndex Count;
  CFIndex v37;
  CFIndex i;
  const __CTRun *ValueAtIndex;
  CFRange StringRange;
  CFIndex v41;
  uint64_t GlyphStorage;
  CFRange v45;

  v3 = 0.0;
  if (a1 && a3)
  {
    v5 = a2 - *(_QWORD *)(a1 + 128);
    v6 = *(_QWORD *)(a1 + 144);
    if (v5 + a3 >= v6)
      v7 = *(_QWORD *)(a1 + 144);
    else
      v7 = v5 + a3;
    if (v5 >= v6)
      v8 = *(_QWORD *)(a1 + 144);
    else
      v8 = a2 - *(_QWORD *)(a1 + 128);
    v9 = *(_DWORD *)(a1 + 224);
    if ((v9 & 0x10) != 0)
    {
      if ((v9 & 4) != 0)
      {
        Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 72));
        if (Count >= 1)
        {
          v37 = Count;
          for (i = 0; i != v37; ++i)
          {
            ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 72), i);
            StringRange = CTRunGetStringRange(ValueAtIndex);
            if (v7 <= StringRange.location)
              break;
            v41 = StringRange.location + StringRange.length;
            if (v8 <= StringRange.location && v41 < v7)
            {
              v45.location = 0;
              v45.length = 0;
              v3 = v3 + CTRunGetTypographicBounds(ValueAtIndex, v45, 0, 0, 0);
            }
            else if (v41 >= v8)
            {
              GlyphStorage = CTRunGetGlyphStorage();
              MEMORY[0x18D790F38](GlyphStorage);
            }
          }
        }
      }
      else
      {
        v14 = *(_QWORD **)(a1 + 88);
        v15 = (unint64_t)&v14[13 * *(_QWORD *)(a1 + 96)];
        v16 = *(_QWORD *)(a1 + 200);
        if (v16)
        {
          if (*(_QWORD *)(a1 + 208) > v8)
          {
            v16 = 0;
          }
          else
          {
            v14 = *(_QWORD **)(a1 + 200);
            v16 = *(_QWORD *)(a1 + 208);
          }
        }
        for (; (unint64_t)v14 < v15 && (uint64_t)v16 < v7; v14 += 13)
        {
          v16 += v14[2];
          if (v16 > v8)
          {
            if ((unint64_t)(v14 + 13) >= v15)
              v18 = (_QWORD *)(a1 + (int)*MEMORY[0x1E0CA8108]);
            else
              v18 = v14 + 16;
            v19 = *(_QWORD *)(a1 + (int)*MEMORY[0x1E0CA8100]);
            v20 = v14[3];
            v21 = (double *)(v19 + 16 * v20);
            v22 = v19 + 16 * *v18;
            v23 = *(_QWORD *)(a1 + (int)*MEMORY[0x1E0CA8120]);
            v24 = (unint64_t *)(v23 + 8 * v20);
            v25 = *(_QWORD *)(a1 + (int)*MEMORY[0x1E0CA80F8]);
            v26 = (_QWORD *)(v25 + 8 * v20);
            if (v25)
              v27 = v25 + 8 * v20;
            else
              v27 = 0;
            if ((v9 & 0x20) == 0)
            {
              if ((v9 & 0x40) != 0)
              {
                if (*(_QWORD *)(a1 + (int)*MEMORY[0x1E0CA8108]) >= *(_QWORD *)(a1 + 120))
                  v27 = 0;
                else
                  v27 = *(_QWORD *)(a1 + 216);
                v22 -= 16 * v27;
              }
              else if (v27)
              {
                v27 = (unint64_t)v26;
                goto LABEL_51;
              }
              if ((unint64_t)(v14 + 13) >= v15)
                v28 = (_QWORD *)(a1 + (int)*MEMORY[0x1E0CA8108]);
              else
                v28 = v14 + 16;
              v29 = *v28 + ~v27;
              if (v20 <= v29)
              {
                v30 = (char *)(v23 + 8 * v29);
                v31 = (char *)(v23 + 8 * v20);
                do
                {
                  v32 = (unint64_t *)&v31[8 * ((v30 - v31) >> 4)];
                  if (v8 >= *v32)
                  {
                    if (v8 <= *v32)
                    {
                      v27 = 0;
                      v21 = (double *)((char *)v21 + 2 * ((char *)v32 - (char *)v24));
                      v24 = v32;
                      goto LABEL_51;
                    }
                    v31 = (char *)(v32 + 1);
                  }
                  else
                  {
                    v30 = (char *)(v32 - 1);
                  }
                }
                while (v31 <= v30);
              }
              v27 = 0;
            }
LABEL_51:
            while ((unint64_t)v21 < v22)
            {
              v33 = *v24;
              if (*v24 >= v8 && v33 < v7)
                v3 = v3 + *v21;
              if ((v9 & 0x20) == 0 && v33 >= v7)
                break;
              if (v27)
              {
                v35 = *(_QWORD *)v27;
                v27 += 8;
                v22 -= 16 * v35;
              }
              v21 += 2;
              ++v24;
            }
          }
        }
      }
    }
    else if ((uint64_t)v8 < v7)
    {
      v10 = *(_QWORD *)(a1 + (int)*MEMORY[0x1E0CA8100]);
      v11 = v10 + 16 * v7;
      v12 = (double *)(v10 + 16 * v8);
      do
      {
        v13 = *v12;
        v12 += 2;
        v3 = v3 + v13;
      }
      while ((unint64_t)v12 < v11);
    }
  }
  return v3;
}

+ (NSATSGlyphStorage)allocWithZone:(_NSZone *)a3
{
  int v5;
  NSATSGlyphStorage *v6;
  objc_super v8;

  os_unfair_lock_lock_with_options();
  v5 = __NSATSGlyphStorageCacheNextIndex;
  if (!__NSATSGlyphStorageCacheNextIndex)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSGlyphStorageLock);
LABEL_5:
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___NSATSGlyphStorage;
    return (NSATSGlyphStorage *)objc_msgSendSuper2(&v8, sel_allocWithZone_, a3);
  }
  --__NSATSGlyphStorageCacheNextIndex;
  v6 = (NSATSGlyphStorage *)__NSATSGlyphStorageCache[v5 - 1];
  os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSGlyphStorageLock);
  if (!v6)
    goto LABEL_5;
  return v6;
}

- (void)_invalidate
{
  __CFArray *v2;
  const void *v3;

  if (a1)
  {
    v2 = (__CFArray *)a1[9];
    if (v2)
      CFArrayRemoveAllValues(v2);
    a1[19] = 0;
    v3 = (const void *)a1[20];
    if (v3)
    {
      CFRelease(v3);
      a1[20] = 0;
    }
  }
}

- (uint64_t)createCTTypesetter
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  NSUInteger v4;
  CFIndex v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  __CFDictionary *MutableCopy;
  NSUInteger v13;
  const __CFArray *MutableRunsWithStorageAndOptions;
  const __CFArray *v15;
  uint64_t Count;
  unint64_t v17;
  const __CFArray *v18;
  BOOL v19;
  int v20;
  NSString *v21;
  CFDictionaryRef v22;
  const __CFArray *v23;
  uint64_t v24;
  unint64_t v25;
  const __CFArray *v26;
  const __CFString *v27;
  void *value;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *newValues[2];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  NSRange v40;
  CFRange v41;
  CFRange v42;
  CFRange v43;
  CFRange v44;

  v39 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 88);
    v3 = *(_QWORD *)(result + 96);
    if (objc_msgSend(*(id *)(result + 80), "_bidiLevels"))
      objc_msgSend(*(id *)(v1 + 80), "_baseWritingDirection");
    objc_msgSend(*(id *)(v1 + 80), "limitsLayoutForSuspiciousContents");
    v37 = 0u;
    v38 = 0u;
    *(_OWORD *)newValues = 0u;
    v36 = 0u;
    if (!*(_QWORD *)(v1 + 72))
      *(_QWORD *)(v1 + 72) = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    if (!__CFArrayTypeID)
      __CFArrayTypeID = CFArrayGetTypeID();
    if (v3 >= 1)
    {
      v4 = 0;
      v5 = 0;
      v6 = v2 + 104 * v3;
      v29 = v1 + 8;
      value = (void *)*MEMORY[0x1E0C9AE50];
      v30 = v6;
      v31 = v1;
      do
      {
        v32 = v2 + 104;
        if (v2 + 104 >= v6)
          v7 = (uint64_t *)(v29 + 112);
        else
          v7 = (uint64_t *)(v2 + 128);
        v8 = *v7;
        v9 = *(_QWORD *)(v2 + 24);
        if ((*(_BYTE *)(v2 + 96) & 0x20) == 0
          || (v10 = (void *)objc_msgSend(*(id *)(v2 + 8), "_kernOverride"), objc_msgSend(v10, "doubleValue"), v11 == 0.0))
        {
          MutableCopy = 0;
        }
        else
        {
          MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)v2);
          CFDictionaryAddValue(MutableCopy, CFSTR("NSKern"), v10);
        }
        if ((*(_BYTE *)(v2 + 96) & 0x40) != 0 && !objc_msgSend(*(id *)v2, "objectForKey:", CFSTR("CTVerticalForms")))
        {
          if (!MutableCopy)
            MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)v2);
          CFDictionaryAddValue(MutableCopy, CFSTR("CTVerticalForms"), value);
        }
        if ((*(_BYTE *)(v2 + 96) & 0x80) != 0)
        {
          if (!MutableCopy)
            MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)v2);
          CFDictionarySetValue(MutableCopy, CFSTR("NSFont"), *(const void **)(v2 + 8));
        }
        v1 = v31;
        v13 = v8 - v9;
        MutableRunsWithStorageAndOptions = (const __CFArray *)CTRunCreateMutableRunsWithStorageAndOptions();
        if (MutableRunsWithStorageAndOptions)
        {
          v15 = MutableRunsWithStorageAndOptions;
          if (CFGetTypeID(MutableRunsWithStorageAndOptions) == __CFArrayTypeID)
          {
            Count = CFArrayGetCount(v15);
            v17 = v32;
            if (Count > 1)
              *(_DWORD *)(v31 + 224) |= 4u;
            if (v5 >= 1)
            {
              v18 = *(const __CFArray **)(v31 + 72);
              v41.location = CFArrayGetCount(v18);
              v41.length = 0;
              CFArrayReplaceValues(v18, v41, (const void **)newValues, v5);
              do
              {
                CFRelease(newValues[v5 - 1]);
                v19 = (unint64_t)v5-- > 1;
              }
              while (v19);
              v5 = 0;
              v1 = v31;
            }
            v44.location = 0;
            v44.length = Count;
            CFArrayAppendArray(*(CFMutableArrayRef *)(v1 + 72), v15, v44);
            CFRelease(v15);
          }
          else
          {
            if (v5 == 8)
            {
              v23 = *(const __CFArray **)(v31 + 72);
              v42.location = CFArrayGetCount(v23);
              v42.length = 0;
              CFArrayReplaceValues(v23, v42, (const void **)newValues, 8);
              v24 = 7;
              do
              {
                CFRelease(newValues[v24]);
                v25 = v24-- + 1;
              }
              while (v25 > 1);
              v5 = 0;
            }
            newValues[v5++] = v15;
            v17 = v2 + 104;
          }
        }
        else
        {
          v17 = v2 + 104;
          do
            v20 = __ldxr((unsigned int *)&createCTTypesetter_numWarnings);
          while (__stxr(v20 + 1, (unsigned int *)&createCTTypesetter_numWarnings));
          if (v20 <= 18)
          {
            v40.location = v4;
            v40.length = v13;
            v21 = NSStringFromRange(v40);
            v22 = MutableCopy;
            if (!MutableCopy)
              v22 = *(CFDictionaryRef *)v2;
            NSLog((NSString *)CFSTR("NULL run returned from CoreText. Ignoring the storage range %@ for glyph storage -> %@:%@"), v21, *(_QWORD *)(v31 + 64), v22);
          }
        }
        if (MutableCopy)
          CFRelease(MutableCopy);
        v4 += v13;
        v2 = v17;
        v6 = v30;
      }
      while (v17 < v30);
      if (v5 >= 1)
      {
        v26 = *(const __CFArray **)(v1 + 72);
        v43.location = CFArrayGetCount(v26);
        v43.length = 0;
        CFArrayReplaceValues(v26, v43, (const void **)newValues, v5);
        do
        {
          CFRelease(newValues[v5 - 1]);
          v19 = (unint64_t)v5-- > 1;
        }
        while (v19);
      }
    }
    v27 = *(const __CFString **)(v1 + 184);
    if (v27)
      -[__NSATSStringSegment _setOriginalString:range:](v27, (const __CFString *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 80), "attributedString"), "string"), *(_QWORD *)(v1 + 128), *(char **)(v1 + 136));
    else
      *(_QWORD *)(v1 + 184) = -[__NSATSStringSegment initWithOriginalString:range:](objc_allocWithZone((Class)__NSATSStringSegment), (const __CFString *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 80), "attributedString"), "string"), *(_QWORD *)(v1 + 128), *(char **)(v1 + 136));
    if (objc_msgSend(*(id *)(v1 + 80), "limitsLayoutForSuspiciousContents"))
    {
      return CTTypesetterCreateWithRunArray();
    }
    else
    {
      v33 = *MEMORY[0x1E0CA8608];
      v34 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      return CTTypesetterCreateWithRunArrayAndOptions();
    }
  }
  return result;
}

- (const)_flushCachedObjects
{
  const __CFString *v1;
  void *isa;

  if (result)
  {
    v1 = result;
    isa = result[2].isa;
    if (isa)
    {
      CFRelease(isa);
      v1[2].isa = 0;
    }
    return -[__NSATSStringSegment _setOriginalString:range:]((const __CFString *)v1[5].length, 0, 0, 0);
  }
  return result;
}

- (void)release
{
  uint64_t v3;
  __CTGlyphStorage *glyphStorage;
  __CFArray *masterRuns;
  __CFSet *children;
  objc_super v7;

  os_unfair_lock_lock_with_options();
  if (-[NSATSGlyphStorage retainCount](self, "retainCount") == 1
    && (v3 = __NSATSGlyphStorageCacheNextIndex, __NSATSGlyphStorageCacheNextIndex <= 2))
  {
    ++__NSATSGlyphStorageCacheNextIndex;
    __NSATSGlyphStorageCache[v3] = self;
    glyphStorage = self->_glyphStorage;
    self->_glyphStorage = 0;
    masterRuns = self->_masterRuns;
    self->_masterRuns = 0;
    self->_parent = 0;
    children = self->_children;
    self->_children = 0;
    -[__NSATSStringSegment _setOriginalString:range:]((const __CFString *)self->_textString, 0, 0, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSGlyphStorageLock);
    if (glyphStorage)
      CFRelease(glyphStorage);
    if (masterRuns)
      CFRelease(masterRuns);
    if (children)
      CFRelease(children);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSGlyphStorageLock);
    v7.receiver = self;
    v7.super_class = (Class)NSATSGlyphStorage;
    -[NSATSGlyphStorage release](&v7, sel_release);
  }
}

- (id)childGlyphStorageWithCharacterRange:(uint64_t)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSATSGlyphStorage *v9;
  void *v10;
  id *v11;
  __CFSet *Mutable;
  const void *MutableWithInterface;
  objc_super v15;

  if (!a1)
    return 0;
  if ((*(_BYTE *)(a1 + 224) & 0x10) != 0)
  {
    v6 = objc_msgSend(*(id *)(a1 + 80), "glyphRangeForCharacterRange:actualCharacterRange:", a2, a3, 0);
    v7 = v8;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 112) + a2 - *(_QWORD *)(a1 + 128);
    v7 = a3;
  }
  v9 = +[NSATSGlyphStorage allocWithZone:](NSATSGlyphStorage, "allocWithZone:", objc_msgSend((id)a1, "zone"));
  v10 = *(void **)(a1 + 80);
  v15.receiver = v9;
  v15.super_class = (Class)NSATSGlyphStorage;
  v11 = (id *)objc_msgSendSuper2(&v15, sel_init);
  v11[10] = v10;
  v11[19] = (id)a1;
  -[NSATSGlyphStorage setGlyphRange:characterRange:](v11, v6, v7, a2, a3);
  Mutable = *(__CFSet **)(a1 + 160);
  if (!Mutable)
  {
    Mutable = CFSetCreateMutable(0, 0, MEMORY[0x1E0C9B3B0]);
    *(_QWORD *)(a1 + 160) = Mutable;
  }
  CFSetAddValue(Mutable, v11);

  if (v11[8])
  {
    MEMORY[0x18D790F44]();
  }
  else
  {
    MutableWithInterface = (const void *)CTGlyphStorageCreateMutableWithInterface();
    v11[8] = (id)CFMakeCollectable(MutableWithInterface);
  }
  return v11;
}

- (const)_createEllipsisRunWithStringRange:(uint64_t)a3 attributes:(uint64_t)a4
{
  uint64_t MutableRunsWithStorageAndOptions;
  NSATSGlyphStorage *v7;
  uint64_t v8;
  _QWORD *v9;
  __int128 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  _BOOL4 GlyphsForCharacters;
  CGGlyph v26;
  int *v27;
  CGGlyph *p_glyphs;
  int *v29;
  const __CTFont *v30;
  void *v31;
  uint64_t v32;
  int *v33;
  _QWORD *v34;
  __CFSet *Mutable;
  const void *MutableWithInterface;
  const void *ValueAtIndex;
  CGGlyph glyphs;
  objc_super v41;

  MutableRunsWithStorageAndOptions = (uint64_t)a1;
  if (!a1)
    return (const void *)MutableRunsWithStorageAndOptions;
  v7 = +[NSATSGlyphStorage allocWithZone:](NSATSGlyphStorage, "allocWithZone:", objc_msgSend(a1, "zone"));
  v8 = *(_QWORD *)(MutableRunsWithStorageAndOptions + 80);
  v41.receiver = v7;
  v41.super_class = (Class)NSATSGlyphStorage;
  v9 = objc_msgSendSuper2(&v41, sel_init);
  v9[10] = v8;
  v10 = *(__int128 **)(MutableRunsWithStorageAndOptions + 88);
  v11 = *(_QWORD *)(MutableRunsWithStorageAndOptions + 96);
  LOWORD(v41.receiver) = 8230;
  glyphs = 0;
  v9[19] = MutableRunsWithStorageAndOptions;
  v12 = *(_QWORD *)(MutableRunsWithStorageAndOptions + 128) + a2;
  v13 = objc_msgSend(*(id *)(MutableRunsWithStorageAndOptions + 80), "glyphRangeForCharacterRange:actualCharacterRange:", v12, a3, 0);
  __NSATSGlyphStorageInitBuffer((uint64_t)v9, v13, v14, v12, a3, 1);
  if (v11 >= 1)
  {
    v15 = 0;
    v16 = (unint64_t)v10 + 104 * v11;
    do
    {
      v15 += *((_QWORD *)v10 + 2);
      if (v15 > a2)
        break;
      v10 = (__int128 *)((char *)v10 + 104);
    }
    while ((unint64_t)v10 < v16);
  }
  v17 = v9[11];
  if (!v17)
  {
    v17 = NSAllocateScannedUncollectable();
    v9[11] = v17;
    v9[13] = 8;
  }
  v18 = *v10;
  v19 = v10[2];
  *(_OWORD *)(v17 + 16) = v10[1];
  *(_OWORD *)(v17 + 32) = v19;
  *(_OWORD *)v17 = v18;
  v20 = v10[3];
  v21 = v10[4];
  v22 = v10[5];
  *(_QWORD *)(v17 + 96) = *((_QWORD *)v10 + 12);
  *(_OWORD *)(v17 + 64) = v21;
  *(_OWORD *)(v17 + 80) = v22;
  *(_OWORD *)(v17 + 48) = v20;
  v23 = v9[11];
  *(_QWORD *)(v23 + 16) = a3;
  *(_QWORD *)(v23 + 24) = 0;
  v24 = *(_OWORD *)(MEMORY[0x1E0CB3438] + 16);
  *(_OWORD *)(v23 + 64) = *MEMORY[0x1E0CB3438];
  *(_OWORD *)(v23 + 80) = v24;
  *(_DWORD *)(v9[11] + 96) &= ~1u;
  v9[12] = 1;
  GlyphsForCharacters = CTFontGetGlyphsForCharacters(*(CTFontRef *)(v9[11] + 8), (const UniChar *)&v41, &glyphs, 1);
  v26 = glyphs;
  if (!GlyphsForCharacters)
    v26 = 0;
  v27 = (int *)MEMORY[0x1E0CA8110];
  **(_WORD **)((char *)v9 + (int)*MEMORY[0x1E0CA8110]) = v26;
  p_glyphs = *(CGGlyph **)((char *)v9 + *v27);
  v29 = (int *)MEMORY[0x1E0CA8100];
  if (*p_glyphs)
    goto LABEL_14;
  if ((objc_msgSend(*(id *)(MutableRunsWithStorageAndOptions + 80), "_allowsEllipsisGlyphSubstitution") & 1) == 0)
  {
    p_glyphs = *(CGGlyph **)((char *)v9 + *v27);
LABEL_14:
    v31 = *(void **)(v9[11] + 8);
    v32 = *(_QWORD *)((char *)v9 + *v29);
    goto LABEL_15;
  }
  v30 = (const __CTFont *)objc_msgSend(*(id *)(MutableRunsWithStorageAndOptions + 80), "substituteFontForFont:", objc_msgSend(*(id *)(MutableRunsWithStorageAndOptions + 80), "_ellipsisFontForFont:", *(_QWORD *)(v9[11] + 8)));
  *(_QWORD *)(v9[11] + 8) = v30;
  CTFontGetGlyphsForCharacters(v30, (const UniChar *)&v41, &glyphs, 1);
  v31 = *(void **)(v9[11] + 8);
  v32 = *(_QWORD *)((char *)v9 + *v29);
  p_glyphs = &glyphs;
LABEL_15:
  objc_msgSend(v31, "getAdvancements:forCGGlyphs:count:", v32, p_glyphs, 1, a4);
  if (*(double *)(v9[11] + 48) != 1.0)
    **(double **)((char *)v9 + *v29) = *((double *)v10 + 6) * **(double **)((char *)v9 + *v29);
  **(_DWORD **)((char *)v9 + (int)*MEMORY[0x1E0CA8118]) = 786432;
  **(_QWORD **)((char *)v9 + (int)*MEMORY[0x1E0CA8120]) = a2;
  v33 = (int *)MEMORY[0x1E0CA80F8];
  v34 = *(_QWORD **)((char *)v9 + (int)*MEMORY[0x1E0CA80F8]);
  if (!v34)
  {
    *(_QWORD *)((char *)v9 + *v33) = NSZoneMalloc((NSZone *)objc_msgSend(v9, "zone"), 8uLL);
    v34 = *(_QWORD **)((char *)v9 + *v33);
  }
  *v34 = a3 - 1;
  *((_DWORD *)v9 + 56) |= 1u;
  *((_DWORD *)v9 + 56) |= 8u;
  Mutable = *(__CFSet **)(MutableRunsWithStorageAndOptions + 160);
  if (!Mutable)
  {
    Mutable = CFSetCreateMutable(0, 0, MEMORY[0x1E0C9B3B0]);
    *(_QWORD *)(MutableRunsWithStorageAndOptions + 160) = Mutable;
  }
  CFSetAddValue(Mutable, v9);

  if (v9[8])
  {
    MEMORY[0x18D790F44]();
  }
  else
  {
    MutableWithInterface = (const void *)CTGlyphStorageCreateMutableWithInterface();
    v9[8] = CFMakeCollectable(MutableWithInterface);
  }
  MutableRunsWithStorageAndOptions = CTRunCreateMutableRunsWithStorageAndOptions();
  if (CFGetTypeID((CFTypeRef)MutableRunsWithStorageAndOptions) == __CFArrayTypeID)
  {
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)MutableRunsWithStorageAndOptions, 0);
    CFRetain(ValueAtIndex);
    CFRelease((CFTypeRef)MutableRunsWithStorageAndOptions);
    return ValueAtIndex;
  }
  return (const void *)MutableRunsWithStorageAndOptions;
}

- (void)dealloc
{
  NSZone *v3;
  __CTGlyphStorage *glyphStorage;
  __CFArray *masterRuns;
  $D80AB43DD8B9C5C5D9588BBA45BFD1A1 *runs;
  void *v7;
  void *v8;
  __CFSet *children;
  objc_super v10;

  v3 = (NSZone *)-[NSATSGlyphStorage zone](self, "zone");
  glyphStorage = self->_glyphStorage;
  if (glyphStorage)
    CFRelease(glyphStorage);
  masterRuns = self->_masterRuns;
  if (masterRuns)
    CFRelease(masterRuns);
  runs = self->_runs;
  if (runs)
    NSZoneFree(0, runs);
  v7 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8100]);
  if (v7)
    NSZoneFree(v3, v7);
  v8 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA80F8]);
  if (v8)
    NSZoneFree(v3, v8);
  children = self->_children;
  if (children)
    CFRelease(children);

  v10.receiver = self;
  v10.super_class = (Class)NSATSGlyphStorage;
  -[NSATSGlyphStorage dealloc](&v10, sel_dealloc);
}

- (void)finalize
{
  NSZone *v3;
  __CFArray *masterRuns;
  $D80AB43DD8B9C5C5D9588BBA45BFD1A1 *runs;
  void *v6;
  void *v7;
  __CFSet *children;
  objc_super v9;

  v3 = (NSZone *)-[NSATSGlyphStorage zone](self, "zone");
  masterRuns = self->_masterRuns;
  if (masterRuns)
    CFRelease(masterRuns);
  runs = self->_runs;
  if (runs)
    NSZoneFree(0, runs);
  v6 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8100]);
  if (v6)
    NSZoneFree(v3, v6);
  v7 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA80F8]);
  if (v7)
    NSZoneFree(v3, v7);
  children = self->_children;
  if (children)
    CFRelease(children);
  v9.receiver = self;
  v9.super_class = (Class)NSATSGlyphStorage;
  -[NSATSGlyphStorage finalize](&v9, sel_finalize);
}

- (__CTGlyphStorage)createCopy:(id)a3
{
  int64_t var1;
  int64_t var0;
  NSATSGlyphStorage *parent;
  int64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int64_t v11;
  uint64_t *v12;
  NSUInteger location;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  NSATSGlyphStorage *v28;
  NSATSTypesetter *typesetter;
  char *v30;
  $D80AB43DD8B9C5C5D9588BBA45BFD1A1 *runs;
  unint64_t v32;
  int64_t *p_var3;
  int64_t *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  unsigned int v46;
  unint64_t v47;
  unint64_t v48;
  __CFSet *children;
  CFTypeRef v50;
  const void *MutableWithInterface;
  NSZone *zone;
  int64_t v54;
  uint64_t v55;
  uint64_t v56;
  int64_t v57;
  NSATSGlyphStorage *v58;
  objc_super v59;

  var1 = a3.var1;
  var0 = a3.var0;
  if (self->_parent)
    parent = self->_parent;
  else
    parent = self;
  if ((*(_BYTE *)&self->_gFlags & 0x10) == 0)
  {
    v56 = self->_characterRange.location + a3.var0;
    v57 = a3.var1;
    v54 = a3.var1;
    v55 = self->_glyphRange.location + a3.var0;
    v7 = a3.var1;
    goto LABEL_28;
  }
  v8 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8120]);
  v9 = (uint64_t *)(v8 + 8 * a3.var0);
  v10 = *v9;
  v11 = a3.var0 + a3.var1 - 1;
  v12 = (uint64_t *)(v8 + 8 * v11);
  v14 = *v12;
  v15 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8118]);
  if ((*(_DWORD *)(v15 + 4 * a3.var0) & 0x200000) == 0)
    goto LABEL_12;
  if (a3.var1 >= 1)
  {
    v16 = v8 + 8 * (a3.var0 + a3.var1);
    v17 = v9;
    do
    {
      v19 = *v17++;
      v18 = v19;
      if (v19 < v10)
        v10 = v18;
    }
    while ((unint64_t)v17 < v16);
LABEL_12:
    if ((*(_DWORD *)(v15 + 4 * v11) & 0x200000) != 0 && a3.var1 >= 1)
    {
      do
      {
        v21 = *v12--;
        v20 = v21;
        if (v21 > v14)
          v14 = v20;
      }
      while (v12 >= v9);
    }
  }
  v23 = v14 - v10;
  v22 = v14 - v10 < 0;
  if (v14 < v10)
    v10 = v14;
  if (v22)
    v24 = -v23;
  else
    v24 = v23;
  v7 = v24 + 1;
  location = parent->_characterRange.location;
  v25 = a3.var0 == v10 && v7 == a3.var1;
  v56 = v10 + location;
  if (v25)
  {
    v54 = a3.var1;
    v55 = self->_glyphRange.location + a3.var0;
    v57 = a3.var1;
  }
  else
  {
    v26 = -[NSTypesetter glyphRangeForCharacterRange:actualCharacterRange:](self->_typesetter, "glyphRangeForCharacterRange:actualCharacterRange:", v10 + location, v24 + 1, 0);
    v54 = v27;
    v55 = v26;
    v57 = v7;
  }
LABEL_28:
  v28 = +[NSATSGlyphStorage allocWithZone:](NSATSGlyphStorage, "allocWithZone:", -[NSATSGlyphStorage zone](self, "zone"));
  typesetter = self->_typesetter;
  v59.receiver = v28;
  v59.super_class = (Class)NSATSGlyphStorage;
  v30 = -[NSATSGlyphStorage init](&v59, sel_init);
  *((_QWORD *)v30 + 10) = typesetter;
  v58 = parent;
  *((_QWORD *)v30 + 19) = parent;
  runs = self->_runs;
  v32 = (unint64_t)&runs[self->_numRuns];
  zone = (NSZone *)objc_msgSend(v30, "zone");
  __NSATSGlyphStorageInitBuffer((uint64_t)v30, v55, v54, v56, v7, var1);
  p_var3 = &runs[1].var3;
  do
  {
    v34 = p_var3;
    if ((unint64_t)(p_var3 - 3) >= v32)
      break;
    p_var3 += 13;
  }
  while (*v34 <= var0);
  v35 = *((_QWORD *)v30 + 11);
  if (!v35)
  {
    v35 = NSAllocateScannedUncollectable();
    *((_QWORD *)v30 + 11) = v35;
    *((_QWORD *)v30 + 13) = 8;
  }
  v36 = *((_OWORD *)v34 - 8);
  v37 = *((_OWORD *)v34 - 6);
  *(_OWORD *)(v35 + 16) = *((_OWORD *)v34 - 7);
  *(_OWORD *)(v35 + 32) = v37;
  *(_OWORD *)v35 = v36;
  v38 = *((_OWORD *)v34 - 5);
  v39 = *((_OWORD *)v34 - 4);
  v40 = *((_OWORD *)v34 - 3);
  *(_QWORD *)(v35 + 96) = *(v34 - 4);
  *(_OWORD *)(v35 + 64) = v39;
  *(_OWORD *)(v35 + 80) = v40;
  *(_OWORD *)(v35 + 48) = v38;
  v41 = *((_QWORD *)v30 + 11);
  *(_QWORD *)(v41 + 16) = v57;
  *(_QWORD *)(v41 + 24) = 0;
  *((_QWORD *)v30 + 12) = 1;
  memcpy(*(void **)&v30[*MEMORY[0x1E0CA8110]], *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8110]) + 2 * var0, 2 * var1);
  memcpy(*(void **)&v30[*MEMORY[0x1E0CA8100]], *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8100]) + 16 * var0, 16 * var1);
  v42 = (int)*MEMORY[0x1E0CA8118];
  memcpy(*(void **)&v30[v42], *(char **)((char *)&self->super.super.isa + v42) + 4 * var0, 4 * var1);
  memcpy(*(void **)&v30[*MEMORY[0x1E0CA8120]], *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8120]) + 8 * var0, 8 * var1);
  v43 = (int)*MEMORY[0x1E0CA80F8];
  v44 = *(uint64_t *)((char *)&self->super.super.isa + v43);
  if (v44)
  {
    v45 = *(void **)&v30[v43];
    if (!v45)
    {
      v45 = NSZoneMalloc(zone, 8 * *((_QWORD *)v30 + 18));
      *(_QWORD *)&v30[v43] = v45;
      v44 = *(uint64_t *)((char *)&self->super.super.isa + v43);
    }
    memcpy(v45, (const void *)(v44 + 8 * var0), 8 * var1);
  }
  v46 = *((_DWORD *)v30 + 56) & 0xFFFFFFFD | (2 * ((*((_DWORD *)v34 - 8) >> 1) & 1));
  *((_DWORD *)v30 + 56) = v46;
  if ((*(_BYTE *)&self->_gFlags & 1) != 0 && var1 >= 1)
  {
    v47 = *(_QWORD *)&v30[v42];
    v48 = v47 + 4 * var1;
    do
    {
      if ((*(_BYTE *)(v47 + 2) & 4) != 0)
      {
        v46 |= 1u;
        *((_DWORD *)v30 + 56) = v46;
      }
      v47 += 4;
    }
    while (v47 < v48);
  }
  children = v58->_children;
  if (!children)
  {
    children = CFSetCreateMutable(0, 0, MEMORY[0x1E0C9B3B0]);
    v58->_children = children;
  }
  CFSetAddValue(children, v30);

  if (*((_QWORD *)v30 + 8))
  {
    MEMORY[0x18D790F44]();
    v50 = (CFTypeRef)*((_QWORD *)v30 + 8);
  }
  else
  {
    MutableWithInterface = (const void *)CTGlyphStorageCreateMutableWithInterface();
    v50 = CFMakeCollectable(MutableWithInterface);
    *((_QWORD *)v30 + 8) = v50;
  }
  return (__CTGlyphStorage *)CFRetain(v50);
}

- (void)getCustomAdvance:(CGSize *)a3 forIndex:(int64_t)a4
{
  $D80AB43DD8B9C5C5D9588BBA45BFD1A1 *runs;
  $D80AB43DD8B9C5C5D9588BBA45BFD1A1 *v8;
  $D80AB43DD8B9C5C5D9588BBA45BFD1A1 *v9;
  $D80AB43DD8B9C5C5D9588BBA45BFD1A1 *v10;
  int64_t var3;
  double v12;
  CGFloat v13;

  runs = self->_runs;
  v8 = &runs[self->_numRuns];
  v9 = runs + 1;
  do
  {
    v10 = v9;
    if (v9 >= v8)
      break;
    var3 = v9->var3;
    ++v9;
  }
  while (var3 <= a4);
  objc_msgSend(v10[-1].var1, "advancementForGlyph:", (*(unsigned __int16 **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8110]))[a4]);
  v13 = (*(double **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8100]))[2 * a4 + 1];
  a3->width = v12 * v10[-1].var6;
  a3->height = v13;
}

- (void)setGlyphID:(unsigned __int16)a3 forIndex:(int64_t)a4
{
  (*(_WORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8110]))[a4] = a3;
  (*(_DWORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8118]))[a4] |= 0x40000u;
  *(_DWORD *)&self->_gFlags |= 1u;
}

- (void)setProps:(unsigned int)a3 forIndex:(int64_t)a4
{
  char *v4;

  v4 = *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8118]) + 4 * a4;
  *(_DWORD *)v4 = a3 | (v4[2] << 16);
}

- (void)setAbsorbedCount:(int64_t)a3 forIndex:(int64_t)a4
{
  uint64_t v7;
  objc_class *v8;

  v7 = (int)*MEMORY[0x1E0CA80F8];
  v8 = *(Class *)((char *)&self->super.super.isa + v7);
  if (!v8)
  {
    v8 = (objc_class *)NSZoneCalloc((NSZone *)-[NSATSGlyphStorage zone](self, "zone"), self->_bufferSize, 8uLL);
    *(Class *)((char *)&self->super.super.isa + v7) = v8;
  }
  *((_QWORD *)v8 + a4) = a3;
}

- (void)setStringIndex:(int64_t)a3 forIndex:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  _DWORD *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _DWORD *v21;

  v4 = (int)*MEMORY[0x1E0CA8120];
  v5 = *(uint64_t *)((char *)&self->super.super.isa + v4);
  v6 = (int)*MEMORY[0x1E0CA8118];
  if (*(_QWORD *)(v5 + 8 * a4) != a3)
  {
    *(_QWORD *)(v5 + 8 * a4) = a3;
    v7 = *(uint64_t *)((char *)&self->super.super.isa + v6);
    v8 = *(_DWORD *)(v7 + 4 * a4);
    if ((v8 & 0x20300) == 0)
      *(_DWORD *)(v7 + 4 * a4) = v8 | 0x40000;
  }
  *(_DWORD *)&self->_gFlags |= 0x30u;
  v9 = *(uint64_t *)((char *)&self->super.super.isa + v6);
  v10 = (_DWORD *)(v9 + 4 * a4);
  if ((*v10 & 0x220000) == 0x20000)
  {
    v11 = *(unint64_t *)((char *)&self->super.super.isa + v4);
    if (!a4 || *(_QWORD *)(v11 + 8 * a4 - 8) != a3)
    {
      v12 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8108]);
      if (v12 == a4 + 1 || *(_QWORD *)(v11 + 8 * (a4 + 1)) != a3)
      {
        v13 = v11 + 8 * v12;
        v14 = 8 * a4;
        if (v11 + 8 * a4 + 8 >= v13)
        {
LABEL_17:
          v19 = v11 - 8;
          while (v19 + v14 >= v11)
          {
            v20 = *(_QWORD *)(v19 + v14);
            v14 -= 8;
            if (v20 == a3)
            {
              if (!v9)
                return;
              v21 = (_DWORD *)(v9 + (v14 >> 1));
              goto LABEL_24;
            }
          }
        }
        else
        {
          v15 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA80F8]);
          v16 = (uint64_t *)(v15 + 8 * a4);
          if (!v15)
            v16 = 0;
          v17 = v14 + 8;
          while (*(_QWORD *)(v11 + v17) < a3)
          {
            if (v16)
            {
              v18 = *v16++;
              v13 -= 8 * v18;
            }
            v17 += 8;
            if (v11 + v17 >= v13)
              goto LABEL_17;
          }
          v21 = (_DWORD *)(v9 + 4 * a4);
          v10 = (_DWORD *)(v9 + (v17 >> 1));
LABEL_24:
          while (v21 <= v10)
            *v21++ |= 0x200000u;
        }
      }
    }
  }
}

- (void)swapGlyph:(int64_t)a3 withIndex:(int64_t)a4
{
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8110]);
  v5 = *(_WORD *)(v4 + 2 * a3);
  *(_WORD *)(v4 + 2 * a3) = *(_WORD *)(v4 + 2 * a4);
  *(_WORD *)(v4 + 2 * a4) = v5;
  v6 = (int)*MEMORY[0x1E0CA8100];
  v7 = *(uint64_t *)((char *)&self->super.super.isa + v6);
  v8 = *(_OWORD *)(v7 + 16 * a3);
  *(_OWORD *)(v7 + 16 * a3) = *(_OWORD *)(v7 + 16 * a4);
  (*(_OWORD **)((char *)&self->super.super.isa + v6))[a4] = v8;
  v9 = (int)*MEMORY[0x1E0CA8118];
  v10 = *(uint64_t *)((char *)&self->super.super.isa + v9);
  v11 = *(_DWORD *)(v10 + 4 * a3);
  *(_DWORD *)(v10 + 4 * a3) = *(_DWORD *)(v10 + 4 * a4);
  (*(_DWORD **)((char *)&self->super.super.isa + v9))[a4] = v11;
  v12 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8120]);
  v13 = *(_QWORD *)(v12 + 8 * a3);
  *(_QWORD *)(v12 + 8 * a3) = *(_QWORD *)(v12 + 8 * a4);
  *(_QWORD *)(v12 + 8 * a4) = v13;
  v14 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA80F8]);
  if (v14)
  {
    v15 = *(_QWORD *)(v14 + 8 * a3);
    *(_QWORD *)(v14 + 8 * a3) = *(_QWORD *)(v14 + 8 * a4);
    *(_QWORD *)(v14 + 8 * a4) = v15;
  }
  *(_DWORD *)&self->_gFlags |= 0x30u;
}

- (void)moveGlyphsTo:(int64_t)a3 from:(id)a4
{
  int64_t var1;
  int64_t var0;
  int *v8;
  _DWORD *v9;
  _DWORD *v10;
  size_t v11;
  uint64_t v12;

  var1 = a4.var1;
  var0 = a4.var0;
  v8 = (int *)MEMORY[0x1E0CA8118];
  if (self->_stack && a4.var1 >= 1)
  {
    v9 = (_DWORD *)(*(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8118]) + 4 * a4.var0);
    v10 = &v9[a4.var1];
    do
      *v9++ |= 0x200000u;
    while (v9 < v10);
  }
  memmove(*(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8110]) + 2 * a3, *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8110]) + 2 * a4.var0, 2 * a4.var1);
  memmove(*(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8100]) + 16 * a3, *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8100]) + 16 * var0, 16 * var1);
  memmove(*(char **)((char *)&self->super.super.isa + *v8) + 4 * a3, *(char **)((char *)&self->super.super.isa + *v8) + 4 * var0, 4 * var1);
  v11 = 8 * var1;
  memmove(*(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8120]) + 8 * a3, *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8120]) + 8 * var0, v11);
  v12 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA80F8]);
  if (v12)
    memmove((void *)(v12 + 8 * a3), (const void *)(v12 + 8 * var0), v11);
  *(_DWORD *)&self->_gFlags |= 0x10u;
}

- (void)insertGlyphs:(id)a3
{
  int64_t var1;
  int64_t var0;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  NSZone *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  objc_class *v14;
  int64_t bufferSize;
  objc_class *v16;
  char *v17;
  objc_class *v18;
  uint64_t v19;
  uint64_t v20;
  NSZone *v21;
  uint64_t v22;
  size_t v23;
  char *v24;
  char *v25;
  int v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  size_t v34;
  uint64_t v35;
  objc_class *v36;
  int v37;
  int64_t v38;
  NSZone *zone;
  NSZone *zonea;
  objc_class *v41;
  int v42;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = (int)*MEMORY[0x1E0CA8108];
  v7 = *(uint64_t *)((char *)&self->super.super.isa + v6);
  v8 = a3.var0 + 1;
  *(Class *)((char *)&self->super.super.isa + v6) = (Class)(v7 + a3.var1);
  v9 = v7 - (a3.var0 + 1);
  if (v7 + a3.var1 <= self->_bufferSize)
  {
    v26 = *MEMORY[0x1E0CA8110];
    v27 = *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8110]) + 2 * v8;
    memmove(&v27[2 * a3.var1], v27, 2 * v9);
    v42 = *MEMORY[0x1E0CA8100];
    v28 = *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8100]) + 16 * v8;
    memmove(&v28[16 * var1], v28, 16 * v9);
    zonea = (NSZone *)(int)*MEMORY[0x1E0CA8118];
    memmove((void *)(*(_QWORD *)((char *)zonea + (_QWORD)self) + 4 * v8 + 4 * var1), (const void *)(*(_QWORD *)((char *)zonea + (_QWORD)self) + 4 * v8), 4 * v9);
    v22 = (int)*MEMORY[0x1E0CA8120];
    memmove(*(char **)((char *)&self->super.super.isa + v22) + 8 * v8 + 8 * var1, *(char **)((char *)&self->super.super.isa + v22) + 8 * v8, 8 * v9);
    v24 = (char *)(int)*MEMORY[0x1E0CA80F8];
    v29 = *(_QWORD *)&v24[(_QWORD)self];
    if (v29)
      memmove((void *)(v29 + 8 * v8 + 8 * var1), (const void *)(v29 + 8 * v8), 8 * v9);
    v21 = zonea;
  }
  else
  {
    v38 = a3.var0;
    v10 = (NSZone *)-[NSATSGlyphStorage zone](self, "zone");
    zone = v10;
    v11 = *(uint64_t *)((char *)&self->super.super.isa + v6);
    v12 = v11 & 0x7F;
    if (v11 <= 0)
      v12 = -(-v11 & 0x7F);
    v13 = v11 - v12 + 128;
    self->_bufferSize = v13;
    v14 = (objc_class *)NSZoneMalloc(v10, 30 * v13);
    bufferSize = self->_bufferSize;
    v24 = (char *)v14 + 16 * bufferSize;
    v16 = v14;
    v17 = &v24[8 * bufferSize];
    v18 = (objc_class *)&v17[4 * bufferSize];
    v41 = v18;
    v19 = (int)*MEMORY[0x1E0CA8110];
    memcpy(v18, *(const void **)((char *)&self->super.super.isa + v19), 2 * v8);
    memcpy((char *)v18 + 2 * v8 + 2 * var1, *(char **)((char *)&self->super.super.isa + v19) + 2 * v8, 2 * v9);
    v20 = (int)*MEMORY[0x1E0CA8100];
    v36 = v16;
    memcpy(v16, *(const void **)((char *)&self->super.super.isa + v20), 16 * v8);
    memcpy((char *)v16 + 16 * v8 + 16 * var1, *(char **)((char *)&self->super.super.isa + v20) + 16 * v8, 16 * v9);
    v21 = (NSZone *)(int)*MEMORY[0x1E0CA8118];
    memcpy(v17, *(const void **)((char *)v21 + (_QWORD)self), 4 * v8);
    memcpy(&v17[4 * v8 + 4 * var1], (const void *)(*(_QWORD *)((char *)v21 + (_QWORD)self) + 4 * v8), 4 * v9);
    v22 = (int)*MEMORY[0x1E0CA8120];
    memcpy(v24, *(const void **)((char *)&self->super.super.isa + v22), 8 * v8);
    v23 = 8 * v9;
    memcpy(&v24[8 * v8 + 8 * var1], *(char **)((char *)&self->super.super.isa + v22) + 8 * v8, v23);
    NSZoneFree(zone, *(void **)((char *)&self->super.super.isa + v20));
    v37 = v19;
    *(Class *)((char *)&self->super.super.isa + v19) = v41;
    v42 = v20;
    *(Class *)((char *)&self->super.super.isa + v20) = v36;
    *(_QWORD *)((char *)v21 + (_QWORD)self) = v17;
    *(Class *)((char *)&self->super.super.isa + v22) = (Class)v24;
    LODWORD(v24) = *MEMORY[0x1E0CA80F8];
    if (*(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA80F8]))
    {
      v25 = (char *)NSZoneMalloc(zone, 8 * self->_bufferSize);
      memcpy(v25, *(const void **)((char *)&self->super.super.isa + (int)v24), 8 * v8);
      memcpy(&v25[8 * v8 + 8 * var1], *(char **)((char *)&self->super.super.isa + (int)v24) + 8 * v8, v23);
      NSZoneFree(zone, *(void **)((char *)&self->super.super.isa + (int)v24));
      *(Class *)((char *)&self->super.super.isa + (int)v24) = (Class)v25;
    }
    v26 = v37;
    var0 = v38;
  }
  if (var1 >= 1)
  {
    v30 = *(_QWORD *)((char *)v21 + (_QWORD)self);
    v31 = (void *)(v30 + 4 * v8);
    v32 = v30 + 4 * var0;
    v33 = v30 + 4 * (var0 + var1) + 4;
    if (v33 <= v32 + 8)
      v33 = v32 + 8;
    memset_pattern16(v31, &unk_18D6CBD90, ((v33 - v32 - 5) & 0xFFFFFFFFFFFFFFFCLL) + 4);
  }
  bzero(*(char **)((char *)&self->super.super.isa + v26) + 2 * v8, 2 * var1);
  bzero(*(char **)((char *)&self->super.super.isa + v42) + 16 * v8, 16 * var1);
  v34 = 8 * var1;
  bzero(*(char **)((char *)&self->super.super.isa + (int)v22) + 8 * v8, v34);
  v35 = *(uint64_t *)((char *)&self->super.super.isa + (int)v24);
  if (v35)
    bzero((void *)(v35 + 8 * v8), v34);
  *(_DWORD *)&self->_gFlags |= 0x11u;
}

- (void)initGlyphStack:(int64_t)a3
{
  $D420464EB917A5D1CA60E49AE1666B3F *v5;

  if (self->_stack)
    NSZoneFree((NSZone *)-[NSATSGlyphStorage zone](self, "zone"), self->_stack);
  v5 = ($D420464EB917A5D1CA60E49AE1666B3F *)NSZoneMalloc((NSZone *)-[NSATSGlyphStorage zone](self, "zone"), (48 * a3) | 8);
  self->_stack = v5;
  v5->var0 = 0;
}

- (void)pushGlyph:(int64_t)a3
{
  $D420464EB917A5D1CA60E49AE1666B3F *stack;
  int64_t v4;
  $D420464EB917A5D1CA60E49AE1666B3F *v5;
  int *v6;
  int *v7;
  int64_t v8;

  stack = self->_stack;
  if (stack)
  {
    v4 = stack->var0++;
    v5 = stack + 6 * v4;
    v6 = (int *)MEMORY[0x1E0CA8100];
    v5->var1[0].var0 = (*(_WORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8110]))[a3];
    v5->var1[0].var1 = (CGSize)(*(_OWORD **)((char *)&self->super.super.isa + *v6))[a3];
    v7 = (int *)MEMORY[0x1E0CA8120];
    v5->var1[0].var2 = (*(_DWORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8118]))[a3] | 0x200000;
    v5->var1[0].var3 = *(_QWORD *)(*(int64_t *)((char *)&self->super.super.isa + *v7) + 8 * a3);
    v8 = *(int64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA80F8]);
    if (v8)
      v8 = *(_QWORD *)(v8 + 8 * a3);
    stack->var1[v4].var4 = v8;
  }
}

- (void)popGlyph:(int64_t)a3
{
  $D420464EB917A5D1CA60E49AE1666B3F *stack;
  uint64_t v4;
  $D420464EB917A5D1CA60E49AE1666B3F *v5;
  uint64_t v6;

  stack = self->_stack;
  if (stack)
  {
    v4 = stack->var0 - 1;
    stack->var0 = v4;
    v5 = stack + 6 * v4;
    (*(_WORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8110]))[a3] = v5->var1[0].var0;
    (*(_OWORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8100]))[a3] = v5->var1[0].var1;
    (*(_DWORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8118]))[a3] = v5->var1[0].var2;
    (*($D420464EB917A5D1CA60E49AE1666B3F **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA8120]))[a3] = ($D420464EB917A5D1CA60E49AE1666B3F)v5->var1[0].var3;
    v6 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CA80F8]);
    if (v6)
      *($D420464EB917A5D1CA60E49AE1666B3F *)(v6 + 8 * a3) = ($D420464EB917A5D1CA60E49AE1666B3F)stack->var1[v4].var4;
    *(_DWORD *)&self->_gFlags |= 0x30u;
  }
}

- (void)disposeGlyphStack
{
  if (self->_stack)
  {
    NSZoneFree((NSZone *)-[NSATSGlyphStorage zone](self, "zone"), self->_stack);
    self->_stack = 0;
  }
}

@end
