@implementation VKDrivingPolylinePath

- (VKDrivingPolylinePath)initWithOverlay:(id)a3 section:(id)a4 routeStartIndex:(unsigned int)a5 routeEndIndex:(unsigned int)a6 matchedPathSegments:(id)a7 elevationSource:(void *)a8 elevationSourceContext:(void *)a9
{
  uint64_t v11;
  uint64_t v12;
  id v15;
  id v16;
  id v17;
  VKDrivingPolylinePath *v18;
  VKDrivingPolylinePath *v19;
  VKDrivingPolylinePath *v20;
  objc_super v22;

  v11 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a5;
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)VKDrivingPolylinePath;
  v18 = -[VKPolylinePath initWithOverlay:section:routeStartIndex:routeEndIndex:matchedPathSegments:elevationSource:elevationSourceContext:](&v22, sel_initWithOverlay_section_routeStartIndex_routeEndIndex_matchedPathSegments_elevationSource_elevationSourceContext_, v15, v16, v12, v11, v17, a8, a9);
  v19 = v18;
  if (v18)
  {
    v18->super._trafficSpeed = 4;
    +[VKDrivingPolylinePath updateDistances:forPath:snap:](VKDrivingPolylinePath, "updateDistances:forPath:snap:", &v18->_distances, v18, v17 != 0);
    v20 = v19;
  }

  return v19;
}

- (float)laneHalfWidthAtIndex:(unsigned int)a3
{
  float *begin;

  begin = self->_laneHalfWidths.__begin_;
  if (begin == self->_laneHalfWidths.__end_)
    return 1.85;
  else
    return begin[a3];
}

- (void)setTrafficSpeed:(unsigned __int8)a3
{
  self->super._trafficSpeed = a3;
  self->_standardModeTraffic.blend = 0.0;
  self->_standardModeTraffic.start = a3;
  self->_standardModeTraffic.end = self->super._trafficSpeed;
}

- (const)gradientTrafficAtIndex:(unsigned int)a3
{
  GradientTraffic *begin;

  begin = self->_gradientTraffics.__begin_;
  if (a3 >= (unint64_t)(self->_gradientTraffics.__end_ - begin))
    return &self->_standardModeTraffic;
  else
    return &begin[a3];
}

- (void)assignTo:(id)a3 withSegment:(const TrafficSegment *)a4
{
  id v6;
  uint64_t var1;
  id v8;

  v6 = a3;
  if (a4)
    var1 = a4->var1;
  else
    var1 = 4;
  v8 = v6;
  -[VKDrivingPolylinePath setTrafficSpeed:](self, "setTrafficSpeed:", var1);
  objc_msgSend(v8, "addObject:", self);

}

- (void)assignPoints:(void *)a3 count:(unint64_t)a4
{
  char *begin;
  _BYTE *end;
  char **p_points;
  unint64_t v11;

  begin = (char *)self->super._points.__begin_;
  end = self->super._points.__end_;
  p_points = (char **)&self->super._points;
  v11 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 2);
  if (a4 <= v11)
  {
    if (a4 < v11)
      self->super._points.__end_ = &begin[12 * a4];
  }
  else
  {
    std::vector<gm::Matrix<float,3,1>>::__append(p_points, a4 - v11);
    begin = *p_points;
  }
  memcpy(begin, a3, 12 * a4);
}

- (void)assignPoints:(void *)a3 laneHalfWidths:(float *)a4 gradientTraffics:(GradientTraffic *)a5 polylineCoordinates:(PolylineCoordinate *)a6 count:(unint64_t)a7
{
  VKDrivingPolylinePath *v12;
  char *begin;
  _BYTE *end;
  char **p_points;
  unint64_t v17;
  void **p_begin;
  float *v19;
  float *v20;
  unint64_t v21;
  unint64_t v22;
  float *value;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  size_t v29;
  float *v30;
  unint64_t v31;
  float *v32;
  uint64_t v33;
  char *v34;
  float *v35;
  uint64_t v36;
  __int128 v37;
  int v38;
  vector<md::GradientTraffic, std::allocator<md::GradientTraffic>> *p_gradientTraffics;
  GradientTraffic *v40;
  GradientTraffic *v41;
  unint64_t v42;
  unint64_t v43;
  GradientTraffic *v44;
  uint64_t v45;
  unint64_t v46;
  BOOL v47;
  unint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  GradientTraffic *v51;
  GradientTraffic *v52;
  unint64_t v53;
  GradientTraffic *v54;
  uint64_t v55;
  _OWORD *v56;
  GradientTraffic *v57;
  uint64_t v58;
  __int128 v59;
  GradientTraffic v60;
  char *v61;
  unint64_t v62;
  char *v63;
  float *v64;
  GradientTraffic *v65;
  float *v66;
  VKDrivingPolylinePath *v67;
  PolylineCoordinate *v68;
  PolylineCoordinate *v69;
  GradientTraffic *__src;

  v12 = self;
  begin = (char *)self->super._points.__begin_;
  end = self->super._points.__end_;
  p_points = (char **)&self->super._points;
  v17 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 2);
  if (a7 <= v17)
  {
    if (a7 < v17)
      v12->super._points.__end_ = &begin[12 * a7];
  }
  else
  {
    std::vector<gm::Matrix<float,3,1>>::__append(p_points, a7 - v17);
    begin = *p_points;
  }
  __src = a5;
  memcpy(begin, a3, 12 * a7);
  if (a4)
  {
    p_begin = (void **)&v12->_laneHalfWidths.__begin_;
    v19 = v12->_laneHalfWidths.__begin_;
    v20 = v12->_laneHalfWidths.__end_;
    v21 = v20 - v19;
    v22 = a7 - v21;
    if (a7 <= v21)
    {
      if (a7 < v21)
        v12->_laneHalfWidths.__end_ = &v19[a7];
      goto LABEL_34;
    }
    value = v12->_laneHalfWidths.__end_cap_.__value_;
    if (v22 <= value - v20)
    {
      bzero(v12->_laneHalfWidths.__end_, 4 * v22);
      v12->_laneHalfWidths.__end_ = &v20[v22];
LABEL_33:
      v19 = (float *)*p_begin;
LABEL_34:
      memcpy(v19, a4, 4 * a7);
      goto LABEL_35;
    }
    v66 = a4;
    if (a7 >> 62)
      goto LABEL_65;
    v24 = (char *)value - (char *)v19;
    v25 = v24 >> 1;
    if (v24 >> 1 <= a7)
      v25 = a7;
    if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL)
      v26 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v26 = v25;
    v68 = a6;
    if (v26)
    {
      if (v26 >> 62)
        goto LABEL_66;
      v27 = (char *)operator new(4 * v26);
    }
    else
    {
      v27 = 0;
    }
    v28 = &v27[4 * v21];
    v29 = 4 * v22;
    v63 = v27;
    v64 = (float *)&v27[4 * v26];
    bzero(v28, v29);
    v30 = (float *)&v28[v29];
    if (v20 == v19)
    {
      v32 = v64;
      a4 = v66;
      goto LABEL_31;
    }
    v31 = (char *)v20 - (char *)v19 - 4;
    a4 = v66;
    if (v31 >= 0x2C)
    {
      v32 = v64;
      if ((unint64_t)((char *)v19 - v63) >= 0x20)
      {
        v33 = (v31 >> 2) + 1;
        v34 = &v63[4 * v21 - 16];
        v35 = v20 - 4;
        v36 = v33 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v37 = *(_OWORD *)v35;
          *((_OWORD *)v34 - 1) = *((_OWORD *)v35 - 1);
          *(_OWORD *)v34 = v37;
          v34 -= 32;
          v35 -= 8;
          v36 -= 8;
        }
        while (v36);
        v28 -= 4 * (v33 & 0x7FFFFFFFFFFFFFF8);
        v20 -= v33 & 0x7FFFFFFFFFFFFFF8;
        if (v33 == (v33 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_31:
          *p_begin = v28;
          v12->_laneHalfWidths.__end_ = v30;
          v12->_laneHalfWidths.__end_cap_.__value_ = v32;
          a6 = v68;
          if (v19)
            operator delete(v19);
          goto LABEL_33;
        }
      }
    }
    else
    {
      v32 = v64;
    }
    do
    {
      v38 = *((_DWORD *)v20-- - 1);
      *((_DWORD *)v28 - 1) = v38;
      v28 -= 4;
    }
    while (v20 != v19);
    goto LABEL_31;
  }
LABEL_35:
  p_gradientTraffics = &v12->_gradientTraffics;
  v40 = v12->_gradientTraffics.__begin_;
  v41 = v12->_gradientTraffics.__end_;
  v42 = v41 - v40;
  v43 = a7 - v42;
  if (a7 > v42)
  {
    v44 = v12->_gradientTraffics.__end_cap_.__value_;
    if (v43 <= v44 - v41)
    {
      bzero(v12->_gradientTraffics.__end_, 8 * v43);
      v12->_gradientTraffics.__end_ = &v41[v43];
      v54 = __src;
LABEL_59:
      v40 = p_gradientTraffics->__begin_;
      goto LABEL_60;
    }
    if (!(a7 >> 61))
    {
      v67 = v12;
      v69 = a6;
      v45 = (char *)v44 - (char *)v40;
      v46 = v45 >> 2;
      if (v45 >> 2 <= a7)
        v46 = a7;
      v47 = (unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8;
      v48 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v47)
        v48 = v46;
      if (!(v48 >> 61))
      {
        v49 = 8 * v48;
        v50 = operator new(8 * v48);
        v51 = (GradientTraffic *)&v50[8 * v42];
        v65 = (GradientTraffic *)&v50[v49];
        bzero(v51, 8 * v43);
        v52 = &v51[v43];
        if (v41 == v40)
        {
          v40 = v41;
          v12 = v67;
          v54 = __src;
          goto LABEL_57;
        }
        v53 = (char *)v41 - (char *)v40 - 8;
        v12 = v67;
        if (v53 >= 0x58)
        {
          v54 = __src;
          if ((unint64_t)((char *)v40 - v50) >= 0x20)
          {
            v55 = (v53 >> 3) + 1;
            v56 = &v50[8 * v42 - 16];
            v57 = v41 - 2;
            v58 = v55 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v59 = *(_OWORD *)&v57->blend;
              *(v56 - 1) = *(_OWORD *)&v57[-2].blend;
              *v56 = v59;
              v56 -= 2;
              v57 -= 4;
              v58 -= 4;
            }
            while (v58);
            v51 -= v55 & 0x3FFFFFFFFFFFFFFCLL;
            v41 -= v55 & 0x3FFFFFFFFFFFFFFCLL;
            if (v55 == (v55 & 0x3FFFFFFFFFFFFFFCLL))
              goto LABEL_57;
          }
        }
        else
        {
          v54 = __src;
        }
        do
        {
          v60 = v41[-1];
          --v41;
          v51[-1] = v60;
          --v51;
        }
        while (v41 != v40);
        v40 = p_gradientTraffics->__begin_;
LABEL_57:
        p_gradientTraffics->__begin_ = v51;
        p_gradientTraffics->__end_ = v52;
        p_gradientTraffics->__end_cap_.__value_ = v65;
        a6 = v69;
        if (v40)
          operator delete(v40);
        goto LABEL_59;
      }
LABEL_66:
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
LABEL_65:
    abort();
  }
  if (a7 < v42)
    v12->_gradientTraffics.__end_ = &v40[a7];
  v54 = __src;
LABEL_60:
  memcpy(v40, v54, 8 * a7);
  v61 = (char *)v12->super._polylineCoordinates.__begin_;
  v62 = ((char *)v12->super._polylineCoordinates.__end_ - v61) >> 3;
  if (a7 <= v62)
  {
    if (a7 < v62)
      v12->super._polylineCoordinates.__end_ = (PolylineCoordinate *)&v61[8 * a7];
  }
  else
  {
    std::vector<geo::PolylineCoordinate>::__append((char **)&v12->super._polylineCoordinates, a7 - v62);
    v61 = (char *)v12->super._polylineCoordinates.__begin_;
  }
  memcpy(v61, a6, 8 * a7);
}

- (void)splitGradientTrafficSegmentationAndAddTo:(id)a3 with:(void *)a4 shouldSnap:(BOOL)a5
{
  void *v6;
  float v7;
  float v8;
  float32x4_t v9;
  float32x4_t v10;
  unsigned int v11;
  unint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  VKDrivingPolylinePath *v18;
  uint64_t v19;
  double v20;
  unsigned int v21;
  float v22;
  double v23;
  double *begin;
  double v25;
  double v26;
  unint64_t v27;
  unsigned int v28;
  float *v29;
  float v30;
  uint64_t *v31;
  char v32;
  uint64_t v33;
  double v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  float v38;
  float32x4_t v39;
  float *v40;
  float v41;
  char v42;
  char v43;
  uint64_t v44;
  double *v45;
  unint64_t v46;
  double v47;
  float v48;
  double v49;
  unsigned int v50;
  float *v51;
  float v52;
  float v53;
  uint64_t *v54;
  char v55;
  char v56;
  uint64_t v57;
  double v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  float v62;
  float32x4_t v63;
  float *v64;
  float v65;
  char v66;
  char v67;
  unint64_t v68;
  char *v69;
  char *v70;
  unsigned int v71;
  float *v72;
  float v73;
  char v74;
  VKDrivingPolylinePath *v75;
  id WeakRetained;
  id v77;
  VKDrivingPolylinePath *v78;
  void *v79;
  id v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  __int32 v84;
  _QWORD v85[5];
  void *__p;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  VKDrivingPolylinePath *v98;

  v98 = self;
  v80 = a3;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "routeTrafficTransitionDistance");
  v8 = v7 * 0.5;

  v11 = 0;
  LODWORD(v12) = 0;
  v95 = 0;
  v96 = 0;
  v97 = 0;
  v92 = 0;
  v93 = 0;
  v94 = 0;
  v89 = 0;
  v90 = 0;
  v91 = 0;
  __p = 0;
  v87 = 0;
  v85[0] = &v95;
  v85[1] = &v98;
  v13 = 0.0;
  v85[2] = &v92;
  v85[3] = &v89;
  v85[4] = &__p;
  v88 = 0;
LABEL_2:
  v14 = v11;
  v15 = *(_QWORD *)a4;
  v16 = (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3;
  v17 = v16 - 1;
  v18 = v98;
  while (1)
  {
    v19 = v12;
    if (v17 <= v12)
      break;
    if (v16 <= v12)
      abort();
    v12 = (v12 + 1);
    if (v16 <= v12)
      abort();
    v20 = v13;
    v21 = *(_DWORD *)(v15 + 8 * v19);
    v13 = (double)v21;
    v22 = (float)v21;
    v23 = fmin((float)(v8 + (float)v21), (double)v21 + (double)(*(_DWORD *)(v15 + 8 * v12) - v21) * 0.5);
    begin = v98->_distances.__begin_;
    v25 = begin[v11];
    if (v25 <= v23)
    {
      v26 = fmax((float)(v22 - v8), v20 + (v13 - v20) * 0.5);
      v27 = v98->_distances.__end_ - begin;
      if (v27 > v11 && v25 < v26)
      {
        v28 = v11 + 1;
        do
        {
          v11 = v28;
          v29 = v18->_laneHalfWidths.__begin_;
          if (v29 == v18->_laneHalfWidths.__end_)
            v30 = 0.0;
          else
            v30 = v29[v14];
          v31 = (uint64_t *)((char *)v18->super._points.__begin_ + 12 * v14);
          v32 = *(_BYTE *)(v15 + 8 * v19 + 4);
          LODWORD(v83) = 0;
          BYTE4(v83) = v32;
          BYTE5(v83) = v32;
          -[VKDrivingPolylinePath splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:]::$_0::operator()((uint64_t)v85, v31, &v83, &v18->super._polylineCoordinates.__begin_[v14], v30);
          v14 = v11;
          v18 = v98;
          begin = v98->_distances.__begin_;
          v27 = v98->_distances.__end_ - begin;
          if (v27 <= v11)
            break;
          v28 = v11 + 1;
        }
        while (begin[v11] < v26);
      }
      if (v27 == v14)
        goto LABEL_34;
      if (v11)
      {
        v33 = v11 - 1;
        v34 = (v26 - begin[v33]) / (begin[v14] - begin[v33]);
        v35 = v18->super._points.__begin_;
        v36 = (uint64_t)v35 + 12 * v33;
        v37 = (uint64_t)v35 + 12 * v14;
        v9.i64[0] = *(_QWORD *)v36;
        v9.i32[2] = *(_DWORD *)(v36 + 8);
        v10.i64[0] = *(_QWORD *)v37;
        v10.i32[2] = *(_DWORD *)(v37 + 8);
        v38 = v34;
        v39 = vmlaq_n_f32(v9, vsubq_f32(v10, v9), v38);
        v84 = v39.i32[2];
        v83 = v39.i64[0];
        v40 = v18->_laneHalfWidths.__begin_;
        if (v40 == v18->_laneHalfWidths.__end_)
          v41 = 0.0;
        else
          v41 = v40[v33] + (float)((float)(v40[v14] - v40[v33]) * v38);
        v82 = -[VKDrivingPolylinePath splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:]::$_1::operator()((uint64_t)v18, (int *)&v18->super._polylineCoordinates.__begin_[v33], (int *)&v18->super._polylineCoordinates.__begin_[v14], v38);
        v42 = *(_BYTE *)(v15 + 8 * v19 + 4);
        v43 = *(_BYTE *)(v15 + 8 * v12 + 4);
        LODWORD(v81) = 0;
        BYTE4(v81) = v42;
        BYTE5(v81) = v43;
        -[VKDrivingPolylinePath splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:]::$_0::operator()((uint64_t)v85, &v83, &v81, &v82, v41);
        v18 = v98;
      }
      v79 = a4;
      v44 = v11;
      v45 = v18->_distances.__begin_;
      v46 = v18->_distances.__end_ - v45;
      if (v46 > v11)
      {
        v47 = v45[v11];
        if (v47 < v23)
        {
          v48 = v23 - v26;
          v49 = 1.0 / v48;
          v50 = v11 + 1;
          do
          {
            v11 = v50;
            v51 = v18->_laneHalfWidths.__begin_;
            if (v51 == v18->_laneHalfWidths.__end_)
              v52 = 0.0;
            else
              v52 = v51[v44];
            v53 = (v47 - v26) * v49;
            v54 = (uint64_t *)((char *)v18->super._points.__begin_ + 12 * v44);
            v55 = *(_BYTE *)(v15 + 8 * v19 + 4);
            v56 = *(_BYTE *)(v15 + 8 * v12 + 4);
            *(float *)&v83 = v53;
            BYTE4(v83) = v55;
            BYTE5(v83) = v56;
            -[VKDrivingPolylinePath splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:]::$_0::operator()((uint64_t)v85, v54, &v83, &v18->super._polylineCoordinates.__begin_[v44], v52);
            v44 = v11;
            v18 = v98;
            v45 = v98->_distances.__begin_;
            v46 = v98->_distances.__end_ - v45;
            if (v46 <= v11)
              break;
            v47 = v45[v11];
            v50 = v11 + 1;
          }
          while (v47 < v23);
        }
      }
      if (v46 == v44)
      {
LABEL_34:
        v15 = *(_QWORD *)a4;
        v16 = (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3;
        v17 = v16 - 1;
        break;
      }
      v57 = v11 - 1;
      v58 = (v23 - v45[v57]) / (v45[v44] - v45[v57]);
      v59 = v18->super._points.__begin_;
      v60 = (uint64_t)v59 + 12 * v57;
      v61 = (uint64_t)v59 + 12 * v44;
      v9.i64[0] = *(_QWORD *)v60;
      v9.i32[2] = *(_DWORD *)(v60 + 8);
      v10.i64[0] = *(_QWORD *)v61;
      v10.i32[2] = *(_DWORD *)(v61 + 8);
      v62 = v58;
      v63 = vmlaq_n_f32(v9, vsubq_f32(v10, v9), v62);
      v84 = v63.i32[2];
      v83 = v63.i64[0];
      v64 = v18->_laneHalfWidths.__begin_;
      if (v64 == v18->_laneHalfWidths.__end_)
        v65 = 0.0;
      else
        v65 = *((float *)v92 + v57) + (float)((float)(v64[v44] - *((float *)v92 + v57)) * v62);
      v82 = -[VKDrivingPolylinePath splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:]::$_1::operator()((uint64_t)v18, (int *)&v18->super._polylineCoordinates.__begin_[v57], (int *)&v18->super._polylineCoordinates.__begin_[v44], v62);
      v66 = *(_BYTE *)(v15 + 8 * v19 + 4);
      v67 = *(_BYTE *)(v15 + 8 * v12 + 4);
      LODWORD(v81) = 1065353216;
      BYTE4(v81) = v66;
      BYTE5(v81) = v67;
      -[VKDrivingPolylinePath splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:]::$_0::operator()((uint64_t)v85, &v83, &v81, &v82, v65);
      goto LABEL_2;
    }
  }
  if (v16 <= v17)
    abort();
  v68 = v11;
  v69 = (char *)v18->super._points.__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)v18->super._points.__end_ - (char *)v69) >> 2) > v11)
  {
    v70 = (char *)(v15 + 8 * v17 + 4);
    v71 = v11 + 1;
    do
    {
      v72 = v18->_laneHalfWidths.__begin_;
      if (v72 == v18->_laneHalfWidths.__end_)
        v73 = 0.0;
      else
        v73 = v72[v68];
      v74 = *v70;
      LODWORD(v83) = 0;
      BYTE4(v83) = v74;
      BYTE5(v83) = v74;
      -[VKDrivingPolylinePath splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:]::$_0::operator()((uint64_t)v85, (uint64_t *)&v69[12 * v68], &v83, &v18->super._polylineCoordinates.__begin_[v68], v73);
      v68 = v71;
      v18 = v98;
      v69 = (char *)v98->super._points.__begin_;
      ++v71;
    }
    while (0xAAAAAAAAAAAAAAABLL * (((char *)v98->super._points.__end_ - (char *)v69) >> 2) > v68);
  }
  v75 = [VKDrivingPolylinePath alloc];
  WeakRetained = objc_loadWeakRetained((id *)&v98->super._overlay);
  v77 = objc_loadWeakRetained((id *)&v98->super._section);
  v78 = -[VKPolylinePath initWithOverlay:section:matchedPathSegments:](v75, "initWithOverlay:section:matchedPathSegments:", WeakRetained, v77, v98->super._matchedPathSegments);

  -[VKPolylinePath setRouteStart:](v78, "setRouteStart:", *(_QWORD *)&v98->super._routeStart);
  -[VKPolylinePath setRouteEnd:](v78, "setRouteEnd:", *(_QWORD *)&v98->super._routeEnd);
  -[VKDrivingPolylinePath assignPoints:laneHalfWidths:gradientTraffics:polylineCoordinates:count:](v78, "assignPoints:laneHalfWidths:gradientTraffics:polylineCoordinates:count:", v79);
  objc_msgSend(v80, "addObject:", v78);

  if (__p)
  {
    v87 = __p;
    operator delete(__p);
  }
  if (v89)
  {
    v90 = v89;
    operator delete(v89);
  }
  if (v92)
  {
    v93 = v92;
    operator delete(v92);
  }
  if (v95)
  {
    v96 = v95;
    operator delete(v95);
  }

}

- (void).cxx_destruct
{
  vector<md::GradientTraffic, std::allocator<md::GradientTraffic>> *p_gradientTraffics;
  GradientTraffic *begin;
  double *v5;
  float *v6;

  p_gradientTraffics = &self->_gradientTraffics;
  begin = self->_gradientTraffics.__begin_;
  if (begin)
  {
    p_gradientTraffics->__end_ = begin;
    operator delete(begin);
  }
  v5 = self->_distances.__begin_;
  if (v5)
  {
    self->_distances.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_laneHalfWidths.__begin_;
  if (v6)
  {
    self->_laneHalfWidths.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 24) = 0;
  return self;
}

- (void)splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:
{
  char **v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  float *v26;
  float *v27;
  float *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  _BYTE *v34;
  float *v35;
  char *v36;
  unint64_t v37;
  uint64_t v38;
  _OWORD *v39;
  float *v40;
  uint64_t v41;
  __int128 v42;
  int v43;
  char **v44;
  unint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  _BYTE *v54;
  char *v55;
  unint64_t v56;
  uint64_t v57;
  _OWORD *v58;
  char *v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  _QWORD *v65;
  _QWORD *v66;
  _BYTE *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  _BYTE *v73;
  _QWORD *v74;
  unint64_t v75;
  uint64_t v76;
  _OWORD *v77;
  __int128 *v78;
  uint64_t v79;
  __int128 v80;
  uint64_t v81;

  v10 = *(char ***)a1;
  v12 = *(char **)(*(_QWORD *)a1 + 8);
  v11 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if ((unint64_t)v12 >= v11)
  {
    v15 = *v10;
    v16 = 0xAAAAAAAAAAAAAAABLL * ((v12 - *v10) >> 2);
    v17 = v16 + 1;
    if (v16 + 1 > 0x1555555555555555)
      goto LABEL_87;
    v18 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - (_QWORD)v15) >> 2);
    if (2 * v18 > v17)
      v17 = 2 * v18;
    if (v18 >= 0xAAAAAAAAAAAAAAALL)
      v19 = 0x1555555555555555;
    else
      v19 = v17;
    if (v19)
    {
      if (v19 > 0x1555555555555555)
        goto LABEL_88;
      v20 = (char *)operator new(12 * v19);
    }
    else
    {
      v20 = 0;
    }
    v21 = &v20[12 * v16];
    *(_QWORD *)v21 = *a2;
    *((_DWORD *)v21 + 2) = *((_DWORD *)a2 + 2);
    v14 = v21 + 12;
    if (v12 != v15)
    {
      do
      {
        v22 = *(_QWORD *)(v12 - 12);
        v12 -= 12;
        v23 = *((_DWORD *)v12 + 2);
        *(_QWORD *)(v21 - 12) = v22;
        v21 -= 12;
        *((_DWORD *)v21 + 2) = v23;
      }
      while (v12 != v15);
      v12 = *v10;
    }
    *v10 = v21;
    v10[1] = v14;
    v10[2] = &v20[12 * v19];
    if (v12)
      operator delete(v12);
  }
  else
  {
    v13 = *a2;
    *((_DWORD *)v12 + 2) = *((_DWORD *)a2 + 2);
    *(_QWORD *)v12 = v13;
    v14 = v12 + 12;
  }
  v10[1] = v14;
  if (*(_QWORD *)(**(_QWORD **)(a1 + 8) + 144) != *(_QWORD *)(**(_QWORD **)(a1 + 8) + 152))
  {
    v24 = *(_QWORD *)(a1 + 16);
    v26 = *(float **)(v24 + 8);
    v25 = *(_QWORD *)(v24 + 16);
    if ((unint64_t)v26 >= v25)
    {
      v28 = *(float **)v24;
      v29 = (uint64_t)v26 - *(_QWORD *)v24;
      v30 = v29 >> 2;
      v31 = (v29 >> 2) + 1;
      if (v31 >> 62)
        goto LABEL_87;
      v32 = v25 - (_QWORD)v28;
      if (v32 >> 1 > v31)
        v31 = v32 >> 1;
      if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL)
        v33 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v33 = v31;
      if (v33)
      {
        if (v33 >> 62)
          goto LABEL_88;
        v34 = operator new(4 * v33);
      }
      else
      {
        v34 = 0;
      }
      v35 = (float *)&v34[4 * v30];
      v36 = &v34[4 * v33];
      *v35 = a5;
      v27 = v35 + 1;
      if (v26 != v28)
      {
        v37 = (char *)v26 - (char *)v28 - 4;
        if (v37 < 0x2C)
          goto LABEL_91;
        if ((unint64_t)((char *)v26 - v34 - v29) < 0x20)
          goto LABEL_91;
        v38 = (v37 >> 2) + 1;
        v39 = &v34[4 * v30 - 16];
        v40 = v26 - 4;
        v41 = v38 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v42 = *(_OWORD *)v40;
          *(v39 - 1) = *((_OWORD *)v40 - 1);
          *v39 = v42;
          v39 -= 2;
          v40 -= 8;
          v41 -= 8;
        }
        while (v41);
        v35 -= v38 & 0x7FFFFFFFFFFFFFF8;
        v26 -= v38 & 0x7FFFFFFFFFFFFFF8;
        if (v38 != (v38 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_91:
          do
          {
            v43 = *((_DWORD *)v26-- - 1);
            *((_DWORD *)v35-- - 1) = v43;
          }
          while (v26 != v28);
        }
      }
      *(_QWORD *)v24 = v35;
      *(_QWORD *)(v24 + 8) = v27;
      *(_QWORD *)(v24 + 16) = v36;
      if (v28)
        operator delete(v28);
    }
    else
    {
      *v26 = a5;
      v27 = v26 + 1;
    }
    *(_QWORD *)(v24 + 8) = v27;
  }
  v44 = *(char ***)(a1 + 24);
  v46 = v44[1];
  v45 = (unint64_t)v44[2];
  if ((unint64_t)v46 >= v45)
  {
    v48 = *v44;
    v49 = v46 - *v44;
    v50 = v49 >> 3;
    v51 = (v49 >> 3) + 1;
    if (v51 >> 61)
      goto LABEL_87;
    v52 = v45 - (_QWORD)v48;
    if (v52 >> 2 > v51)
      v51 = v52 >> 2;
    if ((unint64_t)v52 >= 0x7FFFFFFFFFFFFFF8)
      v53 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v53 = v51;
    if (v53)
    {
      if (v53 >> 61)
        goto LABEL_88;
      v54 = operator new(8 * v53);
    }
    else
    {
      v54 = 0;
    }
    v55 = &v54[8 * v50];
    *(_QWORD *)v55 = *a3;
    v47 = v55 + 8;
    if (v46 != v48)
    {
      v56 = v46 - v48 - 8;
      if (v56 < 0x58)
        goto LABEL_92;
      if ((unint64_t)(v46 - &v54[v49]) < 0x20)
        goto LABEL_92;
      v57 = (v56 >> 3) + 1;
      v58 = &v54[8 * v50 - 16];
      v59 = v46 - 16;
      v60 = v57 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v61 = *(_OWORD *)v59;
        *(v58 - 1) = *((_OWORD *)v59 - 1);
        *v58 = v61;
        v58 -= 2;
        v59 -= 32;
        v60 -= 4;
      }
      while (v60);
      v55 -= 8 * (v57 & 0x3FFFFFFFFFFFFFFCLL);
      v46 -= 8 * (v57 & 0x3FFFFFFFFFFFFFFCLL);
      if (v57 != (v57 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_92:
        do
        {
          v62 = *((_QWORD *)v46 - 1);
          v46 -= 8;
          *((_QWORD *)v55 - 1) = v62;
          v55 -= 8;
        }
        while (v46 != v48);
      }
      v46 = *v44;
    }
    *v44 = v55;
    v44[1] = v47;
    v44[2] = &v54[8 * v53];
    if (v46)
      operator delete(v46);
  }
  else
  {
    *(_QWORD *)v46 = *a3;
    v47 = v46 + 8;
  }
  v44[1] = v47;
  v63 = *(_QWORD *)(a1 + 32);
  v65 = *(_QWORD **)(v63 + 8);
  v64 = *(_QWORD *)(v63 + 16);
  if ((unint64_t)v65 < v64)
  {
    *v65 = *a4;
    v66 = v65 + 1;
    goto LABEL_86;
  }
  v67 = *(_BYTE **)v63;
  v68 = (uint64_t)v65 - *(_QWORD *)v63;
  v69 = v68 >> 3;
  v70 = (v68 >> 3) + 1;
  if (v70 >> 61)
LABEL_87:
    abort();
  v71 = v64 - (_QWORD)v67;
  if (v71 >> 2 > v70)
    v70 = v71 >> 2;
  if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFF8)
    v72 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v72 = v70;
  if (!v72)
  {
    v73 = 0;
    goto LABEL_75;
  }
  if (v72 >> 61)
LABEL_88:
    std::__throw_bad_array_new_length[abi:nn180100]();
  v73 = operator new(8 * v72);
LABEL_75:
  v74 = &v73[8 * v69];
  *v74 = *a4;
  v66 = v74 + 1;
  if (v65 == (_QWORD *)v67)
  {
    v67 = v65;
  }
  else
  {
    v75 = (char *)v65 - v67 - 8;
    if (v75 < 0x58)
      goto LABEL_93;
    if ((unint64_t)((char *)v65 - &v73[v68]) < 0x20)
      goto LABEL_93;
    v76 = (v75 >> 3) + 1;
    v77 = &v73[8 * v69 - 16];
    v78 = (__int128 *)(v65 - 2);
    v79 = v76 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v80 = *v78;
      *(v77 - 1) = *(v78 - 1);
      *v77 = v80;
      v77 -= 2;
      v78 -= 2;
      v79 -= 4;
    }
    while (v79);
    v74 -= v76 & 0x3FFFFFFFFFFFFFFCLL;
    v65 -= v76 & 0x3FFFFFFFFFFFFFFCLL;
    if (v76 != (v76 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_93:
      do
      {
        v81 = *--v65;
        *--v74 = v81;
      }
      while (v65 != (_QWORD *)v67);
      v67 = *(_BYTE **)v63;
    }
  }
  *(_QWORD *)v63 = v74;
  *(_QWORD *)(v63 + 8) = v66;
  *(_QWORD *)(v63 + 16) = &v73[8 * v72];
  if (v67)
    operator delete(v67);
LABEL_86:
  *(_QWORD *)(v63 + 8) = v66;
}

- (unint64_t)splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:
{
  unsigned int v7;
  float v8;
  id WeakRetained;
  void *v10;
  void *v11;
  unsigned int v12;
  float v13;
  unsigned int v14;
  float v15;
  double v16;
  uint64_t v17;

  v7 = *a3;
  if (*a3 != *a2 || (v8 = *((float *)a2 + 1), vabds_f32(*((float *)a3 + 1), v8) >= 0.00000011921))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(WeakRetained, "composedRouteSegment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "composedRoute");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *a2;
    v13 = *((float *)a2 + 1);
    if (v13 >= 1.0)
    {
      v12 += vcvtms_u32_f32(v13);
      v13 = v13 - floorf(v13);
    }
    v14 = *a3;
    v15 = *((float *)a3 + 1);
    if (v15 >= 1.0)
    {
      v14 += vcvtms_u32_f32(v15);
      v15 = v15 - floorf(v15);
    }
    objc_msgSend(v11, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v12 | ((unint64_t)LODWORD(v13) << 32), v14 | ((unint64_t)LODWORD(v15) << 32));
    v17 = objc_msgSend(v11, "routeCoordinateForDistance:afterRouteCoordinate:", *(_QWORD *)a2, v16 * a4);
    v8 = *((float *)&v17 + 1);
    v7 = v17;
    if (*((float *)&v17 + 1) >= 1.0)
    {
      v7 = vcvtms_u32_f32(*((float *)&v17 + 1)) + v17;
      v8 = *((float *)&v17 + 1) - floorf(*((float *)&v17 + 1));
    }

  }
  return v7 | ((unint64_t)LODWORD(v8) << 32);
}

+ (void)updateDistances:(void *)a3 forPath:(id)a4 snap:(BOOL)a5
{
  _BOOL4 v5;
  _BYTE *v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  int v16;
  unint64_t v17;
  unsigned int v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  _QWORD *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  _BYTE *v42;
  _QWORD *v43;
  unint64_t v44;
  uint64_t v45;
  _OWORD *v46;
  char *v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;

  v5 = a5;
  v7 = a4;
  v7[80] = v5;
  v53 = v7;
  v8 = *((_QWORD *)v7 + 5) - *((_QWORD *)v7 + 4);
  if (v8)
  {
    v9 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 2);
    v10 = *(char **)a3;
    *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
    if (v9 > (uint64_t)(*((_QWORD *)a3 + 2) - (_QWORD)v10) >> 3)
    {
      if (v9 >> 61)
        abort();
      v11 = (char *)operator new(0x5555555555555558 * (v8 >> 2));
      *(_QWORD *)a3 = v11;
      *((_QWORD *)a3 + 1) = v11;
      *((_QWORD *)a3 + 2) = &v11[8 * v9];
      if (v10)
        operator delete(v10);
    }
    v12 = v53;
    objc_msgSend(v12, "section");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "composedRouteSegment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "composedRoute");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v54 = v14;
    if (v5)
      goto LABEL_11;
    while (objc_msgSend(v12, "pointCount") > HIDWORD(v15))
    {
      v16 = objc_msgSend(v12, "routeStart");
      v17 = objc_msgSend(v12, "routeStart");
      v18 = v16 + HIDWORD(v15);
      v19 = HIDWORD(v17);
      if (*((float *)&v17 + 1) >= 1.0)
      {
        v18 += vcvtms_u32_f32(*((float *)&v17 + 1));
        v19 = COERCE_UNSIGNED_INT(*((float *)&v17 + 1) - floorf(*((float *)&v17 + 1)));
      }
      while (1)
      {
        objc_msgSend(v55, "stepDistanceFromPoint:toPoint:", 0, v18 | (v19 << 32));
        v32 = v31;
        v34 = (char *)*((_QWORD *)a3 + 1);
        v33 = *((_QWORD *)a3 + 2);
        if ((unint64_t)v34 >= v33)
        {
          v36 = *(char **)a3;
          v37 = (uint64_t)&v34[-*(_QWORD *)a3];
          v38 = v37 >> 3;
          v39 = (v37 >> 3) + 1;
          if (v39 >> 61)
            abort();
          v40 = v33 - (_QWORD)v36;
          if (v40 >> 2 > v39)
            v39 = v40 >> 2;
          v41 = (unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v39;
          if (v41)
          {
            if (v41 >> 61)
              std::__throw_bad_array_new_length[abi:nn180100]();
            v42 = operator new(8 * v41);
          }
          else
          {
            v42 = 0;
          }
          v43 = &v42[8 * v38];
          *v43 = v32;
          v35 = v43 + 1;
          if (v34 != v36)
          {
            v44 = v34 - 8 - v36;
            if (v44 < 0x58)
              goto LABEL_51;
            if ((unint64_t)(v34 - &v42[v37]) < 0x20)
              goto LABEL_51;
            v45 = (v44 >> 3) + 1;
            v46 = &v42[8 * v38 - 16];
            v47 = v34 - 16;
            v48 = v45 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v49 = *(_OWORD *)v47;
              *(v46 - 1) = *((_OWORD *)v47 - 1);
              *v46 = v49;
              v46 -= 2;
              v47 -= 32;
              v48 -= 4;
            }
            while (v48);
            v43 -= v45 & 0x3FFFFFFFFFFFFFFCLL;
            v34 -= 8 * (v45 & 0x3FFFFFFFFFFFFFFCLL);
            if (v45 != (v45 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_51:
              do
              {
                v50 = *((_QWORD *)v34 - 1);
                v34 -= 8;
                *--v43 = v50;
              }
              while (v34 != v36);
            }
          }
          *(_QWORD *)a3 = v43;
          *((_QWORD *)a3 + 1) = v35;
          *((_QWORD *)a3 + 2) = &v42[8 * v41];
          if (v36)
            operator delete(v36);
        }
        else
        {
          *(_QWORD *)v34 = v31;
          v35 = v34 + 8;
        }
        *((_QWORD *)a3 + 1) = v35;
        if (!v5)
          break;
        objc_msgSend(v12, "matchedPathSegments");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectAtIndexedSubscript:", v15);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend(v52, "pointCount") > 1)
        {
          if ((unint64_t)(objc_msgSend(v52, "pointCount") - 1) > HIDWORD(v15))
            v15 += 0x100000000;
          else
            v15 = (v15 + 1);
        }
        else
        {
          v15 = (v15 + 1);
        }

        v14 = v54;
LABEL_11:
        objc_msgSend(v12, "matchedPathSegments");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        if (v21 <= v15)
          goto LABEL_44;
        objc_msgSend(v12, "matchedPathSegments");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count") - 1;

        if (v23 == v15)
        {
          objc_msgSend(v12, "matchedPathSegments");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", v15);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = objc_msgSend(v25, "pointCount");
          if (v26 <= HIDWORD(v15))
            goto LABEL_44;
        }
        objc_msgSend(v12, "matchedPathSegments");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndexedSubscript:", v15);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = objc_msgSend(v28, "routeCoordinateAt:", HIDWORD(v15));
        v18 = v29;
        v30 = HIDWORD(v29);

        v19 = v30;
      }
      v15 += 0x100000000;
      v14 = v54;
    }
LABEL_44:

  }
}

@end
