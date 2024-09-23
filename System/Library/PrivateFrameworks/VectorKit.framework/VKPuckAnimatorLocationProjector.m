@implementation VKPuckAnimatorLocationProjector

- (optional<std::pair<geo::Mercator3<double>,)currentSnappedSegment
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].__engaged_;
  *(_OWORD *)&retstr->var0.__null_state_ = *(_OWORD *)&self[1].var0.__val_.second._e[1];
  *(_OWORD *)&retstr->var0.__val_.first._e[2] = v3;
  *(_OWORD *)&retstr->var0.__val_.second._e[1] = *(_OWORD *)&self[2].var0.__val_.first._e[1];
  *(double *)&retstr->__engaged_ = self[2].var0.__val_.second._e[0];
  return self;
}

- (Matrix<double,)projectedPosition
{
  double v2;
  double v3;
  double v4;
  Matrix<double, 3, 1> result;

  v2 = self->_projectedPosition._e[0];
  v3 = self->_projectedPosition._e[1];
  v4 = self->_projectedPosition._e[2];
  result._e[2] = v4;
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (BOOL)isProjectedPositionBehind
{
  return self->_isProjectedPositionBehind;
}

- (optional<double>)elevationInProjectedPostion
{
  ValueUnion value;
  uint64_t v3;
  optional<double> result;

  value = self->_elevationInProjectedPosition._value;
  v3 = *(_QWORD *)&self->_elevationInProjectedPosition._hasValue;
  result._value = value;
  result._hasValue = v3;
  return result;
}

- (void)projectFromLocation:(id)a3 routeMatch:(id)a4 speedMultiplier:(double)a5 routeLine:(id)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  __int128 v15;
  long double v16;
  long double v17;
  float64x2_t v18;
  double v24;
  double v25;
  double v26;
  double v27;
  PolylineCoordinate *v28;
  double v29;
  double v30;
  __int128 v31;
  long double v32;
  long double v33;
  float64x2_t v34;
  double v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  int BOOL;
  void *v44;
  void *v45;
  GEORouteMatch *v46;
  double v47;
  void *v48;
  uint64_t v49;
  unsigned int index;
  BOOL v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  double v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v11
    && objc_msgSend(v11, "isGoodMatch")
    && ((objc_msgSend(v11, "shouldProjectLocationAlongRoute") & 1) != 0 || self->_alwaysUseGoodRouteMatch))
  {
    objc_msgSend(v11, "locationCoordinate");
    v14 = v13;
    objc_msgSend(v11, "locationCoordinate");
    v53 = v15;
    v16 = tan(v14 * 0.00872664626 + 0.785398163);
    v17 = log(v16);
    *(_QWORD *)&v18.f64[0] = v53;
    v18.f64[1] = v17;
    __asm { FMOV            V1.2D, #0.5 }
    *(float64x2_t *)self->_projectedPosition._e = vmlaq_f64(_Q1, (float64x2_t)xmmword_19FFB32D0, v18);
    self->_projectedPosition._e[2] = 0.0;
    objc_msgSend(v11, "matchedCourse");
    self->_projectedCourse = v24;
    objc_msgSend(v10, "speed");
    v26 = v25;
    if (v10)
    {
      objc_msgSend(v10, "clientLocation");
      v27 = v63;
    }
    else
    {
      v27 = 0.0;
    }
    v41 = v26 - v27;
    if (v41 <= 6.7 || (v42 = fmin(v41, 38.0) * 0.0823045267 * (fmin(v41, 31.0) + -6.7) / a5, v42 <= 0.0))
    {
      if (!self->_projectedRouteMatch
        || !objc_msgSend(v11, "routeMatchBehind:")
        || (objc_msgSend(v11, "locationCoordinate"),
            -[GEORouteMatch locationCoordinate](self->_projectedRouteMatch, "locationCoordinate"),
            GEOCalculateDistance(),
            v47 >= 10.0))
      {
        -[VKPuckAnimatorLocationProjector setProjectedRouteMatch:](self, "setProjectedRouteMatch:", v11, v53);
      }
    }
    else
    {
      BOOL = GEOConfigGetBOOL();
      objc_msgSend(v11, "route");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "routeMatchAtDistance:from:stopAtEndOfTunnel:stopAtEndOfManeuver:date:", v11, 0, BOOL ^ 1u, 0, v42);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        if (self->_projectedRouteMatch
          && self->_routeMatch
          && (objc_msgSend(v11, "routeMatchBehind:") & 1) == 0
          && objc_msgSend(v45, "routeMatchBehind:", self->_projectedRouteMatch))
        {
          v46 = self->_projectedRouteMatch;

          v45 = v46;
        }
        -[VKPuckAnimatorLocationProjector setProjectedRouteMatch:](self, "setProjectedRouteMatch:", v45, v53);
      }
      else
      {
        -[VKPuckAnimatorLocationProjector setProjectedRouteMatch:](self, "setProjectedRouteMatch:", v11);
      }

    }
    if (GEOPolylineCoordinateIsValid())
    {
      -[VKPuckAnimatorLocationProjector projectedRouteMatch](self, "projectedRouteMatch");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "routeCoordinate");
      index = self->_maxTravelledCoordinate.index;
      v51 = index > v49
         || index == (_DWORD)v49 && self->_maxTravelledCoordinate.offset >= *((float *)&v49 + 1);
      self->_isProjectedPositionBehind = v51;

      if (self->_isProjectedPositionBehind)
        goto LABEL_40;
    }
    else
    {
      self->_isProjectedPositionBehind = 0;
    }
    -[VKPuckAnimatorLocationProjector projectedRouteMatch](self, "projectedRouteMatch", (_QWORD)v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    self->_maxTravelledCoordinate = (PolylineCoordinate)objc_msgSend(v52, "routeCoordinate");

LABEL_40:
    -[VKPuckAnimatorLocationProjector setRouteMatch:](self, "setRouteMatch:", v11, (_QWORD)v53);
    -[VKPuckAnimatorLocationProjector _updateCourseAndPositionFromRouteMatch:](self, "_updateCourseAndPositionFromRouteMatch:", v12);
    goto LABEL_41;
  }
  -[VKPuckAnimatorLocationProjector setRouteMatch:](self, "setRouteMatch:", 0);
  -[VKPuckAnimatorLocationProjector setProjectedRouteMatch:](self, "setProjectedRouteMatch:", 0);
  v28 = (PolylineCoordinate *)MEMORY[0x1E0D26A38];
  self->_maxTravelledCoordinate = (PolylineCoordinate)*MEMORY[0x1E0D26A38];
  self->_isProjectedPositionBehind = 1;
  objc_msgSend(v10, "coordinate");
  v30 = v29;
  objc_msgSend(v10, "coordinate");
  v54 = v31;
  v32 = tan(v30 * 0.00872664626 + 0.785398163);
  v33 = log(v32);
  *(_QWORD *)&v34.f64[0] = v54;
  v34.f64[1] = v33;
  __asm { FMOV            V1.2D, #0.5 }
  *(float64x2_t *)self->_projectedPosition._e = vmlaq_f64(_Q1, (float64x2_t)xmmword_19FFB32D0, v34);
  self->_projectedPosition._e[2] = 0.0;
  if (self->_elevationInProjectedPosition._value.data[0])
    self->_elevationInProjectedPosition._value.data[0] = 0;
  objc_msgSend(v10, "course", v54);
  self->_projectedCourse = v36;
  self->_projectedCoordinate = *v28;
  if (v11)
  {
    if (GEOGetVectorKitVKPuckAnimatorLocationProjectorLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKPuckAnimatorLocationProjectorLog(void)::onceToken, &__block_literal_global_27134);
    v37 = (id)GEOGetVectorKitVKPuckAnimatorLocationProjectorLog(void)::log;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v11, "locationCoordinate3D");
      v39 = v38;
      objc_msgSend(v11, "locationCoordinate3D");
      *(_DWORD *)buf = 134284289;
      v56 = v39;
      v57 = 2049;
      v58 = v40;
      v59 = 1024;
      v60 = objc_msgSend(v11, "isGoodMatch");
      v61 = 1024;
      v62 = objc_msgSend(v11, "shouldProjectLocationAlongRoute");
      _os_log_impl(&dword_19F029000, v37, OS_LOG_TYPE_INFO, "[RouteSnapping] Route was matched at %{private}f, %{private}f but was poor quality, so no snapping occurred. routeMatch.isGoodMatch %d, routeMatch.shouldProjectLocationAlongRoute %d", buf, 0x22u);
    }

  }
LABEL_41:

}

- (void)reset
{
  self->_projectedPosition._e[0] = 0.0;
  self->_projectedPosition._e[1] = 0.0;
  self->_projectedPosition._e[2] = 0.0;
  if (self->_elevationInProjectedPosition._value.data[0])
    self->_elevationInProjectedPosition._value.data[0] = 0;
  self->_projectedCourse = -1.0;
  -[VKPuckAnimatorLocationProjector setRouteMatch:](self, "setRouteMatch:", 0);
  -[VKPuckAnimatorLocationProjector setProjectedRouteMatch:](self, "setProjectedRouteMatch:", 0);
}

- (void)setRouteMatch:(id)a3
{
  objc_storeStrong((id *)&self->_routeMatch, a3);
}

- (VKPuckAnimatorLocationProjector)init
{
  VKPuckAnimatorLocationProjector *v2;
  VKPuckAnimatorLocationProjector *v3;
  VKPuckAnimatorLocationProjector *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKPuckAnimatorLocationProjector;
  v2 = -[VKPuckAnimatorLocationProjector init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VKPuckAnimatorLocationProjector reset](v2, "reset");
    v4 = v3;
  }

  return v3;
}

- (void)setProjectedRouteMatch:(id)a3
{
  objc_storeStrong((id *)&self->_projectedRouteMatch, a3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0xBF80000000000000;
  *((_BYTE *)self + 64) = 0;
  *((_BYTE *)self + 72) = 0;
  *((_BYTE *)self + 88) = 0;
  *((_BYTE *)self + 136) = 0;
  *(_QWORD *)((char *)self + 148) = 0xBF80000000000000;
  return self;
}

- (void)dealloc
{
  objc_super v3;

  -[VKPuckAnimatorLocationProjector reset](self, "reset");
  v3.receiver = self;
  v3.super_class = (Class)VKPuckAnimatorLocationProjector;
  -[VKPuckAnimatorLocationProjector dealloc](&v3, sel_dealloc);
}

- (void)_updateCourseAndPositionFromRouteMatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  __int128 v10;
  double v11;
  long double v12;
  long double v13;
  float64x2_t v14;
  double v20;
  __int128 v21;
  __int128 v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;

  v4 = a3;
  if (v4)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "enablePuckRouteLineSnapping") & 1) != 0)
    {
      objc_msgSend(v4, "snapRouteMatch:", self->_projectedRouteMatch);
    }
    else
    {
      LOBYTE(v22) = 0;
      v27 = 0;
    }

    if (v27)
    {
      *(double *)&self->_elevationInProjectedPosition._hasValue = v23;
      self->_elevationInProjectedPosition._value.data[0] = 1;
      *(_OWORD *)self->_projectedPosition._e = v22;
      self->_projectedPosition._e[2] = v23;
      if (self->_currentSnappedSegment.__engaged_)
      {
        *(_OWORD *)&self->_currentSnappedSegment.var0.__null_state_ = v24;
        *(_OWORD *)&self->_currentSnappedSegment.var0.__val_.first._e[2] = v25;
        *(_OWORD *)&self->_currentSnappedSegment.var0.__val_.second._e[1] = v26;
      }
      else
      {
        *(_OWORD *)&self->_currentSnappedSegment.var0.__null_state_ = v24;
        *(_OWORD *)&self->_currentSnappedSegment.var0.__val_.first._e[2] = v25;
        *(_OWORD *)&self->_currentSnappedSegment.var0.__val_.second._e[1] = v26;
        self->_currentSnappedSegment.__engaged_ = 1;
      }
LABEL_13:
      -[GEORouteMatch matchedCourse](self->_projectedRouteMatch, "matchedCourse", v21, (_QWORD)v22);
      self->_projectedCourse = v20;
      self->_projectedCoordinate = (PolylineCoordinate)-[GEORouteMatch routeCoordinate](self->_projectedRouteMatch, "routeCoordinate");

      return;
    }
  }
  else
  {
    LOBYTE(v22) = 0;
  }
  -[GEORouteMatch route](self->_projectedRouteMatch, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointWithAltitudeCorrectionAtRouteCoordinate:", -[GEORouteMatch routeCoordinate](self->_projectedRouteMatch, "routeCoordinate"));
  *(_QWORD *)&self->_elevationInProjectedPosition._hasValue = v7;
  self->_elevationInProjectedPosition._value.data[0] = 1;

  -[GEORouteMatch locationCoordinate](self->_projectedRouteMatch, "locationCoordinate");
  v9 = v8;
  -[GEORouteMatch locationCoordinate](self->_projectedRouteMatch, "locationCoordinate");
  v21 = v10;
  if (self->_elevationInProjectedPosition._value.data[0])
  {
    v11 = *(double *)&self->_elevationInProjectedPosition._hasValue;
    v12 = tan(v9 * 0.00872664626 + 0.785398163);
    v13 = log(v12);
    *(_QWORD *)&v14.f64[0] = v21;
    v14.f64[1] = v13;
    __asm { FMOV            V1.2D, #0.5 }
    *(float64x2_t *)self->_projectedPosition._e = vmlaq_f64(_Q1, (float64x2_t)xmmword_19FFB32D0, v14);
    self->_projectedPosition._e[2] = v11;
    if (self->_currentSnappedSegment.__engaged_)
      self->_currentSnappedSegment.__engaged_ = 0;
    goto LABEL_13;
  }
  std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)projectedLocation
{
  long double v2;
  long double v3;
  double v4;
  long double v5;
  long double v6;
  double v7;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v2 = self->_projectedPosition._e[0] * 6.28318531;
  v3 = exp(self->_projectedPosition._e[1] * 6.28318531 + -3.14159265);
  v4 = atan(v3);
  v5 = fmod(v2, 6.28318531);
  v6 = fmod(v5 + 6.28318531, 6.28318531) * 57.2957795 + -180.0;
  v7 = v4 * 114.591559 + -90.0;
  result.var1 = v6;
  result.var0 = v7;
  return result;
}

- (BOOL)projectedLocationOnRoute
{
  return self->_projectedRouteMatch != 0;
}

- (id)detailedDescription
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[VKPuckAnimatorLocationProjector description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n"), v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("_routeMatch: %@\n"), self->_routeMatch);
  objc_msgSend(v5, "appendFormat:", CFSTR("_projectedRouteMatch: %@\n"), self->_projectedRouteMatch);
  objc_msgSend(v5, "appendFormat:", CFSTR("_projectedPosition: %f, %f, %f\n"), *(_QWORD *)&self->_projectedPosition._e[0], *(_QWORD *)&self->_projectedPosition._e[1], *(_QWORD *)&self->_projectedPosition._e[2]);
  objc_msgSend(v5, "appendFormat:", CFSTR("_projectedCourse: %f\n"), *(_QWORD *)&self->_projectedCourse);
  if (self->_alwaysUseGoodRouteMatch)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("_alwaysUseGoodRouteMatch: %@"), v6);
  return v5;
}

- (GEORouteMatch)routeMatch
{
  return self->_routeMatch;
}

- (GEORouteMatch)projectedRouteMatch
{
  return self->_projectedRouteMatch;
}

- (double)projectedCourse
{
  return self->_projectedCourse;
}

- (BOOL)alwaysUseGoodRouteMatch
{
  return self->_alwaysUseGoodRouteMatch;
}

- (void)setAlwaysUseGoodRouteMatch:(BOOL)a3
{
  self->_alwaysUseGoodRouteMatch = a3;
}

- (PolylineCoordinate)projectedCoordinate
{
  return self->_projectedCoordinate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_projectedRouteMatch, 0);
  objc_storeStrong((id *)&self->_routeMatch, 0);
}

@end
