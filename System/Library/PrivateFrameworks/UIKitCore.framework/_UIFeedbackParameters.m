@implementation _UIFeedbackParameters

- (float)volume
{
  return self->_volume;
}

- (void)_updateParameterWithKey:(id)a3
{
  _UIFeedback **p_feedback;
  id v5;
  void *v6;
  id WeakRetained;

  p_feedback = &self->_feedback;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_feedback);
  objc_msgSend(WeakRetained, "_player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_updateValueForParameters:withKey:", self, v5);

}

- (void)setVolume:(float)a3
{
  if (self->_volume != a3)
  {
    self->_volume = a3;
    -[_UIFeedbackParameters _updateParameterWithKey:](self, "_updateParameterWithKey:", CFSTR("volume"));
  }
}

- (_UIFeedbackParameters)initWithFeedback:(id)a3
{
  id v3;
  _UIFeedbackParameters *v4;
  void *v5;
  _UIFeedbackParameters *v6;
  _QWORD v8[4];
  _UIFeedbackParameters *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIFeedbackParameters;
  v3 = a3;
  v4 = -[_UIFeedbackParameters init](&v10, sel_init);
  objc_storeWeak((id *)&v4->_feedback, v3);

  objc_msgSend((id)objc_opt_class(), "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42___UIFeedbackParameters_initWithFeedback___block_invoke;
  v8[3] = &unk_1E16C55B8;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

+ (id)parameters
{
  if (_MergedGlobals_7_3 != -1)
    dispatch_once(&_MergedGlobals_7_3, &__block_literal_global_190);
  return (id)qword_1ECD7B128;
}

- (_UIFeedbackParameters)initWithDictionaryRepresentation:(id)a3 feedback:(id)a4
{
  id v6;
  _UIFeedbackParameters *v7;
  void *v8;
  _UIFeedbackParameters *v9;
  id v10;
  _UIFeedbackParameters *v11;
  _UIFeedbackParameters *v12;
  _QWORD v14[4];
  id v15;
  _UIFeedbackParameters *v16;

  v6 = a3;
  v7 = -[_UIFeedbackParameters initWithFeedback:](self, "initWithFeedback:", a4);
  objc_msgSend((id)objc_opt_class(), "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67___UIFeedbackParameters_initWithDictionaryRepresentation_feedback___block_invoke;
  v14[3] = &unk_1E16C55E0;
  v15 = v6;
  v9 = v7;
  v16 = v9;
  v10 = v6;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _UIFeedbackParameters *v11;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend((id)objc_opt_class(), "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38___UIFeedbackParameters_copyWithZone___block_invoke;
  v9[3] = &unk_1E16C55E0;
  v6 = v4;
  v10 = v6;
  v11 = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = v6;
  return v7;
}

- (void)setFeedback:(id)a3
{
  objc_storeWeak((id *)&self->_feedback, a3);
}

- (void)setTransposition:(float)a3
{
  if (self->_transposition != a3)
  {
    self->_transposition = a3;
    -[_UIFeedbackParameters _updateParameterWithKey:](self, "_updateParameterWithKey:", CFSTR("transposition"));
  }
}

- (void)setReleaseTime:(float)a3
{
  if (self->_releaseTime != a3)
  {
    self->_releaseTime = a3;
    -[_UIFeedbackParameters _updateParameterWithKey:](self, "_updateParameterWithKey:", CFSTR("releaseTime"));
  }
}

- (void)setRate:(float)a3
{
  if (self->_rate != a3)
  {
    self->_rate = a3;
    -[_UIFeedbackParameters _updateParameterWithKey:](self, "_updateParameterWithKey:", CFSTR("rate"));
  }
}

- (void)setDecayTime:(float)a3
{
  if (self->_decayTime != a3)
  {
    self->_decayTime = a3;
    -[_UIFeedbackParameters _updateParameterWithKey:](self, "_updateParameterWithKey:", CFSTR("decayTime"));
  }
}

- (void)setAttackTime:(float)a3
{
  if (self->_attackTime != a3)
  {
    self->_attackTime = a3;
    -[_UIFeedbackParameters _updateParameterWithKey:](self, "_updateParameterWithKey:", CFSTR("attackTime"));
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentParameters);
  objc_destroyWeak((id *)&self->_feedback);
}

- (float)transposition
{
  return self->_transposition;
}

- (float)releaseTime
{
  return self->_releaseTime;
}

- (float)rate
{
  return self->_rate;
}

- (float)decayTime
{
  return self->_decayTime;
}

- (float)attackTime
{
  return self->_attackTime;
}

- (BOOL)_isAudio
{
  _UIFeedbackParameters *v2;
  id WeakRetained;
  _UIFeedbackParameters *v4;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_feedback);
  objc_msgSend(WeakRetained, "audioParameters");
  v4 = (_UIFeedbackParameters *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 == v2;

  return (char)v2;
}

- (float)_effectiveValueForParameterWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  int v11;
  _UIFeedbackParameters **p_parentParameters;
  id WeakRetained;
  id v14;
  float v15;
  float v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  float v21;
  float v22;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIFeedbackParameters valueForKey:](self, "valueForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("additive"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  p_parentParameters = &self->_parentParameters;
  WeakRetained = objc_loadWeakRetained((id *)p_parentParameters);

  if (WeakRetained)
  {
    v14 = objc_loadWeakRetained((id *)p_parentParameters);
    objc_msgSend(v14, "_effectiveValueForParameterWithKey:", v4);
    v16 = v15;

    if (v11)
      v9 = v9 + v16;
    else
      v9 = v9 * v16;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("maxValue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v19 = v18;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("minValue"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  v22 = v21;

  if (v22 >= v9)
    v9 = v22;

  if (v19 <= v9)
    v9 = v19;

  return v9;
}

- (float)_effectiveVolume
{
  float result;

  -[_UIFeedbackParameters _effectiveValueForParameterWithKey:](self, "_effectiveValueForParameterWithKey:", CFSTR("volume"));
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _UIFeedbackParameters *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 1;
    objc_msgSend((id)objc_opt_class(), "parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __33___UIFeedbackParameters_isEqual___block_invoke;
    v11[3] = &unk_1E16C5608;
    v9 = v7;
    v12 = v9;
    v13 = self;
    v14 = &v15;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);

    v6 = *((_BYTE *)v16 + 24) != 0;
    _Block_object_dispose(&v15, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _UIFeedbackParameters *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49___UIFeedbackParameters_dictionaryRepresentation__block_invoke;
  v8[3] = &unk_1E16C55E0;
  v5 = v3;
  v9 = v5;
  v10 = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  v6 = v5;
  return v6;
}

- (_UIFeedback)feedback
{
  return (_UIFeedback *)objc_loadWeakRetained((id *)&self->_feedback);
}

- (_UIFeedbackParameters)parentParameters
{
  return (_UIFeedbackParameters *)objc_loadWeakRetained((id *)&self->_parentParameters);
}

- (void)setParentParameters:(id)a3
{
  objc_storeWeak((id *)&self->_parentParameters, a3);
}

@end
