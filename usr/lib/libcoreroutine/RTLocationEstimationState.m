@implementation RTLocationEstimationState

- (RTLocationEstimationState)init
{
  RTLocationEstimationState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RTLocationEstimationState;
  result = -[RTLocationEstimationState init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)result->X = 0u;
    *(_OWORD *)&result->i = 0u;
    *(int64x2_t *)result->errPro = vdupq_n_s64(0x408F400000000000uLL);
  }
  return result;
}

- (void)updateMotionX:(double)a3 motionY:(double)a4 dt:(double)a5 error:(double)a6
{
  double v7;
  float64x2_t v8;
  int64_t v9;
  NSObject *v12;
  int64_t i;
  int v14;
  int64_t v15;
  __int16 v16;
  RTLocationEstimationState *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = self->X[1];
  self->X[0] = self->X[0] + a3;
  self->X[1] = v7 + a4;
  v8 = vsqrtq_f64(vaddq_f64((float64x2_t)vdupq_lane_s64(COERCE__INT64(a6 * a6), 0), vmulq_f64(*(float64x2_t *)self->errPro, *(float64x2_t *)self->errPro)));
  *(float64x2_t *)self->errPro = v8;
  *(float64x2_t *)self->errEst = v8;
  v9 = self->i % 100;
  if (v9 > 90 || v9 == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      i = self->i;
      v14 = 134218498;
      v15 = i;
      v16 = 2112;
      v17 = self;
      v18 = 2048;
      v19 = a6;
      _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "RTLocationSmootherKF, %lu, update motion, %@, qk, %f", (uint8_t *)&v14, 0x20u);
    }

  }
}

- (void)updateObservationX:(double)a3 observationY:(double)a4 sigmaX:(double)a5 sigmaY:(double)a6
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int64_t v16;
  NSObject *v19;
  int64_t i;
  double v21;
  double v22;
  uint8_t buf[4];
  int64_t v25;
  __int16 v26;
  RTLocationEstimationState *v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = self->errPro[0];
  v9 = self->errPro[1];
  v10 = v8 / (v8 + a5);
  v11 = v9 / (v9 + a6);
  v12 = self->X[0];
  v13 = self->X[1];
  self->X[0] = v12 + v10 * (a3 - v12);
  self->X[1] = v13 + v11 * (a4 - v13);
  v14 = v8 * (1.0 - v10);
  v15 = v9 * (1.0 - v11);
  self->errPro[0] = v14;
  self->errPro[1] = v15;
  self->errEst[0] = v14;
  self->errEst[1] = v15;
  v16 = self->i % 100;
  if (v16 > 90 || v16 == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      i = self->i;
      v21 = self->X[0];
      v22 = self->X[1];
      *(_DWORD *)buf = 134221570;
      v25 = i;
      v26 = 2112;
      v27 = self;
      v28 = 2048;
      v29 = v12;
      v30 = 2048;
      v31 = v10;
      v32 = 2048;
      v33 = a3;
      v34 = 2048;
      v35 = v21;
      v36 = 2048;
      v37 = a3 - v12;
      v38 = 2048;
      v39 = v21 - v12;
      v40 = 2048;
      v41 = v13;
      v42 = 2048;
      v43 = v11;
      v44 = 2048;
      v45 = a4;
      v46 = 2048;
      v47 = v22;
      v48 = 2048;
      v49 = a4 - v13;
      v50 = 2048;
      v51 = v22 - v13;
      v52 = 2048;
      v53 = a5;
      _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "RTLocationSmootherKF, %lu, update obs, %@, (%f+%f*%f->%f)(%f,%f), (%f+%f*%f->%f)(%f,%f), sigma, %f", buf, 0x98u);
    }

  }
}

- (void)updatePostObservationDeltaX:(double)a3 observationDeltaY:(double)a4 errProX:(double)a5 errProY:(double)a6 sigmaX:(double)a7 sigmaY:(double)a8
{
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v24;
  int64_t i;
  double v26;
  double v27;
  int v28;
  int64_t v29;
  __int16 v30;
  RTLocationEstimationState *v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v11 = a5 + a7;
  v12 = a5 / (a5 + a7);
  v13 = a6 + a8;
  v14 = a6 / (a6 + a8);
  v15 = self->errPro[0];
  v16 = self->errPro[1];
  v17 = v15 / v11;
  v18 = v16 / v13;
  v20 = self->X[0];
  v19 = self->X[1];
  self->X[0] = v20 + v17 * a3;
  self->X[1] = v19 + v18 * a4;
  v21 = (1.0 - v12) * v15;
  v22 = (1.0 - v14) * v16;
  self->errPro[0] = v21;
  self->errPro[1] = v22;
  self->errEst[0] = self->errEst[0] - v21 * v17;
  self->errEst[1] = v22 - v22 * v18;
  if (__ROR8__(0x8F5C28F5C28F5C29 * self->i + 0x51EB851EB851EB8, 2) <= 0x28F5C28F5C28F5CuLL)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      i = self->i;
      v26 = self->X[0];
      v27 = self->X[1];
      v28 = 134221058;
      v29 = i;
      v30 = 2112;
      v31 = self;
      v32 = 2048;
      v33 = a7;
      v34 = 2048;
      v35 = v20;
      v36 = 2048;
      v37 = v12;
      v38 = 2048;
      v39 = a3;
      v40 = 2048;
      v41 = v26;
      v42 = 2048;
      v43 = v26 - v20;
      v44 = 2048;
      v45 = v19;
      v46 = 2048;
      v47 = v14;
      v48 = 2048;
      v49 = a4;
      v50 = 2048;
      v51 = v27;
      v52 = 2048;
      v53 = v27 - v19;
      _os_log_debug_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_DEBUG, "RTLocationSmootherKF, %lu, update post obs, %@, sigma, %f, (%f+%f*%f->%f,%f , %f+%f*%f->%f, %f)", (uint8_t *)&v28, 0x84u);
    }

  }
}

- (double)estimateWithIndex:(unint64_t)a3
{
  return self->X[a3];
}

- (double)errorProWithIndex:(unint64_t)a3
{
  return self->errPro[a3];
}

- (double)estimatedAccuracy
{
  return sqrt(self->errEst[0] * self->errEst[0] + self->errEst[1] * self->errEst[1]);
}

- (double)timestamp
{
  return self->time;
}

- (void)setTimestamp:(double)a3
{
  self->time = a3;
}

- (int64_t)i
{
  return self->i;
}

- (void)increaseIndex
{
  ++self->i;
}

- (void)resetIndex
{
  self->i = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_opt_new();
  *((_QWORD *)result + 1) = self->i;
  *(_OWORD *)((char *)result + 24) = *(_OWORD *)self->X;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->time;
  *(_OWORD *)((char *)result + 40) = *(_OWORD *)self->errPro;
  *(_OWORD *)((char *)result + 56) = *(_OWORD *)self->errEst;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("i, %lu, t, %f, X, %f, %f, errPro, %f, %f, errEst, %f, %f"), self->i, *(_QWORD *)&self->time, *(_QWORD *)&self->X[0], *(_QWORD *)&self->X[1], *(_QWORD *)&self->errPro[0], *(_QWORD *)&self->errPro[1], *(_QWORD *)&self->errEst[0], *(_QWORD *)&self->errEst[1]);
}

@end
