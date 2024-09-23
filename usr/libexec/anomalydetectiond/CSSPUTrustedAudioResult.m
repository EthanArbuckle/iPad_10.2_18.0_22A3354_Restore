@implementation CSSPUTrustedAudioResult

- (CSSPUTrustedAudioResult)initWithEpochTimestamp:(unint64_t)a3 planarResult:(CSSPUAudioCrashResult_Struct *)a4 rolloverResult:(CSSPUAudioCrashResult_Struct *)a5 historicalLoudness:(CSSPUHistoricalLoudness_Struct)a6 maxRMS:(float)a7 numShortAudio:(unsigned int)a8 numPointsInEpoch:(unsigned int)a9 epochMinTimestamp:(unint64_t)a10 epochMaxTimestamp:(unint64_t)a11 dramDuration:(unsigned int)a12
{
  float soundEnvelopeCount;
  float soundMeanCurrentWindow;
  float soundMeanLast15s;
  float soundMaxMeanOverArmSession;
  CSSPUTrustedAudioResult *result;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;

  soundEnvelopeCount = a6.soundEnvelopeCount;
  soundMeanCurrentWindow = a6.soundMeanCurrentWindow;
  soundMeanLast15s = a6.soundMeanLast15s;
  soundMaxMeanOverArmSession = a6.soundMaxMeanOverArmSession;
  v30.receiver = self;
  v30.super_class = (Class)CSSPUTrustedAudioResult;
  result = -[CSSPUTrustedAudioResult init](&v30, "init");
  if (result)
  {
    result->_c_struct.timestamp = a3;
    *(_OWORD *)&result->_c_struct.planarResult.maxEnergy = *(_OWORD *)&a4->maxEnergy;
    v24 = *(_OWORD *)&a4->chaosAtMaxEnergy;
    v25 = *(_OWORD *)&a4->timestampAtMaxChaos;
    v26 = *(_OWORD *)&a4->maxSaturation;
    *(_OWORD *)((char *)&result->_c_struct.planarResult.timestampAtMaxSaturation + 1) = *(_OWORD *)((char *)&a4->timestampAtMaxSaturation
                                                                                                  + 1);
    *(_OWORD *)&result->_c_struct.planarResult.timestampAtMaxChaos = v25;
    *(_OWORD *)&result->_c_struct.planarResult.maxSaturation = v26;
    *(_OWORD *)&result->_c_struct.planarResult.chaosAtMaxEnergy = v24;
    v27 = *(_OWORD *)&a5->chaosAtMaxEnergy;
    v28 = *(_OWORD *)&a5->timestampAtMaxChaos;
    v29 = *(_OWORD *)&a5->maxSaturation;
    *(_OWORD *)((char *)&result->_c_struct.rolloverResult.timestampAtMaxSaturation + 1) = *(_OWORD *)((char *)&a5->timestampAtMaxSaturation + 1);
    *(_OWORD *)&result->_c_struct.rolloverResult.timestampAtMaxChaos = v28;
    *(_OWORD *)&result->_c_struct.rolloverResult.maxSaturation = v29;
    *(_OWORD *)&result->_c_struct.rolloverResult.chaosAtMaxEnergy = v27;
    *(_OWORD *)&result->_c_struct.rolloverResult.maxEnergy = *(_OWORD *)&a5->maxEnergy;
    result->_c_struct.historicalLoudness.soundMaxMeanOverArmSession = soundMaxMeanOverArmSession;
    result->_c_struct.historicalLoudness.soundMeanLast15s = soundMeanLast15s;
    result->_c_struct.historicalLoudness.soundMeanCurrentWindow = soundMeanCurrentWindow;
    result->_c_struct.historicalLoudness.soundEnvelopeCount = soundEnvelopeCount;
    result->_c_struct.maxRMS = a7;
    result->_c_struct.numShortAudio = a8;
    result->_c_struct.numPointsInEpoch = a9;
    result->_c_struct.epochMinTimestamp = a10;
    result->_c_struct.epochMaxTimestamp = a11;
    result->_c_struct.dramDuration = a12;
  }
  return result;
}

- (CSSPUTrustedAudioResult)initWithSPUPacketStruct:(const CMSafetyAudioResult *)a3
{
  unint64_t var1;
  float var4;
  unint64_t var5;
  float v10;
  unint64_t var9;
  BOOL var12;
  float var0;
  unint64_t v14;
  float v15;
  unint64_t v16;
  float v17;
  unint64_t v18;
  BOOL v19;
  unint64_t v24;
  double v25;
  uint64_t v27;
  float v28;
  unint64_t v29;
  uint64_t v30;
  float v31;
  unint64_t v32;
  uint64_t v33;
  float v34;
  unint64_t v35;
  uint64_t v36;
  BOOL v37;
  float v38;
  unint64_t v39;
  uint64_t v40;
  float v41;
  unint64_t v42;
  uint64_t v43;
  float v44;
  unint64_t v45;
  uint64_t v46;
  BOOL v47;

  var1 = a3->var1.var1;
  var4 = a3->var1.var4;
  var5 = a3->var1.var5;
  v10 = a3->var1.var8;
  var9 = a3->var1.var9;
  var12 = a3->var1.var12;
  var0 = a3->var2.var0;
  v14 = a3->var2.var1;
  v15 = a3->var2.var4;
  v16 = a3->var2.var5;
  v17 = a3->var2.var8;
  v18 = a3->var2.var9;
  v19 = a3->var2.var12;
  LOWORD(_D0) = *(_WORD *)&a3->var9;
  __asm { FCVT            S0, H0 }
  LOWORD(_D1) = *((_WORD *)&a3->var9 + 1);
  __asm { FCVT            S1, H1 }
  LOWORD(_D2) = a3[1].var0;
  __asm { FCVT            S2, H2 }
  LOWORD(_D3) = WORD1(a3[1].var0);
  __asm { FCVT            S3, H3 }
  v24 = a3->var0;
  v38 = a3->var1.var0;
  v39 = var1;
  v40 = *(_QWORD *)&a3->var1.var2;
  v41 = var4;
  v42 = var5;
  v43 = *(_QWORD *)&a3->var1.var6;
  v44 = v10;
  v45 = var9;
  v46 = *(_QWORD *)&a3->var1.var10;
  v47 = var12;
  v28 = var0;
  v29 = v14;
  v30 = *(_QWORD *)&a3->var2.var2;
  v31 = v15;
  v32 = v16;
  v33 = *(_QWORD *)&a3->var2.var6;
  v34 = v17;
  v35 = v18;
  v36 = *(_QWORD *)&a3->var2.var10;
  HIDWORD(v25) = HIDWORD(v36);
  v37 = v19;
  *(float *)&v25 = a3->var3;
  LODWORD(v27) = a3->var8;
  return -[CSSPUTrustedAudioResult initWithEpochTimestamp:planarResult:rolloverResult:historicalLoudness:maxRMS:numShortAudio:numPointsInEpoch:epochMinTimestamp:epochMaxTimestamp:dramDuration:](self, "initWithEpochTimestamp:planarResult:rolloverResult:historicalLoudness:maxRMS:numShortAudio:numPointsInEpoch:epochMinTimestamp:epochMaxTimestamp:dramDuration:", v24, &v38, &v28, a3->var4, a3->var5, a3->var6, _D0, _D1, _D2, _D3, v25, a3->var7, v27);
}

- (unint64_t)timestamp
{
  return self->_c_struct.timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_c_struct.timestamp = a3;
}

- (CSSPUTrustedAudioResult_Struct)c_struct
{
  return &self->_c_struct;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_DWORD *)self + 4) = 0;
  *((_DWORD *)self + 24) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_DWORD *)self + 10) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_DWORD *)self + 16) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_BYTE *)self + 88) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_DWORD *)self + 30) = 0;
  *((_DWORD *)self + 36) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_BYTE *)self + 168) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_DWORD *)self + 50) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_DWORD *)self + 56) = 0;
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 27) = 0;
  return self;
}

@end
