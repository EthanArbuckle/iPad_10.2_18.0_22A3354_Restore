@implementation UIViewSpringAnimationState

- (id)animationForLayer:(id)a3 forKey:(id)a4 forView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10 && (*((_QWORD *)v10 + 13) & 0x4000000) != 0)
  {
    v12 = 0;
  }
  else
  {
    -[UIViewSpringAnimationState _defaultAnimationForKey:](self, "_defaultAnimationForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIViewAnimationState _shouldStartFromCurrentStateForLayer:key:forView:](self, "_shouldStartFromCurrentStateForLayer:key:forView:", v8, v9, v11))
    {
      objc_msgSend(v8, "presentationLayer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "valueForKeyPath:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFromValue:", v14);

    }
    else
    {
      objc_msgSend(v8, "valueForKeyPath:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFromValue:", v13);
    }

    -[UIViewAnimationState configureAnimation:forLayer:forKey:](self, "configureAnimation:forLayer:forKey:", v12, v8, v9);
    -[UIViewAnimationState setAnimationAttributes:skipDelegateAssignment:customCurve:](self, "setAnimationAttributes:skipDelegateAssignment:customCurve:", v12, 0, 0);
  }

  return v12;
}

+ (id)defaultSpringAnimationForKey:(id)a3 mass:(double)a4 stiffness:(double)a5 damping:(double)a6 velocity:(double)a7
{
  return (id)objc_msgSend(a1, "defaultSpringAnimationForKey:mass:stiffness:damping:velocity:allowsOverdamping:", a3, 0, a4, a5, a6, a7);
}

- (void)setupWithDuration:(double)a3 delay:(double)a4 view:(id)a5 options:(unint64_t)a6 factory:(id)a7 parentState:(id)a8 start:(id)a9 completion:(id)a10
{
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIViewSpringAnimationState;
  -[UIViewAnimationState setupWithDuration:delay:view:options:factory:parentState:start:completion:](&v10, sel_setupWithDuration_delay_view_options_factory_parentState_start_completion_, a5, a6 & 0xFFFFFFFFFFF8FFFFLL | 0x30000, a7, a8, a9, a10, a3, a4);
}

- (void)generateSpringPropertiesForDuration:(double)a3 damping:(double)a4 velocity:(double)a5
{
  self->_mass = 1.0;
  self->_velocity = a5;
  parametersOfSpringAnimation(&self->_stiffness, &self->_damping, 0, a3, a4, self->_mass, a5, 0.001);
}

+ (id)defaultSpringAnimationForKey:(id)a3 mass:(double)a4 stiffness:(double)a5 damping:(double)a6 velocity:(double)a7 allowsOverdamping:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  float v14;
  void *v15;
  double v16;

  v8 = a8;
  v13 = a3;
  v14 = UIAnimationDragCoefficient();
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setMass:", a4);
  objc_msgSend(v15, "setStiffness:", a5);
  objc_msgSend(v15, "setDamping:", a6);
  objc_msgSend(v15, "setVelocity:", a7);
  objc_msgSend(v15, "setAllowsOverdamping:", v8);
  if (v14 > 1.0)
  {
    *(float *)&v16 = 1.0 / v14;
    objc_msgSend(v15, "setSpeed:", v16);
  }
  return v15;
}

+ (void)computeDerivedSpringParameters:(double)a3 zeta:(double)a4 mass:(double)a5 velocity:(double)a6 epsilon:(double)a7 stiffness:(double *)a8 damping:(double *)a9 debugging:(id *)a10
{
  parametersOfSpringAnimation(a8, a9, a10, a3, a4, a5, a6, a7);
}

+ (void)computeDerivedSpringParameters:(double)a3 zeta:(double)a4 mass:(double)a5 velocity:(double)a6 epsilon:(double)a7 stiffness:(double *)a8 damping:(double *)a9
{
  objc_msgSend(a1, "computeDerivedSpringParameters:zeta:mass:velocity:epsilon:stiffness:damping:debugging:", a8, a9, 0, a3, a4, a5, a6, a7);
}

- (id)_defaultAnimationForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultSpringAnimationForKey:mass:stiffness:damping:velocity:allowsOverdamping:", v4, self->_allowsOverdamping, self->_mass, self->_stiffness, self->_damping, self->_velocity);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)generateSpringPropertiesForPerceptualDuration:(double)a3 bounce:(double)a4 velocity:(double)a5
{
  double *p_mass;
  double v8;

  p_mass = &self->_mass;
  self->_mass = 1.0;
  self->_velocity = a5;
  self->_allowsOverdamping = 1;
  v8 = 0.0;
  +[UISpringTimingParameters _convertBounce:toDampingRatio:](UISpringTimingParameters, "_convertBounce:toDampingRatio:", &v8, a4);
  +[UISpringTimingParameters _convertDampingRatio:response:toMass:stiffness:damping:](UISpringTimingParameters, "_convertDampingRatio:response:toMass:stiffness:damping:", p_mass, &self->_stiffness, &self->_damping, v8, a3);
}

@end
