@implementation VKTransitStationPolylinePath

- (VKTransitStationPolylinePath)initWithOverlay:(id)a3 section:(id)a4 points:(void *)a5 pointCount:(unint64_t)a6 routeStartIndex:(unsigned int)a7 routeEndIndex:(unsigned int)a8
{
  id v14;
  id v15;
  NSArray *matchedPathSegments;
  VKTransitStationPolylinePath *v17;
  VKTransitStationPolylinePath *v18;
  char *begin;
  float **p_points;
  unint64_t v21;
  float *v22;
  unint64_t v23;
  float *v24;
  unint64_t v25;
  BOOL v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  float *v30;
  BOOL v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  float *v36;
  BOOL v37;
  BOOL v38;
  BOOL v39;
  BOOL v40;
  int32x4_t v42;
  int32x4_t v43;
  __int128 v44;
  int32x4_t v45;
  const float *v46;
  float *v47;
  float *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t *v51;
  float *v52;
  int v53;
  float *v54;
  uint64_t v55;
  VKTransitStationPolylinePath *v56;
  objc_super v58;
  float32x4x2_t v59;
  float32x4x2_t v60;

  v14 = a3;
  v15 = a4;
  matchedPathSegments = self->super._matchedPathSegments;
  v58.receiver = self;
  v58.super_class = (Class)VKTransitStationPolylinePath;
  v17 = -[VKPolylinePath initWithOverlay:section:matchedPathSegments:](&v58, sel_initWithOverlay_section_matchedPathSegments_, v14, v15, matchedPathSegments);
  v18 = v17;
  if (v17)
  {
    p_points = (float **)&v17->super._points;
    begin = (char *)v17->super._points.__begin_;
    v17->super._routeStart.index = a7;
    v17->super._routeStart.offset = 0.0;
    v17->super._routeEnd.index = a8;
    v17->super._routeEnd.offset = 0.0;
    v21 = 0xAAAAAAAAAAAAAAABLL * (((char *)v17->super._points.__end_ - (char *)begin) >> 2);
    if (a6 <= v21)
    {
      if (a6 < v21)
        v17->super._points.__end_ = &begin[12 * a6];
    }
    else
    {
      std::vector<gm::Matrix<float,3,1>>::__append((char **)&v17->super._points, a6 - v21);
    }
    v22 = (float *)v18->super._polylineCoordinates.__begin_;
    v23 = ((char *)v18->super._polylineCoordinates.__end_ - (char *)v22) >> 3;
    if (a6 <= v23)
    {
      if (a6 < v23)
        v18->super._polylineCoordinates.__end_ = (PolylineCoordinate *)&v22[2 * a6];
      if (!a6)
        goto LABEL_46;
    }
    else
    {
      std::vector<geo::PolylineCoordinate>::__append((char **)&v18->super._polylineCoordinates, a6 - v23);
      v22 = (float *)v18->super._polylineCoordinates.__begin_;
    }
    v24 = *p_points;
    if (a6 > 0x13)
    {
      v25 = 0;
      v26 = !is_mul_ok(a6 - 1, 0xCuLL);
      v27 = 3 * (a6 - 1);
      v28 = (unint64_t)&v24[v27 + 1];
      v29 = (unint64_t)&v24[v27 + 2];
      v30 = &v24[v27];
      v32 = v29 >= (unint64_t)(v24 + 2) && v28 >= (unint64_t)(v24 + 1) && v30 >= v24;
      if (v32 && !v26)
      {
        v25 = 0;
        v33 = (unint64_t)&v24[3 * a6];
        v34 = (unint64_t)(v22 + 1);
        v35 = (unint64_t)&v22[2 * a6];
        v36 = (float *)((char *)a5 + 8 * a6);
        v37 = v24 < v36 && v33 > (unint64_t)a5;
        v38 = v37;
        v39 = v34 < (unint64_t)v36 && v35 > (unint64_t)a5;
        v40 = v39;
        if ((v34 >= v33 || (unint64_t)v24 >= v35) && !v38 && !v40)
        {
          v25 = a6 & 0xFFFFFFFFFFFFFFFCLL;
          v42 = (int32x4_t)xmmword_19FFB2E90;
          v43 = vdupq_n_s32(a7);
          v44 = 0uLL;
          v45.i64[0] = 0x400000004;
          v45.i64[1] = 0x400000004;
          v46 = (const float *)a5;
          v47 = *p_points;
          v48 = v22;
          v49 = a6 & 0xFFFFFFFFFFFFFFFCLL;
          do
          {
            v59 = vld2q_f32(v46);
            v46 += 8;
            vst3q_f32(v47, *(float32x4x3_t *)(&v44 - 2));
            v47 += 12;
            v60.val[0] = (float32x4_t)vaddq_s32(v42, v43);
            v60.val[1] = 0uLL;
            v42 = vaddq_s32(v42, v45);
            vst2q_f32(v48, v60);
            v48 += 8;
            v49 -= 4;
          }
          while (v49);
          if (v25 == a6)
            goto LABEL_46;
        }
      }
    }
    else
    {
      v25 = 0;
    }
    v50 = a6 - v25;
    v51 = (uint64_t *)((char *)a5 + 8 * v25);
    v52 = &v22[2 * v25 + 1];
    v53 = a7 + v25;
    v54 = &v24[3 * v25 + 2];
    do
    {
      v55 = *v51++;
      *((_QWORD *)v54 - 1) = v55;
      *v54 = 0.0;
      v54 += 3;
      *((_DWORD *)v52 - 1) = v53;
      *v52 = 0.0;
      v52 += 2;
      ++v53;
      --v50;
    }
    while (v50);
LABEL_46:
    v56 = v18;
  }

  return v18;
}

@end
