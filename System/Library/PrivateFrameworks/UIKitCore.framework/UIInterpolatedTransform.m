@implementation UIInterpolatedTransform

- (BOOL)isUndefined
{
  BOOL v2;

  v2 = 1;
  if (fabs(self->_transform.rotationX) != INFINITY
    && fabs(self->_transform.rotationY) != INFINITY
    && fabs(self->_transform.rotationZ) != INFINITY
    && fabs(self->_transform.scaleX) != INFINITY
    && fabs(self->_transform.scaleY) != INFINITY
    && fabs(self->_transform.scaleZ) != INFINITY
    && fabs(self->_transform.translationX) != INFINITY
    && fabs(self->_transform.translationY) != INFINITY)
  {
    return fabs(self->_transform.translationZ) == INFINITY;
  }
  return v2;
}

- (void)reinitWithVector:(id)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)&self->_transform.rotationX = *(_OWORD *)((char *)a3 + 8);
  v3 = *(_OWORD *)((char *)a3 + 24);
  v4 = *(_OWORD *)((char *)a3 + 40);
  v5 = *(_OWORD *)((char *)a3 + 56);
  self->_transform.translationZ = *((double *)a3 + 9);
  *(_OWORD *)&self->_transform.translationX = v5;
  *(_OWORD *)&self->_transform.scaleY = v4;
  *(_OWORD *)&self->_transform.rotationZ = v3;
}

- (id)multiplyByScalar:(double)a3
{
  *(float64x2_t *)((char *)self + 8) = vmulq_n_f64(*(float64x2_t *)((char *)self + 8), a3);
  *(float64x2_t *)((char *)self + 56) = vmulq_n_f64(*(float64x2_t *)((char *)self + 56), a3);
  *((double *)self + 9) = *((double *)self + 9) * a3;
  *(float64x2_t *)((char *)self + 24) = vmulq_n_f64(*(float64x2_t *)((char *)self + 24), a3);
  *(float64x2_t *)((char *)self + 40) = vmulq_n_f64(*(float64x2_t *)((char *)self + 40), a3);
  return self;
}

- (id)addVector:(id)a3
{
  *(float64x2_t *)((char *)self + 8) = vaddq_f64(*(float64x2_t *)((char *)a3 + 8), *(float64x2_t *)((char *)self + 8));
  *(float64x2_t *)((char *)self + 56) = vaddq_f64(*(float64x2_t *)((char *)a3 + 56), *(float64x2_t *)((char *)self + 56));
  *((double *)self + 9) = *((double *)a3 + 9) + *((double *)self + 9);
  *(float64x2_t *)((char *)self + 24) = vaddq_f64(*(float64x2_t *)((char *)a3 + 24), *(float64x2_t *)((char *)self + 24));
  *(float64x2_t *)((char *)self + 40) = vaddq_f64(*(float64x2_t *)((char *)a3 + 40), *(float64x2_t *)((char *)self + 40));
  return self;
}

- (id)multiplyByVector:(id)a3
{
  *(float64x2_t *)((char *)self + 8) = vmulq_f64(*(float64x2_t *)((char *)a3 + 8), *(float64x2_t *)((char *)self + 8));
  *(float64x2_t *)((char *)self + 56) = vmulq_f64(*(float64x2_t *)((char *)a3 + 56), *(float64x2_t *)((char *)self + 56));
  *((double *)self + 9) = *((double *)a3 + 9) * *((double *)self + 9);
  *(float64x2_t *)((char *)self + 24) = vmulq_f64(*(float64x2_t *)((char *)a3 + 24), *(float64x2_t *)((char *)self + 24));
  *(float64x2_t *)((char *)self + 40) = vmulq_f64(*(float64x2_t *)((char *)a3 + 40), *(float64x2_t *)((char *)self + 40));
  return self;
}

- (id)getValue
{
  CATransform3D v4;
  CATransform3D v5;
  CATransform3D v6;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v9;
  CATransform3D v10;
  CATransform3D v11;
  CATransform3D v12;
  CATransform3D v13;
  CATransform3D v14;

  memset(&v14, 0, sizeof(v14));
  CATransform3DMakeRotation(&v14, self->_transform.rotationZ, 0.0, 0.0, 1.0);
  memset(&v13, 0, sizeof(v13));
  CATransform3DMakeRotation(&v13, self->_transform.rotationX, 1.0, 0.0, 0.0);
  memset(&v12, 0, sizeof(v12));
  CATransform3DMakeRotation(&v12, self->_transform.rotationY, 0.0, 1.0, 0.0);
  memset(&v11, 0, sizeof(v11));
  CATransform3DMakeTranslation(&v11, self->_transform.translationX, self->_transform.translationY, self->_transform.translationZ);
  memset(&v10, 0, sizeof(v10));
  a = v14;
  b = v13;
  CATransform3DConcat(&v9, &a, &b);
  a = v12;
  CATransform3DConcat(&v10, &v9, &a);
  memset(&a, 0, sizeof(a));
  CATransform3DMakeScale(&a, self->_transform.scaleX, self->_transform.scaleY, self->_transform.scaleZ);
  memset(&b, 0, sizeof(b));
  v5 = v10;
  v4 = a;
  CATransform3DConcat(&v6, &v5, &v4);
  v5 = v11;
  CATransform3DConcat(&b, &v6, &v5);
  v5 = b;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  __int128 v3;
  __int128 v4;
  int64_t rotationDirection;
  _OWORD v7[4];
  double translationZ;

  v3 = *(_OWORD *)&self->_transform.rotationZ;
  v4 = *(_OWORD *)&self->_transform.translationX;
  v7[2] = *(_OWORD *)&self->_transform.scaleY;
  v7[3] = v4;
  rotationDirection = self->_rotationDirection;
  translationZ = self->_transform.translationZ;
  v7[0] = *(_OWORD *)&self->_transform.rotationX;
  v7[1] = v3;
  +[UIInterpolatedTransform valueWithDecomposedTransform:rotationDirection:](UIInterpolatedTransform, "valueWithDecomposedTransform:rotationDirection:", v7, rotationDirection);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)valueWithDecomposedTransform:(id *)a3 rotationDirection:(int64_t)a4
{
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  double var8;

  v6 = objc_opt_new();
  *(_OWORD *)(v6 + 8) = *(_OWORD *)&a3->var0;
  v7 = *(_OWORD *)&a3->var2;
  v8 = *(_OWORD *)&a3->var4;
  var8 = a3->var8;
  *(_OWORD *)(v6 + 56) = *(_OWORD *)&a3->var6;
  *(_OWORD *)(v6 + 40) = v8;
  *(_OWORD *)(v6 + 24) = v7;
  *(double *)(v6 + 72) = var8;
  *(_QWORD *)(v6 + 80) = a4;
  return (id)v6;
}

- (void)integrateWithVelocity:(id)a3 target:(id)a4 intermediateTarget:(id)a5 intermediateTargetVelocity:(id)a6 parameters:(id *)a7 state:(id *)a8 delta:(double)a9
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var1;
  int64_t rotationDirection;
  uint64_t v18;
  BOOL v19;
  int64_t v20;
  double rotationX;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD *v27;
  _QWORD *v28;
  double *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double rotationY;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double rotationZ;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double translationX;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double translationY;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double translationZ;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double scaleX;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double scaleY;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  double scaleZ;
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  double v115;
  uint64_t v116;
  $F24F406B2B787EFB06265DBA3D28CBD5 v117;
  $F24F406B2B787EFB06265DBA3D28CBD5 v118;
  __int128 v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  uint64_t v123;
  $F24F406B2B787EFB06265DBA3D28CBD5 v124;
  $F24F406B2B787EFB06265DBA3D28CBD5 v125;
  __int128 v126;
  $F24F406B2B787EFB06265DBA3D28CBD5 var0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v128;
  __int128 v129;

  var1 = a8->var1;
  var0 = a8->var0;
  v128 = var1;
  v129 = *(_OWORD *)&a8->var2;
  rotationDirection = self->_rotationDirection;
  v18 = 3;
  if (rotationDirection != 2)
    v18 = 1;
  v19 = rotationDirection == 1;
  v20 = 2;
  if (!v19)
    v20 = v18;
  a7->var2.var3 = v20;
  a7->var2.var0 = *((double *)a4 + 1);
  rotationX = self->_transform.rotationX;
  v22 = *((_QWORD *)a3 + 1);
  v23 = *((_QWORD *)a6 + 1);
  v113 = *((_QWORD *)a5 + 1);
  v114 = v23;
  v115 = rotationX;
  v116 = v22;
  v117 = var0;
  v118 = v128;
  v119 = v129;
  v24 = *(_OWORD *)&a7->var2.var2;
  v110 = *(_OWORD *)&a7->var2.var0;
  v111 = v24;
  v112 = *(_QWORD *)&a7->var3;
  v25 = *(_OWORD *)&a7->var0.var2;
  v106 = *(_OWORD *)&a7->var0.var0;
  v107 = v25;
  v26 = *(_OWORD *)&a7->var1.var2;
  v108 = *(_OWORD *)&a7->var1.var0;
  v109 = v26;
  v27 = a6;
  v28 = a5;
  v29 = (double *)a4;
  v30 = a3;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v113, &v106, a9);
  v31 = v120;
  v32 = v121;
  v33 = v123;
  var0 = v124;
  v128 = v125;
  v129 = v126;
  self->_transform.rotationX = v122;
  *((_QWORD *)a3 + 1) = v33;
  *((_QWORD *)a5 + 1) = v31;
  *((_QWORD *)a6 + 1) = v32;
  a7->var2.var0 = v29[2];
  rotationY = self->_transform.rotationY;
  v35 = v30[2];
  v36 = v27[2];
  v113 = v28[2];
  v114 = v36;
  v115 = rotationY;
  v116 = v35;
  v117 = var0;
  v118 = v128;
  v119 = v129;
  v37 = *(_OWORD *)&a7->var2.var2;
  v110 = *(_OWORD *)&a7->var2.var0;
  v111 = v37;
  v112 = *(_QWORD *)&a7->var3;
  v38 = *(_OWORD *)&a7->var0.var2;
  v106 = *(_OWORD *)&a7->var0.var0;
  v107 = v38;
  v39 = *(_OWORD *)&a7->var1.var2;
  v108 = *(_OWORD *)&a7->var1.var0;
  v109 = v39;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v113, &v106, a9);
  v40 = v120;
  v41 = v121;
  v42 = v123;
  var0 = v124;
  v128 = v125;
  v129 = v126;
  self->_transform.rotationY = v122;
  v30[2] = v42;
  v28[2] = v40;
  v27[2] = v41;
  a7->var2.var0 = v29[3];
  rotationZ = self->_transform.rotationZ;
  v44 = v30[3];
  v45 = v27[3];
  v113 = v28[3];
  v114 = v45;
  v115 = rotationZ;
  v116 = v44;
  v117 = var0;
  v118 = v128;
  v119 = v129;
  v46 = *(_OWORD *)&a7->var2.var2;
  v110 = *(_OWORD *)&a7->var2.var0;
  v111 = v46;
  v112 = *(_QWORD *)&a7->var3;
  v47 = *(_OWORD *)&a7->var0.var2;
  v106 = *(_OWORD *)&a7->var0.var0;
  v107 = v47;
  v48 = *(_OWORD *)&a7->var1.var2;
  v108 = *(_OWORD *)&a7->var1.var0;
  v109 = v48;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v113, &v106, a9);
  v49 = v120;
  v50 = v121;
  v51 = v123;
  var0 = v124;
  v128 = v125;
  v129 = v126;
  self->_transform.rotationZ = v122;
  v30[3] = v51;
  v28[3] = v49;
  v27[3] = v50;
  a7->var2.var3 = 0;
  a7->var2.var0 = v29[7];
  translationX = self->_transform.translationX;
  v53 = v30[7];
  v54 = v27[7];
  v113 = v28[7];
  v114 = v54;
  v115 = translationX;
  v116 = v53;
  v117 = var0;
  v118 = v128;
  v119 = v129;
  v55 = *(_OWORD *)&a7->var2.var2;
  v110 = *(_OWORD *)&a7->var2.var0;
  v111 = v55;
  v112 = *(_QWORD *)&a7->var3;
  v56 = *(_OWORD *)&a7->var0.var2;
  v106 = *(_OWORD *)&a7->var0.var0;
  v107 = v56;
  v57 = *(_OWORD *)&a7->var1.var2;
  v108 = *(_OWORD *)&a7->var1.var0;
  v109 = v57;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v113, &v106, a9);
  v58 = v120;
  v59 = v121;
  v60 = v123;
  var0 = v124;
  v128 = v125;
  v129 = v126;
  self->_transform.translationX = v122;
  v30[7] = v60;
  v28[7] = v58;
  v27[7] = v59;
  a7->var2.var0 = v29[8];
  translationY = self->_transform.translationY;
  v62 = v30[8];
  v63 = v27[8];
  v113 = v28[8];
  v114 = v63;
  v115 = translationY;
  v116 = v62;
  v117 = var0;
  v118 = v128;
  v119 = v129;
  v64 = *(_OWORD *)&a7->var2.var2;
  v110 = *(_OWORD *)&a7->var2.var0;
  v111 = v64;
  v112 = *(_QWORD *)&a7->var3;
  v65 = *(_OWORD *)&a7->var0.var2;
  v106 = *(_OWORD *)&a7->var0.var0;
  v107 = v65;
  v66 = *(_OWORD *)&a7->var1.var2;
  v108 = *(_OWORD *)&a7->var1.var0;
  v109 = v66;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v113, &v106, a9);
  v67 = v120;
  v68 = v121;
  v69 = v123;
  var0 = v124;
  v128 = v125;
  v129 = v126;
  self->_transform.translationY = v122;
  v30[8] = v69;
  v28[8] = v67;
  v27[8] = v68;
  a7->var2.var0 = v29[9];
  translationZ = self->_transform.translationZ;
  v71 = v30[9];
  v72 = v27[9];
  v113 = v28[9];
  v114 = v72;
  v115 = translationZ;
  v116 = v71;
  v117 = var0;
  v118 = v128;
  v119 = v129;
  v73 = *(_OWORD *)&a7->var2.var2;
  v110 = *(_OWORD *)&a7->var2.var0;
  v111 = v73;
  v112 = *(_QWORD *)&a7->var3;
  v74 = *(_OWORD *)&a7->var0.var2;
  v106 = *(_OWORD *)&a7->var0.var0;
  v107 = v74;
  v75 = *(_OWORD *)&a7->var1.var2;
  v108 = *(_OWORD *)&a7->var1.var0;
  v109 = v75;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v113, &v106, a9);
  v76 = v120;
  v77 = v121;
  v78 = v123;
  var0 = v124;
  v128 = v125;
  v129 = v126;
  self->_transform.translationZ = v122;
  v30[9] = v78;
  v28[9] = v76;
  v27[9] = v77;
  a7->var2.var0 = v29[4];
  scaleX = self->_transform.scaleX;
  v80 = v30[4];
  v81 = v27[4];
  v113 = v28[4];
  v114 = v81;
  v115 = scaleX;
  v116 = v80;
  v117 = var0;
  v118 = v128;
  v119 = v129;
  v82 = *(_OWORD *)&a7->var2.var2;
  v110 = *(_OWORD *)&a7->var2.var0;
  v111 = v82;
  v112 = *(_QWORD *)&a7->var3;
  v83 = *(_OWORD *)&a7->var0.var2;
  v106 = *(_OWORD *)&a7->var0.var0;
  v107 = v83;
  v84 = *(_OWORD *)&a7->var1.var2;
  v108 = *(_OWORD *)&a7->var1.var0;
  v109 = v84;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v113, &v106, a9);
  v85 = v120;
  v86 = v121;
  v87 = v123;
  var0 = v124;
  v128 = v125;
  v129 = v126;
  self->_transform.scaleX = v122;
  v30[4] = v87;
  v28[4] = v85;
  v27[4] = v86;
  a7->var2.var0 = v29[5];
  scaleY = self->_transform.scaleY;
  v89 = v30[5];
  v90 = v27[5];
  v113 = v28[5];
  v114 = v90;
  v115 = scaleY;
  v116 = v89;
  v117 = var0;
  v118 = v128;
  v119 = v129;
  v91 = *(_OWORD *)&a7->var2.var2;
  v110 = *(_OWORD *)&a7->var2.var0;
  v111 = v91;
  v112 = *(_QWORD *)&a7->var3;
  v92 = *(_OWORD *)&a7->var0.var2;
  v106 = *(_OWORD *)&a7->var0.var0;
  v107 = v92;
  v93 = *(_OWORD *)&a7->var1.var2;
  v108 = *(_OWORD *)&a7->var1.var0;
  v109 = v93;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v113, &v106, a9);
  v94 = v120;
  v95 = v121;
  v96 = v123;
  var0 = v124;
  v128 = v125;
  v129 = v126;
  self->_transform.scaleY = v122;
  v30[5] = v96;
  v28[5] = v94;
  v27[5] = v95;
  a7->var2.var0 = v29[6];
  scaleZ = self->_transform.scaleZ;
  v98 = v30[6];
  v99 = v27[6];
  v113 = v28[6];
  v114 = v99;
  v115 = scaleZ;
  v116 = v98;
  v117 = var0;
  v118 = v128;
  v119 = v129;
  v100 = *(_OWORD *)&a7->var2.var2;
  v110 = *(_OWORD *)&a7->var2.var0;
  v111 = v100;
  v112 = *(_QWORD *)&a7->var3;
  v101 = *(_OWORD *)&a7->var0.var2;
  v106 = *(_OWORD *)&a7->var0.var0;
  v107 = v101;
  v102 = *(_OWORD *)&a7->var1.var2;
  v108 = *(_OWORD *)&a7->var1.var0;
  v109 = v102;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v113, &v106, a9);

  v103 = v120;
  v104 = v121;
  v105 = v123;
  self->_transform.scaleZ = v122;
  v30[6] = v105;

  v28[6] = v103;
  v27[6] = v104;

}

- (BOOL)isApproximatelyEqualTo:(id)a3 withinEpsilon:(id)a4
{
  double *v6;
  double *v7;
  BOOL v8;

  v6 = (double *)a3;
  v7 = (double *)a4;
  v8 = vabdd_f64(self->_transform.rotationX, v6[1]) < v7[1]
    && vabdd_f64(self->_transform.rotationY, v6[2]) < v7[2]
    && vabdd_f64(self->_transform.rotationZ, v6[3]) < v7[3]
    && vabdd_f64(self->_transform.scaleX, v6[4]) < v7[4]
    && vabdd_f64(self->_transform.scaleY, v6[5]) < v7[5]
    && vabdd_f64(self->_transform.scaleZ, v6[6]) < v7[6]
    && vabdd_f64(self->_transform.translationX, v6[7]) < v7[7]
    && vabdd_f64(self->_transform.translationY, v6[8]) < v7[8]
    && vabdd_f64(self->_transform.translationZ, v6[9]) < v7[9];

  return v8;
}

+ (id)valueWithCATransform3D:(CATransform3D *)a3
{
  double m44;
  double v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v9[4];
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  CATransform3DGetDecomposition_();
  m44 = a3->m44;
  v5 = fabs(m44);
  v6 = 1;
  if (m44 < 0.0)
    v6 = 2;
  if (v5 == INFINITY)
    v7 = v6;
  else
    v7 = 0;
  v9[2] = v13;
  v9[3] = v14;
  v10 = v15;
  v9[0] = v11;
  v9[1] = v12;
  +[UIInterpolatedTransform valueWithDecomposedTransform:rotationDirection:](UIInterpolatedTransform, "valueWithDecomposedTransform:rotationDirection:", v9, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)zeroCompatibleWithVector:(id)a3
{
  if (qword_1ECD823C8 != -1)
    dispatch_once(&qword_1ECD823C8, &__block_literal_global_3_27);
  return (id)qword_1ECD823C0;
}

- (BOOL)isCompatibleWith:(id)a3
{
  return 1;
}

+ (id)epsilonCompatibleWithVector:(id)a3
{
  if (qword_1ECD823B8 != -1)
    dispatch_once(&qword_1ECD823B8, &__block_literal_global_642);
  return (id)_MergedGlobals_1317;
}

+ (id)valueWithDecomposedTransform:(id *)a3
{
  __int128 v3;
  __int128 v4;
  _OWORD v6[4];
  double var8;

  v3 = *(_OWORD *)&a3->var6;
  v6[2] = *(_OWORD *)&a3->var4;
  v6[3] = v3;
  var8 = a3->var8;
  v4 = *(_OWORD *)&a3->var2;
  v6[0] = *(_OWORD *)&a3->var0;
  v6[1] = v4;
  objc_msgSend(a1, "valueWithDecomposedTransform:rotationDirection:", v6, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)interpolateTo:(id)a3 progress:(double)a4
{
  *(float64x2_t *)((char *)self + 8) = vaddq_f64(vmulq_n_f64(*(float64x2_t *)((char *)self + 8), 1.0 - a4), vmulq_n_f64(*(float64x2_t *)((char *)a3 + 8), a4));
  *(float64x2_t *)((char *)self + 24) = vaddq_f64(vmulq_n_f64(*(float64x2_t *)((char *)self + 24), 1.0 - a4), vmulq_n_f64(*(float64x2_t *)((char *)a3 + 24), a4));
  *(float64x2_t *)((char *)self + 40) = vaddq_f64(vmulq_n_f64(*(float64x2_t *)((char *)self + 40), 1.0 - a4), vmulq_n_f64(*(float64x2_t *)((char *)a3 + 40), a4));
  *(float64x2_t *)((char *)self + 56) = vaddq_f64(vmulq_n_f64(*(float64x2_t *)((char *)self + 56), 1.0 - a4), vmulq_n_f64(*(float64x2_t *)((char *)a3 + 56), a4));
  *((double *)self + 9) = (1.0 - a4) * *((double *)self + 9) + *((double *)a3 + 9) * a4;
  return self;
}

void __55__UIInterpolatedTransform_epsilonCompatibleWithVector___block_invoke()
{
  void *v0;
  double v1;
  double v2;
  uint64_t v3;
  void *v4;
  _OWORD v5[3];
  double v6;
  double v7;
  double v8;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = 1.0 / v1;

  v5[0] = vdupq_n_s64(0x3F847AE147AE147BuLL);
  v5[1] = xmmword_186673A00;
  v5[2] = vdupq_n_s64(0x3F50624DD2F1A9FCuLL);
  v6 = v2;
  v7 = v2;
  v8 = v2;
  +[UIInterpolatedTransform valueWithDecomposedTransform:](UIInterpolatedTransform, "valueWithDecomposedTransform:", v5);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_MergedGlobals_1317;
  _MergedGlobals_1317 = v3;

}

void __52__UIInterpolatedTransform_zeroCompatibleWithVector___block_invoke()
{
  __int128 v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _OWORD v7[8];

  v0 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v7[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v7[5] = v0;
  v1 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v7[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v7[7] = v1;
  v2 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v7[0] = *MEMORY[0x1E0CD2610];
  v7[1] = v2;
  v3 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v7[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v7[3] = v3;
  +[UIInterpolatedTransform valueWithCATransform3D:](UIInterpolatedTransform, "valueWithCATransform3D:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ECD823C0;
  qword_1ECD823C0 = v4;

  v6 = qword_1ECD823C0;
  *(_QWORD *)(qword_1ECD823C0 + 40) = 0;
  *(_QWORD *)(v6 + 48) = 0;
  *(_QWORD *)(v6 + 32) = 0;
}

- (NSString)debugDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Transform: [%f %f %f %f %f %f %f %f %f]"), *(_QWORD *)&self->_transform.rotationX, *(_QWORD *)&self->_transform.rotationY, *(_QWORD *)&self->_transform.rotationZ, *(_QWORD *)&self->_transform.scaleX, *(_QWORD *)&self->_transform.scaleY, *(_QWORD *)&self->_transform.scaleZ, *(_QWORD *)&self->_transform.translationX, *(_QWORD *)&self->_transform.translationY, *(_QWORD *)&self->_transform.translationZ);
}

@end
