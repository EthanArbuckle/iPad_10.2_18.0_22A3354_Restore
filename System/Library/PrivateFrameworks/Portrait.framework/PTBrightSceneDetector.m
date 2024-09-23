@implementation PTBrightSceneDetector

- (void)reset
{
  self->_brightSceneState = 0;
  *(_QWORD *)&self->_brightScene = 0x7FC0000000000000;
}

- (PTBrightSceneDetector)initWithLuxLevelThreshold:(float)a3 emaFilterCoefficient:(float)a4 transitionTime:
{
  float v4;
  float v5;
  PTBrightSceneDetector *v7;
  PTBrightSceneDetector *v8;
  NSObject *v9;
  PTBrightSceneDetector *v10;
  float32x2_t v12;
  objc_super v13;

  v5 = v4;
  v12 = *(float32x2_t *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)PTBrightSceneDetector;
  v7 = -[PTBrightSceneDetector init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    if ((vcgt_f32(v12, (float32x2_t)vdup_lane_s32((int32x2_t)v12, 1)).u8[0] & 1) == 0)
    {
      *(float32x2_t *)v7->_luxLevelThreshold = v12;
      v7->_emaFilterCoefficient = a4;
      v7->_transitionTime = v5;
      -[PTBrightSceneDetector reset](v7, "reset");
      v10 = v8;
      goto LABEL_8;
    }
    _PTLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PTBrightSceneDetector initWithLuxLevelThreshold:emaFilterCoefficient:transitionTime:].cold.1(v9);

  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (void)updateWithLuxLevel:(float)a3 deltaTime:(float)a4
{
  float v4;
  _BOOL4 v5;
  float v6;
  double v7;
  float v8;

  v4 = self->_filteredLuxLevel + (float)(self->_emaFilterCoefficient * (float)(a3 - self->_filteredLuxLevel));
  self->_filteredLuxLevel = v4;
  v5 = *(float *)&self->_luxLevelThreshold[4 * !self->_brightSceneState] < v4;
  self->_brightSceneState = v5;
  v6 = -a4;
  if (v5)
    v6 = a4;
  v7 = (float)(self->_brightScene + (float)(v6 / self->_transitionTime));
  if (v7 > 1.0)
    v7 = 1.0;
  v8 = fmax(v7, 0.0);
  self->_brightScene = v8;
}

- (float)brightScene
{
  return self->_brightScene;
}

- (__n64)debugState
{
  __n64 result;

  result.n64_u32[0] = *(_DWORD *)(a1 + 12);
  LOBYTE(a3) = *(_BYTE *)(a1 + 16);
  result.n64_f32[1] = (float)LODWORD(a3);
  return result;
}

- (void)initWithLuxLevelThreshold:(os_log_t)log emaFilterCoefficient:transitionTime:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Invalid luxLevelThreshold", v1, 2u);
}

@end
