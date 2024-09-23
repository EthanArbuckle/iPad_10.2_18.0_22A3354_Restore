@implementation UIInterpolatedCornerRadii

+ (id)valueWithCornerRadii:(CACornerRadii *)a3
{
  uint64_t v4;
  CGSize maxXMinY;
  CGSize minXMinY;
  CGSize maxXMaxY;

  v4 = objc_opt_new();
  maxXMinY = a3->maxXMinY;
  minXMinY = a3->minXMinY;
  maxXMaxY = a3->maxXMaxY;
  *(CGSize *)(v4 + 8) = a3->minXMaxY;
  *(CGSize *)(v4 + 56) = minXMinY;
  *(CGSize *)(v4 + 40) = maxXMinY;
  *(CGSize *)(v4 + 24) = maxXMaxY;
  return (id)v4;
}

- (id)interpolateTo:(id)a3 progress:(double)a4
{
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;

  v4 = vaddq_f64(vmulq_n_f64(*(float64x2_t *)((char *)self + 8), 1.0 - a4), vmulq_n_f64(*(float64x2_t *)((char *)a3 + 8), a4));
  v5 = vaddq_f64(vmulq_n_f64(*(float64x2_t *)((char *)self + 24), 1.0 - a4), vmulq_n_f64(*(float64x2_t *)((char *)a3 + 24), a4));
  v6 = vaddq_f64(vmulq_n_f64(*(float64x2_t *)((char *)self + 40), 1.0 - a4), vmulq_n_f64(*(float64x2_t *)((char *)a3 + 40), a4));
  v7 = vmulq_n_f64(*(float64x2_t *)((char *)self + 56), 1.0 - a4);
  v8 = vmulq_n_f64(*(float64x2_t *)((char *)a3 + 56), a4);
  *(float64x2_t *)((char *)self + 8) = v4;
  *(float64x2_t *)((char *)self + 24) = v5;
  *(float64x2_t *)((char *)self + 40) = v6;
  *(float64x2_t *)((char *)self + 56) = vaddq_f64(v7, v8);
  return self;
}

- (BOOL)isApproximatelyEqualTo:(id)a3 withinEpsilon:(id)a4
{
  double *v6;
  double *v7;
  BOOL v8;

  v6 = (double *)a3;
  v7 = (double *)a4;
  v8 = vabdd_f64(self->_cornerRadii.minXMinY.width, v6[7]) <= v7[7]
    && vabdd_f64(self->_cornerRadii.minXMinY.height, v6[8]) <= v7[8]
    && vabdd_f64(self->_cornerRadii.maxXMinY.width, v6[5]) <= v7[5]
    && vabdd_f64(self->_cornerRadii.maxXMinY.height, v6[6]) <= v7[6]
    && vabdd_f64(self->_cornerRadii.maxXMaxY.width, v6[3]) <= v7[3]
    && vabdd_f64(self->_cornerRadii.maxXMaxY.height, v6[4]) <= v7[4]
    && vabdd_f64(self->_cornerRadii.minXMaxY.width, v6[1]) <= v7[1]
    && vabdd_f64(self->_cornerRadii.minXMaxY.height, v6[2]) <= v7[2];

  return v8;
}

- (BOOL)isCompatibleWith:(id)a3
{
  return 1;
}

- (BOOL)isUndefined
{
  BOOL v2;

  v2 = 1;
  if (fabs(self->_cornerRadii.minXMinY.width) != INFINITY
    && fabs(self->_cornerRadii.minXMinY.height) != INFINITY
    && fabs(self->_cornerRadii.maxXMinY.width) != INFINITY
    && fabs(self->_cornerRadii.maxXMinY.height) != INFINITY
    && fabs(self->_cornerRadii.maxXMaxY.width) != INFINITY
    && fabs(self->_cornerRadii.maxXMaxY.height) != INFINITY
    && fabs(self->_cornerRadii.minXMaxY.width) != INFINITY)
  {
    return fabs(self->_cornerRadii.minXMaxY.height) == INFINITY;
  }
  return v2;
}

- (id)getValue
{
  int8x16_t v2;
  int8x16_t v3;
  _OWORD v5[4];

  v2 = vbicq_s8((int8x16_t)self->_cornerRadii.maxXMaxY, (int8x16_t)vcltzq_f64((float64x2_t)self->_cornerRadii.maxXMaxY));
  v5[0] = vbicq_s8((int8x16_t)self->_cornerRadii.minXMaxY, (int8x16_t)vcltzq_f64((float64x2_t)self->_cornerRadii.minXMaxY));
  v5[1] = v2;
  v3 = vbicq_s8((int8x16_t)self->_cornerRadii.minXMinY, (int8x16_t)vcltzq_f64((float64x2_t)self->_cornerRadii.minXMinY));
  v5[2] = vbicq_s8((int8x16_t)self->_cornerRadii.maxXMinY, (int8x16_t)vcltzq_f64((float64x2_t)self->_cornerRadii.maxXMinY));
  v5[3] = v3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{CACornerRadii={CGSize=dd}{CGSize=dd}{CGSize=dd}{CGSize=dd}}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)epsilonCompatibleWithVector:(id)a3
{
  if (qword_1ECD80880 != -1)
    dispatch_once(&qword_1ECD80880, &__block_literal_global_514);
  return (id)_MergedGlobals_1231;
}

void __57__UIInterpolatedCornerRadii_epsilonCompatibleWithVector___block_invoke()
{
  uint64_t v0;
  void *v1;
  _OWORD v2[4];

  v2[0] = vdupq_n_s64(0x3F50624DD2F1A9FCuLL);
  v2[1] = v2[0];
  v2[2] = v2[0];
  v2[3] = v2[0];
  +[UIInterpolatedCornerRadii valueWithCornerRadii:](UIInterpolatedCornerRadii, "valueWithCornerRadii:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1231;
  _MergedGlobals_1231 = v0;

}

+ (id)zeroCompatibleWithVector:(id)a3
{
  if (qword_1ECD80890 != -1)
    dispatch_once(&qword_1ECD80890, &__block_literal_global_3_17);
  return (id)qword_1ECD80888;
}

void __54__UIInterpolatedCornerRadii_zeroCompatibleWithVector___block_invoke()
{
  __int128 v0;
  __int128 v1;
  uint64_t v2;
  void *v3;
  _OWORD v4[4];

  v0 = *(_OWORD *)(MEMORY[0x1E0CD2380] + 16);
  v4[0] = *MEMORY[0x1E0CD2380];
  v4[1] = v0;
  v1 = *(_OWORD *)(MEMORY[0x1E0CD2380] + 48);
  v4[2] = *(_OWORD *)(MEMORY[0x1E0CD2380] + 32);
  v4[3] = v1;
  +[UIInterpolatedCornerRadii valueWithCornerRadii:](UIInterpolatedCornerRadii, "valueWithCornerRadii:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD80888;
  qword_1ECD80888 = v2;

}

- (id)copyWithZone:(_NSZone *)a3
{
  CGSize maxXMaxY;
  CGSize minXMinY;
  _OWORD v6[4];

  maxXMaxY = self->_cornerRadii.maxXMaxY;
  v6[0] = self->_cornerRadii.minXMaxY;
  v6[1] = maxXMaxY;
  minXMinY = self->_cornerRadii.minXMinY;
  v6[2] = self->_cornerRadii.maxXMinY;
  v6[3] = minXMinY;
  +[UIInterpolatedCornerRadii valueWithCornerRadii:](UIInterpolatedCornerRadii, "valueWithCornerRadii:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reinitWithVector:(id)a3
{
  CGSize v3;
  CGSize v4;
  CGSize v5;

  v3 = *(CGSize *)((char *)a3 + 8);
  v4 = *(CGSize *)((char *)a3 + 24);
  v5 = *(CGSize *)((char *)a3 + 40);
  self->_cornerRadii.minXMinY = *(CGSize *)((char *)a3 + 56);
  self->_cornerRadii.maxXMinY = v5;
  self->_cornerRadii.maxXMaxY = v4;
  self->_cornerRadii.minXMaxY = v3;
}

- (void)integrateWithVelocity:(id)a3 target:(id)a4 intermediateTarget:(id)a5 intermediateTargetVelocity:(id)a6 parameters:(id *)a7 state:(id *)a8 delta:(double)a9
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var1;
  CGFloat width;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD *v22;
  _QWORD *v23;
  double *v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CGFloat height;
  double v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CGFloat v38;
  double v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CGFloat v47;
  double v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  CGFloat v56;
  double v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  CGFloat v65;
  double v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  CGFloat v74;
  double v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  CGFloat v83;
  double v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  CGFloat v102;
  double v103;
  $F24F406B2B787EFB06265DBA3D28CBD5 v104;
  $F24F406B2B787EFB06265DBA3D28CBD5 v105;
  __int128 v106;
  uint64_t v107;
  uint64_t v108;
  CGFloat v109;
  uint64_t v110;
  $F24F406B2B787EFB06265DBA3D28CBD5 v111;
  $F24F406B2B787EFB06265DBA3D28CBD5 v112;
  __int128 v113;
  $F24F406B2B787EFB06265DBA3D28CBD5 var0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v115;
  __int128 v116;

  var1 = a8->var1;
  var0 = a8->var0;
  v115 = var1;
  v116 = *(_OWORD *)&a8->var2;
  a7->var2.var0 = *((double *)a4 + 7);
  width = self->_cornerRadii.minXMinY.width;
  var1.var0 = *((double *)a3 + 7);
  v18 = *((_QWORD *)a6 + 7);
  v100 = *((_QWORD *)a5 + 7);
  v101 = v18;
  v102 = width;
  v103 = var1.var0;
  v104 = var0;
  v105 = v115;
  v106 = v116;
  v19 = *(_OWORD *)&a7->var2.var2;
  v97 = *(_OWORD *)&a7->var2.var0;
  v98 = v19;
  v99 = *(_QWORD *)&a7->var3;
  v20 = *(_OWORD *)&a7->var0.var2;
  v93 = *(_OWORD *)&a7->var0.var0;
  v94 = v20;
  v21 = *(_OWORD *)&a7->var1.var2;
  v95 = *(_OWORD *)&a7->var1.var0;
  v96 = v21;
  v22 = a6;
  v23 = a5;
  v24 = (double *)a4;
  v25 = (double *)a3;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v100, &v93, a9);
  v26 = v107;
  v27 = v108;
  v28 = v110;
  var0 = v111;
  v115 = v112;
  v116 = v113;
  self->_cornerRadii.minXMinY.width = v109;
  *((_QWORD *)a3 + 7) = v28;
  *((_QWORD *)a5 + 7) = v26;
  *((_QWORD *)a6 + 7) = v27;
  a7->var2.var0 = v24[8];
  height = self->_cornerRadii.minXMinY.height;
  v30 = v25[8];
  v31 = v22[8];
  v100 = v23[8];
  v101 = v31;
  v102 = height;
  v103 = v30;
  v104 = var0;
  v105 = v115;
  v106 = v116;
  v32 = *(_OWORD *)&a7->var2.var2;
  v97 = *(_OWORD *)&a7->var2.var0;
  v98 = v32;
  v99 = *(_QWORD *)&a7->var3;
  v33 = *(_OWORD *)&a7->var0.var2;
  v93 = *(_OWORD *)&a7->var0.var0;
  v94 = v33;
  v34 = *(_OWORD *)&a7->var1.var2;
  v95 = *(_OWORD *)&a7->var1.var0;
  v96 = v34;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v100, &v93, a9);
  v35 = v107;
  v36 = v108;
  v37 = v110;
  var0 = v111;
  v115 = v112;
  v116 = v113;
  self->_cornerRadii.minXMinY.height = v109;
  *((_QWORD *)v25 + 8) = v37;
  v23[8] = v35;
  v22[8] = v36;
  a7->var2.var0 = v24[5];
  v38 = self->_cornerRadii.maxXMinY.width;
  v39 = v25[5];
  v40 = v22[5];
  v100 = v23[5];
  v101 = v40;
  v102 = v38;
  v103 = v39;
  v104 = var0;
  v105 = v115;
  v106 = v116;
  v41 = *(_OWORD *)&a7->var2.var2;
  v97 = *(_OWORD *)&a7->var2.var0;
  v98 = v41;
  v99 = *(_QWORD *)&a7->var3;
  v42 = *(_OWORD *)&a7->var0.var2;
  v93 = *(_OWORD *)&a7->var0.var0;
  v94 = v42;
  v43 = *(_OWORD *)&a7->var1.var2;
  v95 = *(_OWORD *)&a7->var1.var0;
  v96 = v43;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v100, &v93, a9);
  v44 = v107;
  v45 = v108;
  v46 = v110;
  var0 = v111;
  v115 = v112;
  v116 = v113;
  self->_cornerRadii.maxXMinY.width = v109;
  *((_QWORD *)v25 + 5) = v46;
  v23[5] = v44;
  v22[5] = v45;
  a7->var2.var0 = v24[6];
  v47 = self->_cornerRadii.maxXMinY.height;
  v48 = v25[6];
  v49 = v22[6];
  v100 = v23[6];
  v101 = v49;
  v102 = v47;
  v103 = v48;
  v104 = var0;
  v105 = v115;
  v106 = v116;
  v50 = *(_OWORD *)&a7->var2.var2;
  v97 = *(_OWORD *)&a7->var2.var0;
  v98 = v50;
  v99 = *(_QWORD *)&a7->var3;
  v51 = *(_OWORD *)&a7->var0.var2;
  v93 = *(_OWORD *)&a7->var0.var0;
  v94 = v51;
  v52 = *(_OWORD *)&a7->var1.var2;
  v95 = *(_OWORD *)&a7->var1.var0;
  v96 = v52;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v100, &v93, a9);
  v53 = v107;
  v54 = v108;
  v55 = v110;
  var0 = v111;
  v115 = v112;
  v116 = v113;
  self->_cornerRadii.maxXMinY.height = v109;
  *((_QWORD *)v25 + 6) = v55;
  v23[6] = v53;
  v22[6] = v54;
  a7->var2.var0 = v24[3];
  v56 = self->_cornerRadii.maxXMaxY.width;
  v57 = v25[3];
  v58 = v22[3];
  v100 = v23[3];
  v101 = v58;
  v102 = v56;
  v103 = v57;
  v104 = var0;
  v105 = v115;
  v106 = v116;
  v59 = *(_OWORD *)&a7->var2.var2;
  v97 = *(_OWORD *)&a7->var2.var0;
  v98 = v59;
  v99 = *(_QWORD *)&a7->var3;
  v60 = *(_OWORD *)&a7->var0.var2;
  v93 = *(_OWORD *)&a7->var0.var0;
  v94 = v60;
  v61 = *(_OWORD *)&a7->var1.var2;
  v95 = *(_OWORD *)&a7->var1.var0;
  v96 = v61;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v100, &v93, a9);
  v62 = v107;
  v63 = v108;
  v64 = v110;
  var0 = v111;
  v115 = v112;
  v116 = v113;
  self->_cornerRadii.maxXMaxY.width = v109;
  *((_QWORD *)v25 + 3) = v64;
  v23[3] = v62;
  v22[3] = v63;
  a7->var2.var0 = v24[4];
  v65 = self->_cornerRadii.maxXMaxY.height;
  v66 = v25[4];
  v67 = v22[4];
  v100 = v23[4];
  v101 = v67;
  v102 = v65;
  v103 = v66;
  v104 = var0;
  v105 = v115;
  v106 = v116;
  v68 = *(_OWORD *)&a7->var2.var2;
  v97 = *(_OWORD *)&a7->var2.var0;
  v98 = v68;
  v99 = *(_QWORD *)&a7->var3;
  v69 = *(_OWORD *)&a7->var0.var2;
  v93 = *(_OWORD *)&a7->var0.var0;
  v94 = v69;
  v70 = *(_OWORD *)&a7->var1.var2;
  v95 = *(_OWORD *)&a7->var1.var0;
  v96 = v70;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v100, &v93, a9);
  v71 = v107;
  v72 = v108;
  v73 = v110;
  var0 = v111;
  v115 = v112;
  v116 = v113;
  self->_cornerRadii.maxXMaxY.height = v109;
  *((_QWORD *)v25 + 4) = v73;
  v23[4] = v71;
  v22[4] = v72;
  a7->var2.var0 = *((double *)a4 + 1);
  v74 = self->_cornerRadii.minXMaxY.width;
  v75 = *((double *)a3 + 1);
  v76 = *((_QWORD *)a6 + 1);
  v100 = *((_QWORD *)a5 + 1);
  v101 = v76;
  v102 = v74;
  v103 = v75;
  v104 = var0;
  v105 = v115;
  v106 = v116;
  v77 = *(_OWORD *)&a7->var2.var2;
  v97 = *(_OWORD *)&a7->var2.var0;
  v98 = v77;
  v99 = *(_QWORD *)&a7->var3;
  v78 = *(_OWORD *)&a7->var0.var2;
  v93 = *(_OWORD *)&a7->var0.var0;
  v94 = v78;
  v79 = *(_OWORD *)&a7->var1.var2;
  v95 = *(_OWORD *)&a7->var1.var0;
  v96 = v79;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v100, &v93, a9);
  v80 = v107;
  v81 = v108;
  v82 = v110;
  var0 = v111;
  v115 = v112;
  v116 = v113;
  self->_cornerRadii.minXMaxY.width = v109;
  *((_QWORD *)a3 + 1) = v82;
  *((_QWORD *)a5 + 1) = v80;
  *((_QWORD *)a6 + 1) = v81;
  a7->var2.var0 = v24[2];
  v83 = self->_cornerRadii.minXMaxY.height;
  v84 = v25[2];
  v85 = v22[2];
  v100 = v23[2];
  v101 = v85;
  v102 = v83;
  v103 = v84;
  v104 = var0;
  v105 = v115;
  v106 = v116;
  v86 = *(_OWORD *)&a7->var2.var2;
  v97 = *(_OWORD *)&a7->var2.var0;
  v98 = v86;
  v99 = *(_QWORD *)&a7->var3;
  v87 = *(_OWORD *)&a7->var0.var2;
  v93 = *(_OWORD *)&a7->var0.var0;
  v94 = v87;
  v88 = *(_OWORD *)&a7->var1.var2;
  v95 = *(_OWORD *)&a7->var1.var0;
  v96 = v88;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v100, &v93, a9);

  v89 = v107;
  v90 = v108;
  v91 = v110;
  self->_cornerRadii.minXMaxY.height = v109;
  *((_QWORD *)v25 + 2) = v91;

  v23[2] = v89;
  v22[2] = v90;

}

- (id)addVector:(id)a3
{
  *(float64x2_t *)((char *)self + 56) = vaddq_f64(*(float64x2_t *)((char *)a3 + 56), *(float64x2_t *)((char *)self + 56));
  *(float64x2_t *)((char *)self + 40) = vaddq_f64(*(float64x2_t *)((char *)a3 + 40), *(float64x2_t *)((char *)self + 40));
  *(float64x2_t *)((char *)self + 24) = vaddq_f64(*(float64x2_t *)((char *)a3 + 24), *(float64x2_t *)((char *)self + 24));
  *(float64x2_t *)((char *)self + 8) = vaddq_f64(*(float64x2_t *)((char *)a3 + 8), *(float64x2_t *)((char *)self + 8));
  return self;
}

- (id)multiplyByScalar:(double)a3
{
  *(float64x2_t *)((char *)self + 56) = vmulq_n_f64(*(float64x2_t *)((char *)self + 56), a3);
  *(float64x2_t *)((char *)self + 40) = vmulq_n_f64(*(float64x2_t *)((char *)self + 40), a3);
  *(float64x2_t *)((char *)self + 24) = vmulq_n_f64(*(float64x2_t *)((char *)self + 24), a3);
  *(float64x2_t *)((char *)self + 8) = vmulq_n_f64(*(float64x2_t *)((char *)self + 8), a3);
  return self;
}

- (id)multiplyByVector:(id)a3
{
  *(float64x2_t *)((char *)self + 56) = vmulq_f64(*(float64x2_t *)((char *)a3 + 56), *(float64x2_t *)((char *)self + 56));
  *(float64x2_t *)((char *)self + 40) = vmulq_f64(*(float64x2_t *)((char *)a3 + 40), *(float64x2_t *)((char *)self + 40));
  *(float64x2_t *)((char *)self + 24) = vmulq_f64(*(float64x2_t *)((char *)a3 + 24), *(float64x2_t *)((char *)self + 24));
  *(float64x2_t *)((char *)self + 8) = vmulq_f64(*(float64x2_t *)((char *)a3 + 8), *(float64x2_t *)((char *)self + 8));
  return self;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; minXMinY {%f %f}; minXMinY {%f, %f}; maxXMaxY {%f, %f}; minXMaxY {%f, %f}>"),
    v5,
    self,
    *(_QWORD *)&self->_cornerRadii.minXMinY.width,
    *(_QWORD *)&self->_cornerRadii.minXMinY.height,
    *(_QWORD *)&self->_cornerRadii.maxXMinY.width,
    *(_QWORD *)&self->_cornerRadii.maxXMinY.height,
    *(_QWORD *)&self->_cornerRadii.maxXMaxY.width,
    *(_QWORD *)&self->_cornerRadii.maxXMaxY.height,
    *(_QWORD *)&self->_cornerRadii.minXMaxY.width,
    *(_QWORD *)&self->_cornerRadii.minXMaxY.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

@end
