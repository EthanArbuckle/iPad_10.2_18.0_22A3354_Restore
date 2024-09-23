@implementation IPAStraightenOperator

- (id)transformForGeometry:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double zAngle;
  IPAImageGeometry *v8;
  __int128 v9;
  float64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  IPAImageGeometry *v20;
  double v21;
  IPAImageGeometry *v22;
  IPAAffineImageTransform *v23;
  id result;
  __int128 v25;
  _QWORD v26[3];
  _BYTE v27[48];
  __int128 v28;
  float64x2_t v29;
  __int128 v30;
  float64x2_t v31;
  __int128 v32;
  float64x2_t v33[4];
  _BYTE v34[48];
  __int128 v35;
  float64x2_t v36;
  _BYTE v37[48];

  v4 = a3;
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EFECC400) & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    zAngle = self->_zAngle;
    if (zAngle == 0.0)
    {
      memset(&v34[8], 0, 32);
      v35 = 0u;
      v36 = 0u;
      memset(&v37[8], 0, 32);
      *(_QWORD *)v34 = 0x3FF0000000000000;
      *(_QWORD *)&v34[40] = 0x3FF0000000000000;
      *(_QWORD *)v37 = 0x3FF0000000000000;
      *(_QWORD *)&v37[40] = 0x3FF0000000000000;
      v8 = (IPAImageGeometry *)v5;
    }
    else
    {
      if (v5)
        objc_msgSend(v5, "imageQuad");
      else
        memset(v33, 0, sizeof(v33));
      *(_QWORD *)&v9 = PA::Quad2d::areaCenter(v33);
      v11 = v10;
      v26[2] = 0x3FF0000000000000;
      *(_QWORD *)v27 = 0x3FF0000000000000;
      memset(&v27[8], 0, 32);
      *(_QWORD *)&v27[40] = 0x3FF0000000000000;
      v28 = 0u;
      v29 = 0u;
      v30 = xmmword_1D4CCD0F0;
      *(_QWORD *)&v31.f64[0] = v9;
      v31.f64[1] = v10;
      v32 = xmmword_1D4CCD100;
      v26[0] = 0;
      v26[1] = 0;
      v25 = v9;
      PA::Matrix4d::rotateAxis((__int128 *)v27, (uint64_t)v26, self->_zAngle);
      v31 = vaddq_f64(v31, vmlaq_f64(vmlsq_lane_f64(vmulq_n_f64(*(float64x2_t *)&v27[32], -v11), *(float64x2_t *)v27, *(double *)&v25, 0), (float64x2_t)0, v29));
      *(double *)&v32 = *(double *)&v32
                      + -(v11 * *(double *)&v28)
                      - *(double *)&v27[16] * *(double *)&v25
                      + *(double *)&v30 * 0.0;
      v36 = v29;
      *(_OWORD *)v37 = v30;
      *(_OWORD *)v34 = *(_OWORD *)v27;
      *(_OWORD *)&v34[16] = *(_OWORD *)&v27[16];
      *(_OWORD *)&v34[32] = *(_OWORD *)&v27[32];
      v35 = v28;
      *(float64x2_t *)&v37[16] = v31;
      *(_OWORD *)&v37[32] = v32;
      PA::operator*((uint64_t)v27, (double *)v34, (__int128 *)v33);
      objc_msgSend(v6, "domain");
      v13 = v12;
      v15 = v14;
      PA::Quad2d::boundingRect((float64x2_t *)v27);
      v17 = v16;
      v19 = v18;
      v20 = [IPAImageGeometry alloc];
      v21 = v13 / v17;
      if (v15 / v19 < v13 / v17)
        v21 = v15 / v19;
      v8 = -[IPAImageGeometry initWithIdentifier:extent:imageQuad:](v20, "initWithIdentifier:extent:imageQuad:", CFSTR("straightened"), v27, (v13 - v13 * v21) * 0.5, (v15 - v15 * v21) * 0.5, v25);
    }
    v22 = v8;
    v23 = -[IPAAffineImageTransform initWithInputGeometry:intrinsicGeometry:matrix:canAlignToPixelsExactly:]([IPAAffineImageTransform alloc], "initWithInputGeometry:intrinsicGeometry:matrix:canAlignToPixelsExactly:", v6, v8, v34, zAngle == 0.0);

    return v23;
  }
  else
  {
    result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@.%p zAngle:%f>"), v5, self, *(_QWORD *)&self->_zAngle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)operatorWithAngleZ:(double)a3
{
  return (id)objc_msgSend(a1, "operatorWithIdentifier:angleZ:", CFSTR("straighten"), a3);
}

+ (id)operatorWithIdentifier:(id)a3 angleZ:(double)a4
{
  id v5;
  IPAStraightenOperator *v6;
  IPAStraightenOperator *v7;
  double v8;
  id result;

  v5 = a3;
  if (a4 < -0.785398163 || a4 > 0.785398163)
  {
    result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  else
  {
    v6 = -[IPAGeometryOperator initWithIdentifier:]([IPAStraightenOperator alloc], "initWithIdentifier:", v5);
    v7 = v6;
    v8 = 0.0;
    if (fabs(a4) >= 0.0001)
      v8 = a4;
    v6->_zAngle = v8;

    return v7;
  }
  return result;
}

@end
