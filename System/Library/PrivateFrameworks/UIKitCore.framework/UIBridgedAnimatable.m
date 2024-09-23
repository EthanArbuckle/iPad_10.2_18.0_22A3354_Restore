@implementation UIBridgedAnimatable

- (UIBridgedAnimatable)initWithLayer:(id)a3 key:(id)a4 fromValue:(id)a5 toValue:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  UIBridgedAnimatable *v18;
  UIBridgedAnimatable *v19;
  uint64_t v20;
  UIVectorOperatable *fromValue;
  uint64_t v22;
  UIVectorOperatable *toValue;
  void *v24;
  id completion;
  id v26;
  void *v27;
  uint64_t v28;
  CAPresentationModifier *presentationModifier;
  objc_super v31;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v31.receiver = self;
  v31.super_class = (Class)UIBridgedAnimatable;
  v18 = -[UIBridgedAnimatable init](&v31, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v18->_layer, a3);
    objc_storeStrong((id *)&v19->_key, a4);
    v20 = objc_msgSend(v15, "copy");
    fromValue = v19->_fromValue;
    v19->_fromValue = (UIVectorOperatable *)v20;

    v22 = objc_msgSend(v16, "copy");
    toValue = v19->_toValue;
    v19->_toValue = (UIVectorOperatable *)v22;

    v24 = _Block_copy(v17);
    completion = v19->_completion;
    v19->_completion = v24;

    v26 = objc_alloc(MEMORY[0x1E0CD2808]);
    -[UIVectorOperatable getValue](v19->_fromValue, "getValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "initWithKeyPath:initialValue:additive:", v14, v27, 0);
    presentationModifier = v19->_presentationModifier;
    v19->_presentationModifier = (CAPresentationModifier *)v28;

    v19->_isFinished = 0;
    -[CALayer addPresentationModifier:](v19->_layer, "addPresentationModifier:", v19->_presentationModifier);
  }

  return v19;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_isFinished)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBridgedAnimatable.m"), 57, CFSTR("UIBridgedAnimatable was deallocated before animationDidFinish: (%@)"), self->_key);

  }
  -[CALayer removePresentationModifier:](self->_layer, "removePresentationModifier:", self->_presentationModifier);
  v5.receiver = self;
  v5.super_class = (Class)UIBridgedAnimatable;
  -[UIBridgedAnimatable dealloc](&v5, sel_dealloc);
}

- (void)updateWithProgress:(double)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[UIBridgedAnimatable toValue](self, "toValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v6, "copy");

  -[UIBridgedAnimatable fromValue](self, "fromValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v8, "multiplyByScalar:", -1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v17, "addVector:", v9);

  v11 = (id)objc_msgSend(v17, "multiplyByScalar:", a3);
  -[UIBridgedAnimatable fromValue](self, "fromValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  v14 = (id)objc_msgSend(v17, "addVector:", v13);

  objc_msgSend(v17, "getValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBridgedAnimatable presentationModifier](self, "presentationModifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValue:", v15);

  os_unfair_lock_unlock(p_lock);
}

- (void)animationDidFinish:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  void (**v6)(_QWORD, _QWORD);

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!-[UIBridgedAnimatable isFinished](self, "isFinished"))
  {
    -[UIBridgedAnimatable setIsFinished:](self, "setIsFinished:", 1);
    -[UIBridgedAnimatable completion](self, "completion");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, v3);

    -[UIBridgedAnimatable setCompletion:](self, "setCompletion:", 0);
  }
  os_unfair_lock_unlock(p_lock);
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
  objc_storeStrong((id *)&self->_layer, a3);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (UIVectorOperatable)fromValue
{
  return self->_fromValue;
}

- (void)setFromValue:(id)a3
{
  objc_storeStrong((id *)&self->_fromValue, a3);
}

- (UIVectorOperatable)toValue
{
  return self->_toValue;
}

- (void)setToValue:(id)a3
{
  objc_storeStrong((id *)&self->_toValue, a3);
}

- (CAPresentationModifier)presentationModifier
{
  return self->_presentationModifier;
}

- (void)setPresentationModifier:(id)a3
{
  objc_storeStrong((id *)&self->_presentationModifier, a3);
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_presentationModifier, 0);
  objc_storeStrong((id *)&self->_toValue, 0);
  objc_storeStrong((id *)&self->_fromValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
