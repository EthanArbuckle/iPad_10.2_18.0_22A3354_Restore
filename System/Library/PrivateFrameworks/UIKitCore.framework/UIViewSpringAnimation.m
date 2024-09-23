@implementation UIViewSpringAnimation

- (UIVectorOperatable)velocity
{
  return self->_velocity;
}

- (id)stepWithDelta:(double)a3
{
  UIVectorOperatable *v4;
  UIVectorOperatable *targetValue;
  UIVectorOperatable *v7;
  $DC9C1BC1D4784B450FFF687D7753DC22 *p_parameters;
  UIVectorOperatable *zero;
  UIVectorOperatable *v10;
  UIVectorOperatable *intermediateVelocity;
  $F3E519E23480E6D1ED16AB4CFE840436 responseState;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  $F3E519E23480E6D1ED16AB4CFE840436 v16;
  double v17;
  double v18;
  double v19;
  UIVectorOperatable *current;
  UIVectorOperatable *velocity;
  UIVectorOperatable *intermediate;
  UIVectorOperatable *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  $F3E519E23480E6D1ED16AB4CFE840436 v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[3];
  $F3E519E23480E6D1ED16AB4CFE840436 dampingRatioState;
  $F3E519E23480E6D1ED16AB4CFE840436 v38;
  __int128 v39;

  if (a3 == 0.0)
  {
    v4 = self->_current;
    return v4;
  }
  targetValue = self->_targetValue;
  v7 = targetValue;
  p_parameters = &self->_parameters;
  if (self->_parameters.targetSmoothingDisabled)
  {
    objc_storeStrong((id *)&self->_intermediate, targetValue);
    zero = self->_zero;
  }
  else
  {
    zero = self->_intermediateVelocity;
    if (zero != self->_zero)
      goto LABEL_7;
  }
  v10 = (UIVectorOperatable *)-[UIVectorOperatable copy](zero, "copy");
  intermediateVelocity = self->_intermediateVelocity;
  self->_intermediateVelocity = v10;

LABEL_7:
  responseState = self->_state.responseState;
  v36[0] = self->_state.dampingRatioState;
  v36[1] = responseState;
  v36[2] = *(_OWORD *)&self->_state.tension;
  v13 = *(_OWORD *)&self->_parameters.targetParameters.friction;
  v33 = *(_OWORD *)&self->_parameters.targetParameters.targetValue;
  v34 = v13;
  v35 = *(_QWORD *)&self->_parameters.dampingRatioSmoothingDisabled;
  v14 = *(_OWORD *)&self->_parameters.dampingRatioParameters.friction;
  v29 = *(_OWORD *)&p_parameters->dampingRatioParameters.targetValue;
  v30 = v14;
  v15 = *(_OWORD *)&self->_parameters.responseParameters.friction;
  v31 = *(_OWORD *)&self->_parameters.responseParameters.targetValue;
  v32 = v15;
  +[UIFloatCompoundSpringIntegrator advanceParametersWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "advanceParametersWithState:springParameters:deltaTime:", v36, &v29, a3);
  v16 = v38;
  self->_state.dampingRatioState = dampingRatioState;
  self->_state.responseState = v16;
  *(_OWORD *)&self->_state.tension = v39;
  if (!self->_parameters.dampingRatioSmoothingDisabled || !self->_parameters.responseSmoothingDisabled)
  {
    v17 = 6.28318531 / self->_state.responseState.value * (6.28318531 / self->_state.responseState.value);
    v18 = sqrt(v17);
    v19 = self->_state.dampingRatioState.value * (v18 + v18);
    self->_state.tension = v17;
    self->_state.friction = v19;
  }
  current = self->_current;
  velocity = self->_velocity;
  intermediate = self->_intermediate;
  v23 = self->_intermediateVelocity;
  v24 = *(_OWORD *)&self->_parameters.targetParameters.friction;
  v33 = *(_OWORD *)&self->_parameters.targetParameters.targetValue;
  v34 = v24;
  v35 = *(_QWORD *)&self->_parameters.dampingRatioSmoothingDisabled;
  v25 = *(_OWORD *)&self->_parameters.dampingRatioParameters.friction;
  v29 = *(_OWORD *)&p_parameters->dampingRatioParameters.targetValue;
  v30 = v25;
  v26 = *(_OWORD *)&self->_parameters.responseParameters.friction;
  v31 = *(_OWORD *)&self->_parameters.responseParameters.targetValue;
  v32 = v26;
  v27 = self->_state.responseState;
  dampingRatioState = self->_state.dampingRatioState;
  v38 = v27;
  v39 = *(_OWORD *)&self->_state.tension;
  -[UIVectorOperatable integrateWithVelocity:target:intermediateTarget:intermediateTargetVelocity:parameters:state:delta:](current, "integrateWithVelocity:target:intermediateTarget:intermediateTargetVelocity:parameters:state:delta:", velocity, v7, intermediate, v23, &v29, &dampingRatioState, a3);
  v4 = self->_current;

  return v4;
}

- (BOOL)isStable
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  if ((-[UIVectorOperatable isUndefined](self->_current, "isUndefined") & 1) != 0)
    return 1;
  if ((-[UIVectorOperatable isUndefined](self->_velocity, "isUndefined") & 1) != 0)
    return 1;
  -[UIVectorOperatable reinitWithVector:](self->_distance, "reinitWithVector:", self->_current);
  v3 = (id)-[UIVectorOperatable multiplyByScalar:](self->_distance, "multiplyByScalar:", -1.0);
  v4 = (id)-[UIVectorOperatable addVector:](self->_distance, "addVector:", self->_targetValue);
  v5 = (id)-[UIVectorOperatable multiplyByVector:](self->_distance, "multiplyByVector:", self->_distance);
  -[UIVectorOperatable reinitWithVector:](self->_scaledVelocity, "reinitWithVector:", self->_velocity);
  v6 = (id)-[UIVectorOperatable multiplyByScalar:](self->_scaledVelocity, "multiplyByScalar:", self->_velocityScalingFactor);
  v7 = (id)-[UIVectorOperatable multiplyByVector:](self->_scaledVelocity, "multiplyByVector:", self->_scaledVelocity);
  v8 = (id)-[UIVectorOperatable addVector:](self->_distance, "addVector:", self->_scaledVelocity);
  if ((-[UIVectorOperatable isUndefined](self->_distance, "isUndefined") & 1) != 0)
    return 1;
  else
    return -[UIVectorOperatable isApproximatelyEqualTo:withinEpsilon:](self->_distance, "isApproximatelyEqualTo:withinEpsilon:", self->_zero, self->_epsilon);
}

- (UIVectorOperatable)targetValue
{
  return self->_targetValue;
}

- (void)updateWithDescription:(id)a3 initial:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  double v25;
  char v26;
  double v27;
  char v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  char v35;
  double v36;
  char v37;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "parameters");
    v9 = !v4;
    if (v37 || (v8 = 0.0, !v4))
    {
      objc_msgSend(v7, "parameters", v8);
      v8 = v36;
    }
  }
  else
  {
    v8 = 0.0;
    v9 = !v4;
  }
  v10 = 6.28318531 / v8 * (6.28318531 / v8);
  v11 = sqrt(v10);
  self->_parameters.dampingRatioParameters.targetValue = 0.0;
  self->_parameters.dampingRatioParameters.tension = v10;
  self->_parameters.dampingRatioParameters.friction = v11 + v11;
  self->_parameters.dampingRatioParameters.displacementFunction = 0;
  self->_parameters.dampingRatioSmoothingDisabled = v8 == 0.0;
  if (v7)
  {
    objc_msgSend(v7, "parameters");
    v12 = 0.0;
    if (((v35 == 0) & ~v9) == 0)
    {
      objc_msgSend(v7, "parameters", 0.0);
      v12 = v34;
    }
  }
  else
  {
    v12 = 0.0;
  }
  v13 = 6.28318531 / v12 * (6.28318531 / v12);
  v14 = sqrt(v13);
  self->_parameters.responseParameters.targetValue = 0.0;
  self->_parameters.responseParameters.tension = v13;
  self->_parameters.responseParameters.friction = v14 + v14;
  self->_parameters.responseParameters.displacementFunction = 0;
  self->_parameters.responseSmoothingDisabled = v12 == 0.0;
  if (v7)
  {
    objc_msgSend(v7, "parameters");
    v15 = v33;
  }
  else
  {
    v15 = 0.0;
  }
  v16 = 6.28318531 / v15 * (6.28318531 / v15);
  v17 = sqrt(v16);
  self->_parameters.targetParameters.targetValue = 0.0;
  self->_parameters.targetParameters.tension = v16;
  self->_parameters.targetParameters.friction = v17 + v17;
  self->_parameters.targetParameters.displacementFunction = 0;
  self->_parameters.targetSmoothingDisabled = v15 == 0.0;
  if (objc_msgSend(v7, "usesDampingRatioAndResponse"))
  {
    if (v7)
    {
      objc_msgSend(v7, "parameters");
      v18 = v32;
      objc_msgSend(v7, "parameters");
      v19 = v31;
    }
    else
    {
      v19 = 0.0;
      v18 = 0.0;
    }
    v22 = 6.28318531 / v19 * (6.28318531 / v19);
    v23 = sqrt(v22);
    self->_state.tension = v22;
    self->_state.friction = v18 * (v23 + v23);
    if (v7)
    {
      objc_msgSend(v7, "parameters");
      self->_parameters.dampingRatioParameters.targetValue = v30;
      objc_msgSend(v7, "parameters");
      self->_parameters.responseParameters.targetValue = v29;
      objc_msgSend(v7, "parameters");
      if (v28)
      {
        objc_msgSend(v7, "parameters");
        self->_state.dampingRatioState.value = v27;
      }
      objc_msgSend(v7, "parameters");
      if (v26)
      {
        objc_msgSend(v7, "parameters");
        self->_state.responseState.value = v25;
      }
    }
    else
    {
      self->_parameters.dampingRatioParameters.targetValue = 0.0;
      self->_parameters.responseParameters.targetValue = 0.0;
    }
  }
  else
  {
    objc_msgSend(v7, "tension");
    self->_state.tension = v20;
    objc_msgSend(v7, "friction");
    self->_state.friction = v21;
  }
  if (self->_parameters.dampingRatioSmoothingDisabled)
  {
    self->_state.dampingRatioState.value = self->_parameters.dampingRatioParameters.targetValue;
    self->_state.dampingRatioState.velocity = 0.0;
  }
  if (self->_parameters.responseSmoothingDisabled)
  {
    self->_state.responseState.value = self->_parameters.responseParameters.targetValue;
    self->_state.responseState.velocity = 0.0;
  }
  v24 = self->_state.friction / self->_state.tension;
  self->_velocityScalingFactor = v24;

}

- (UIViewSpringAnimation)initWithDescription:(id)a3 current:(id)a4 targetValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIViewSpringAnimation *v11;
  UIViewSpringAnimation *v12;
  void *v13;
  uint64_t v14;
  UIVectorOperatable *zero;
  uint64_t v16;
  UIVectorOperatable *epsilon;
  void *v18;
  uint64_t v19;
  UIVectorOperatable *v20;
  uint64_t v21;
  UIVectorOperatable *velocity;
  uint64_t v23;
  UIVectorOperatable *distance;
  uint64_t v25;
  UIVectorOperatable *scaledVelocity;
  uint64_t v27;
  UIVectorOperatable *intermediateVelocity;
  uint64_t v29;
  UIVectorOperatable *intermediate;
  objc_super v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)UIViewSpringAnimation;
  v11 = -[UIViewSpringAnimation init](&v32, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_targetValue, a5);
    objc_storeStrong((id *)&v12->_current, a4);
    objc_msgSend((id)objc_opt_class(), "zeroCompatibleWithVector:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    zero = v12->_zero;
    v12->_zero = (UIVectorOperatable *)v14;

    objc_msgSend((id)objc_opt_class(), "epsilonCompatibleWithVector:", v10);
    v16 = objc_claimAutoreleasedReturnValue();
    epsilon = v12->_epsilon;
    v12->_epsilon = (UIVectorOperatable *)v16;

    v18 = (void *)-[UIVectorOperatable copy](v12->_epsilon, "copy");
    objc_msgSend(v18, "multiplyByVector:", v12->_epsilon);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v12->_epsilon;
    v12->_epsilon = (UIVectorOperatable *)v19;

    v21 = -[UIVectorOperatable copy](v12->_zero, "copy");
    velocity = v12->_velocity;
    v12->_velocity = (UIVectorOperatable *)v21;

    v23 = -[UIVectorOperatable copy](v12->_zero, "copy");
    distance = v12->_distance;
    v12->_distance = (UIVectorOperatable *)v23;

    v25 = -[UIVectorOperatable copy](v12->_zero, "copy");
    scaledVelocity = v12->_scaledVelocity;
    v12->_scaledVelocity = (UIVectorOperatable *)v25;

    v27 = -[UIVectorOperatable copy](v12->_zero, "copy");
    intermediateVelocity = v12->_intermediateVelocity;
    v12->_intermediateVelocity = (UIVectorOperatable *)v27;

    v29 = -[UIVectorOperatable copy](v12->_current, "copy");
    intermediate = v12->_intermediate;
    v12->_intermediate = (UIVectorOperatable *)v29;

    -[UIViewSpringAnimation updateWithDescription:initial:](v12, "updateWithDescription:initial:", v8, 1);
    v12->_parametersInitialized = 1;
  }

  return v12;
}

- (void)updateWithDescription:(id)a3
{
  -[UIViewSpringAnimation updateWithDescription:initial:](self, "updateWithDescription:initial:", a3, 0);
}

- (void)setTargetValue:(id)a3
{
  objc_storeStrong((id *)&self->_targetValue, a3);
}

- (UIVectorOperatable)intermediate
{
  return self->_intermediate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intermediateVelocity, 0);
  objc_storeStrong((id *)&self->_intermediate, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_targetValue, 0);
  objc_storeStrong((id *)&self->_epsilon, 0);
  objc_storeStrong((id *)&self->_scaledVelocity, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_zero, 0);
  objc_storeStrong((id *)&self->_velocity, 0);
  objc_storeStrong((id *)&self->_current, 0);
}

- (UIViewSpringAnimation)initWithCurrent:(id)a3 targetValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  UIViewSpringAnimation *v9;

  v6 = a4;
  v7 = a3;
  +[UIViewSpringAnimationDescription descriptionWithTension:friction:](UIViewSpringAnimationDescription, "descriptionWithTension:friction:", 500.0, 20.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIViewSpringAnimation initWithDescription:current:targetValue:](self, "initWithDescription:current:targetValue:", v8, v7, v6);

  return v9;
}

- (void)setVelocity:(id)a3
{
  objc_storeStrong((id *)&self->_velocity, a3);
}

- (UIVectorOperatable)value
{
  return self->_current;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void)setIntermediate:(id)a3
{
  objc_storeStrong((id *)&self->_intermediate, a3);
}

- (UIVectorOperatable)intermediateVelocity
{
  return self->_intermediateVelocity;
}

- (void)setIntermediateVelocity:(id)a3
{
  objc_storeStrong((id *)&self->_intermediateVelocity, a3);
}

@end
