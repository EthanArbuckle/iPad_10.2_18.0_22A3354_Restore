@implementation UIKBHandwritingInputSpeedModel

- (UIKBHandwritingInputSpeedModel)init
{
  UIKBHandwritingInputSpeedModel *v2;
  uint64_t v3;
  NSMutableArray *recordedIntervals;
  uint64_t v5;
  NSMutableArray *recordedSpeeds;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBHandwritingInputSpeedModel;
  v2 = -[UIKBHandwritingInputSpeedModel init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    recordedIntervals = v2->_recordedIntervals;
    v2->_recordedIntervals = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    recordedSpeeds = v2->_recordedSpeeds;
    v2->_recordedSpeeds = (NSMutableArray *)v5;

    -[UIKBHandwritingInputSpeedModel updatePreferences](v2, "updatePreferences");
  }
  return v2;
}

- (void)beginStroke
{
  NSMutableArray *v3;
  NSMutableArray *pointsCurrentStroke;
  double v5;
  double v6;
  NSMutableArray *recordedIntervals;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  pointsCurrentStroke = self->_pointsCurrentStroke;
  self->_pointsCurrentStroke = v3;

  if (self->_lastStrokeTimeStamp != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v6 = v5 - self->_lastStrokeTimeStamp;

    recordedIntervals = self->_recordedIntervals;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmin(v6, 1.0));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray insertObject:atIndex:](recordedIntervals, "insertObject:atIndex:");

  }
}

- (void)addPoint:(CGPoint)a3 timestamp:(double)a4
{
  double y;
  double x;
  _UIKBHandwritingInputSpeedModelPoint *v8;

  y = a3.y;
  x = a3.x;
  v8 = objc_alloc_init(_UIKBHandwritingInputSpeedModelPoint);
  -[_UIKBHandwritingInputSpeedModelPoint setLocation:](v8, "setLocation:", x, y);
  -[_UIKBHandwritingInputSpeedModelPoint setTimestamp:](v8, "setTimestamp:", a4);
  -[NSMutableArray addObject:](self->_pointsCurrentStroke, "addObject:", v8);

}

- (void)endStroke
{
  double v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_lastStrokeTimeStamp = v3;
}

- (void)endCharacter
{
  double v3;
  NSMutableArray *v4;
  NSMutableArray *recordedIntervals;
  NSMutableArray *v6;
  NSMutableArray *recordedSpeeds;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_lastStrokeTimeStamp = v3;
  if ((unint64_t)-[NSMutableArray count](self->_recordedIntervals, "count") >= 0x81)
  {
    -[NSMutableArray subarrayWithRange:](self->_recordedIntervals, "subarrayWithRange:", 0, 64);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (NSMutableArray *)objc_msgSend(v8, "mutableCopy");
    recordedIntervals = self->_recordedIntervals;
    self->_recordedIntervals = v4;

  }
  if ((unint64_t)-[NSMutableArray count](self->_recordedSpeeds, "count") >= 0x81)
  {
    -[NSMutableArray subarrayWithRange:](self->_recordedSpeeds, "subarrayWithRange:", 0, 64);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (NSMutableArray *)objc_msgSend(v9, "mutableCopy");
    recordedSpeeds = self->_recordedSpeeds;
    self->_recordedSpeeds = v6;

  }
}

- (double)speedForCurrentStroke
{
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  if ((unint64_t)-[NSMutableArray count](self->_pointsCurrentStroke, "count") >= 2)
  {
    -[NSMutableArray lastObject](self->_pointsCurrentStroke, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    v6 = v5;
    -[NSMutableArray firstObject](self->_pointsCurrentStroke, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timestamp");
    v9 = v6 - v8;

    if (v9 > 0.0)
    {
      -[NSMutableArray firstObject](self->_pointsCurrentStroke, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "location");
      v12 = v11;
      v14 = v13;

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v15 = self->_pointsCurrentStroke;
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v26;
        v18 = 0.0;
        do
        {
          v19 = 0;
          v20 = v12;
          v21 = v14;
          do
          {
            if (*(_QWORD *)v26 != v17)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v19), "location", (_QWORD)v25);
            v12 = v22;
            v14 = v23;
            v18 = v18 + hypot(v20 - v22, v21 - v23);
            ++v19;
            v20 = v12;
            v21 = v14;
          }
          while (v16 != v19);
          v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v16);
      }
      else
      {
        v18 = 0.0;
      }

      return v18 / v9;
    }
  }
  return v3;
}

- (double)smoothValueFromArray:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t i;
  double v10;
  void *v11;
  double v12;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 >= 0x14)
    v5 = 20;
  else
    v5 = v4;
  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      v10 = -[UIKBHandwritingInputSpeedModel smoothValueFromArray:]::gaussian[i];
      objc_msgSend(v3, "objectAtIndex:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v8 = v8 + v10;
      v7 = v7 + v10 * v12;

    }
  }
  if (v8 > 0.0)
    v6 = v7 / v8;

  return v6;
}

- (double)timeoutForNextPage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSMutableArray *recordedSpeeds;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  -[UIKBHandwritingInputSpeedModel maxTimeout](self, "maxTimeout");
  v4 = v3;
  if (-[NSMutableArray count](self->_recordedIntervals, "count"))
  {
    -[UIKBHandwritingInputSpeedModel smoothValueFromArray:](self, "smoothValueFromArray:", self->_recordedIntervals);
    if (v5 > 0.0)
    {
      v6 = v5;
      -[UIKBHandwritingInputSpeedModel handwritingFrame](self, "handwritingFrame");
      v8 = v7;
      -[UIKBHandwritingInputSpeedModel handwritingFrame](self, "handwritingFrame");
      if (v8 >= v9)
        v8 = v9;
      if (v8 > 0.0)
      {
        -[UIKBHandwritingInputSpeedModel speedForCurrentStroke](self, "speedForCurrentStroke");
        recordedSpeeds = self->_recordedSpeeds;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11 / v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray insertObject:atIndex:](recordedSpeeds, "insertObject:atIndex:", v12, 0);

        -[UIKBHandwritingInputSpeedModel smoothValueFromArray:](self, "smoothValueFromArray:", self->_recordedSpeeds);
        v14 = v6 * ((1.0 - 1.0 / (exp(-(v13 + -2.0)) + 1.0)) * 4.6 + 0.9);
        -[UIKBHandwritingInputSpeedModel maxTimeout](self, "maxTimeout");
        v16 = v15;
        -[UIKBHandwritingInputSpeedModel minTimeout](self, "minTimeout");
        if (v14 >= v17)
          v17 = v14;
        if (v16 >= v17)
          return v17;
        else
          return v16;
      }
    }
  }
  return v4;
}

- (void)updatePreferences
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  id v11;
  id v12;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_autoConfirmationEnabled = objc_msgSend(v3, "BOOLForPreferenceKey:", CFSTR("HandwritingAutoConfirmationEnabled"));

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForPreferenceKey:", CFSTR("HandwritingAutoConfirmationMinTimeout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  self->_minTimeout = v6;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferencesActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForPreferenceKey:", CFSTR("HandwritingAutoConfirmationMaxTimeout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  self->_maxTimeout = v9;

}

- (BOOL)autoConfirmationEnabled
{
  return self->_autoConfirmationEnabled;
}

- (double)minTimeout
{
  return self->_minTimeout;
}

- (double)maxTimeout
{
  return self->_maxTimeout;
}

- (CGRect)handwritingFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_handwritingFrame.origin.x;
  y = self->_handwritingFrame.origin.y;
  width = self->_handwritingFrame.size.width;
  height = self->_handwritingFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setHandwritingFrame:(CGRect)a3
{
  self->_handwritingFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointsCurrentStroke, 0);
  objc_storeStrong((id *)&self->_recordedSpeeds, 0);
  objc_storeStrong((id *)&self->_recordedIntervals, 0);
}

@end
