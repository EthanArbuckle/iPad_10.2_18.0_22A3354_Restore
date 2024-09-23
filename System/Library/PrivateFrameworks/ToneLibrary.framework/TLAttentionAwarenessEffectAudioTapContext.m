@implementation TLAttentionAwarenessEffectAudioTapContext

- (TLAttentionAwarenessEffectAudioTapContext)init
{
  TLAttentionAwarenessEffectAudioTapContext *v2;
  uint64_t v3;
  NSUUID *identifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TLAttentionAwarenessEffectAudioTapContext;
  v2 = -[TLAttentionAwarenessEffectAudioTapContext init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

  }
  return v2;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  TLAttentionAwarenessEffectAudioTapContext *v4;
  char v5;

  v4 = (TLAttentionAwarenessEffectAudioTapContext *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[NSUUID isEqual:](self->_identifier, "isEqual:", v4->_identifier);
    else
      v5 = 0;
  }

  return v5;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("; identifier = %@"), v7);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (TLAttentionAwarenessEffectCoordinator)effectCoordinator
{
  return self->_effectCoordinator;
}

- (void)setEffectCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_effectCoordinator, a3);
}

- (TLAttentionAwarenessEffectProcessor)effectProcessor
{
  return self->_effectProcessor;
}

- (void)setEffectProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_effectProcessor, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_effectProcessor, 0);
  objc_storeStrong((id *)&self->_effectCoordinator, 0);
}

@end
