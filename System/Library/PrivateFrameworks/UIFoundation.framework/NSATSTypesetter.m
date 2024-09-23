@implementation NSATSTypesetter

- ($0177D170777CFC227CB001A659B5CD18)_allocateAuxData
{
  $0177D170777CFC227CB001A659B5CD18 *result;

  result = ($0177D170777CFC227CB001A659B5CD18 *)NSAllocateScannedUncollectable();
  *(_OWORD *)&result->var0 = 0u;
  *(_OWORD *)&result->var1.length = 0u;
  *(_OWORD *)&result->var2.length = 0u;
  *(_OWORD *)&result->var5 = 0u;
  *(_OWORD *)&result->var7 = 0u;
  *(_OWORD *)&result->var9 = 0u;
  *(_OWORD *)&result->var11 = 0u;
  result->var13.origin = 0u;
  result->var13.size = 0u;
  result->var14.origin = 0u;
  result->var14.size = 0u;
  result->var15 = 0u;
  *(_OWORD *)&result->var16 = 0u;
  *(_OWORD *)&result->var18 = 0u;
  result->var0 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&self->attributedString;
  return result;
}

- (BOOL)shouldBreakLineByWordBeforeCharacterAtIndex:(NSUInteger)charIndex
{
  id v5;

  v5 = -[NSLayoutManager delegate](-[NSTypesetter layoutManager](self, "layoutManager"), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v5, "layoutManager:shouldBreakLineByWordBeforeCharacterAtIndex:", -[NSTypesetter layoutManager](self, "layoutManager"), charIndex);
  else
    return 1;
}

+ (NSATSTypesetter)sharedTypesetter
{
  return (NSATSTypesetter *)objc_msgSend((id)__NSATSTypesetterClass, "sharedInstance");
}

+ (NSATSTypesetter)sharedInstance
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 != objc_opt_class())
    NSRequestConcreteImplementation();
  return (NSATSTypesetter *)__NSATSTypesetterSharedInstance;
}

- (BOOL)_layoutLineFragmentStartingWithGlyphAtIndex:(unint64_t *)a3 characterIndex:(unint64_t *)a4 atPoint:(CGPoint *)a5 renderingContext:(id *)a6
{
  CGPoint *v6;
  NSATSLineFragment **v10;
  NSString *v11;
  unint64_t location;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t flags;
  double y;
  NSDictionary *v19;
  int64_t v20;
  _QWORD *v21;
  double *v22;
  NSTypesetterBehavior v23;
  _BOOL4 v24;
  id v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  char v35;
  double v36;
  BOOL v37;
  double v38;
  double v39;
  NSString *v40;
  NSString *v41;
  unint64_t v42;
  int v43;
  char v44;
  _BOOL4 v45;
  _BOOL4 v47;
  _BOOL4 v48;
  CGFloat v49;
  char v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  unint64_t currentTextContainerIndex;
  NSTextContainer *currentTextContainer;
  uint64_t v58;
  NSATSLineFragment *v59;
  double elasticRangeWidth;
  double v61;
  double v62;
  NSATSLineFragment *v63;
  int v64;
  BOOL v65;
  double v66;
  double v67;
  double v68;
  NSATSLineFragment *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  NSATSLineFragment *v78;
  NSUInteger length;
  NSUInteger v80;
  double maxPosition;
  double v82;
  double v83;
  double v84;
  double v85;
  uint64_t v86;
  double v87;
  int v88;
  char v89;
  NSAttributedString *v90;
  id v91;
  double lineFragmentPadding;
  CGPoint v93;
  CGFloat height;
  double width;
  CGFloat v96;
  CGFloat v97;
  uint64_t v99;
  NSWritingDirection v100;
  NSATSLineFragment *v101;
  double v102;
  double v103;
  uint64_t v104;
  double v105;
  NSATSLineFragment *v106;
  NSAttributedString *v107;
  NSATSLineFragment *v108;
  NSUInteger v109;
  id v110;
  uint64_t v111;
  double v112;
  NSAttributedString *v113;
  id v114;
  uint64_t v115;
  double v116;
  double v118;
  double v119;
  double v120;
  unint64_t v121;
  unint64_t v122;
  CGFloat v123;
  double v124;
  CGFloat v125;
  double v126;
  double v127;
  double v128;
  unint64_t v129;
  NSATSLineFragment *v130;
  double v131;
  CGFloat v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t *v136;
  unint64_t *v137;
  CGPoint *v138;
  uint64_t v139;
  unint64_t v140;
  unint64_t v141;
  CGSize v142;
  CGPoint v143;
  int64_t v144;
  _BOOL4 v145;
  unint64_t v146;
  uint64_t v147;
  _BOOL4 v148;
  _BOOL4 v149;
  double v150;
  NSUInteger v151;
  BOOL v152;
  NSTypesetterBehavior v153;
  unint64_t v154;
  NSString *v155;
  CGFloat v156;
  uint64_t bRect;
  CGFloat bRecta;
  uint64_t v159;
  CGFloat v160;
  uint64_t v161;
  CGFloat v162;
  double x;
  double v164;
  NSRect v165;
  __int128 v166;
  __int128 v167;
  NSRect v168;
  CGSize currentTextContainerSize;
  double v170;
  double v171;
  double v172;
  double v173;
  unint64_t v174;
  unint64_t v175;
  NSRect v176;
  __int128 v177;
  CGSize v178;
  NSRect v179;
  CGRect BoundsWithOptions;
  NSRect v181;
  NSRect v182;
  NSRect v183;
  NSRect v184;
  NSRect v185;
  NSRect v186;
  NSRect v187;

  v6 = a5;
  v10 = (NSATSLineFragment **)self->_private;
  if (!v10)
  {
    v6 = a5;
    v10 = (NSATSLineFragment **)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v10;
  }
  v11 = -[NSAttributedString string](self->attributedString, "string");
  memset(&v179, 0, sizeof(v179));
  v142 = *(CGSize *)(MEMORY[0x1E0CB3438] + 16);
  v143 = (CGPoint)*MEMORY[0x1E0CB3438];
  v177 = *MEMORY[0x1E0CB3438];
  v178 = v142;
  memset(&v176, 0, sizeof(v176));
  v136 = a3;
  v137 = a4;
  location = *a3;
  v174 = 0;
  v175 = 0;
  v13 = *a4;
  v14 = -[NSTypesetter paragraphCharacterRange](self, "paragraphCharacterRange");
  v159 = v15;
  v161 = v14;
  bRect = -[NSTypesetter paragraphSeparatorCharacterRange](self, "paragraphSeparatorCharacterRange");
  v147 = v16;
  v144 = -[NSATSTypesetter _baseWritingDirection](self, "_baseWritingDirection");
  flags = v10[5][1]._flags;
  v153 = -[NSTypesetter typesetterBehavior](self, "typesetterBehavior");
  v172 = 0.0;
  v173 = 0.0;
  v170 = 0.0;
  v171 = 0.0;
  v155 = v11;
  v140 = -[NSString length](v11, "length");
  v152 = -[NSATSTypesetter _baselineRenderingMode](self, "_baselineRenderingMode");
  y = v6->y;
  x = v6->x;
  v138 = v6;
  v19 = -[NSAttributedString attributesAtIndex:effectiveRange:](self->attributedString, "attributesAtIndex:effectiveRange:", v13, 0);
  v20 = -[NSTextContainer layoutOrientation](-[NSTypesetter currentTextContainer](self, "currentTextContainer"), "layoutOrientation");
  v21 = self->_private;
  if (!v21)
  {
    v21 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v21;
  }
  v22 = (double *)v21[5];
  v23 = -[NSTypesetter typesetterBehavior](self, "typesetterBehavior");
  v24 = -[NSTypesetter _forceOriginalFontBaseline](self, "_forceOriginalFontBaseline");
  if (!v19)
    goto LABEL_12;
  if (!v24 || (v25 = -[NSDictionary objectForKey:](v19, "objectForKey:", _NSOriginalFontAttributeName)) == 0)
    v25 = -[NSDictionary objectForKey:](v19, "objectForKey:", CFSTR("NSFont"));
  if (objc_msgSend(-[NSDictionary objectForKey:](v19, "objectForKey:", CFSTR("CTVerticalForms")), "BOOLValue"))v25 = (id)objc_msgSend(v25, "verticalFont");
  if (!v25)
LABEL_12:
    v25 = (id)NSDefaultFont();
  v26 = (uint64_t)v25;
  if (v20)
    v26 = objc_msgSend(v25, "verticalFont");
  if (v26)
    v27 = (void *)v26;
  else
    v27 = v25;
  objc_msgSend(v27, "_defaultLineHeightForUILayout");
  v29 = v28 + 0.0;
  if (location && (-[NSTypesetter usesFontLeading](self, "usesFontLeading") || CTFontIsSystemUIFont()))
  {
    objc_msgSend(v27, "_leading");
    if (v30 >= 0.0)
      v30 = -0.0;
    v29 = v29 + v30;
  }
  if (v23 >= NSTypesetterBehavior_10_3)
  {
    v31 = v22[13];
    if (v31 > 0.0)
      v29 = v29 * v31;
  }
  v32 = v22[11];
  v33 = v22[12];
  if (v29 >= v32)
    v32 = v29;
  if (v32 > v33 && v33 > 0.0)
    v32 = v22[12];
  v35 = v152;
  if (v23 < NSTypesetterBehavior_10_2)
    v35 = 1;
  if ((v35 & 1) == 0)
  {
    v36 = v22[8];
    v37 = v36 < 0.0;
    v38 = v32 + v36;
    if (v37)
      v32 = v38;
  }
  if (v32 <= 0.0)
    v39 = 0.001;
  else
    v39 = v32;
  v40 = -[NSAttributedString string](self->attributedString, "string");
  if ((uint64_t)v13 < 1)
    goto LABEL_54;
  v41 = v40;
  if (v13 == 1)
  {
    v42 = 0;
  }
  else
  {
    v43 = -[NSString characterAtIndex:](v40, "characterAtIndex:", v13 - 1);
    v42 = v13 - 1;
    if (v43 == 10)
    {
      if (-[NSString characterAtIndex:](v41, "characterAtIndex:", v13 - 2) == 13)
        v42 = v13 - 2;
      else
        v42 = v13 - 1;
    }
  }
  v44 = -[NSATSTypesetter actionForControlCharacterAtIndex:](self, "actionForControlCharacterAtIndex:", v42);
  if ((v44 & 0x10) != 0 || v153 <= NSTypesetterBehavior_10_3 && (v44 & 0x20) != 0)
  {
LABEL_54:
    v45 = 1;
  }
  else
  {
    v113 = -[NSTypesetter attributedString](self, "attributedString");
    v168.origin = 0uLL;
    v114 = -[NSAttributedString attribute:atIndex:effectiveRange:](v113, "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"), v13 - 1, &v168);
    if (*(_QWORD *)&v168.origin.y + *(_QWORD *)&v168.origin.x > v13 || !v114)
    {
      if (-[NSString length](v41, "length") <= v13)
      {
        v114 = 0;
      }
      else
      {
        v114 = -[NSAttributedString attribute:atIndex:effectiveRange:](v113, "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"), v13, &v168);
        if (*(_QWORD *)&v168.origin.y + *(_QWORD *)&v168.origin.x > v13)
          v114 = 0;
      }
    }
    v45 = objc_msgSend(v114, "embeddingType") == 1;
  }
  v151 = 0;
  v154 = 0;
  v170 = 0.0;
  v47 = v153 > NSTypesetterBehavior_10_3 && v144 == 1;
  v149 = v47;
  v148 = v45;
  v48 = v153 > NSTypesetterBehavior_10_2 && v45;
  v145 = v48;
  v146 = v161 + v159;
  v139 = v161 + v159 + 1;
  v134 = bRect + v147 - 1;
  v141 = bRect + v147;
  v133 = bRect + v147 - 2;
  v49 = *MEMORY[0x1E0CB3438];
  v160 = *(double *)(MEMORY[0x1E0CB3438] + 16);
  v162 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  bRecta = *(double *)(MEMORY[0x1E0CB3438] + 24);
  v50 = 1;
  v51 = 10000000.0;
  v52 = 0.0;
  v150 = 0.0;
  v53 = 0.0;
  v54 = 0.0;
  v55 = 0.0;
  v156 = *MEMORY[0x1E0CB3438];
  do
  {
    -[NSATSTypesetter beginLineWithGlyphAtIndex:](self, "beginLineWithGlyphAtIndex:", location);
    currentTextContainerIndex = self->currentTextContainerIndex;
    currentTextContainer = self->currentTextContainer;
    currentTextContainerSize = self->currentTextContainerSize;
    -[NSTypesetter getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:](self, "getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:", &v179, 0, &v176, location, x, y, v51, v39, v55, v53, v54);
    if (v179.size.width != 0.0)
    {
      v52 = v179.size.width + self->lineFragmentPadding * -2.0;
      if (v149)
      {
        v59 = v10[5];
        elasticRangeWidth = v59->_elasticRangeWidth;
        if (elasticRangeWidth <= 0.0)
          v61 = -elasticRangeWidth;
        else
          v61 = v52 - elasticRangeWidth;
        if (v148)
          -[NSParagraphStyle firstLineHeadIndent](self->currentParagraphStyle, "firstLineHeadIndent");
        else
          v62 = *(double *)&v59->_elasticCharIndex;
        v66 = v52 - v62;
        goto LABEL_92;
      }
      if (v153 > NSTypesetterBehavior_10_2_WithCompatibility)
      {
        if (!v148)
        {
          v63 = v10[5];
LABEL_89:
          v61 = *(double *)&v63->_elasticCharIndex;
LABEL_90:
          v66 = v10[5]->_elasticRangeWidth;
          if (v66 <= 0.0)
            v66 = v52 + v66;
LABEL_92:
          if (v66 <= v52)
          {
            if (v66 < 0.0)
              v52 = 0.0;
            else
              v52 = v66;
          }
          v68 = 0.0;
          if (v61 >= 0.0)
          {
            v68 = v61;
            if (v61 > v52)
              v68 = v52;
          }
          v69 = v10[1];
          v49 = v156;
          if (!v69)
          {
            v70 = v52;
            v71 = v39;
            v72 = v54;
            v73 = v53;
            v74 = v55;
            v75 = y;
            v76 = v51;
            v77 = v68;
            v69 = +[NSATSLineFragment allocWithZone:](NSATSLineFragment, "allocWithZone:", -[NSATSTypesetter zone](self, "zone"));
            if (v69)
              v69->_typesetter = self;
            v10[1] = v69;
            v68 = v77;
            v51 = v76;
            y = v75;
            v55 = v74;
            v53 = v73;
            v54 = v72;
            v39 = v71;
            v52 = v70;
            v49 = v156;
          }
          v150 = v68;
          -[NSATSLineFragment layoutForStartingGlyphAtIndex:characterIndex:minPosition:maxPosition:lineFragmentRect:]((CFIndex)v69, v68, v52, v179.origin.x, v179.origin.y, v179.size.width, v179.size.height, v58, v13);
          v78 = v10[1];
          if (v78)
          {
            location = v78->_glyphRange.location;
            length = v78->_glyphRange.length;
            v13 = v78->_characterRange.location;
            v80 = v78->_characterRange.length;
          }
          else
          {
            location = 0;
            length = 0;
            v80 = 0;
            v13 = 0;
          }
          -[NSATSLineFragment getTypographicLineHeight:baselineOffset:leading:]((unint64_t)v78, &v179.size.height, &v171, &v170);
          *((_QWORD *)&v177 + 1) = *(_QWORD *)&v179.origin.y;
          v178.height = v179.size.height;
          v154 = length;
          v151 = v80;
          if (v152)
            goto LABEL_165;
          if (v153 <= NSTypesetterBehavior_10_2_WithCompatibility)
          {
            v55 = v170;
          }
          else
          {
            maxPosition = v10[5]->_maxPosition;
            v55 = v170;
            if (maxPosition < 0.0)
            {
              v55 = maxPosition + v170;
              v170 = v55;
              if (v55 < 0.0)
              {
                if (!v148)
                {
                  v82 = v179.size.height + v55;
                  v179.size.height = v82;
                  v83 = v55 + v171;
                  v171 = v55 + v171;
                  if (v82 <= 0.0)
                  {
                    v171 = v83 - v82;
                    v179.size.height = 0.001;
                  }
                }
                v170 = 0.0;
                v55 = 0.0;
              }
            }
          }
          -[NSTypesetter lineSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:](self, "lineSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:", location + length - 1, v179.origin.x);
          if (v55 < v84)
            v55 = v84;
          v54 = 0.0;
          v53 = 0.0;
          if (v145)
          {
            -[NSTypesetter paragraphSpacingBeforeGlyphAtIndex:withProposedLineFragmentRect:](self, "paragraphSpacingBeforeGlyphAtIndex:withProposedLineFragmentRect:", self->paragraphGlyphRange.location, *(_OWORD *)&v179.origin, *(_OWORD *)&v179.size);
            v53 = v85;
          }
          if (v147 && v13 + v80 >= v146)
          {
            if ((*((_BYTE *)v10 + 84) & 1) != 0)
            {
              -[NSATSTypesetter paragraphSpacingAfterCharactersInRange:withProposedLineFragmentRect:](self, "paragraphSpacingAfterCharactersInRange:withProposedLineFragmentRect:", v13, v139 - v13, *(_OWORD *)&v179.origin, *(_OWORD *)&v179.size);
LABEL_143:
              v54 = v87;
              goto LABEL_144;
            }
            if (v141 <= v140)
            {
              if ((uint64_t)v141 < 1)
                goto LABEL_142;
              if (v141 == 1)
              {
                v86 = 0;
              }
              else
              {
                v88 = -[NSString characterAtIndex:](v155, "characterAtIndex:", v134);
                v86 = v134;
                if (v88 == 10)
                {
                  if (-[NSString characterAtIndex:](v155, "characterAtIndex:", v133) == 13)
                    v86 = v133;
                  else
                    v86 = v134;
                }
              }
              v89 = -[NSATSTypesetter actionForControlCharacterAtIndex:](self, "actionForControlCharacterAtIndex:", v86);
              if ((v89 & 0x10) != 0 || v153 <= NSTypesetterBehavior_10_3 && (v89 & 0x20) != 0)
                goto LABEL_142;
              v90 = -[NSTypesetter attributedString](self, "attributedString");
              v168.origin = 0uLL;
              v91 = -[NSAttributedString attribute:atIndex:effectiveRange:](v90, "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"), v134, &v168);
              if (*(_QWORD *)&v168.origin.y + *(_QWORD *)&v168.origin.x > v141 || !v91)
              {
                if (-[NSString length](v155, "length") <= v141)
                {
                  v91 = 0;
                }
                else
                {
                  v91 = -[NSAttributedString attribute:atIndex:effectiveRange:](v90, "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"));
                  if (*(_QWORD *)&v168.origin.y + *(_QWORD *)&v168.origin.x > v141)
                    v91 = 0;
                }
              }
              if (objc_msgSend(v91, "embeddingType") == 1)
              {
LABEL_142:
                -[NSTypesetter paragraphSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:](self, "paragraphSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:", self->paragraphSeparatorGlyphRange.location + self->paragraphSeparatorGlyphRange.length - 1, *(_OWORD *)&v179.origin, *(_OWORD *)&v179.size);
                goto LABEL_143;
              }
            }
          }
LABEL_144:
          if (v55 <= 0.0 && v53 <= 0.0 && v54 <= 0.0 && v179.size.height == v39)
            goto LABEL_165;
          v166 = 0u;
          v167 = 0u;
          memset(&v165, 0, sizeof(v165));
          lineFragmentPadding = self->lineFragmentPadding;
          v93.y = v179.origin.y;
          v168.size.height = v179.size.height;
          v93.x = x;
          v168.origin = v93;
          v168.size.width = v51;
          -[NSTypesetter getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:](self, "getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:", &v168, &v166, &v165, location);
          height = v168.size.height;
          if (v168.size.width != 0.0
            && v168.size.height != 0.0
            && v179.size.width == v168.size.width
            && lineFragmentPadding == self->lineFragmentPadding)
          {
            v179 = v168;
            *((_QWORD *)&v177 + 1) = *((_QWORD *)&v166 + 1);
            v178.height = *((CGFloat *)&v167 + 1);
            v176 = v165;
            v49 = v156;
            goto LABEL_165;
          }
          if (v179.size.height <= v39)
          {
            if (v168.size.height <= v39)
            {
              v96 = v168.origin.y;
              if (v168.origin.y == v179.origin.y
                || (v97 = v168.origin.x, width = 10000000.0, v179.size.width == v168.size.width)
                && lineFragmentPadding == self->lineFragmentPadding)
              {
LABEL_164:
                v49 = v156;
                v185.origin.x = v156;
                v185.size.width = v160;
                v185.origin.y = v162;
                v185.size.height = bRecta;
                if (!NSEqualRects(v179, v185))
                  goto LABEL_168;
                goto LABEL_165;
              }
            }
            else
            {
              if (v50 & 1 | (v168.size.width >= v179.size.width))
                width = v51;
              else
                width = v168.size.width;
              height = v179.size.height;
              v96 = y;
              v97 = x;
              v50 = 0;
            }
          }
          else
          {
            height = v179.size.height;
            width = v51;
            v96 = y;
            v97 = x;
          }
          v179.origin = v143;
          v179.size = v142;
          v39 = height;
          v51 = width;
          y = v96;
          x = v97;
          goto LABEL_164;
        }
      }
      else
      {
        v63 = v10[5];
        v64 = (*(_DWORD *)&v63[1]._flags >> 7) & 0xF;
        v65 = v64 == 3 || v64 == 0;
        if (!v65 || !v148)
          goto LABEL_89;
      }
      -[NSParagraphStyle firstLineHeadIndent](self->currentParagraphStyle, "firstLineHeadIndent", v179.size.width);
      v61 = v67;
      goto LABEL_90;
    }
    if (v39 + y <= self->currentTextContainerSize.height
      || -[NSString characterAtIndex:](v155, "characterAtIndex:", v13, v39 + y) != 65532
      || !-[NSAttributedString attribute:atIndex:effectiveRange:](self->attributedString, "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"), v13, 0))
    {
LABEL_168:
      self->currentTextContainer = 0;
      return 0;
    }
    v50 = 0;
    v39 = self->currentTextContainerSize.height - y;
    self->currentTextContainerIndex = currentTextContainerIndex;
    self->currentTextContainer = currentTextContainer;
    self->currentTextContainerSize = currentTextContainerSize;
LABEL_165:
    v186.origin.x = v49;
    v186.size.width = v160;
    v186.origin.y = v162;
    v186.size.height = bRecta;
  }
  while (NSEqualRects(v179, v186));
  v172 = v52;
  v173 = v150;
  v99 = (flags >> 7) & 0xF;
  if (((flags >> 7) & 0xF) == 3)
  {
    v100 = v144;
    if (!-[NSATSTypesetter synchronizesAlignmentToDirection](self, "synchronizesAlignmentToDirection"))
      v100 = ((*(_DWORD *)&v10[5][1]._flags >> 19) & 3) - 1;
    if (v13 + v151 < v146)
      -[NSATSLineFragment justifyWithFactor:]((uint64_t)v10[1], 1.0);
    if (v100 == NSWritingDirectionNatural)
      v100 = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0);
    v99 = 2 * (v100 == NSWritingDirectionRightToLeft);
  }
  v101 = v10[1];
  if (v101)
  {
    v102 = v101->_elasticRangeWidth;
    BoundsWithOptions = CTLineGetBoundsWithOptions((CTLineRef)v101->_line, 0);
    v103 = BoundsWithOptions.size.width + v101->_hyphenGlyphWidth - v102;
    v104 = (uint64_t)v10[1];
  }
  else
  {
    v104 = 0;
    v103 = 0.0;
  }
  v178.width = v103;
  -[NSATSLineFragment resolveOpticalAlignmentUpdatingMinPosition:maxPosition:](v104, &v173, &v172);
  v105 = v179.size.width;
  if (v179.size.width >= 10000000.0 || (v105 = v172 - v173, v103 >= v172 - v173))
    v99 = 0;
  v106 = v10[1];
  if (!v106
    || (*(_BYTE *)&v106->_flags & 8) == 0
    || ((v107 = -[NSTypesetter attributedString](self, "attributedString", v105), (v108 = v10[1]) == 0)
      ? (v109 = 0)
      : (v109 = v108->_characterRange.location),
        (v110 = -[NSAttributedString attribute:atIndex:effectiveRange:](v107, "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"), v109, 0)) == 0))
  {
LABEL_190:
    if (v99 == 1)
      goto LABEL_199;
    if (v99 == 2)
      goto LABEL_192;
LABEL_204:
    v112 = v173;
    goto LABEL_205;
  }
  v111 = objc_msgSend(v110, "standaloneAlignment");
  if (!v111)
  {
    v99 = 0;
    goto LABEL_204;
  }
  if (v111 == 1)
  {
LABEL_199:
    v112 = v173 + (v172 - (v103 + v173)) * 0.5;
    goto LABEL_200;
  }
  if (v111 != 2)
    goto LABEL_190;
LABEL_192:
  v112 = v172 - v103;
LABEL_200:
  v99 = 1;
LABEL_205:
  v115 = (uint64_t)v10[1];
  if (v115)
  {
    v116 = *(double *)(v115 + 80);
    if (v116 > 0.0)
    {
      v103 = v116 + v103;
      if (v144 == 1 || *(_QWORD *)(v115 + 40) == *(_QWORD *)(v115 + 72))
      {
        if (v112 != v172 && v103 <= v116)
          v116 = 0.0;
        v112 = v112 - v116;
      }
    }
  }
  v164 = v112;
  if (v153 > NSTypesetterBehavior_10_2_WithCompatibility || v99)
  {
    v118 = v173;
    if (v112 + *(double *)&v177 >= v173)
    {
      v118 = v112 + *(double *)&v177;
    }
    else
    {
      v103 = v103 - (v173 - (v112 + *(double *)&v177));
LABEL_222:
      *(double *)&v177 = v118;
    }
  }
  else
  {
    if (v112 < 0.0)
    {
      v118 = v112 + *(double *)&v177;
      goto LABEL_222;
    }
    v103 = v112 + v103;
    v118 = *(double *)&v177;
  }
  if (v172 < v118 + v103)
  {
    v103 = v103 - (v118 + v103 - v172);
    v178.width = v103;
  }
  v119 = v118 + v179.origin.x;
  v120 = v103 + self->lineFragmentPadding * 2.0;
  v174 = location;
  v175 = v154;
  if (!a6)
  {
    -[NSATSLineFragment saveMorphedGlyphs:](v115, (uint64_t)&v174);
    v121 = v175;
    v122 = v175 - v154;
    if (v175 > v154)
    {
      self->paragraphSeparatorGlyphRange.location += v122;
      self->paragraphGlyphRange.length += v122;
      v154 = v121;
    }
  }
  v123 = *((double *)&v177 + 1);
  v124 = v178.height;
  v181.origin.x = v119;
  v181.origin.y = *((CGFloat *)&v177 + 1);
  v181.size.width = v120;
  v181.size.height = v178.height;
  v182 = NSIntersectionRect(v181, v179);
  v125 = v182.origin.x;
  v126 = v182.origin.y;
  v127 = v182.size.width;
  v128 = v182.size.height;
  if (NSIsEmptyRect(v182))
  {
    if (v120 == 0.0)
    {
      v178.width = 1.0;
      v120 = 1.0;
    }
    if (v124 == 0.0)
    {
      v178.height = 1.0;
      v124 = 1.0;
    }
    v183.origin.x = v119;
    v183.origin.y = v123;
    v183.size.width = v120;
    v183.size.height = v124;
    v184 = NSIntersectionRect(v183, v179);
    v125 = v184.origin.x;
    v126 = v184.origin.y;
    if (v120 == 0.0)
      v127 = 1.0;
    else
      v127 = v184.size.width;
    if (v124 == 0.0)
      v128 = 1.0;
    else
      v128 = v184.size.height;
  }
  *(CGFloat *)&v177 = v125;
  *((double *)&v177 + 1) = v126;
  v178.width = v127;
  v178.height = v128;
  v129 = v13 + v151;
  if (v13 + v151 >= v146)
    v154 += self->paragraphSeparatorGlyphRange.length;
  v171 = v171 + v126 - v179.origin.y;
  if ((*((_BYTE *)v10 + 84) & 2) != 0)
    -[NSATSTypesetter willSetLineFragmentRect:forGlyphRange:usedRect:baselineOffset:](self, "willSetLineFragmentRect:forGlyphRange:usedRect:baselineOffset:", &v179, location, v154, &v177, &v171);
  if (-[NSTypesetter finalizeLineFragmentRect:lineFragmentUsedRect:baselineOffset:forGlyphRange:](self, "finalizeLineFragmentRect:lineFragmentUsedRect:baselineOffset:forGlyphRange:", &v179, &v177, &v171, location, v154))
  {
    v176.origin = v143;
    v176.size = v142;
  }
  -[NSTypesetter setLineFragmentRect:forGlyphRange:usedRect:baselineOffset:](self, "setLineFragmentRect:forGlyphRange:usedRect:baselineOffset:", location, v154, *(_OWORD *)&v179.origin, *(_OWORD *)&v179.size, v177, v178, *(_QWORD *)&v171);
  if (a6)
  {
    if (v129 >= v146)
      *a6 = (id)-[NSATSLineFragment _copyRenderingContextWithGlyphOrigin:]((uint64_t)v10[1], v164);
  }
  else
  {
    if (-[NSAttributedString _isStringDrawingTextStorage](self->attributedString, "_isStringDrawingTextStorage"))
    {
      -[NSAttributedString _setBaselineDelta:](self->attributedString, "_setBaselineDelta:", v171);
      v130 = v10[1];
      if (v130)
      {
        if ((*(_BYTE *)&v130->_flags & 0x10) != 0)
          -[NSAttributedString _setWrappedByCluster:](self->attributedString, "_setWrappedByCluster:", 1);
      }
    }
    -[NSATSLineFragment saveWithGlyphOrigin:]((uint64_t)v10[1], v164);
    if (v129 >= v146)
    {
      if (v144 == 1)
        v131 = *(double *)&v177 - v179.origin.x + self->lineFragmentPadding;
      else
        v131 = *(double *)&v177 + v178.width - v179.origin.x - self->lineFragmentPadding;
      -[NSTypesetter setLocation:withAdvancements:forStartOfGlyphRange:](self, "setLocation:withAdvancements:forStartOfGlyphRange:", 0, self->paragraphSeparatorGlyphRange.location, self->paragraphSeparatorGlyphRange.length, v131, 0.0);
      -[NSTypesetter setNotShownAttribute:forGlyphRange:](self, "setNotShownAttribute:forGlyphRange:", 1, self->paragraphSeparatorGlyphRange.location, self->paragraphSeparatorGlyphRange.length);
      v129 = v151 + v147 + v13;
    }
  }
  -[NSATSTypesetter endLineWithGlyphRange:](self, "endLineWithGlyphRange:", location, v154);
  *v136 = v154 + location;
  *v137 = v129;
  v187.origin.x = v156;
  v187.size.width = v160;
  v187.origin.y = v162;
  v187.size.height = bRecta;
  if (NSEqualRects(v176, v187))
  {
    v132 = v179.origin.y + v179.size.height;
    v138->x = 0.0;
    v138->y = v132;
  }
  else
  {
    *v138 = v176.origin;
  }
  return 1;
}

- (int64_t)_baseWritingDirection
{
  _DWORD *v3;
  int v4;

  v3 = self->_private;
  if (!v3)
  {
    v3 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v3;
  }
  v4 = v3[22] & 3;
  if (!v4)
  {
    -[NSATSTypesetter _doBidiProcessing](self, "_doBidiProcessing");
    v4 = v3[22] & 3;
  }
  return v4 - 1;
}

- (BOOL)_baselineRenderingMode
{
  unsigned __int8 *v3;

  v3 = (unsigned __int8 *)self->_private;
  if (!v3)
  {
    v3 = (unsigned __int8 *)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v3;
  }
  return (v3[84] >> 3) & 1;
}

- (void)beginLineWithGlyphAtIndex:(unint64_t)a3
{
  _QWORD *v5;
  NSArray *textContainers;
  unint64_t v7;
  NSTextContainer *v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v5 = self->_private;
  if (!v5)
  {
    v5 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v5;
  }
  v12.receiver = self;
  v12.super_class = (Class)NSATSTypesetter;
  -[NSTypesetter beginLineWithGlyphAtIndex:](&v12, sel_beginLineWithGlyphAtIndex_, a3);
  textContainers = self->textContainers;
  if (textContainers)
  {
    if (v5[3] == a3 && (v7 = v5[4], v7 != self->currentTextContainerIndex))
    {
      if (v7 < -[NSArray count](textContainers, "count"))
      {
        self->currentTextContainerIndex = v5[4];
        v8 = -[NSArray objectAtIndex:](self->textContainers, "objectAtIndex:");
        self->currentTextContainer = v8;
        -[NSTextContainer size](v8, "size");
        self->currentTextContainerSize.width = v10;
        self->currentTextContainerSize.height = v9;
        if (v10 <= 0.0)
          self->currentTextContainerSize.width = 10000000.0;
        if (v9 <= 0.0)
          self->currentTextContainerSize.height = 10000000.0;
        -[NSTextContainer lineFragmentPadding](self->currentTextContainer, "lineFragmentPadding");
        self->lineFragmentPadding = v11;
      }
    }
    else
    {
      v5[3] = a3;
      v5[4] = self->currentTextContainerIndex;
    }
  }
}

- (void)endLineWithGlyphRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v6;
  objc_super v7;

  length = a3.length;
  location = a3.location;
  v6 = self->_private;
  if (!v6)
  {
    v6 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v6;
  }
  v7.receiver = self;
  v7.super_class = (Class)NSATSTypesetter;
  -[NSTypesetter endLineWithGlyphRange:](&v7, sel_endLineWithGlyphRange_, location, length);
  v6[3] = 0;
  v6[4] = 0;
}

- (const)_bidiLevels
{
  const char **v3;

  v3 = (const char **)self->_private;
  if (!v3)
  {
    v3 = (const char **)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v3;
  }
  if (((_BYTE)v3[11] & 3) == 0)
    -[NSATSTypesetter _doBidiProcessing](self, "_doBidiProcessing");
  return v3[7];
}

- (id)_getATSTypesetterGuts
{
  id result;

  result = self->_private;
  if (!result)
  {
    result = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = result;
  }
  return result;
}

- (double)defaultTighteningFactor
{
  double *v3;

  v3 = (double *)self->_private;
  if (!v3)
  {
    v3 = (double *)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v3;
  }
  return v3[8];
}

- (__CTTypesetter)_ctTypesetter
{
  void *v3;
  __CTTypesetter *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSATSGlyphStorage *v8;
  objc_super v9;

  v3 = self->_private;
  if (!v3)
  {
    v3 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v3;
  }
  result = (__CTTypesetter *)*((_QWORD *)v3 + 12);
  if (!result)
  {
    v5 = -[NSTypesetter paragraphCharacterRange](self, "paragraphCharacterRange");
    v7 = v6;
    v8 = (NSATSGlyphStorage *)*((_QWORD *)v3 + 2);
    if (!v8)
    {
      v8 = +[NSATSGlyphStorage allocWithZone:](NSATSGlyphStorage, "allocWithZone:", -[NSATSTypesetter zone](self, "zone"));
      if (v8)
      {
        v9.receiver = v8;
        v9.super_class = (Class)NSATSGlyphStorage;
        v8 = -[NSATSTypesetter init](&v9, sel_init);
        if (v8)
          v8->_typesetter = self;
      }
      *((_QWORD *)v3 + 2) = v8;
    }
    -[NSATSGlyphStorage setGlyphRange:characterRange:]((id *)&v8->super.super.isa, self->paragraphGlyphRange.location, self->paragraphGlyphRange.length, v5, v7);
    result = (__CTTypesetter *)-[NSATSGlyphStorage createCTTypesetter](*((_QWORD *)v3 + 2));
    *((_QWORD *)v3 + 12) = result;
  }
  return result;
}

- (id)paragraphArbitrator
{
  return -[NSLayoutManager paragraphArbitrator](self->layoutManager, "paragraphArbitrator");
}

- (unint64_t)lineBreakStrategy
{
  unint64_t *v3;
  unint64_t result;

  v3 = (unint64_t *)self->_private;
  if (!v3)
  {
    v3 = (unint64_t *)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v3;
  }
  result = v3[9];
  if (!result)
    return -[NSParagraphStyle lineBreakStrategy](-[NSTypesetter currentParagraphStyle](self, "currentParagraphStyle"), "lineBreakStrategy");
  return result;
}

- (float)hyphenationFactorForGlyphAtIndex:(NSUInteger)glyphIndex
{
  float v4;
  float result;
  double v6;

  -[NSParagraphStyle hyphenationFactor](self->currentParagraphStyle, "hyphenationFactor", glyphIndex);
  if (v4 == 0.0)
  {
    -[NSTypesetter hyphenationFactor](self, "hyphenationFactor");
  }
  else
  {
    v6 = v4;
    if (v6 < 0.0)
      v6 = 0.0;
    return fmin(v6, 1.0);
  }
  return result;
}

- (void)setDefaultTighteningFactor:(double)a3
{
  double *v5;

  v5 = (double *)self->_private;
  if (!v5)
  {
    v5 = (double *)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v5;
  }
  v5[8] = a3;
}

+ (void)initialize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    __NSATSTypesetterClass = objc_opt_class();
    __NSRaiseWithRecursiveLayoutRequest = objc_msgSend(v5, "BOOLForKey:", CFSTR("_NSRaiseWithRecursiveLayoutRequest"));
    __NSAllowsScreenFontKerning = objc_msgSend(v5, "BOOLForKey:", CFSTR("_NSAllowsScreenFontKerning"));
    __NSATSTypesetterSharedInstance = objc_msgSend(objc_allocWithZone((Class)NSATSTypesetter), "init");
  }
  else if (!__NSLineFragmentRectIMP && objc_opt_class() != __NSATSTypesetterClass)
  {
    v3 = objc_msgSend((id)__NSATSTypesetterClass, "instanceMethodForSelector:", sel_lineFragmentRectForProposedRect_remainingRect_);
    if (objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", sel_lineFragmentRectForProposedRect_remainingRect_) != v3)
    {
      v4 = objc_opt_class();
      NSLog((NSString *)CFSTR("Detected an NSATSTypesetter subclass %@ implementing a deprecated interface, -lineFragmentRectForProposedRect:remainingRect:.  NSATSTypesetter is running in backward compatibility mode.  Developers are recommended to use -getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter: instead."), v4);
      __NSLineFragmentRectIMP = v3;
    }
  }
}

- (NSATSTypesetter)init
{
  NSATSTypesetter *v2;
  NSATSTypesetter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSATSTypesetter;
  v2 = -[NSATSTypesetter init](&v5, sel_init);
  v3 = v2;
  if (v2 && !v2->_private)
    v2->_private = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](v2, "zone")), v2);
  return v3;
}

- (NSUInteger)layoutParagraphAtPoint:(NSPoint *)lineFragmentOrigin
{
  _NSRange *p_paragraphGlyphRange;
  NSUInteger location;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  _NSRange *p_paragraphSeparatorGlyphRange;
  _BYTE *v13;
  CGFloat v14;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  NSUInteger v21;

  p_paragraphGlyphRange = &self->paragraphGlyphRange;
  location = self->paragraphGlyphRange.location;
  v21 = location;
  CTSwapLineBreakEpsilon();
  -[NSATSTypesetter beginParagraph](self, "beginParagraph");
  if (p_paragraphGlyphRange->length)
  {
    *(_QWORD *)&v19 = -[NSTypesetter paragraphCharacterRange](self, "paragraphCharacterRange");
    v7 = -[NSTypesetter paragraphSeparatorCharacterRange](self, "paragraphSeparatorCharacterRange");
    v9 = v7 + v8;
    if ((unint64_t)v19 < v7 + v8)
    {
      do
        v10 = -[NSATSTypesetter _layoutLineFragmentStartingWithGlyphAtIndex:characterIndex:atPoint:renderingContext:](self, "_layoutLineFragmentStartingWithGlyphAtIndex:characterIndex:atPoint:renderingContext:", &v21, &v19, lineFragmentOrigin, 0);
      while ((unint64_t)v19 < v9 && v10);
    }
  }
  else
  {
    p_paragraphSeparatorGlyphRange = &self->paragraphSeparatorGlyphRange;
    if (self->paragraphSeparatorGlyphRange.length)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[NSATSTypesetter beginLineWithGlyphAtIndex:](self, "beginLineWithGlyphAtIndex:", location);
      -[NSTypesetter getLineFragmentRect:usedRect:forParagraphSeparatorGlyphRange:atProposedOrigin:](self, "getLineFragmentRect:usedRect:forParagraphSeparatorGlyphRange:atProposedOrigin:", &v19, &v17, p_paragraphSeparatorGlyphRange->location, self->paragraphSeparatorGlyphRange.length, lineFragmentOrigin->x, lineFragmentOrigin->y);
      if (!self->layoutManager || self->currentTextContainer)
      {
        v16 = *((double *)&v17 + 1) + *((double *)&v18 + 1) - *((double *)&v19 + 1);
        v13 = self->_private;
        if (!v13)
        {
          v13 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
          self->_private = v13;
        }
        if ((v13[84] & 2) != 0)
          -[NSATSTypesetter willSetLineFragmentRect:forGlyphRange:usedRect:baselineOffset:](self, "willSetLineFragmentRect:forGlyphRange:usedRect:baselineOffset:", &v19, p_paragraphSeparatorGlyphRange->location, self->paragraphSeparatorGlyphRange.length, &v17, &v16);
        -[NSTypesetter finalizeLineFragmentRect:lineFragmentUsedRect:baselineOffset:forGlyphRange:](self, "finalizeLineFragmentRect:lineFragmentUsedRect:baselineOffset:forGlyphRange:", &v19, &v17, &v16, p_paragraphSeparatorGlyphRange->location, self->paragraphSeparatorGlyphRange.length);
        -[NSTypesetter setLineFragmentRect:forGlyphRange:usedRect:baselineOffset:](self, "setLineFragmentRect:forGlyphRange:usedRect:baselineOffset:", p_paragraphSeparatorGlyphRange->location, self->paragraphSeparatorGlyphRange.length, v19, v20, v17, v18, *(_QWORD *)&v16);
        -[NSTypesetter setLocation:withAdvancements:forStartOfGlyphRange:](self, "setLocation:withAdvancements:forStartOfGlyphRange:", 0, p_paragraphSeparatorGlyphRange->location, self->paragraphSeparatorGlyphRange.length, *(double *)&v17 - *(double *)&v19 + self->lineFragmentPadding, 0.0);
        -[NSTypesetter setNotShownAttribute:forGlyphRange:](self, "setNotShownAttribute:forGlyphRange:", 1, p_paragraphSeparatorGlyphRange->location, self->paragraphSeparatorGlyphRange.length);
        v21 = self->paragraphSeparatorGlyphRange.length + p_paragraphSeparatorGlyphRange->location;
        -[NSATSTypesetter endLineWithGlyphRange:](self, "endLineWithGlyphRange:", p_paragraphGlyphRange->location, v21 - p_paragraphGlyphRange->location);
        v14 = *((double *)&v19 + 1) + *((double *)&v20 + 1);
        lineFragmentOrigin->x = 0.0;
        lineFragmentOrigin->y = v14;
      }
    }
  }
  -[NSATSTypesetter endParagraph](self, "endParagraph");
  CTSwapLineBreakEpsilon();
  return v21;
}

- (void)endParagraph
{
  void *v3;
  const void *v4;
  objc_super v5;

  v3 = self->_private;
  if (!v3)
  {
    v3 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v3;
  }
  v5.receiver = self;
  v5.super_class = (Class)NSATSTypesetter;
  -[NSTypesetter endParagraph](&v5, sel_endParagraph);
  v4 = (const void *)*((_QWORD *)v3 + 12);
  if (v4)
  {
    CFRelease(v4);
    *((_QWORD *)v3 + 12) = 0;
  }
  if (*((_QWORD *)v3 + 7))
  {
    NSZoneFree((NSZone *)-[NSATSTypesetter zone](self, "zone"), *((void **)v3 + 7));
    *((_QWORD *)v3 + 7) = 0;
  }
  -[NSATSLineFragment _invalidate](*((_QWORD *)v3 + 1));
  -[NSATSGlyphStorage _invalidate](*((_QWORD **)v3 + 2));
  if ((*(_DWORD *)(*((_QWORD *)v3 + 5) + 216) & 0x7800) == 0x1000
    && -[NSAttributedString _isStringDrawingTextStorage](self->attributedString, "_isStringDrawingTextStorage"))
  {
    if (-[NSAttributedString _baselineMode](self->attributedString, "_baselineMode"))
      *(_DWORD *)(*((_QWORD *)v3 + 5) + 216) = *(_DWORD *)(*((_QWORD *)v3 + 5) + 216) & 0xFFFF87FF | ((-[NSParagraphStyle lineBreakMode](self->currentParagraphStyle, "lineBreakMode") & 0xF) << 11);
  }
}

- (void)beginParagraph
{
  void **v3;
  const void *v4;
  objc_super v5;

  v3 = (void **)self->_private;
  if (!v3)
  {
    v3 = (void **)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v3;
  }
  v5.receiver = self;
  v5.super_class = (Class)NSATSTypesetter;
  -[NSTypesetter beginParagraph](&v5, sel_beginParagraph);
  *((_DWORD *)v3 + 22) = 0;
  v3[3] = 0;
  v3[4] = 0;
  v4 = v3[12];
  if (v4)
  {
    CFRelease(v4);
    v3[12] = 0;
  }
  if (v3[7])
  {
    NSZoneFree((NSZone *)-[NSATSTypesetter zone](self, "zone"), v3[7]);
    v3[7] = 0;
  }
  if ((*((_BYTE *)v3[5] + 217) & 0x70) == 0
    && -[NSAttributedString _isStringDrawingTextStorage](self->attributedString, "_isStringDrawingTextStorage"))
  {
    if (-[NSAttributedString _baselineMode](self->attributedString, "_baselineMode"))
      *((_DWORD *)v3[5] + 54) = *((_DWORD *)v3[5] + 54) & 0xFFFF87FF | 0x1000;
  }
}

- (_NSRange)layoutCharactersInRange:(_NSRange)a3 forLayoutManager:(id)a4 maximumNumberOfLineFragments:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  BOOL v10;
  void *v11;
  id v12;
  NSUInteger v13;
  NSUInteger v14;
  void *v15;
  BOOL v16;
  BOOL v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  objc_super v21;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  os_unfair_lock_lock((os_unfair_lock_t)&__NSATSTypesetterLock);
  if (-[NSATSTypesetter _isBusy](self, "_isBusy"))
  {
    if (__NSRaiseWithRecursiveLayoutRequest)
      v10 = location == 0;
    else
      v10 = 1;
    if (!v10 && self->layoutManager == a4)
    {
      -[NSATSTypesetter _setBusy:](self, "_setBusy:", 0);
      os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@: Recursive layout request for layout manager %@"), self, a4);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
    v11 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), "init");
    v12 = (id)objc_msgSend(v11, "layoutCharactersInRange:forLayoutManager:maximumNumberOfLineFragments:", location, length, a4, a5);
    v14 = v13;

  }
  else
  {
    -[NSATSTypesetter _setBusy:](self, "_setBusy:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
    v15 = (void *)objc_msgSend(a4, "textStorage");
    v16 = -[NSATSTypesetter _baselineRenderingMode](self, "_baselineRenderingMode");
    v17 = -[NSATSTypesetter _forceWordWrapping](self, "_forceWordWrapping");
    -[NSTypesetter setApplicationFrameworkContext:](self, "setApplicationFrameworkContext:", objc_msgSend(a4, "applicationFrameworkContext"));
    if (objc_msgSend(v15, "_isStringDrawingTextStorage"))
    {
      -[NSATSTypesetter _setForceWordWrapping:](self, "_setForceWordWrapping:", objc_msgSend(v15, "_forceWordWrapping"));
      objc_msgSend(v15, "defaultTighteningFactor");
      -[NSATSTypesetter setDefaultTighteningFactor:](self, "setDefaultTighteningFactor:");
      -[NSATSTypesetter setLineBreakStrategy:](self, "setLineBreakStrategy:", +[NSTypesetter defaultLineBreakStrategy](NSTypesetter, "defaultLineBreakStrategy"));
    }
    -[NSATSTypesetter setLimitsLayoutForSuspiciousContents:](self, "setLimitsLayoutForSuspiciousContents:", objc_msgSend(a4, "limitsLayoutForSuspiciousContents"));
    v21.receiver = self;
    v21.super_class = (Class)NSATSTypesetter;
    v12 = -[NSTypesetter layoutCharactersInRange:forLayoutManager:maximumNumberOfLineFragments:](&v21, sel_layoutCharactersInRange_forLayoutManager_maximumNumberOfLineFragments_, location, length, a4, a5);
    v14 = v18;
    -[NSATSTypesetter _flushCachedObjects](self, "_flushCachedObjects");
    if (!v16)
      -[NSATSTypesetter _setBaselineRenderingMode:](self, "_setBaselineRenderingMode:", 0);
    if (!v17)
      -[NSATSTypesetter _setForceWordWrapping:](self, "_setForceWordWrapping:", 0);
    -[NSATSTypesetter setDefaultTighteningFactor:](self, "setDefaultTighteningFactor:", 0.0);
    -[NSATSTypesetter setLineBreakStrategy:](self, "setLineBreakStrategy:", 0);
    -[NSATSTypesetter setLimitsLayoutForSuspiciousContents:](self, "setLimitsLayoutForSuspiciousContents:", 0);
    -[NSATSTypesetter _setBusy:](self, "_setBusy:", 0);
  }
  v19 = (NSUInteger)v12;
  v20 = v14;
  result.length = v20;
  result.location = v19;
  return result;
}

- (void)setLimitsLayoutForSuspiciousContents:(BOOL)a3
{
  _BOOL4 v3;
  _DWORD *v5;
  int v6;

  v3 = a3;
  v5 = self->_private;
  if (!v5)
  {
    v5 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v5;
  }
  if (v3)
    v6 = 4;
  else
    v6 = 0;
  v5[21] = v5[21] & 0xFFFFFFFB | v6;
}

- (void)_setBusy:(BOOL)a3
{
  _BYTE *v5;

  v5 = self->_private;
  if (!v5)
  {
    v5 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v5;
  }
  v5[80] = a3;
}

- (BOOL)limitsLayoutForSuspiciousContents
{
  unsigned __int8 *v3;

  v3 = (unsigned __int8 *)self->_private;
  if (!v3)
  {
    v3 = (unsigned __int8 *)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v3;
  }
  return (v3[84] >> 2) & 1;
}

- (void)_flushCachedObjects
{
  const __CFString **v3;

  v3 = (const __CFString **)self->_private;
  if (!v3)
  {
    v3 = (const __CFString **)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v3;
  }
  -[NSATSGlyphStorage _flushCachedObjects](v3[2]);
}

- (void)_setBaselineRenderingMode:(BOOL)a3
{
  _BOOL4 v3;
  _DWORD *v5;
  int v6;

  v3 = a3;
  v5 = self->_private;
  if (!v5)
  {
    v5 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v5;
  }
  if (v3)
    v6 = 8;
  else
    v6 = 0;
  v5[21] = v5[21] & 0xFFFFFFF7 | v6;
}

- (void)_doBidiProcessing
{
  void *v3;
  int64_t v4;
  NSZone *v5;
  NSWritingDirection v6;
  NSWritingDirection v7;
  unsigned int v8;
  int v9;
  NSWritingDirection v10;
  BOOL v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  NSUInteger v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  int v18;
  NSTextAlignment v19;
  uint64_t v20;
  unsigned int v21;

  v3 = self->_private;
  if (!v3)
  {
    v3 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v3;
  }
  v4 = -[NSTypesetter applicationFrameworkContext](self, "applicationFrameworkContext");
  if (!-[NSTypesetter bidiProcessingEnabled](self, "bidiProcessingEnabled"))
  {
    v14 = 0;
    v10 = NSWritingDirectionLeftToRight;
    goto LABEL_30;
  }
  v5 = (NSZone *)-[NSATSTypesetter zone](self, "zone");
  v6 = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0);
  v7 = v6;
  v8 = *(_DWORD *)(*((_QWORD *)v3 + 5) + 216);
  v9 = (v8 >> 19) & 3;
  v10 = v9 - 1;
  if ((v8 & 0x8000) != 0 || v9 == 2)
  {
    -[NSTypesetter paragraphCharacterRange](self, "paragraphCharacterRange");
    if (!v15)
    {
LABEL_17:
      v14 = 0;
      goto LABEL_26;
    }
    v13 = v15;
    if (v9)
    {
      v16 = 0;
      goto LABEL_22;
    }
LABEL_18:
    v17 = (unsigned __int8 *)NSZoneMalloc(v5, v13);
    v16 = v17;
    if (v4 == 2)
      v18 = v7;
    else
      v18 = 0;
    memset(v17, v18, v13);
LABEL_22:
    v14 = NSZoneMalloc(v5, v13);
    if ((CFAttributedStringGetBidiLevelsAndResolvedDirections() & 1) == 0)
    {
      NSZoneFree(v5, v14);
      v14 = 0;
    }
    if (v16)
    {
      v10 = (unint64_t)*v16;
      NSZoneFree(v5, v16);
      goto LABEL_30;
    }
LABEL_26:
    if (v9)
      goto LABEL_30;
    goto LABEL_29;
  }
  if (v9)
    v11 = 0;
  else
    v11 = v6 == NSWritingDirectionRightToLeft;
  if (!v11)
    goto LABEL_17;
  -[NSTypesetter paragraphCharacterRange](self, "paragraphCharacterRange");
  if (v12)
  {
    v13 = v12;
    goto LABEL_18;
  }
  v14 = 0;
LABEL_29:
  v10 = v7;
LABEL_30:
  *((_DWORD *)v3 + 22) = *((_DWORD *)v3 + 22) & 0xFFFFFFFC | ((_BYTE)v10 + 1) & 3;
  *((_QWORD *)v3 + 7) = v14;
  v19 = -[NSParagraphStyle alignment](self->currentParagraphStyle, "alignment");
  if (-[NSATSTypesetter _mirrorsTextAlignment](self, "_mirrorsTextAlignment"))
  {
    if (v19 == NSTextAlignmentRight)
    {
      v20 = *((_QWORD *)v3 + 5);
      v21 = *(_DWORD *)(v20 + 216) & 0xFFFFF87F;
      goto LABEL_39;
    }
    if (v19 == NSTextAlignmentLeft)
    {
      v20 = *((_QWORD *)v3 + 5);
      v21 = *(_DWORD *)(v20 + 216) & 0xFFFFF87F | 0x100;
LABEL_39:
      *(_DWORD *)(v20 + 216) = v21;
      -[NSATSTypesetter synchronizesAlignmentToDirection](self, "synchronizesAlignmentToDirection");
      return;
    }
  }
  if (-[NSATSTypesetter synchronizesAlignmentToDirection](self, "synchronizesAlignmentToDirection"))
  {
    if (v19 == NSTextAlignmentNatural)
      *(_DWORD *)(*((_QWORD *)v3 + 5) + 216) = *(_DWORD *)(*((_QWORD *)v3 + 5) + 216) & 0xFFFFF87F | ((v10 == NSWritingDirectionRightToLeft) << 8);
  }
}

- (BOOL)synchronizesAlignmentToDirection
{
  return -[NSLayoutManager synchronizesAlignmentToDirection](-[NSTypesetter layoutManager](self, "layoutManager"), "synchronizesAlignmentToDirection");
}

- (BOOL)_mirrorsTextAlignment
{
  return -[NSLayoutManager _mirrorsTextAlignment](-[NSTypesetter layoutManager](self, "layoutManager"), "_mirrorsTextAlignment");
}

- (void)setLineBreakStrategy:(unint64_t)a3
{
  _QWORD *v5;

  v5 = self->_private;
  if (!v5)
  {
    v5 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v5;
  }
  v5[9] = a3;
}

- (void)_setForceWordWrapping:(BOOL)a3
{
  _BOOL4 v3;
  _DWORD *v5;
  int v6;

  v3 = a3;
  v5 = self->_private;
  if (!v5)
  {
    v5 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v5;
  }
  if (v3)
    v6 = 16;
  else
    v6 = 0;
  v5[21] = v5[21] & 0xFFFFFFEF | v6;
}

- (BOOL)_isBusy
{
  BOOL *v3;

  v3 = (BOOL *)self->_private;
  if (!v3)
  {
    v3 = (BOOL *)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v3;
  }
  return v3[80];
}

- (BOOL)_forceWordWrapping
{
  unsigned __int8 *v3;

  v3 = (unsigned __int8 *)self->_private;
  if (!v3)
  {
    v3 = (unsigned __int8 *)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v3;
  }
  return (v3[84] >> 4) & 1;
}

- ($500F09A0A86A1DC0979241A7D72823DF)_lineFragmentRectForProposedRectArgs
{
  $500F09A0A86A1DC0979241A7D72823DF **v3;

  v3 = ($500F09A0A86A1DC0979241A7D72823DF **)self->_private;
  if (!v3)
  {
    v3 = ($500F09A0A86A1DC0979241A7D72823DF **)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v3;
  }
  return v3[6];
}

- (unint64_t)actionForControlCharacterAtIndex:(unint64_t)a3
{
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSATSTypesetter;
  v5 = -[NSTypesetter actionForControlCharacterAtIndex:](&v8, sel_actionForControlCharacterAtIndex_);
  v6 = -[NSLayoutManager delegate](self->layoutManager, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v6, "layoutManager:shouldUseAction:forControlCharacterAtIndex:", self->layoutManager, v5, a3);
  return (unint64_t)v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSATSTypesetter;
  -[NSTypesetter dealloc](&v3, sel_dealloc);
}

+ (BOOL)_allowsScreenFontKerning
{
  return __NSAllowsScreenFontKerning;
}

- (id)_textContainerForAttachmentProtocol
{
  return 0;
}

- (id)_textStorageForAttachmentProtocol
{
  return 0;
}

- (BOOL)_usesScreenFonts
{
  return 0;
}

- (unint64_t)_sweepDirectionForGlyphAtIndex:(int64_t)a3
{
  return -[NSTypesetter typesetterBehavior](self, "typesetterBehavior", a3) < NSTypesetterBehavior_10_4
      || -[NSATSTypesetter _baseWritingDirection](self, "_baseWritingDirection") != 1;
}

- (BOOL)shouldBreakLineByHyphenatingBeforeCharacterAtIndex:(NSUInteger)charIndex
{
  id v5;

  v5 = -[NSLayoutManager delegate](-[NSTypesetter layoutManager](self, "layoutManager"), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v5, "layoutManager:shouldBreakLineByHyphenatingBeforeCharacterAtIndex:", -[NSTypesetter layoutManager](self, "layoutManager"), charIndex);
  else
    return 1;
}

- (NSRect)boundingBoxForControlGlyphAtIndex:(NSUInteger)glyphIndex forTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(NSRect)proposedRect glyphPosition:(NSPoint)glyphPosition characterIndex:(NSUInteger)charIndex
{
  double y;
  double x;
  double height;
  double width;
  double v12;
  double v13;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSRect result;

  y = glyphPosition.y;
  x = glyphPosition.x;
  height = proposedRect.size.height;
  width = proposedRect.size.width;
  v12 = proposedRect.origin.y;
  v13 = proposedRect.origin.x;
  v17 = -[NSLayoutManager delegate](-[NSTypesetter layoutManager](self, "layoutManager"), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v17, "layoutManager:boundingBoxForControlGlyphAtIndex:forTextContainer:proposedLineFragment:glyphPosition:characterIndex:", -[NSTypesetter layoutManager](self, "layoutManager"), glyphIndex, textContainer, charIndex, v13, v12, width, height, x, y);
  }
  else
  {
    v18 = *MEMORY[0x1E0CB3438];
    v19 = *(double *)(MEMORY[0x1E0CB3438] + 8);
    v20 = *(double *)(MEMORY[0x1E0CB3438] + 16);
    v21 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  }
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (UTF32Char)hyphenCharacterForGlyphAtIndex:(NSUInteger)glyphIndex
{
  return 8208;
}

- (void)layoutGlyphsInLayoutManager:(id)a3 startingAtGlyphIndex:(unint64_t)a4 maxNumberOfLineFragments:(unint64_t)a5 nextGlyphIndex:(unint64_t *)a6
{
  void *v11;
  BOOL v12;
  BOOL v13;
  id v14;
  objc_super v15;

  os_unfair_lock_lock((os_unfair_lock_t)&__NSATSTypesetterLock);
  if (-[NSATSTypesetter _isBusy](self, "_isBusy"))
  {
    if (a4 && __NSRaiseWithRecursiveLayoutRequest && self->layoutManager == a3)
    {
      -[NSATSTypesetter _setBusy:](self, "_setBusy:", 0);
      os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@: Recursive layout request for layout manager %@"), self, a3);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
    v14 = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), "init");
    objc_msgSend(v14, "layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:", a3, a4, a5, a6);

  }
  else
  {
    -[NSATSTypesetter _setBusy:](self, "_setBusy:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
    v11 = (void *)objc_msgSend(a3, "textStorage");
    v12 = -[NSATSTypesetter _baselineRenderingMode](self, "_baselineRenderingMode");
    v13 = -[NSATSTypesetter _forceWordWrapping](self, "_forceWordWrapping");
    -[NSTypesetter setApplicationFrameworkContext:](self, "setApplicationFrameworkContext:", objc_msgSend(a3, "applicationFrameworkContext"));
    if (objc_msgSend(v11, "_isStringDrawingTextStorage"))
    {
      -[NSATSTypesetter _setForceWordWrapping:](self, "_setForceWordWrapping:", objc_msgSend(v11, "_forceWordWrapping"));
      objc_msgSend(v11, "defaultTighteningFactor");
      -[NSATSTypesetter setDefaultTighteningFactor:](self, "setDefaultTighteningFactor:");
      -[NSATSTypesetter setLineBreakStrategy:](self, "setLineBreakStrategy:", +[NSTypesetter defaultLineBreakStrategy](NSTypesetter, "defaultLineBreakStrategy"));
      -[NSATSTypesetter setLimitsLayoutForSuspiciousContents:](self, "setLimitsLayoutForSuspiciousContents:", objc_msgSend(a3, "limitsLayoutForSuspiciousContents"));
    }
    v15.receiver = self;
    v15.super_class = (Class)NSATSTypesetter;
    -[NSTypesetter layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:](&v15, sel_layoutGlyphsInLayoutManager_startingAtGlyphIndex_maxNumberOfLineFragments_nextGlyphIndex_, a3, a4, a5, a6);
    -[NSATSTypesetter _flushCachedObjects](self, "_flushCachedObjects");
    if (!v12)
      -[NSATSTypesetter _setBaselineRenderingMode:](self, "_setBaselineRenderingMode:", 0);
    if (!v13)
      -[NSATSTypesetter _setForceWordWrapping:](self, "_setForceWordWrapping:", 0);
    -[NSATSTypesetter setDefaultTighteningFactor:](self, "setDefaultTighteningFactor:", 0.0);
    -[NSATSTypesetter setLineBreakStrategy:](self, "setLineBreakStrategy:", 0);
    -[NSATSTypesetter setLimitsLayoutForSuspiciousContents:](self, "setLimitsLayoutForSuspiciousContents:", 0);
    -[NSATSTypesetter _setBusy:](self, "_setBusy:", 0);
  }
}

- (double)baselineOffsetInLayoutManager:(id)a3 glyphIndex:(unint64_t)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  os_unfair_lock_lock((os_unfair_lock_t)&__NSATSTypesetterLock);
  if (-[NSATSTypesetter _isBusy](self, "_isBusy"))
  {
    if (a4 && __NSRaiseWithRecursiveLayoutRequest && self->layoutManager == a3)
    {
      -[NSATSTypesetter _setBusy:](self, "_setBusy:", 0);
      os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@: Recursive layout request for layout manager %@"), self, a3);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
    v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), "init");
    objc_msgSend(v7, "baselineOffsetInLayoutManager:glyphIndex:", a3, a4);
    v9 = v8;

  }
  else
  {
    -[NSATSTypesetter _setBusy:](self, "_setBusy:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
    v12.receiver = self;
    v12.super_class = (Class)NSATSTypesetter;
    -[NSTypesetter baselineOffsetInLayoutManager:glyphIndex:](&v12, sel_baselineOffsetInLayoutManager_glyphIndex_, a3, a4);
    v9 = v10;
    -[NSATSTypesetter _setBusy:](self, "_setBusy:", 0);
  }
  return v9;
}

- (NSRect)lineFragmentRectForProposedRect:(NSRect)proposedRect remainingRect:(NSRectPointer)remainingRect
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v10;
  uint64_t v11;
  double v12;
  double *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  NSRect result;

  height = proposedRect.size.height;
  width = proposedRect.size.width;
  y = proposedRect.origin.y;
  x = proposedRect.origin.x;
  v10 = self->_private;
  if (!v10)
  {
    v10 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), self);
    self->_private = v10;
  }
  v11 = v10[6];
  v18 = 0u;
  v19 = 0u;
  if (v11)
  {
    v12 = height - (*(double *)v11 + *(double *)(v11 + 8) + *(double *)(v11 + 16));
    v10[6] = 0;
    -[NSTypesetter getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:](self, "getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:", &v18, v11, remainingRect, *(_QWORD *)(v11 + 24), x, y, width, v12, *(double *)v11, *(double *)(v11 + 8), *(double *)(v11 + 16));
    v10[6] = v11;
    v13 = (double *)&v18;
    v14 = *((double *)&v18 + 1);
    v15 = *(double *)&v19;
  }
  else
  {
    v13 = (double *)MEMORY[0x1E0CB3438];
    v14 = *(double *)(MEMORY[0x1E0CB3438] + 8);
    v15 = *(double *)(MEMORY[0x1E0CB3438] + 16);
  }
  v16 = v13[3];
  v17 = *v13;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v17;
  return result;
}

@end
