@implementation VFXStateTransition

- (VFXStateTransition)initWithSource:(id)a3 andTarget:(id)a4
{
  VFXStateTransition *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VFXStateTransition;
  v6 = -[VFXStateTransition init](&v8, sel_init);
  if (v6)
  {
    v6->_sourceState = (VFXState *)a3;
    v6->_targetState = (VFXState *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXStateTransition;
  -[VFXStateTransition dealloc](&v3, sel_dealloc);
}

- (VFXStateTransition)initWithCoder:(id)a3
{
  VFXStateTransition *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXStateTransition;
  v4 = -[VFXStateTransition init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_sourceState = (VFXState *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("sourceState"));
    v7 = objc_opt_class();
    v4->_targetState = (VFXState *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, (uint64_t)CFSTR("targetState"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_sourceState, (uint64_t)CFSTR("sourceState"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_targetState, (uint64_t)CFSTR("targetState"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VFXState)sourceState
{
  return self->_sourceState;
}

- (VFXState)targetState
{
  return self->_targetState;
}

@end
