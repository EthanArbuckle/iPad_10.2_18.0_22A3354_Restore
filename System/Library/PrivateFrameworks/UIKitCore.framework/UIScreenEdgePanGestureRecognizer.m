@implementation UIScreenEdgePanGestureRecognizer

- (UIRectEdge)edges
{
  return self->_edges;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v7;
  void *v8;
  int64_t v9;
  unint64_t edges;
  uint64_t v11;
  uint64_t v12;
  _UISEMuxGestureFeature *v13;
  _UISEMuxGestureFeature *rootFeature;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!self->_rootFeature)
  {
    -[UIGestureRecognizer view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_sceneReferenceBounds");
    -[_UISEGestureFeatureSettings setBounds:](self->_settings, "setBounds:");

    v9 = -[UIScreenEdgePanGestureRecognizer _touchInterfaceOrientation](self, "_touchInterfaceOrientation");
    edges = self->_edges;
    if (v9 == 4)
    {
      -[_UISEGestureFeatureSettings setTargetEdges:](self->_settings, "setTargetEdges:", _rotatedEdgesGivenOrientationInDegrees(edges, 90));
      v11 = 8;
    }
    else if (v9 == 3)
    {
      -[_UISEGestureFeatureSettings setTargetEdges:](self->_settings, "setTargetEdges:", _rotatedEdgesGivenOrientationInDegrees(edges, -90));
      v11 = 2;
    }
    else
    {
      if (v9 == 1)
      {
        -[_UISEGestureFeatureSettings setTargetEdges:](self->_settings, "setTargetEdges:", _rotatedEdgesGivenOrientationInDegrees(edges, 0));
LABEL_13:
        v11 = 4;
        goto LABEL_14;
      }
      if (v9 == 2)
        v12 = -180;
      else
        v12 = 0;
      -[_UISEGestureFeatureSettings setTargetEdges:](self->_settings, "setTargetEdges:", _rotatedEdgesGivenOrientationInDegrees(edges, v12));
      if (v9 != 2)
        goto LABEL_13;
      v11 = 1;
    }
LABEL_14:
    -[_UISEGestureFeatureSettings setInterfaceBottomEdge:](self->_settings, "setInterfaceBottomEdge:", v11);
    v13 = -[_UISEMuxGestureFeature initWithSettings:createFeatureBlock:]([_UISEMuxGestureFeature alloc], "initWithSettings:createFeatureBlock:", self->_settings, self->_createFeatureBlock);
    rootFeature = self->_rootFeature;
    self->_rootFeature = v13;

    -[_UISEGestureFeature setDelegate:](self->_rootFeature, "setDelegate:", self);
    self->_touchedEdges = 0;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = a3;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v19);
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "phase");
        if (v22)
        {
          if (v22 == 3)
          {
            v22 = 2;
          }
          else if (v22 != 1)
          {
            abort();
          }
        }
        *(_QWORD *)&v28 = 0;
        *(_QWORD *)&v27 = v22;
        *((_QWORD *)&v27 + 1) = objc_msgSend(v21, "_edgeAim");
        LOBYTE(v28) = objc_msgSend(v21, "_edgeForceActive");
        *((_QWORD *)&v28 + 1) = objc_msgSend(v21, "_edgeType");
        *(_QWORD *)&v29 = objc_msgSend(v21, "_touchIdentifier");
        objc_msgSend(v21, "_locationInSceneReferenceSpace");
        *((_QWORD *)&v29 + 1) = v23;
        *(_QWORD *)&v30 = v24;
        objc_msgSend(v21, "timestamp");
        *((_QWORD *)&v30 + 1) = v25;

        -[_UISEGestureFeature incorporateSample:](self->_rootFeature, "incorporateSample:", &v27);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v17);
  }

  v26.receiver = self;
  v26.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  -[UIPanGestureRecognizer touchesBegan:withEvent:](&v26, sel_touchesBegan_withEvent_, v15, a4);
}

- (void)featureDidChangeState:(id)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = -[_UISEGestureFeature state](self->_rootFeature, "state", a3);
  if (v4 == 2)
  {
    self->_touchedEdges = 0;
    if (!-[UIScreenEdgePanGestureRecognizer _recognizesWithoutEdge](self, "_recognizesWithoutEdge"))
      -[UIGestureRecognizer setState:](self, "setState:", 5);
  }
  else if (v4 == 1)
  {
    -[UIPanGestureRecognizer _removeHysteresisFromTranslation](self, "_removeHysteresisFromTranslation");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[_UISEMuxGestureFeature subfeatures](self->_rootFeature, "subfeatures", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      v9 = 15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[_UISEMuxGestureFeature subfeatures](self->_rootFeature, "subfeatures");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v13, "state") == 1)
          {
            objc_getAssociatedObject(v13, &__lastTouchedEdgesProviderKey);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v9 &= objc_msgSend(v14, "touchedEdges");

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 15;
    }

    v15 = -[UIScreenEdgePanGestureRecognizer _touchInterfaceOrientation](self, "_touchInterfaceOrientation");
    v16 = 90;
    v17 = -90;
    v18 = 180;
    if (v15 != 2)
      v18 = 0;
    if (v15 != 4)
      v17 = v18;
    if (v15 != 3)
      v16 = v17;
    if (v15 == 1)
      v19 = 0;
    else
      v19 = v16;
    self->_touchedEdges = _rotatedEdgesGivenOrientationInDegrees(v9, v19);
    -[UIGestureRecognizer setState:](self, "setState:", 1);
  }
}

- (BOOL)_recognizesWithoutEdge
{
  return self->_recognizesWithoutEdge;
}

- (void)reset
{
  _UISEMuxGestureFeature *rootFeature;
  objc_super v4;

  -[_UISEGestureFeatureSettings setBounds:](self->_settings, "setBounds:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  -[_UISEGestureFeatureSettings setTargetEdges:](self->_settings, "setTargetEdges:", 0);
  -[_UISEGestureFeatureSettings setIgnoreHIDEdgeFlags:](self->_settings, "setIgnoreHIDEdgeFlags:", -[_UIAssertionController hasAssertionsOfType:](self->_ignoreHIDEdgeFlagsAssertionController, "hasAssertionsOfType:", 1));
  -[_UISEGestureFeature setDelegate:](self->_rootFeature, "setDelegate:", 0);
  rootFeature = self->_rootFeature;
  self->_rootFeature = 0;

  self->_touchedEdges = 0;
  v4.receiver = self;
  v4.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  -[UIGestureRecognizer reset](&v4, sel_reset);
}

- (int64_t)_touchInterfaceOrientation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIGestureRecognizer view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation");

  return v4;
}

- (void)setEdges:(UIRectEdge)edges
{
  self->_edges = edges;
}

- (UIScreenEdgePanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UIScreenEdgePanGestureRecognizer *v4;
  UIScreenEdgePanGestureRecognizer *v5;
  UIScreenEdgePanGestureRecognizer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  v4 = -[UIPanGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    _commonInit(v4, 1, 0);
    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v5, "setMaximumNumberOfTouches:", 1);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v5, "setDelaysTouchesBegan:", 1);
    v6 = v5;
  }

  return v5;
}

- (void)_setHysteresis:(double)a3
{
  objc_super v5;

  -[_UISEGestureFeatureSettings setHysteresis:](self->_settings, "setHysteresis:");
  v5.receiver = self;
  v5.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  -[UIPanGestureRecognizer _setHysteresis:](&v5, sel__setHysteresis_, a3);
}

- (void)_setRecognizesWithoutEdge:(BOOL)a3
{
  self->_recognizesWithoutEdge = a3;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "phase");
        if (v13)
        {
          if (v13 == 3)
          {
            v13 = 2;
          }
          else if (v13 != 1)
          {
            abort();
          }
        }
        *(_QWORD *)&v19 = 0;
        *(_QWORD *)&v18 = v13;
        *((_QWORD *)&v18 + 1) = objc_msgSend(v12, "_edgeAim");
        LOBYTE(v19) = objc_msgSend(v12, "_edgeForceActive");
        *((_QWORD *)&v19 + 1) = objc_msgSend(v12, "_edgeType");
        *(_QWORD *)&v20 = objc_msgSend(v12, "_touchIdentifier");
        objc_msgSend(v12, "_locationInSceneReferenceSpace");
        *((_QWORD *)&v20 + 1) = v14;
        *(_QWORD *)&v21 = v15;
        objc_msgSend(v12, "timestamp");
        *((_QWORD *)&v21 + 1) = v16;

        -[_UISEGestureFeature incorporateSample:](self->_rootFeature, "incorporateSample:", &v18);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  v17.receiver = self;
  v17.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  -[UIPanGestureRecognizer touchesEnded:withEvent:](&v17, sel_touchesEnded_withEvent_, v6, a4);
}

- (void)setMinimumNumberOfTouches:(unint64_t)a3
{
  objc_super v5;

  -[_UISEGestureFeatureSettings setMinimumNumberOfSubfeatures:](self->_settings, "setMinimumNumberOfSubfeatures:");
  v5.receiver = self;
  v5.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  -[UIPanGestureRecognizer setMinimumNumberOfTouches:](&v5, sel_setMinimumNumberOfTouches_, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreHIDEdgeFlagsAssertionController, 0);
  objc_storeStrong((id *)&self->_mustIgnoreHIDEdgeFlagsAssertion, 0);
  objc_storeStrong((id *)&self->_rootFeature, 0);
  objc_storeStrong(&self->_createFeatureBlock, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

+ (BOOL)_supportsStylusTouches
{
  return 0;
}

- (UIScreenEdgePanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 type:(int64_t)a5 options:(unint64_t)a6
{
  char v6;
  UIScreenEdgePanGestureRecognizer *v8;
  UIScreenEdgePanGestureRecognizer *v9;
  UIScreenEdgePanGestureRecognizer *v10;
  objc_super v12;

  v6 = a6;
  v12.receiver = self;
  v12.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  v8 = -[UIPanGestureRecognizer initWithTarget:action:](&v12, sel_initWithTarget_action_, a3, a4);
  v9 = v8;
  if (v8)
  {
    _commonInit(v8, a5, v6);
    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v9, "setMaximumNumberOfTouches:", 1);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v9, "setDelaysTouchesBegan:", 1);
    v10 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIScreenEdgePanGestureRecognizer)initWithCoder:(id)a3
{
  UIScreenEdgePanGestureRecognizer *v4;
  UIScreenEdgePanGestureRecognizer *v5;
  UIScreenEdgePanGestureRecognizer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  v4 = -[UIPanGestureRecognizer initWithCoder:](&v8, sel_initWithCoder_);
  v5 = v4;
  if (v4)
  {
    _commonInit(v4, 1, 0);
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UIScreenEdgePanGestureRecognizer.edges")))
      -[UIScreenEdgePanGestureRecognizer setEdges:](v5, "setEdges:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("UIScreenEdgePanGestureRecognizer.edges")));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  -[UIPanGestureRecognizer encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeInteger:forKey:", -[UIScreenEdgePanGestureRecognizer edges](self, "edges"), CFSTR("UIScreenEdgePanGestureRecognizer.edges"));
}

- (void)dealloc
{
  _UIAssertion *mustIgnoreHIDEdgeFlagsAssertion;
  _UIAssertionController *ignoreHIDEdgeFlagsAssertionController;
  objc_super v5;

  -[_UIAssertion _invalidate](self->_mustIgnoreHIDEdgeFlagsAssertion, "_invalidate");
  mustIgnoreHIDEdgeFlagsAssertion = self->_mustIgnoreHIDEdgeFlagsAssertion;
  self->_mustIgnoreHIDEdgeFlagsAssertion = 0;

  ignoreHIDEdgeFlagsAssertionController = self->_ignoreHIDEdgeFlagsAssertionController;
  self->_ignoreHIDEdgeFlagsAssertionController = 0;

  v5.receiver = self;
  v5.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  -[UIGestureRecognizer dealloc](&v5, sel_dealloc);
}

- (BOOL)_shouldTryToBeginWithEvent:(id)a3
{
  return -[_UISEGestureFeature state](self->_rootFeature, "state", a3) == 1;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "phase");
        if (v13)
        {
          if (v13 == 3)
          {
            v13 = 2;
          }
          else if (v13 != 1)
          {
            abort();
          }
        }
        *(_QWORD *)&v19 = 0;
        *(_QWORD *)&v18 = v13;
        *((_QWORD *)&v18 + 1) = objc_msgSend(v12, "_edgeAim");
        LOBYTE(v19) = objc_msgSend(v12, "_edgeForceActive");
        *((_QWORD *)&v19 + 1) = objc_msgSend(v12, "_edgeType");
        *(_QWORD *)&v20 = objc_msgSend(v12, "_touchIdentifier");
        objc_msgSend(v12, "_locationInSceneReferenceSpace");
        *((_QWORD *)&v20 + 1) = v14;
        *(_QWORD *)&v21 = v15;
        objc_msgSend(v12, "timestamp");
        *((_QWORD *)&v21 + 1) = v16;

        -[_UISEGestureFeature incorporateSample:](self->_rootFeature, "incorporateSample:", &v18);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  v17.receiver = self;
  v17.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  -[UIPanGestureRecognizer touchesMoved:withEvent:](&v17, sel_touchesMoved_withEvent_, v6, a4);
}

- (double)_bottomEdgeAngleWindow
{
  double result;

  -[_UISEGestureFeatureSettings bottomEdgeAngleWindow](self->_settings, "bottomEdgeAngleWindow");
  return result;
}

- (void)_setBottomEdgeAngleWindow:(double)a3
{
  -[_UISEGestureFeatureSettings setBottomEdgeAngleWindow:](self->_settings, "setBottomEdgeAngleWindow:", a3);
}

- (double)_bottomEdgeRegionSize
{
  double result;

  -[_UISEGestureFeatureSettings bottomEdgeRegionSize](self->_settings, "bottomEdgeRegionSize");
  return result;
}

- (void)_setBottomEdgeRegionSize:(double)a3
{
  -[_UISEGestureFeatureSettings setBottomEdgeRegionSize:](self->_settings, "setBottomEdgeRegionSize:", a3);
}

- (double)_edgeRegionSize
{
  double result;

  -[_UISEGestureFeatureSettings edgeRegionSize](self->_settings, "edgeRegionSize");
  return result;
}

- (void)_setEdgeRegionSize:(double)a3
{
  -[_UISEGestureFeatureSettings setEdgeRegionSize:](self->_settings, "setEdgeRegionSize:", a3);
}

- (void)_resetHystersis
{
  -[UIScreenEdgePanGestureRecognizer _setHysteresis:](self, "_setHysteresis:", 15.0);
}

- (unint64_t)touchedEdges
{
  return self->_touchedEdges;
}

- (id)_beginRequiringIgnoresHIDEdgeFlagsForReason:(id)a3
{
  _UIAssertionController *ignoreHIDEdgeFlagsAssertionController;
  _UIAssertionController *v6;
  _UIAssertionController *v7;

  ignoreHIDEdgeFlagsAssertionController = self->_ignoreHIDEdgeFlagsAssertionController;
  if (!ignoreHIDEdgeFlagsAssertionController)
  {
    v6 = -[_UIAssertionController initWithAssertionSubject:]([_UIAssertionController alloc], "initWithAssertionSubject:", self);
    v7 = self->_ignoreHIDEdgeFlagsAssertionController;
    self->_ignoreHIDEdgeFlagsAssertionController = v6;

    ignoreHIDEdgeFlagsAssertionController = self->_ignoreHIDEdgeFlagsAssertionController;
  }
  return -[_UIAssertionController vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:](ignoreHIDEdgeFlagsAssertionController, "vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:", 1, 1, a3, 0);
}

- (id)debugDictionary
{
  return -[_UISEMuxGestureFeature debugDictionary](self->_rootFeature, "debugDictionary");
}

- (unint64_t)_rootFeatureState
{
  return -[_UISEGestureFeature state](self->_rootFeature, "state");
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  return -[_UISEGestureFeatureSettings ignoreHIDEdgeFlags](self->_settings, "ignoreHIDEdgeFlags", a3);
}

@end
