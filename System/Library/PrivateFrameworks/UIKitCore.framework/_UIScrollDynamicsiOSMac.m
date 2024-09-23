@implementation _UIScrollDynamicsiOSMac

- (_UIScrollDynamicsiOSMac)init
{
  _UIScrollDynamicsiOSMac *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIScrollDynamicsiOSMac;
  result = -[_UIScrollDynamics init](&v3, sel_init);
  if (result)
    result->_decelerationRate = 1000.0;
  return result;
}

- (void)calculateDecelerationTarget
{
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int8x16_t v11;
  int8x16_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int8x16_t v19;
  float64x2_t v20;
  int8x16_t v21;
  _BOOL4 v22;
  double decelerationRate;
  double v24;
  double v25;
  double v26;
  CGPoint *p_destinationIgnoringRubberbanding;
  _BOOL4 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat x;
  CGFloat y;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  int v47;
  unint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double durationUntilStopIgnoringRubberbanding;
  double v54;
  double v55;
  long double v56;
  double linearDisplacementIgnoringRubberbanding;
  long double v58;
  long double v59;
  NSObject *v60;
  NSObject *v61;
  objc_class *v62;
  void *v63;
  void *v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  int8x16_t v73;
  int8x16_t v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  _UIScrollDynamicsiOSMac *v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = calculateDecelerationTarget___s_category;
  if (!calculateDecelerationTarget___s_category)
  {
    v4 = __UILogCategoryGetNode("ScrollDynamics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&calculateDecelerationTarget___s_category);
  }
  if ((*(_BYTE *)v4 & 1) != 0)
  {
    v60 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v61 = v60;
      v62 = (objc_class *)objc_opt_class();
      NSStringFromClass(v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v76 = v63;
      v77 = 2048;
      v78 = self;
      v79 = 2112;
      v80 = v64;
      _os_log_impl(&dword_185066000, v61, OS_LOG_TYPE_ERROR, "[%@(0x%lx) %@]", buf, 0x20u);

    }
  }
  self->_durationUntilRubberband = -1.0;
  -[_UIScrollDynamics contentOrigin](self, "contentOrigin");
  v71 = v6;
  v72 = v5;
  -[_UIScrollDynamics viewSize](self, "viewSize");
  v8 = v7;
  v10 = v9;
  -[_UIScrollDynamics initialVelocity](self, "initialVelocity");
  v73 = v12;
  v74 = v11;
  -[_UIScrollDynamics initialContentOffset](self, "initialContentOffset");
  v14 = v13;
  v16 = v15;
  -[_UIScrollDynamics tolerance](self, "tolerance");
  v67 = v17;
  v68 = v18;
  -[_UIScrollDynamics decelerationTarget](self, "decelerationTarget");
  v19.i64[0] = 1.0;
  v20.f64[0] = NAN;
  v20.f64[1] = NAN;
  v21 = (int8x16_t)vnegq_f64(v20);
  v70 = *(double *)vbslq_s8(v21, v19, v74).i64;
  *(_QWORD *)&v69 = vbslq_s8(v21, v19, v73).u64[0];
  v22 = -[_UIScrollDynamics shouldRoundCalculations](self, "shouldRoundCalculations");
  decelerationRate = self->_decelerationRate;
  v66 = v14;
  v24 = v14 + v70 * (decelerationRate * pow(fabs(*(double *)v74.i64) / (decelerationRate * 4.0), 1.33333333));
  v25 = ceil(v24 + -0.5);
  v26 = floor(v24 + 0.5);
  if (v24 <= 0.0)
    v25 = v26;
  if (v22)
    v24 = v25;
  p_destinationIgnoringRubberbanding = &self->_destinationIgnoringRubberbanding;
  self->_destinationIgnoringRubberbanding.x = v24;
  v28 = -[_UIScrollDynamics shouldRoundCalculations](self, "shouldRoundCalculations");
  v29 = self->_decelerationRate;
  v65 = v16;
  v30 = v16 + v69 * (v29 * pow(fabs(*(double *)v73.i64) / (v29 * 4.0), 1.33333333));
  if (v28)
  {
    v31 = ceil(v30 + -0.5);
    v32 = floor(v30 + 0.5);
    if (v30 <= 0.0)
      v30 = v32;
    else
      v30 = v31;
  }
  self->_destinationIgnoringRubberbanding.y = v30;
  _catesCalculateCachedProperties(self);
  x = p_destinationIgnoringRubberbanding->x;
  y = self->_destinationIgnoringRubberbanding.y;
  -[_UIScrollDynamics contentFrame](self, "contentFrame");
  if (v37 <= v8 + 0.0001)
    v39 = v72;
  else
    v39 = v35;
  if (v37 <= v8 + 0.0001)
    v40 = v8;
  else
    v40 = v37;
  if (v38 <= v10 + 0.0001)
    v41 = v71;
  else
    v41 = v36;
  if (v38 <= v10 + 0.0001)
    v42 = v10;
  else
    v42 = v38;
  v43 = _NSStretchOfClipBoundsForDocumentFrame(x, y, v8, v10, v39, v41, v40, v42, v72, v71);
  self->_rubberBandingAxis = 0;
  v45 = fabs(v44);
  if (fabs(v43) < v67 && v45 < v68)
    goto LABEL_36;
  v47 = 0;
  if (self->_absDisplacementVectorIgnoringRubberbanding.height < self->_absDisplacementVectorIgnoringRubberbanding.width)
  {
    self->_destinationIgnoringRubberbanding.y = self->_destinationIgnoringRubberbanding.y - v44;
    v44 = 0.0;
    v48 = 1;
    if (v43 == 0.0)
      goto LABEL_32;
    goto LABEL_30;
  }
  p_destinationIgnoringRubberbanding->x = p_destinationIgnoringRubberbanding->x - v43;
  v43 = 0.0;
  v48 = 2;
  if (v44 != 0.0)
  {
LABEL_30:
    self->_rubberBandingAxis = v48;
    v47 = 1;
  }
LABEL_32:
  v49 = p_destinationIgnoringRubberbanding->x - v43;
  v50 = self->_destinationIgnoringRubberbanding.y - v44;
  -[_UIScrollDynamics setDecelerationTarget:](self, "setDecelerationTarget:", v49, v50);
  _catesCalculateCachedProperties(self);
  if (!v47)
  {
LABEL_36:
    -[_UIScrollDynamics setDecelerationTarget:](self, "setDecelerationTarget:", p_destinationIgnoringRubberbanding->x, self->_destinationIgnoringRubberbanding.y);
    self->_durationUntilRubberband = -1.0;
    goto LABEL_39;
  }
  v51 = _NSStretchOfClipBoundsForDocumentFrame(v66, v65, v8, v10, v39, v41, v40, v42, v72, v71);
  if (*MEMORY[0x1E0C9D820] == v51 && *(double *)(MEMORY[0x1E0C9D820] + 8) == v52)
  {
    durationUntilStopIgnoringRubberbanding = self->_durationUntilStopIgnoringRubberbanding;
    v54 = durationUntilStopIgnoringRubberbanding
        - pow((self->_linearDisplacementIgnoringRubberbanding - sqrt((v49 - v66) * (v49 - v66) + (v50 - v65) * (v50 - v65)))/ self->_decelerationRate, 0.25);
    self->_durationUntilRubberband = v54;
    v55 = self->_decelerationRate * 4.0;
    v56 = v55 * pow(self->_durationUntilStopIgnoringRubberbanding - v54, 3.0);
    linearDisplacementIgnoringRubberbanding = self->_linearDisplacementIgnoringRubberbanding;
    v58 = v56 * (self->_absDisplacementVectorIgnoringRubberbanding.width / linearDisplacementIgnoringRubberbanding);
    v59 = v56 * (self->_absDisplacementVectorIgnoringRubberbanding.height / linearDisplacementIgnoringRubberbanding);
    self->_initialRubberbandingVelocity.dx = v70 * v58;
    self->_initialRubberbandingVelocity.dy = v69 * v59;
  }
  else
  {
    self->_initialRubberbandingOrigin.x = v51;
    self->_initialRubberbandingOrigin.y = v52;
    self->_durationUntilRubberband = 0.0;
    *(_QWORD *)&self->_initialRubberbandingVelocity.dx = v74.i64[0];
    *(_QWORD *)&self->_initialRubberbandingVelocity.dy = v73.i64[0];
    p_destinationIgnoringRubberbanding->x = v49;
    self->_destinationIgnoringRubberbanding.y = v50;
  }
  _catesCalculateCachedProperties(self);
LABEL_39:
  if (self->_decelerationRate <= 0.0
    && self->_durationUntilStopIgnoringRubberbanding > 2.0
    && self->_durationUntilRubberband < 0.0)
  {
    -[_UIScrollDynamicsiOSMac positionAfterDuration:](self, "positionAfterDuration:", 2.0);
    -[_UIScrollDynamics setDecelerationTarget:](self, "setDecelerationTarget:");
    -[_UIScrollDynamicsiOSMac calculateToReachDecelerationTarget](self, "calculateToReachDecelerationTarget");
  }
}

- (void)calculateToReachDecelerationTarget
{
  unint64_t v4;
  int8x16_t v5;
  int8x16_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int8x16_t v15;
  unint64_t v16;
  float64x2_t v17;
  int8x16_t v18;
  _BOOL4 v19;
  double decelerationRate;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  unint64_t v40;
  NSObject *v41;
  const char *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  double v46;
  long double v47;
  double v48;
  double v49;
  unint64_t v50;
  NSObject *v51;
  NSObject *v52;
  objc_class *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  double durationUntilStop;
  double v61;
  NSObject *v62;
  NSObject *v63;
  double v64;
  double v65;
  int8x16_t v66;
  int8x16_t v67;
  uint8_t buf[4];
  double v69;
  __int16 v70;
  _UIScrollDynamicsiOSMac *v71;
  __int16 v72;
  double v73;
  __int16 v74;
  double v75;
  uint64_t v76;
  CGPoint v77;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = _MergedGlobals_3_27;
  if (!_MergedGlobals_3_27)
  {
    v4 = __UILogCategoryGetNode("ScrollDynamics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&_MergedGlobals_3_27);
  }
  if ((*(_BYTE *)v4 & 1) != 0)
  {
    v51 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v52 = v51;
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v69 = *(double *)&v54;
      v70 = 2048;
      v71 = self;
      v72 = 2112;
      v73 = *(double *)&v55;
      _os_log_impl(&dword_185066000, v52, OS_LOG_TYPE_ERROR, "[%@(0x%lx) %@]", buf, 0x20u);

    }
  }
  -[_UIScrollDynamics contentOrigin](self, "contentOrigin");
  -[_UIScrollDynamics viewSize](self, "viewSize");
  -[_UIScrollDynamics initialVelocity](self, "initialVelocity");
  v66 = v6;
  v67 = v5;
  -[_UIScrollDynamics initialContentOffset](self, "initialContentOffset");
  v8 = v7;
  v10 = v9;
  -[_UIScrollDynamics decelerationTarget](self, "decelerationTarget");
  v12 = v11;
  v14 = v13;
  -[_UIScrollDynamics tolerance](self, "tolerance");
  self->_durationUntilRubberband = -1.0;
  self->_destinationIgnoringRubberbanding.x = v12;
  self->_destinationIgnoringRubberbanding.y = v14;
  v16 = qword_1ECD7A7C8;
  if (!qword_1ECD7A7C8)
  {
    v16 = __UILogCategoryGetNode("ScrollDynamics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v16, (unint64_t *)&qword_1ECD7A7C8);
  }
  if ((*(_BYTE *)v16 & 1) != 0)
  {
    v56 = *(NSObject **)(v16 + 8);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      v57 = v56;
      v77.x = v12;
      v77.y = v14;
      NSStringFromCGPoint(v77);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v69 = *(double *)&v58;
      _os_log_impl(&dword_185066000, v57, OS_LOG_TYPE_ERROR, "New Destination: %@", buf, 0xCu);

    }
  }
  v15.i64[0] = 1.0;
  v17.f64[0] = NAN;
  v17.f64[1] = NAN;
  v18 = (int8x16_t)vnegq_f64(v17);
  *(_QWORD *)&v65 = vbslq_s8(v18, v15, v66).u64[0];
  v19 = -[_UIScrollDynamics shouldRoundCalculations](self, "shouldRoundCalculations", vbslq_s8(v18, v15, v67));
  decelerationRate = self->_decelerationRate;
  v21 = v64 * (decelerationRate * pow(fabs(*(double *)v67.i64) / (decelerationRate * 4.0), 1.33333333));
  if (v19)
  {
    v22 = ceil(v21 + -0.5);
    v23 = floor(v21 + 0.5);
    if (v21 <= 0.0)
      v21 = v23;
    else
      v21 = v22;
  }
  v24 = -[_UIScrollDynamics shouldRoundCalculations](self, "shouldRoundCalculations");
  v25 = self->_decelerationRate;
  v26 = v65 * (v25 * pow(fabs(*(double *)v66.i64) / (v25 * 4.0), 1.33333333));
  if (v24)
  {
    v27 = ceil(v26 + -0.5);
    v28 = floor(v26 + 0.5);
    if (v26 <= 0.0)
      v26 = v28;
    else
      v26 = v27;
  }
  v29 = v12 - v8;
  if (-[_UIScrollDynamics shouldRoundCalculations](self, "shouldRoundCalculations"))
  {
    v30 = ceil(v29 + -0.5);
    v31 = floor(v29 + 0.5);
    if (v29 <= 0.0)
      v29 = v31;
    else
      v29 = v30;
  }
  v32 = v14 - v10;
  if (-[_UIScrollDynamics shouldRoundCalculations](self, "shouldRoundCalculations"))
  {
    v33 = ceil(v32 + -0.5);
    v34 = floor(v32 + 0.5);
    if (v32 <= 0.0)
      v32 = v34;
    else
      v32 = v33;
  }
  v35 = sqrt(v21 * v21 + v26 * v26);
  v36 = self->_decelerationRate;
  v37 = sqrt(v29 * v29 + v32 * v32);
  v38 = pow(self->_durationUntilStopIgnoringRubberbanding, 3.0);
  if (v37 > 0.5)
  {
    v39 = v38 * (v36 * 4.0);
    if ((v29 == 0.0 || *(_QWORD *)&v29 >> 63 == *(_QWORD *)&v21 >> 63)
      && (v32 == 0.0 || *(_QWORD *)&v32 >> 63 == *(_QWORD *)&v26 >> 63))
    {
      if (v37 <= v35)
      {
        v45 = qword_1ECD7A7E8;
        if (!qword_1ECD7A7E8)
        {
          v45 = __UILogCategoryGetNode("ScrollDynamics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v45, (unint64_t *)&qword_1ECD7A7E8);
        }
        if ((*(_BYTE *)v45 & 1) != 0)
        {
          v63 = *(NSObject **)(v45 + 8);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v63, OS_LOG_TYPE_ERROR, "we'd go too far on the current velocity, so adjust the deceleration rate", buf, 2u);
          }
        }
        -[_UIScrollDynamics initialVelocity](self, "initialVelocity");
        v39 = sqrt(*(double *)v66.i64 * *(double *)v66.i64 + *(double *)v67.i64 * v46);
        v47 = pow(v37, 0.75);
        v48 = pow(v39 / (v47 * 4.0), 4.0);
        self->_decelerationRate = v48;
        v49 = pow(v37 / v48, 0.25);
        self->_durationUntilStopIgnoringRubberbanding = v49;
        self->_durationUntilStop = v49;
        goto LABEL_48;
      }
      v40 = qword_1ECD7A7E0;
      if (!qword_1ECD7A7E0)
      {
        v40 = __UILogCategoryGetNode("ScrollDynamics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v40, (unint64_t *)&qword_1ECD7A7E0);
      }
      if ((*(_BYTE *)v40 & 1) == 0 || (v41 = *(NSObject **)(v40 + 8), !os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)))
      {
LABEL_48:
        -[_UIScrollDynamics setInitialVelocity:](self, "setInitialVelocity:", v29 / v37 * v39, v32 / v37 * v39);
        goto LABEL_49;
      }
      *(_WORD *)buf = 0;
      v42 = "we need to go farther than we can on the current velocity, so increase the velocity";
    }
    else
    {
      v44 = qword_1ECD7A7D8;
      if (!qword_1ECD7A7D8)
      {
        v44 = __UILogCategoryGetNode("ScrollDynamics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v44, (unint64_t *)&qword_1ECD7A7D8);
      }
      if ((*(_BYTE *)v44 & 1) == 0)
        goto LABEL_48;
      v41 = *(NSObject **)(v44 + 8);
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      *(_WORD *)buf = 0;
      v42 = "changed direction! Just calculate a new velocity";
    }
    _os_log_impl(&dword_185066000, v41, OS_LOG_TYPE_ERROR, v42, buf, 2u);
    goto LABEL_48;
  }
  v43 = qword_1ECD7A7D0;
  if (!qword_1ECD7A7D0)
  {
    v43 = __UILogCategoryGetNode("ScrollDynamics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v43, (unint64_t *)&qword_1ECD7A7D0);
  }
  if ((*(_BYTE *)v43 & 1) != 0)
  {
    v62 = *(NSObject **)(v43 + 8);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v62, OS_LOG_TYPE_ERROR, "Already at destination, just stop", buf, 2u);
    }
  }
  self->_durationUntilStopIgnoringRubberbanding = 0.0;
  self->_durationUntilStop = 0.0;
LABEL_49:
  _catesCalculateCachedProperties(self);
  v50 = qword_1ECD7A7F8;
  if (!qword_1ECD7A7F8)
  {
    v50 = __UILogCategoryGetNode("ScrollDynamics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v50, (unint64_t *)&qword_1ECD7A7F8);
  }
  if ((*(_BYTE *)v50 & 1) != 0)
  {
    v59 = *(NSObject **)(v50 + 8);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      durationUntilStop = self->_durationUntilStop;
      v61 = self->_decelerationRate;
      *(_DWORD *)buf = 134218752;
      v69 = durationUntilStop;
      v70 = 2048;
      v71 = *(_UIScrollDynamicsiOSMac **)&v61;
      v72 = 2048;
      v73 = v35;
      v74 = 2048;
      v75 = v37;
      _os_log_impl(&dword_185066000, v59, OS_LOG_TYPE_ERROR, "t:%.3f d:%.3f oDelta:%0.1f nDelta:%0.1f", buf, 0x2Au);
    }
  }
}

- (double)durationUntilStop
{
  return self->_durationUntilStop;
}

- (double)speedAfterDuration:(double)a3
{
  double v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  long double v12;
  double v13;
  double v14;
  double v15;

  if (-[_UIScrollDynamicsiOSMac isRubberBandingAfterDuration:](self, "isRubberBandingAfterDuration:"))
  {
    v15 = a3 - self->_durationUntilRubberband;
    v14 = exp(v15 * -20.0 / 1.6);
    v5 = exp((v15 + 0.001) * -20.0 / 1.6);
    v6 = vminnmq_f64((float64x2_t)self->_initialRubberbandingVelocity, (float64x2_t)vdupq_n_s64(0x40D3880000000000uLL));
    v7 = (float64x2_t)vdupq_n_s64(0xC0D3880000000000);
    v8 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v7, v6), (int8x16_t)v7, (int8x16_t)v6);
    v9 = (float64x2_t)vdupq_n_s64(0x3FD3D70A3D70A3D7uLL);
    v10 = vsubq_f64(vmulq_n_f64(vsubq_f64((float64x2_t)self->_initialRubberbandingOrigin, vmulq_f64(vmulq_n_f64(v8, v15 + 0.001), v9)), v5), vmulq_n_f64(vsubq_f64((float64x2_t)self->_initialRubberbandingOrigin, vmulq_f64(vmulq_n_f64(v8, v15), v9)), v14));
    return sqrt(vaddvq_f64(vmulq_f64(v10, v10))) / 0.001;
  }
  else
  {
    v12 = self->_durationUntilStopIgnoringRubberbanding - a3;
    v13 = self->_decelerationRate * 4.0;
    return pow(v12, 3.0) * v13;
  }
}

- (CGVector)velocityAfterDuration:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGVector result;

  -[_UIScrollDynamicsiOSMac speedAfterDuration:](self, "speedAfterDuration:", a3);
  v5 = v4;
  -[_UIScrollDynamics initialContentOffset](self, "initialContentOffset");
  v7 = v6;
  v9 = v8;
  -[_UIScrollDynamics decelerationTarget](self, "decelerationTarget");
  v11 = v10 - v7;
  v13 = v12 - v9;
  v14 = sqrt(v11 * v11 + v13 * v13);
  v15 = v5 * (v11 / v14);
  v16 = v5 * (v13 / v14);
  result.dy = v16;
  result.dx = v15;
  return result;
}

- (CGPoint)positionAfterDuration:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double durationUntilRubberband;
  _BOOL4 v14;
  double v15;
  unint64_t rubberBandingAxis;
  _BOOL4 v17;
  double x;
  double dx;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  double y;
  double dy;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double linearDisplacementIgnoringRubberbanding;
  long double v34;
  double decelerationRate;
  double v36;
  _BOOL4 v37;
  double v38;
  double v39;
  double v40;
  _BOOL4 v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGPoint result;

  -[_UIScrollDynamics initialContentOffset](self, "initialContentOffset");
  v6 = v5;
  v8 = v7;
  -[_UIScrollDynamics decelerationTarget](self, "decelerationTarget");
  v10 = v9;
  v12 = v11;
  durationUntilRubberband = self->_durationUntilRubberband;
  v14 = durationUntilRubberband <= a3 && durationUntilRubberband >= 0.0;
  if (v14)
  {
    v15 = a3 - durationUntilRubberband;
    rubberBandingAxis = self->_rubberBandingAxis;
    if (rubberBandingAxis == 2)
    {
      v25 = -[_UIScrollDynamics shouldRoundCalculations](self, "shouldRoundCalculations");
      y = self->_initialRubberbandingOrigin.y;
      dy = self->_initialRubberbandingVelocity.dy;
      v28 = exp(v15 * -20.0 / 1.6);
      v29 = fmin(dy, 20000.0);
      if (v29 < -20000.0)
        v29 = -20000.0;
      v30 = v28 * (v15 * v29 * -0.31 - y);
      if (v25)
      {
        v31 = ceil(v30 + -0.5);
        v32 = floor(v30 + 0.5);
        if (v30 <= 0.0)
          v30 = v32;
        else
          v30 = v31;
      }
      v12 = v12 - v30;
    }
    else if (rubberBandingAxis == 1)
    {
      v17 = -[_UIScrollDynamics shouldRoundCalculations](self, "shouldRoundCalculations");
      x = self->_initialRubberbandingOrigin.x;
      dx = self->_initialRubberbandingVelocity.dx;
      v20 = exp(v15 * -20.0 / 1.6);
      v21 = fmin(dx, 20000.0);
      if (v21 < -20000.0)
        v21 = -20000.0;
      v22 = v20 * (v15 * v21 * -0.31 - x);
      if (v17)
      {
        v23 = ceil(v22 + -0.5);
        v24 = floor(v22 + 0.5);
        if (v22 <= 0.0)
          v22 = v24;
        else
          v22 = v23;
      }
      v10 = v10 - v22;
    }
  }
  linearDisplacementIgnoringRubberbanding = self->_linearDisplacementIgnoringRubberbanding;
  if (linearDisplacementIgnoringRubberbanding <= 0.0)
  {
    v12 = v8;
    v10 = v6;
  }
  else
  {
    v34 = fmax(self->_durationUntilStopIgnoringRubberbanding - a3, 0.0);
    decelerationRate = self->_decelerationRate;
    v36 = (linearDisplacementIgnoringRubberbanding - decelerationRate * pow(v34, 4.0))
        / linearDisplacementIgnoringRubberbanding;
    if (v14 && self->_rubberBandingAxis == 1)
      goto LABEL_30;
    v37 = -[_UIScrollDynamics shouldRoundCalculations](self, "shouldRoundCalculations");
    v38 = v36 * (self->_destinationIgnoringRubberbanding.x - v6);
    if (v37)
    {
      v39 = ceil(v38 + -0.5);
      v40 = floor(v38 + 0.5);
      if (v38 <= 0.0)
        v38 = v40;
      else
        v38 = v39;
    }
    v10 = v6 + v38;
    if (!v14 || self->_rubberBandingAxis != 2)
    {
LABEL_30:
      v41 = -[_UIScrollDynamics shouldRoundCalculations](self, "shouldRoundCalculations");
      v42 = v36 * (self->_destinationIgnoringRubberbanding.y - v8);
      if (v41)
      {
        v43 = ceil(v42 + -0.5);
        v44 = floor(v42 + 0.5);
        if (v42 <= 0.0)
          v42 = v44;
        else
          v42 = v43;
      }
      v12 = v8 + v42;
    }
  }
  v45 = v10;
  v46 = v12;
  result.y = v46;
  result.x = v45;
  return result;
}

- (BOOL)isRubberBandingAfterDuration:(double)a3
{
  double durationUntilRubberband;

  durationUntilRubberband = self->_durationUntilRubberband;
  return durationUntilRubberband <= a3 && durationUntilRubberband >= 0.0;
}

@end
