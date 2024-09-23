@implementation PXStoryCropQualityComposabilityScorer

- (id)diagnosticDescription
{
  id v3;
  _PXStoryAutoEditCropScoreInfo *begin;
  _PXStoryAutoEditCropScoreInfo *end;
  uint64_t v6;
  float var1;
  float var0;
  _PXStoryAutoEditCropScoreInfo *v9;
  _PXStoryAutoEditCropScoreInfo *v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendString:", CFSTR("-- Diptych Crop Score Details --\n"));
  objc_msgSend(v3, "appendString:", CFSTR("Idx\tVert.\tHoriz.\tScore\n"));
  begin = self->_scores.__begin_;
  end = self->_scores.__end_;
  if (begin != end)
  {
    v6 = 0;
    do
    {
      var1 = begin->var0.var1;
      if (var1 >= begin->var0.var0)
        var0 = begin->var0.var0;
      else
        var0 = begin->var0.var1;
      objc_msgSend(v3, "appendFormat:", CFSTR("%lu\t%0.3f\t%0.3f\t%0.3f\n"), v6++, begin->var0.var0, var1, fminf(fmaxf((float)(var0 + -0.5) * 4.0, 0.0), 1.0));
      ++begin;
    }
    while (begin != end);
  }
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  objc_msgSend(v3, "appendString:", CFSTR("-- Triptych Crop Score Details --\n"));
  objc_msgSend(v3, "appendString:", CFSTR("Idx\tVert.\tHoriz.\tScore\n"));
  v9 = self->_scores.__begin_;
  v10 = self->_scores.__end_;
  if (v9 != v10)
  {
    v11 = 0;
    do
    {
      v12 = v9->var1.var0;
      v13 = v9->var1.var1;
      if (v13 >= v12)
        v14 = v9->var1.var0;
      else
        v14 = v9->var1.var1;
      objc_msgSend(v3, "appendFormat:", CFSTR("%lu\t%0.3f\t%0.3f\t%0.3f\n"), v11++, v12, v13, fminf(fmaxf((float)(v14 + -0.5) * 4.0, 0.0), 1.0));
      ++v9;
    }
    while (v9 != v10);
  }
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  return v3;
}

- (id)computeComposabilityScoresForDisplayAssets:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  _PXStoryAutoEditCropScoreInfo *begin;
  _PXStoryAutoEditCropScoreInfo *end;
  char *v15;
  _PXStoryAutoEditCropScoreInfo *v16;
  _PXStoryAutoEditCropScoreInfo *v17;
  _PXStoryAutoEditCropScoreInfo *v18;
  uint64_t i;
  void *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  _PXStoryAutoEditCropScoreInfo *value;
  _PXStoryAutoEditCropScoreInfo *v30;
  _PXStoryAutoEditCropScoreInfo *v31;
  _PXStoryAutoEditCropScoreInfo *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  _PXStoryAutoEditCropScoreInfo *v39;
  uint64_t v40;
  uint64_t v41;
  float v42;
  float v43;
  float v44;
  float v45;
  _PXStoryAutoEditCropScoreInfo *v46;
  float var0;
  float var1;
  float v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v55;
  PXStoryComposabilityScoresMutableArray *v56;

  v5 = a3;
  v56 = -[PXStoryComposabilityScoresArray initWithCapacity:]([PXStoryComposabilityScoresMutableArray alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "autoEditDiptychCropAspectMax");
  v8 = v7;
  v55 = v6;
  objc_msgSend(v6, "autoEditTriptychCropAspectMax");
  v10 = v9;
  self->_scores.__end_ = self->_scores.__begin_;
  v11 = objc_msgSend(v5, "count");
  v12 = v11;
  begin = self->_scores.__begin_;
  if (v11 > self->_scores.__end_cap_.__value_ - begin)
  {
    if (v11 >> 60)
      std::vector<PXStoryAutoEditComposabilityScores>::__throw_length_error[abi:ne180100]();
    end = self->_scores.__end_;
    v15 = (char *)operator new(16 * v11);
    v16 = (_PXStoryAutoEditCropScoreInfo *)&v15[((char *)end - (char *)begin) & 0xFFFFFFFFFFFFFFF0];
    v17 = v16;
    if (end != begin)
    {
      v18 = (_PXStoryAutoEditCropScoreInfo *)&v15[((char *)end - (char *)begin) & 0xFFFFFFFFFFFFFFF0];
      do
      {
        v17 = v18 - 1;
        v18[-1] = end[-1];
        --end;
        --v18;
      }
      while (end != begin);
    }
    self->_scores.__begin_ = v17;
    self->_scores.__end_ = v16;
    self->_scores.__end_cap_.__value_ = (_PXStoryAutoEditCropScoreInfo *)&v15[16 * v12];
    if (begin)
      operator delete(begin);
  }
  for (i = 0; i < objc_msgSend(v5, "count"); ++i)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryCropQualityComposabilityScorer _computeCropScoreForDisplayAsset:diptychAspectRatio:triptychAspectRatio:](self, "_computeCropScoreForDisplayAsset:diptychAspectRatio:triptychAspectRatio:", v20, v8, v10);
    v25 = v21;
    v26 = v22;
    v27 = v23;
    v28 = v24;
    v30 = self->_scores.__end_;
    value = self->_scores.__end_cap_.__value_;
    if (v30 >= value)
    {
      v32 = self->_scores.__begin_;
      v33 = v30 - v32;
      v34 = v33 + 1;
      if ((unint64_t)(v33 + 1) >> 60)
        std::vector<PXStoryAutoEditComposabilityScores>::__throw_length_error[abi:ne180100]();
      v35 = (char *)value - (char *)v32;
      if (v35 >> 3 > v34)
        v34 = v35 >> 3;
      if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF0)
        v36 = 0xFFFFFFFFFFFFFFFLL;
      else
        v36 = v34;
      if (v36)
      {
        if (v36 >> 60)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v37 = (char *)operator new(16 * v36);
      }
      else
      {
        v37 = 0;
      }
      v38 = &v37[16 * v33];
      *(float *)v38 = v25;
      *((float *)v38 + 1) = v26;
      *((float *)v38 + 2) = v27;
      *((float *)v38 + 3) = v28;
      v39 = (_PXStoryAutoEditCropScoreInfo *)v38;
      if (v30 != v32)
      {
        do
        {
          v39[-1] = v30[-1];
          --v39;
          --v30;
        }
        while (v30 != v32);
        v30 = self->_scores.__begin_;
      }
      v31 = (_PXStoryAutoEditCropScoreInfo *)(v38 + 16);
      self->_scores.__begin_ = v39;
      self->_scores.__end_ = (_PXStoryAutoEditCropScoreInfo *)(v38 + 16);
      self->_scores.__end_cap_.__value_ = (_PXStoryAutoEditCropScoreInfo *)&v37[16 * v36];
      if (v30)
        operator delete(v30);
    }
    else
    {
      v30->var0.var0 = v21;
      v30->var0.var1 = v22;
      v31 = v30 + 1;
      v30->var1.var0 = v23;
      v30->var1.var1 = v24;
    }
    self->_scores.__end_ = v31;

  }
  v40 = 0;
  v41 = 0;
  v42 = 0.0;
  v43 = 0.0;
  v44 = 0.0;
  v45 = 0.0;
  while (v41 < objc_msgSend(v5, "count"))
  {
    v46 = &self->_scores.__begin_[v40];
    if (v46->var0.var1 >= v46->var0.var0)
      var0 = v46->var0.var0;
    else
      var0 = v46->var0.var1;
    var1 = v46->var1.var1;
    if (var1 >= v46->var1.var0)
      var1 = v46->var1.var0;
    v49 = fminf(fmaxf((float)(var1 + -0.5) * 4.0, 0.0), 1.0);
    if ((unint64_t)v41 >= 2)
    {
      LODWORD(v50) = cbrtf((float)(v43 * v45) * v49);
      LODWORD(v51) = sqrtf(v42 * v44);
      -[PXStoryComposabilityScoresMutableArray addComposabilityScores:](v56, "addComposabilityScores:", v51, v50);
    }
    ++v41;
    v42 = v44;
    v44 = fminf(fmaxf((float)(var0 + -0.5) * 4.0, 0.0), 1.0);
    ++v40;
    v43 = v45;
    v45 = v49;
  }
  if (objc_msgSend(v5, "count") >= 2)
  {
    *(float *)&v52 = sqrtf(v42 * v44);
    LODWORD(v53) = 0;
    -[PXStoryComposabilityScoresMutableArray addComposabilityScores:](v56, "addComposabilityScores:", v52, v53);
  }

  return v56;
}

- (_PXStoryAutoEditCropScoreInfo)_computeCropScoreForDisplayAsset:(id)a3 diptychAspectRatio:(double)a4 triptychAspectRatio:(double)a5
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double x;
  double y;
  double width;
  double height;
  double *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL IsNull;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  id v46;
  double v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  id v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  float v74;
  float v75;
  float v76;
  float v77;
  uint64_t v78;
  uint64_t v79;
  double v82;
  double v83;
  double v84;
  double v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  double v94;
  double v95;
  double v96;
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  double v100;
  __int16 v101;
  id v102;
  __int16 v103;
  double v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  double v108;
  uint64_t v109;
  _PXStoryAutoEditCropScoreInfo result;
  CGRect v111;

  v109 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "acceptableCropRect");
  v90 = v7;
  v91 = v6;
  v92 = v8;
  v10 = v9;
  objc_msgSend(v5, "preferredCropRect");
  v86 = v12;
  v87 = v11;
  v88 = v14;
  v89 = v13;
  v79 = v10;
  objc_msgSend(v5, "faceAreaRect");
  x = v111.origin.x;
  y = v111.origin.y;
  width = v111.size.width;
  height = v111.size.height;
  v19 = (double *)MEMORY[0x1E0C9D628];
  v20 = *MEMORY[0x1E0C9D628];
  v21 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v22 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v23 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  IsNull = CGRectIsNull(v111);
  v25 = 1.0 - (y + height);
  if (IsNull)
    v26 = v20;
  else
    v26 = x;
  if (IsNull)
    v25 = v21;
  v82 = v25;
  v83 = v26;
  if (IsNull)
    v27 = v22;
  else
    v27 = width;
  if (IsNull)
    v28 = v23;
  else
    v28 = height;
  v84 = v28;
  v85 = v27;
  v96 = 0.0;
  objc_msgSend(MEMORY[0x1E0D750F0], "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", objc_msgSend(v5, "pixelWidth"), objc_msgSend(v5, "pixelHeight"), &v96, a4, *v19, v19[1], v19[2], v19[3], v87, v86, v89, v88, v91, v90, v79, v92,
    *(_QWORD *)&v83,
    *(_QWORD *)&v82,
    *(_QWORD *)&v27,
    *(_QWORD *)&v28);
  v78 = v29;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v95 = 0.0;
  objc_msgSend(MEMORY[0x1E0D750F0], "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", objc_msgSend(v5, "pixelWidth"), objc_msgSend(v5, "pixelHeight"), &v95, 1.0 / a4, *v19, v19[1], v19[2], v19[3], v87, v86, v89, v88, v91, v90, v79, v92,
    *(_QWORD *)&v83,
    *(_QWORD *)&v82,
    *(_QWORD *)&v85,
    *(_QWORD *)&v84);
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  PLStoryGetLog();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "uuid");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), v31, v78, v33, v35);
    v47 = v96;
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), v37, v39, v41, v43);
    *(_DWORD *)buf = 138544642;
    v98 = v45;
    v99 = 2048;
    v100 = a4;
    v101 = 2114;
    v102 = v46;
    v103 = 2048;
    v104 = v47;
    v105 = 2114;
    v106 = v48;
    v107 = 2048;
    v108 = v95;
    _os_log_impl(&dword_1A6789000, v44, OS_LOG_TYPE_DEBUG, "best crop rect for asset %{public}@ with aspect ratio: %0.3f horizontal crop=%{public}@ score=%0.3f, vertical crop=%{public}@ score=%0.3f", buf, 0x3Eu);

  }
  v94 = 0.0;
  objc_msgSend(MEMORY[0x1E0D750F0], "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", objc_msgSend(v5, "pixelWidth"), objc_msgSend(v5, "pixelHeight"), &v94, a5, *v19, v19[1], v19[2], v19[3], v87, v86, v89, v88, v91, v90, v79, v92,
    *(_QWORD *)&v83,
    *(_QWORD *)&v82,
    *(_QWORD *)&v85,
    *(_QWORD *)&v84);
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v93 = 0.0;
  objc_msgSend(MEMORY[0x1E0D750F0], "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", objc_msgSend(v5, "pixelWidth"), objc_msgSend(v5, "pixelHeight"), &v93, 1.0 / a5, *v19, v19[1], v19[2], v19[3], v87, v86, v89, v88, v91, v90, v79, v92,
    *(_QWORD *)&v83,
    *(_QWORD *)&v82,
    *(_QWORD *)&v85,
    *(_QWORD *)&v84);
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;
  PLStoryGetLog();
  v65 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "uuid");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), v50, v52, v54, v56);
    v68 = v94;
    v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), v58, v60, v62, v64);
    *(_DWORD *)buf = 138544642;
    v98 = v66;
    v99 = 2048;
    v100 = a5;
    v101 = 2114;
    v102 = v67;
    v103 = 2048;
    v104 = v68;
    v105 = 2114;
    v106 = v69;
    v107 = 2048;
    v108 = v93;
    _os_log_impl(&dword_1A6789000, v65, OS_LOG_TYPE_DEBUG, "best crop rect for asset %{public}@ with aspect ratio: %0.3f horizontal crop=%{public}@ score=%0.3f, vertical crop=%{public}@ score=%0.3f", buf, 0x3Eu);

  }
  v71 = v94;
  v70 = v95;
  v72 = v96;
  v73 = v93;

  v74 = v70;
  v75 = v72;
  v76 = v73;
  v77 = v71;
  result.var1.var1 = v77;
  result.var1.var0 = v76;
  result.var0.var1 = v75;
  result.var0.var0 = v74;
  return result;
}

- (void).cxx_destruct
{
  _PXStoryAutoEditCropScoreInfo *begin;

  begin = self->_scores.__begin_;
  if (begin)
  {
    self->_scores.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
