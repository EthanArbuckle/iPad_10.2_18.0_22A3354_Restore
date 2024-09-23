@implementation UIViewAnimationComposer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetVelocity, 0);
  objc_storeStrong((id *)&self->_previousTarget, 0);
  objc_storeStrong(&self->_previousInteractiveUpdateValue, 0);
}

- (id)composeAnimation:(id)a3 withNewAnimationDescription:(id)a4 interactive:(BOOL)a5 currentValue:(id)a6 targetValue:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  CFTimeInterval v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UIVectorOperatable *v27;
  UIVectorOperatable *targetVelocity;
  UIVectorOperatable *v29;
  id previousInteractiveUpdateValue;
  UIVectorOperatable *v31;
  id v32;
  UIVectorOperatable *v33;
  UIVectorOperatable *v34;
  UIVectorOperatable *v35;
  UIVectorOperatable *previousTarget;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  UIVectorOperatable *v52;
  UIVectorOperatable *v53;
  id v54;
  UIVectorOperatable *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  self->_interactive = v9;
  if (!v14 || !v15 || (objc_msgSend(v14, "isCompatibleWith:", v15) & 1) != 0)
  {
    if (v9)
    {
      v17 = CACurrentMediaTime();
      v18 = v17 - self->_previousInteractiveUpdateTimestamp;
      +[UIViewInProcessAnimationManager sharedManager](UIViewInProcessAnimationManager, "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "refreshInterval");
      v21 = v20 * 0.9;

      if (v18 > v21)
      {
        if (self->_previousInteractiveUpdateTimestamp != 0.0)
        {
          if (self->_targetVelocity)
          {
            v64 = (void *)objc_msgSend(v16, "copy");
            v66 = (void *)-[UIVectorOperatable copy](self->_previousTarget, "copy");
            objc_msgSend(v66, "multiplyByScalar:", -1.0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "addVector:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "multiplyByScalar:", 1.0 / v18);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            -[UIVectorOperatable multiplyByScalar:](self->_targetVelocity, "multiplyByScalar:", 0.25);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "multiplyByScalar:", 0.75);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addVector:", v26);
            v27 = (UIVectorOperatable *)objc_claimAutoreleasedReturnValue();
            targetVelocity = self->_targetVelocity;
            self->_targetVelocity = v27;

          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "zeroCompatibleWithVector:", v16);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (UIVectorOperatable *)objc_msgSend(v24, "copy");
            v25 = self->_targetVelocity;
            self->_targetVelocity = v33;
          }

        }
        objc_storeStrong(&self->_previousInteractiveUpdateValue, a6);
        self->_previousInteractiveUpdateTimestamp = v17;
      }
    }
    v34 = self->_previousTarget;
    if (v16)
    {
      v35 = (UIVectorOperatable *)objc_msgSend(v16, "copy");
      previousTarget = self->_previousTarget;
      self->_previousTarget = v35;

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v32, "setTargetValue:", v16);
        v37 = v32;
LABEL_51:

        goto LABEL_52;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = v13;
        objc_msgSend(v38, "velocity");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          objc_msgSend(v38, "velocity");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setVelocity:", v40);

        }
        v41 = v32;

        goto LABEL_51;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = v13;
        v43 = v42;
        if (!v9)
        {
          if (v42)
          {
            objc_msgSend(v42, "parameters");
            if (v72 > 0.0)
            {
              objc_msgSend(v32, "intermediate", v72);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "parameters");
              v45 = -[UIViewAnimationComposer projectValue:decelerationFactor:](self, "projectValue:decelerationFactor:", v44, v71);

            }
          }
          v55 = self->_targetVelocity;
          self->_targetVelocity = 0;

          self->_previousInteractiveUpdateTimestamp = 0.0;
        }
        if (v43)
        {
          objc_msgSend(v43, "parameters");
          v56 = v70;
          if (v70 > 0.0 && v34)
          {
            objc_msgSend(v43, "parameters", v70);
            objc_msgSend(v43, "parameters");
            objc_msgSend(v32, "velocity");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = (void *)objc_msgSend(v16, "copy");
            v67 = (void *)-[UIVectorOperatable copy](v34, "copy");
            objc_msgSend(v67, "multiplyByScalar:", -1.0);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "addVector:", v63);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "parameters");
            objc_msgSend(v58, "multiplyByScalar:", 6.28318531 / v69 * (6.28318531 / v69) * v68);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = (id)objc_msgSend(v57, "addVector:", v59);

          }
        }
        else
        {
          v56 = 0.0;
        }
        objc_msgSend(v32, "updateWithDescription:", v43, v56);
        objc_msgSend(v32, "setTargetValue:", v16);
        v61 = v32;

        goto LABEL_51;
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = v12;
      if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v46, "setTargetValue:", v16);
        v32 = v46;
LABEL_41:

LABEL_52:
        goto LABEL_53;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = v13;
        objc_msgSend(v47, "velocity");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48)
        {
          objc_msgSend(v47, "velocity");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setVelocity:", v49);

        }
        objc_msgSend(v47, "targetVelocity");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
        {
          objc_msgSend(v47, "targetVelocity");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = (UIVectorOperatable *)objc_msgSend(v51, "copy");
          v53 = self->_targetVelocity;
          self->_targetVelocity = v52;

        }
        v54 = v46;
        goto LABEL_40;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v46, "velocity");
        v47 = (id)objc_claimAutoreleasedReturnValue();
        -[UIViewAnimationComposer createAnimationFromDescription:currentValue:velocity:targetValue:](self, "createAnimationFromDescription:currentValue:velocity:targetValue:", v13, v14, v47, v16);
        v54 = (id)objc_claimAutoreleasedReturnValue();
LABEL_40:
        v32 = v54;

        goto LABEL_41;
      }

    }
    -[UIViewAnimationComposer createAnimationFromDescription:currentValue:velocity:targetValue:](self, "createAnimationFromDescription:currentValue:velocity:targetValue:", v13, v14, 0, v16);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  v29 = self->_targetVelocity;
  self->_targetVelocity = 0;

  previousInteractiveUpdateValue = self->_previousInteractiveUpdateValue;
  self->_previousInteractiveUpdateValue = 0;

  self->_previousInteractiveUpdateTimestamp = 0.0;
  v31 = self->_previousTarget;
  self->_previousTarget = 0;

  -[UIViewAnimationComposer createAnimationFromDescription:currentValue:velocity:targetValue:](self, "createAnimationFromDescription:currentValue:velocity:targetValue:", v13, v16, 0, v16);
  v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:

  return v32;
}

- (id)createAnimationFromDescription:(id)a3 currentValue:(id)a4 velocity:(id)a5 targetValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  UIViewSpringAnimation *v15;
  UIViewInstaneouslyStableAnimation *v16;
  double v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  UIVectorOperatable *v30;
  UIVectorOperatable *targetVelocity;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v10;
    v15 = -[UIViewSpringAnimation initWithDescription:current:targetValue:]([UIViewSpringAnimation alloc], "initWithDescription:current:targetValue:", v14, v11, v13);
    v16 = (UIViewInstaneouslyStableAnimation *)v15;
    if (v12)
      -[UIViewSpringAnimation setVelocity:](v15, "setVelocity:", v12);
    if (v14)
    {
      objc_msgSend(v14, "parameters");
      v17 = v39;
      if (v39 > 0.0)
      {
        -[UIViewInstaneouslyStableAnimation intermediate](v16, "intermediate", v39);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "parameters");
        v19 = -[UIViewAnimationComposer projectValue:decelerationFactor:](self, "projectValue:decelerationFactor:", v18, v38);

      }
      objc_msgSend(v14, "parameters", v17);
      if (v37 > 0.0)
      {
        objc_msgSend(v14, "parameters", v37);
        objc_msgSend(v14, "parameters");
        -[UIViewInstaneouslyStableAnimation velocity](v16, "velocity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v13, "copy");
        v34 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(v34, "multiplyByScalar:", -1.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addVector:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "parameters");
        objc_msgSend(v22, "multiplyByScalar:", 6.28318531 / v36 * (6.28318531 / v36) * v35);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v20, "addVector:", v23);

      }
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v10;
      objc_msgSend(v25, "velocity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v25, "velocity");
        v27 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v27;
      }
      objc_msgSend(v25, "targetVelocity");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v25, "targetVelocity");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (UIVectorOperatable *)objc_msgSend(v29, "copy");
        targetVelocity = self->_targetVelocity;
        self->_targetVelocity = v30;

      }
    }
    v16 = -[UIViewInstaneouslyStableAnimation initWithTargetValue:velocity:]([UIViewInstaneouslyStableAnimation alloc], "initWithTargetValue:velocity:", v13, v12);
  }

  return v16;
}

- (UIViewAnimationComposer)init
{
  UIViewAnimationComposer *v2;
  UIViewAnimationComposer *v3;
  UIVectorOperatable *targetVelocity;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIViewAnimationComposer;
  v2 = -[UIViewAnimationComposer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_previousInteractiveUpdateTimestamp = 0.0;
    targetVelocity = v2->_targetVelocity;
    v2->_targetVelocity = 0;

  }
  return v3;
}

- (id)projectValue:(id)a3 decelerationFactor:(double)a4
{
  id v6;
  UIVectorOperatable *targetVelocity;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  targetVelocity = self->_targetVelocity;
  if (targetVelocity)
  {
    v8 = (void *)-[UIVectorOperatable copy](targetVelocity, "copy");
    objc_msgSend(v8, "multiplyByScalar:", a4 / 1000.0 / (1.0 - a4));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v6, "addVector:", v9);

  }
  return v6;
}

- (BOOL)isActive
{
  return self->_interactive;
}

- (UIVectorOperatable)targetVelocity
{
  return self->_targetVelocity;
}

- (void)setTargetVelocity:(id)a3
{
  objc_storeStrong((id *)&self->_targetVelocity, a3);
}

@end
