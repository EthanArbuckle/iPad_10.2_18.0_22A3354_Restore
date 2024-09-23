@implementation _UICollectionLayoutSectionGeometryTranslator

- (char)initWithPrimaryContentSize:(int)a3 sectionAuxiliarySolutionSize:(double)a4 layoutAxis:(double)a5 layoutRTL:(double)a6 sectionInsets:(double)a7 contentFrameSupplementaryOffset:(double)a8
{
  char *v28;
  char *v29;
  double v30;
  double v31;
  _OWORD *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  __int128 v43;
  objc_super v45;

  if (!a1)
    return 0;
  v45.receiver = a1;
  v45.super_class = (Class)_UICollectionLayoutSectionGeometryTranslator;
  v28 = (char *)objc_msgSendSuper2(&v45, sel_init);
  v29 = v28;
  if (v28)
  {
    *((_QWORD *)v28 + 1) = a2;
    v28[16] = a3;
    if (a3)
      v30 = a11;
    else
      v30 = a9;
    if (a3)
      v31 = a9;
    else
      v31 = a11;
    *((double *)v28 + 5) = a8;
    *((double *)v28 + 6) = v30;
    *((double *)v28 + 7) = a10;
    *((double *)v28 + 8) = v31;
    *((double *)v28 + 3) = a12;
    *((double *)v28 + 4) = a13;
    if (a2)
    {
      v32 = (_OWORD *)MEMORY[0x1E0C9D538];
      v33 = *MEMORY[0x1E0C9D538];
      v34 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v35 = v30 + *MEMORY[0x1E0C9D538];
      v36 = _UIPointValueForAxis(a2, a12, a13);
      v37 = v35 + _UISetPointValueForAxis(*((_QWORD *)v29 + 1), v33, v34, v36);
      v39 = a8 + v34 + v38;
      v40 = _UITotalEdgeDimensionsForLayoutAxis(a2, *((double *)v29 + 5), *((double *)v29 + 6), *((double *)v29 + 7), *((double *)v29 + 8));
      v41 = _UISetSizeValueForAxis(a2, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v40);
      *((double *)v29 + 9) = v37;
      *((double *)v29 + 10) = v39;
      *((double *)v29 + 11) = a4;
      *((double *)v29 + 12) = a5;
      *(_OWORD *)(v29 + 104) = *v32;
      *((double *)v29 + 15) = fmax(a4 + v41, a6);
      *((double *)v29 + 16) = fmax(a5 + v42, a7);
    }
    else
    {
      v43 = *MEMORY[0x1E0C9D538];
      *(_OWORD *)(v28 + 72) = *MEMORY[0x1E0C9D538];
      *((double *)v28 + 11) = a4;
      *((double *)v28 + 12) = a5;
      *(_OWORD *)(v28 + 104) = v43;
      *(_OWORD *)(v28 + 120) = *(_OWORD *)(v28 + 88);
    }
  }
  return v29;
}

- (double)contentRectForSectionRect:(CGFloat)a3
{
  double v9;
  CGRect v11;

  if (!a1)
    return 0.0;
  v9 = a2 - *(double *)(a1 + 72);
  CGRectGetWidth(*(CGRect *)&a2);
  v11.origin.x = a2;
  v11.origin.y = a3;
  v11.size.width = a4;
  v11.size.height = a5;
  CGRectGetHeight(v11);
  return v9;
}

- (double)auxillaryHostContentSize
{
  uint64_t v2;
  double v3;
  double v4;

  if (!a1)
    return 0.0;
  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    return *(double *)(a1 + 88);
  v3 = _UITotalEdgeDimensionsForLayoutAxis(v2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v4 = *(double *)(a1 + 88);
  return v4
       + _UISetSizeValueForAxis(*(_QWORD *)(a1 + 8), *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_contentFrameIncludingAuxiliaries);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_primaryContentFrame);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p _contentFrameIncludingAuxiliaries=%@; primaryContentFrame=%@>"),
    v5,
    self,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
