@implementation CLSerializableMobilityBoutMetrics

- (CLSerializableMobilityBoutMetrics)initWithBoutMetrics:(const BoutMetrics *)a3
{
  CLSerializableMobilityBoutMetrics *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLSerializableMobilityBoutMetrics;
  result = -[CLSerializableMobilityBoutMetrics init](&v15, "init");
  if (result)
  {
    v5 = *(_OWORD *)&a3->recordId;
    *(_OWORD *)&result->_metrics.endTime = *(_OWORD *)&a3->endTime;
    *(_OWORD *)&result->_metrics.recordId = v5;
    v6 = *(_OWORD *)&a3->terminationReason;
    v7 = *(_OWORD *)&a3->deviceSide;
    v8 = *(_OWORD *)&a3->stepLengthEntropy;
    *(_OWORD *)&result->_metrics.stepLengthPoincareSD2 = *(_OWORD *)&a3->stepLengthPoincareSD2;
    *(_OWORD *)&result->_metrics.stepLengthEntropy = v8;
    *(_OWORD *)&result->_metrics.deviceSide = v7;
    *(_OWORD *)&result->_metrics.terminationReason = v6;
    v9 = *(_OWORD *)&a3->cycleTimePoincareSD1;
    v10 = *(_OWORD *)&a3->walkingSpeed;
    v11 = *(_OWORD *)&a3->stepLength;
    *(_OWORD *)&result->_metrics.stepIndexOfHarmonicityAP = *(_OWORD *)&a3->stepIndexOfHarmonicityAP;
    *(_OWORD *)&result->_metrics.stepLength = v11;
    *(_OWORD *)&result->_metrics.walkingSpeed = v10;
    *(_OWORD *)&result->_metrics.cycleTimePoincareSD1 = v9;
    v12 = *(_OWORD *)&a3->swingIndexOfHarmonicityML;
    v13 = *(_OWORD *)&a3->segmentsRejectedByIsFeasibleWalkingSpeed;
    v14 = *(_OWORD *)&a3->walkingSpeedRejectionStatus;
    *(_OWORD *)((char *)&result->_metrics.asymmetryPercentageRejectionStatus + 1) = *(_OWORD *)((char *)&a3->asymmetryPercentageRejectionStatus
                                                                                              + 1);
    *(_OWORD *)&result->_metrics.walkingSpeedRejectionStatus = v14;
    *(_OWORD *)&result->_metrics.segmentsRejectedByIsFeasibleWalkingSpeed = v13;
    *(_OWORD *)&result->_metrics.swingIndexOfHarmonicityML = v12;
  }
  return result;
}

- (void)getBoutMetrics:(BoutMetrics *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v3 = *(_OWORD *)&self->_metrics.endTime;
  *(_OWORD *)&a3->recordId = *(_OWORD *)&self->_metrics.recordId;
  *(_OWORD *)&a3->endTime = v3;
  v4 = *(_OWORD *)&self->_metrics.terminationReason;
  v5 = *(_OWORD *)&self->_metrics.deviceSide;
  v6 = *(_OWORD *)&self->_metrics.stepLengthPoincareSD2;
  *(_OWORD *)&a3->stepLengthEntropy = *(_OWORD *)&self->_metrics.stepLengthEntropy;
  *(_OWORD *)&a3->stepLengthPoincareSD2 = v6;
  *(_OWORD *)&a3->terminationReason = v4;
  *(_OWORD *)&a3->deviceSide = v5;
  v7 = *(_OWORD *)&self->_metrics.cycleTimePoincareSD1;
  v8 = *(_OWORD *)&self->_metrics.walkingSpeed;
  v9 = *(_OWORD *)&self->_metrics.stepIndexOfHarmonicityAP;
  *(_OWORD *)&a3->stepLength = *(_OWORD *)&self->_metrics.stepLength;
  *(_OWORD *)&a3->stepIndexOfHarmonicityAP = v9;
  *(_OWORD *)&a3->cycleTimePoincareSD1 = v7;
  *(_OWORD *)&a3->walkingSpeed = v8;
  v10 = *(_OWORD *)&self->_metrics.swingIndexOfHarmonicityML;
  v11 = *(_OWORD *)&self->_metrics.segmentsRejectedByIsFeasibleWalkingSpeed;
  v12 = *(_OWORD *)&self->_metrics.walkingSpeedRejectionStatus;
  *(_OWORD *)((char *)&a3->asymmetryPercentageRejectionStatus + 1) = *(_OWORD *)((char *)&self->_metrics.asymmetryPercentageRejectionStatus
                                                                               + 1);
  *(_OWORD *)&a3->segmentsRejectedByIsFeasibleWalkingSpeed = v11;
  *(_OWORD *)&a3->walkingSpeedRejectionStatus = v12;
  *(_OWORD *)&a3->swingIndexOfHarmonicityML = v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(a3, "encodeInt:forKey:", self->_metrics.recordId, CFSTR("recordId"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("startTime"), self->_metrics.startTime);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("endTime"), self->_metrics.endTime);
  objc_msgSend(a3, "encodeInt:forKey:", self->_metrics.stepCount, CFSTR("stepCount"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_metrics.workoutType, CFSTR("workoutType"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_metrics.terminationReason, CFSTR("terminationReason"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_metrics.numGaitMetrics, CFSTR("numGaitMetrics"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("invalidGradePercentage"), self->_metrics.invalidGradePercentage);
  objc_msgSend(a3, "encodeInt:forKey:", self->_metrics.deviceSide, CFSTR("deviceSide"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_metrics.boundaryType, CFSTR("boundaryType"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("cycleTimeMean"), self->_metrics.cycleTimeMean);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("stepLengthEntropy"), self->_metrics.stepLengthEntropy);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("stepLengthPoincareSD1"), self->_metrics.stepLengthPoincareSD1);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("stepLengthPoincareSD2"), self->_metrics.stepLengthPoincareSD2);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("cycleTimeEntropy"), self->_metrics.cycleTimeEntropy);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("cycleTimePoincareSD1"), self->_metrics.cycleTimePoincareSD1);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("cycleTimePoincareSD2"), self->_metrics.cycleTimePoincareSD2);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("walkingSpeed"), self->_metrics.walkingSpeed);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("doubleSupportPercentage"), self->_metrics.doubleSupportPercentage);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("stepLength"), self->_metrics.stepLength);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("asymmetryPercentage"), self->_metrics.asymmetryPercentage);
  *(float *)&v5 = self->_metrics.stepIndexOfHarmonicityAP;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("stepIndexOfHarmonicityAP"), v5);
  *(float *)&v6 = self->_metrics.stepIndexOfHarmonicityML;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("stepIndexOfHarmonicityML"), v6);
  *(float *)&v7 = self->_metrics.stepIndexOfHarmonicityVT;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("stepIndexOfHarmonicityVT"), v7);
  *(float *)&v8 = self->_metrics.swingIndexOfHarmonicityAP;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("swingIndexOfHarmonicityAP"), v8);
  *(float *)&v9 = self->_metrics.swingIndexOfHarmonicityML;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("swingIndexOfHarmonicityML"), v9);
  *(float *)&v10 = self->_metrics.swingIndexOfHarmonicityVT;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("swingIndexOfHarmonicityVT"), v10);
  objc_msgSend(a3, "encodeInt:forKey:", self->_metrics.segmentsRejectedByIsSwingStanceCycle, CFSTR("segmentsRejectedByIsSwingStanceCycle"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_metrics.segmentsRejectedByIsNotRunning, CFSTR("segmentsRejectedByIsNotRunning"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_metrics.segmentsRejectedByIsFeasibleWalkingSpeed, CFSTR("segmentsRejectedByIsFeasibleWalkingSpeed"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_metrics.segmentsRejectedByIsPendular, CFSTR("segmentsRejectedByIsPendular"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_metrics.segmentsRejectedByIsSufficientVerticalTwist, CFSTR("segmentsRejectedByIsSufficientVerticalTwist"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_metrics.segmentsRejectedByIsCadenceConcordant, CFSTR("segmentsRejectedByIsCadenceConcordant"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_metrics.walkingSpeedRejectionStatus, CFSTR("walkingSpeedRejectionStatus"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_metrics.doubleSupportPercentageRejectionStatus, CFSTR("doubleSupportPercentageRejectionStatus"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_metrics.stepLengthRejectionStatus, CFSTR("stepLengthRejectionStatus"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_metrics.asymmetryPercentageRejectionStatus, CFSTR("asymmetryPercentageRejectionStatus"));
}

- (CLSerializableMobilityBoutMetrics)initWithCoder:(id)a3
{
  CLSerializableMobilityBoutMetrics *v4;
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
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CLSerializableMobilityBoutMetrics;
  v4 = -[CLSerializableMobilityBoutMetrics init](&v26, "init");
  if (v4)
  {
    v4->_metrics.recordId = objc_msgSend(a3, "decodeIntForKey:", CFSTR("recordId"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("startTime"));
    v4->_metrics.startTime = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("endTime"));
    v4->_metrics.endTime = v6;
    v4->_metrics.stepCount = objc_msgSend(a3, "decodeIntForKey:", CFSTR("stepCount"));
    v4->_metrics.workoutType = objc_msgSend(a3, "decodeIntForKey:", CFSTR("workoutType"));
    v4->_metrics.terminationReason = objc_msgSend(a3, "decodeIntForKey:", CFSTR("terminationReason"));
    v4->_metrics.numGaitMetrics = objc_msgSend(a3, "decodeIntForKey:", CFSTR("numGaitMetrics"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("invalidGradePercentage"));
    v4->_metrics.invalidGradePercentage = v7;
    v4->_metrics.deviceSide = objc_msgSend(a3, "decodeIntForKey:", CFSTR("deviceSide"));
    v4->_metrics.boundaryType = objc_msgSend(a3, "decodeIntForKey:", CFSTR("boundaryType"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("cycleTimeMean"));
    v4->_metrics.cycleTimeMean = v8;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("stepLengthEntropy"));
    v4->_metrics.stepLengthEntropy = v9;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("stepLengthPoincareSD1"));
    v4->_metrics.stepLengthPoincareSD1 = v10;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("stepLengthPoincareSD2"));
    v4->_metrics.stepLengthPoincareSD2 = v11;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("cycleTimeEntropy"));
    v4->_metrics.cycleTimeEntropy = v12;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("cycleTimePoincareSD1"));
    v4->_metrics.cycleTimePoincareSD1 = v13;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("cycleTimePoincareSD2"));
    v4->_metrics.cycleTimePoincareSD2 = v14;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("walkingSpeed"));
    v4->_metrics.walkingSpeed = v15;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("doubleSupportPercentage"));
    v4->_metrics.doubleSupportPercentage = v16;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("stepLength"));
    v4->_metrics.stepLength = v17;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("asymmetryPercentage"));
    v4->_metrics.asymmetryPercentage = v18;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("stepIndexOfHarmonicityAP"));
    v4->_metrics.stepIndexOfHarmonicityAP = v19;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("stepIndexOfHarmonicityML"));
    v4->_metrics.stepIndexOfHarmonicityML = v20;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("stepIndexOfHarmonicityVT"));
    v4->_metrics.stepIndexOfHarmonicityVT = v21;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("swingIndexOfHarmonicityAP"));
    v4->_metrics.swingIndexOfHarmonicityAP = v22;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("swingIndexOfHarmonicityML"));
    v4->_metrics.swingIndexOfHarmonicityML = v23;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("swingIndexOfHarmonicityVT"));
    v4->_metrics.swingIndexOfHarmonicityVT = v24;
    v4->_metrics.segmentsRejectedByIsSwingStanceCycle = objc_msgSend(a3, "decodeIntForKey:", CFSTR("segmentsRejectedByIsSwingStanceCycle"));
    v4->_metrics.segmentsRejectedByIsNotRunning = objc_msgSend(a3, "decodeIntForKey:", CFSTR("segmentsRejectedByIsNotRunning"));
    v4->_metrics.segmentsRejectedByIsFeasibleWalkingSpeed = objc_msgSend(a3, "decodeIntForKey:", CFSTR("segmentsRejectedByIsFeasibleWalkingSpeed"));
    v4->_metrics.segmentsRejectedByIsPendular = objc_msgSend(a3, "decodeIntForKey:", CFSTR("segmentsRejectedByIsPendular"));
    v4->_metrics.segmentsRejectedByIsSufficientVerticalTwist = objc_msgSend(a3, "decodeIntForKey:", CFSTR("segmentsRejectedByIsSufficientVerticalTwist"));
    v4->_metrics.segmentsRejectedByIsCadenceConcordant = objc_msgSend(a3, "decodeIntForKey:", CFSTR("segmentsRejectedByIsCadenceConcordant"));
    v4->_metrics.walkingSpeedRejectionStatus = objc_msgSend(a3, "decodeIntForKey:", CFSTR("walkingSpeedRejectionStatus"));
    v4->_metrics.doubleSupportPercentageRejectionStatus = objc_msgSend(a3, "decodeIntForKey:", CFSTR("doubleSupportPercentageRejectionStatus"));
    v4->_metrics.stepLengthRejectionStatus = objc_msgSend(a3, "decodeIntForKey:", CFSTR("stepLengthRejectionStatus"));
    v4->_metrics.asymmetryPercentageRejectionStatus = objc_msgSend(a3, "decodeIntForKey:", CFSTR("asymmetryPercentageRejectionStatus"));
  }
  return v4;
}

- (id).cxx_construct
{
  int64x2_t v2;

  *((_DWORD *)self + 2) = 0;
  *((_DWORD *)self + 15) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  v2 = vdupq_n_s64(0xFFF0000000000000);
  *(_OWORD *)((char *)self + 41) = 0u;
  *((_OWORD *)self + 4) = xmmword_101C158B0;
  *((int64x2_t *)self + 5) = v2;
  *((int64x2_t *)self + 6) = v2;
  *((_QWORD *)self + 14) = 0xFFF0000000000000;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *((_DWORD *)self + 54) = 1071225242;
  *((_BYTE *)self + 220) = 0;
  *((_DWORD *)self + 56) = 1116213084;
  *((_BYTE *)self + 228) = 0;
  return self;
}

@end
