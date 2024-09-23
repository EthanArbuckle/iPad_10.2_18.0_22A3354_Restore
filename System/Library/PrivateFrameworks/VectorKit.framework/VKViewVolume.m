@implementation VKViewVolume

- (void)updateWithFrustum:(id *)a3 matrix:(const void *)a4
{
  double var4;
  double v5;
  double v6;
  double v7;
  double var3;
  double v9;
  double v10;
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
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;

  var4 = a3->var4;
  v5 = a3->var5 + a3->var5;
  v6 = -1.0 - v5;
  v7 = 1.0 - v5;
  var3 = a3->var3;
  v9 = a3->var1 * 0.5;
  v10 = a3->var2 * 0.5;
  v11 = v9 * (-1.0 - v5);
  v12 = -v10;
  v13 = -var3;
  self->_corners[0]._e[0] = v11;
  self->_corners[0]._e[1] = -v10;
  v14 = v9 * v7;
  self->_corners[0]._e[2] = -var3;
  self->_corners[1]._e[0] = v9 * v7;
  self->_corners[1]._e[1] = -v10;
  self->_corners[1]._e[2] = -var3;
  self->_corners[2]._e[0] = v11;
  self->_corners[2]._e[1] = v10;
  self->_corners[2]._e[2] = -var3;
  self->_corners[3]._e[0] = v9 * v7;
  self->_corners[3]._e[1] = v10;
  self->_corners[3]._e[2] = -var3;
  v15 = v9 * v7;
  v16 = v11;
  v17 = v10;
  if (!a3->var0)
  {
    v18 = var4 / var3 * v9;
    v17 = var4 / var3 * v10;
    v16 = v18 * v6;
    v12 = -v17;
    v15 = v18 * v7;
  }
  v19 = -var4;
  self->_corners[4]._e[0] = v16;
  self->_corners[4]._e[1] = v12;
  self->_corners[4]._e[2] = v19;
  self->_corners[5]._e[0] = v15;
  self->_corners[5]._e[1] = v12;
  self->_corners[5]._e[2] = v19;
  self->_corners[6]._e[0] = v16;
  self->_corners[6]._e[1] = v17;
  self->_corners[6]._e[2] = v19;
  self->_corners[7]._e[0] = v15;
  self->_corners[7]._e[1] = v17;
  self->_corners[7]._e[2] = v19;
  v20 = *((double *)a4 + 14) - (var3 * *((double *)a4 + 10) + v10 * *((double *)a4 + 6) - *((double *)a4 + 2) * v11);
  *(float64x2_t *)self->_corners[0]._e = vaddq_f64(vmlaq_n_f64(vnegq_f64(vmlaq_n_f64(vmulq_n_f64(*((float64x2_t *)a4 + 4), var3), *((float64x2_t *)a4 + 2), v10)), *(float64x2_t *)a4, v11), *((float64x2_t *)a4 + 6));
  self->_corners[0]._e[2] = v20;
  v21 = *((double *)a4 + 14) - (var3 * *((double *)a4 + 10) + v10 * *((double *)a4 + 6) - *((double *)a4 + 2) * v14);
  *(float64x2_t *)self->_corners[1]._e = vaddq_f64(vmlaq_n_f64(vnegq_f64(vmlaq_n_f64(vmulq_n_f64(*((float64x2_t *)a4 + 4), var3), *((float64x2_t *)a4 + 2), v10)), *(float64x2_t *)a4, v14), *((float64x2_t *)a4 + 6));
  self->_corners[1]._e[2] = v21;
  v22 = *((double *)a4 + 14) + *((double *)a4 + 2) * v11 + *((double *)a4 + 6) * v10 - var3 * *((double *)a4 + 10);
  *(float64x2_t *)self->_corners[2]._e = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)a4 + 6), *(float64x2_t *)a4, v11), *((float64x2_t *)a4 + 2), v10), *((float64x2_t *)a4 + 4), v13);
  self->_corners[2]._e[2] = v22;
  v23 = self->_corners[3]._e[0];
  v24 = self->_corners[3]._e[1];
  v25 = self->_corners[3]._e[2];
  v26 = self->_corners[4]._e[0];
  v27 = *((double *)a4 + 14) + *((double *)a4 + 2) * v23 + *((double *)a4 + 6) * v24 + *((double *)a4 + 10) * v25;
  *(float64x2_t *)self->_corners[3]._e = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)a4 + 6), *(float64x2_t *)a4, v23), *((float64x2_t *)a4 + 2), v24), *((float64x2_t *)a4 + 4), v25);
  self->_corners[3]._e[2] = v27;
  v28 = self->_corners[4]._e[1];
  v29 = self->_corners[4]._e[2];
  v30 = *((double *)a4 + 14) + *((double *)a4 + 2) * v26 + *((double *)a4 + 6) * v28 + *((double *)a4 + 10) * v29;
  *(float64x2_t *)self->_corners[4]._e = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)a4 + 6), *(float64x2_t *)a4, v26), *((float64x2_t *)a4 + 2), v28), *((float64x2_t *)a4 + 4), v29);
  self->_corners[4]._e[2] = v30;
  v31 = self->_corners[5]._e[0];
  v32 = self->_corners[5]._e[1];
  v33 = self->_corners[5]._e[2];
  v34 = self->_corners[6]._e[0];
  v35 = *((double *)a4 + 14) + *((double *)a4 + 2) * v31 + *((double *)a4 + 6) * v32 + *((double *)a4 + 10) * v33;
  *(float64x2_t *)self->_corners[5]._e = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)a4 + 6), *(float64x2_t *)a4, v31), *((float64x2_t *)a4 + 2), v32), *((float64x2_t *)a4 + 4), v33);
  self->_corners[5]._e[2] = v35;
  v36 = self->_corners[6]._e[1];
  v37 = self->_corners[6]._e[2];
  v38 = *((double *)a4 + 14) + *((double *)a4 + 2) * v34 + *((double *)a4 + 6) * v36 + *((double *)a4 + 10) * v37;
  *(float64x2_t *)self->_corners[6]._e = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)a4 + 6), *(float64x2_t *)a4, v34), *((float64x2_t *)a4 + 2), v36), *((float64x2_t *)a4 + 4), v37);
  self->_corners[6]._e[2] = v38;
  v39 = self->_corners[7]._e[0];
  v40 = self->_corners[7]._e[1];
  v41 = self->_corners[7]._e[2];
  v42 = *((double *)a4 + 14) + *((double *)a4 + 2) * v39 + *((double *)a4 + 6) * v40 + *((double *)a4 + 10) * v41;
  *(float64x2_t *)self->_corners[7]._e = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)a4 + 6), *(float64x2_t *)a4, v39), *((float64x2_t *)a4 + 2), v40), *((float64x2_t *)a4 + 4), v41);
  self->_corners[7]._e[2] = v42;
}

- (const)corners
{
  return self->_corners;
}

- (Matrix<double,)lerpPoint:(float *)a3
{
  double v3;
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
  double v17;
  double v18;
  double v19;
  Matrix<double, 3, 1> result;

  v3 = *a3;
  v4 = a3[1];
  v5 = a3[2];
  v6 = self->_corners[0]._e[0] + (self->_corners[1]._e[0] - self->_corners[0]._e[0]) * v3;
  v7 = self->_corners[0]._e[1] + (self->_corners[1]._e[1] - self->_corners[0]._e[1]) * v3;
  v8 = self->_corners[0]._e[2] + (self->_corners[1]._e[2] - self->_corners[0]._e[2]) * v3;
  v9 = self->_corners[4]._e[0] + (self->_corners[5]._e[0] - self->_corners[4]._e[0]) * v3;
  v10 = self->_corners[4]._e[1] + (self->_corners[5]._e[1] - self->_corners[4]._e[1]) * v3;
  v11 = self->_corners[4]._e[2] + (self->_corners[5]._e[2] - self->_corners[4]._e[2]) * v3;
  v12 = v6 + (self->_corners[2]._e[0] - v6 + (self->_corners[3]._e[0] - self->_corners[2]._e[0]) * v3) * v4;
  v13 = v7 + (self->_corners[2]._e[1] - v7 + (self->_corners[3]._e[1] - self->_corners[2]._e[1]) * v3) * v4;
  v14 = v8 + (self->_corners[2]._e[2] - v8 + (self->_corners[3]._e[2] - self->_corners[2]._e[2]) * v3) * v4;
  v15 = self->_corners[6]._e[1] - v10 + (self->_corners[7]._e[1] - self->_corners[6]._e[1]) * v3;
  v16 = self->_corners[6]._e[2] - v11 + (self->_corners[7]._e[2] - self->_corners[6]._e[2]) * v3;
  v17 = v12
      + (v9 - v12 + (self->_corners[6]._e[0] - v9 + (self->_corners[7]._e[0] - self->_corners[6]._e[0]) * v3) * v4) * v5;
  v18 = v13 + (v10 - v13 + v15 * v4) * v5;
  v19 = v14 + (v11 - v14 + v16 * v4) * v5;
  result._e[2] = v19;
  result._e[1] = v18;
  result._e[0] = v17;
  return result;
}

@end
