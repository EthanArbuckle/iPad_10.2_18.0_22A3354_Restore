@implementation _UIPreviewInteractionForceLevelClassifier

- (_UIPreviewInteractionForceLevelClassifier)init
{
  _UIPreviewInteractionForceLevelClassifier *v2;
  _UIPreviewInteractionForceLevelClassifier *v3;
  _UIPreviewInteractionForceLevelClassifier *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewInteractionForceLevelClassifier;
  v2 = -[_UIForceLevelClassifier init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UIPreviewInteractionForceLevelClassifier reset](v2, "reset");
    v4 = v3;
  }

  return v3;
}

- (void)observeTouchWithForceValue:(double)a3 atTimestamp:(double)a4 withCentroidAtLocation:(CGPoint)a5
{
  double y;
  double x;
  _UIPreviewInteractionStateRecognizer *stateRecognizer;
  _UIPreviewInteractionStateRecognizer *v11;
  _UIPreviewInteractionStateRecognizer *v12;
  int64_t v13;
  int64_t v14;

  y = a5.y;
  x = a5.x;
  stateRecognizer = self->_stateRecognizer;
  if (!stateRecognizer)
  {
    v11 = objc_alloc_init(_UIPreviewInteractionStateRecognizer);
    v12 = self->_stateRecognizer;
    self->_stateRecognizer = v11;

    stateRecognizer = self->_stateRecognizer;
  }
  -[_UIPreviewInteractionStateRecognizer evaluateWithTouchForce:atTimestamp:withCentroidAtLocation:](stateRecognizer, "evaluateWithTouchForce:atTimestamp:withCentroidAtLocation:", a3, a4, x, y);
  v13 = -[_UIPreviewInteractionStateRecognizer currentState](self->_stateRecognizer, "currentState");
  if ((unint64_t)(v13 - 1) >= 3)
    v14 = 0;
  else
    v14 = v13;
  -[_UIForceLevelClassifier setCurrentForceLevel:](self, "setCurrentForceLevel:", v14);
}

- (void)reset
{
  _UIPreviewInteractionStateRecognizer *stateRecognizer;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewInteractionForceLevelClassifier;
  -[_UIForceLevelClassifier reset](&v4, sel_reset);
  stateRecognizer = self->_stateRecognizer;
  self->_stateRecognizer = 0;

  -[_UIForceLevelClassifier setCurrentForceLevel:](self, "setCurrentForceLevel:", 0);
}

- (BOOL)wantsUnclampedForceValues
{
  return 1;
}

- (id)transformerFromTouchForceMessageToProgressToForceLevel:(int64_t)a3 minimumRequiredForceLevel:(int64_t)a4
{
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9[2];
  id location;

  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0CB3810];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __126___UIPreviewInteractionForceLevelClassifier_transformerFromTouchForceMessageToProgressToForceLevel_minimumRequiredForceLevel___block_invoke;
  v8[3] = &unk_1E16C9860;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  objc_msgSend(v5, "mapValuesWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateRecognizer, 0);
}

@end
