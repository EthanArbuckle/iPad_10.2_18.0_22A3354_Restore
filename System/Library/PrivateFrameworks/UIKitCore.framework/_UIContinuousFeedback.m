@implementation _UIContinuousFeedback

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return CFSTR("continuous");
}

+ (id)continuousFeedbackForType:(int64_t)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setType:", a3);
  return v4;
}

- (_UIContinuousFeedback)init
{
  _UIContinuousFeedback *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIContinuousFeedback;
  result = -[_UIFeedback init](&v3, sel_init);
  result->_duration = INFINITY;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIContinuousFeedback;
  result = -[_UIFeedback copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 17) = self->_type;
  *((_QWORD *)result + 16) = *(_QWORD *)&self->_duration;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;
  objc_super v7;

  v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIContinuousFeedback;
  v5 = -[_UIFeedback isEqual:](&v7, sel_isEqual_, v4)
    && self->_type == *((_QWORD *)v4 + 17)
    && self->_duration == v4[16];

  return v5;
}

- (_UIContinuousFeedback)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  _UIContinuousFeedback *v5;
  void *v6;
  void *v7;
  double v8;
  _UIContinuousFeedback *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIContinuousFeedback;
  v5 = -[_UIFeedback initWithDictionaryRepresentation:](&v11, sel_initWithDictionaryRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("feedbackType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = (int)objc_msgSend(v6, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v5->_duration = v8;

    v9 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_UIContinuousFeedback;
  -[_UIFeedback dictionaryRepresentation](&v9, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v10[0] = CFSTR("feedbackType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("duration");
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v7);

  return v4;
}

- (id)_playableProtocol
{
  return &unk_1EDF1A2E8;
}

- (unint64_t)_effectiveEventType
{
  if (self->_type)
    return 32610;
  else
    return 0;
}

- (double)_effectiveDuration
{
  return self->_duration;
}

- (void)_playedAtTime:(double)a3 engine:(id)a4
{
  double v5;
  double v6;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIContinuousFeedback;
  -[_UIFeedback _playedAtTime:engine:](&v9, sel__playedAtTime_engine_, a4, a3);
  if (self->_duration < INFINITY)
  {
    -[_UIFeedback _effectiveDelay](self, "_effectiveDelay");
    v6 = v5 + self->_duration;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46___UIContinuousFeedback__playedAtTime_engine___block_invoke;
    v8[3] = &unk_1E16B1B28;
    v8[4] = self;
    v7 = _UIFeedbackPreciseDispatchAfter(0, v8, v6);
  }
}

- (id)_debugDictionary
{
  int64_t v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("feedbackType");
  v3 = -[_UIContinuousFeedback type](self, "type");
  v4 = CFSTR("Unknown");
  if (v3 == 1)
    v4 = CFSTR("Sine");
  v13[0] = v4;
  v12[1] = CFSTR("effectiveEventType");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = v4;
  objc_msgSend(v5, "numberWithUnsignedInteger:", -[_UIContinuousFeedback _effectiveEventType](self, "_effectiveEventType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v12[2] = CFSTR("duration");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[_UIContinuousFeedback duration](self, "duration");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end
