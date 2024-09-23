@implementation _UIFluidSliderInteraction

- (void)setUserInteractionEnabled:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_userInteractionEnabled != a3)
  {
    self->_userInteractionEnabled = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[_UIFluidSliderInteraction _drivers](self, "_drivers", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setEnabled:", self->_userInteractionEnabled);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (_UIFluidSliderInteraction)initWithConfiguration:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  _UIFluidSliderInteraction *v8;
  _UIFluidSliderInteraction *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)_UIFluidSliderInteraction;
  v8 = -[_UIFluidSliderInteraction init](&v24, sel_init);
  v9 = v8;
  if (v8)
  {
    *(_WORD *)&v8->_feedbackEnabled = 257;
    v8->_elasticity = 2;
    v10 = (void *)objc_opt_new();
    -[_UIFluidSliderInteraction set_animatedValue:](v9, "set_animatedValue:", v10);

    v11 = (void *)objc_opt_new();
    -[_UIFluidSliderInteraction set_trackWidth:](v9, "set_trackWidth:", v11);

    v12 = (void *)objc_opt_new();
    -[_UIFluidSliderInteraction set_trackLength:](v9, "set_trackLength:", v12);

    v13 = (void *)objc_opt_new();
    -[_UIFluidSliderInteraction set_trackScale:](v9, "set_trackScale:", v13);

    -[_UIFluidSliderInteraction _trackScale](v9, "_trackScale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:", 1.0);

    -[_UIFluidSliderInteraction _animatedValue](v9, "_animatedValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    -[_UIFluidSliderInteraction _trackWidth](v9, "_trackWidth");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v16;
    -[_UIFluidSliderInteraction _trackLength](v9, "_trackLength");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v17;
    -[_UIFluidSliderInteraction _trackScale](v9, "_trackScale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, v9);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __59___UIFluidSliderInteraction_initWithConfiguration_handler___block_invoke;
    v21[3] = &unk_1E16B3F40;
    objc_copyWeak(&v22, &location);
    +[UIView _createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:](UIView, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v19, v21);
    -[_UIFluidSliderInteraction set_handler:](v9, "set_handler:", v7);
    -[_UIFluidSliderInteraction setConfiguration:](v9, "setConfiguration:", v6);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
  return v9;
}

- (void)setConfiguration:(id)a3
{
  id v5;
  _UIFluidSliderInteractionConfiguration *configuration;
  _UIFluidSliderInteractionConfiguration *v7;
  _UIFluidSliderInteractionConfiguration *v8;
  _UIFluidSliderInteractionConfiguration *v9;
  char v10;
  _UIFluidSliderInteractionConfiguration *v11;
  _UIFluidSliderInteractionConfiguration *v12;
  _UIFluidSliderInteractionConfiguration *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  int v27;
  double v28;
  double v29;
  BOOL v30;
  double v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD aBlock[5];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  configuration = self->_configuration;
  v7 = (_UIFluidSliderInteractionConfiguration *)v5;
  v8 = configuration;
  if (v8 != v7)
  {
    v9 = v8;
    if (v7 && v8)
    {
      v10 = -[_UIFluidSliderInteractionConfiguration isEqual:](v7, "isEqual:", v8);

      if ((v10 & 1) != 0)
        goto LABEL_68;
    }
    else
    {

    }
    v11 = self->_configuration;
    v12 = (_UIFluidSliderInteractionConfiguration *)-[_UIFluidSliderInteractionConfiguration copy](v7, "copy");
    v13 = self->_configuration;
    self->_configuration = v12;

    if (!v11)
    {
      -[_UIFluidSliderInteraction _rebuildDrivers](self, "_rebuildDrivers");
      goto LABEL_22;
    }
    v14 = -[_UIFluidSliderInteractionConfiguration preferredInputMethods](self->_configuration, "preferredInputMethods");
    if (v14 == -[_UIFluidSliderInteractionConfiguration preferredInputMethods](v11, "preferredInputMethods"))
    {
      -[_UIFluidSliderInteractionConfiguration _customDrivers](self->_configuration, "_customDrivers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFluidSliderInteractionConfiguration _customDrivers](v11, "_customDrivers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v15;
      v18 = v16;
      if (v17 == v18)
      {

LABEL_19:
        -[_UIFluidSliderInteractionConfiguration trackSize](self->_configuration, "trackSize");
        v22 = v21;
        v24 = v23;
        -[_UIFluidSliderInteractionConfiguration trackSize](v11, "trackSize");
        if (v22 == v26 && v24 == v25)
        {
          v27 = 0;
          goto LABEL_39;
        }
LABEL_22:
        -[_UIFluidSliderInteractionConfiguration trackSize](self->_configuration, "trackSize");
        v30 = v28 <= v29;
        if (v28 <= v29)
          v31 = v28;
        else
          v31 = v29;
        if (v28 > v29)
          v29 = v28;
        if (v30)
          v32 = 2;
        else
          v32 = 1;
        -[_UIFluidSliderInteraction set_normalizedTrackSize:](self, "set_normalizedTrackSize:", v31, v29);
        -[_UIFluidSliderInteraction set_axis:](self, "set_axis:", v32);
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        -[_UIFluidSliderInteraction _drivers](self, "_drivers");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v77;
          do
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v77 != v36)
                objc_enumerationMutation(v33);
              objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "setTrackAxis:", -[_UIFluidSliderInteraction _axis](self, "_axis"));
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
          }
          while (v35);
        }

        -[_UIFluidSliderInteraction _feedbackEpsilon](self, "_feedbackEpsilon");
        v39 = v38;
        -[_UIFluidSliderInteraction _feedbackConductor](self, "_feedbackConductor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setEpsilon:", v39);

        if (!v11)
        {
LABEL_40:
          -[_UIFluidSliderInteractionConfiguration stretchAmount](self->_configuration, "stretchAmount");
          if (v44 < 0.0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFluidSliderInteraction.m"), 267, CFSTR("_UIFluidSliderInteractionConfiguration.stretchAmount must be a non-negative value!"));

          }
          v74 = 0u;
          v75 = 0u;
          v72 = 0u;
          v73 = 0u;
          -[_UIFluidSliderInteraction _drivers](self, "_drivers");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
          if (v46)
          {
            v47 = v46;
            v48 = *(_QWORD *)v73;
            do
            {
              for (j = 0; j != v47; ++j)
              {
                if (*(_QWORD *)v73 != v48)
                  objc_enumerationMutation(v45);
                v50 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
                -[_UIFluidSliderInteractionConfiguration stretchAmount](self->_configuration, "stretchAmount");
                objc_msgSend(v50, "setStretchAmount:");
              }
              v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
            }
            while (v47);
          }

          if (!v11)
          {
LABEL_52:
            v70 = 0u;
            v71 = 0u;
            v68 = 0u;
            v69 = 0u;
            -[_UIFluidSliderInteraction _drivers](self, "_drivers");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
            if (v55)
            {
              v56 = v55;
              v57 = *(_QWORD *)v69;
              do
              {
                for (k = 0; k != v56; ++k)
                {
                  if (*(_QWORD *)v69 != v57)
                    objc_enumerationMutation(v54);
                  v59 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * k);
                  -[_UIFluidSliderInteractionConfiguration velocityMultiplier](self->_configuration, "velocityMultiplier");
                  objc_msgSend(v59, "setVelocityMultiplier:");
                }
                v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
              }
              while (v56);
            }

            v27 = 1;
            if (!v11)
            {
LABEL_61:
              if (!-[_UIFluidSliderInteractionConfiguration stepCount](self->_configuration, "stepCount"))
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFluidSliderInteraction.m"), 285, CFSTR("_UIFluidSliderInteractionConfiguration.stepCount must be non-zero!"));

                if ((v27 & 1) != 0)
                  goto LABEL_63;
                goto LABEL_67;
              }
LABEL_62:
              if (v27)
              {
LABEL_63:
                aBlock[0] = MEMORY[0x1E0C809B0];
                aBlock[1] = 3221225472;
                aBlock[2] = __46___UIFluidSliderInteraction_setConfiguration___block_invoke;
                aBlock[3] = &unk_1E16B1B28;
                aBlock[4] = self;
                v61 = _Block_copy(aBlock);
                if (v11)
                {
                  +[_UIFluidSliderSettingsDomain rootSettings](_UIFluidSliderSettingsDomain, "rootSettings");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "programmaticUpdate");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "springAnimationBehavior");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_UIFluidSliderInteraction _animate:withSpring:](self, "_animate:withSpring:", v61, v64);

                }
                else
                {
                  +[UIView _performWithoutRetargetingAnimations:](UIView, "_performWithoutRetargetingAnimations:", v61);
                }

              }
LABEL_67:

              goto LABEL_68;
            }
LABEL_60:
            v60 = -[_UIFluidSliderInteractionConfiguration stepCount](self->_configuration, "stepCount");
            if (v60 == -[_UIFluidSliderInteractionConfiguration stepCount](v11, "stepCount"))
              goto LABEL_62;
            goto LABEL_61;
          }
          v27 = 1;
LABEL_51:
          -[_UIFluidSliderInteractionConfiguration velocityMultiplier](self->_configuration, "velocityMultiplier");
          v52 = v51;
          -[_UIFluidSliderInteractionConfiguration velocityMultiplier](v11, "velocityMultiplier");
          if (vabdd_f64(v52, v53) <= 2.22044605e-16)
            goto LABEL_60;
          goto LABEL_52;
        }
        v27 = 1;
LABEL_39:
        -[_UIFluidSliderInteractionConfiguration stretchAmount](self->_configuration, "stretchAmount");
        v42 = v41;
        -[_UIFluidSliderInteractionConfiguration stretchAmount](v11, "stretchAmount");
        if (vabdd_f64(v42, v43) <= 2.22044605e-16)
          goto LABEL_51;
        goto LABEL_40;
      }
      v19 = v18;
      if (v17 && v18)
      {
        v20 = objc_msgSend(v17, "isEqual:", v18);

        if ((v20 & 1) != 0)
          goto LABEL_19;
      }
      else
      {

      }
    }
    -[_UIFluidSliderInteraction _rebuildDrivers](self, "_rebuildDrivers");
    goto LABEL_19;
  }

LABEL_68:
}

- (void)setLocked:(BOOL)a3
{
  if (self->_locked != a3)
  {
    if (a3)
    {
      -[_UIFluidSliderInteraction value](self, "value");
      -[_UIFluidSliderInteraction set_lockedValue:](self, "set_lockedValue:");
    }
    self->_locked = a3;
  }
}

- (void)willMoveToView:(id)a3
{
  -[_UIFluidSliderInteraction _removeAllDrivers](self, "_removeAllDrivers", a3);
  -[_UIFluidSliderInteraction set_feedbackConductor:](self, "set_feedbackConductor:", 0);
  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  id v4;

  v4 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
    -[_UIFluidSliderInteraction _rebuildDrivers](self, "_rebuildDrivers");

}

- (void)_rebuildDrivers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  _UIFluidSliderFeedbackConductor *v26;
  void *v27;
  _UIFluidSliderFeedbackConductor *v28;
  double v29;
  double v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[_UIFluidSliderInteraction view](self, "view");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return;
  v4 = (void *)v3;
  -[_UIFluidSliderInteraction configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return;
  -[_UIFluidSliderInteraction _removeAllDrivers](self, "_removeAllDrivers");
  -[_UIFluidSliderInteraction configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "preferredInputMethods");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 & 1) != 0)
  {
    -[_UIFluidSliderInteraction _elasticity](self, "_elasticity");
    v10 = (void *)objc_opt_new();
    WeakRetained = objc_loadWeakRetained((id *)&self->_directDrivingDelegate);
    objc_msgSend(v10, "setDelegate:", WeakRetained);

    -[_UIFluidSliderInteraction set_panDriver:](self, "set_panDriver:", v10);
    objc_msgSend(v8, "addObject:", v10);

    if ((v7 & 2) != 0)
      goto LABEL_5;
LABEL_7:
    -[_UIFluidSliderInteraction set_volumeButtonDriver:](self, "set_volumeButtonDriver:", 0);
    goto LABEL_8;
  }
  -[_UIFluidSliderInteraction set_panDriver:](self, "set_panDriver:", 0);
  if ((v7 & 2) == 0)
    goto LABEL_7;
LABEL_5:
  v9 = (void *)objc_opt_new();
  -[_UIFluidSliderInteraction set_volumeButtonDriver:](self, "set_volumeButtonDriver:", v9);
  objc_msgSend(v8, "addObject:", v9);

LABEL_8:
  -[_UIFluidSliderInteraction configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_customDrivers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v13);

  -[_UIFluidSliderInteraction set_drivers:](self, "set_drivers:", v8);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[_UIFluidSliderInteraction _drivers](self, "_drivers", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[_UIFluidSliderInteraction view](self, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          -[_UIFluidSliderInteraction view](self, "view");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setView:", v21);

          objc_msgSend(v19, "setDrivable:", self);
        }
        -[_UIFluidSliderInteraction configuration](self, "configuration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v19, "setTrackAxis:", -[_UIFluidSliderInteraction _axis](self, "_axis"));
          -[_UIFluidSliderInteraction configuration](self, "configuration");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stretchAmount");
          objc_msgSend(v19, "setStretchAmount:");

          -[_UIFluidSliderInteraction configuration](self, "configuration");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "velocityMultiplier");
          objc_msgSend(v19, "setVelocityMultiplier:");

        }
        objc_msgSend(v19, "setEnabled:", -[_UIFluidSliderInteraction isUserInteractionEnabled](self, "isUserInteractionEnabled"));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v16);
  }

  v25 = -[_UIFluidSliderInteraction stepCount](self, "stepCount") >> 1;
  v26 = [_UIFluidSliderFeedbackConductor alloc];
  -[_UIFluidSliderInteraction view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[_UIFluidSliderFeedbackConductor initWithDetentCount:view:indirectFeedbackPlayer:](v26, "initWithDetentCount:view:indirectFeedbackPlayer:", v25, v27, 0);
  -[_UIFluidSliderInteraction set_feedbackConductor:](self, "set_feedbackConductor:", v28);

  -[_UIFluidSliderInteraction _feedbackEpsilon](self, "_feedbackEpsilon");
  v30 = v29;
  -[_UIFluidSliderInteraction _feedbackConductor](self, "_feedbackConductor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setEpsilon:", v30);

}

- (void)_removeAllDrivers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[_UIFluidSliderInteraction _drivers](self, "_drivers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setView:", 0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_setDirectDrivingDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_directDrivingDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_directDrivingDelegate, obj);
    -[_UIFluidSliderInteraction _panDriver](self, "_panDriver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", obj);

  }
}

- (void)setValue:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _OWORD v16[2];
  uint64_t v17;
  _QWORD aBlock[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[_UIFluidSliderInteraction _activeDriver](self, "_activeDriver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[_UIFluidSliderInteraction _drivers](self, "_drivers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10++), "stop");
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

  }
  v11 = fmax(fmin(a3, 1.0), 0.0);
  -[_UIFluidSliderInteraction set_lockedValue:](self, "set_lockedValue:", v11);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38___UIFluidSliderInteraction_setValue___block_invoke;
  aBlock[3] = &unk_1E16B1888;
  aBlock[4] = self;
  *(double *)&aBlock[5] = v11;
  v12 = _Block_copy(aBlock);
  memset(v16, 0, sizeof(v16));
  v17 = 0;
  -[_UIFluidSliderInteraction set_lastDriverUpdate:](self, "set_lastDriverUpdate:", v16);
  +[_UIFluidSliderSettingsDomain rootSettings](_UIFluidSliderSettingsDomain, "rootSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "programmaticUpdate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "springAnimationBehavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFluidSliderInteraction _animate:withSpring:](self, "_animate:withSpring:", v12, v15);

}

- (double)value
{
  double result;
  void *v4;
  double v5;
  double v6;

  if (-[_UIFluidSliderInteraction isLocked](self, "isLocked"))
  {
    -[_UIFluidSliderInteraction _lockedValue](self, "_lockedValue");
  }
  else
  {
    -[_UIFluidSliderInteraction _animatedValue](self, "_animatedValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v6 = fmax(fmin(v5, 1.0), 0.0);

    return v6;
  }
  return result;
}

- (double)presentationValue
{
  void *v2;
  double v3;
  double v4;

  -[_UIFluidSliderInteraction _animatedValue](self, "_animatedValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationValue");
  v4 = v3;

  return v4;
}

- (double)currentTrackLength
{
  void *v2;
  double v3;
  double v4;

  -[_UIFluidSliderInteraction _trackLength](self, "_trackLength");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationValue");
  v4 = v3;

  return v4;
}

- (unint64_t)stepCount
{
  void *v2;
  unint64_t v3;

  -[_UIFluidSliderInteraction configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "stepCount");

  return v3;
}

- (void)fluidSliderDriver:(id)a3 didGenerateUpdate:(id *)a4
{
  id v6;
  __int128 v7;
  int64_t var2;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  double var0;
  const __CFString *v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  double v25;
  const __CFString *v26;
  double var1;
  _OWORD v28[2];
  double var4;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  double v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *(_OWORD *)&a4->var2;
  v28[0] = *(_OWORD *)&a4->var0;
  v28[1] = v7;
  var4 = a4->var4;
  -[_UIFluidSliderInteraction set_lastDriverUpdate:](self, "set_lastDriverUpdate:", v28);
  var2 = a4->var2;
  if (var2 == 1)
  {
    -[_UIFluidSliderInteraction _activeDriver](self, "_activeDriver");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v6)
      goto LABEL_7;
    -[_UIFluidSliderInteraction _cancelDriversExcludingDriver:](self, "_cancelDriversExcludingDriver:", v6);
    v10 = v6;
    goto LABEL_4;
  }
  if (!var2)
  {
    -[_UIFluidSliderInteraction _activeDriver](self, "_activeDriver");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 == v6)
    {
      v10 = 0;
LABEL_4:
      -[_UIFluidSliderInteraction set_activeDriver:](self, "set_activeDriver:", v10);
    }
  }
LABEL_7:
  -[_UIFluidSliderInteraction _activeDriver](self, "_activeDriver");
  v12 = objc_claimAutoreleasedReturnValue();
  if ((id)v12 == v6)
  {

  }
  else
  {
    v13 = (void *)v12;
    -[_UIFluidSliderInteraction _activeDriver](self, "_activeDriver");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = qword_1ECD7DFD8;
      if (!qword_1ECD7DFD8)
      {
        v15 = __UILogCategoryGetNode("FluidSliderInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&qword_1ECD7DFD8);
      }
      v16 = *(NSObject **)(v15 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        objc_msgSend(v6, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        var0 = a4->var0;
        v20 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        v31 = v18;
        if (var2 == 1)
          v20 = CFSTR("YES");
        v32 = 2048;
        v33 = var0;
        v34 = 2112;
        v35 = v20;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_DEFAULT, "[FluidSlider Update] Rejected: %@ | value: %.4f | isActive: %@", buf, 0x20u);

      }
      goto LABEL_23;
    }
  }
  v21 = _MergedGlobals_1067;
  if (!_MergedGlobals_1067)
  {
    v21 = __UILogCategoryGetNode("FluidSliderInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v21, (unint64_t *)&_MergedGlobals_1067);
  }
  v22 = *(NSObject **)(v21 + 8);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    objc_msgSend(v6, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = a4->var0;
    v26 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v31 = v24;
    if (var2 == 1)
      v26 = CFSTR("YES");
    v32 = 2048;
    v33 = v25;
    v34 = 2112;
    v35 = v26;
    _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_DEFAULT, "[FluidSlider Update] Accepted: %@ | value: %.4f | isActive: %@", buf, 0x20u);

  }
  -[_UIFluidSliderInteraction _targetNewValue:](self, "_targetNewValue:", a4->var0);
LABEL_23:
  if (-[_UIFluidSliderInteraction _shouldScaleOnIndirectInput](self, "_shouldScaleOnIndirectInput"))
  {
    var1 = 1.0;
    if ((unint64_t)(a4->var2 - 1) <= 1)
      var1 = a4->var1;
    -[_UIFluidSliderInteraction _targetNewScale:](self, "_targetNewScale:", var1);
  }

}

- (void)_targetNewValue:(double)a3
{
  void (**v3)(_QWORD);
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45___UIFluidSliderInteraction__targetNewValue___block_invoke;
  v4[3] = &unk_1E16B1888;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  v3 = (void (**)(_QWORD))_Block_copy(v4);
  if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock")
    || !+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    v3[2](v3);
  }
  else
  {
    +[UIView _performWithoutRetargetingAnimations:](UIView, "_performWithoutRetargetingAnimations:", v3);
  }

}

- (void)_targetNewScale:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  -[_UIFluidSliderInteraction _trackScale](self, "_trackScale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v7 = vabdd_f64(v6, a3);

  if (v7 > 2.22044605e-16)
  {
    +[_UIFluidSliderSettingsDomain rootSettings](_UIFluidSliderSettingsDomain, "rootSettings", MEMORY[0x1E0C809B0], 3221225472, __45___UIFluidSliderInteraction__targetNewScale___block_invoke, &unk_1E16B1888, self, *(_QWORD *)&a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pressScale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "springAnimationBehavior");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFluidSliderInteraction _animate:withSpring:](self, "_animate:withSpring:", &v11, v10);

  }
}

- (void)_issueUpdate
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  int64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  void *v58;
  double v59;
  _BOOL4 v60;
  _BOOL8 v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  CGFloat v66;
  void *v67;
  _BOOL4 v68;
  double v69;
  _BOOL8 v70;
  void (**v71)(_QWORD, _QWORD);
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  CGAffineTransform v81;
  CGAffineTransform v82;
  CGAffineTransform v83;
  CGAffineTransform v84;
  __int128 v85;
  __int128 v86;
  double v87;
  uint64_t v88;

  -[_UIFluidSliderInteraction _animatedValue](self, "_animatedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationValue");
  v5 = v4;

  -[_UIFluidSliderInteraction _trackWidth](self, "_trackWidth");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationValue");
  v8 = v7;

  -[_UIFluidSliderInteraction _trackLength](self, "_trackLength");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentationValue");
  v11 = v10;

  v12 = -[_UIFluidSliderInteraction _elasticity](self, "_elasticity");
  if (v12 != 2)
  {
    if (v12 != 1 || (-[_UIFluidSliderInteraction _lastDriverUpdate](self, "_lastDriverUpdate"), v88 == 1))
      v5 = fmax(fmin(v5, 1.0), 0.0);
  }
  v13 = fmax(v5 + -1.0, 0.0);
  if (v5 <= 0.0)
    v13 = v5;
  v14 = v11 * v13;
  v15 = -(v11 * v13);
  if (v11 * v13 >= 0.0)
    v16 = v11 * v13;
  else
    v16 = -(v11 * v13);
  -[_UIFluidSliderInteraction _driftFactor](self, "_driftFactor");
  v18 = v11 + (1.0 - v17) * v16;
  if (v18 <= 0.0)
  {
    v27 = *MEMORY[0x1E0C9D820];
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    -[_UIFluidSliderInteraction configuration](self, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stretchAmount");
    v21 = v20;

    v22 = v21 <= 0.0;
    v23 = 0.0;
    if (!v22)
    {
      -[_UIFluidSliderInteraction configuration](self, "configuration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stretchAmount");
      v23 = v14 / v25;

      if (v23 < 0.0)
        v23 = -v23;
    }
    -[_UIFluidSliderInteraction _minSquishedWidthForWidth:](self, "_minSquishedWidthForWidth:", v8);
    v27 = v8 * (1.0 - v23) + v23 * v26;
  }
  -[_UIFluidSliderInteraction _driftFactor](self, "_driftFactor");
  v29 = (v28 + 0.5) * v15;
  -[_UIFluidSliderInteraction view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "effectiveUserInterfaceLayoutDirection");

  v32 = -[_UIFluidSliderInteraction _axis](self, "_axis");
  v33 = fmax(fmin(v5, 1.0), 0.0);
  v34 = v33 * v18;
  v35 = v18 - v33 * v18;
  v36 = v18 - v35;
  v37 = -v29;
  if (v31 == 1)
  {
    v37 = v29;
    v38 = v18 - v33 * v18;
  }
  else
  {
    v38 = v33 * v18;
  }
  if (v31 == 1)
    v39 = v18 - v33 * v18;
  else
    v39 = 0.0;
  v40 = v33;
  if (v32 == 1)
    v41 = v18;
  else
    v41 = v27;
  v78 = v41;
  if (v32 == 1)
    v42 = v27;
  else
    v42 = v18;
  v77 = v42;
  if (v32 == 1)
    v43 = v37;
  else
    v43 = 0.0;
  if (v32 == 1)
    v44 = 0.0;
  else
    v44 = v29;
  if (v32 == 1)
    v45 = v38;
  else
    v45 = v27 * 0.5;
  if (v32 == 1)
    v46 = v27 * 0.5;
  else
    v46 = v36;
  v75 = v46;
  if (v32 == 1)
    v47 = v39;
  else
    v47 = 0.0;
  v79 = v47;
  if (v32 == 1)
    v48 = 0.0;
  else
    v48 = v35;
  if (v32 == 1)
    v49 = v34;
  else
    v49 = v27;
  if (v32 == 1)
    v50 = v27;
  else
    v50 = v36;
  -[_UIFluidSliderInteraction _state](self, "_state", *(_QWORD *)&v45, *(_QWORD *)&v75);
  v87 = 0.0;
  v85 = 0u;
  v86 = 0u;
  -[_UIFluidSliderInteraction _lastDriverUpdate](self, "_lastDriverUpdate");
  -[_UIFluidSliderInteraction _activeDriver](self, "_activeDriver");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    v52 = 1;
    if ((_QWORD)v86 == 1)
      v53 = 1;
    else
      v53 = 2;
    v54 = 4;
    if (*((_QWORD *)&v86 + 1) == 1)
      v54 = 2;
    if (*((_QWORD *)&v86 + 1))
      v55 = v54;
    else
      v55 = 0;
    if (*((_QWORD *)&v86 + 1) == 1)
    {
      v56 = v49;
LABEL_74:
      v61 = 0;
      goto LABEL_76;
    }
    if (-[_UIFluidSliderInteraction _state](self, "_state") && -[_UIFluidSliderInteraction _state](self, "_state") != 2)
    {
      v56 = v49;
      v52 = 0;
      goto LABEL_74;
    }
    -[_UIFluidSliderInteraction value](self, "value");
    v56 = v49;
    if (fabs(v62) <= 2.22044605e-16)
    {
      v52 = 0;
      v61 = 1;
    }
    else
    {
      -[_UIFluidSliderInteraction value](self, "value");
      v52 = 0;
      v61 = fabs(v63 + -1.0) <= 2.22044605e-16;
    }
  }
  else
  {
    v56 = v49;
    v57 = 5;
    if (*((_QWORD *)&v86 + 1) == 1)
      v57 = 3;
    if (*((_QWORD *)&v86 + 1))
      v55 = v57;
    else
      v55 = 1;
    -[_UIFluidSliderInteraction _animatedValue](self, "_animatedValue");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "value");
    v60 = vabdd_f64(v59, v5) > 2.22044605e-16;

    v52 = 0;
    v61 = 0;
    v53 = 2 * v60;
  }
LABEL_76:
  -[_UIFluidSliderInteraction set_state:](self, "set_state:", v53);
  -[_UIFluidSliderInteraction _trackScale](self, "_trackScale");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "presentationValue");
  v66 = v65;

  memset(&v84, 0, sizeof(v84));
  CGAffineTransformMakeScale(&v84, v66, v66);
  v82 = v84;
  CGAffineTransformTranslate(&v83, &v82, v43, v44);
  v84 = v83;
  v67 = (void *)objc_opt_new();
  v68 = -[_UIFluidSliderInteraction isLocked](self, "isLocked");
  v69 = v40;
  if (v68)
    -[_UIFluidSliderInteraction _lockedValue](self, "_lockedValue", v40);
  objc_msgSend(v67, "setValue:", v69);
  objc_msgSend(v67, "setTrackBounds:", 0.0, 0.0, v78, v77);
  v81 = v84;
  objc_msgSend(v67, "setTrackTransform:", &v81);
  objc_msgSend(v67, "setBarFrame:", v79, v48, v56, v50);
  objc_msgSend(v67, "setTracking:", v52);
  objc_msgSend(v67, "setInteractionState:", -[_UIFluidSliderInteraction _state](self, "_state"));
  objc_msgSend(v67, "setType:", v55);
  if (v53)
    v70 = v53 == 2 && vabdd_f64(v5, v40) > 2.22044605e-16;
  else
    v70 = 1;
  objc_msgSend(v67, "setAtTarget:", v70);
  objc_msgSend(v67, "set_unclampedValue:", v5);
  -[_UIFluidSliderInteraction _handler](self, "_handler");
  v71 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v71)[2](v71, v67);

  if (-[_UIFluidSliderInteraction _feedbackEnabled](self, "_feedbackEnabled")
    && -[_UIFluidSliderInteraction isUserInteractionEnabled](self, "isUserInteractionEnabled")
    && !-[_UIFluidSliderInteraction isLocked](self, "isLocked"))
  {
    -[_UIFluidSliderInteraction _feedbackConductor](self, "_feedbackConductor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v87;
    -[_UIFluidSliderInteraction _lastDriverUpdate](self, "_lastDriverUpdate");
    objc_msgSend(v72, "moveToValue:snappingTarget:withUpdateType:atLocation:forced:", v80, v61, v5, v73, v74, v76);

  }
}

- (void)_cancelDriversExcludingDriver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59___UIFluidSliderInteraction__cancelDriversExcludingDriver___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  +[UIView _performWithoutRetargetingAnimations:](UIView, "_performWithoutRetargetingAnimations:", v6);

}

- (UIPanGestureRecognizer)_panGestureRecognizer
{
  void *v2;
  void *v3;

  -[_UIFluidSliderInteraction _panDriver](self, "_panDriver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "panGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIPanGestureRecognizer *)v3;
}

- (_UIPhysicalButtonInteraction)_volumeButtonInteraction
{
  void *v2;
  void *v3;

  -[_UIFluidSliderInteraction _volumeButtonDriver](self, "_volumeButtonDriver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "physicalButtonInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIPhysicalButtonInteraction *)v3;
}

- (void)_setElasticity:(int64_t)a3
{
  if (self->_elasticity != a3)
  {
    self->_elasticity = a3;
    -[_UIFluidSliderInteraction _rebuildDrivers](self, "_rebuildDrivers");
  }
}

- (double)_driftFactor
{
  void *v2;
  double v3;
  double v4;

  +[_UIFluidSliderSettingsDomain rootSettings](_UIFluidSliderSettingsDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sliderDriftFactor");
  v4 = v3;

  return v4;
}

- (double)_minSquishedWidthForWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double result;

  +[_UIFluidSliderSettingsDomain rootSettings](_UIFluidSliderSettingsDomain, "rootSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "squishFactor");
  v6 = v5;

  +[_UIFluidSliderSettingsDomain rootSettings](_UIFluidSliderSettingsDomain, "rootSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minSquishPoints");
  v9 = v8;

  result = v6 * a3;
  if (v6 * a3 >= a3 - v9)
    return a3 - v9;
  return result;
}

- (NSString)description
{
  void *v3;
  void *v5;
  int64_t v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_diagnostics())
  {
    -[_UIFluidSliderInteraction configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; configuration = %@"), v5);

    if (!-[_UIFluidSliderInteraction isUserInteractionEnabled](self, "isUserInteractionEnabled"))
      objc_msgSend(v3, "appendString:", CFSTR("; userInteractionEnabled = NO"));
    if (!-[_UIFluidSliderInteraction _feedbackEnabled](self, "_feedbackEnabled"))
      objc_msgSend(v3, "appendString:", CFSTR("; feedbackEnabled = NO"));
    if (-[_UIFluidSliderInteraction _elasticity](self, "_elasticity") != 2)
    {
      v6 = -[_UIFluidSliderInteraction _elasticity](self, "_elasticity");
      v7 = CFSTR("full");
      if (v6 == 1)
        v7 = CFSTR("indirectOnly");
      if (!v6)
        v7 = CFSTR("none");
      objc_msgSend(v3, "appendFormat:", CFSTR("; elasticity = %@"), v7);
    }
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (void)_animate:(id)a3 withSpring:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  if (+[UIView _isInRetargetableAnimationBlock](UIView, "_isInRetargetableAnimationBlock"))
  {
    v6[2](v6);
  }
  else if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock")
         || !+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    v6[2](v6);
    -[_UIFluidSliderInteraction _issueUpdate](self, "_issueUpdate");
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49___UIFluidSliderInteraction__animate_withSpring___block_invoke;
    v8[3] = &unk_1E16B1BF8;
    v9 = v6;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v7, 0, v8, 0);

  }
}

- (double)_feedbackEpsilon
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[_UIFluidSliderInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = 1.0 / v5;
  -[_UIFluidSliderInteraction _normalizedTrackSize](self, "_normalizedTrackSize");
  v8 = fmax(fmin(v6 / v7, 1.0), 0.0001);

  return v8;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (int64_t)_elasticity
{
  return self->_elasticity;
}

- (BOOL)_feedbackEnabled
{
  return self->_feedbackEnabled;
}

- (void)_setFeedbackEnabled:(BOOL)a3
{
  self->_feedbackEnabled = a3;
}

- (_UIFluidSliderDirectDrivingDelegate)_directDrivingDelegate
{
  return (_UIFluidSliderDirectDrivingDelegate *)objc_loadWeakRetained((id *)&self->_directDrivingDelegate);
}

- (double)_lockedValue
{
  return self->_lockedValue;
}

- (void)set_lockedValue:(double)a3
{
  self->_lockedValue = a3;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (_UIFluidSliderInteractionConfiguration)configuration
{
  return self->_configuration;
}

- (id)_handler
{
  return self->__handler;
}

- (void)set_handler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)_axis
{
  return self->__axis;
}

- (void)set_axis:(unint64_t)a3
{
  self->__axis = a3;
}

- (CGSize)_normalizedTrackSize
{
  double width;
  double height;
  CGSize result;

  width = self->__normalizedTrackSize.width;
  height = self->__normalizedTrackSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)set_normalizedTrackSize:(CGSize)a3
{
  self->__normalizedTrackSize = a3;
}

- (NSArray)_drivers
{
  return self->__drivers;
}

- (void)set_drivers:(id)a3
{
  objc_storeStrong((id *)&self->__drivers, a3);
}

- (_UIFluidSliderDriving)_activeDriver
{
  return (_UIFluidSliderDriving *)objc_loadWeakRetained((id *)&self->__activeDriver);
}

- (void)set_activeDriver:(id)a3
{
  objc_storeWeak((id *)&self->__activeDriver, a3);
}

- (_UIFluidSliderDirectDriving)_panDriver
{
  return (_UIFluidSliderDirectDriving *)objc_loadWeakRetained((id *)&self->__panDriver);
}

- (void)set_panDriver:(id)a3
{
  objc_storeWeak((id *)&self->__panDriver, a3);
}

- (_UIFluidSliderVolumeButtonDriving)_volumeButtonDriver
{
  return (_UIFluidSliderVolumeButtonDriving *)objc_loadWeakRetained((id *)&self->__volumeButtonDriver);
}

- (void)set_volumeButtonDriver:(id)a3
{
  objc_storeWeak((id *)&self->__volumeButtonDriver, a3);
}

- (_UIFluidSliderFeedbackConductor)_feedbackConductor
{
  return self->__feedbackConductor;
}

- (void)set_feedbackConductor:(id)a3
{
  objc_storeStrong((id *)&self->__feedbackConductor, a3);
}

- (UIViewFloatAnimatableProperty)_animatedValue
{
  return self->__animatedValue;
}

- (void)set_animatedValue:(id)a3
{
  objc_storeStrong((id *)&self->__animatedValue, a3);
}

- (UIViewFloatAnimatableProperty)_trackWidth
{
  return self->__trackWidth;
}

- (void)set_trackWidth:(id)a3
{
  objc_storeStrong((id *)&self->__trackWidth, a3);
}

- (UIViewFloatAnimatableProperty)_trackLength
{
  return self->__trackLength;
}

- (void)set_trackLength:(id)a3
{
  objc_storeStrong((id *)&self->__trackLength, a3);
}

- (UIViewFloatAnimatableProperty)_trackScale
{
  return self->__trackScale;
}

- (void)set_trackScale:(id)a3
{
  objc_storeStrong((id *)&self->__trackScale, a3);
}

- (int64_t)_state
{
  return self->__state;
}

- (void)set_state:(int64_t)a3
{
  self->__state = a3;
}

- ($0E0C902F25D72445DD01CB63E261F0E2)_lastDriverUpdate
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].var4;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[4].var2;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = self[5].var1;
  return self;
}

- (void)set_lastDriverUpdate:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2;
  self->currentSnappingTarget = a3->var4;
  *(_OWORD *)&self->value = v3;
  *(_OWORD *)&self->state = v4;
}

- (BOOL)_shouldScaleOnIndirectInput
{
  return self->__shouldScaleOnIndirectInput;
}

- (void)_setShouldScaleOnIndirectInput:(BOOL)a3
{
  self->__shouldScaleOnIndirectInput = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__trackScale, 0);
  objc_storeStrong((id *)&self->__trackLength, 0);
  objc_storeStrong((id *)&self->__trackWidth, 0);
  objc_storeStrong((id *)&self->__animatedValue, 0);
  objc_storeStrong((id *)&self->__feedbackConductor, 0);
  objc_destroyWeak((id *)&self->__volumeButtonDriver);
  objc_destroyWeak((id *)&self->__panDriver);
  objc_destroyWeak((id *)&self->__activeDriver);
  objc_storeStrong((id *)&self->__drivers, 0);
  objc_storeStrong(&self->__handler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_directDrivingDelegate);
  objc_destroyWeak((id *)&self->_view);
}

@end
