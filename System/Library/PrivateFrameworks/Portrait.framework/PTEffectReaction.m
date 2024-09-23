@implementation PTEffectReaction

- (id)emoji
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t *p_effectType;
  unint64_t effectType;
  id v8;
  NSObject *v9;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  effectType = self->_effectType;
  p_effectType = (uint64_t *)&self->_effectType;
  v5 = effectType;
  if (effectType >= 8)
  {
    _PTLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PTEffectReaction emoji].cold.1(p_effectType, v9);

    v8 = 0;
  }
  else
  {
    objc_msgSend(v3, "appendString:", off_1E822A608[v5]);
    v8 = v4;
  }

  return v8;
}

- (int64_t)triggerID
{
  return self->_triggerID;
}

- (void)setTriggerID:(int64_t)a3
{
  self->_triggerID = a3;
}

- (unint64_t)effectType
{
  return self->_effectType;
}

- (void)setEffectType:(unint64_t)a3
{
  self->_effectType = a3;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unint64_t)a3
{
  self->_orientation = a3;
}

- (double)position
{
  return *(double *)(a1 + 40);
}

- (void)setPosition:(PTEffectReaction *)self
{
  uint64_t v2;

  *(_QWORD *)self->_position = v2;
}

- (BOOL)uiTriggeredReaction
{
  return self->_uiTriggeredReaction;
}

- (void)setUiTriggeredReaction:(BOOL)a3
{
  self->_uiTriggeredReaction = a3;
}

- (void)emoji
{
  uint64_t v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "Invalid type %i", (uint8_t *)v3, 8u);
}

@end
