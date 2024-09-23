@implementation TRASettingsValidator

- (NSString)orientationSettingsValidatedReason
{
  return self->_orientationSettingsValidatedReason;
}

- (BOOL)didValidateOrientationSettings
{
  return self->_orientationSettingsValidated;
}

- (void)setOrientationSettings:(id)a3
{
  NSString *orientationSettingsValidatedReason;
  id v5;
  TRASettingsOrientation *v6;
  TRASettingsOrientation *orientationSettings;

  self->_orientationSettingsValidated = 0;
  orientationSettingsValidatedReason = self->_orientationSettingsValidatedReason;
  self->_orientationSettingsValidatedReason = 0;
  v5 = a3;

  v6 = (TRASettingsOrientation *)objc_msgSend(v5, "copy");
  orientationSettings = self->_orientationSettings;
  self->_orientationSettings = v6;

}

- (void)validateOrientationSettingsWithBlock:(id)a3
{
  uint64_t (**v5)(id, TRASettingsOrientation *, id *);
  TRASettingsOrientation *orientationSettings;
  char v7;
  id v8;
  NSString *v9;
  NSString *orientationSettingsValidatedReason;
  void *v11;
  id v12;

  v5 = (uint64_t (**)(id, TRASettingsOrientation *, id *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRASettings.m"), 786, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settingsValidationBlock"));

  }
  orientationSettings = self->_orientationSettings;
  v12 = 0;
  v7 = v5[2](v5, orientationSettings, &v12);
  v8 = v12;
  self->_orientationSettingsValidated = v7;
  v9 = (NSString *)objc_msgSend(v8, "copy");
  orientationSettingsValidatedReason = self->_orientationSettingsValidatedReason;
  self->_orientationSettingsValidatedReason = v9;

}

- (TRASettingsOrientation)orientationSettings
{
  return self->_orientationSettings;
}

- (void)setOrientationSettingsValidated:(BOOL)a3
{
  self->_orientationSettingsValidated = a3;
}

- (void)setOrientationSettingsValidatedReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationSettingsValidatedReason, 0);
  objc_storeStrong((id *)&self->_orientationSettings, 0);
}

@end
