@implementation VKCamera

- (id)annotationCoordinateTest
{
  return -[VKFootprint annotationCoordinateTest](self->_footprint, "annotationCoordinateTest");
}

- (optional<double>)maxDistanceToGroundRestriction
{
  uint64_t v2;
  optional<double> result;

  *(_BYTE *)v2 = 0;
  if (self->_maxDistanceToGroundRestriction._hasValue)
  {
    *(double *)(v2 + 8) = self->_maxDistanceToGroundRestriction._value.type;
    *(_BYTE *)v2 = 1;
  }
  result._value = (ValueUnion)a2;
  result._hasValue = (char)self;
  return result;
}

- (optional<gm::Matrix<double,)groundPointFromScreenPoint:(CGPoint)a3 atGroundLevel:(double)a4
{
  uint64_t v4;
  double y;
  double x;
  uint64_t v9;
  uint64_t v10;
  ValueUnion v11;
  double horizontalOffset;
  double v13;
  double v14;
  double v15;
  double v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  double v21;
  double v22;
  float64x2_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  optional<gm::Matrix<double, 3, 1>> result;

  y = a3.y;
  x = a3.x;
  v9 = v4;
  v10 = -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  horizontalOffset = self->_horizontalOffset;
  v13 = self->_transform._translation._e[2];
  v14 = self->_forward._e[2];
  v15 = self->_right._e[2];
  v16 = self->_up._e[2];
  v17 = *(float64x2_t *)self->_transform._translation._e;
  v18 = *(float64x2_t *)self->_forward._e;
  v19 = *(float64x2_t *)self->_right._e;
  v20 = *(float64x2_t *)self->_up._e;
  *(_BYTE *)v9 = 0;
  if (v13 > 0.0)
  {
    v21 = (x - horizontalOffset) * 2.0 + -1.0;
    v22 = y * 2.0 + -1.0;
    v23 = vmlaq_n_f64(vmlaq_n_f64(v18, v19, v21), v20, v22);
    v24 = v14 + v15 * v21 + v16 * v22;
    v25 = 1.0 / sqrt(vaddvq_f64(vmulq_f64(v23, v23)) + v24 * v24);
    v26 = v25 * v24;
    if (v26 < 0.0)
    {
      v27 = (a4 - v13) / v26;
      *(float64x2_t *)(v9 + 8) = vmlaq_n_f64(v17, v23, v27 * v25);
      *(double *)(v9 + 24) = v13 + v27 * v26;
      *(_BYTE *)v9 = 1;
    }
  }
  result._value = v11;
  result._hasValue = v10;
  return result;
}

- (optional<gm::Matrix<double,)groundPointFromScreenPoint:(CGPoint)a3
{
  uint64_t v3;
  ValueUnion v4;
  optional<gm::Matrix<double, 3, 1>> result;

  v3 = -[VKCamera groundPointFromScreenPoint:atGroundLevel:](self, "groundPointFromScreenPoint:atGroundLevel:", a3.x, a3.y, 0.0);
  result._value = v4;
  result._hasValue = v3;
  return result;
}

- (optional<double>)minDistanceToGroundRestriction
{
  uint64_t v2;
  optional<double> result;

  *(_BYTE *)v2 = 0;
  if (self->_minDistanceToGroundRestriction._hasValue)
  {
    *(double *)(v2 + 8) = self->_minDistanceToGroundRestriction._value.type;
    *(_BYTE *)v2 = 1;
  }
  result._value = (ValueUnion)a2;
  result._hasValue = (char)self;
  return result;
}

- (double)maxPitch
{
  return self->_maxPitch;
}

- (void)setMinHeight:(double)a3
{
  self->_minHeight = a3;
}

- (void)setMaxPitch:(double)a3
{
  self->_maxPitch = a3;
}

- (void)setMaxHeightNoPitch:(double)a3
{
  self->_maxHeightNoPitch = a3;
}

- (void)setMaxHeight:(double)a3
{
  self->_maxHeight = a3;
}

- (VKCameraState)cameraState
{
  __int128 v3;
  double v4;

  v3 = *(_OWORD *)self[4].var0._rotation._imaginary._e;
  *(_OWORD *)&retstr->var0._translation._e[2] = *(_OWORD *)&self[4].var0._translation._e[1];
  *(_OWORD *)&retstr->var0._rotation._imaginary._e[1] = v3;
  *(double *)&v3 = self[4].var0._rotation._imaginary._e[2];
  *(_OWORD *)retstr->var0._translation._e = *(_OWORD *)&self[3].var3;
  v4 = self[3].var0._rotation._imaginary._e[0];
  *(_QWORD *)&retstr->var0._rotation._scalar = v3;
  retstr->var1 = v4;
  retstr->var2._value = self[3].var0._rotation._imaginary._e[1];
  retstr->var3 = self[3].var0._translation._e[0];
  return self;
}

- (double)pitch
{
  float64x2_t v2;

  v2 = vmulq_f64(vmulq_f64(*(float64x2_t *)self->_transform._rotation._imaginary._e, *(float64x2_t *)self->_transform._rotation._imaginary._e), (float64x2_t)xmmword_19FFB3340);
  return acos(fmin(fmax(1.0 - v2.f64[1] + v2.f64[0], -1.0), 1.0));
}

- (double)widthOfViewAtDepth:(double)a3
{
  double v4;

  -[VKCamera tanHalfHorizFOV](self, "tanHalfHorizFOV");
  return a3 * (v4 + v4);
}

- (VKFootprint)footprint
{
  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  return self->_footprint;
}

- (double)tanHalfHorizFOV
{
  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  return self->_tanHalfHorizFOV;
}

- (double)yaw
{
  double v3;
  double v4;
  double v5;
  long double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  -[VKCamera upVector](self, "upVector");
  v4 = v3;
  v6 = -1.0;
  v8 = -v5 / sqrt(-(v7 * v7 + -1.0));
  if (v8 > -1.0)
  {
    v6 = 1.0;
    if (v8 < 1.0)
      v6 = v8;
  }
  v9 = acos(v6);
  if (v4 <= 0.0)
    v9 = -v9;
  v10 = v9 + 3.14159265;
  v11 = v9 + -3.14159265;
  if (v10 <= 3.14159265)
    v11 = v10;
  return -v11;
}

- (Matrix<double,)upVector
{
  double v3;
  double v4;
  double v5;
  Matrix<double, 3, 1> result;

  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  v3 = self->_worldMatrix._e[4];
  v4 = self->_worldMatrix._e[5];
  v5 = self->_worldMatrix._e[6];
  result._e[2] = v5;
  result._e[1] = v4;
  result._e[0] = v3;
  return result;
}

- (Matrix<double,)forwardVector
{
  double v3;
  double v4;
  double v5;
  Matrix<double, 3, 1> result;

  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  v3 = -self->_worldMatrix._e[8];
  v4 = -self->_worldMatrix._e[9];
  v5 = -self->_worldMatrix._e[10];
  result._e[2] = v5;
  result._e[1] = v4;
  result._e[0] = v3;
  return result;
}

- (void)updateIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  long double v8;
  long double v9;
  long double v10;
  long double v11;
  long double v12;
  unsigned __int8 v13;
  double v14;
  double v15;
  double v16;
  double scalar;
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
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  double aspectRatio;
  double near;
  double far;
  double ndcZNear;
  long double v68;
  long double v69;
  double v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  VKViewVolume *viewVolume;
  __int128 v84;
  __int128 v85;
  double v86;
  double v87;
  double v88;
  long double v89;
  __double2 v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  _OWORD v102[3];
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  double v111;
  __int128 v112;
  __int128 v113;
  double v114;
  __int128 v115;
  __int128 v116;
  double v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  double v121;
  uint64_t v122;
  _BYTE v123[48];
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint64_t v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  double v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;

  if (self->_needsUpdate && !self->_updating)
  {
    self->_updating = 1;
    -[VKCamera cameraState](self, "cameraState");
    v3 = v141;
    v4 = v142;
    v5 = v143;
    v6 = v144;
    v7 = v145;
    v8 = tan(v146 * 0.5);
    self->_forward._e[0] = -(v143 * (v141 + v141) - v144 * (v142 * -2.0));
    self->_forward._e[1] = v4 * -2.0 * v5 + v6 * (v3 + v3);
    v9 = v5 * (v8 * v7 + v8 * v7);
    v10 = v4 * -2.0 * (v8 * v7);
    self->_forward._e[2] = -(v4 * -2.0 * v4 - ((v3 + v3) * v3 + -1.0));
    self->_right._e[0] = v8 * v7 + v10 * v4 - v9 * v5;
    self->_right._e[1] = -(v10 * v3 - v9 * v6);
    self->_right._e[2] = v10 * v6 + v9 * v3;
    v11 = v5 * -2.0 * v8;
    v12 = (v3 + v3) * v8;
    self->_up._e[0] = v12 * v4 + v11 * v6;
    self->_up._e[1] = v8 + v11 * v5 - v12 * v3;
    self->_up._e[2] = -(v11 * v4 - v12 * v6);
    -[VKCamera adjustClipPlanes](self, "adjustClipPlanes");
    {
      *(_OWORD *)&qword_1EE5860F0 = 0u;
      unk_1EE586110 = 0u;
      *(_OWORD *)&algn_1EE586120[16] = 0u;
      *(_OWORD *)algn_1EE586120 = 0u;
      unk_1EE586100 = 0u;
      unk_1EE5860E0 = 0u;
      unk_1EE5860D0 = 0u;
      qword_1EE586140 = 0x3FF0000000000000;
      -[VKCamera updateIfNeeded]::scaled[0] = 16.0;
      qword_1EE5860F0 = 0x4030000000000000;
      qword_1EE586118 = 0x4030000000000000;
    }
    v14 = self->_horizontalOffset + self->_horizontalOffset;
    v132 = 0u;
    v134 = 0;
    v130 = 0u;
    v131 = 0u;
    v133 = 0u;
    v129 = 0x3FF0000000000000;
    *(_QWORD *)&v132 = 0x3FF0000000000000;
    v136 = 0;
    v135 = 0x3FF0000000000000;
    v140 = 0x3FF0000000000000;
    v137 = v14;
    v139 = 0;
    v138 = 0;
    v16 = self->_transform._rotation._imaginary._e[1];
    v15 = self->_transform._rotation._imaginary._e[2];
    scalar = self->_transform._rotation._scalar;
    v18 = (v16 + v16) * v16;
    v19 = (v15 + v15) * v15;
    v20 = 1.0 - (v18 + v19);
    v22 = self->_transform._translation._e[2];
    v21 = self->_transform._rotation._imaginary._e[0];
    v23 = (v21 + v21) * v16;
    v24 = (v15 + v15) * scalar;
    v25 = v23 - v24;
    v26 = v15 * (v21 + v21);
    v27 = scalar * (v16 + v16);
    v28 = v27 + v26;
    v29 = v24 + v23;
    v30 = 1.0 - (v21 + v21) * v21;
    v31 = v30 - v19;
    v32 = (v16 + v16) * v15;
    v33 = scalar * (v21 + v21);
    v34 = v26 - v27;
    v35 = v32 - v33;
    v36 = v33 + v32;
    v37 = v30 - v18;
    v38 = self->_transform._translation._e[0];
    v39 = self->_transform._translation._e[1];
    self->_worldMatrix._e[0] = v20;
    self->_worldMatrix._e[1] = v29;
    self->_worldMatrix._e[2] = v34;
    self->_worldMatrix._e[3] = 0.0;
    self->_worldMatrix._e[4] = v25;
    self->_worldMatrix._e[5] = v31;
    self->_worldMatrix._e[6] = v36;
    self->_worldMatrix._e[7] = 0.0;
    self->_worldMatrix._e[8] = v28;
    self->_worldMatrix._e[9] = v35;
    self->_worldMatrix._e[10] = v37;
    self->_worldMatrix._e[11] = 0.0;
    self->_worldMatrix._e[12] = v38;
    self->_worldMatrix._e[13] = v39;
    self->_worldMatrix._e[14] = v22;
    self->_worldMatrix._e[15] = 1.0;
    v40 = -(v22 * v16 - v39 * v15) - (v22 * v16 - v39 * v15);
    v41 = -(v38 * v15 - v22 * v21) - (v38 * v15 - v22 * v21);
    v42 = -(v39 * v21 - v38 * v16) - (v39 * v21 - v38 * v16);
    v43 = -(v38 + v40 * scalar + v41 * v15 - v42 * v16);
    v44 = -(v39 + v42 * v21 + v41 * scalar - v40 * v15);
    v45 = -(v22 + v42 * scalar + v40 * v16 - v41 * v21);
    v46 = v16 * -2.0;
    v47 = -(v16 * (v16 * -2.0));
    v48 = 1.0 - (v47 - v15 * (v15 * -2.0));
    v49 = v21 * -2.0;
    v50 = -(v16 * (v21 * -2.0));
    v51 = v15 * -2.0 * scalar;
    v52 = v50 - v51;
    v53 = -(v15 * (v21 * -2.0));
    v54 = scalar * v46 - v15 * (v21 * -2.0);
    v55 = v51 + v50;
    v56 = v21 * -2.0 * v21 + 1.0;
    v57 = v56 - -(v15 * (v15 * -2.0));
    v58 = -(v15 * v46);
    self->_unscaledViewMatrix._e[0] = v48;
    self->_unscaledViewMatrix._e[1] = v55;
    self->_unscaledViewMatrix._e[2] = v53 - scalar * v46;
    self->_unscaledViewMatrix._e[3] = 0.0;
    v59 = scalar * v49;
    self->_unscaledViewMatrix._e[4] = v52;
    self->_unscaledViewMatrix._e[5] = v57;
    self->_unscaledViewMatrix._e[6] = v59 + v58;
    self->_unscaledViewMatrix._e[7] = 0.0;
    self->_unscaledViewMatrix._e[8] = v54;
    self->_unscaledViewMatrix._e[9] = v58 - v59;
    self->_unscaledViewMatrix._e[10] = v56 - v47;
    self->_unscaledViewMatrix._e[11] = 0.0;
    self->_unscaledViewMatrix._e[12] = v43;
    self->_unscaledViewMatrix._e[13] = v44;
    self->_unscaledViewMatrix._e[14] = v45;
    self->_unscaledViewMatrix._e[15] = 1.0;
    gm::operator*<double,4,4,4>((double *)v123, -[VKCamera updateIfNeeded]::scaled, self->_unscaledViewMatrix._e);
    v60 = *(_OWORD *)&v123[16];
    *(_OWORD *)self->_scaledViewMatrix._e = *(_OWORD *)v123;
    *(_OWORD *)&self->_scaledViewMatrix._e[2] = v60;
    v61 = v124;
    *(_OWORD *)&self->_scaledViewMatrix._e[4] = *(_OWORD *)&v123[32];
    *(_OWORD *)&self->_scaledViewMatrix._e[6] = v61;
    v62 = v126;
    *(_OWORD *)&self->_scaledViewMatrix._e[8] = v125;
    *(_OWORD *)&self->_scaledViewMatrix._e[10] = v62;
    v63 = v128;
    *(_OWORD *)&self->_scaledViewMatrix._e[12] = v127;
    *(_OWORD *)&self->_scaledViewMatrix._e[14] = v63;
    aspectRatio = self->_aspectRatio;
    near = self->_near;
    far = self->_far;
    ndcZNear = self->_ndcZNear;
    v68 = tan(self->_verticalFieldOfView._value * 0.5);
    v69 = v68 * (aspectRatio + aspectRatio);
    memset(&v123[8], 0, 32);
    *(double *)v123 = (near + near) / (v69 * near);
    *(double *)&v123[40] = 1.0 / v68;
    v124 = 0u;
    v125 = 0u;
    *(double *)&v126 = -(far - ndcZNear * near) / (far - near);
    v127 = 0uLL;
    *((_QWORD *)&v126 + 1) = 0xBFF0000000000000;
    *(double *)&v128 = far * near * (ndcZNear + -1.0) / (far - near);
    *((_QWORD *)&v128 + 1) = 0;
    v112 = 0u;
    v113 = 0u;
    v111 = near * 32.0 / (v69 * (near * 16.0));
    v114 = 1.0 / v68;
    v70 = far * 16.0 - near * 16.0;
    v115 = 0u;
    v116 = 0u;
    v117 = -(far * 16.0 - ndcZNear * (near * 16.0)) / v70;
    v119 = 0;
    v120 = 0;
    v118 = 0xBFF0000000000000;
    v121 = far * 16.0 * (near * 16.0) * (ndcZNear + -1.0) / v70;
    v122 = 0;
    gm::operator*<double,4,4,4>((double *)&v103, (double *)&v129, &v111);
    v71 = v104;
    *(_OWORD *)self->_scaledProjectionMatrix._e = v103;
    *(_OWORD *)&self->_scaledProjectionMatrix._e[2] = v71;
    v72 = v106;
    *(_OWORD *)&self->_scaledProjectionMatrix._e[4] = v105;
    *(_OWORD *)&self->_scaledProjectionMatrix._e[6] = v72;
    v73 = v108;
    *(_OWORD *)&self->_scaledProjectionMatrix._e[8] = v107;
    *(_OWORD *)&self->_scaledProjectionMatrix._e[10] = v73;
    v74 = v110;
    *(_OWORD *)&self->_scaledProjectionMatrix._e[12] = v109;
    *(_OWORD *)&self->_scaledProjectionMatrix._e[14] = v74;
    gm::operator*<double,4,4,4>((double *)&v103, (double *)&v129, (double *)v123);
    v75 = v104;
    *(_OWORD *)self->_unscaledProjectionMatrix._e = v103;
    *(_OWORD *)&self->_unscaledProjectionMatrix._e[2] = v75;
    v76 = v106;
    *(_OWORD *)&self->_unscaledProjectionMatrix._e[4] = v105;
    *(_OWORD *)&self->_unscaledProjectionMatrix._e[6] = v76;
    v77 = v108;
    *(_OWORD *)&self->_unscaledProjectionMatrix._e[8] = v107;
    *(_OWORD *)&self->_unscaledProjectionMatrix._e[10] = v77;
    v78 = v110;
    *(_OWORD *)&self->_unscaledProjectionMatrix._e[12] = v109;
    *(_OWORD *)&self->_unscaledProjectionMatrix._e[14] = v78;
    gm::operator*<double,4,4,4>((double *)&v103, self->_scaledProjectionMatrix._e, self->_scaledViewMatrix._e);
    v79 = v104;
    *(_OWORD *)self->_scaledViewProjectionMatrix._e = v103;
    *(_OWORD *)&self->_scaledViewProjectionMatrix._e[2] = v79;
    v80 = v106;
    *(_OWORD *)&self->_scaledViewProjectionMatrix._e[4] = v105;
    *(_OWORD *)&self->_scaledViewProjectionMatrix._e[6] = v80;
    v81 = v108;
    *(_OWORD *)&self->_scaledViewProjectionMatrix._e[8] = v107;
    *(_OWORD *)&self->_scaledViewProjectionMatrix._e[10] = v81;
    v82 = v110;
    *(_OWORD *)&self->_scaledViewProjectionMatrix._e[12] = v109;
    *(_OWORD *)&self->_scaledViewProjectionMatrix._e[14] = v82;
    viewVolume = self->_viewVolume;
    v84 = *(_OWORD *)&self->_frustum.orthographic;
    v85 = *(_OWORD *)&self->_frustum.far;
    v102[1] = *(_OWORD *)&self->_frustum.height;
    v102[2] = v85;
    v102[0] = v84;
    -[VKViewVolume updateWithFrustum:matrix:](viewVolume, "updateWithFrustum:matrix:", v102, &self->_worldMatrix);
    -[VKFootprint computeFromCamera:](self->_footprint, "computeFromCamera:", self);
    *(_WORD *)&self->_needsUpdate = 0;
    self->_tanHalfHorizFOV = self->_width * 0.5 / self->_near;
    -[VKCamera farClipDistance](self, "farClipDistance");
    v87 = v86;
    -[VKCamera pitch](self, "pitch");
    v89 = 1.57079633 - v88;
    v90 = __sincos_stret(1.57079633 - v88);
    v91 = self->_transform._translation._e[2] / v90.__sinval;
    self->_screenHeightOfGroundAndFarClipPlaneIntersection = (self->_tanHalfVerticalFOV * v87 + (v87 - v91) * tan(v89))
                                                           / (self->_tanHalfVerticalFOV * v87
                                                            + self->_tanHalfVerticalFOV * v87);
    v92 = 1.79769313e308;
    if (v90.__sinval >= 0.00001 && v90.__cosval >= 0.00001)
    {
      v93 = (v87 - v91) / v90.__cosval + v91 * v90.__cosval;
      -[VKCamera forwardVector](self, "forwardVector");
      v95 = v94;
      v97 = v96;
      v99 = v98;
      -[VKCamera rightVector](self, "rightVector");
      v92 = -(-(v100 * v97 - v101 * v95) * v93 / sqrt(v101 * v101 + v100 * v100)
            + self->_transform._translation._e[2] * v99);
    }
    self->_distanceToGroundAndFarClipPlaneIntersection = v92;
  }
}

- (CameraFrame<geo::Radians,)cameraFrame:(VKCamera *)self
{
  double v7;
  long double v8;
  double v9;
  long double v10;
  long double v11;
  long double v12;
  long double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  long double v18;
  double v19;
  long double v20;
  long double v21;
  long double v22;
  long double v23;
  long double v24;
  double v25;
  long double v26;
  CameraFrame<geo::Radians, double> *result;

  *(int64x2_t *)&retstr->_target.latitude._value = vdupq_n_s64(0xC00921FB54442D18);
  *(_OWORD *)&retstr->_target.altitude._value = 0u;
  *(_OWORD *)&retstr->_pitch._value = 0u;
  retstr->_roll._value = 0.0;
  -[VKCamera position](self, "position");
  -[VKCamera position](self, "position");
  -[VKCamera groundPlaneIntersectionPoint](self, "groundPlaneIntersectionPoint");
  v8 = v7 * 6.28318531;
  v10 = exp(v9 * 6.28318531 + -3.14159265);
  v11 = atan(v10) * 2.0 + -1.57079633;
  v12 = fmod(v8, 6.28318531);
  v13 = fmod(v12 + 6.28318531, 6.28318531);
  retstr->_target.latitude._value = v11;
  retstr->_target.longitude._value = v13 + -3.14159265;
  retstr->_target.altitude._value = 0.0;
  -[VKCamera pitch](self, "pitch");
  retstr->_pitch._value = v14;
  -[VKCamera yaw](self, "yaw");
  retstr->_heading._value = -v15;
  v16 = *(double *)(-[VKCamera position](self, "position") + 16);
  -[VKCamera pitch](self, "pitch");
  v18 = v17;
  if (a4)
  {
    v19 = 0.0000000249532021;
  }
  else
  {
    v20 = cos(v11 + v11) * -559.82 + 111132.92;
    v21 = v20 + cos(v11 * 4.0) * 1.175;
    v22 = v21 + cos(v11 * 6.0) * -0.0023;
    v23 = v11 * 0.5;
    v24 = tan(v23 + 0.78103484);
    v25 = log(v24);
    v26 = tan(v23 + 0.789761487);
    v19 = fabs((log(v26) - v25) * 0.159154943) / v22;
  }
  retstr->_distanceFromTarget._value = v16 / (v19 * cos(v18));
  return result;
}

- (const)position
{
  return &self->_transform;
}

- (Matrix<double,)groundPlaneIntersectionPoint
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
  Matrix<double, 3, 1> result;

  -[VKCamera forwardVector](self, "forwardVector");
  v6 = 1.0 / sqrt(v3 * v3 + v4 * v4 + v5 * v5);
  v7 = v6 * v5;
  if (fabs(v7) >= 0.0000001 && (v8 = self->_transform._translation._e[2], v9 = -v8 / v7, v9 >= 0.0))
  {
    v10 = self->_transform._translation._e[0] + v6 * v3 * v9;
    v11 = self->_transform._translation._e[1] + v6 * v4 * v9;
    v12 = v8 + v9 * v7;
  }
  else
  {
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
  }
  result._e[2] = v12;
  result._e[1] = v11;
  result._e[0] = v10;
  return result;
}

- (VKViewVolume)viewVolume
{
  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  return self->_viewVolume;
}

- (void)adjustClipPlanes
{
  void *v3;
  float v4;
  double v5;
  double v6;
  double near;
  double far;
  long double v9;
  double v10;
  double v11;
  double horizontalOffset;

  if (self->_nearFarReset)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "farClipPlaneFactor");
    v5 = v4;

    v6 = self->_transform._translation._e[2] / -self->_forward._e[2];
    near = fmax(v6 * 0.15, 0.000000124766011);
    far = fmax(v6 * v5, 0.0000149719213);
    self->_near = near;
    self->_far = far;
  }
  else
  {
    near = self->_near;
    far = self->_far;
  }
  v9 = tan(self->_verticalFieldOfView._value * 0.5);
  v10 = near * (v9 + v9);
  v11 = v10 * self->_aspectRatio;
  self->_width = v11;
  self->_height = v10;
  horizontalOffset = self->_horizontalOffset;
  self->_frustum.orthographic = 0;
  self->_frustum.width = v11;
  self->_frustum.height = v10;
  self->_frustum.near = near;
  self->_frustum.far = far;
  self->_frustum.horizontalOffset = horizontalOffset;
  self->_nearFarReset = 1;
}

- (void)setNeedsUpdate
{
  RunLoopController *runLoopController;
  uint64_t var0;
  char v4;

  self->_needsUpdate = 1;
  runLoopController = self->_runLoopController;
  if (runLoopController)
  {
    var0 = (uint64_t)runLoopController->var0;
    if (runLoopController->var0)
    {
      v4 = 4;
      md::MapEngine::setNeedsTick(var0, &v4);
    }
  }
}

- (void)setOrientation:(const void *)a3
{
  BOOL v4;

  v4 = *(_QWORD *)&self->_transform._rotation._imaginary._e[0] == *(_QWORD *)a3
    && *(_QWORD *)&self->_transform._rotation._imaginary._e[1] == *((_QWORD *)a3 + 1)
    && *(_QWORD *)&self->_transform._rotation._imaginary._e[2] == *((_QWORD *)a3 + 2);
  if (!v4 || self->_transform._rotation._scalar != *((double *)a3 + 3))
  {
    self->_transform._rotation = *(Quaternion<double> *)a3;
    -[VKCamera setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (double)farClipDistance
{
  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  return self->_far;
}

- (Unit<geo::RadianUnitDescription,)verticalFieldOfView
{
  _QWORD *v2;
  Unit<geo::RadianUnitDescription, double> v3;

  v3._value = self->_verticalFieldOfView._value;
  *v2 = *(Unit<geo::RadianUnitDescription, double> *)&v3._value;
  return v3;
}

- (double)nearClipDistance
{
  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  return self->_near;
}

- (double)horizontalOffset
{
  return self->_horizontalOffset;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *((_QWORD *)self + 45) = 0x3FF0000000000000;
  *((_BYTE *)self + 1152) = 0;
  *((_BYTE *)self + 1168) = 0;
  return self;
}

- (id)annotationRectTest
{
  return -[VKFootprint annotationRectTest](self->_footprint, "annotationRectTest");
}

- (void)setNdcZNear:(double)a3
{
  self->_ndcZNear = a3;
}

- (void)setMercatorPosition:(const void *)a3
{
  long double v5;
  long double v6;
  long double v7;
  long double v8;
  long double v9;
  long double v10;
  long double v11;
  double v12;
  long double v13;
  long double v14;
  __int128 v15;
  double v16;

  v5 = exp(*((double *)a3 + 1) * 6.28318531 + -3.14159265);
  v6 = atan(v5) * 2.0 + -1.57079633;
  v7 = cos(v6 + v6) * -559.82 + 111132.92;
  v8 = v7 + cos(v6 * 4.0) * 1.175;
  v9 = v8 + cos(v6 * 6.0) * -0.0023;
  v10 = v6 * 0.5;
  v11 = tan(v6 * 0.5 + 0.78103484);
  v12 = log(v11);
  v13 = tan(v10 + 0.789761487);
  v14 = log(v13);
  v16 = *((double *)a3 + 2);
  v15 = *(_OWORD *)a3;
  v16 = fabs((v14 - v12) * 0.159154943) * v16 / v9;
  -[VKCamera setPosition:](self, "setPosition:", &v15);
}

- (CGPoint)screenPointFromGroundPoint:(const void *)a3
{
  double v4;
  double v5;
  double *v6;
  double v7;
  double v8;
  double v9;
  float64x2_t *v11;
  float64x2_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  v4 = *(double *)a3;
  v14 = *((double *)a3 + 1);
  v15 = *((double *)a3 + 2);
  v16 = *(double *)a3 + -1.0;
  v5 = *(double *)a3 + 1.0;
  v6 = -[VKCamera position](self, "position");
  v7 = vabdd_f64(*v6, v4);
  v8 = vabdd_f64(*v6, v16);
  v9 = vabdd_f64(*v6, v5);
  if (v8 >= v7 || v8 >= v9)
  {
    v16 = v4;
    if (v9 < v7)
      v16 = v4 + 1.0;
  }
  v11 = -[VKCamera scaledViewProjectionMatrix](self, "scaledViewProjectionMatrix");
  v12 = vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v11[6], *v11, v16), v11[2], v14), v11[4], v15), 1.0 / (v11[7].f64[1] + v11[1].f64[1] * v16 + v11[3].f64[1] * v14 + v11[5].f64[1] * v15));
  v13 = v12.f64[1];
  result.x = v12.f64[0];
  result.y = v13;
  return result;
}

- (const)scaledViewProjectionMatrix
{
  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  return &self->_scaledViewProjectionMatrix;
}

- (void).cxx_destruct
{
  if (self->_maxDistanceToGroundRestriction._hasValue)
    self->_maxDistanceToGroundRestriction._hasValue = 0;
  if (self->_minDistanceToGroundRestriction._hasValue)
    self->_minDistanceToGroundRestriction._hasValue = 0;
  objc_storeStrong((id *)&self->_regionRestriction, 0);
  objc_storeStrong((id *)&self->_footprint, 0);
  objc_storeStrong((id *)&self->_viewVolume, 0);
}

- (void)setPosition:(const void *)a3
{
  int64x2_t v3;
  double v6;
  double v7;
  double v8;
  void *v11;
  int v12;
  __int128 v13;
  double v14;

  v13 = *(_OWORD *)a3;
  v14 = *((double *)a3 + 2);
  v3 = vdupq_n_s64(0x7FF8000000000000uLL);
  if (*(_QWORD *)a3 == v3.i64[0] && *((_QWORD *)a3 + 1) == v3.i64[1] && *((_QWORD *)a3 + 2) == 0x7FF8000000000000)
  {
    objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isInternalInstall");

    if (v12)
      NSLog((NSString *)CFSTR("Attempt to set camera position set to NANs (%f, %f, %f)! Bailing"), v13, *(_QWORD *)&v14);
  }
  else
  {
    v6 = fmax(v14, 0.0);
    v7 = *(double *)&v13 - floor(*(double *)&v13);
    if (v7 < 0.0)
      v7 = v7 + 1.0;
    v8 = fmin(fmax(*((double *)&v13 + 1), self->_tanHalfVerticalFOV * v6), 1.0 - self->_tanHalfVerticalFOV * v6);
    if (*(_QWORD *)&self->_transform._translation._e[0] != *(_QWORD *)&v7
      || *(_QWORD *)&self->_transform._translation._e[1] != *(_QWORD *)&v8
      || *(_QWORD *)&self->_transform._translation._e[2] != *(_QWORD *)&v6)
    {
      self->_transform._translation._e[0] = v7;
      self->_transform._translation._e[1] = v8;
      self->_transform._translation._e[2] = v6;
      -[VKCamera setNeedsUpdate](self, "setNeedsUpdate");
    }
  }
}

- (double)minHeight
{
  return self->_minHeight;
}

- (double)maxHeight
{
  return self->_maxHeight;
}

- (void)setAspectRatio:(double)a3
{
  if (self->_aspectRatio != a3)
  {
    self->_aspectRatio = a3;
    -[VKCamera setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (double)tanHalfVerticalFOV
{
  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  return self->_tanHalfVerticalFOV;
}

- (double)depthForViewWidth:(double)a3
{
  double v4;

  -[VKCamera tanHalfHorizFOV](self, "tanHalfHorizFOV");
  return a3 / (v4 + v4);
}

- (VKCamera)initWithRunLoopController:(RunLoopController *)a3
{
  VKCamera *v4;
  VKCamera *v5;
  VKViewVolume *v6;
  VKViewVolume *viewVolume;
  VKFootprint *v8;
  VKFootprint *footprint;
  VKCameraRegionRestriction *v15;
  VKCameraRegionRestriction *regionRestriction;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VKCamera;
  v4 = -[VKCamera init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_runLoopController = a3;
    v6 = objc_alloc_init(VKViewVolume);
    viewVolume = v5->_viewVolume;
    v5->_viewVolume = v6;

    v8 = objc_alloc_init(VKFootprint);
    footprint = v5->_footprint;
    v5->_footprint = v8;

    v5->_frustum.orthographic = 1;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v5->_frustum.width = _Q0;
    *(_OWORD *)&v5->_frustum.near = xmmword_19FFB3310;
    v5->_frustum.horizontalOffset = 0.0;
    v5->_transform._rotation._imaginary._e[0] = 0.0;
    v5->_transform._rotation._imaginary._e[1] = 0.0;
    v5->_transform._rotation._imaginary._e[2] = 0.0;
    v5->_transform._rotation._scalar = 1.0;
    v5->_transform._translation._e[0] = 0.5;
    *(_OWORD *)&v5->_transform._translation._e[1] = xmmword_19FFB3320;
    v5->_tanHalfVerticalFOV = 0.267949192;
    v5->_aspectRatio = 1.0;
    v5->_verticalFieldOfView._value = 0.523598776;
    v5->_needsUpdate = 1;
    *(_OWORD *)&v5->_maxHeight = xmmword_19FFB3330;
    v5->_canonicalPitch = 1.31946891;
    v5->_ndcZNear = -1.0;
    v15 = -[VKCameraRegionRestriction initWithMapRegion:]([VKCameraRegionRestriction alloc], "initWithMapRegion:", 0);
    regionRestriction = v5->_regionRestriction;
    v5->_regionRestriction = v15;

    v5->_nearFarReset = 1;
  }
  return v5;
}

- (void)setFractionOfScreenAboveFarClipPlaneAtCanonicalPitch:(double)a3
{
  self->_fractionOfScreenAboveFarClipPlaneAtCanonicalPitch = a3;
}

- (void)setHorizontalOffset:(double)a3
{
  if (self->_horizontalOffset != a3)
  {
    self->_horizontalOffset = a3;
    -[VKCamera setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  std::string *p_p;
  double v7;
  double v8;
  double v9;
  long double v10;
  std::string *v11;
  std::string __p;
  objc_super v14;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v14.receiver = self;
  v14.super_class = (Class)VKCamera;
  -[VKCamera description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n"), v4);

  gm::Matrix<double,3,1>::description((uint64_t)&__p, self->_transform._translation._e);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v5, "appendFormat:", CFSTR("position: %s\n"), p_p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v7 = self->_transform._rotation._imaginary._e[0];
  v8 = self->_transform._rotation._imaginary._e[1];
  v9 = self->_transform._rotation._imaginary._e[2];
  v10 = atan2(sqrt(v7 * v7 + v8 * v8 + v9 * v9), self->_transform._rotation._scalar);
  objc_msgSend(v5, "appendFormat:", CFSTR("orientation quaternion: %f, %f, %f, %f\n"), *(_QWORD *)&v7, *(_QWORD *)&v8, *(_QWORD *)&v9, v10 + v10);
  objc_msgSend(v5, "appendFormat:", CFSTR("Frustum width: %.9f, height: %.9f, near: %.9f, far: %.9f\n"), *(_QWORD *)&self->_width, *(_QWORD *)&self->_height, *(_QWORD *)&self->_near, *(_QWORD *)&self->_far);
  gm::Matrix<double,4,4>::description(&__p, (uint64_t)&self->_scaledViewProjectionMatrix);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v11 = &__p;
  else
    v11 = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v5, "appendFormat:", CFSTR("view projection matrix:\n%s\n"), v11);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v5;
}

- (id)descriptionDictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  std::string *p_p;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  long double v14;
  void *v15;
  void *v16;
  void *v17;
  std::string *v18;
  void *v19;
  std::string __p;
  objc_super v22;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v22.receiver = self;
  v22.super_class = (Class)VKCamera;
  -[VKCamera description](&v22, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("Super: VKCamera"));

  v7 = (void *)MEMORY[0x1E0CB3940];
  gm::Matrix<double,3,1>::description((uint64_t)&__p, self->_transform._translation._e);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%s\n"), p_p);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("position"));

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = self->_transform._rotation._imaginary._e[0];
  v12 = self->_transform._rotation._imaginary._e[1];
  v13 = self->_transform._rotation._imaginary._e[2];
  v14 = atan2(sqrt(v11 * v11 + v12 * v12 + v13 * v13), self->_transform._rotation._scalar);
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%f, %f, %f, %f"), *(_QWORD *)&v11, *(_QWORD *)&v12, *(_QWORD *)&v13, v14 + v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("orientation quaternion"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.9f, height: %.9f, near: %.9f, far: %.9f"), *(_QWORD *)&self->_width, *(_QWORD *)&self->_height, *(_QWORD *)&self->_near, *(_QWORD *)&self->_far);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("Frustum width"));

  v17 = (void *)MEMORY[0x1E0CB3940];
  gm::Matrix<double,4,4>::description(&__p, (uint64_t)&self->_scaledViewProjectionMatrix);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v18 = &__p;
  else
    v18 = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%s"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("view projection matrix"));

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v3;
}

- (void)_setPosition:(const void *)a3
{
  self->_transform._translation._e[0] = *(double *)a3;
  self->_transform._translation._e[1] = *((double *)a3 + 1);
  self->_transform._translation._e[2] = *((double *)a3 + 2);
  -[VKCamera setNeedsUpdate](self, "setNeedsUpdate");
}

- (Mercator3<double>)mercatorPosition
{
  double v3;
  double v4;
  long double v5;
  long double v6;
  long double v7;
  long double v8;
  long double v9;
  long double v10;
  long double v11;
  double v12;
  long double v13;
  double v14;
  double v15;
  double v16;
  Mercator3<double> result;

  v3 = self->_transform._translation._e[0];
  v4 = self->_transform._translation._e[1];
  v5 = exp(v4 * 6.28318531 + -3.14159265);
  v6 = atan(v5) * 2.0 + -1.57079633;
  v7 = cos(v6 + v6) * -559.82 + 111132.92;
  v8 = v7 + cos(v6 * 4.0) * 1.175;
  v9 = v8 + cos(v6 * 6.0) * -0.0023;
  v10 = v6 * 0.5;
  v11 = tan(v6 * 0.5 + 0.78103484);
  v12 = log(v11);
  v13 = tan(v10 + 0.789761487);
  v14 = v9 * self->_transform._translation._e[2] / fabs((log(v13) - v12) * 0.159154943);
  v15 = v3;
  v16 = v4;
  result._e[2] = v14;
  result._e[1] = v16;
  result._e[0] = v15;
  return result;
}

- (const)transform
{
  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  return &self->_transform;
}

- (void)setTransform:(const void *)a3
{
  BOOL v4;
  BOOL v5;
  BOOL v6;

  v4 = *((_QWORD *)a3 + 3) == *(_QWORD *)&self->_transform._rotation._imaginary._e[0]
    && *((_QWORD *)a3 + 4) == *(_QWORD *)&self->_transform._rotation._imaginary._e[1]
    && *((_QWORD *)a3 + 5) == *(_QWORD *)&self->_transform._rotation._imaginary._e[2];
  if (!v4
    || *((double *)a3 + 6) != self->_transform._rotation._scalar
    || (*(_QWORD *)a3 == *(_QWORD *)&self->_transform._translation._e[0]
      ? (v5 = *((_QWORD *)a3 + 1) == *(_QWORD *)&self->_transform._translation._e[1])
      : (v5 = 0),
        v5 ? (v6 = *((_QWORD *)a3 + 2) == *(_QWORD *)&self->_transform._translation._e[2]) : (v6 = 0),
        !v6))
  {
    self->_transform = *(RigidTransform<double, double> *)a3;
    -[VKCamera setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- ($7C969B71DD53AF2675E9F7E8E727D903)frustum
{
  $7C969B71DD53AF2675E9F7E8E727D903 *result;
  __int128 v6;

  result = ($7C969B71DD53AF2675E9F7E8E727D903 *)-[VKCamera updateIfNeeded](self, "updateIfNeeded");
  v6 = *(_OWORD *)&self->_frustum.height;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_frustum.orthographic;
  *(_OWORD *)&retstr->var2 = v6;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->_frustum.far;
  return result;
}

- (const)orientation
{
  return &self->_transform._rotation;
}

- (void)setVerticalFieldOfView:()Unit<geo:(double>)a3 :RadianUnitDescription
{
  double *v3;
  double v4;

  v4 = *v3;
  if (*v3 != self->_verticalFieldOfView._value)
  {
    self->_verticalFieldOfView._value = v4;
    self->_tanHalfVerticalFOV = tan(v4 * 0.5);
    -[VKCamera setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (Unit<geo::RadianUnitDescription,)horizontalFieldOfView
{
  double *v2;
  double *v4;
  long double v5;
  Unit<geo::RadianUnitDescription, double> v6;

  v4 = v2;
  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  v5 = atan(self->_width * 0.5 / self->_near);
  v6._value = v5 + v5;
  *v4 = v6._value;
  return v6;
}

- (void)setFarClipDistance:(double)a3
{
  self->_needsUpdate = 1;
  self->_nearFarReset = 0;
  self->_far = a3;
}

- (void)setNearClipDistance:(double)a3
{
  self->_needsUpdate = 1;
  self->_nearFarReset = 0;
  self->_near = a3;
}

- (Matrix<double,)rightVector
{
  double v3;
  double v4;
  double v5;
  Matrix<double, 3, 1> result;

  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  v3 = self->_worldMatrix._e[0];
  v4 = self->_worldMatrix._e[1];
  v5 = self->_worldMatrix._e[2];
  result._e[2] = v5;
  result._e[1] = v4;
  result._e[0] = v3;
  return result;
}

- (Matrix<double,)groundPoint
{
  double v3;
  double v4;
  double v5;
  Matrix<double, 3, 1> result;

  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  v3 = self->_transform._translation._e[0];
  v4 = self->_transform._translation._e[1];
  v5 = 0.0;
  result._e[2] = v5;
  result._e[1] = v4;
  result._e[0] = v3;
  return result;
}

- (double)displayZoomLevel
{
  double v3;
  double v4;
  double v5;
  long double v6;

  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  -[VKFootprint nearestGroundPoint](self->_footprint, "nearestGroundPoint");
  -[VKCamera widthOfViewAtDepth:](self, "widthOfViewAtDepth:", self->_forward._e[0] * (v3 - self->_transform._translation._e[0])+ self->_forward._e[1] * (v4 - self->_transform._translation._e[1])+ self->_forward._e[2] * (v5 - self->_transform._translation._e[2]));
  return -log2(v6);
}

- (void)setCameraState:(VKCameraState *)a3
{
  self->_transform = a3->var0;
  self->_aspectRatio = a3->var1;
  self->_verticalFieldOfView._value = a3->var2._value;
  self->_horizontalOffset = a3->var3;
  -[VKCamera setNeedsUpdate](self, "setNeedsUpdate");
}

- (float)zoomAtPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  long double v10;
  float v11;
  double v13;
  double v14;
  double v15;

  v4 = self->_transform._translation._e[0];
  v5 = self->_transform._translation._e[1];
  v6 = self->_transform._translation._e[2];
  v7 = self->_forward._e[0];
  v8 = self->_forward._e[1];
  v9 = self->_forward._e[2];
  -[VKCamera groundPointFromScreenPoint:](self, "groundPointFromScreenPoint:", a3.x, a3.y);
  -[VKCamera widthOfViewAtDepth:](self, "widthOfViewAtDepth:", (v13 - v4) * v7 + (v14 - v5) * v8 + (v15 - v6) * v9);
  v11 = log2(v10);
  return -v11;
}

- (float)zoomAtCentrePoint
{
  float result;

  -[VKCamera zoomAtPoint:](self, "zoomAtPoint:", 0.5, 0.5);
  return result;
}

- (const)scaledProjectionMatrix
{
  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  return &self->_scaledProjectionMatrix;
}

- (const)scaledViewMatrix
{
  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  return &self->_scaledViewMatrix;
}

- (const)unscaledViewMatrix
{
  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  return &self->_unscaledViewMatrix;
}

- (const)unscaledProjectionMatrix
{
  -[VKCamera updateIfNeeded](self, "updateIfNeeded");
  return &self->_unscaledProjectionMatrix;
}

- (View<double>)view:(SEL)a3
{
  double width;
  __int128 *p_transform;
  double near;
  double far;
  double ndcZNear;
  double height;
  long double v11;
  long double v12;
  double v13;
  double v14;
  __int128 v16;
  double v17;
  Quaternion<double> v18;
  _BYTE v19[408];
  ViewSize v20;
  double v21;
  __int128 v22;
  __int128 v23;
  long double v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  double v32;
  double v33;
  __int128 v34;
  __int128 v35;
  double v36;
  __int128 v37;
  __int128 v38;
  double v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t v44;

  v20 = a4;
  width = (double)a4.width;
  p_transform = (__int128 *)&self->_transform;
  near = self->_near;
  far = self->_far;
  ndcZNear = self->_ndcZNear;
  height = (double)a4.height;
  v11 = tan(self->_verticalFieldOfView._value * 0.5);
  v12 = (near + near) * v11 * width / height;
  v34 = 0u;
  v35 = 0u;
  v33 = (near + near) / v12;
  v36 = 1.0 / v11;
  v13 = -(far - ndcZNear * near);
  v37 = 0u;
  v38 = 0u;
  v39 = v13 / (far - near);
  v14 = -(far * near - ndcZNear * (far * near));
  v41 = 0;
  v42 = 0;
  v40 = 0xBFF0000000000000;
  v43 = v14 / (far - near);
  v44 = 0;
  v22 = 0u;
  v23 = 0u;
  v21 = v12 / (near + near);
  v24 = v11;
  v25 = 0u;
  v26 = 0u;
  v27 = 0;
  v28 = (far - near) / v14;
  v30 = 0;
  v29 = 0;
  v31 = 0xBFF0000000000000;
  v32 = v13 / v14;
  geo::View<double>::View((uint64_t)&v16, p_transform, &v33, (__int128 *)&v21, &v20, 0, ndcZNear);
  *(_OWORD *)retstr->var0._translation._e = v16;
  retstr->var0._translation._e[2] = v17;
  retstr->var0._rotation = v18;
  return (View<double> *)memcpy(&retstr->var1, v19, 0x198uLL);
}

- (void)updateCamera:(shared_ptr<gdc:(function<BOOL)(std:()geo:(double>)& :()geo:(double>)& :Unit<geo::MeterUnitDescription Unit<geo::MeterUnitDescription :shared_ptr<gdc::Camera> :Camera>)a3 withAdjustment:
{
  __shared_weak_count *cntrl;
  Camera *ptr;
  double v7;
  double *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  double *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  long double v18;
  long double v19;
  double v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  double *v23;
  double v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  int v27;
  int v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  long double v32;
  double v33;
  long double v34;
  double v35;
  long double v36;
  long double v37;
  long double v38;
  double *v39;
  double v40;
  long double v41;
  double v42;
  double *v43;
  double v44;
  double *v45;
  std::__shared_weak_count *v46;
  double v47;
  double v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  -[VKCamera cameraFrame:](self, "cameraFrame:", **(_BYTE **)a3.__ptr_ == 0, a3.__cntrl_, a4);
  v7 = *(double *)&v49;
  v8 = *(double **)ptr;
  v9 = v49;
  v10 = v50;
  v11 = v51;
  *((_QWORD *)v8 + 7) = v52;
  *(_OWORD *)(v8 + 5) = v11;
  *(_OWORD *)(v8 + 3) = v10;
  *(_OWORD *)(v8 + 1) = v9;
  v12 = *(double **)ptr;
  -[VKCamera verticalFieldOfView](self, "verticalFieldOfView");
  v14 = v12[46];
  v13 = v12[47];
  if (v13 >= v14)
  {
    v20 = v48;
  }
  else
  {
    v15 = v13 * v14;
    v16 = v14 / v13;
    if (v15 <= 0.0)
      v17 = 1.0;
    else
      v17 = v16;
    v18 = tan(v48 * 0.5);
    v19 = atan(v17 * v18);
    v20 = v19 + v19;
  }
  v12[57] = v20;
  v21 = *((_QWORD *)cntrl + 3);
  if (!v21)
    goto LABEL_18;
  v23 = *(double **)ptr;
  v22 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v24 = *(double *)(*(_QWORD *)ptr + 464);
  v47 = *(double *)(*(_QWORD *)ptr + 472);
  v48 = v24;
  v45 = v23;
  v46 = v22;
  if (!v22)
    goto LABEL_12;
  p_shared_owners = (unint64_t *)&v22->__shared_owners_;
  do
    v26 = __ldxr(p_shared_owners);
  while (__stxr(v26 + 1, p_shared_owners));
  v21 = *((_QWORD *)cntrl + 3);
  if (v21)
  {
LABEL_12:
    v27 = (*(uint64_t (**)(uint64_t, double **, double *, double *))(*(_QWORD *)v21 + 48))(v21, &v45, &v48, &v47);
    v28 = v27;
    v29 = v46;
    if (!v46)
      goto LABEL_16;
    v30 = (unint64_t *)&v46->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
      if (!v28)
        goto LABEL_18;
    }
    else
    {
LABEL_16:
      if (!v27)
      {
LABEL_18:
        v32 = tan(v7 * 0.5 + 0.789761487);
        v33 = log(v32);
        v34 = tan(v7 * 0.5 + 0.78103484);
        v35 = fabs((v33 - log(v34)) * 0.159154943);
        v36 = cos(v7 + v7) * -559.82 + 111132.92;
        v37 = v36 + cos(v7 * 4.0) * 1.175;
        v38 = v35 / (v37 + cos(v7 * 6.0) * -0.0023);
        v39 = *(double **)ptr;
        -[VKCamera nearClipDistance](self, "nearClipDistance");
        v41 = v40 / v38;
        -[VKCamera farClipDistance](self, "farClipDistance");
        v39[58] = v41;
        v39[59] = v42 / v38;
        v43 = *(double **)ptr;
        -[VKCamera horizontalOffset](self, "horizontalOffset");
        *(float *)&v44 = v44;
        *((_DWORD *)v43 + 122) = LODWORD(v44);
        *(_DWORD *)(*(_QWORD *)ptr + 492) = 0;
        return;
      }
    }
    -[VKCamera setFarClipDistance:](self, "setFarClipDistance:", v47 * 0.0000000249532021);
    -[VKCamera setNearClipDistance:](self, "setNearClipDistance:", v48 * 0.0000000249532021);
    goto LABEL_18;
  }
  std::__throw_bad_function_call[abi:nn180100]();
  __break(1u);
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (double)maxHeightNoPitch
{
  return self->_maxHeightNoPitch;
}

- (double)terrainHeight
{
  return self->_terrainHeight;
}

- (void)setTerrainHeight:(double)a3
{
  self->_terrainHeight = a3;
}

- (double)fractionOfScreenAboveFarClipPlaneAtCanonicalPitch
{
  return self->_fractionOfScreenAboveFarClipPlaneAtCanonicalPitch;
}

- (double)distanceToGroundAndFarClipPlaneIntersection
{
  return self->_distanceToGroundAndFarClipPlaneIntersection;
}

- (double)screenHeightOfGroundAndFarClipPlaneIntersection
{
  return self->_screenHeightOfGroundAndFarClipPlaneIntersection;
}

- (double)canonicalPitch
{
  return self->_canonicalPitch;
}

- (void)setCanonicalPitch:(double)a3
{
  self->_canonicalPitch = a3;
}

- (double)ndcZNear
{
  return self->_ndcZNear;
}

- (VKCameraRegionRestriction)regionRestriction
{
  return self->_regionRestriction;
}

- (void)setRegionRestriction:(id)a3
{
  objc_storeStrong((id *)&self->_regionRestriction, a3);
}

- (void)setMinDistanceToGroundRestriction:(optional<double>)a3
{
  _BOOL4 hasValue;

  hasValue = self->_minDistanceToGroundRestriction._hasValue;
  if (**(_BYTE **)&a3._hasValue)
  {
    self->_minDistanceToGroundRestriction._value.type = *(double *)(*(_QWORD *)&a3._hasValue + 8);
    if (!hasValue)
      self->_minDistanceToGroundRestriction._hasValue = 1;
  }
  else if (self->_minDistanceToGroundRestriction._hasValue)
  {
    self->_minDistanceToGroundRestriction._hasValue = 0;
  }
}

- (void)setMaxDistanceToGroundRestriction:(optional<double>)a3
{
  _BOOL4 hasValue;

  hasValue = self->_maxDistanceToGroundRestriction._hasValue;
  if (**(_BYTE **)&a3._hasValue)
  {
    self->_maxDistanceToGroundRestriction._value.type = *(double *)(*(_QWORD *)&a3._hasValue + 8);
    if (!hasValue)
      self->_maxDistanceToGroundRestriction._hasValue = 1;
  }
  else if (self->_maxDistanceToGroundRestriction._hasValue)
  {
    self->_maxDistanceToGroundRestriction._hasValue = 0;
  }
}

@end
