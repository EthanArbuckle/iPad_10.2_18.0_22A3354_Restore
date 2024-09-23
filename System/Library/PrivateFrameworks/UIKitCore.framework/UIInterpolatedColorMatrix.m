@implementation UIInterpolatedColorMatrix

- (id)getValue
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[5];

  v2 = *(_OWORD *)&self->_colorMatrix.m15;
  v3 = *(_OWORD *)&self->_colorMatrix.m33;
  v5[2] = *(_OWORD *)&self->_colorMatrix.m24;
  v5[3] = v3;
  v5[4] = *(_OWORD *)&self->_colorMatrix.m42;
  v5[0] = *(_OWORD *)&self->_colorMatrix.m11;
  v5[1] = v2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)zeroCompatibleWithVector:(id)a3
{
  if (qword_1ECD821C0 != -1)
    dispatch_once(&qword_1ECD821C0, &__block_literal_global_3_21);
  return (id)qword_1ECD821B8;
}

- (BOOL)isCompatibleWith:(id)a3
{
  return 1;
}

+ (id)valueWithColorMatrix:(CAColorMatrix *)a3
{
  UIInterpolatedColorMatrix *v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[5];

  v4 = [UIInterpolatedColorMatrix alloc];
  v5 = *(_OWORD *)&a3->m33;
  v8[2] = *(_OWORD *)&a3->m24;
  v8[3] = v5;
  v8[4] = *(_OWORD *)&a3->m42;
  v6 = *(_OWORD *)&a3->m15;
  v8[0] = *(_OWORD *)&a3->m11;
  v8[1] = v6;
  return -[UIInterpolatedColorMatrix initWithColorMatrix:](v4, "initWithColorMatrix:", v8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIInterpolatedColorMatrix *v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[5];

  v4 = +[UIInterpolatedColorMatrix allocWithZone:](UIInterpolatedColorMatrix, "allocWithZone:", a3);
  v5 = *(_OWORD *)&self->_colorMatrix.m15;
  v6 = *(_OWORD *)&self->_colorMatrix.m33;
  v8[2] = *(_OWORD *)&self->_colorMatrix.m24;
  v8[3] = v6;
  v8[4] = *(_OWORD *)&self->_colorMatrix.m42;
  v8[0] = *(_OWORD *)&self->_colorMatrix.m11;
  v8[1] = v5;
  return -[UIInterpolatedColorMatrix initWithColorMatrix:](v4, "initWithColorMatrix:", v8);
}

- (UIInterpolatedColorMatrix)initWithColorMatrix:(CAColorMatrix *)a3
{
  UIInterpolatedColorMatrix *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIInterpolatedColorMatrix;
  result = -[UIInterpolatedColorMatrix init](&v8, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_colorMatrix.m11 = *(_OWORD *)&a3->m11;
    v5 = *(_OWORD *)&a3->m15;
    v6 = *(_OWORD *)&a3->m24;
    v7 = *(_OWORD *)&a3->m33;
    *(_OWORD *)&result->_colorMatrix.m42 = *(_OWORD *)&a3->m42;
    *(_OWORD *)&result->_colorMatrix.m33 = v7;
    *(_OWORD *)&result->_colorMatrix.m24 = v6;
    *(_OWORD *)&result->_colorMatrix.m15 = v5;
  }
  return result;
}

- (void)reinitWithVector:(id)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)&self->_colorMatrix.m11 = *(_OWORD *)((char *)a3 + 8);
  v3 = *(_OWORD *)((char *)a3 + 24);
  v4 = *(_OWORD *)((char *)a3 + 40);
  v5 = *(_OWORD *)((char *)a3 + 56);
  *(_OWORD *)&self->_colorMatrix.m42 = *(_OWORD *)((char *)a3 + 72);
  *(_OWORD *)&self->_colorMatrix.m33 = v5;
  *(_OWORD *)&self->_colorMatrix.m24 = v4;
  *(_OWORD *)&self->_colorMatrix.m15 = v3;
}

- (id)interpolateTo:(id)a3 progress:(double)a4
{
  *(float32x4_t *)((char *)self + 8) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vaddq_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)self + 8)), 1.0 - a4), vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)a3 + 8)), a4))), vaddq_f64(vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)self + 8)), 1.0 - a4), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)a3 + 8)), a4)));
  *(float32x4_t *)((char *)self + 24) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vaddq_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)self + 24)), 1.0 - a4), vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)a3 + 24)), a4))), vaddq_f64(vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)self + 24)), 1.0 - a4), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)a3 + 24)), a4)));
  *(float32x4_t *)((char *)self + 40) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vaddq_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)self + 40)), 1.0 - a4), vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)a3 + 40)), a4))), vaddq_f64(vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)self + 40)), 1.0 - a4), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)a3 + 40)), a4)));
  *(float32x4_t *)((char *)self + 56) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vaddq_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)self + 56)), 1.0 - a4), vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)a3 + 56)), a4))), vaddq_f64(vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)self + 56)), 1.0 - a4), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)a3 + 56)), a4)));
  *(float32x4_t *)((char *)self + 72) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vaddq_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)self + 72)), 1.0 - a4), vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)a3 + 72)), a4))), vaddq_f64(vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)self + 72)), 1.0 - a4), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)a3 + 72)), a4)));
  return self;
}

- (void)integrateWithVelocity:(id)a3 target:(id)a4 intermediateTarget:(id)a5 intermediateTargetVelocity:(id)a6 parameters:(id *)a7 state:(id *)a8 delta:(double)a9
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var1;
  double m11;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  float *v22;
  float *v23;
  float *v24;
  float *v25;
  double v26;
  double v27;
  double v28;
  float v29;
  float v30;
  double m12;
  double v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  double v37;
  double v38;
  double v39;
  float v40;
  float v41;
  double m13;
  double v43;
  double v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  double v48;
  double v49;
  double v50;
  float v51;
  float v52;
  double m14;
  double v54;
  double v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  double v59;
  double v60;
  double v61;
  float v62;
  float v63;
  double m15;
  double v65;
  double v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  double v70;
  double v71;
  double v72;
  float v73;
  float v74;
  double m21;
  double v76;
  double v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  double v81;
  double v82;
  double v83;
  float v84;
  float v85;
  double m22;
  double v87;
  double v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  double v92;
  double v93;
  double v94;
  float v95;
  float v96;
  double m23;
  double v98;
  double v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  double v103;
  double v104;
  double v105;
  float v106;
  float v107;
  double m24;
  double v109;
  double v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  double v114;
  double v115;
  double v116;
  float v117;
  float v118;
  double m25;
  double v120;
  double v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  double v125;
  double v126;
  double v127;
  float v128;
  float v129;
  double m31;
  double v131;
  double v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  double v136;
  double v137;
  double v138;
  float v139;
  float v140;
  double m32;
  double v142;
  double v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  double v147;
  double v148;
  double v149;
  float v150;
  float v151;
  double m33;
  double v153;
  double v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  double v158;
  double v159;
  double v160;
  float v161;
  float v162;
  double m34;
  double v164;
  double v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  double v169;
  double v170;
  double v171;
  float v172;
  float v173;
  double m35;
  double v175;
  double v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  double v180;
  double v181;
  double v182;
  float v183;
  float v184;
  double m41;
  double v186;
  double v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  double v191;
  double v192;
  double v193;
  float v194;
  float v195;
  double m42;
  double v197;
  double v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  double v202;
  double v203;
  double v204;
  float v205;
  float v206;
  double m43;
  double v208;
  double v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  double v213;
  double v214;
  double v215;
  float v216;
  float v217;
  double m44;
  double v219;
  double v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  double v224;
  double v225;
  double v226;
  float v227;
  float v228;
  double m45;
  double v230;
  double v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  double v235;
  double v236;
  double v237;
  float v238;
  float v239;
  float v240;
  float v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  uint64_t v248;
  double v249;
  double v250;
  double v251;
  double v252;
  $F24F406B2B787EFB06265DBA3D28CBD5 v253;
  $F24F406B2B787EFB06265DBA3D28CBD5 v254;
  __int128 v255;
  double v256;
  double v257;
  double v258;
  double v259;
  $F24F406B2B787EFB06265DBA3D28CBD5 v260;
  $F24F406B2B787EFB06265DBA3D28CBD5 v261;
  __int128 v262;
  $F24F406B2B787EFB06265DBA3D28CBD5 var0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v264;
  __int128 v265;

  var1 = a8->var1;
  var0 = a8->var0;
  v264 = var1;
  v265 = *(_OWORD *)&a8->var2;
  a7->var2.var0 = *((float *)a4 + 2);
  m11 = self->_colorMatrix.m11;
  var1.var0 = *((float *)a3 + 2);
  v18 = *((float *)a6 + 2);
  v249 = *((float *)a5 + 2);
  v250 = v18;
  v251 = m11;
  v252 = var1.var0;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v19 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v19;
  v248 = *(_QWORD *)&a7->var3;
  v20 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v20;
  v21 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v21;
  v22 = (float *)a6;
  v23 = (float *)a5;
  v24 = (float *)a4;
  v25 = (float *)a3;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v26 = v256;
  v27 = v257;
  v28 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v29 = v258;
  self->_colorMatrix.m11 = v29;
  v30 = v28;
  *((float *)a3 + 2) = v30;
  *(float *)&v26 = v26;
  *((_DWORD *)a5 + 2) = LODWORD(v26);
  *(float *)&v26 = v27;
  *((_DWORD *)a6 + 2) = LODWORD(v26);
  a7->var2.var0 = v24[3];
  m12 = self->_colorMatrix.m12;
  v32 = v25[3];
  v33 = v22[3];
  v249 = v23[3];
  v250 = v33;
  v251 = m12;
  v252 = v32;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v34 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v34;
  v248 = *(_QWORD *)&a7->var3;
  v35 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v35;
  v36 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v36;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v37 = v256;
  v38 = v257;
  v39 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v40 = v258;
  self->_colorMatrix.m12 = v40;
  v41 = v39;
  v25[3] = v41;
  *(float *)&v37 = v37;
  v23[3] = *(float *)&v37;
  *(float *)&v37 = v38;
  v22[3] = *(float *)&v37;
  a7->var2.var0 = v24[4];
  m13 = self->_colorMatrix.m13;
  v43 = v25[4];
  v44 = v22[4];
  v249 = v23[4];
  v250 = v44;
  v251 = m13;
  v252 = v43;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v45 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v45;
  v248 = *(_QWORD *)&a7->var3;
  v46 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v46;
  v47 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v47;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v48 = v256;
  v49 = v257;
  v50 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v51 = v258;
  self->_colorMatrix.m13 = v51;
  v52 = v50;
  v25[4] = v52;
  *(float *)&v48 = v48;
  v23[4] = *(float *)&v48;
  *(float *)&v48 = v49;
  v22[4] = *(float *)&v48;
  a7->var2.var0 = v24[5];
  m14 = self->_colorMatrix.m14;
  v54 = v25[5];
  v55 = v22[5];
  v249 = v23[5];
  v250 = v55;
  v251 = m14;
  v252 = v54;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v56 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v56;
  v248 = *(_QWORD *)&a7->var3;
  v57 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v57;
  v58 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v58;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v59 = v256;
  v60 = v257;
  v61 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v62 = v258;
  self->_colorMatrix.m14 = v62;
  v63 = v61;
  v25[5] = v63;
  *(float *)&v59 = v59;
  v23[5] = *(float *)&v59;
  *(float *)&v59 = v60;
  v22[5] = *(float *)&v59;
  a7->var2.var0 = v24[6];
  m15 = self->_colorMatrix.m15;
  v65 = v25[6];
  v66 = v22[6];
  v249 = v23[6];
  v250 = v66;
  v251 = m15;
  v252 = v65;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v67 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v67;
  v248 = *(_QWORD *)&a7->var3;
  v68 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v68;
  v69 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v69;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v70 = v256;
  v71 = v257;
  v72 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v73 = v258;
  self->_colorMatrix.m15 = v73;
  v74 = v72;
  v25[6] = v74;
  *(float *)&v70 = v70;
  v23[6] = *(float *)&v70;
  *(float *)&v70 = v71;
  v22[6] = *(float *)&v70;
  a7->var2.var0 = v24[7];
  m21 = self->_colorMatrix.m21;
  v76 = v25[7];
  v77 = v22[7];
  v249 = v23[7];
  v250 = v77;
  v251 = m21;
  v252 = v76;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v78 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v78;
  v248 = *(_QWORD *)&a7->var3;
  v79 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v79;
  v80 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v80;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v81 = v256;
  v82 = v257;
  v83 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v84 = v258;
  self->_colorMatrix.m21 = v84;
  v85 = v83;
  v25[7] = v85;
  *(float *)&v81 = v81;
  v23[7] = *(float *)&v81;
  *(float *)&v81 = v82;
  v22[7] = *(float *)&v81;
  a7->var2.var0 = v24[8];
  m22 = self->_colorMatrix.m22;
  v87 = v25[8];
  v88 = v22[8];
  v249 = v23[8];
  v250 = v88;
  v251 = m22;
  v252 = v87;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v89 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v89;
  v248 = *(_QWORD *)&a7->var3;
  v90 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v90;
  v91 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v91;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v92 = v256;
  v93 = v257;
  v94 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v95 = v258;
  self->_colorMatrix.m22 = v95;
  v96 = v94;
  v25[8] = v96;
  *(float *)&v92 = v92;
  v23[8] = *(float *)&v92;
  *(float *)&v92 = v93;
  v22[8] = *(float *)&v92;
  a7->var2.var0 = v24[9];
  m23 = self->_colorMatrix.m23;
  v98 = v25[9];
  v99 = v22[9];
  v249 = v23[9];
  v250 = v99;
  v251 = m23;
  v252 = v98;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v100 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v100;
  v248 = *(_QWORD *)&a7->var3;
  v101 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v101;
  v102 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v102;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v103 = v256;
  v104 = v257;
  v105 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v106 = v258;
  self->_colorMatrix.m23 = v106;
  v107 = v105;
  v25[9] = v107;
  *(float *)&v103 = v103;
  v23[9] = *(float *)&v103;
  *(float *)&v103 = v104;
  v22[9] = *(float *)&v103;
  a7->var2.var0 = v24[10];
  m24 = self->_colorMatrix.m24;
  v109 = v25[10];
  v110 = v22[10];
  v249 = v23[10];
  v250 = v110;
  v251 = m24;
  v252 = v109;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v111 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v111;
  v248 = *(_QWORD *)&a7->var3;
  v112 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v112;
  v113 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v113;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v114 = v256;
  v115 = v257;
  v116 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v117 = v258;
  self->_colorMatrix.m24 = v117;
  v118 = v116;
  v25[10] = v118;
  *(float *)&v114 = v114;
  v23[10] = *(float *)&v114;
  *(float *)&v114 = v115;
  v22[10] = *(float *)&v114;
  a7->var2.var0 = v24[11];
  m25 = self->_colorMatrix.m25;
  v120 = v25[11];
  v121 = v22[11];
  v249 = v23[11];
  v250 = v121;
  v251 = m25;
  v252 = v120;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v122 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v122;
  v248 = *(_QWORD *)&a7->var3;
  v123 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v123;
  v124 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v124;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v125 = v256;
  v126 = v257;
  v127 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v128 = v258;
  self->_colorMatrix.m25 = v128;
  v129 = v127;
  v25[11] = v129;
  *(float *)&v125 = v125;
  v23[11] = *(float *)&v125;
  *(float *)&v125 = v126;
  v22[11] = *(float *)&v125;
  a7->var2.var0 = v24[12];
  m31 = self->_colorMatrix.m31;
  v131 = v25[12];
  v132 = v22[12];
  v249 = v23[12];
  v250 = v132;
  v251 = m31;
  v252 = v131;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v133 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v133;
  v248 = *(_QWORD *)&a7->var3;
  v134 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v134;
  v135 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v135;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v136 = v256;
  v137 = v257;
  v138 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v139 = v258;
  self->_colorMatrix.m31 = v139;
  v140 = v138;
  v25[12] = v140;
  *(float *)&v136 = v136;
  v23[12] = *(float *)&v136;
  *(float *)&v136 = v137;
  v22[12] = *(float *)&v136;
  a7->var2.var0 = v24[13];
  m32 = self->_colorMatrix.m32;
  v142 = v25[13];
  v143 = v22[13];
  v249 = v23[13];
  v250 = v143;
  v251 = m32;
  v252 = v142;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v144 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v144;
  v248 = *(_QWORD *)&a7->var3;
  v145 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v145;
  v146 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v146;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v147 = v256;
  v148 = v257;
  v149 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v150 = v258;
  self->_colorMatrix.m32 = v150;
  v151 = v149;
  v25[13] = v151;
  *(float *)&v147 = v147;
  v23[13] = *(float *)&v147;
  *(float *)&v147 = v148;
  v22[13] = *(float *)&v147;
  a7->var2.var0 = v24[14];
  m33 = self->_colorMatrix.m33;
  v153 = v25[14];
  v154 = v22[14];
  v249 = v23[14];
  v250 = v154;
  v251 = m33;
  v252 = v153;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v155 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v155;
  v248 = *(_QWORD *)&a7->var3;
  v156 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v156;
  v157 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v157;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v158 = v256;
  v159 = v257;
  v160 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v161 = v258;
  self->_colorMatrix.m33 = v161;
  v162 = v160;
  v25[14] = v162;
  *(float *)&v158 = v158;
  v23[14] = *(float *)&v158;
  *(float *)&v158 = v159;
  v22[14] = *(float *)&v158;
  a7->var2.var0 = v24[15];
  m34 = self->_colorMatrix.m34;
  v164 = v25[15];
  v165 = v22[15];
  v249 = v23[15];
  v250 = v165;
  v251 = m34;
  v252 = v164;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v166 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v166;
  v248 = *(_QWORD *)&a7->var3;
  v167 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v167;
  v168 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v168;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v169 = v256;
  v170 = v257;
  v171 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v172 = v258;
  self->_colorMatrix.m34 = v172;
  v173 = v171;
  v25[15] = v173;
  *(float *)&v169 = v169;
  v23[15] = *(float *)&v169;
  *(float *)&v169 = v170;
  v22[15] = *(float *)&v169;
  a7->var2.var0 = v24[16];
  m35 = self->_colorMatrix.m35;
  v175 = v25[16];
  v176 = v22[16];
  v249 = v23[16];
  v250 = v176;
  v251 = m35;
  v252 = v175;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v177 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v177;
  v248 = *(_QWORD *)&a7->var3;
  v178 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v178;
  v179 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v179;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v180 = v256;
  v181 = v257;
  v182 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v183 = v258;
  self->_colorMatrix.m35 = v183;
  v184 = v182;
  v25[16] = v184;
  *(float *)&v180 = v180;
  v23[16] = *(float *)&v180;
  *(float *)&v180 = v181;
  v22[16] = *(float *)&v180;
  a7->var2.var0 = v24[17];
  m41 = self->_colorMatrix.m41;
  v186 = v25[17];
  v187 = v22[17];
  v249 = v23[17];
  v250 = v187;
  v251 = m41;
  v252 = v186;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v188 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v188;
  v248 = *(_QWORD *)&a7->var3;
  v189 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v189;
  v190 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v190;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v191 = v256;
  v192 = v257;
  v193 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v194 = v258;
  self->_colorMatrix.m41 = v194;
  v195 = v193;
  v25[17] = v195;
  *(float *)&v191 = v191;
  v23[17] = *(float *)&v191;
  *(float *)&v191 = v192;
  v22[17] = *(float *)&v191;
  a7->var2.var0 = v24[18];
  m42 = self->_colorMatrix.m42;
  v197 = v25[18];
  v198 = v22[18];
  v249 = v23[18];
  v250 = v198;
  v251 = m42;
  v252 = v197;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v199 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v199;
  v248 = *(_QWORD *)&a7->var3;
  v200 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v200;
  v201 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v201;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v202 = v256;
  v203 = v257;
  v204 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v205 = v258;
  self->_colorMatrix.m42 = v205;
  v206 = v204;
  v25[18] = v206;
  *(float *)&v202 = v202;
  v23[18] = *(float *)&v202;
  *(float *)&v202 = v203;
  v22[18] = *(float *)&v202;
  a7->var2.var0 = v24[19];
  m43 = self->_colorMatrix.m43;
  v208 = v25[19];
  v209 = v22[19];
  v249 = v23[19];
  v250 = v209;
  v251 = m43;
  v252 = v208;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v210 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v210;
  v248 = *(_QWORD *)&a7->var3;
  v211 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v211;
  v212 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v212;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v213 = v256;
  v214 = v257;
  v215 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v216 = v258;
  self->_colorMatrix.m43 = v216;
  v217 = v215;
  v25[19] = v217;
  *(float *)&v213 = v213;
  v23[19] = *(float *)&v213;
  *(float *)&v213 = v214;
  v22[19] = *(float *)&v213;
  a7->var2.var0 = v24[20];
  m44 = self->_colorMatrix.m44;
  v219 = v25[20];
  v220 = v22[20];
  v249 = v23[20];
  v250 = v220;
  v251 = m44;
  v252 = v219;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v221 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v221;
  v248 = *(_QWORD *)&a7->var3;
  v222 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v222;
  v223 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v223;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);
  v224 = v256;
  v225 = v257;
  v226 = v259;
  var0 = v260;
  v264 = v261;
  v265 = v262;
  v227 = v258;
  self->_colorMatrix.m44 = v227;
  v228 = v226;
  v25[20] = v228;
  *(float *)&v224 = v224;
  v23[20] = *(float *)&v224;
  *(float *)&v224 = v225;
  v22[20] = *(float *)&v224;
  a7->var2.var0 = v24[21];
  m45 = self->_colorMatrix.m45;
  v230 = v25[21];
  v231 = v22[21];
  v249 = v23[21];
  v250 = v231;
  v251 = m45;
  v252 = v230;
  v253 = var0;
  v254 = v264;
  v255 = v265;
  v232 = *(_OWORD *)&a7->var2.var2;
  v246 = *(_OWORD *)&a7->var2.var0;
  v247 = v232;
  v248 = *(_QWORD *)&a7->var3;
  v233 = *(_OWORD *)&a7->var0.var2;
  v242 = *(_OWORD *)&a7->var0.var0;
  v243 = v233;
  v234 = *(_OWORD *)&a7->var1.var2;
  v244 = *(_OWORD *)&a7->var1.var0;
  v245 = v234;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v249, &v242, a9);

  v235 = v256;
  v236 = v257;
  v237 = v259;
  v238 = v258;
  self->_colorMatrix.m45 = v238;
  v239 = v237;
  v25[21] = v239;

  v240 = v235;
  v23[21] = v240;

  v241 = v236;
  v22[21] = v241;

}

- (id)addVector:(id)a3
{
  *(float32x4_t *)((char *)self + 8) = vaddq_f32(*(float32x4_t *)((char *)a3 + 8), *(float32x4_t *)((char *)self + 8));
  *(float32x4_t *)((char *)self + 24) = vaddq_f32(*(float32x4_t *)((char *)a3 + 24), *(float32x4_t *)((char *)self + 24));
  *(float32x4_t *)((char *)self + 40) = vaddq_f32(*(float32x4_t *)((char *)a3 + 40), *(float32x4_t *)((char *)self + 40));
  *(float32x4_t *)((char *)self + 56) = vaddq_f32(*(float32x4_t *)((char *)a3 + 56), *(float32x4_t *)((char *)self + 56));
  *(float32x4_t *)((char *)self + 72) = vaddq_f32(*(float32x4_t *)((char *)a3 + 72), *(float32x4_t *)((char *)self + 72));
  return self;
}

- (id)multiplyByScalar:(double)a3
{
  *(float32x4_t *)((char *)self + 8) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)self + 8)), a3)), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)self + 8)), a3));
  *(float32x4_t *)((char *)self + 24) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)self + 24)), a3)), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)self + 24)), a3));
  *(float32x4_t *)((char *)self + 40) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)self + 40)), a3)), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)self + 40)), a3));
  *(float32x4_t *)((char *)self + 56) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)self + 56)), a3)), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)self + 56)), a3));
  *(float32x4_t *)((char *)self + 72) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)self + 72)), a3)), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)self + 72)), a3));
  return self;
}

- (id)multiplyByVector:(id)a3
{
  *(float32x4_t *)((char *)self + 8) = vmulq_f32(*(float32x4_t *)((char *)a3 + 8), *(float32x4_t *)((char *)self + 8));
  *(float32x4_t *)((char *)self + 24) = vmulq_f32(*(float32x4_t *)((char *)a3 + 24), *(float32x4_t *)((char *)self + 24));
  *(float32x4_t *)((char *)self + 40) = vmulq_f32(*(float32x4_t *)((char *)a3 + 40), *(float32x4_t *)((char *)self + 40));
  *(float32x4_t *)((char *)self + 56) = vmulq_f32(*(float32x4_t *)((char *)a3 + 56), *(float32x4_t *)((char *)self + 56));
  *(float32x4_t *)((char *)self + 72) = vmulq_f32(*(float32x4_t *)((char *)a3 + 72), *(float32x4_t *)((char *)self + 72));
  return self;
}

- (BOOL)isApproximatelyEqualTo:(id)a3 withinEpsilon:(id)a4
{
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;

  v4 = *(float32x4_t *)&self->_colorMatrix.m11;
  v5 = *(float32x4_t *)&self->_colorMatrix.m15;
  v6 = *(float32x4_t *)&self->_colorMatrix.m24;
  v7 = *(float32x4_t *)((char *)a3 + 8);
  v8 = *(float32x4_t *)((char *)a3 + 24);
  v9 = *(float32x4_t *)((char *)a3 + 40);
  return ~vmaxvq_u8((uint8x16_t)vuzp1q_s8(vmvnq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)a4 + 8)), vabdq_f64(vcvtq_f64_f32(*(float32x2_t *)v4.f32), vcvtq_f64_f32(*(float32x2_t *)v7.f32))), (int32x4_t)vcgtq_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)a4 + 8)), vabdq_f64(vcvt_hight_f64_f32(v4), vcvt_hight_f64_f32(v7)))), (int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)a4 + 24)), vabdq_f64(vcvtq_f64_f32(*(float32x2_t *)v5.f32), vcvtq_f64_f32(*(float32x2_t *)v8.f32))), (int32x4_t)vcgtq_f64(
                                                                                  vcvt_hight_f64_f32(*(float32x4_t *)((char *)a4 + 24)),
                                                                                  vabdq_f64(vcvt_hight_f64_f32(v5), vcvt_hight_f64_f32(v8)))))), vmvnq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)a4 + 40)), vabdq_f64(vcvtq_f64_f32(*(float32x2_t *)v6.f32), vcvtq_f64_f32(*(float32x2_t *)v9.f32))), (int32x4_t)vcgtq_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)a4 + 40)), vabdq_f64(vcvt_hight_f64_f32(v6), vcvt_hight_f64_f32(v9)))), (int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)a4 + 56)), vabdq_f64(vcvtq_f64_f32(*(float32x2_t *)&self->_colorMatrix.m33),
                                                                                    vcvtq_f64_f32(*(float32x2_t *)((char *)a3 + 56)))),
                                                                     (int32x4_t)vcgtq_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)a4 + 56)), vabdq_f64(vcvt_hight_f64_f32(*(float32x4_t *)&self->_colorMatrix.m33), vcvt_hight_f64_f32(*(float32x4_t *)((char *)a3 + 56))))))))) & ~vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_f64(vcvtq_f64_f32(*(float32x2_t *)((char *)a4 + 72)), vabdq_f64(vcvtq_f64_f32(*(float32x2_t *)&self->_colorMatrix.m42), vcvtq_f64_f32(*(float32x2_t *)((char *)a3 + 72)))), (int32x4_t)vcgtq_f64(vcvt_hight_f64_f32(*(float32x4_t *)((char *)a4 + 72)), vabdq_f64(vcvt_hight_f64_f32(*(float32x4_t *)&self->_colorMatrix.m42), vcvt_hight_f64_f32(*(float32x4_t *)((char *)a3 + 72)))))))) & 1;
}

- (BOOL)isUndefined
{
  BOOL v2;

  v2 = 1;
  if (fabsf(self->_colorMatrix.m11) != INFINITY
    && fabsf(self->_colorMatrix.m12) != INFINITY
    && fabsf(self->_colorMatrix.m13) != INFINITY
    && fabsf(self->_colorMatrix.m14) != INFINITY
    && fabsf(self->_colorMatrix.m15) != INFINITY
    && fabsf(self->_colorMatrix.m21) != INFINITY
    && fabsf(self->_colorMatrix.m22) != INFINITY
    && fabsf(self->_colorMatrix.m23) != INFINITY
    && fabsf(self->_colorMatrix.m24) != INFINITY
    && fabsf(self->_colorMatrix.m25) != INFINITY
    && fabsf(self->_colorMatrix.m31) != INFINITY
    && fabsf(self->_colorMatrix.m32) != INFINITY
    && fabsf(self->_colorMatrix.m33) != INFINITY
    && fabsf(self->_colorMatrix.m34) != INFINITY
    && fabsf(self->_colorMatrix.m35) != INFINITY
    && fabsf(self->_colorMatrix.m41) != INFINITY
    && fabsf(self->_colorMatrix.m42) != INFINITY
    && fabsf(self->_colorMatrix.m43) != INFINITY
    && fabsf(self->_colorMatrix.m44) != INFINITY)
  {
    return fabsf(self->_colorMatrix.m45) == INFINITY;
  }
  return v2;
}

+ (id)epsilonCompatibleWithVector:(id)a3
{
  if (qword_1ECD821B0 != -1)
    dispatch_once(&qword_1ECD821B0, &__block_literal_global_615);
  return (id)_MergedGlobals_1296;
}

void __57__UIInterpolatedColorMatrix_epsilonCompatibleWithVector___block_invoke()
{
  UIInterpolatedColorMatrix *v0;
  void *v1;
  _OWORD v2[5];

  v2[0] = vdupq_n_s32(0x3C23D70Au);
  v2[1] = v2[0];
  v2[2] = v2[0];
  v2[3] = v2[0];
  v2[4] = v2[0];
  v0 = -[UIInterpolatedColorMatrix initWithColorMatrix:]([UIInterpolatedColorMatrix alloc], "initWithColorMatrix:", v2);
  v1 = (void *)_MergedGlobals_1296;
  _MergedGlobals_1296 = (uint64_t)v0;

}

void __54__UIInterpolatedColorMatrix_zeroCompatibleWithVector___block_invoke()
{
  UIInterpolatedColorMatrix *v0;
  void *v1;
  _OWORD v2[5];

  memset(v2, 0, sizeof(v2));
  v0 = -[UIInterpolatedColorMatrix initWithColorMatrix:]([UIInterpolatedColorMatrix alloc], "initWithColorMatrix:", v2);
  v1 = (void *)qword_1ECD821B8;
  qword_1ECD821B8 = (uint64_t)v0;

}

- (NSString)debugDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ColorMatrix: [m11 %f m12 %f m13 %f m14 %f m15 %f m21 %f m22 %f m23 %f m24 %f m25 %f m31 %f m32 %f m33 %f m34 %f m35 %f m41 %f m42 %f m43 %f m44 %f m45 %f]"), self->_colorMatrix.m11, self->_colorMatrix.m12, self->_colorMatrix.m13, self->_colorMatrix.m14, self->_colorMatrix.m15, self->_colorMatrix.m21, self->_colorMatrix.m22, self->_colorMatrix.m23, self->_colorMatrix.m24, self->_colorMatrix.m25, self->_colorMatrix.m31, self->_colorMatrix.m32, self->_colorMatrix.m33, self->_colorMatrix.m34, self->_colorMatrix.m35, self->_colorMatrix.m41,
                       self->_colorMatrix.m42,
                       self->_colorMatrix.m43,
                       self->_colorMatrix.m44,
                       self->_colorMatrix.m45);
}

@end
