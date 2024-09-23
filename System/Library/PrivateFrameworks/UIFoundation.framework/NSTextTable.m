@implementation NSTextTable

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[NSTextTable setVersion:](NSTextTable, "setVersion:", 1);
    __NSTextTableClass = (uint64_t)a1;
  }
}

- (NSTextTable)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSTextTable;
  return -[NSTextBlock init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NSTextTable;
  -[NSTextBlock dealloc](&v2, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t numCols;
  int tableFlags;
  int v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSTextTable;
  -[NSTextBlock encodeWithCoder:](&v8, sel_encodeWithCoder_);
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    objc_msgSend(a3, "encodeInteger:forKey:", self->_numCols, CFSTR("NSNumCols"));
    objc_msgSend(a3, "encodeInteger:forKey:", self->_tableFlags, CFSTR("NSTableFlags"));
  }
  else
  {
    numCols = self->_numCols;
    tableFlags = self->_tableFlags;
    v7 = numCols;
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "II", &v7, &tableFlags);
  }
}

- (NSTextTable)initWithCoder:(id)a3
{
  NSTextTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSTextTable;
  v4 = -[NSTextBlock initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
    {
      v4->_numCols = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSNumCols"));
      v4->_tableFlags = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSTableFlags"));
    }
    else
    {
      v5 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSTextTable"));
      if (v5 == 1)
      {
        v9 = 0;
        objc_msgSend(a3, "decodeValuesOfObjCTypes:", "II", (char *)&v9 + 4, &v9);
        v4->_numCols = HIDWORD(v9);
        v4->_tableFlags = v9;
      }
      else
      {
        v6 = v5;
        v7 = _NSFullMethodName();
        NSLog((NSString *)CFSTR("%@: class version %ld cannot read instances archived with version %ld"), v7, 1, v6);

        return 0;
      }
    }
  }
  return v4;
}

- (void)_takeValuesFromTextBlock:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSTextTable;
  -[NSTextBlock _takeValuesFromTextBlock:](&v5, sel__takeValuesFromTextBlock_);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_numCols = *((_QWORD *)a3 + 6);
    self->_tableFlags = *((_QWORD *)a3 + 7);
  }
}

- (void)setNumberOfColumns:(NSUInteger)numberOfColumns
{
  self->_numCols = numberOfColumns;
}

- (NSUInteger)numberOfColumns
{
  return self->_numCols;
}

- (BOOL)collapsesBorders
{
  return self->_tableFlags & 1;
}

- (void)setCollapsesBorders:(BOOL)collapsesBorders
{
  self->_tableFlags = self->_tableFlags & 0xFFFFFFFFFFFFFFFELL | collapsesBorders;
}

- (BOOL)hidesEmptyCells
{
  return (LOBYTE(self->_tableFlags) >> 1) & 1;
}

- (void)setHidesEmptyCells:(BOOL)hidesEmptyCells
{
  uint64_t v3;

  v3 = 2;
  if (!hidesEmptyCells)
    v3 = 0;
  self->_tableFlags = self->_tableFlags & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (NSTextTableLayoutAlgorithm)layoutAlgorithm
{
  return (self->_tableFlags >> 2) & 1;
}

- (void)setLayoutAlgorithm:(NSTextTableLayoutAlgorithm)layoutAlgorithm
{
  self->_tableFlags = self->_tableFlags & 0xFFFFFFFFFFFFFFFBLL | (4
                                                                * (layoutAlgorithm == NSTextTableFixedLayoutAlgorithm));
}

- (unint64_t)_tableFlags
{
  return self->_tableFlags;
}

- (void)_setTableFlags:(unint64_t)a3
{
  self->_tableFlags = a3;
}

- (id)_rowArrayForBlock:(id)a3 atIndex:(unint64_t)a4 text:(id)a5 layoutManager:(id)a6 containerWidth:(double)a7 withRepetitions:(BOOL)a8 collapseBorders:(BOOL)a9 rowCharRange:(_NSRange *)a10 indexInRow:(unint64_t *)a11 startingRow:(int64_t *)a12 startingColumn:(int64_t *)a13 previousRowBlockHelper:(id *)a14
{
  _BOOL4 v14;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  BOOL v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  id v31;
  void *v32;
  unint64_t v33;
  NSUInteger v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t *v38;
  id *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  void *v47;
  NSTextTable *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  BOOL v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  id v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  void *v71;
  void *v72;
  id v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  unint64_t i;
  uint64_t v93;
  unint64_t v94;
  int64_t *v95;
  int64_t *v96;
  NSLayoutManagerTextBlockRowArrayCache *v97;
  uint64_t v98;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t *v107;
  unint64_t *v108;
  uint64_t v109;
  unint64_t v110;
  char v111;
  uint64_t v112;
  unint64_t v113;
  unsigned int v114;
  _BOOL4 v115;
  id v116;
  NSUInteger v117;
  NSUInteger v118;
  id v119;
  unint64_t v120;
  uint64_t v121;
  int64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v126;
  uint64_t v127;

  v114 = a9;
  v14 = a8;
  v20 = objc_msgSend(a5, "_rangeOfTextTableRow:atIndex:");
  v22 = v21;
  v119 = a5;
  v120 = a4;
  v23 = (void *)objc_msgSend((id)objc_msgSend(a5, "attribute:atIndex:effectiveRange:"), "textBlocks");
  v24 = objc_msgSend(v23, "count");
  v25 = v24;
  v115 = v14;
  if (a12)
    v26 = 1;
  else
    v26 = v14;
  v116 = a6;
  if (a3)
    v27 = a6 == 0;
  else
    v27 = 1;
  if (v27)
    v26 = 1;
  if (a13)
    v26 = 1;
  v111 = v26;
  if (a10)
  {
    a10->location = v20;
    a10->length = v22;
  }
  v117 = v22;
  v118 = v20;
  if (v24)
  {
    v28 = *MEMORY[0x1E0C99768];
    v29 = 1;
    do
    {
      v30 = v29 - 1;
      v31 = (id)objc_msgSend(v23, "objectAtIndex:", v29 - 1);
      if (v31 == a3)
      {
        if (a3 && (NSTextTable *)objc_msgSend(a3, "table") != self)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v28, CFSTR("*** block %p has table %p rather than %p at index %lu"), a3, objc_msgSend(a3, "table"), self, v120);
      }
      else
      {
        v32 = v31;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (NSTextTable *)objc_msgSend(v32, "table") == self)
        {
          if (a3)
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v28, CFSTR("*** table %p has block %p rather than %p at index %lu"), self, v32, a3, v120);
          a3 = v32;
        }
        else
        {
          v30 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
        break;
      v46 = v29++ >= v25;
    }
    while (!v46);
    if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_34;
  }
  else
  {
    v30 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("*** table %p has no block at index %lu"), self, v120);
    v34 = v117;
    v33 = v118;
    v35 = v119;
LABEL_35:
    v36 = objc_msgSend(a3, "startingRow");
    v37 = objc_msgSend(a3, "startingColumn");
    goto LABEL_36;
  }
LABEL_34:
  v34 = v117;
  v33 = v118;
  v35 = v119;
  if (a3)
    goto LABEL_35;
  v36 = 0;
  v37 = 0;
LABEL_36:
  v38 = a11;
  v126 = 0;
  v127 = 0;
  v39 = a14;
  v122 = v37;
  v109 = 0x7FFFFFFFFFFFFFFFLL;
  if (!a14)
  {
    v112 = 0;
    v50 = v33;
    goto LABEL_62;
  }
  v40 = 0;
  if (v30 != 0x7FFFFFFFFFFFFFFFLL && v33)
  {
    v123 = v36;
    v41 = v33 - 1;
    v40 = (char *)objc_msgSend((id)objc_msgSend(v35, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v33 - 1, 0), "textBlocks");
    if (v40)
    {
      v42 = v40;
      if (objc_msgSend(v40, "count") > v30)
      {
        if (!v30)
          goto LABEL_49;
        v43 = 1;
        do
        {
          v44 = objc_msgSend(v23, "objectAtIndex:", v43 - 1);
          v45 = objc_msgSend(v42, "objectAtIndex:", v43 - 1);
          v46 = v44 != v45 || v43++ >= v30;
        }
        while (!v46);
        v35 = v119;
        if (v44 == v45)
        {
LABEL_49:
          v47 = (void *)objc_msgSend(v42, "objectAtIndex:", v30);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v48 = (NSTextTable *)objc_msgSend(v47, "table");
            v40 = 0;
            v109 = 0x7FFFFFFFFFFFFFFFLL;
            if (v48 == self && v47)
            {
              v49 = objc_msgSend(v47, "startingRow");
              if (objc_msgSend(v47, "rowSpan") + v49 == v123)
              {
                v112 = 0;
                v109 = 0x7FFFFFFFFFFFFFFFLL;
                v50 = v33;
              }
              else
              {
                v50 = objc_msgSend(v35, "rangeOfTextTable:atIndex:", self, v120);
                v112 = v100;
                v109 = v50;
                if (v50 < v33)
                {
                  do
                  {
                    v101 = (void *)objc_msgSend((id)objc_msgSend(v35, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSParagraphStyle"), v50, &v126, v109, v112), "textBlocks");
                    if (v101)
                    {
                      v102 = v101;
                      if (objc_msgSend(v101, "count") > v30)
                      {
                        v103 = (void *)objc_msgSend(v102, "objectAtIndex:", v30);
                        if (v103 != v47)
                        {
                          v104 = v103;
                          v105 = objc_msgSend(v103, "startingRow");
                          v106 = objc_msgSend(v104, "rowSpan") + v105;
                          v35 = v119;
                          if (v106 == v123)
                          {
                            v41 = v50;
                            v47 = v104;
                          }
                        }
                      }
                    }
                    v38 = a11;
                    v50 = v127 + v126;
                  }
                  while (v127 + v126 < v33);
                  if (!v47)
                  {
                    v40 = 0;
LABEL_160:
                    v36 = v123;
                    goto LABEL_60;
                  }
LABEL_159:
                  v40 = -[NSTextBlockLayoutHelper initWithTextBlock:charIndex:text:layoutManager:containerWidth:collapseBorders:]((char *)[NSTextBlockLayoutHelper alloc], v47, v41, v35, v116, v114, a7);
                  goto LABEL_160;
                }
              }
              v38 = a11;
              goto LABEL_159;
            }
            v50 = v33;
            v112 = 0;
LABEL_59:
            v36 = v123;
            v38 = a11;
LABEL_60:
            v39 = a14;
            goto LABEL_61;
          }
        }
      }
      v40 = 0;
    }
    v112 = 0;
    v109 = 0x7FFFFFFFFFFFFFFFLL;
    v50 = v33;
    goto LABEL_59;
  }
  v50 = v33;
  v112 = 0;
LABEL_61:
  *v39 = v40;
LABEL_62:
  if ((v111 & 1) != 0
    || (v51 = objc_msgSend(v116, "_rowArrayCache")) == 0
    || (v33 == *(_QWORD *)(v51 + 8) ? (v52 = v34 == *(_QWORD *)(v51 + 16)) : (v52 = 0),
        !v52 || *(unsigned __int8 *)(v51 + 40) != v114 || vabdd_f64(a7, *(double *)(v51 + 24)) >= 0.001))
  {
    v53 = 0;
    goto LABEL_81;
  }
  v53 = *(void **)(v51 + 32);
  if (!v53)
  {
LABEL_81:
    v113 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_82;
  }
  v54 = objc_msgSend(*(id *)(v51 + 32), "count");
  if (v54)
  {
    v55 = v54;
    v107 = v38;
    v56 = 0;
    v113 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v57 = objc_msgSend(v53, "objectAtIndex:", v56);
      v58 = *(id *)(v57 + 8);
      if (v58)
      {
        v59 = (_QWORD *)v57;
        objc_msgSend(v116, "layoutRectForTextBlock:atIndex:effectiveRange:", v58, *(_QWORD *)(v57 + 32), 0);
        v59[6] = v60;
        v59[7] = v61;
        v59[8] = v62;
        v59[9] = v63;
        v34 = v117;
        objc_msgSend(v116, "boundsRectForTextBlock:atIndex:effectiveRange:", v58, v59[4], 0);
        v59[10] = v64;
        v59[11] = v65;
        v59[12] = v66;
        v59[13] = v67;
        v68 = v113;
        if (v58 == a3)
          v68 = v56;
        v113 = v68;
      }
      ++v56;
    }
    while (v55 != v56);
    v33 = v118;
    v35 = v119;
    v38 = v107;
LABEL_82:
    if (v30 == 0x7FFFFFFFFFFFFFFFLL || v53)
    {
      v96 = a12;
      v95 = a13;
    }
    else
    {
      v124 = v36;
      v53 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v69 = v33 + v34;
      v108 = v38;
      v70 = 0;
      while (v50 < v69)
      {
        v71 = (void *)objc_msgSend((id)objc_msgSend(v35, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSParagraphStyle"), v50, &v126, v33, v34), "textBlocks");
        if (v71 && (v72 = v71, objc_msgSend(v71, "count") > v30))
        {
          v73 = (id)objc_msgSend(v72, "objectAtIndex:", v30);
          v74 = -[NSTextBlockLayoutHelper initWithTextBlock:charIndex:text:layoutManager:containerWidth:collapseBorders:]((char *)[NSTextBlockLayoutHelper alloc], v73, v50, v35, v116, v114, a7);
          v75 = objc_msgSend(v73, "startingRow");
          v76 = objc_msgSend(v73, "startingColumn");
          v77 = objc_msgSend(v73, "columnSpan");
          if (v70)
            v78 = v124;
          else
            v78 = v75;
          v79 = v122;
          if (!v70)
            v79 = v76;
          v122 = v79;
          v124 = v78;
          if (v73 == a3)
            v113 = objc_msgSend(v53, "count");
          if (v115)
          {
            v34 = v117;
            v33 = v118;
            if (v77 >= 1)
            {
              v80 = v77;
              do
              {
                objc_msgSend(v53, "addObject:", v74);
                --v80;
              }
              while (v80);
            }
          }
          else
          {
            objc_msgSend(v53, "addObject:", v74);
            v34 = v117;
            v33 = v118;
          }
          v70 += v77;
          v50 = *((_QWORD *)v74 + 3) + *((_QWORD *)v74 + 2);

          v35 = v119;
        }
        else
        {
          v50 = v127 + v126;
        }
      }
      if (v70 < self->_numCols)
      {
        v81 = v109;
        if (!v112)
        {
          v81 = objc_msgSend(v35, "rangeOfTextTable:atIndex:", self, v120);
          v112 = v82;
        }
        if (v81 < v33)
        {
          v83 = v81;
          v110 = v81;
          do
          {
            if (v70 >= self->_numCols)
              break;
            v84 = (void *)objc_msgSend((id)objc_msgSend(v35, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSParagraphStyle"), v83, &v126, v81, v112), "textBlocks");
            if (v84 && (v85 = v84, objc_msgSend(v84, "count") > v30))
            {
              v86 = (void *)objc_msgSend(v85, "objectAtIndex:", v30);
              v87 = objc_msgSend(v86, "startingRow");
              v88 = objc_msgSend(v86, "rowSpan");
              v89 = objc_msgSend(v86, "startingColumn");
              v90 = objc_msgSend(v86, "columnSpan");
              if (v87 > v124 || v88 + v87 <= v124)
              {
                v83 = v127 + v126;
                v33 = v118;
              }
              else
              {
                v121 = v90;
                v91 = -[NSTextBlockLayoutHelper initWithTextBlock:charIndex:text:layoutManager:containerWidth:collapseBorders:]((char *)[NSTextBlockLayoutHelper alloc], v86, v83, v119, v116, v114, a7);
                for (i = 0; i < objc_msgSend(v53, "count"); ++i)
                {
                  if (v89 < objc_msgSend(*(id *)(objc_msgSend(v53, "objectAtIndex:", i) + 8), "startingColumn"))
                    break;
                }
                v33 = v118;
                if (v115)
                {
                  v93 = v121;
                  if (v121 < 1)
                  {
                    v94 = v113;
                  }
                  else
                  {
                    v94 = v113;
                    do
                    {
                      objc_msgSend(v53, "insertObject:atIndex:", v91, i);
                      if (i <= v94)
                        ++v94;
                      --v93;
                    }
                    while (v93);
                  }
                }
                else
                {
                  objc_msgSend(v53, "insertObject:atIndex:", v91, i);
                  v94 = v113;
                  if (i <= v113)
                    v94 = v113 + 1;
                }
                v113 = v94;
                v70 += v121;
                v83 = *((_QWORD *)v91 + 3) + *((_QWORD *)v91 + 2);

              }
              v35 = v119;
              v81 = v110;
            }
            else
            {
              v83 = v127 + v126;
            }
          }
          while (v83 < v33);
        }
      }
      if (v115)
      {
        while (v70 < self->_numCols)
        {
          objc_msgSend(v53, "addObject:", objc_msgSend(v53, "lastObject"));
          ++v70;
        }
      }
      if ((v111 & 1) == 0)
      {
        v97 = -[NSLayoutManagerTextBlockRowArrayCache initWithRowCharRange:containerWidth:rowArray:collapseBorders:]([NSLayoutManagerTextBlockRowArrayCache alloc], "initWithRowCharRange:containerWidth:rowArray:collapseBorders:", v33, v117, v53, v114, a7);
        objc_msgSend(v116, "_setRowArrayCache:", v97);

      }
      v96 = a12;
      v95 = a13;
      v36 = v124;
      v38 = v108;
    }
    v98 = v113;
    if (v38)
      goto LABEL_140;
    goto LABEL_141;
  }
  v98 = 0x7FFFFFFFFFFFFFFFLL;
  v96 = a12;
  v95 = a13;
  if (v38)
LABEL_140:
    *v38 = v98;
LABEL_141:
  if (v96)
    *v96 = v36;
  if (v95)
    *v95 = v122;
  return v53;
}

- (id)_descriptionAtIndex:(unint64_t)a3 text:(id)a4
{
  void *v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  NSTextTable *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;
  NSUInteger location;
  NSUInteger length;
  uint64_t v21;
  void *v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  NSTextTable *v34;
  uint64_t v35;
  id v36;
  NSUInteger range;
  NSRange v38;
  NSRange v39;
  NSRange v40;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v8 = objc_msgSend(a4, "rangeOfTextTable:atIndex:", self, a3);
  v10 = v9;
  v36 = a4;
  v11 = (void *)objc_msgSend((id)objc_msgSend(a4, "attribute:atIndex:effectiveRange:"), "textBlocks");
  v12 = objc_msgSend(v11, "count");
  if (!v12)
    goto LABEL_26;
  v13 = v12;
  v14 = self;
  v15 = 1;
  do
  {
    if ((NSTextTable *)objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v15 - 1), "table") == v14)
      v16 = v15 - 1;
    else
      v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  while (v16 == 0x7FFFFFFFFFFFFFFFLL && v15++ < v13);
  self = v14;
  if (v10 && v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v38.location = v8;
    v38.length = v10;
    v34 = v14;
    objc_msgSend(v7, "appendFormat:", CFSTR("table %p range %@ cols %lu flags 0x%lx %@\n"), v14, NSStringFromRange(v38), v14->_numCols, v14->_tableFlags, -[NSTextBlock _attributeDescription](v14, "_attributeDescription"));
    v33 = v8 + v10;
    if (v8 < v8 + v10)
    {
      v18 = 0;
      do
      {
        v39.location = objc_msgSend(v36, "_rangeOfTextTableRow:atIndex:", self, v8);
        location = v39.location;
        length = v39.length;
        v35 = v18;
        objc_msgSend(v7, "appendFormat:", CFSTR("  row %lu range %@\n"), v18, NSStringFromRange(v39));
        range = location + length;
        if (v8 < location + length)
        {
          v21 = 0;
          do
          {
            v22 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v36, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v8, 0), "textBlocks"), "objectAtIndex:", v16);
            v23 = objc_msgSend(v36, "rangeOfTextBlock:atIndex:", v22, v8);
            v25 = v24;
            v26 = objc_msgSend(v22, "startingRow");
            v27 = objc_msgSend(v22, "rowSpan");
            v28 = objc_msgSend(v22, "startingColumn");
            v29 = objc_msgSend(v22, "columnSpan");
            v40.location = v23;
            v40.length = v25;
            objc_msgSend(v7, "appendFormat:", CFSTR("    cell %lu %p range %@ "), v21, v22, NSStringFromRange(v40));
            if (v27 < 2)
              objc_msgSend(v7, "appendFormat:", CFSTR("row %ld "), v26, v31);
            else
              objc_msgSend(v7, "appendFormat:", CFSTR("rows %ld-%ld "), v26, v26 + v27 - 1);
            if (v29 < 2)
              objc_msgSend(v7, "appendFormat:", CFSTR("col %ld "), v28, v32);
            else
              objc_msgSend(v7, "appendFormat:", CFSTR("cols %ld-%ld "), v28, v28 + v29 - 1);
            objc_msgSend(v7, "appendFormat:", CFSTR("%@\n"), objc_msgSend(v22, "_attributeDescription"));
            v8 = v23 + v25;
            ++v21;
          }
          while (v8 < range);
        }
        self = v34;
        v18 = v35 + 1;
        v8 = range;
      }
      while (range < v33);
    }
  }
  else
  {
LABEL_26:
    objc_msgSend(v7, "appendFormat:", CFSTR("table %p not at location %lu"), self, a3);
  }
  return v7;
}

- (NSRect)rectForBlock:(NSTextTableBlock *)block layoutAtPoint:(NSPoint)startingPoint inRect:(NSRect)rect textContainer:(NSTextContainer *)textContainer characterRange:(NSRange)charRange
{
  NSUInteger location;
  double height;
  double width;
  double y;
  double v12;
  NSLayoutManager *v15;
  NSInteger v16;
  _BOOL8 v17;
  uint64_t v18;
  double v19;
  double v20;
  double *v21;
  double *v22;
  double v23;
  double v25;
  id v26;
  unint64_t v27;
  double v28;
  uint64_t i;
  uint64_t v30;
  double v31;
  double v32;
  double *v33;
  double *v34;
  double v35;
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
  double v48;
  double v49;
  double v50;
  NSTextContainer *v51;
  double v52;
  double v53;
  unint64_t j;
  uint64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double x;
  uint64_t v74;
  unint64_t v75;
  _QWORD v76[2];
  NSRect result;

  location = charRange.location;
  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v12 = startingPoint.y;
  v76[0] = 0;
  v76[1] = 0;
  v15 = -[NSTextContainer layoutManager](textContainer, "layoutManager", startingPoint.x);
  v75 = 0;
  v16 = -[NSTextTableBlock startingRow](block, "startingRow");
  v74 = 0;
  v17 = -[NSTextTable collapsesBorders](self, "collapsesBorders");
  v18 = -[NSTextTableBlock columnSpan](block, "columnSpan");
  v19 = 0.0;
  if (v17)
    v20 = 0.5;
  else
    v20 = 0.0;
  v21 = (double *)-[NSTextBlockLayoutHelper initWithTextTable:charIndex:text:layoutManager:containerWidth:collapseBorders:]((char *)[NSTextBlockLayoutHelper alloc], self, location, -[NSLayoutManager textStorage](v15, "textStorage"), v15, v17, width);
  v22 = v21;
  v23 = v21[20];
  if (v23 > width || v23 <= 0.0)
    v23 = width;
  v25 = v23 - (v21[14] + v21[15] + v21[16] + v21[17] + v21[18] + v21[19]);
  v26 = -[NSTextTable _rowArrayForBlock:atIndex:text:layoutManager:containerWidth:withRepetitions:collapseBorders:rowCharRange:indexInRow:startingRow:startingColumn:previousRowBlockHelper:](self, "_rowArrayForBlock:atIndex:text:layoutManager:containerWidth:withRepetitions:collapseBorders:rowCharRange:indexInRow:startingRow:startingColumn:previousRowBlockHelper:", block, location, -[NSLayoutManager textStorage](v15, "textStorage"), v15, 0, v17, v25, v76, &v75, 0, 0, &v74);
  v27 = objc_msgSend(v26, "count");
  v28 = 0.0;
  if (v27)
  {
    for (i = 0; i != v27; ++i)
    {
      v30 = objc_msgSend(v26, "objectAtIndex:", i);
      v31 = *(double *)(v30 + 160);
      if (v31 <= 0.0)
        v28 = v28 + (double)objc_msgSend(*(id *)(v30 + 8), "columnSpan");
      else
        v19 = v19
            + *(double *)(v30 + 192)
            + *(double *)(v30 + 184)
            + *(double *)(v30 + 176)
            + v31
            + *(double *)(v30 + 112)
            + *(double *)(v30 + 120)
            + *(double *)(v30 + 128);
    }
  }
  if (v75 >= v27)
  {
    v42 = width;
    v43 = x;
    goto LABEL_57;
  }
  v68 = height;
  v71 = v25;
  v72 = y;
  v32 = (double)v18;
  v33 = (double *)objc_msgSend(v26, "objectAtIndex:");
  v34 = v33;
  v35 = v33[14] + v33[15] + v33[16];
  v36 = v33[22] + v33[23] + v33[24];
  v37 = v33[20];
  if (v37 <= 0.0)
  {
    v39 = v20;
    if (v28 >= v32)
      v44 = v28;
    else
      v44 = v32;
    v41 = (v71 - v19) * v32 / v44;
LABEL_26:
    v38 = floor(v41);
    goto LABEL_27;
  }
  v38 = v36 + v35 + v37;
  v39 = v20;
  if (v19 > v71 + 0.001)
  {
    v40 = 1.0;
    if (v19 >= 1.0)
      v40 = v19;
    v41 = (v71 - v28) * v38 / v40;
    goto LABEL_26;
  }
LABEL_27:
  v45 = v33[17];
  v46 = v33[18];
  v47 = v38 - v35 - v36;
  if (v47 >= v32)
    v48 = v47;
  else
    v48 = v32;
  v66 = v33[19];
  v67 = v48;
  v49 = v39 + v22[14] + v22[15] + v22[16];
  v50 = v12 + v39 + v22[17] + v22[18] + v22[19];
  v69 = v39;
  v70 = v50;
  if (v74)
  {
    v51 = -[NSLayoutManager textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:](v15, "textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", *(_QWORD *)(v74 + 32), 0, 1);
    if (v12 > 0.0 && v51 == textContainer && !NSIsEmptyRect(*(NSRect *)(v74 + 80)))
      v50 = *(double *)(v74 + 88) + *(double *)(v74 + 104);
  }
  v52 = v45 + v46;
  v53 = x + v49;
  if (v75)
  {
    for (j = 0; j < v75; ++j)
    {
      v55 = objc_msgSend(v26, "objectAtIndex:", j);
      if (!NSIsEmptyRect(*(NSRect *)(v55 + 80)))
      {
        v56 = *(double *)(v55 + 96);
        if (v53 < *(double *)(v55 + 80) + v56)
          v53 = *(double *)(v55 + 80) + v56;
        if (objc_msgSend(*(id *)(v55 + 8), "startingRow") == v16)
          v50 = *(double *)(v55 + 88);
      }
    }
  }
  v57 = v72 + v68 + v69;
  v58 = v52 + v66;
  v43 = v35 + v53;
  if (v36 + v35 + v67 <= width + 0.001)
    v59 = v67;
  else
    v59 = width - v35 - v36;
  if (v59 >= 1.0)
    v42 = v59;
  else
    v42 = 1.0;
  v60 = x + width + v69;
  if (v36 + v42 + v43 > v60 + 0.001)
  {
    v43 = v60 - v36 - v42;
    if (v43 < x)
      v43 = floor(width * v35 / (v36 + v35 + v42));
  }
  y = v58 + v50;
  v61 = v57 - (v58 + v50);
  if (v61 >= 1.0)
    height = v61;
  else
    height = 1.0;
  if (*((_QWORD *)v34 + 2) == *((_QWORD *)v22 + 2))
    -[NSLayoutManager setLayoutRect:forTextBlock:glyphRange:](v15, "setLayoutRect:forTextBlock:glyphRange:", self, *((_QWORD *)v22 + 4), *((_QWORD *)v22 + 5), x + v49, v70, v71, v57 - v72);
LABEL_57:

  v62 = v43;
  v63 = y;
  v64 = v42;
  v65 = height;
  result.size.height = v65;
  result.size.width = v64;
  result.origin.y = v63;
  result.origin.x = v62;
  return result;
}

- (CGRect)_contentRectForCharRange:(_NSRange)a3 textContainer:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  NSUInteger v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  NSUInteger v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSRect v43;
  NSRect v44;
  NSRect v45;
  NSRect v46;
  CGRect result;
  NSRect v48;

  length = a3.length;
  location = a3.location;
  v9 = *MEMORY[0x1E0CB3438];
  v8 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  v11 = *(double *)(MEMORY[0x1E0CB3438] + 16);
  v10 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  v12 = (void *)objc_msgSend(a4, "layoutManager");
  v38 = (void *)objc_msgSend(v12, "textStorage");
  v13 = (void *)objc_msgSend((id)objc_msgSend(v38, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), location, 0), "textBlocks");
  v14 = objc_msgSend(v13, "count");
  if (v14)
  {
    v15 = v14;
    v35 = v12;
    v36 = a4;
    v37 = length;
    v16 = 1;
    do
    {
      v17 = v16 - 1;
      v18 = (void *)objc_msgSend(v13, "objectAtIndex:", v16 - 1, v35, v36);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((NSTextTable *)objc_msgSend(v18, "table") != self)
          v17 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v17 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        break;
    }
    while (v16++ < v15);
    if (v17 != 0x7FFFFFFFFFFFFFFFLL && location < location + v37)
    {
      v41 = 0;
      v42 = 0;
      v20 = location;
      v39 = 0;
      v40 = 0;
      do
      {
        v21 = (void *)objc_msgSend((id)objc_msgSend(v38, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSParagraphStyle"), v20, &v41, location, v37), "textBlocks");
        if (!v21)
          goto LABEL_21;
        v22 = v21;
        if (objc_msgSend(v21, "count") <= v17)
          goto LABEL_21;
        v23 = objc_msgSend(v22, "objectAtIndex:", v17);
        v24 = objc_msgSend(v35, "glyphRangeForCharacterRange:actualCharacterRange:", v20, 1, 0);
        objc_msgSend(v35, "boundsRectForTextBlock:atIndex:effectiveRange:", v23, v24, &v39);
        x = v43.origin.x;
        y = v43.origin.y;
        width = v43.size.width;
        height = v43.size.height;
        if (!NSIsEmptyRect(v43) && v40)
        {
          if ((id)objc_msgSend(v35, "textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", v24, 0, 1) == v36)
          {
            v44.origin.x = v9;
            v44.origin.y = v8;
            v44.size.width = v11;
            v44.size.height = v10;
            if (NSIsEmptyRect(v44))
            {
              v10 = height;
              v11 = width;
              v8 = y;
              v9 = x;
            }
            else
            {
              v45.origin.x = v9;
              v45.origin.y = v8;
              v45.size.width = v11;
              v45.size.height = v10;
              v48.origin.x = x;
              v48.origin.y = y;
              v48.size.width = width;
              v48.size.height = height;
              v46 = NSUnionRect(v45, v48);
              v9 = v46.origin.x;
              v8 = v46.origin.y;
              v11 = v46.size.width;
              v10 = v46.size.height;
            }
          }
          v29 = objc_msgSend(v35, "characterRangeForGlyphRange:actualGlyphRange:", v39, v40, 0);
          v20 = v29 + v30;
        }
        else
        {
LABEL_21:
          v20 = v42 + v41;
        }
      }
      while (v20 < location + v37);
    }
  }
  v31 = v9;
  v32 = v8;
  v33 = v11;
  v34 = v10;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (NSRect)boundsRectForBlock:(NSTextTableBlock *)block contentRect:(NSRect)contentRect inRect:(NSRect)rect textContainer:(NSTextContainer *)textContainer characterRange:(NSRange)charRange
{
  NSUInteger location;
  double width;
  double height;
  double v10;
  double y;
  double x;
  NSLayoutManager *v15;
  NSInteger v16;
  NSInteger v17;
  NSTextBlockVerticalAlignment v18;
  _BOOL8 v19;
  char *v20;
  char *v21;
  double v22;
  double v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  unint64_t v31;
  double v32;
  double v33;
  double v34;
  NSInteger v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  NSLayoutManager *v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  BOOL v50;
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
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  NSTextTable *v67;
  char *v68;
  unint64_t v69;
  _QWORD v70[3];
  NSRect v71;
  NSRect v72;
  NSRect result;
  NSRect v74;

  location = charRange.location;
  width = rect.size.width;
  height = contentRect.size.height;
  v10 = contentRect.size.width;
  y = contentRect.origin.y;
  x = contentRect.origin.x;
  v15 = -[NSTextContainer layoutManager](textContainer, "layoutManager", contentRect.origin.x, contentRect.origin.y, contentRect.size.width, contentRect.size.height, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  v70[0] = 0;
  v70[1] = 0;
  v69 = 0;
  v16 = -[NSTextTableBlock startingRow](block, "startingRow");
  v17 = -[NSTextTableBlock rowSpan](block, "rowSpan");
  v18 = -[NSTextBlock verticalAlignment](block, "verticalAlignment");
  v19 = -[NSTextTable collapsesBorders](self, "collapsesBorders");
  v20 = -[NSTextBlockLayoutHelper initWithTextTable:charIndex:text:layoutManager:containerWidth:collapseBorders:]((char *)[NSTextBlockLayoutHelper alloc], self, location, -[NSLayoutManager textStorage](v15, "textStorage"), v15, v19, width);
  v21 = v20;
  v22 = *((double *)v20 + 20);
  if (v22 <= width && v22 > 0.0)
    v24 = *((double *)v20 + 20);
  else
    v24 = width;
  v25 = -[NSTextTable _rowArrayForBlock:atIndex:text:layoutManager:containerWidth:withRepetitions:collapseBorders:rowCharRange:indexInRow:startingRow:startingColumn:previousRowBlockHelper:](self, "_rowArrayForBlock:atIndex:text:layoutManager:containerWidth:withRepetitions:collapseBorders:rowCharRange:indexInRow:startingRow:startingColumn:previousRowBlockHelper:", block, location, -[NSLayoutManager textStorage](v15, "textStorage"), v15, 0, v19, v24, v70, &v69, 0, 0, 0);
  v26 = objc_msgSend(v25, "count");
  if (v69 >= v26)
    goto LABEL_38;
  v27 = v26;
  v67 = self;
  v68 = v21;
  v28 = objc_msgSend(v25, "objectAtIndex:");
  v29 = v28;
  v30 = *(double *)(v28 + 168) - height;
  if (v30 <= 0.0)
    goto LABEL_13;
  height = height + v30;
  if (v18 == NSTextBlockBottomAlignment)
    goto LABEL_12;
  if (v18 == NSTextBlockMiddleAlignment)
  {
    v30 = v30 * 0.5;
LABEL_12:
    _moveLinesInLayoutManager(v15, *(_QWORD *)(v28 + 32), *(_QWORD *)(v28 + 40), 0, v30);
  }
LABEL_13:
  v31 = 0;
  v32 = *(double *)(v29 + 112) + *(double *)(v29 + 120) + *(double *)(v29 + 128);
  v33 = *(double *)(v29 + 136) + *(double *)(v29 + 144) + *(double *)(v29 + 152);
  y = y - v33;
  v34 = v32 + *(double *)(v29 + 192) + *(double *)(v29 + 184) + *(double *)(v29 + 176);
  v35 = v17 + v16;
  height = height + v33 + *(double *)(v29 + 216) + *(double *)(v29 + 208) + *(double *)(v29 + 200);
  do
  {
    v36 = objc_msgSend(v25, "objectAtIndex:", v31);
    v37 = objc_msgSend(*(id *)(v36 + 8), "startingRow");
    if (objc_msgSend(*(id *)(v36 + 8), "rowSpan") + v37 != v35 || v31 >= v69 && (v31 <= v69 || v37 >= v16))
      goto LABEL_31;
    v38 = objc_msgSend(*(id *)(v36 + 8), "verticalAlignment");
    v39 = *(double *)(v36 + 88) + *(double *)(v36 + 104) - (y + height);
    if (v39 <= 0.0)
    {
      if (v39 >= 0.0)
        goto LABEL_31;
      if (v38 == 2)
      {
        v44 = -v39;
      }
      else
      {
        if (v38 != 1)
        {
LABEL_30:
          v45 = *(double *)(v36 + 96);
          *(double *)(v36 + 104) = *(double *)(v36 + 104) - v39;
          -[NSLayoutManager setBoundsRect:forTextBlock:glyphRange:](v15, "setBoundsRect:forTextBlock:glyphRange:", *(_QWORD *)(v36 + 8), *(_QWORD *)(v36 + 32), *(_QWORD *)(v36 + 40), *(double *)(v36 + 80), *(double *)(v36 + 88), v45);
          goto LABEL_31;
        }
        v44 = v39 * -0.5;
      }
      _moveLinesInLayoutManager(v15, *(_QWORD *)(v36 + 32), *(_QWORD *)(v36 + 40), 1, v44);
      goto LABEL_30;
    }
    height = height + v39;
    if (v18 == NSTextBlockBottomAlignment)
    {
      v41 = *(_QWORD *)(v29 + 32);
      v42 = *(_QWORD *)(v29 + 40);
      v43 = v15;
      v40 = v39;
    }
    else
    {
      if (v18 != NSTextBlockMiddleAlignment)
        goto LABEL_31;
      v40 = v39 * 0.5;
      v41 = *(_QWORD *)(v29 + 32);
      v42 = *(_QWORD *)(v29 + 40);
      v43 = v15;
    }
    _moveLinesInLayoutManager(v43, v41, v42, 0, v40);
LABEL_31:
    ++v31;
  }
  while (v27 != v31);
  x = x - v32;
  v10 = v10 + v34;
  v21 = v68;
  if (*(_QWORD *)(v29 + 24) + *(_QWORD *)(v29 + 16) == *((_QWORD *)v68 + 3) + *((_QWORD *)v68 + 2))
  {
    -[NSTextTable _contentRectForCharRange:textContainer:](v67, "_contentRectForCharRange:textContainer:");
    v46 = v71.origin.x;
    v47 = v71.origin.y;
    v48 = v71.size.width;
    v49 = v71.size.height;
    v50 = NSIsEmptyRect(v71);
    v65 = x;
    v66 = v10;
    v51 = y;
    v52 = height;
    if (!v50)
    {
      v72.origin.x = v46;
      v72.origin.y = v47;
      v72.size.width = v48;
      v72.size.height = v49;
      v74.origin.x = x;
      v74.size.width = v10;
      v74.origin.y = y;
      v74.size.height = height;
      *(NSRect *)(&v51 - 1) = NSUnionRect(v72, v74);
      x = v53;
      v10 = v54;
    }
    v55 = x;
    v56 = v51;
    v57 = v10;
    v58 = v52;
    if (!NSIsEmptyRect(*(NSRect *)(&v51 - 1)))
    {
      v59 = *((double *)v68 + 14) + *((double *)v68 + 15) + *((double *)v68 + 16);
      v60 = *((double *)v68 + 17) + *((double *)v68 + 18) + *((double *)v68 + 19);
      -[NSLayoutManager setBoundsRect:forTextBlock:glyphRange:](v15, "setBoundsRect:forTextBlock:glyphRange:", v67, *((_QWORD *)v68 + 4), *((_QWORD *)v68 + 5), x - v59, v56 - v60, v10 + v59 + *((double *)v68 + 24) + *((double *)v68 + 23) + *((double *)v68 + 22), v58 + v60 + *((double *)v68 + 27) + *((double *)v68 + 26) + *((double *)v68 + 25));
    }
    x = v65;
    v10 = v66;
  }
LABEL_38:

  v61 = x;
  v62 = y;
  v63 = v10;
  v64 = height;
  result.size.height = v64;
  result.size.width = v63;
  result.origin.y = v62;
  result.origin.x = v61;
  return result;
}

- (BOOL)_missingColumnsForRowRange:(_NSRange)a3 blockIndex:(unint64_t)a4 text:(id)a5
{
  NSUInteger v6;
  NSUInteger length;
  NSUInteger location;
  unint64_t v11;
  void *v12;
  NSUInteger v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;

  v6 = a3.location + a3.length;
  if (a3.location >= a3.location + a3.length)
  {
    v11 = 0;
  }
  else
  {
    length = a3.length;
    location = a3.location;
    v11 = 0;
    v12 = 0;
    v17 = 0;
    v18 = 0;
    v13 = a3.location;
    do
    {
      v14 = v12;
      v15 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSParagraphStyle"), v13, &v17, location, length), "textBlocks"), "objectAtIndex:", a4);
      v12 = v15;
      if (v15 != v14)
        v11 += objc_msgSend(v15, "columnSpan");
      v13 = v18 + v17;
    }
    while (v18 + v17 < v6);
  }
  return v11 < self->_numCols;
}

- (void)drawBackgroundForBlock:(NSTextTableBlock *)block withFrame:(NSRect)frameRect inView:(NSView *)controlView characterRange:(NSRange)charRange layoutManager:(NSLayoutManager *)layoutManager
{
  double height;
  double width;
  double y;
  double x;
  NSTextStorage *v14;
  void *v15;
  double v16;
  double v17;
  NSTextBlockValueType v18;
  int v19;
  _BOOL4 v20;
  NSUInteger v21;
  NSUInteger v22;
  unsigned int v23;
  double v25;
  NSTextBlockLayoutHelper *v26;
  NSUInteger v27;
  uint64_t v28;
  double *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  unint64_t v40;
  NSInteger v41;
  NSInteger v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  unint64_t v52;
  uint64_t v53;
  BOOL v54;
  uint64_t v55;
  NSUInteger v56;
  NSUInteger v57;
  NSUInteger v58;
  BOOL v59;
  uint64_t v60;
  NSUInteger v61;
  NSUInteger v62;
  int v63;
  double v64;
  NSUInteger v65;
  NSUInteger v66;
  NSUInteger v67;
  NSUInteger v68;
  NSUInteger v69;
  NSRange v70;
  NSRange v71;
  void *v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSInteger v78;
  _BOOL4 v79;
  _BOOL4 v80;
  _BOOL4 v81;
  NSInteger v82;
  BOOL v83;
  char v84;
  int v85;
  int v86;
  int v87;
  BOOL v88;
  BOOL v89;
  NSTextBlockLayoutHelper *v90;
  uint64_t v91;
  char *v92;
  double *v93;
  unint64_t v94;
  unint64_t v95;
  unsigned int v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  size_t v110;
  double v111;
  CGRect *v112;
  double v113;
  double v114;
  CGRect *v115;
  double v116;
  CGRect *v117;
  CGFloat v118;
  CGFloat v119;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  CGFloat v128;
  double v129;
  double v130;
  NSTextStorage *v131;
  NSInteger v132;
  uint64_t v133;
  NSInteger v134;
  uint64_t v135;
  unint64_t v136;
  NSUInteger range2;
  char range2a;
  NSInteger v139;
  NSInteger v140;
  _BOOL4 v141;
  CGContext *c;
  unint64_t v143;
  uint64_t v144;
  NSColor *v145;
  NSColor *v146;
  NSColor *v147;
  NSColor *v148;
  NSColor *v149;
  NSColor *v150;
  NSLayoutManager *v151;
  NSUInteger length;
  NSUInteger location;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  CGRect rects[4];
  uint64_t v167;
  NSRange v168;
  NSRange v169;
  NSRange v170;
  NSRange v171;
  CGRect v172;

  length = charRange.length;
  location = charRange.location;
  height = frameRect.size.height;
  width = frameRect.size.width;
  y = frameRect.origin.y;
  x = frameRect.origin.x;
  v167 = *MEMORY[0x1E0C80C00];
  *(CGFloat *)&v164 = frameRect.origin.x;
  *((_QWORD *)&v164 + 1) = *(_QWORD *)&frameRect.origin.y;
  *(CGFloat *)&v165 = frameRect.size.width;
  *((_QWORD *)&v165 + 1) = *(_QWORD *)&frameRect.size.height;
  c = (CGContext *)objc_msgSend((id)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass", block, controlView), "graphicsContextForApplicationFrameworkContext:", -[NSLayoutManager applicationFrameworkContext](layoutManager, "applicationFrameworkContext")), "CGContext");
  v151 = layoutManager;
  v14 = -[NSLayoutManager textStorage](layoutManager, "textStorage");
  v15 = (void *)-[NSTextStorage string](v14, "string");
  -[NSTextBlock contentWidth](self, "contentWidth");
  v17 = v16;
  v18 = -[NSTextBlock contentWidthValueType](self, "contentWidthValueType");
  v145 = -[NSTextBlock backgroundColor](self, "backgroundColor");
  v146 = -[NSTextBlock backgroundColor](block, "backgroundColor");
  v147 = -[NSTextBlock borderColorForEdge:](block, "borderColorForEdge:", 0);
  v148 = -[NSTextBlock borderColorForEdge:](block, "borderColorForEdge:", 1);
  v149 = -[NSTextBlock borderColorForEdge:](block, "borderColorForEdge:", 2);
  v150 = -[NSTextBlock borderColorForEdge:](block, "borderColorForEdge:", 3);
  v162 = v164;
  v163 = v165;
  v160 = v164;
  v161 = v165;
  v158 = v164;
  v159 = v165;
  v156 = v164;
  v157 = v165;
  v154 = v164;
  v155 = v165;
  v19 = -[NSTextTable collapsesBorders](self, "collapsesBorders");
  v20 = -[NSTextTable hidesEmptyCells](self, "hidesEmptyCells");
  v143 = -[NSTextStorage length](v14, "length");
  v141 = v20;
  if (v20)
  {
    if (location <= location + length)
      v21 = location + length;
    else
      v21 = location;
    if (location >= location + length)
      return;
    v22 = location;
    while (1)
    {
      v23 = objc_msgSend(v15, "characterAtIndex:", v22);
      if (v23 > 0x20 || ((1 << v23) & 0x100002400) == 0)
        break;
      if (v21 == ++v22)
        return;
    }
  }
  if (v17 < 0.0 || v18 == NSTextBlockPercentageValueType)
    v25 = 0.0;
  else
    v25 = v17;
  v26 = [NSTextBlockLayoutHelper alloc];
  -[NSLayoutManager textStorage](layoutManager, "textStorage");
  v27 = location;
  v29 = (double *)-[NSTextBlockLayoutHelper initWithTextBlock:charRange:text:layoutManager:containerWidth:collapseBorders:]((char *)v26, block, location, length, v25, v28, layoutManager, v19);
  v31 = v29[14];
  v30 = v29[15];
  v32 = v31 + v30;
  v33 = v29[17];
  v34 = v29[18];
  *(double *)&v162 = *(double *)&v162 + v31 + v30;
  *((double *)&v162 + 1) = *((double *)&v162 + 1) + v33 + v34;
  v35 = v29[23];
  v36 = v29[24];
  v37 = v29[26];
  v38 = v29[27];
  *(double *)&v163 = *(double *)&v163 - (v31 + v30 + v36 + v35);
  *((double *)&v163 + 1) = *((double *)&v163 + 1) - (v33 + v34 + v38 + v37);
  if ((v19 & 1) != 0)
  {
    v39 = (void *)objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](v14, "attribute:atIndex:effectiveRange:"), "textBlocks");
    v40 = objc_msgSend(v39, "count");
    v140 = -[NSTextTableBlock startingRow](block, "startingRow");
    v139 = -[NSTextTableBlock startingColumn](block, "startingColumn");
    v41 = -[NSTextTableBlock rowSpan](block, "rowSpan");
    v42 = -[NSTextTableBlock columnSpan](block, "columnSpan");
    v43 = v29[10];
    v44 = v29[11];
    v45 = v29[15];
    v46 = x - v45;
    v47 = width + v45 + v29[23];
    v48 = v29[18];
    v49 = y - v48;
    v50 = height + v48 + v29[26];
    *(double *)&v154 = v46;
    *((double *)&v154 + 1) = y - v48;
    *(double *)&v155 = v47;
    *((double *)&v155 + 1) = v50;
    v156 = v154;
    v157 = v155;
    v158 = v154;
    v159 = v155;
    v160 = v154;
    v161 = v155;
    if (!v40)
      goto LABEL_35;
    v132 = v42;
    v134 = v41;
    v130 = x - v43;
    v51 = y - v44;
    v52 = 1;
    do
    {
      v53 = v52 - 1;
      if ((NSTextTable *)objc_msgSend((id)objc_msgSend(v39, "objectAtIndex:", v52 - 1), "table") != self)
        v53 = 0x7FFFFFFFFFFFFFFFLL;
      v54 = v53 != 0x7FFFFFFFFFFFFFFFLL || v52++ >= v40;
    }
    while (!v54);
    if (v53 == 0x7FFFFFFFFFFFFFFFLL
      || (v55 = -[NSAttributedString _rangeOfTextTableRow:atIndex:](v14, "_rangeOfTextTableRow:atIndex:", self, location), !v56))
    {
LABEL_35:
      range2a = 0;
LABEL_36:
      v31 = v29[14];
      v30 = v29[15] + v29[15];
      v29[15] = v30;
      v33 = v29[17];
      v34 = v29[18] + v29[18];
      v29[18] = v34;
      v36 = v29[24];
      v35 = v29[23] + v29[23];
      v29[23] = v35;
      v38 = v29[27];
      v37 = v29[26] + v29[26];
      v29[26] = v37;
      v63 = range2a & 1;
      v32 = v31 + v30;
      goto LABEL_37;
    }
    v57 = v55;
    v58 = v56;
    v59 = -[NSTextTable _missingColumnsForRowRange:blockIndex:text:](self, "_missingColumnsForRowRange:blockIndex:text:", v55, v56, v53, v14);
    v60 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v59
      && v57
      && (v60 = -[NSAttributedString _rangeOfTextTableRow:atIndex:](v14, "_rangeOfTextTableRow:atIndex:", self, v57 - 1),
          v61))
    {
      range2 = v60;
      v62 = v61;
      if (-[NSTextTable _missingColumnsForRowRange:blockIndex:text:](self, "_missingColumnsForRowRange:blockIndex:text:"))
      {
        goto LABEL_57;
      }
    }
    else
    {
      range2 = v60;
      if (v59)
        goto LABEL_57;
      v62 = 0;
    }
    if (v57 + v58 >= v143)
    {
      v69 = 0;
      v68 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_64:
      if (v62)
      {
        v168.location = v57;
        v168.length = v58;
        v170.location = range2;
        v170.length = v62;
        v70 = NSUnionRange(v168, v170);
        v57 = v70.location;
        v58 = v70.length;
      }
      if (!v69)
        goto LABEL_69;
      v169.location = v57;
      v169.length = v58;
      v171.location = v68;
      v171.length = v69;
      v71 = NSUnionRange(v169, v171);
      v66 = v71.length;
      v65 = v71.location;
LABEL_68:
      v57 = v65;
      v58 = v66;
LABEL_69:
      if (v58)
      {
        v136 = v58 + v57;
        if (v57 < v58 + v57)
        {
          range2a = 0;
          v135 = v134 + v140;
          v133 = v132 + v139;
          v120 = *(double *)(MEMORY[0x1E0C9D648] + 8);
          v121 = *MEMORY[0x1E0C9D648];
          v118 = *(double *)(MEMORY[0x1E0C9D648] + 24);
          v119 = *(double *)(MEMORY[0x1E0C9D648] + 16);
          v126 = v25;
          v127 = v47;
          v124 = v49 + v50;
          v125 = v51;
          v131 = v14;
          v122 = v50;
          v123 = v46 + v47;
          v128 = v49;
          v129 = v46;
          while (1)
          {
            v72 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](v14, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v57, 0), "textBlocks"), "objectAtIndex:", v53);
            v73 = -[NSAttributedString rangeOfTextBlock:atIndex:](v14, "rangeOfTextBlock:atIndex:", v72, v57);
            v144 = v74;
            v75 = objc_msgSend(v72, "startingRow");
            v76 = objc_msgSend(v72, "startingColumn");
            v77 = objc_msgSend(v72, "rowSpan");
            v78 = objc_msgSend(v72, "columnSpan") + v76;
            v79 = v76 != v133;
            if (v75 > v135)
              v79 = 1;
            v80 = v75 != v135;
            v81 = v78 != v139;
            if (v75 > v135)
              v81 = 1;
            v82 = v77 + v75;
            if (v76 > v133)
              v80 = 1;
            v83 = v82 != v140;
            if (v76 > v133)
              v83 = 1;
            v84 = v78 < v139 || v83;
            v85 = v78 < v139 || v80;
            v86 = v82 < v140 || v81;
            v87 = v82 < v140 || v79;
            v88 = v86 != 1 || v85 == 0;
            v89 = v88 || v87 == 0;
            if (v89 || (v84 & 1) == 0)
              break;
            v27 = location;
LABEL_140:
            v57 = v73 + v144;
            v54 = v73 + v144 >= v136;
            v14 = v131;
            if (v54)
              goto LABEL_36;
          }
          v90 = [NSTextBlockLayoutHelper alloc];
          v92 = -[NSTextBlockLayoutHelper initWithTextBlock:charRange:text:layoutManager:containerWidth:collapseBorders:]((char *)v90, v72, v73, v144, v25, v91, v151, 1);
          v93 = (double *)v92;
          if (((v86 & 1) != 0 || *((double *)v92 + 23) <= v29[15] || !objc_msgSend(v72, "borderColorForEdge:", 2))
            && ((v84 & 1) != 0 || v93[26] <= v29[18] || !objc_msgSend(v72, "borderColorForEdge:", 3))
            && ((v87 & 1) != 0 || v93[15] <= v29[23] || !objc_msgSend(v72, "borderColorForEdge:", 0))
            && ((v85 & 1) != 0 || v93[18] <= v29[26] || !objc_msgSend(v72, "borderColorForEdge:", 1)))
          {
            v27 = location;
LABEL_139:

            goto LABEL_140;
          }
          v27 = location;
          if (v141)
          {
            if (v73 <= v73 + v144)
              v94 = v73 + v144;
            else
              v94 = v73;
            if (v73 >= v73 + v144)
              goto LABEL_139;
            v95 = v73;
            while (1)
            {
              v96 = objc_msgSend(v15, "characterAtIndex:", v95);
              if (v96 > 0x20 || ((1 << v96) & 0x100002400) == 0)
                break;
              if (v94 == ++v95)
                goto LABEL_139;
            }
          }
          v98 = v93[10];
          v97 = v93[11];
          v100 = v93[12];
          v99 = v93[13];
          v101 = v93[15];
          v102 = v93[18];
          v103 = v93[23];
          v104 = v93[26];
          if ((range2a & 1) == 0)
          {
            v105 = v93[13];
            v106 = v93[18];
            v107 = v93[26];
            v108 = v93[11];
            CGContextSaveGState(c);
            v97 = v108;
            v104 = v107;
            v102 = v106;
            v99 = v105;
          }
          v109 = v98 + v130 - v101;
          if (v109 <= v129)
          {
            v110 = 0;
            v50 = v122;
          }
          else
          {
            rects[0].origin.x = v129;
            rects[0].origin.y = v128;
            rects[0].size.width = v109 - v129;
            v50 = v122;
            rects[0].size.height = v122;
            v110 = 1;
          }
          v111 = v109 + v100 + v101 + v103;
          if (v111 >= v123)
          {
            v25 = v126;
            v47 = v127;
            v113 = v125;
            v49 = v128;
          }
          else
          {
            v112 = &rects[v110];
            v47 = v127;
            v49 = v128;
            v112->origin.x = v111;
            v112->origin.y = v128;
            ++v110;
            v112->size.width = v123 - v111;
            v112->size.height = v50;
            v113 = v125;
            v25 = v126;
          }
          v46 = v129;
          v114 = v97 + v113 - v102;
          if (v114 > v49)
          {
            v115 = &rects[v110];
            v115->origin.x = v129;
            v115->origin.y = v49;
            ++v110;
            v115->size.width = v47;
            v115->size.height = v114 - v49;
          }
          v116 = v114 + v99 + v102 + v104;
          if (v116 >= v124)
          {
            if (!v110)
            {
              v172.origin.y = v120;
              v172.origin.x = v121;
              v172.size.height = v118;
              v172.size.width = v119;
              CGContextClipToRect(c, v172);
              goto LABEL_138;
            }
          }
          else
          {
            v117 = &rects[v110];
            v117->origin.x = v129;
            v117->origin.y = v116;
            ++v110;
            v117->size.width = v47;
            v117->size.height = v124 - v116;
          }
          CGContextClipToRects(c, rects, v110);
LABEL_138:
          range2a = 1;
          goto LABEL_139;
        }
      }
      range2a = 0;
      v27 = location;
      goto LABEL_36;
    }
    v68 = -[NSAttributedString _rangeOfTextTableRow:atIndex:](v14, "_rangeOfTextTableRow:atIndex:", self);
    v69 = v67;
    if (!v67
      || !-[NSTextTable _missingColumnsForRowRange:blockIndex:text:](self, "_missingColumnsForRowRange:blockIndex:text:", v68, v67, v53, v14))
    {
      goto LABEL_64;
    }
LABEL_57:
    v65 = -[NSAttributedString rangeOfTextTable:atIndex:](v14, "rangeOfTextTable:atIndex:", self, location);
    goto LABEL_68;
  }
  v63 = 0;
  v49 = *((double *)&v154 + 1);
  v46 = *(double *)&v154;
  v50 = *((double *)&v155 + 1);
  v47 = *(double *)&v155;
LABEL_37:
  *(double *)&v160 = v31 + *(double *)&v160;
  *((double *)&v160 + 1) = v33 + *((double *)&v160 + 1);
  *(double *)&v161 = v30;
  *((double *)&v161 + 1) = *((double *)&v161 + 1) - (v33 + v38);
  v64 = v32 + v35 + v36;
  *(double *)&v158 = v32 + *(double *)&v158;
  *((double *)&v158 + 1) = v33 + *((double *)&v158 + 1);
  *(double *)&v159 = *(double *)&v159 - v64;
  *((double *)&v159 + 1) = v34;
  *(double *)&v156 = *(double *)&v156 + *(double *)&v157 - v36 - v35;
  *((double *)&v156 + 1) = v33 + *((double *)&v156 + 1);
  *(double *)&v157 = v35;
  *((double *)&v157 + 1) = *((double *)&v157 + 1) - (v33 + v38);
  *(double *)&v154 = v32 + v46;
  *((double *)&v154 + 1) = v49 + v50 - v38 - v37;
  *(double *)&v155 = v47 - v64;
  *((double *)&v155 + 1) = v37;
  if (v145)
  {
    -[NSColor set](v145, "set");
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](v151, "fillBackgroundRectArray:count:forCharacterRange:color:", &v164, 1, v27, length, v145);
  }
  if (v146)
  {
    -[NSColor set](v146, "set");
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](v151, "fillBackgroundRectArray:count:forCharacterRange:color:", &v162, 1, v27, length, v146);
  }
  if (v29[15] > 0.0 && v147)
  {
    -[NSColor set](v147, "set");
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](v151, "fillBackgroundRectArray:count:forCharacterRange:color:", &v160, 1, v27, length, v147);
  }
  if (v29[18] > 0.0 && v148)
  {
    -[NSColor set](v148, "set");
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](v151, "fillBackgroundRectArray:count:forCharacterRange:color:", &v158, 1, v27, length, v148);
  }
  if (v29[23] > 0.0 && v149)
  {
    -[NSColor set](v149, "set");
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](v151, "fillBackgroundRectArray:count:forCharacterRange:color:", &v156, 1, v27, length, v149);
  }
  if (v29[26] > 0.0 && v150)
  {
    -[NSColor set](v150, "set");
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](v151, "fillBackgroundRectArray:count:forCharacterRange:color:", &v154, 1, v27, length, v150);
  }

  if (v63)
    CGContextRestoreGState(c);
}

@end
