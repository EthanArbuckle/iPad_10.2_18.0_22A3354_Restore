@implementation PXScrollSnapController

- (PXScrollSnapController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollSnapController.m"), 23, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (PXScrollSnapController)initWithSnapBehavior:(int64_t)a3 scrollAxis:(int64_t)a4 visibleRect:(CGRect)a5 visibilityInsets:(UIEdgeInsets)a6 scrollablePageSource:(id)a7
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  PXScrollSnapController *v19;
  PXScrollSnapController *v20;
  objc_super v22;

  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v18 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PXScrollSnapController;
  v19 = -[PXScrollSnapController init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_snapBehavior = a3;
    v19->_scrollAxis = a4;
    v19->_visibleRect.origin.x = x;
    v19->_visibleRect.origin.y = y;
    v19->_visibleRect.size.width = width;
    v19->_visibleRect.size.height = height;
    v19->_visibilityInsets.top = top;
    v19->_visibilityInsets.left = left;
    v19->_visibilityInsets.bottom = bottom;
    v19->_visibilityInsets.right = right;
    objc_storeWeak((id *)&v19->_scrollablePageSource, v18);
    *(_OWORD *)&v20->_maximumAccelerationFactor = xmmword_1A7C0C8F0;
    v20->_minimumSpeed = 0.1;
  }

  return v20;
}

- (CGPoint)adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:(CGPoint)a3 scrollingVelocity:(CGPoint)a4 decelerationRate:(int64_t *)a5
{
  double y;
  CGFloat v7;
  int64_t v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double MinY;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CGFloat x;
  _QWORD v52[30];
  BOOL v53;
  BOOL v54;
  _QWORD v55[3];
  char v56;
  _QWORD v57[3];
  char v58;
  _QWORD v59[3];
  char v60;
  _QWORD v61[3];
  char v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  double *v68;
  uint64_t v69;
  CGFloat v70;
  _QWORD v71[4];
  _BYTE buf[24];
  uint64_t v73;
  uint64_t v74;
  CGPoint result;
  CGRect v76;

  y = a4.y;
  v7 = a3.y;
  x = a3.x;
  v74 = *MEMORY[0x1E0C80C00];
  v10 = -[PXScrollSnapController snapBehavior](self, "snapBehavior");
  v11 = -[PXScrollSnapController scrollAxis](self, "scrollAxis");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(CGFloat *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v10;
    _os_log_debug_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ScrollSnap] === adjust %f with behavior %ti", buf, 0x16u);
    if (!v10)
      goto LABEL_17;
  }
  else if (!v10)
  {
    goto LABEL_17;
  }
  PXPointValueForAxis();
  v13 = v12;
  -[PXScrollSnapController minimumSpeed](self, "minimumSpeed");
  if (fabs(v13) >= v14)
  {
    if (v11 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollSnapController.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scrollAxis == PXAxisVertical"));

    }
    -[PXScrollSnapController visibleRect](self, "visibleRect");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[PXScrollSnapController visibilityInsets](self, "visibilityInsets");
    v49 = v24;
    v50 = v23;
    v26 = v25;
    v28 = v27;
    PXEdgeInsetsInsetRect();
    v47 = v30;
    v48 = v29;
    v45 = v32;
    v46 = v31;
    -[PXScrollSnapController maximumAccelerationFactor](self, "maximumAccelerationFactor");
    v44 = v33;
    -[PXScrollSnapController maximumDecelerationFactor](self, "maximumDecelerationFactor");
    v43 = v34;
    v76.origin.x = v16;
    v76.origin.y = v18;
    v76.size.width = v20;
    v76.size.height = v22;
    MinY = CGRectGetMinY(v76);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = MinY;
      _os_log_debug_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ScrollSnap] current %f", buf, 0xCu);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v73 = 0x7FEFFFFFFFFFFFFFLL;
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x2020000000;
    v71[3] = 0x7FEFFFFFFFFFFFFFLL;
    v67 = 0;
    v68 = (double *)&v67;
    v69 = 0x2020000000;
    v70 = v7;
    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 0;
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x2020000000;
    v62 = 0;
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2020000000;
    v60 = 0;
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x2020000000;
    v58 = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x2020000000;
    v56 = 0;
    -[PXScrollSnapController scrollablePageSource](self, "scrollablePageSource");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[2] = __119__PXScrollSnapController_adjustedTargetVisibleOriginForProposedTargetVisibleOrigin_scrollingVelocity_decelerationRate___block_invoke;
    v52[3] = &unk_1E5142280;
    v52[1] = 3221225472;
    v38 = 1.79769313e308;
    if (y < 0.0)
      v38 = MinY;
    v39 = -1.79769313e308;
    v52[13] = v48;
    v52[14] = v46;
    if (y > 0.0)
      v39 = MinY;
    v52[15] = v47;
    v52[16] = v45;
    v52[6] = v59;
    v52[7] = v57;
    v53 = y < 0.0;
    v52[17] = v10;
    *(double *)&v52[18] = v39;
    *(double *)&v52[19] = v38;
    v52[20] = v44;
    v52[21] = v43;
    v52[22] = v10 == 3;
    *(CGFloat *)&v52[23] = v7;
    *(double *)&v52[24] = MinY;
    v52[8] = v61;
    v52[9] = buf;
    v52[10] = v71;
    v52[11] = &v67;
    v52[12] = &v63;
    v52[25] = a2;
    v52[4] = self;
    v52[5] = v55;
    v52[26] = v50;
    v52[27] = v49;
    v52[28] = v26;
    v52[29] = v28;
    v54 = y > 0.0;
    objc_msgSend(v36, "enumerateScrollablePagesWithOptions:usingBlock:", 2 * (y < 0.0), v52);

    if (v10 == 3)
      v10 = *((unsigned __int8 *)v64 + 24);
    else
      v10 = 0;
    v7 = v68[3];
    _Block_object_dispose(v55, 8);
    _Block_object_dispose(v57, 8);
    _Block_object_dispose(v59, 8);
    _Block_object_dispose(v61, 8);
    _Block_object_dispose(&v63, 8);
    _Block_object_dispose(&v67, 8);
    _Block_object_dispose(v71, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v10 = 0;
  }
LABEL_17:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(CGFloat *)&buf[4] = v7;
    _os_log_debug_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ScrollSnap] ===> adjusted %f", buf, 0xCu);
    if (!a5)
      goto LABEL_20;
    goto LABEL_19;
  }
  if (a5)
LABEL_19:
    *a5 = v10;
LABEL_20:
  v40 = x;
  v41 = v7;
  result.y = v41;
  result.x = v40;
  return result;
}

- (int64_t)snapBehavior
{
  return self->_snapBehavior;
}

- (void)setSnapBehavior:(int64_t)a3
{
  self->_snapBehavior = a3;
}

- (int64_t)scrollAxis
{
  return self->_scrollAxis;
}

- (void)setScrollAxis:(int64_t)a3
{
  self->_scrollAxis = a3;
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
}

- (UIEdgeInsets)visibilityInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_visibilityInsets.top;
  left = self->_visibilityInsets.left;
  bottom = self->_visibilityInsets.bottom;
  right = self->_visibilityInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setVisibilityInsets:(UIEdgeInsets)a3
{
  self->_visibilityInsets = a3;
}

- (PXScrollablePageSource)scrollablePageSource
{
  return (PXScrollablePageSource *)objc_loadWeakRetained((id *)&self->_scrollablePageSource);
}

- (void)setScrollablePageSource:(id)a3
{
  objc_storeWeak((id *)&self->_scrollablePageSource, a3);
}

- (double)maximumAccelerationFactor
{
  return self->_maximumAccelerationFactor;
}

- (void)setMaximumAccelerationFactor:(double)a3
{
  self->_maximumAccelerationFactor = a3;
}

- (double)maximumDecelerationFactor
{
  return self->_maximumDecelerationFactor;
}

- (void)setMaximumDecelerationFactor:(double)a3
{
  self->_maximumDecelerationFactor = a3;
}

- (double)minimumSpeed
{
  return self->_minimumSpeed;
}

- (void)setMinimumSpeed:(double)a3
{
  self->_minimumSpeed = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollablePageSource);
}

void __119__PXScrollSnapController_adjustedTargetVisibleOriginForProposedTargetVisibleOrigin_scrollingVelocity_decelerationRate___block_invoke(uint64_t a1, uint64_t a2, int a3, _BYTE *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinY;
  double MaxY;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  void (**v21)(_QWORD, double);
  __n128 v22;
  double MidY;
  double Height;
  int v25;
  int v26;
  int v27;
  void *v28;
  _QWORD aBlock[6];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v44 = *MEMORY[0x1E0C80C00];
  MinY = CGRectGetMinY(*(CGRect *)&a5);
  v45.origin.x = a5;
  v45.origin.y = a6;
  v45.size.width = a7;
  v45.size.height = a8;
  MaxY = CGRectGetMaxY(v45);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v50 = CGRectInset(*(CGRect *)(a1 + 104), 1.0, 1.0);
  v46.origin.x = a5;
  v46.origin.y = a6;
  v46.size.width = a7;
  v46.size.height = a8;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CGRectIntersectsRect(v46, v50);
  v51 = CGRectInset(*(CGRect *)(a1 + 104), 1.0, 1.0);
  v47.origin.x = a5;
  v47.origin.y = a6;
  v47.size.width = a7;
  v47.size.height = a8;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CGRectIntersectsRect(v47, v51);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v25 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v26 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v27 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    *(_DWORD *)buf = 134218752;
    v37 = a2;
    v38 = 1024;
    v39 = v25;
    v40 = 1024;
    v41 = v26;
    v42 = 1024;
    v43 = v27;
    _os_log_debug_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ScrollSnap] %ti isPageInFocus %i isPageAtLeastPartiallyVisible %i lastPageWasInFocus %i", buf, 0x1Eu);
  }
  if (*(_BYTE *)(a1 + 240) || *(_QWORD *)(a1 + 136) != 2)
  {
    if (!a3)
      goto LABEL_20;
  }
  else if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) && (a3 & 1) == 0)
  {
    goto LABEL_20;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __119__PXScrollSnapController_adjustedTargetVisibleOriginForProposedTargetVisibleOrigin_scrollingVelocity_decelerationRate___block_invoke_7;
  aBlock[3] = &unk_1E5142258;
  v18 = *(_OWORD *)(a1 + 160);
  v32 = *(_OWORD *)(a1 + 144);
  v33 = v18;
  v34 = *(_QWORD *)(a1 + 176);
  v19 = *(_QWORD *)(a1 + 56);
  aBlock[4] = *(_QWORD *)(a1 + 40);
  aBlock[5] = v19;
  v35 = *(_OWORD *)(a1 + 184);
  v20 = *(_OWORD *)(a1 + 88);
  v30 = *(_OWORD *)(a1 + 72);
  v31 = v20;
  v21 = (void (**)(_QWORD, double))_Block_copy(aBlock);
  switch(*(_QWORD *)(a1 + 136))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 200), *(_QWORD *)(a1 + 32), CFSTR("PXScrollSnapController.m"), 172, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      v48.origin.x = a5;
      v48.origin.y = a6;
      v48.size.width = a7;
      v48.size.height = a8;
      MidY = CGRectGetMidY(v48);
      v22.n128_f64[0] = MidY - CGRectGetMidY(*(CGRect *)(a1 + 104)) + *(double *)(a1 + 192);
      goto LABEL_18;
    case 2:
      v22.n128_f64[0] = MinY - *(double *)(a1 + 208);
      goto LABEL_18;
    case 3:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v37 = a2;
        _os_log_debug_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ScrollSnap] %ti page top?", buf, 0xCu);
      }
      v21[2](v21, MinY - *(double *)(a1 + 208));
      v49.origin.x = a5;
      v49.origin.y = a6;
      v49.size.width = a7;
      v49.size.height = a8;
      Height = CGRectGetHeight(v49);
      if (Height <= CGRectGetHeight(*(CGRect *)(a1 + 104)))
        goto LABEL_19;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v37 = a2;
        _os_log_debug_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ScrollSnap] %ti page bottom?", buf, 0xCu);
      }
      v22.n128_f64[0] = MaxY - *(double *)(a1 + 128) - *(double *)(a1 + 208);
LABEL_18:
      ((void (*)(void (**)(_QWORD, double), __n128))v21[2])(v21, v22);
LABEL_19:

      break;
    default:
      goto LABEL_19;
  }
LABEL_20:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a3;
  if (*(_BYTE *)(a1 + 240) && MaxY < CGRectGetMinY(*(CGRect *)(a1 + 104))
    || *(_BYTE *)(a1 + 241) && MinY > CGRectGetMaxY(*(CGRect *)(a1 + 104)))
  {
    *a4 = 1;
  }
}

void __119__PXScrollSnapController_adjustedTargetVisibleOriginForProposedTargetVisibleOrigin_scrollingVelocity_decelerationRate___block_invoke_7(uint64_t a1, double a2)
{
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  BOOL v14;
  NSObject *v15;
  const char *v16;
  uint32_t v17;
  int v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v18 = 134217984;
    v19 = a2;
    _os_log_debug_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ScrollSnap] candidate %f", (uint8_t *)&v18, 0xCu);
  }
  if (*(double *)(a1 + 80) > a2 || *(double *)(a1 + 88) < a2)
    return;
  v5 = *(double *)(a1 + 96);
  v4 = *(double *)(a1 + 104);
  v6 = *(_QWORD *)(a1 + 112);
  if (v6 == 1)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
      || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v7 = *(double *)(a1 + 128);
      v11 = vabdd_f64(a2, v7);
      if (v11 >= *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        goto LABEL_30;
      v8 = *(double *)(a1 + 120);
      v9 = vabdd_f64(a2, v8);
      v10 = a2 - v7;
      goto LABEL_15;
    }
    v8 = *(double *)(a1 + 120);
    v7 = *(double *)(a1 + 128);
    v9 = vabdd_f64(a2, v8);
    v10 = a2 - v7;
    v11 = vabdd_f64(a2, v7);
    v5 = 1.79769313e308;
  }
  else
  {
    if (v6)
      goto LABEL_30;
    v8 = *(double *)(a1 + 120);
    v7 = *(double *)(a1 + 128);
    v9 = vabdd_f64(a2, v8);
    v10 = a2 - v7;
    v11 = vabdd_f64(a2, v7);
  }
  if (v9 >= *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
LABEL_30:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      v15 = MEMORY[0x1E0C81028];
      v16 = "[ScrollSnap] not closer";
      goto LABEL_32;
    }
    return;
  }
  if (v8 == v7)
    goto LABEL_33;
LABEL_15:
  v12 = v10 / (v8 - v7);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v18 = 134217984;
    v19 = v12;
    _os_log_debug_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ScrollSnap] factor %f", (uint8_t *)&v18, 0xCu);
  }
  v13 = v12 < 1.0 || v12 > v5;
  if (v13 && (v12 < 1.0 ? (v14 = v12 < 1.0 / v4) : (v14 = 1), v14))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      v15 = MEMORY[0x1E0C81028];
      v16 = "[ScrollSnap] not acceptable";
LABEL_32:
      v17 = 2;
LABEL_36:
      _os_log_debug_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v18, v17);
    }
  }
  else
  {
LABEL_33:
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v11;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v18 = 134217984;
      v19 = a2;
      v15 = MEMORY[0x1E0C81028];
      v16 = "[ScrollSnap] accepted %f";
      v17 = 12;
      goto LABEL_36;
    }
  }
}

@end
