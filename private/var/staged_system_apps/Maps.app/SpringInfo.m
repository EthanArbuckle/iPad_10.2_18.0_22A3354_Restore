@implementation SpringInfo

- (SpringInfo)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6
{
  SpringInfo *v10;
  SpringInfo *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double sinval;
  double cosval;
  __double2 v22;
  double v23;
  __double2 v24;
  double v25;
  double v26;
  double v27;
  __double2 v28;
  long double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  __double2 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  __double2 v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  __double2 v55;
  double v56;
  __double2 v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  double v64;
  double v65;
  BOOL v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  uint64_t v73;
  double v74;
  double v75;
  uint64_t v76;
  double v77;
  double v78;
  double v79;
  double v80;
  SpringInfo *v81;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  objc_super v91;
  double v92[4];
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;

  v91.receiver = self;
  v91.super_class = (Class)SpringInfo;
  v10 = -[SpringInfo init](&v91, "init");
  v11 = v10;
  if (v10)
  {
    v10->_mass = a3;
    v10->_stiffness = a4;
    v10->_damping = a5;
    v10->_initialVelocity = a6;
    sub_10039E518((uint64_t)v92, a3, a4, a5, a6);
    if (v94 < 1.0)
    {
      v87 = v94;
      v13 = v95;
      v12 = v96;
      v14 = fabs(6.28318531 / v95);
      v86 = v14 * 0.5;
      v15 = v97;
      v16 = -v95;
      v17 = -v97;
      v18 = 0.0;
      v19 = 10;
      v89 = v97;
      while (1)
      {
        v22 = __sincos_stret(v13 * v18);
        cosval = v22.__cosval;
        sinval = v22.__sinval;
        v23 = v15 * v22.__sinval + v12 * v22.__cosval;
        if (fabs(v23) < 0.001)
          break;
        v18 = v18 - v23 / ((v22.__sinval + v17 * v22.__cosval) * v16);
        if (!--v19)
        {
          v24 = __sincos_stret(v13 * v18);
          cosval = v24.__cosval;
          sinval = v24.__sinval;
          break;
        }
      }
      v67 = (sinval + v17 * cosval) * v16 < 0.0;
      v25 = v14 * 0.5;
      if (!v67)
        v25 = -0.0;
      v26 = fmod(v18 + v25, v14);
      if (v26 >= 0.0)
        v27 = -0.0;
      else
        v27 = v14;
      v28 = __sincos_stret(v13 * (v14 * 0.25 + v26 + v27));
      v29 = log(0.001 / fabs(v89 * v28.__sinval + v12 * v28.__cosval));
      v30 = v98;
      v31 = v99;
      v83 = v93;
      v32 = -v29 / (v87 * v93);
      v33 = -v98;
      v34 = 0.0;
      v35 = 10;
      do
      {
        v36 = __sincos_stret(v13 * v34);
        v37 = v31 * v36.__cosval + v30 * v36.__sinval;
        if (fabs(v37) < 0.000001)
          break;
        v34 = v34 - v37 / ((v36.__cosval * v33 + v31 * v36.__sinval) * v16);
        --v35;
      }
      while (v35);
      v38 = fmod(v34, v86);
      v39 = -0.0;
      if (v38 < 0.0)
        v39 = v86;
      v40 = v38 + v39;
      v41 = exp(v83 * -((v38 + v39) * v87));
      v42 = __sincos_stret(v13 * v40);
      v43 = v41 * (v89 * v42.__sinval + v12 * v42.__cosval);
      if (v43 <= 1.0)
      {
        v44 = -1.0;
        if (v43 != 1.0)
          goto LABEL_26;
      }
      else
      {
        v44 = v40;
      }
      v40 = v86 + v40;
LABEL_26:
      if (v44 > v32
        || (v54 = exp(v83 * -(v44 * v87)),
            v55 = __sincos_stret(v13 * v44),
            v54 * (v89 * v55.__sinval + v12 * v55.__cosval) < 1.0))
      {
        v44 = -1.0;
      }
      if (v40 > v32
        || (v56 = exp(v83 * -(v40 * v87)),
            v57 = __sincos_stret(v13 * v40),
            v56 * (v89 * v57.__sinval + v12 * v57.__cosval) > 0.0))
      {
        v40 = -1.0;
      }
      v58 = -1.0;
      if (v44 < 0.0)
        v59 = -1.0;
      else
        v59 = v44;
      v11->_undershootTime = v59;
      if (v40 >= 0.0)
        v58 = v40;
LABEL_78:
      v11->_overshootTime = v58;
      v11->_settlingTime = v32;
      v81 = v11;
      goto LABEL_79;
    }
    v45 = v97;
    v88 = v97;
    if (v92[3] == 0.0)
    {
      v50 = 0.0;
      v53 = v96;
      v46 = v93;
    }
    else
    {
      v46 = v93;
      v47 = v93 * v97;
      v48 = v96;
      v49 = v93 * v96;
      v50 = 0.0;
      v51 = 10;
      do
      {
        v52 = sub_10039E5CC(v92, v50);
        if (fabs(v52) < 0.000001)
          break;
        v50 = v50 - v52 / (exp(-(v50 * v46)) * (v46 * (v49 + v47 * v50 + v88 * -2.0)));
        --v51;
      }
      while (v51);
      v53 = v48;
      v45 = v88;
    }
    v60 = 0.0;
    v61 = fmax(v50, 0.0);
    v62 = (v53 + v45 * v61) * exp(-(v61 * v46));
    if (fabs(v62) <= 0.002)
      goto LABEL_44;
    if (v62 > 1.0)
    {
      v84 = v61;
      v85 = -1.0;
      v60 = v61 + v61;
      goto LABEL_45;
    }
    if (v62 >= 0.0)
    {
LABEL_44:
      v84 = -1.0;
      v85 = -1.0;
    }
    else
    {
      v60 = v61 + v61;
      v84 = -1.0;
      v85 = v61;
    }
LABEL_45:
    v63 = 10;
    v32 = v60;
    while (1)
    {
      v64 = exp(-(v32 * v46));
      v65 = sub_10039E5CC(v92, v32);
      if (fabs(v65) <= 2.22044605e-16 || (*(_QWORD *)&v65 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
        break;
      v32 = v32 - ((v53 + v45 * v32) * v64 + dbl_100E35560[(v53 + v45 * v32) * v64 < 0.0]) / v65;
      if (!--v63)
      {
        if (v32 >= v85)
        {
          v67 = v32 < 0.0 || v32 < v84;
          if (!v67)
            goto LABEL_77;
        }
        break;
      }
    }
    v68 = dbl_100E35570[v85 > 0.0];
    v69 = v60 * 0.5;
    v70 = (v53 + v45 * (v60 * 0.5)) * exp(-(v60 * 0.5 * v46)) - v68;
    v71 = 0.1;
    v72 = v69 + 0.1;
    v90 = v53;
    if (((COERCE_UNSIGNED_INT64((v53 + v45 * (v69 + 0.1)) * exp(-((v69 + 0.1) * v46)) - v68) ^ *(_QWORD *)&v70) & 0x8000000000000000) != 0)
    {
      v74 = 0.0;
LABEL_64:
      v75 = v69 + v74;
      v32 = (v69 + v74 + v72) * 0.5;
      v76 = 32;
      v77 = v90;
      do
      {
        v78 = (v77 + v88 * v32) * exp(-(v32 * v46));
        if (vabdd_f64(v78, v68) < 0.000000001)
          break;
        v79 = (v90 + v88 * v75) * exp(-(v75 * v46));
        v77 = v90;
        if (v79 <= v78)
          v80 = v79;
        else
          v80 = v78;
        if (v79 <= v78)
          v79 = v78;
        if (v80 <= v68 && v79 >= v68)
          v72 = v32;
        else
          v75 = v32;
        v32 = (v75 + v72) * 0.5;
        --v76;
      }
      while (v76);
    }
    else
    {
      v73 = 32;
      while (--v73)
      {
        v74 = v71;
        v71 = v71 + v71;
        v72 = v69 + v71;
        if (((COERCE_UNSIGNED_INT64((v90 + v88 * (v69 + v71)) * exp(-((v69 + v71) * v46)) - v68) ^ *(_QWORD *)&v70) & 0x8000000000000000) != 0)
          goto LABEL_64;
      }
      v32 = -1.0;
      NSLog(CFSTR("Failed to determine spring duration"), v88);
    }
LABEL_77:
    v11->_undershootTime = v84;
    v58 = v85;
    goto LABEL_78;
  }
LABEL_79:

  return v11;
}

- (double)valueAtTime:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __double2 v14;
  double v15;
  _BYTE v17[32];
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  -[SpringInfo mass](self, "mass");
  v6 = v5;
  -[SpringInfo stiffness](self, "stiffness");
  v8 = v7;
  -[SpringInfo damping](self, "damping");
  v10 = v9;
  -[SpringInfo initialVelocity](self, "initialVelocity");
  sub_10039E518((uint64_t)v17, v6, v8, v10, v11);
  if (v19 >= 1.0)
  {
    v12 = v21 + v22 * a3;
    v15 = exp(-(a3 * v18));
  }
  else
  {
    v12 = exp(-(a3 * v19) * v18);
    v13 = v21;
    v14 = __sincos_stret(v20 * a3);
    v15 = v22 * v14.__sinval + v13 * v14.__cosval;
  }
  return v12 * v15;
}

- (id)description
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v25[40];
  double v26;

  -[SpringInfo mass](self, "mass");
  v4 = v3;
  -[SpringInfo stiffness](self, "stiffness");
  v6 = v5;
  -[SpringInfo damping](self, "damping");
  v8 = v7;
  -[SpringInfo initialVelocity](self, "initialVelocity");
  sub_10039E518((uint64_t)v25, v4, v6, v8, v9);
  if (v26 >= 1.0)
    v10 = CFSTR("critically-damped");
  else
    v10 = CFSTR("underdamped");
  -[SpringInfo mass](self, "mass", v26);
  v12 = v11;
  -[SpringInfo stiffness](self, "stiffness");
  v14 = v13;
  -[SpringInfo damping](self, "damping");
  v16 = v15;
  -[SpringInfo initialVelocity](self, "initialVelocity");
  v18 = v17;
  -[SpringInfo undershootTime](self, "undershootTime");
  v20 = v19;
  -[SpringInfo overshootTime](self, "overshootTime");
  v22 = v21;
  -[SpringInfo settlingTime](self, "settlingTime");
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: mass = %g, stiffness = %g, damping = %g, initialVelocity = %g, undershootTime = %g, overshootTime = %g, settlingTime = %g>"), v10, v12, v14, v16, v18, v20, v22, v23));
}

- (double)mass
{
  return self->_mass;
}

- (double)stiffness
{
  return self->_stiffness;
}

- (double)damping
{
  return self->_damping;
}

- (double)initialVelocity
{
  return self->_initialVelocity;
}

- (double)undershootTime
{
  return self->_undershootTime;
}

- (double)overshootTime
{
  return self->_overshootTime;
}

- (double)settlingTime
{
  return self->_settlingTime;
}

@end
