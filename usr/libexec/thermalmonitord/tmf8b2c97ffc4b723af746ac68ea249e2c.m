@implementation tmf8b2c97ffc4b723af746ac68ea249e2c

- (void)updateAllThermalLoad:(BOOL)a3
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  float v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  float32x4_t v15;
  int v16;
  float32x4_t v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;

  -[SensorDispatcherHelper getFloatValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance", a3), "getFloatValueFromSMCForKey:", CFSTR("Te3z"));
  v26 = v3;
  -[SensorDispatcherHelper getFloatValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getFloatValueFromSMCForKey:", CFSTR("Ts5z"));
  v24 = v4;
  -[SensorDispatcherHelper getFloatValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getFloatValueFromSMCForKey:", CFSTR("Ta1z"));
  v25 = v5;
  -[SensorDispatcherHelper getFloatValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getFloatValueFromSMCForKey:", CFSTR("Tp2z"));
  v23 = v6;
  -[SensorDispatcherHelper getFloatValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getFloatValueFromSMCForKey:", CFSTR("Tp3z"));
  v22 = v7;
  -[SensorDispatcherHelper getFloatValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getFloatValueFromSMCForKey:", CFSTR("Tp4z"));
  v21 = v8;
  -[SensorDispatcherHelper getFloatValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getFloatValueFromSMCForKey:", CFSTR("Tp5z"));
  v10 = (int)(float)(v9 * 100.0);
  -[SensorDispatcherHelper getFloatValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getFloatValueFromSMCForKey:", CFSTR("Tp7z"));
  v20 = v11;
  -[SensorDispatcherHelper getFloatValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getFloatValueFromSMCForKey:", CFSTR("Tp8z"));
  v19 = v12;
  -[SensorDispatcherHelper getFloatValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getFloatValueFromSMCForKey:", CFSTR("Tp9z"));
  v18 = v13;
  -[SensorDispatcherHelper getFloatValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getFloatValueFromSMCForKey:", CFSTR("tGAM"));
  v15 = (float32x4_t)vdupq_n_s32(0x42C80000u);
  qword_1000A29AC = (uint64_t)vmax_s32((int32x2_t)qword_1000A29AC, vcvt_s32_f32(vmul_f32((float32x2_t)__PAIR64__(v24, v26), *(float32x2_t *)v15.f32)));
  qword_1000A29B4 = (uint64_t)vmax_s32((int32x2_t)qword_1000A29B4, vcvt_s32_f32(vmul_f32((float32x2_t)__PAIR64__(v23, v25), *(float32x2_t *)v15.f32)));
  qword_1000A29BC = (uint64_t)vmax_s32((int32x2_t)qword_1000A29BC, vcvt_s32_f32(vmul_f32((float32x2_t)__PAIR64__(v21, v22), *(float32x2_t *)v15.f32)));
  v16 = dword_1000A29C4;
  if (dword_1000A29C4 <= v10)
    v16 = v10;
  v17.i64[0] = __PAIR64__(v19, v20);
  v17.i64[1] = __PAIR64__(v14, v18);
  dword_1000A29C4 = v16;
  *(int32x4_t *)&dword_1000A29C8 = vmaxq_s32(*(int32x4_t *)&dword_1000A29C8, vcvtq_s32_f32(vmulq_f32(v17, v15)));
  objc_msgSend((id)qword_1000A2E38, "setPackageLowPowerTarget");
}

@end
