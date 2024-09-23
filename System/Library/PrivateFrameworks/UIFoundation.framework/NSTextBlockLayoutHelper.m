@implementation NSTextBlockLayoutHelper

- (char)initWithTextBlock:(uint64_t)a3 charRange:(uint64_t)a4 glyphRange:(uint64_t)a5 layoutRect:(uint64_t)a6 boundsRect:(int)a7 containerWidth:(int)a8 allowMargins:(double)a9 collapseBorders:(double)a10 allowPadding:(double)a11
{
  char *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  uint64_t v87;
  double v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v92;
  double v93;
  objc_super v95;

  if (!a1)
    return 0;
  v95.receiver = a1;
  v95.super_class = (Class)NSTextBlockLayoutHelper;
  v33 = (char *)objc_msgSendSuper2(&v95, sel_init);
  v34 = a2;
  *((_QWORD *)v33 + 1) = v34;
  *((_QWORD *)v33 + 2) = a3;
  *((_QWORD *)v33 + 3) = a4;
  *((_QWORD *)v33 + 4) = a5;
  *((_QWORD *)v33 + 5) = a6;
  *((double *)v33 + 6) = a9;
  *((double *)v33 + 7) = a10;
  *((double *)v33 + 8) = a11;
  *((double *)v33 + 9) = a12;
  *((double *)v33 + 10) = a13;
  *((double *)v33 + 11) = a14;
  v35 = 0;
  *((double *)v33 + 12) = a15;
  *((double *)v33 + 13) = a16;
  if (a7)
  {
    objc_msgSend(v34, "widthForLayer:edge:", 1, 0);
    v34 = (id)*((_QWORD *)v33 + 1);
  }
  else
  {
    v36 = 0;
  }
  *((_QWORD *)v33 + 14) = v36;
  objc_msgSend(v34, "widthForLayer:edge:", 0, 0);
  *((_QWORD *)v33 + 15) = v37;
  if (a18)
  {
    objc_msgSend(*((id *)v33 + 1), "widthForLayer:edge:", -1, 0);
    v35 = v38;
  }
  *((_QWORD *)v33 + 16) = v35;
  v39 = 0;
  v40 = 0;
  if (a7)
    objc_msgSend(*((id *)v33 + 1), "widthForLayer:edge:", 1, 1, 0.0);
  *((_QWORD *)v33 + 17) = v40;
  objc_msgSend(*((id *)v33 + 1), "widthForLayer:edge:", 0, 1);
  *((_QWORD *)v33 + 18) = v41;
  if (a18)
  {
    objc_msgSend(*((id *)v33 + 1), "widthForLayer:edge:", -1, 1);
    v39 = v42;
  }
  *((_QWORD *)v33 + 19) = v39;
  objc_msgSend(*((id *)v33 + 1), "valueForDimension:", 0);
  *((_QWORD *)v33 + 20) = v43;
  objc_msgSend(*((id *)v33 + 1), "valueForDimension:", 4);
  *((_QWORD *)v33 + 21) = v44;
  v45 = 0;
  v46 = 0;
  if (a18)
    objc_msgSend(*((id *)v33 + 1), "widthForLayer:edge:", -1, 2, 0.0);
  *((_QWORD *)v33 + 22) = v46;
  objc_msgSend(*((id *)v33 + 1), "widthForLayer:edge:", 0, 2);
  *((_QWORD *)v33 + 23) = v47;
  if (a7)
  {
    objc_msgSend(*((id *)v33 + 1), "widthForLayer:edge:", 1, 2);
    v45 = v48;
  }
  *((_QWORD *)v33 + 24) = v45;
  v49 = 0.0;
  v50 = 0;
  if (a18)
    objc_msgSend(*((id *)v33 + 1), "widthForLayer:edge:", -1, 3, 0.0);
  *((_QWORD *)v33 + 25) = v50;
  objc_msgSend(*((id *)v33 + 1), "widthForLayer:edge:", 0, 3);
  *((_QWORD *)v33 + 26) = v51;
  if (a7)
  {
    objc_msgSend(*((id *)v33 + 1), "widthForLayer:edge:", 1, 3);
    v49 = v52;
  }
  *((double *)v33 + 27) = v49;
  if (*((double *)v33 + 14) < 0.0)
    *((_QWORD *)v33 + 14) = 0;
  if (*((double *)v33 + 15) < 0.0)
    *((_QWORD *)v33 + 15) = 0;
  if (*((double *)v33 + 16) < 0.0)
    *((_QWORD *)v33 + 16) = 0;
  if (*((double *)v33 + 17) < 0.0)
    *((_QWORD *)v33 + 17) = 0;
  if (*((double *)v33 + 18) < 0.0)
    *((_QWORD *)v33 + 18) = 0;
  if (*((double *)v33 + 19) < 0.0)
    *((_QWORD *)v33 + 19) = 0;
  if (*((double *)v33 + 20) < 0.0)
    *((_QWORD *)v33 + 20) = 0;
  if (*((double *)v33 + 21) < 0.0)
    *((_QWORD *)v33 + 21) = 0;
  if (*((double *)v33 + 22) < 0.0)
    *((_QWORD *)v33 + 22) = 0;
  if (*((double *)v33 + 23) < 0.0)
    *((_QWORD *)v33 + 23) = 0;
  if (*((double *)v33 + 24) < 0.0)
    *((_QWORD *)v33 + 24) = 0;
  if (*((double *)v33 + 25) < 0.0)
    *((_QWORD *)v33 + 25) = 0;
  if (*((double *)v33 + 26) < 0.0)
    *((_QWORD *)v33 + 26) = 0;
  v53 = a17;
  if (v49 < 0.0)
    *((_QWORD *)v33 + 27) = 0;
  if (a17 <= 0.0 && !NSIsEmptyRect(*(NSRect *)(v33 + 48)) && !NSIsEmptyRect(*(NSRect *)(v33 + 80)))
  {
    v54 = objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", 1, 0);
    v55 = *((double *)v33 + 14);
    v56 = v55 + 0.0;
    if (v54 == 1)
      v57 = v55 + 0.0;
    else
      v57 = 0.0;
    v58 = objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", 0, 0);
    v59 = *((double *)v33 + 15);
    if (v58 == 1)
      v60 = *((double *)v33 + 15);
    else
      v60 = -0.0;
    v61 = v57 + v60;
    v62 = objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", -1, 0);
    v63 = *((double *)v33 + 16);
    if (v62 == 1)
      v64 = *((double *)v33 + 16);
    else
      v64 = -0.0;
    v65 = v61 + v64;
    v66 = objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", -1, 2);
    v67 = *((double *)v33 + 22);
    if (v66 == 1)
      v68 = *((double *)v33 + 22);
    else
      v68 = -0.0;
    v69 = v65 + v68;
    v70 = objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", 0, 2);
    v71 = *((double *)v33 + 23);
    if (v70 == 1)
      v72 = *((double *)v33 + 23);
    else
      v72 = -0.0;
    v73 = v69 + v72;
    v74 = objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", 1, 2);
    v75 = *((double *)v33 + 24);
    if (v74 == 1)
      v76 = *((double *)v33 + 24);
    else
      v76 = -0.0;
    v77 = v73 + v76;
    if (v77 > 0.0)
    {
      if (v54 == 1)
        v78 = 0.0;
      else
        v78 = v56;
      if (v58 == 1)
        v79 = -0.0;
      else
        v79 = v59;
      v80 = v78 + v79;
      if (v62 == 1)
        v81 = -0.0;
      else
        v81 = v63;
      v82 = v80 + v81;
      if (v66 == 1)
        v83 = -0.0;
      else
        v83 = v67;
      v84 = v82 + v83;
      if (v70 == 1)
        v85 = -0.0;
      else
        v85 = v71;
      v86 = v84 + v85;
      if (v74 == 1)
        v75 = -0.0;
      v53 = (*((double *)v33 + 12) - *((double *)v33 + 8) - (v86 + v75)) * 100.0 / v77;
    }
    if (v53 < 0.0)
      v53 = 0.0;
  }
  if (objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", 1, 0) == 1)
    *((double *)v33 + 14) = v53 / 100.0 * *((double *)v33 + 14);
  if (objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", 0, 0) == 1)
    *((double *)v33 + 15) = v53 / 100.0 * *((double *)v33 + 15);
  if (objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", -1, 0) == 1)
    *((double *)v33 + 16) = v53 / 100.0 * *((double *)v33 + 16);
  if (objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", 1, 1) == 1)
    *((double *)v33 + 17) = v53 / 100.0 * *((double *)v33 + 17);
  if (objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", 0, 1) == 1)
    *((double *)v33 + 18) = v53 / 100.0 * *((double *)v33 + 18);
  if (objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", -1, 1) == 1)
    *((double *)v33 + 19) = v53 / 100.0 * *((double *)v33 + 19);
  if (objc_msgSend(*((id *)v33 + 1), "valueTypeForDimension:", 0) == 1)
    *((double *)v33 + 20) = v53 / 100.0 * *((double *)v33 + 20);
  if (objc_msgSend(*((id *)v33 + 1), "valueTypeForDimension:", 4) == 1)
    *((double *)v33 + 21) = v53 / 100.0 * *((double *)v33 + 21);
  if (objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", -1, 2) == 1)
    *((double *)v33 + 22) = v53 / 100.0 * *((double *)v33 + 22);
  if (objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", 0, 2) == 1)
    *((double *)v33 + 23) = v53 / 100.0 * *((double *)v33 + 23);
  if (objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", 1, 2) == 1)
    *((double *)v33 + 24) = v53 / 100.0 * *((double *)v33 + 24);
  if (objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", -1, 3) == 1)
    *((double *)v33 + 25) = v53 / 100.0 * *((double *)v33 + 25);
  if (objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", 0, 3) == 1)
    *((double *)v33 + 26) = v53 / 100.0 * *((double *)v33 + 26);
  v87 = objc_msgSend(*((id *)v33 + 1), "widthValueTypeForLayer:edge:", 1, 3);
  v88 = *((double *)v33 + 27);
  if (v87 == 1)
    v88 = v53 / 100.0 * v88;
  *((double *)v33 + 14) = ceil(*((double *)v33 + 14));
  v89 = vrndpq_f64(*(float64x2_t *)(v33 + 120));
  *(float64x2_t *)(v33 + 120) = v89;
  *((double *)v33 + 17) = ceil(*((double *)v33 + 17));
  v90 = vrndpq_f64(*((float64x2_t *)v33 + 9));
  v91 = vrndpq_f64(*((float64x2_t *)v33 + 10));
  *((float64x2_t *)v33 + 9) = v90;
  *((float64x2_t *)v33 + 10) = v91;
  *((double *)v33 + 22) = ceil(*((double *)v33 + 22));
  v92 = vrndpq_f64(*(float64x2_t *)(v33 + 184));
  *(float64x2_t *)(v33 + 184) = v92;
  v93 = ceil(*((double *)v33 + 26));
  *((double *)v33 + 25) = ceil(*((double *)v33 + 25));
  *((double *)v33 + 26) = v93;
  *((double *)v33 + 27) = ceil(v88);
  if (a8)
  {
    *((double *)v33 + 15) = 0.5 * v89.f64[0];
    *((double *)v33 + 18) = 0.5 * v90.f64[0];
    *((double *)v33 + 23) = 0.5 * v92.f64[0];
    *((double *)v33 + 26) = v93 * 0.5;
  }
  return v33;
}

- (char)initWithTextBlock:(uint64_t)a3 charRange:(uint64_t)a4 text:(double)a5 layoutManager:(uint64_t)a6 containerWidth:(void *)a7 collapseBorders:(int)a8
{
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;

  if (result)
  {
    v14 = result;
    if (a7)
    {
      v15 = objc_msgSend(a7, "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
      v17 = v16;
      objc_msgSend(a7, "layoutRectForTextBlock:atIndex:effectiveRange:", a2, v15, 0);
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      objc_msgSend(a7, "boundsRectForTextBlock:atIndex:effectiveRange:", a2, v15, 0);
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;
    }
    else
    {
      v31 = *(double *)(MEMORY[0x1E0CB3438] + 16);
      v33 = *(double *)(MEMORY[0x1E0CB3438] + 24);
      v25 = v33;
      v23 = v31;
      v27 = *MEMORY[0x1E0CB3438];
      v29 = *(double *)(MEMORY[0x1E0CB3438] + 8);
      v21 = v29;
      v19 = *MEMORY[0x1E0CB3438];
      v17 = a4;
      v15 = a3;
    }
    return -[NSTextBlockLayoutHelper initWithTextBlock:charRange:glyphRange:layoutRect:boundsRect:containerWidth:allowMargins:collapseBorders:allowPadding:](v14, a2, a3, a4, v15, v17, a8 ^ 1u, a8, v19, v21, v23, v25, v27, v29, v31, v33, a5, 1);
  }
  return result;
}

- (char)initWithTextBlock:(uint64_t)a3 charIndex:(void *)a4 text:(void *)a5 layoutManager:(int)a6 containerWidth:(double)a7 collapseBorders:
{
  char *v12;
  uint64_t v13;
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
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v38;

  if (result)
  {
    v12 = result;
    v38 = xmmword_18D6CBB80;
    if (a5)
    {
      v13 = objc_msgSend(a5, "glyphRangeForCharacterRange:actualCharacterRange:", a3, 1, 0);
      objc_msgSend(a5, "layoutRectForTextBlock:atIndex:effectiveRange:", a2, v13, &v38);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      objc_msgSend(a5, "boundsRectForTextBlock:atIndex:effectiveRange:", a2, v13, 0);
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      if (*((_QWORD *)&v38 + 1))
      {
        v30 = objc_msgSend(a5, "characterRangeForGlyphRange:actualGlyphRange:", v38, 0);
        v32 = v31;
        v34 = *((_QWORD *)&v38 + 1);
        v33 = v38;
        return -[NSTextBlockLayoutHelper initWithTextBlock:charRange:glyphRange:layoutRect:boundsRect:containerWidth:allowMargins:collapseBorders:allowPadding:](v12, a2, v30, v32, v33, v34, a6 ^ 1u, a6, v15, v17, v19, v21, v23, v25, v27, v29, a7, 1);
      }
    }
    else
    {
      v15 = *MEMORY[0x1E0CB3438];
      v17 = *(double *)(MEMORY[0x1E0CB3438] + 8);
      v19 = *(double *)(MEMORY[0x1E0CB3438] + 16);
      v21 = *(double *)(MEMORY[0x1E0CB3438] + 24);
      v23 = *MEMORY[0x1E0CB3438];
      v25 = v17;
      v27 = v19;
      v29 = v21;
    }
    v30 = objc_msgSend(a4, "rangeOfTextBlock:atIndex:", a2, a3);
    v32 = v35;
    v33 = objc_msgSend(a5, "glyphRangeForCharacterRange:actualCharacterRange:", v30, v35, 0);
    v34 = v36;
    *(_QWORD *)&v38 = v33;
    *((_QWORD *)&v38 + 1) = v36;
    return -[NSTextBlockLayoutHelper initWithTextBlock:charRange:glyphRange:layoutRect:boundsRect:containerWidth:allowMargins:collapseBorders:allowPadding:](v12, a2, v30, v32, v33, v34, a6 ^ 1u, a6, v15, v17, v19, v21, v23, v25, v27, v29, a7, 1);
  }
  return result;
}

- (char)initWithTextTable:(uint64_t)a3 charIndex:(void *)a4 text:(void *)a5 layoutManager:(char)a6 containerWidth:(double)a7 collapseBorders:
{
  char *v12;
  uint64_t v13;
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
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v38;

  if (result)
  {
    v12 = result;
    v38 = xmmword_18D6CBB80;
    if (a5)
    {
      v13 = objc_msgSend(a5, "glyphRangeForCharacterRange:actualCharacterRange:", a3, 1, 0);
      objc_msgSend(a5, "layoutRectForTextBlock:atIndex:effectiveRange:", a2, v13, &v38);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      objc_msgSend(a5, "boundsRectForTextBlock:atIndex:effectiveRange:", a2, v13, 0);
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      if (*((_QWORD *)&v38 + 1))
      {
        v30 = objc_msgSend(a5, "characterRangeForGlyphRange:actualGlyphRange:", v38, 0);
        v32 = v31;
        v34 = *((_QWORD *)&v38 + 1);
        v33 = v38;
        return -[NSTextBlockLayoutHelper initWithTextBlock:charRange:glyphRange:layoutRect:boundsRect:containerWidth:allowMargins:collapseBorders:allowPadding:](v12, a2, v30, v32, v33, v34, 1, 0, v15, v17, v19, v21, v23, v25, v27, v29, a7, a6 ^ 1u);
      }
    }
    else
    {
      v15 = *MEMORY[0x1E0CB3438];
      v17 = *(double *)(MEMORY[0x1E0CB3438] + 8);
      v19 = *(double *)(MEMORY[0x1E0CB3438] + 16);
      v21 = *(double *)(MEMORY[0x1E0CB3438] + 24);
      v23 = *MEMORY[0x1E0CB3438];
      v25 = v17;
      v27 = v19;
      v29 = v21;
    }
    v30 = objc_msgSend(a4, "rangeOfTextTable:atIndex:", a2, a3);
    v32 = v35;
    v33 = objc_msgSend(a5, "glyphRangeForCharacterRange:actualCharacterRange:", v30, v35, 0);
    v34 = v36;
    *(_QWORD *)&v38 = v33;
    *((_QWORD *)&v38 + 1) = v36;
    return -[NSTextBlockLayoutHelper initWithTextBlock:charRange:glyphRange:layoutRect:boundsRect:containerWidth:allowMargins:collapseBorders:allowPadding:](v12, a2, v30, v32, v33, v34, 1, 0, v15, v17, v19, v21, v23, v25, v27, v29, a7, a6 ^ 1u);
  }
  return result;
}

- (id)description
{
  void *v3;
  NSTextTableBlock *block;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  block = self->_block;
  v5 = NSStringFromRange(self->_charRange);
  v6 = NSStringFromRange(self->_glyphRange);
  v7 = NSStringFromRect(self->_layoutRect);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<NSTextBlockLayoutHelper %p for block %p (cr %@ gr %@ lr %@ br %@ w %g h %g m %g %g %g %g b %g %g %g %g p %g %g %g %g)>"), self, block, v5, v6, v7, NSStringFromRect(self->_boundsRect), *(_QWORD *)&self->_width, *(_QWORD *)&self->_height, *(_QWORD *)&self->_tMargin, *(_QWORD *)&self->_rMargin, *(_QWORD *)&self->_bMargin, *(_QWORD *)&self->_lMargin, *(_QWORD *)&self->_tBorder, *(_QWORD *)&self->_rBorder, *(_QWORD *)&self->_bBorder, *(_QWORD *)&self->_lBorder,
               *(_QWORD *)&self->_tPadding,
               *(_QWORD *)&self->_rPadding,
               *(_QWORD *)&self->_bPadding,
               *(_QWORD *)&self->_lPadding);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSTextBlockLayoutHelper;
  -[NSTextBlockLayoutHelper dealloc](&v3, sel_dealloc);
}

@end
