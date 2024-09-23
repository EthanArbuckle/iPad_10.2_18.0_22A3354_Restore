@implementation PRRoseSolution

- (PRRoseSolution)initWithVariant:(int64_t)a3 macAddr:(unint64_t)a4 machAbsTime_sec:(double)a5 machContTimeValid:(BOOL)a6 machContTime_sec:(double)a7 range_m:(double)a8 rangeUnc_m:(double)a9 azValid:(BOOL)a10 elValid:(BOOL)a11 az_deg:(double)a12 el_deg:(double)a13 azUnc_deg:(double)a14 elUnc_deg:(double)a15 fovConfidence:(double)a16 soiRssiValid:(BOOL)a17 soiRssi_dBm:(double)a18 antennaType:(int64_t)a19 prevSolutionIsBad:(BOOL)a20 trackScoreValid:(BOOL)a21 trackScore:(double)a22 sweepAngleValid:(BOOL)a23 sweepAngle_deg:(double)a24 multipathProbabilityValid:(BOOL)a25 multipathProbability:(double)a26
{
  _BOOL4 v26;
  _BOOL4 v27;
  _BOOL4 v28;
  _BOOL4 v29;
  PRRoseSolution *result;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  objc_super v50;

  v26 = a17;
  v27 = a11;
  v28 = a10;
  v29 = a6;
  v50.receiver = self;
  v50.super_class = (Class)PRRoseSolution;
  result = -[PRRoseSolution init](&v50, sel_init);
  if (result)
  {
    result->_variant = a3;
    result->_mac_addr = a4;
    result->_mach_continuous_time_valid = v29;
    if (v29)
      v45 = a7;
    else
      v45 = 0.0;
    result->_mach_absolute_time_sec = a5;
    result->_mach_continuous_time_sec = v45;
    result->_range_m = a8;
    result->_range_unc_m = a9;
    result->_az_valid = v28;
    result->_el_valid = v27;
    if (v28)
      v46 = a12;
    else
      v46 = 0.0;
    if (v28)
      v47 = a14;
    else
      v47 = 0.0;
    if (v27)
      v48 = a13;
    else
      v48 = 0.0;
    result->_az_deg = v46;
    result->_el_deg = v48;
    if (v27)
      v49 = a15;
    else
      v49 = 0.0;
    result->_az_unc_deg = v47;
    result->_el_unc_deg = v49;
    result->_soi_rssi_valid = v26;
    if (!v26)
      a18 = 0.0;
    result->_fov_confidence = a16;
    result->_soi_rssi_dbm = a18;
    result->_antenna_type = a19;
    result->_previous_solution_is_bad = a20;
    result->_track_score_valid = a21;
    if (!a21)
      a22 = 0.0;
    result->_sweep_angle_valid = a23;
    if (!a23)
      a24 = 0.0;
    result->_track_score = a22;
    result->_sweep_angle_deg = a24;
    result->_multipath_probability_valid = a25;
    if (!a25)
      a26 = 0.0;
    result->_multipath_probability = a26;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRRoseSolution)initWithCoder:(id)a3
{
  id v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;

  v3 = a3;
  v43 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("variant"));
  v44 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("macAddr"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("machAbsTime"));
  v42 = v4;
  v5 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("machContTimeValid"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("machContTime"));
  v41 = v6;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("range"));
  v40 = v7;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("rangeUnc"));
  v39 = v8;
  v9 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("azValid"));
  v10 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("elValid"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("az"));
  v38 = v11;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("el"));
  v13 = v12;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("azUnc"));
  v15 = v14;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("elUnc"));
  v17 = v16;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("fovConfidence"));
  v19 = v18;
  v20 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("soiRssiValid"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("soiRssi"));
  v22 = v21;
  v23 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("antennaType"));
  v24 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("prevSolutionIsBad"));
  v25 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("trackScoreValid"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("trackScore"));
  v27 = v26;
  v28 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("sweepAngleValid"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("sweepAngleDeg"));
  v30 = v29;
  v31 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("multipathProbabilityValid"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("multipathProbability"));
  v33 = v32;

  LOBYTE(v37) = v31;
  LOBYTE(v36) = v28;
  BYTE1(v35) = v25;
  LOBYTE(v35) = v24;
  return -[PRRoseSolution initWithVariant:macAddr:machAbsTime_sec:machContTimeValid:machContTime_sec:range_m:rangeUnc_m:azValid:elValid:az_deg:el_deg:azUnc_deg:elUnc_deg:fovConfidence:soiRssiValid:soiRssi_dBm:antennaType:prevSolutionIsBad:trackScoreValid:trackScore:sweepAngleValid:sweepAngle_deg:multipathProbabilityValid:multipathProbability:](self, "initWithVariant:macAddr:machAbsTime_sec:machContTimeValid:machContTime_sec:range_m:rangeUnc_m:azValid:elValid:az_deg:el_deg:azUnc_deg:elUnc_deg:fovConfidence:soiRssiValid:soiRssi_dBm:antennaType:prevSolutionIsBad:trackScoreValid:trackScore:sweepAngleValid:sweepAngle_deg:multipathProbabilityValid:multipathProbability:", v43, v44, v5, v9, v10, v20, v42, v41, v40, v39, v38, v13, v15, v17, v19,
           v22,
           v23,
           v35,
           v27,
           v36,
           v30,
           v37,
           v33);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t variant;
  id v5;

  variant = self->_variant;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", variant, CFSTR("variant"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_mac_addr, CFSTR("macAddr"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("machAbsTime"), self->_mach_absolute_time_sec);
  objc_msgSend(v5, "encodeBool:forKey:", self->_mach_continuous_time_valid, CFSTR("machContTimeValid"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("machContTime"), self->_mach_continuous_time_sec);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("range"), self->_range_m);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("rangeUnc"), self->_range_unc_m);
  objc_msgSend(v5, "encodeBool:forKey:", self->_az_valid, CFSTR("azValid"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_el_valid, CFSTR("elValid"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("az"), self->_az_deg);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("el"), self->_el_deg);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("azUnc"), self->_az_unc_deg);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("elUnc"), self->_el_unc_deg);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("fovConfidence"), self->_fov_confidence);
  objc_msgSend(v5, "encodeBool:forKey:", self->_soi_rssi_valid, CFSTR("soiRssiValid"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("soiRssi"), self->_soi_rssi_dbm);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_antenna_type, CFSTR("antennaType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_previous_solution_is_bad, CFSTR("prevSolutionIsBad"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_track_score_valid, CFSTR("trackScoreValid"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("trackScore"), self->_track_score);
  objc_msgSend(v5, "encodeBool:forKey:", self->_sweep_angle_valid, CFSTR("sweepAngleValid"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("sweepAngleDeg"), self->_sweep_angle_deg);
  objc_msgSend(v5, "encodeBool:forKey:", self->_multipath_probability_valid, CFSTR("multipathProbabilityValid"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("multipathProbability"), self->_multipath_probability);

}

- (id)copyWithZone:(_NSZone *)a3
{
  PRRoseSolution *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = [PRRoseSolution alloc];
  LOBYTE(v8) = self->_multipath_probability_valid;
  LOBYTE(v7) = self->_sweep_angle_valid;
  LOWORD(v6) = *(_WORD *)&self->_previous_solution_is_bad;
  return -[PRRoseSolution initWithVariant:macAddr:machAbsTime_sec:machContTimeValid:machContTime_sec:range_m:rangeUnc_m:azValid:elValid:az_deg:el_deg:azUnc_deg:elUnc_deg:fovConfidence:soiRssiValid:soiRssi_dBm:antennaType:prevSolutionIsBad:trackScoreValid:trackScore:sweepAngleValid:sweepAngle_deg:multipathProbabilityValid:multipathProbability:](v4, "initWithVariant:macAddr:machAbsTime_sec:machContTimeValid:machContTime_sec:range_m:rangeUnc_m:azValid:elValid:az_deg:el_deg:azUnc_deg:elUnc_deg:fovConfidence:soiRssiValid:soiRssi_dBm:antennaType:prevSolutionIsBad:trackScoreValid:trackScore:sweepAngleValid:sweepAngle_deg:multipathProbabilityValid:multipathProbability:", self->_variant, self->_mac_addr, self->_mach_continuous_time_valid, self->_az_valid, self->_el_valid, self->_soi_rssi_valid, self->_mach_absolute_time_sec, self->_mach_continuous_time_sec, self->_range_m, self->_range_unc_m, self->_az_deg, self->_el_deg, self->_az_unc_deg, self->_el_unc_deg, *(_QWORD *)&self->_fov_confidence,
           *(_QWORD *)&self->_soi_rssi_dbm,
           self->_antenna_type,
           v6,
           *(_QWORD *)&self->_track_score,
           v7,
           *(_QWORD *)&self->_sweep_angle_deg,
           v8,
           *(_QWORD *)&self->_multipath_probability);
}

- (id)description
{
  unint64_t variant;
  const __CFString *v3;
  unint64_t antenna_type;
  const __CFString *v5;

  variant = self->_variant;
  if (variant > 2)
    v3 = CFSTR("InvalidEnumValue");
  else
    v3 = off_1E3D045F8[variant];
  antenna_type = self->_antenna_type;
  if (antenna_type > 4)
    v5 = CFSTR("InvalidEnumValue");
  else
    v5 = off_1E3D04610[antenna_type];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RoseSolution: variant: %@, mac_addr: 0x%016llx, mach_abs_time_sec: %.6f, mach_cont_time_valid: %d, mach_cont_time_sec: %.6f, range_m: %.3f, range_unc_m: %.3f, az_valid: %d, el_valid: %d, az_deg: %.3f, el_deg: %.3f, az_unc_deg: %.3f, el_unc_deg: %.3f, fov_confidence: %.3f, soi_rssi_valid: %d, soi_rssi_dbm: %.3f, antenna_type: %@, previous_solution_is_bad: %d, track_score_valid: %d, track_score: %.1f, sweep_angle_valid: %d, sweep_angle_deg: %.1f, multipath_probability_valid: %d, multipath_probability: %.2f"), v3, self->_mac_addr, *(_QWORD *)&self->_mach_absolute_time_sec, self->_mach_continuous_time_valid, *(_QWORD *)&self->_mach_continuous_time_sec, *(_QWORD *)&self->_range_m, *(_QWORD *)&self->_range_unc_m, self->_az_valid, self->_el_valid, *(_QWORD *)&self->_az_deg, *(_QWORD *)&self->_el_deg, *(_QWORD *)&self->_az_unc_deg, *(_QWORD *)&self->_el_unc_deg, *(_QWORD *)&self->_fov_confidence, self->_soi_rssi_valid, *(_QWORD *)&self->_soi_rssi_dbm,
               v5,
               self->_previous_solution_is_bad,
               self->_track_score_valid,
               *(_QWORD *)&self->_track_score,
               self->_sweep_angle_valid,
               *(_QWORD *)&self->_sweep_angle_deg,
               self->_multipath_probability_valid,
               *(_QWORD *)&self->_multipath_probability);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  int v22;
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
  int v38;
  double v39;
  double v40;
  double v41;
  int64_t v42;
  int v43;
  int v44;
  double v45;
  double v46;
  double v47;
  int v48;
  double v49;
  double v50;
  double v51;
  int v52;
  BOOL v53;
  double v55;
  double v56;
  double v57;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[PRRoseSolution variant](self, "variant");
    if (v6 != objc_msgSend(v5, "variant"))
      goto LABEL_25;
    v7 = -[PRRoseSolution mac_addr](self, "mac_addr");
    if (v7 != objc_msgSend(v5, "mac_addr"))
      goto LABEL_25;
    -[PRRoseSolution mach_absolute_time_sec](self, "mach_absolute_time_sec");
    v9 = v8;
    objc_msgSend(v5, "mach_absolute_time_sec");
    if (v9 != v10)
      goto LABEL_25;
    v11 = -[PRRoseSolution mach_continuous_time_valid](self, "mach_continuous_time_valid");
    if (v11 != objc_msgSend(v5, "mach_continuous_time_valid"))
      goto LABEL_25;
    -[PRRoseSolution mach_continuous_time_sec](self, "mach_continuous_time_sec");
    v13 = v12;
    objc_msgSend(v5, "mach_continuous_time_sec");
    if (v13 != v14)
      goto LABEL_25;
    -[PRRoseSolution range_m](self, "range_m");
    v16 = v15;
    objc_msgSend(v5, "range_m");
    if (v16 != v17)
      goto LABEL_25;
    -[PRRoseSolution range_unc_m](self, "range_unc_m");
    v19 = v18;
    objc_msgSend(v5, "range_unc_m");
    if (v19 != v20)
      goto LABEL_25;
    v21 = -[PRRoseSolution az_valid](self, "az_valid");
    if (v21 != objc_msgSend(v5, "az_valid"))
      goto LABEL_25;
    v22 = -[PRRoseSolution el_valid](self, "el_valid");
    if (v22 != objc_msgSend(v5, "el_valid"))
      goto LABEL_25;
    -[PRRoseSolution az_deg](self, "az_deg");
    v24 = v23;
    objc_msgSend(v5, "az_deg");
    if (v24 != v25)
      goto LABEL_25;
    -[PRRoseSolution el_deg](self, "el_deg");
    v27 = v26;
    objc_msgSend(v5, "el_deg");
    if (v27 != v28)
      goto LABEL_25;
    -[PRRoseSolution az_unc_deg](self, "az_unc_deg");
    v30 = v29;
    objc_msgSend(v5, "az_unc_deg");
    if (v30 != v31)
      goto LABEL_25;
    -[PRRoseSolution el_unc_deg](self, "el_unc_deg");
    v33 = v32;
    objc_msgSend(v5, "el_unc_deg");
    if (v33 != v34)
      goto LABEL_25;
    -[PRRoseSolution fov_confidence](self, "fov_confidence");
    v36 = v35;
    objc_msgSend(v5, "fov_confidence");
    if (v36 != v37)
      goto LABEL_25;
    v38 = -[PRRoseSolution soi_rssi_valid](self, "soi_rssi_valid");
    if (v38 != objc_msgSend(v5, "soi_rssi_valid"))
      goto LABEL_25;
    -[PRRoseSolution soi_rssi_dbm](self, "soi_rssi_dbm");
    v40 = v39;
    objc_msgSend(v5, "soi_rssi_dbm");
    if (v40 != v41)
      goto LABEL_25;
    v42 = -[PRRoseSolution antenna_type](self, "antenna_type");
    if (v42 != objc_msgSend(v5, "antenna_type"))
      goto LABEL_25;
    v43 = -[PRRoseSolution previous_solution_is_bad](self, "previous_solution_is_bad");
    if (v43 != objc_msgSend(v5, "previous_solution_is_bad"))
      goto LABEL_25;
    v44 = -[PRRoseSolution track_score_valid](self, "track_score_valid");
    if (v44 != objc_msgSend(v5, "track_score_valid"))
      goto LABEL_25;
    -[PRRoseSolution track_score](self, "track_score");
    v46 = v45;
    objc_msgSend(v5, "track_score");
    if (v46 != v47)
      goto LABEL_25;
    v48 = -[PRRoseSolution sweep_angle_valid](self, "sweep_angle_valid");
    if (v48 == objc_msgSend(v5, "sweep_angle_valid")
      && (-[PRRoseSolution sweep_angle_deg](self, "sweep_angle_deg"),
          v50 = v49,
          objc_msgSend(v5, "sweep_angle_deg"),
          v50 == v51)
      && (v52 = -[PRRoseSolution multipath_probability_valid](self, "multipath_probability_valid"),
          v52 == objc_msgSend(v5, "multipath_probability_valid")))
    {
      -[PRRoseSolution multipath_probability](self, "multipath_probability");
      v56 = v55;
      objc_msgSend(v5, "multipath_probability");
      v53 = v56 == v57;
    }
    else
    {
LABEL_25:
      v53 = 0;
    }

  }
  else
  {
    v53 = 0;
  }

  return v53;
}

- (int64_t)variant
{
  return self->_variant;
}

- (unint64_t)mac_addr
{
  return self->_mac_addr;
}

- (double)mach_absolute_time_sec
{
  return self->_mach_absolute_time_sec;
}

- (BOOL)mach_continuous_time_valid
{
  return self->_mach_continuous_time_valid;
}

- (double)mach_continuous_time_sec
{
  return self->_mach_continuous_time_sec;
}

- (double)range_m
{
  return self->_range_m;
}

- (double)range_unc_m
{
  return self->_range_unc_m;
}

- (BOOL)az_valid
{
  return self->_az_valid;
}

- (BOOL)el_valid
{
  return self->_el_valid;
}

- (double)az_deg
{
  return self->_az_deg;
}

- (double)el_deg
{
  return self->_el_deg;
}

- (double)az_unc_deg
{
  return self->_az_unc_deg;
}

- (double)el_unc_deg
{
  return self->_el_unc_deg;
}

- (double)fov_confidence
{
  return self->_fov_confidence;
}

- (BOOL)soi_rssi_valid
{
  return self->_soi_rssi_valid;
}

- (double)soi_rssi_dbm
{
  return self->_soi_rssi_dbm;
}

- (int64_t)antenna_type
{
  return self->_antenna_type;
}

- (BOOL)previous_solution_is_bad
{
  return self->_previous_solution_is_bad;
}

- (BOOL)track_score_valid
{
  return self->_track_score_valid;
}

- (double)track_score
{
  return self->_track_score;
}

- (BOOL)sweep_angle_valid
{
  return self->_sweep_angle_valid;
}

- (double)sweep_angle_deg
{
  return self->_sweep_angle_deg;
}

- (BOOL)multipath_probability_valid
{
  return self->_multipath_probability_valid;
}

- (double)multipath_probability
{
  return self->_multipath_probability;
}

@end
