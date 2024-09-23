@implementation UserVoiceProfile

- (UserVoiceProfile)initWithJson:(id)a3
{
  id v4;
  UserVoiceProfile *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  void *v12;
  float v13;
  void *v14;
  float v15;
  void *v16;
  float v17;
  void *v18;
  float v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UserVoiceProfile;
  v5 = -[UserVoiceProfile init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("mean"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("std"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v5->_pitch_mean = v9;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v5->_pitch_std = v11;

    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v5->_energy_mean = v13;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v5->_energy_std = v15;

    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    v5->_duration_mean = v17;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    v5->_duration_std = v19;

  }
  return v5;
}

- (UserVoiceProfile)init
{
  UserVoiceProfile *v2;
  UserVoiceProfile *v3;
  UserVoiceProfile *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UserVoiceProfile;
  v2 = -[UserVoiceProfile init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (float)pitch_mean
{
  return self->_pitch_mean;
}

- (void)setPitch_mean:(float)a3
{
  self->_pitch_mean = a3;
}

- (float)pitch_std
{
  return self->_pitch_std;
}

- (void)setPitch_std:(float)a3
{
  self->_pitch_std = a3;
}

- (float)energy_mean
{
  return self->_energy_mean;
}

- (void)setEnergy_mean:(float)a3
{
  self->_energy_mean = a3;
}

- (float)energy_std
{
  return self->_energy_std;
}

- (void)setEnergy_std:(float)a3
{
  self->_energy_std = a3;
}

- (float)duration_mean
{
  return self->_duration_mean;
}

- (void)setDuration_mean:(float)a3
{
  self->_duration_mean = a3;
}

- (float)duration_std
{
  return self->_duration_std;
}

- (void)setDuration_std:(float)a3
{
  self->_duration_std = a3;
}

@end
