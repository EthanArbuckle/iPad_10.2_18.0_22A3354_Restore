@implementation CLWorkoutModuleSettings

- (CLWorkoutModuleSettings)initWith:(void *)a3
{
  CLWorkoutModuleSettings *v4;
  int v5;
  float v6;
  double v7;
  void **p_recordingType;
  void **v9;
  void *v11[2];
  char v12;
  _BYTE v13[24];
  uint64_t v14;
  void *__p[2];
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLWorkoutModuleSettings;
  v4 = -[CLWorkoutModuleSettings init](&v17, "init");
  if (v4)
  {
    sub_1018BEA14(v13, "WorkoutRecorderListenersAccelIntervalSeconds", &qword_101CEB5A0, 0);
    v4->_settings.accelIntervalSeconds = *(double *)&v13[8];
    sub_1018BF25C(v13, "WorkoutRecorderAveragedALSDisable", (unsigned __int8 *)&unk_101CEB5A8, 0);
    v4->_settings.disableAveragedALS = v13[1];
    sub_1018BF25C(v13, "WorkoutRecorderListenersBodyMetricsDisable", (unsigned __int8 *)&unk_101CEB5A9, 0);
    v4->_settings.disableBodyMetrics = v13[1];
    v4->_settings.disableForceActiveListeners = sub_1018C1810(*(_QWORD *)a3);
    sub_1018BF25C(v13, "WorkoutRecorderListenersHealthKitInfoDisable", (unsigned __int8 *)&unk_101CEB5AA, 0);
    v4->_settings.disableHealthKitInfo = v13[1];
    v4->_settings.disableHeartRate = sub_1018C17B0(*(_QWORD *)a3);
    sub_1018BF25C(v13, "kWorkoutRecorderLatLongDisable", (unsigned __int8 *)&unk_101CEB5AB, 0);
    v4->_settings.disableLatLong = v13[1];
    sub_1018BF25C(v13, "kWorkoutRecorderMeanMaxMetsDisable", (unsigned __int8 *)&unk_101CEB5AC, 0);
    v4->_settings.disableMeanMaxMets = v13[1];
    sub_1018BF25C(v13, "WorkoutRecorderListenersWorkoutEventsDisable", (unsigned __int8 *)&unk_101CEB5AD, 0);
    v4->_settings.disableMotionState = v13[1];
    sub_1018BF25C(v13, "WorkoutRecorderListenersOdometerDisable", (unsigned __int8 *)&unk_101CEB5AE, 0);
    v4->_settings.disableOdometer = v13[1];
    sub_1018BF25C(v13, "WorkoutRecorderPressureDisable", (unsigned __int8 *)&unk_101CEB5AF, 0);
    v4->_settings.disablePressure = v13[1];
    sub_1018BF25C(v13, "WorkoutRecorderElevationOffsetDisable", (unsigned __int8 *)&unk_101CEB5B0, 0);
    v4->_settings.disablePrivacyElevationOffset = v13[1];
    sub_1018BF25C(v13, "kWorkoutRecorderStrideCalBinsDisable", (unsigned __int8 *)&unk_101CEB5B1, 0);
    v4->_settings.disableStrideCalBins = v13[1];
    sub_1018BF25C(v13, "WorkoutRecorderListenersWatchOrientation+Disable", (unsigned __int8 *)&unk_101CEB5B2, 0);
    v4->_settings.disableWatchOrientation = v13[1];
    sub_1018BF25C(v13, "WorkoutRecorderListenersWatchOnWristStatusDisable", (unsigned __int8 *)&unk_101CEB5B3, 0);
    v4->_settings.disableWatchOnWristStatus = v13[1];
    sub_1018BF25C(v13, "WorkoutRecorderWeatherDataDisable", (unsigned __int8 *)&unk_101CEB5B4, 0);
    v4->_settings.disableWeatherData = v13[1];
    sub_1018BF25C(v13, "WorkoutRecorderWifiScanDisable", byte_101CEB5B5, 0);
    v4->_settings.disableWifiScans = v13[1];
    v11[0] = (void *)0x1000000;
    sub_1018CA5B4(v13, "WorkoutRecorderRecordingFileSizeMaxBytes", v11, 0);
    v4->_settings.recordingType.var0 = *(_QWORD *)&v13[8];
    sub_1018C1A0C((unsigned __int8 *)__p, "WorkoutRecorderRecordingFileSizeMaxSeconds", dword_101CEB5B8, 0);
    v4->_settings.recordingType.__r_.var0 = HIDWORD(__p[0]);
    v4->_settings.kPrivacyPressureMaxOffset = 200.0;
    v5 = sub_100762E90();
    v6 = 0.03125;
    if (v5)
      v6 = 0.0083333;
    v4->_settings.kPressureUpdateInterval = v6;
    sub_1018BEA14(v13, "kWorkoutRecorderMinimumPowerAssertionTimeSeconds", &qword_101CEB5C0, 0);
    v4->_settings.minimumPowerAssertionTimeSeconds = *(double *)&v13[8];
    sub_1018BEA14(v13, "kWorkoutRecorderListenersMagIntervalSeconds", &qword_101CEB5C8, 0);
    v4->_settings.magIntervalSeconds = *(double *)&v13[8];
    -[CLWorkoutModuleSettings createPrivacyTimeOffset](v4, "createPrivacyTimeOffset");
    v4->_settings.privacyTimeOffset = v7;
    (*(void (**)(_BYTE *__return_ptr))(**(_QWORD **)a3 + 40))(v13);
    p_recordingType = (void **)&v4->_settings.recordingType;
    if (*((char *)&v4->_settings.recordingType.__r_.__value_.var0.var1 + 23) < 0)
      operator delete(*p_recordingType);
    *(_OWORD *)p_recordingType = *(_OWORD *)v13;
    *((_QWORD *)&v4->_settings.recordingType.__r_.__value_.var0.var1 + 2) = *(_QWORD *)&v13[16];
    sub_1018BEA14(v13, "WorkoutRecorderListenersRotationRateIntervalSeconds", &qword_101CEB5D0, 0);
    v4->_settings.rotationRateIntervalSeconds = *(double *)&v13[8];
    *(_DWORD *)&v4->_settings.recordingType.__r_.var1 = 3000;
    v4->_settings.kCachedCompassCalibrationQuality = 0.28;
    v4[1].super.isa = (Class)CFSTR("CompassCalibration");
    v4[1]._moduleNames.__begin_ = (int *)0x40AC200000000000;
    sub_1015A2E04(v11, "");
    sub_1018C9D4C(v13, "WorkoutRecorderParticipantUUID", (__int128 *)v11, 1u);
    if (SHIBYTE(v14) < 0)
    {
      sub_100115CE4(__p, *(void **)&v13[8], *(unint64_t *)&v13[16]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)&v13[8];
      v16 = v14;
    }
    if (v16 >= 0)
      v9 = __p;
    else
      v9 = (void **)__p[0];
    v4[1]._moduleNames.__end_cap_.__value_ = (int *)-[NSString copy](+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9), "copy");
    if (SHIBYTE(v16) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v14) < 0)
      operator delete(*(void **)&v13[8]);
    if (v12 < 0)
      operator delete(v11[0]);
    sub_1018BEA14(v13, "WorkoutRecorderHeadsetDMUpdateInterval", &qword_101CEB5D8, 0);
    *(_QWORD *)&v4[1]._settings.disableAveragedALS = *(_QWORD *)&v13[8];
    sub_1018BF25C(v13, "WorkoutRecorderHeadsetDMEnableLowLatency", byte_101CEB5E0, 0);
    v4[1]._settings.disableOdometer = v13[1];
    LODWORD(__p[0]) = 1;
    sub_1018C1A0C(v13, "WorkoutRecorderHeadsetDMBufferSize", __p, 0);
    *(_DWORD *)&v4[1]._settings.disableWatchOrientation = *(_DWORD *)&v13[4];
  }
  return v4;
}

- (double)createPrivacyTimeOffset
{
  double v2;
  double v3;
  unsigned __int8 v5[8];
  double v6;

  sub_1018BEA14(v5, "WorkoutRecorderTimeIntervalOffsetMax", &qword_101CEB5E8, 0);
  v2 = v6;
  sub_1018BEA14(v5, "WorkoutRecorderTimeIntervalOffsetMin", &qword_101CEB5F0, 0);
  v3 = v6;
  return v3 + (double)rand() / 2147483650.0 * (v2 - v3);
}

- (SettingStructure)getStructSetting:(SettingStructure *__return_ptr)retstr
{
  uint64_t v1;
  const unsigned __int8 *v2;
  const unsigned __int8 *v3;
  uint64_t v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  SettingStructure *result;

  v3 = v2;
  v4 = v1;
  uuid_copy((unsigned __int8 *)(v1 + 112), v2);
  if (v3[16])
  {
    *(_QWORD *)(v4 + 184) = *((_QWORD *)v3 + 3);
    *(_BYTE *)(v4 + 48) = 1;
  }
  v6 = *(_OWORD *)(v4 + 80);
  *(_OWORD *)&retstr->kPrivacyPressureMaxOffset = *(_OWORD *)(v4 + 64);
  *(_OWORD *)&retstr->privacyTimeOffset = v6;
  v7 = *(_OWORD *)(v4 + 112);
  *(_OWORD *)&retstr->minimumPowerAssertionTimeSeconds = *(_OWORD *)(v4 + 96);
  *(_OWORD *)retstr->workoutRecorderSessionId = v7;
  v8 = *(_OWORD *)(v4 + 48);
  *(_OWORD *)&retstr->disableAveragedALS = *(_OWORD *)(v4 + 32);
  *(_OWORD *)&retstr->hasSyncInWatch = v8;
  result = (SettingStructure *)&retstr->recordingType;
  if (*(char *)(v4 + 151) < 0)
  {
    result = (SettingStructure *)sub_100115CE4(result, *(void **)(v4 + 128), *(_QWORD *)(v4 + 136));
  }
  else
  {
    *(_OWORD *)&result->disableAveragedALS = *(_OWORD *)(v4 + 128);
    *((_QWORD *)&retstr->recordingType.__r_.__value_.var0.var1 + 2) = *(_QWORD *)(v4 + 144);
  }
  *(_OWORD *)&retstr->recordingType.__r_.var0 = *(_OWORD *)(v4 + 152);
  *(_OWORD *)&retstr[1].disableAveragedALS = *(_OWORD *)(v4 + 168);
  *(_OWORD *)&retstr[1].hasSyncInWatch = *(_OWORD *)(v4 + 184);
  *(_OWORD *)&retstr[1].kPrivacyPressureMaxOffset = *(_OWORD *)(v4 + 200);
  return result;
}

- (void).cxx_destruct
{
  int *begin;

  if (*((char *)&self->_settings.recordingType.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_settings.recordingType.__r_.__value_.var0.var1.__data_);
  begin = self->_moduleNames.__begin_;
  if (begin)
  {
    self->_moduleNames.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *(_OWORD *)((char *)self + 136) = 0uLL;
  *((_QWORD *)self + 16) = 0;
  return self;
}

@end
