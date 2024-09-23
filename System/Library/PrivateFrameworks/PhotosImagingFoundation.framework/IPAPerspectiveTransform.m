@implementation IPAPerspectiveTransform

- (IPAPerspectiveTransform)initWithInputGeometry:(id)a3 intrinsicGeometry:(id)a4 projectionTransform:(const Matrix4d *)a5 viewingTransform:(const Matrix4d *)a6
{
  id v11;
  char *v12;
  IPAPerspectiveTransform *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v27;

  v11 = a4;
  v27.receiver = self;
  v27.super_class = (Class)IPAPerspectiveTransform;
  v12 = -[IPAImageTransform initWithInputGeometry:intrinsicGeometry:](&v27, sel_initWithInputGeometry_intrinsicGeometry_, a3, v11);
  v13 = (IPAPerspectiveTransform *)v12;
  if (v12)
  {
    v14 = *(_OWORD *)&a5->m[6];
    v16 = *(_OWORD *)a5->m;
    v15 = *(_OWORD *)&a5->m[2];
    *(_OWORD *)(v12 + 56) = *(_OWORD *)&a5->m[4];
    *(_OWORD *)(v12 + 72) = v14;
    *(_OWORD *)(v12 + 24) = v16;
    *(_OWORD *)(v12 + 40) = v15;
    v17 = *(_OWORD *)&a5->m[14];
    v19 = *(_OWORD *)&a5->m[8];
    v18 = *(_OWORD *)&a5->m[10];
    *(_OWORD *)(v12 + 120) = *(_OWORD *)&a5->m[12];
    *(_OWORD *)(v12 + 136) = v17;
    *(_OWORD *)(v12 + 88) = v19;
    *(_OWORD *)(v12 + 104) = v18;
    v20 = *(_OWORD *)&a6->m[6];
    v22 = *(_OWORD *)a6->m;
    v21 = *(_OWORD *)&a6->m[2];
    *(_OWORD *)(v12 + 184) = *(_OWORD *)&a6->m[4];
    *(_OWORD *)(v12 + 200) = v20;
    *(_OWORD *)(v12 + 152) = v22;
    *(_OWORD *)(v12 + 168) = v21;
    v23 = *(_OWORD *)&a6->m[14];
    v25 = *(_OWORD *)&a6->m[8];
    v24 = *(_OWORD *)&a6->m[10];
    *(_OWORD *)(v12 + 248) = *(_OWORD *)&a6->m[12];
    *(_OWORD *)(v12 + 264) = v23;
    *(_OWORD *)(v12 + 216) = v25;
    *(_OWORD *)(v12 + 232) = v24;
    objc_storeStrong((id *)v12 + 35, a4);
  }

  return v13;
}

- (Vector2d)mapVector:(Vector2d)a3
{
  __n128 v4;
  unint64_t v5;
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
  void *v18;
  char v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double Y;
  double X;
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
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  _Unwind_Exception *v52;
  __n128 v53;
  Vector2d v54;
  __int128 v55;
  double v56;
  double v57;
  Vector2d result;

  if (self->_isInverse)
  {
    v54 = a3;
    v55 = xmmword_1D4CCD100;
    v4.n128_f64[0] = PA::operator*(self->_viewingTransform.m, &v54.X);
    v4.n128_u64[1] = v5;
    v53 = v4;
    PA::Matrix4d::MultiplyWithProject(self->_projectionTransform.m, v4, -1.0);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    PA::Matrix4d::MultiplyWithProject(self->_projectionTransform.m, v53, 1.0);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[IPAImageTransform inputGeometry](self, "inputGeometry");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "conformsToProtocol:", &unk_1EFECC400);

    if ((v19 & 1) == 0)
    {
      v52 = (_Unwind_Exception *)_PFAssertFailHandler();

      _Unwind_Resume(v52);
    }
    -[IPAImageTransform inputGeometry](self, "inputGeometry");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = 0.0;
    v23 = 0.0;
    v24 = 0.0;
    v25 = 0.0;
    Y = 0.0;
    X = 0.0;
    if (v20)
    {
      objc_msgSend(v20, "imageQuad", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
      X = v54.X;
      Y = v54.Y;
      v24 = *((double *)&v55 + 1);
      v25 = *(double *)&v55;
      v23 = v56;
      v22 = v57;
    }
    v28 = v25 - X;
    v29 = v24 - Y;
    v30 = v23 - X;
    v31 = v22 - Y;
    v32 = v31 * -0.0 + v29 * 0.0;
    v33 = v28 * -0.0 + v30 * 0.0;
    v34 = v28 * v31 - v29 * v30;
    v35 = sqrt(v33 * v33 + v32 * v32 + v34 * v34);
    v36 = v32 / v35;
    v37 = v33 / v35;
    v38 = v34 / v35;
    v39 = v37 * (v15 - v9) + v36 * (v13 - v7) + v34 / v35 * (v17 - v11);
    v40 = fabs(v39);
    v41 = 2.22044605e-16;
    if (v40 < 2.22044605e-16)
    {
      v43 = unk_1EFEC86B0;
    }
    else
    {
      v42 = -(v37 * (v9 - Y) + v36 * (v7 - X) + v38 * v11) / v39;
      v41 = v7 + (v13 - v7) * v42;
      v43 = v9 + (v15 - v9) * v42;
    }
    if (v40 < 2.22044605e-16)
      v44 = *(double *)&kIPAGeometryInvalidPoint;
    else
      v44 = v41;

  }
  else
  {
    v45 = a3.Y;
    PA::Matrix4d::MultiplyWithProject(self->_projectionTransform.m, (__n128)a3, 0.0);
    v54.X = v46;
    v54.Y = v47;
    *(_QWORD *)&v55 = v48;
    *((_QWORD *)&v55 + 1) = 0x3FF0000000000000;
    v44 = PA::operator*(self->_viewingTransform.m, &v54.X);
    v43 = v49;
  }
  v50 = v44;
  v51 = v43;
  result.Y = v51;
  result.X = v50;
  return result;
}

- (id)inverseTransform
{
  void *v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  IPAPerspectiveTransform *v12;
  IPAQuadGeometry *intrinsicGeometry;
  void *v14;
  IPAPerspectiveTransform *v15;
  _Unwind_Exception *v17;
  _OWORD v18[8];
  _OWORD v19[8];

  if (self->_isInverse)
  {
    _PFAssertFailHandler();
    goto LABEL_6;
  }
  v4 = *(_OWORD *)&self->_projectionTransform.m[10];
  v19[4] = *(_OWORD *)&self->_projectionTransform.m[8];
  v19[5] = v4;
  v5 = *(_OWORD *)&self->_projectionTransform.m[14];
  v19[6] = *(_OWORD *)&self->_projectionTransform.m[12];
  v19[7] = v5;
  v6 = *(_OWORD *)&self->_projectionTransform.m[2];
  v19[0] = *(_OWORD *)self->_projectionTransform.m;
  v19[1] = v6;
  v7 = *(_OWORD *)&self->_projectionTransform.m[6];
  v19[2] = *(_OWORD *)&self->_projectionTransform.m[4];
  v19[3] = v7;
  if (!PA::Matrix4d::invert((PA::Matrix4d *)v19))
  {
LABEL_6:
    _PFAssertFailHandler();
LABEL_7:
    v17 = (_Unwind_Exception *)_PFAssertFailHandler();

    _Unwind_Resume(v17);
  }
  v8 = *(_OWORD *)&self->_viewingTransform.m[10];
  v18[4] = *(_OWORD *)&self->_viewingTransform.m[8];
  v18[5] = v8;
  v9 = *(_OWORD *)&self->_viewingTransform.m[14];
  v18[6] = *(_OWORD *)&self->_viewingTransform.m[12];
  v18[7] = v9;
  v10 = *(_OWORD *)&self->_viewingTransform.m[2];
  v18[0] = *(_OWORD *)self->_viewingTransform.m;
  v18[1] = v10;
  v11 = *(_OWORD *)&self->_viewingTransform.m[6];
  v18[2] = *(_OWORD *)&self->_viewingTransform.m[4];
  v18[3] = v11;
  if (!PA::Matrix4d::invert((PA::Matrix4d *)v18))
    goto LABEL_7;
  v12 = [IPAPerspectiveTransform alloc];
  intrinsicGeometry = self->_intrinsicGeometry;
  -[IPAImageTransform inputGeometry](self, "inputGeometry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[IPAPerspectiveTransform initWithInputGeometry:intrinsicGeometry:projectionTransform:viewingTransform:](v12, "initWithInputGeometry:intrinsicGeometry:projectionTransform:viewingTransform:", intrinsicGeometry, v14, v19, v18);

  v15->_isInverse = !self->_isInverse;
  return v15;
}

- (id)intrinsicGeometry
{
  return self->_intrinsicGeometry;
}

- (BOOL)canAlignToPixelsExactly
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intrinsicGeometry, 0);
}

@end
