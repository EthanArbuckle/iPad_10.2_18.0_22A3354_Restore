@implementation _UITransientHapticFeedback

+ (id)transientHapticFeedbackWithIntensity:(float)a3 sharpness:(float)a4
{
  _UITransientHapticFeedback *v6;

  v6 = objc_alloc_init(_UITransientHapticFeedback);
  v6->_intensity = a3;
  v6->_sharpness = a4;
  return v6;
}

+ (id)type
{
  return CFSTR("transientHaptic");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UITransientHapticFeedback)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  _UITransientHapticFeedback *v5;
  void *v6;
  float v7;
  void *v8;
  float v9;
  _UITransientHapticFeedback *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UITransientHapticFeedback;
  v5 = -[_UIFeedback initWithDictionaryRepresentation:](&v12, sel_initWithDictionaryRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intensity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v5->_intensity = v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sharpness"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v5->_sharpness = v9;

    v10 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)_UITransientHapticFeedback;
  -[_UIFeedback dictionaryRepresentation](&v11, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v12[0] = CFSTR("intensity");
  *(float *)&v5 = self->_intensity;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("sharpness");
  v13[0] = v6;
  *(float *)&v7 = self->_sharpness;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v9);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  int v5;
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UITransientHapticFeedback;
  v4 = -[_UIFeedback copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[_UITransientHapticFeedback intensity](self, "intensity");
  v4[33] = v5;
  -[_UITransientHapticFeedback sharpness](self, "sharpness");
  v4[34] = v6;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  BOOL v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UITransientHapticFeedback;
  if (-[_UIFeedback isEqual:](&v13, sel_isEqual_, v4)
    && (objc_msgSend(v4, "intensity"), v6 = v5, -[_UITransientHapticFeedback intensity](self, "intensity"), v6 == v7))
  {
    objc_msgSend(v4, "sharpness");
    v9 = v8;
    -[_UITransientHapticFeedback sharpness](self, "sharpness");
    v11 = v9 == v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_playableProtocol
{
  return &unk_1EDF1A0F0;
}

- (unint64_t)_effectivePlayableFeedbackTypes
{
  return 2;
}

- (BOOL)canReuseCoreHapticsPlayer
{
  return 1;
}

- (BOOL)isHighPriority
{
  return self->_highPriority;
}

- (float)intensity
{
  return self->_intensity;
}

- (float)sharpness
{
  return self->_sharpness;
}

@end
