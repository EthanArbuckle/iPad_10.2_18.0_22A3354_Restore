@implementation _UIKBRTTouchVelocities

- (id)recognizer:(id)a3 confidenceWhenPendingTouchInfo:(id)a4
{
  return 0;
}

- (id)recognizer:(id)a3 confidenceWhenSettingTouchInfo:(id)a4
{
  id v4;
  _UIKBRTConfidenceLevels *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = a4;
  v5 = objc_alloc_init(_UIKBRTConfidenceLevels);
  v6 = objc_msgSend(v4, "preRuleTouchState");
  if (v6 == 7 || v6 == 1)
  {
    LODWORD(v7) = 0;
    -[_UIKBRTConfidenceLevels setTouchConfidence:](v5, "setTouchConfidence:", v7);
    objc_msgSend(v4, "currentZGradient");
    if (v11 <= 1.0)
      v10 = 0.5;
    else
      v10 = 1.0 - v11 * 0.5;
    *(float *)&v10 = v10;
    goto LABEL_12;
  }
  if (!v6)
  {
    objc_msgSend(v4, "currentZGradient");
    if (v8 <= 1.0)
      v9 = 0.5;
    else
      v9 = v8 * 0.5;
    *(float *)&v9 = v9;
    -[_UIKBRTConfidenceLevels setTouchConfidence:](v5, "setTouchConfidence:", v9);
    LODWORD(v10) = 0;
LABEL_12:
    -[_UIKBRTConfidenceLevels setRestConfidence:](v5, "setRestConfidence:", v10);
  }

  return v5;
}

@end
