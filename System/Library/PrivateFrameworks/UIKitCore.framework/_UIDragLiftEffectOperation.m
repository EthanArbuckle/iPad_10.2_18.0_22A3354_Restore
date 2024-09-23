@implementation _UIDragLiftEffectOperation

+ (id)defaultTimingParameters
{
  double v2;
  double v3;
  double v4;

  if (_UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_905, (uint64_t)CFSTR("DragLiftEffectSpringDamping")))v2 = 19.75;
  else
    v2 = *(double *)&qword_1ECD76160;
  if (_UIInternalPreferenceUsesDefault_1((int *)algn_1ECD76168, (uint64_t)CFSTR("DragLiftEffectSpringStiffness")))v3 = 195.0;
  else
    v3 = *(double *)&qword_1ECD76170;
  if (_UIInternalPreferenceUsesDefault_1((int *)algn_1ECD76178, (uint64_t)CFSTR("DragLiftEffectSpringMass")))v4 = 1.0;
  else
    v4 = *(double *)&qword_1ECD76180;
  return -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", v4, v3, v2, 0.0, 0.0);
}

- (_UIDragLiftEffectOperation)initWithLiftAnimationDuration:(double)a3 liftTimingParameters:(id)a4
{
  id v6;
  _UIDragLiftEffectOperation *v7;
  UIViewPropertyAnimator *v8;
  UIViewPropertyAnimator *propertyAnimator;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIDragLiftEffectOperation;
  v7 = -[_UIDragLiftEffectOperation init](&v11, sel_init);
  if (v7)
  {
    v8 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v6, a3);
    propertyAnimator = v7->_propertyAnimator;
    v7->_propertyAnimator = v8;

  }
  return v7;
}

- (UIDragInteractionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (UIDragInteraction)interaction
{
  return self->_interaction;
}

- (void)setInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_interaction, a3);
}

- (UIViewPropertyAnimator)propertyAnimator
{
  return self->_propertyAnimator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
