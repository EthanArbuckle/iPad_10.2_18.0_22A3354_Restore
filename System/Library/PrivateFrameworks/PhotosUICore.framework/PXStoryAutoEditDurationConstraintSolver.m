@implementation PXStoryAutoEditDurationConstraintSolver

- (PXStoryAutoEditDurationConstraintSolver)init
{
  PXStoryAutoEditDurationConstraintSolver *v2;
  objc_class *v3;
  id v4;
  const char *v5;
  os_log_t v6;
  OS_os_log *log;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  vector<PFStoryDurationInfo, std::allocator<PFStoryDurationInfo>> *p_infos;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  vector<PFStoryDurationInfo, std::allocator<PFStoryDurationInfo>> *p_solveResults;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXStoryAutoEditDurationConstraintSolver;
  v2 = -[PXStoryAutoEditDurationConstraintSolver init](&v13, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    v6 = os_log_create((const char *)*MEMORY[0x1E0D744D8], v5);
    log = v2->_log;
    v2->_log = (OS_os_log *)v6;

    p_infos = &v2->_infos;
    begin = v2->_infos.__begin_;
    if (begin)
    {
      v2->_infos.__end_ = begin;
      operator delete(begin);
      p_infos->__begin_ = 0;
      v2->_infos.__end_ = 0;
      v2->_infos.__end_cap_.__value_ = 0;
    }
    p_solveResults = &v2->_solveResults;
    v10 = v2->_solveResults.__begin_;
    p_infos->__begin_ = 0;
    v2->_infos.__end_ = 0;
    v2->_infos.__end_cap_.__value_ = 0;
    if (v10)
    {
      v2->_solveResults.__end_ = v10;
      operator delete(v10);
      p_solveResults->__begin_ = 0;
      v2->_solveResults.__end_ = 0;
      v2->_solveResults.__end_cap_.__value_ = 0;
    }
    p_solveResults->__begin_ = 0;
    v2->_solveResults.__end_ = 0;
    v2->_solveResults.__end_cap_.__value_ = 0;
  }
  return v2;
}

- (unint64_t)count
{
  return 0x8E38E38E38E38E39 * ((self->_infos.__end_ - self->_infos.__begin_) >> 3);
}

- (void)addClipWithDurationInfo:(id *)a3
{
  CMTime *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v26;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var0;
  CMTime v32;
  CMTime v33;
  CMTime var1;
  uint8_t buf[16];
  CMTime time2;
  CMTime time1;

  time1 = (CMTime)a3->var0;
  v5 = (CMTime *)MEMORY[0x1E0CA2E68];
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &time2) <= 0)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "clip minimum duration should never be 0", buf, 2u);
    }

  }
  var1 = (CMTime)a3->var1;
  v33 = *v5;
  if (CMTimeCompare(&var1, &v33) <= 0)
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "clip preferred duration should never be 0", buf, 2u);
    }

  }
  v32 = (CMTime)a3->var1;
  var0 = a3->var0;
  if (CMTimeCompare(&v32, (CMTime *)&var0) < 0)
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "clip preferred duration must be >= the minimum duration", buf, 2u);
    }

  }
  end = self->_infos.__end_;
  value = self->_infos.__end_cap_.__value_;
  if (end >= value)
  {
    begin = self->_infos.__begin_;
    v16 = 0x8E38E38E38E38E39 * ((end - begin) >> 3);
    v17 = v16 + 1;
    if (v16 + 1 > 0x38E38E38E38E38ELL)
      std::vector<PXStoryAutoEditComposabilityScores>::__throw_length_error[abi:ne180100]();
    v18 = 0x8E38E38E38E38E39 * ((value - begin) >> 3);
    if (2 * v18 > v17)
      v17 = 2 * v18;
    if (v18 >= 0x1C71C71C71C71C7)
      v19 = 0x38E38E38E38E38ELL;
    else
      v19 = v17;
    if (v19)
      v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<PFStoryDurationInfo>>(v19);
    else
      v20 = 0;
    v21 = v19 + 72 * v16;
    v22 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v19 + 72 * v20);
    *(_OWORD *)v21 = *(_OWORD *)&a3->var0.var0;
    v23 = *(_OWORD *)&a3->var0.var3;
    v24 = *(_OWORD *)&a3->var1.var1;
    v25 = *(_OWORD *)&a3->var2.var0;
    *(_QWORD *)(v21 + 64) = a3->var2.var3;
    *(_OWORD *)(v21 + 32) = v24;
    *(_OWORD *)(v21 + 48) = v25;
    *(_OWORD *)(v21 + 16) = v23;
    v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v21 + 72);
    v27 = self->_infos.__begin_;
    v26 = self->_infos.__end_;
    if (v26 != v27)
    {
      do
      {
        *(_OWORD *)(v21 - 72) = *(_OWORD *)((char *)v26 - 72);
        v28 = *(_OWORD *)((char *)v26 - 56);
        v29 = *(_OWORD *)((char *)v26 - 40);
        v30 = *(_OWORD *)((char *)v26 - 24);
        *(_QWORD *)(v21 - 8) = *((_QWORD *)v26 - 1);
        *(_OWORD *)(v21 - 24) = v30;
        *(_OWORD *)(v21 - 40) = v29;
        *(_OWORD *)(v21 - 56) = v28;
        v21 -= 72;
        v26 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v26 - 72);
      }
      while (v26 != v27);
      v26 = self->_infos.__begin_;
    }
    self->_infos.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v21;
    self->_infos.__end_ = v14;
    self->_infos.__end_cap_.__value_ = v22;
    if (v26)
      operator delete(v26);
  }
  else
  {
    *(_OWORD *)end = *(_OWORD *)&a3->var0.var0;
    v11 = *(_OWORD *)&a3->var0.var3;
    v12 = *(_OWORD *)&a3->var1.var1;
    v13 = *(_OWORD *)&a3->var2.var0;
    *((_QWORD *)end + 8) = a3->var2.var3;
    *((_OWORD *)end + 2) = v12;
    *((_OWORD *)end + 3) = v13;
    *((_OWORD *)end + 1) = v11;
    v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 72);
  }
  self->_infos.__end_ = v14;
}

- (BOOL)solveForPreferredDuration:(id *)a3
{
  os_signpost_id_t v5;
  OS_os_log *v6;
  NSObject *v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 *v17;
  __int128 v18;
  __int128 v19;
  CMTimeEpoch v20;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 *v27;
  __int128 v28;
  __int128 v29;
  CMTimeEpoch v30;
  OS_os_log *v31;
  NSObject *v32;
  unint64_t v34;
  os_signpost_id_t v35;
  CMTime v36;
  CMTime v37;
  CMTime v38;
  CMTime v39;
  CMTime v40;
  CMTime v41;
  CMTime v42;
  CMTime v43;
  CMTime time;
  CMTime rhs;
  CMTime lhs;
  CMTime v47;
  CMTime v48;
  CMTime v49;
  CMTime v50;
  CMTime v51;
  CMTime v52;
  CMTime v53;
  CMTime v54;
  CMTime v55;
  CMTime v56;
  CMTime v57;
  CMTime v58;
  CMTime v59;
  CMTime v60;
  CMTime v61;
  CMTime v62;
  CMTime v63;
  CMTime v64;
  CMTime v65;
  CMTime v66;
  CMTime v67;
  CMTime v68;
  CMTime v69;
  CMTime v70;
  CMTime v71;
  CMTime v72;
  CMTime v73;
  CMTime v74;
  CMTime v75;
  CMTime time2;
  CMTime time1;
  uint8_t buf[16];
  _BYTE v79[64];

  v5 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v6 = self->_log;
  v7 = v6;
  v8 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "StoryAutoEditDurationConstraintSolverPreferred", ", buf, 2u);
  }

  std::vector<PFStoryDurationInfo>::__assign_with_size[abi:ne180100]<PFStoryDurationInfo*,PFStoryDurationInfo*>(&self->_solveResults.__begin_, (char *)self->_infos.__begin_, (char *)self->_infos.__end_, 0x8E38E38E38E38E39 * ((self->_infos.__end_ - self->_infos.__begin_) >> 3));
  *(_OWORD *)buf = 0u;
  memset(v79, 0, 56);
  SumDurations((CMTime *)buf, (CMTime *)self->_infos.__begin_, (CMTime *)self->_infos.__end_);
  *(_OWORD *)&time1.value = *(_OWORD *)buf;
  time1.epoch = *(_QWORD *)v79;
  time2 = (CMTime)*a3;
  if (CMTimeCompare(&time1, &time2) > 0)
    goto LABEL_5;
  v75 = *(CMTime *)&v79[8];
  v74 = (CMTime)*a3;
  if (CMTimeCompare(&v75, &v74) < 0)
  {
    v34 = v5 - 1;
    v35 = v5;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, 0x8E38E38E38E38E39 * ((self->_solveResults.__end_ - self->_solveResults.__begin_) >> 3));
    v73 = *(CMTime *)&v79[8];
    while (objc_msgSend(v10, "count"))
    {
      v72 = v73;
      v71 = (CMTime)*a3;
      if ((CMTimeCompare(&v72, &v71) & 0x80000000) == 0)
        break;
      memset(&v70, 0, sizeof(v70));
      v69 = *(CMTime *)&v79[32];
      v68 = v73;
      CMTimeSubtract(&v70, &v69, &v68);
      memset(&v67, 0, sizeof(v67));
      v66 = (CMTime)*a3;
      v65 = v73;
      CMTimeSubtract(&v67, &v66, &v65);
      v63 = v67;
      v62 = v70;
      CMTimeMinimum(&v64, &v63, &v62);
      v67 = v64;
      memset(&v64, 0, sizeof(v64));
      v61 = v67;
      CMTimeMultiplyByRatio(&v64, &v61, 1, objc_msgSend(v10, "count"));
      v73 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      begin = self->_solveResults.__begin_;
      if (self->_solveResults.__end_ != begin)
      {
        v22 = 0;
        v23 = 0;
        do
        {
          if (objc_msgSend(v10, "containsIndex:", v23))
          {
            memset(&v60, 0, sizeof(v60));
            v24 = (char *)begin + v22;
            v25 = *(_OWORD *)((char *)begin + v22 + 48);
            v59.epoch = *(_QWORD *)((char *)begin + v22 + 64);
            *(_OWORD *)&v59.value = v25;
            v26 = *(_OWORD *)((char *)begin + v22 + 24);
            v58.epoch = *(_QWORD *)((char *)begin + v22 + 40);
            *(_OWORD *)&v58.value = v26;
            CMTimeSubtract(&v60, &v59, &v58);
            v57 = v60;
            v56 = v64;
            v27 = (__int128 *)((char *)begin + v22 + 24);
            if (CMTimeCompare(&v57, &v56) <= 0)
            {
              *v27 = *((_OWORD *)v24 + 3);
              *((_QWORD *)v24 + 5) = *((_QWORD *)v24 + 8);
              objc_msgSend(v10, "removeIndex:", v23);
            }
            else
            {
              v28 = *v27;
              v54.epoch = *((_QWORD *)v24 + 5);
              *(_OWORD *)&v54.value = v28;
              v53 = v64;
              CMTimeAdd(&v55, &v54, &v53);
              v29 = *(_OWORD *)&v55.value;
              *((_QWORD *)v24 + 5) = v55.epoch;
              *v27 = v29;
            }
          }
          v52 = v73;
          v30 = *(_QWORD *)((char *)begin + v22 + 40);
          *(_OWORD *)&v51.value = *(_OWORD *)((char *)begin + v22 + 24);
          v51.epoch = v30;
          CMTimeAdd(&v60, &v52, &v51);
          v73 = v60;
          ++v23;
          begin = self->_solveResults.__begin_;
          v22 += 72;
        }
        while (0x8E38E38E38E38E39 * ((self->_solveResults.__end_ - begin) >> 3) > v23);
      }
    }
    goto LABEL_30;
  }
  v50 = *(CMTime *)&v79[8];
  v49 = (CMTime)*a3;
  if (CMTimeCompare(&v50, &v49) >= 1)
  {
    v34 = v5 - 1;
    v35 = v5;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, 0x8E38E38E38E38E39 * ((self->_solveResults.__end_ - self->_solveResults.__begin_) >> 3));
    v73 = *(CMTime *)&v79[8];
    while (objc_msgSend(v10, "count"))
    {
      v48 = v73;
      v47 = (CMTime)*a3;
      if (CMTimeCompare(&v48, &v47) < 1)
        break;
      memset(&v70, 0, sizeof(v70));
      lhs = v73;
      rhs = (CMTime)*a3;
      CMTimeSubtract(&v70, &lhs, &rhs);
      memset(&v67, 0, sizeof(v67));
      time = v70;
      CMTimeMultiplyByRatio(&v67, &time, 1, objc_msgSend(v10, "count"));
      v73 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      v11 = self->_solveResults.__begin_;
      if (self->_solveResults.__end_ != v11)
      {
        v12 = 0;
        v13 = 0;
        do
        {
          if (objc_msgSend(v10, "containsIndex:", v13))
          {
            v14 = (char *)v11 + v12;
            memset(&v64, 0, sizeof(v64));
            v15 = *(_OWORD *)((char *)v11 + v12 + 24);
            v43.epoch = *(_QWORD *)((char *)v11 + v12 + 40);
            *(_OWORD *)&v43.value = v15;
            v16 = *(_OWORD *)((char *)v11 + v12);
            v42.epoch = *(_QWORD *)((char *)v11 + v12 + 16);
            *(_OWORD *)&v42.value = v16;
            CMTimeSubtract(&v64, &v43, &v42);
            v41 = v64;
            v40 = v67;
            v17 = (__int128 *)((char *)v11 + v12 + 24);
            if (CMTimeCompare(&v41, &v40) <= 0)
            {
              *v17 = *(_OWORD *)v14;
              *(_QWORD *)((char *)v11 + v12 + 40) = *((_QWORD *)v14 + 2);
              objc_msgSend(v10, "removeIndex:", v13);
            }
            else
            {
              v18 = *v17;
              v39.epoch = *(_QWORD *)((char *)v11 + v12 + 40);
              *(_OWORD *)&v39.value = v18;
              v38 = v67;
              CMTimeSubtract(&v60, &v39, &v38);
              v19 = *(_OWORD *)&v60.value;
              *(_QWORD *)((char *)v11 + v12 + 40) = v60.epoch;
              *v17 = v19;
            }
          }
          v37 = v73;
          v20 = *(_QWORD *)((char *)v11 + v12 + 40);
          *(_OWORD *)&v36.value = *(_OWORD *)((char *)v11 + v12 + 24);
          v36.epoch = v20;
          CMTimeAdd(&v64, &v37, &v36);
          v73 = v64;
          ++v13;
          v11 = self->_solveResults.__begin_;
          v12 += 72;
        }
        while (v13 < 0x8E38E38E38E38E39 * ((self->_solveResults.__end_ - v11) >> 3));
      }
    }
LABEL_30:

    v9 = 1;
    v8 = v34;
    v5 = v35;
    goto LABEL_31;
  }
LABEL_5:
  v9 = 0;
LABEL_31:
  v31 = self->_log;
  v32 = v31;
  if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v31))
  {
    LOWORD(v73.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v32, OS_SIGNPOST_INTERVAL_END, v5, "StoryAutoEditDurationConstraintSolverPreferred", ", (uint8_t *)&v73, 2u);
  }

  return v9;
}

- (BOOL)solveForMaximumDuration:(id *)a3
{
  os_signpost_id_t v5;
  OS_os_log *v6;
  NSObject *v7;
  BOOL v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CMTimeEpoch v14;
  __int128 v15;
  CMTimeEpoch epoch;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CMTimeEpoch v22;
  __int128 v23;
  OS_os_log *v24;
  NSObject *v25;
  CMTime v27;
  CMTime v28;
  CMTime v29;
  CMTime v30;
  CMTime time;
  CMTime v32;
  CMTime v33;
  CMTime v34;
  CMTime v35;
  CMTime v36;
  CMTime v37;
  CMTime v38;
  CMTime rhs;
  CMTime lhs;
  CMTime v41;
  CMTime v42;
  CMTime v43;
  CMTime v44;
  CMTime v45;
  CMTime v46;
  CMTime v47;
  CMTime v48;
  CMTime v49;
  CMTime v50;
  CMTime v51;
  CMTime v52;
  CMTime v53;
  CMTime v54;
  CMTime v55;
  CMTime v56;
  CMTime v57;
  CMTime v58;
  CMTime v59;
  CMTime v60;
  CMTime v61;
  CMTime v62;
  CMTime v63;
  CMTime v64;
  CMTime time2;
  CMTime time1;
  uint8_t buf[16];
  _BYTE v68[64];

  v5 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v6 = self->_log;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "StoryAutoEditDurationConstraintSolverMax", ", buf, 2u);
  }

  std::vector<PFStoryDurationInfo>::__assign_with_size[abi:ne180100]<PFStoryDurationInfo*,PFStoryDurationInfo*>(&self->_solveResults.__begin_, (char *)self->_infos.__begin_, (char *)self->_infos.__end_, 0x8E38E38E38E38E39 * ((self->_infos.__end_ - self->_infos.__begin_) >> 3));
  *(_OWORD *)buf = 0u;
  memset(v68, 0, 56);
  SumDurations((CMTime *)buf, (CMTime *)self->_infos.__begin_, (CMTime *)self->_infos.__end_);
  time1 = *(CMTime *)&v68[32];
  time2 = (CMTime)*a3;
  if (CMTimeCompare(&time1, &time2) < 1)
    goto LABEL_14;
  *(_OWORD *)&v64.value = *(_OWORD *)buf;
  v64.epoch = *(_QWORD *)v68;
  v63 = (CMTime)*a3;
  if (CMTimeCompare(&v64, &v63) <= 0)
  {
    v62 = *(CMTime *)&v68[8];
    v61 = (CMTime)*a3;
    if (CMTimeCompare(&v62, &v61) <= 0)
    {
      memset(&v60, 0, sizeof(v60));
      v59 = *(CMTime *)&v68[32];
      v58 = *(CMTime *)&v68[8];
      CMTimeSubtract(&v60, &v59, &v58);
      memset(&v57, 0, sizeof(v57));
      v56 = *(CMTime *)&v68[32];
      v55 = (CMTime)*a3;
      CMTimeSubtract(&v57, &v56, &v55);
      begin = self->_solveResults.__begin_;
      end = self->_solveResults.__end_;
      while (begin != end)
      {
        memset(&v54, 0, sizeof(v54));
        v19 = *((_OWORD *)begin + 3);
        v53.epoch = *((_QWORD *)begin + 8);
        *(_OWORD *)&v53.value = v19;
        v20 = *(_OWORD *)((char *)begin + 24);
        v52.epoch = *((_QWORD *)begin + 5);
        *(_OWORD *)&v52.value = v20;
        CMTimeSubtract(&v54, &v53, &v52);
        memset(&v51, 0, sizeof(v51));
        v50 = v57;
        v49 = v54;
        v48 = v60;
        CMTimeMultiplyTimeByTimeRatio();
        v46 = v51;
        CMTimeConvertScale(&v47, &v46, 600, kCMTimeRoundingMethod_RoundAwayFromZero);
        v51 = v47;
        memset(&v47, 0, sizeof(v47));
        v21 = *((_OWORD *)begin + 3);
        v45.epoch = *((_QWORD *)begin + 8);
        *(_OWORD *)&v45.value = v21;
        v44 = v51;
        CMTimeSubtract(&v47, &v45, &v44);
        v42 = v47;
        v22 = *((_QWORD *)begin + 5);
        *(_OWORD *)&v41.value = *(_OWORD *)((char *)begin + 24);
        v41.epoch = v22;
        CMTimeMaximum(&v43, &v42, &v41);
        v23 = *(_OWORD *)&v43.value;
        *((_QWORD *)begin + 8) = v43.epoch;
        *((_OWORD *)begin + 3) = v23;
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 72);
      }
    }
    else
    {
      memset(&v60, 0, sizeof(v60));
      lhs = *(CMTime *)&v68[8];
      *(_OWORD *)&rhs.value = *(_OWORD *)buf;
      rhs.epoch = *(_QWORD *)v68;
      CMTimeSubtract(&v60, &lhs, &rhs);
      memset(&v57, 0, sizeof(v57));
      v38 = *(CMTime *)&v68[8];
      v37 = (CMTime)*a3;
      CMTimeSubtract(&v57, &v38, &v37);
      v9 = self->_solveResults.__begin_;
      v10 = self->_solveResults.__end_;
      while (v9 != v10)
      {
        memset(&v54, 0, sizeof(v54));
        v11 = *(_OWORD *)((char *)v9 + 24);
        v36.epoch = *((_QWORD *)v9 + 5);
        *(_OWORD *)&v36.value = v11;
        v12 = *(_OWORD *)v9;
        v35.epoch = *((_QWORD *)v9 + 2);
        *(_OWORD *)&v35.value = v12;
        CMTimeSubtract(&v54, &v36, &v35);
        memset(&v51, 0, sizeof(v51));
        v34 = v57;
        v33 = v54;
        v32 = v60;
        CMTimeMultiplyTimeByTimeRatio();
        time = v51;
        CMTimeConvertScale(&v47, &time, 600, kCMTimeRoundingMethod_RoundAwayFromZero);
        v51 = v47;
        memset(&v47, 0, sizeof(v47));
        v13 = *(_OWORD *)((char *)v9 + 24);
        v30.epoch = *((_QWORD *)v9 + 5);
        *(_OWORD *)&v30.value = v13;
        v29 = v51;
        CMTimeSubtract(&v47, &v30, &v29);
        v28 = v47;
        v14 = *((_QWORD *)v9 + 2);
        *(_OWORD *)&v27.value = *(_OWORD *)v9;
        v27.epoch = v14;
        CMTimeMaximum(&v43, &v28, &v27);
        v15 = *(_OWORD *)&v43.value;
        epoch = v43.epoch;
        *((_QWORD *)v9 + 5) = v43.epoch;
        *(_OWORD *)((char *)v9 + 24) = v15;
        *((_OWORD *)v9 + 3) = *(_OWORD *)((char *)v9 + 24);
        *((_QWORD *)v9 + 8) = epoch;
        v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v9 + 72);
      }
    }
LABEL_14:
    v8 = 1;
    goto LABEL_15;
  }
  v8 = 0;
LABEL_15:
  v24 = self->_log;
  v25 = v24;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v24))
  {
    LOWORD(v60.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v25, OS_SIGNPOST_INTERVAL_END, v5, "StoryAutoEditDurationConstraintSolverMax", ", (uint8_t *)&v60, 2u);
  }

  return v8;
}

- ($19C3178046A4CD95E25554FCB23DE520)originalDurationInfoAtIndex:(SEL)a3
{
  int64_t var3;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  int64_t v10;

  if (a4 == 0x7FFFFFFFFFFFFFFFLL
    || (var3 = self->var0.var3, 0x8E38E38E38E38E39 * ((self->var1.var0 - var3) >> 3) <= a4))
  {
    v8 = MEMORY[0x1E0CA2E68];
    v9 = *MEMORY[0x1E0CA2E68];
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E68];
    v10 = *(_QWORD *)(v8 + 16);
    retstr->var0.var3 = v10;
    *(_OWORD *)&retstr->var1.var0 = v9;
    retstr->var1.var3 = v10;
    *(_OWORD *)&retstr->var2.var0 = v9;
    retstr->var2.var3 = v10;
  }
  else
  {
    v5 = var3 + 72 * a4;
    v6 = *(_OWORD *)(v5 + 48);
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v5 + 32);
    *(_OWORD *)&retstr->var2.var0 = v6;
    retstr->var2.var3 = *(_QWORD *)(v5 + 64);
    v7 = *(_OWORD *)(v5 + 16);
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)v5;
    *(_OWORD *)&retstr->var0.var3 = v7;
  }
  return self;
}

- ($19C3178046A4CD95E25554FCB23DE520)constrainedDurationInfoAtIndex:(SEL)a3
{
  $19C3178046A4CD95E25554FCB23DE520 *v6;
  int64_t var3;
  int64_t var0;
  NSObject *v9;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  int64_t v15;
  uint8_t v16[16];

  if (a4 == 0x7FFFFFFFFFFFFFFFLL
    || (v6 = self, 0x8E38E38E38E38E39 * ((self->var1.var0 - self->var0.var3) >> 3) <= a4))
  {
    v13 = MEMORY[0x1E0CA2E68];
    v14 = *MEMORY[0x1E0CA2E68];
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E68];
    v15 = *(_QWORD *)(v13 + 16);
    retstr->var0.var3 = v15;
    *(_OWORD *)&retstr->var1.var0 = v14;
    retstr->var1.var3 = v15;
    *(_OWORD *)&retstr->var2.var0 = v14;
    retstr->var2.var3 = v15;
  }
  else
  {
    var3 = self->var1.var3;
    var0 = self->var2.var0;
    if (var3 == var0)
    {
      PXAssertGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "calling constrainedDurationInfoAtIndex: without having called solveForMaximumDuration: first", v16, 2u);
      }

      var3 = v6->var1.var3;
      var0 = v6->var2.var0;
    }
    if (var3 == var0)
      var3 = v6->var0.var3;
    v10 = var3 + 72 * a4;
    v11 = *(_OWORD *)(v10 + 48);
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v10 + 32);
    *(_OWORD *)&retstr->var2.var0 = v11;
    retstr->var2.var3 = *(_QWORD *)(v10 + 64);
    v12 = *(_OWORD *)(v10 + 16);
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)v10;
    *(_OWORD *)&retstr->var0.var3 = v12;
  }
  return self;
}

- ($336525CEFD5B2F1C5550B48E7B6054AC)originalOverallDurationInfo
{
  $336525CEFD5B2F1C5550B48E7B6054AC *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  int64_t v11;

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  SumDurations((CMTime *)&v7, (CMTime *)self->_infos.__begin_, (CMTime *)self->_infos.__end_);
  v5 = v7;
  *(_OWORD *)&retstr->var1.var0.var3 = v8;
  v6 = v10;
  *(_OWORD *)&retstr->var1.var1.var1 = v9;
  *(_OWORD *)&retstr->var1.var2.var0 = v6;
  retstr->var1.var2.var3 = v11;
  *(_OWORD *)&retstr->var1.var0.var0 = v5;
  retstr->var0 = 2;
  return result;
}

- ($336525CEFD5B2F1C5550B48E7B6054AC)constrainedOverallDurationInfo
{
  $336525CEFD5B2F1C5550B48E7B6054AC *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  int64_t v11;

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  SumDurations((CMTime *)&v7, (CMTime *)self->_solveResults.__begin_, (CMTime *)self->_solveResults.__end_);
  v5 = v7;
  *(_OWORD *)&retstr->var1.var0.var3 = v8;
  v6 = v10;
  *(_OWORD *)&retstr->var1.var1.var1 = v9;
  *(_OWORD *)&retstr->var1.var2.var0 = v6;
  retstr->var1.var2.var3 = v11;
  *(_OWORD *)&retstr->var1.var0.var0 = v5;
  retstr->var0 = 2;
  return result;
}

- (id)diagnosticSwiftCodeForDurationUnitTestNamed:(id)a3 preferredDuration:(id *)a4
{
  id v6;
  id v7;
  Float64 Seconds;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *i;
  CMTime v12;
  CMTime v13;
  CMTime v14;
  CMTime time;
  CMTime v16[3];

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  memset(v16, 0, sizeof(v16));
  SumDurations(v16, (CMTime *)self->_infos.__begin_, (CMTime *)self->_infos.__end_);
  time = *(CMTime *)a4;
  Seconds = CMTimeGetSeconds(&time);
  objc_msgSend(v7, "appendFormat:", CFSTR("func test%@PreferredDurationFromTTR() throws {\n"), v6);
  objc_msgSend(v7, "appendFormat:", CFSTR("    let solver = PXStoryAutoEditDurationConstraintSolver()\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\n"));
  begin = self->_infos.__begin_;
  for (i = self->_infos.__end_; begin != i; begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 72))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("    solver.addClip(with: PFStoryDurationInfoMake("));
    objc_msgSend(v7, "appendFormat:", CFSTR("CMTimeMake(value: %lld, timescale: %d), "), *(_QWORD *)begin, *((unsigned int *)begin + 2));
    objc_msgSend(v7, "appendFormat:", CFSTR("CMTimeMake(value: %lld, timescale: %d), "), *((_QWORD *)begin + 3), *((unsigned int *)begin + 8));
    objc_msgSend(v7, "appendFormat:", CFSTR("CMTimeMake(value: %lld, timescale: %d)))\n"), *((_QWORD *)begin + 6), *((unsigned int *)begin + 14));
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("    let originalOverall = solver.originalOverallDurationInfo\n"));
  v14 = v16[0];
  objc_msgSend(v7, "appendFormat:", CFSTR("    XCTAssertEqual(originalOverall.specificDurationInfo.minimumSeconds, %f)\n"), CMTimeGetSeconds(&v14));
  v13 = v16[1];
  objc_msgSend(v7, "appendFormat:", CFSTR("    XCTAssertEqual(originalOverall.specificDurationInfo.preferredSeconds, %f)\n"), CMTimeGetSeconds(&v13));
  v12 = v16[2];
  objc_msgSend(v7, "appendFormat:", CFSTR("    XCTAssertEqual(originalOverall.specificDurationInfo.maximumSeconds, %f)\n"), CMTimeGetSeconds(&v12));
  objc_msgSend(v7, "appendFormat:", CFSTR("\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("    solver.solve(forPreferredDuration: CMTimeMake(value: %lld, timescale: %d))\n"), a4->var0, a4->var1);
  objc_msgSend(v7, "appendFormat:", CFSTR("\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("    let constrainedOverall = solver.constrainedOverallDurationInfo\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("    XCTAssertLessThanOrEqual(constrainedOverall.specificDurationInfo.minimumSeconds, %f)\n"), *(_QWORD *)&Seconds);
  objc_msgSend(v7, "appendFormat:", CFSTR("    XCTAssertEqual(constrainedOverall.specificDurationInfo.preferredSeconds, %f)\n"), *(_QWORD *)&Seconds);
  objc_msgSend(v7, "appendFormat:", CFSTR("    XCTAssertGreaterThanOrEqual(constrainedOverall.specificDurationInfo.maximumSeconds, %f)\n"), *(_QWORD *)&Seconds);
  objc_msgSend(v7, "appendFormat:", CFSTR("    XCTFail(\"Success criteria needs to be defined\")\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("}\n"));

  return v7;
}

- (id)diagnosticSwiftCodeForDurationUnitTestNamed:(id)a3 maximumDuration:(id *)a4
{
  id v6;
  id v7;
  Float64 Seconds;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *i;
  CMTime v12;
  CMTime v13;
  CMTime v14;
  CMTime time;
  CMTime v16[3];

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  memset(v16, 0, sizeof(v16));
  SumDurations(v16, (CMTime *)self->_infos.__begin_, (CMTime *)self->_infos.__end_);
  time = *(CMTime *)a4;
  Seconds = CMTimeGetSeconds(&time);
  objc_msgSend(v7, "appendFormat:", CFSTR("func test%@MaximumDurationFromTTR() throws {\n"), v6);
  objc_msgSend(v7, "appendFormat:", CFSTR("    let solver = PXStoryAutoEditDurationConstraintSolver()\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\n"));
  begin = self->_infos.__begin_;
  for (i = self->_infos.__end_; begin != i; begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 72))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("    solver.addClip(with: PFStoryDurationInfoMake("));
    objc_msgSend(v7, "appendFormat:", CFSTR("CMTimeMake(value: %lld, timescale: %d), "), *(_QWORD *)begin, *((unsigned int *)begin + 2));
    objc_msgSend(v7, "appendFormat:", CFSTR("CMTimeMake(value: %lld, timescale: %d), "), *((_QWORD *)begin + 3), *((unsigned int *)begin + 8));
    objc_msgSend(v7, "appendFormat:", CFSTR("CMTimeMake(value: %lld, timescale: %d)))\n"), *((_QWORD *)begin + 6), *((unsigned int *)begin + 14));
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("    let originalOverall = solver.originalOverallDurationInfo\n"));
  v14 = v16[0];
  objc_msgSend(v7, "appendFormat:", CFSTR("    XCTAssertEqual(originalOverall.specificDurationInfo.minimumSeconds, %f)\n"), CMTimeGetSeconds(&v14));
  v13 = v16[1];
  objc_msgSend(v7, "appendFormat:", CFSTR("    XCTAssertEqual(originalOverall.specificDurationInfo.preferredSeconds, %f)\n"), CMTimeGetSeconds(&v13));
  v12 = v16[2];
  objc_msgSend(v7, "appendFormat:", CFSTR("    XCTAssertEqual(originalOverall.specificDurationInfo.maximumSeconds, %f)\n"), CMTimeGetSeconds(&v12));
  objc_msgSend(v7, "appendFormat:", CFSTR("\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("    solver.solve(forMaximumDuration: CMTimeMake(value: %lld, timescale: %d))\n"), a4->var0, a4->var1);
  objc_msgSend(v7, "appendFormat:", CFSTR("\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("    let constrainedOverall = solver.constrainedOverallDurationInfo\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("    XCTAssertLessThanOrEqual(constrainedOverall.specificDurationInfo.minimumSeconds, %f)\n"), *(_QWORD *)&Seconds);
  objc_msgSend(v7, "appendFormat:", CFSTR("    XCTAssertLessThanOrEqual(constrainedOverall.specificDurationInfo.preferredSeconds, %f)\n"), *(_QWORD *)&Seconds);
  objc_msgSend(v7, "appendFormat:", CFSTR("    XCTAssertEqual(constrainedOverall.specificDurationInfo.maximumSeconds, %f)\n"), *(_QWORD *)&Seconds);
  objc_msgSend(v7, "appendFormat:", CFSTR("    XCTFail(\"Success criteria needs to be defined\")\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("}\n"));

  return v7;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v4;

  begin = self->_solveResults.__begin_;
  if (begin)
  {
    self->_solveResults.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_infos.__begin_;
  if (v4)
  {
    self->_infos.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_log, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end
