@implementation WFDrawerSpringInfo

- (WFDrawerSpringInfo)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6
{
  WFDrawerSpringInfo *v11;
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
  uint64_t v47;
  double derivative;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  __double2 v57;
  double v58;
  __double2 v59;
  double v60;
  double v61;
  uint64_t v62;
  double v63;
  double v64;
  BOOL v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  double v72;
  double v73;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  NSObject *v78;
  WFDrawerSpringInfo *v79;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  objc_super v91;
  _BYTE v92[24];
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  uint8_t buf[4];
  const char *v102;
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v91.receiver = self;
  v91.super_class = (Class)WFDrawerSpringInfo;
  v11 = -[WFDrawerSpringInfo init](&v91, sel_init);
  if (v11)
  {
    if (a3 <= 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("WFDrawerSpringInfo.mm"), 400, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mass > 0"));

    }
    if (a4 <= 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("WFDrawerSpringInfo.mm"), 401, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stiffness > 0"));

    }
    if (a5 <= 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("WFDrawerSpringInfo.mm"), 402, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("damping > 0"));

    }
    v11->_mass = a3;
    v11->_stiffness = a4;
    v11->_damping = a5;
    v11->_initialVelocity = a6;
    SpringUtils::Spring::Spring((SpringUtils *)v92, a3, a4, a5, a6);
    if (v95 < 1.0)
    {
      v88 = v95;
      v13 = v96;
      v12 = v97;
      v14 = fabs(6.28318531 / v96);
      v86 = v14 * 0.5;
      v15 = v98;
      v16 = -v96;
      v17 = -v98;
      v18 = 0.0;
      v19 = 10;
      v89 = v98;
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
      v66 = (sinval + v17 * cosval) * v16 < 0.0;
      v25 = v14 * 0.5;
      if (!v66)
        v25 = -0.0;
      v26 = fmod(v18 + v25, v14);
      if (v26 >= 0.0)
        v27 = -0.0;
      else
        v27 = v14;
      v28 = __sincos_stret(v13 * (v14 * 0.25 + v26 + v27));
      v29 = log(0.001 / fabs(v89 * v28.__sinval + v12 * v28.__cosval));
      v30 = v99;
      v31 = v100;
      v84 = v94;
      v32 = -v29 / (v88 * v94);
      v33 = -v99;
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
      v41 = exp(v84 * -((v38 + v39) * v88));
      v42 = __sincos_stret(v13 * v40);
      v43 = v41 * (v89 * v42.__sinval + v12 * v42.__cosval);
      if (v43 <= 1.0)
      {
        v44 = -1.0;
        if (v43 != 1.0)
          goto LABEL_34;
      }
      else
      {
        v44 = v40;
      }
      v40 = v86 + v40;
LABEL_34:
      if (v44 > v32
        || (v56 = exp(v84 * -(v44 * v88)),
            v57 = __sincos_stret(v13 * v44),
            v56 * (v89 * v57.__sinval + v12 * v57.__cosval) < 1.0))
      {
        v44 = -1.0;
      }
      if (v40 > v32
        || (v58 = exp(v84 * -(v40 * v88)),
            v59 = __sincos_stret(v13 * v40),
            v58 * (v89 * v59.__sinval + v12 * v59.__cosval) > 0.0))
      {
        v40 = -1.0;
      }
      v60 = -1.0;
      if (v44 < 0.0)
        v61 = -1.0;
      else
        v61 = v44;
      v11->_undershootTime = v61;
      if (v40 >= 0.0)
        v60 = v40;
LABEL_84:
      v11->_overshootTime = v60;
      v11->_settlingTime = v32;
      v79 = v11;
      goto LABEL_85;
    }
    v45 = 0.0;
    v46 = 0.0;
    if (v93 != 0.0)
    {
      v47 = 10;
      do
      {
        derivative = SpringUtils::Spring::first_derivative((SpringUtils::Spring *)v92, v46);
        if (fabs(derivative) < 0.000001)
          break;
        SpringUtils::Spring::second_derivative((SpringUtils::Spring *)v92, v46);
        v46 = v46 - derivative / v49;
        --v47;
      }
      while (v47);
    }
    v50 = fmax(v46, 0.0);
    v52 = v97;
    v51 = v98;
    v53 = v94;
    v54 = v97 + v98 * v50;
    v55 = v54 * exp(-(v50 * v94));
    if (fabs(v55) <= 0.002)
      goto LABEL_48;
    if (v55 > 1.0)
    {
      v85 = v50;
      v87 = -1.0;
      v45 = v50 + v50;
      goto LABEL_49;
    }
    if (v55 >= 0.0)
    {
LABEL_48:
      v85 = -1.0;
      v87 = -1.0;
    }
    else
    {
      v45 = v50 + v50;
      v85 = -1.0;
      v87 = v50;
    }
LABEL_49:
    v62 = 10;
    v32 = v45;
    while (1)
    {
      v63 = exp(-(v32 * v53));
      v64 = SpringUtils::Spring::first_derivative((SpringUtils::Spring *)v92, v32);
      if (fabs(v64) <= 2.22044605e-16 || (*(_QWORD *)&v64 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
        break;
      v32 = v32 - ((v52 + v51 * v32) * v63 + dbl_2268AB3D0[(v52 + v51 * v32) * v63 < 0.0]) / v64;
      if (!--v62)
      {
        if (v32 >= v87)
        {
          v66 = v32 < 0.0 || v32 < v85;
          if (!v66)
            goto LABEL_83;
        }
        break;
      }
    }
    v67 = dbl_2268AB3E0[v87 > 0.0];
    v68 = (v52 + v51 * (v45 * 0.5)) * exp(-(v45 * 0.5 * v53)) - v67;
    v69 = 0.1;
    v90 = v45 * 0.5;
    v70 = v45 * 0.5 + 0.1;
    if (((COERCE_UNSIGNED_INT64((v52 + v51 * v70) * exp(-(v70 * v53)) - v67) ^ *(_QWORD *)&v68) & 0x8000000000000000) != 0)
    {
      v72 = 0.0;
LABEL_68:
      v73 = v90 + v72;
      v32 = (v90 + v72 + v70) * 0.5;
      v74 = 32;
      do
      {
        v75 = (v52 + v51 * v32) * exp(-(v32 * v53));
        if (vabdd_f64(v75, v67) < 0.000000001)
          break;
        v76 = (v52 + v51 * v73) * exp(-(v73 * v53));
        if (v76 <= v75)
          v77 = v76;
        else
          v77 = v75;
        if (v76 <= v75)
          v76 = v75;
        if (v77 <= v67 && v76 >= v67)
          v70 = v32;
        else
          v73 = v32;
        v32 = (v73 + v70) * 0.5;
        --v74;
      }
      while (v74);
    }
    else
    {
      v71 = 32;
      while (--v71)
      {
        v72 = v69;
        v69 = v69 + v69;
        v70 = v90 + v69;
        if (((COERCE_UNSIGNED_INT64((v52 + v51 * (v90 + v69)) * exp(-((v90 + v69) * v53)) - v67) ^ *(_QWORD *)&v68) & 0x8000000000000000) != 0)
          goto LABEL_68;
      }
      getWFGeneralLogObject();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v102 = "calculateCriticallyDampedSpringTiming";
        _os_log_impl(&dword_226666000, v78, OS_LOG_TYPE_ERROR, "%s Failed to determine spring duration", buf, 0xCu);
      }

      v32 = -1.0;
    }
LABEL_83:
    v11->_undershootTime = v85;
    v60 = v87;
    goto LABEL_84;
  }
LABEL_85:

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

  -[WFDrawerSpringInfo mass](self, "mass");
  v6 = v5;
  -[WFDrawerSpringInfo stiffness](self, "stiffness");
  v8 = v7;
  -[WFDrawerSpringInfo damping](self, "damping");
  v10 = v9;
  -[WFDrawerSpringInfo initialVelocity](self, "initialVelocity");
  SpringUtils::Spring::Spring((SpringUtils *)v17, v6, v8, v10, v11);
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
  void *v10;
  const __CFString *v11;
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
  uint64_t v24;
  _BYTE v26[40];
  double v27;

  -[WFDrawerSpringInfo mass](self, "mass");
  v4 = v3;
  -[WFDrawerSpringInfo stiffness](self, "stiffness");
  v6 = v5;
  -[WFDrawerSpringInfo damping](self, "damping");
  v8 = v7;
  -[WFDrawerSpringInfo initialVelocity](self, "initialVelocity");
  SpringUtils::Spring::Spring((SpringUtils *)v26, v4, v6, v8, v9);
  v10 = (void *)MEMORY[0x24BDD17C8];
  if (v27 >= 1.0)
    v11 = CFSTR("critically-damped");
  else
    v11 = CFSTR("underdamped");
  -[WFDrawerSpringInfo mass](self, "mass", v27);
  v13 = v12;
  -[WFDrawerSpringInfo stiffness](self, "stiffness");
  v15 = v14;
  -[WFDrawerSpringInfo damping](self, "damping");
  v17 = v16;
  -[WFDrawerSpringInfo initialVelocity](self, "initialVelocity");
  v19 = v18;
  -[WFDrawerSpringInfo undershootTime](self, "undershootTime");
  v21 = v20;
  -[WFDrawerSpringInfo overshootTime](self, "overshootTime");
  v23 = v22;
  -[WFDrawerSpringInfo settlingTime](self, "settlingTime");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: mass = %g, stiffness = %g, damping = %g, initialVelocity = %g, undershootTime = %g, overshootTime = %g, settlingTime = %g>"), v11, v13, v15, v17, v19, v21, v23, v24);
  return (id)objc_claimAutoreleasedReturnValue();
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
