@implementation _UIKeyboardFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (void)actionOccurred:(int64_t)a3
{
  -[_UIKeyboardFeedbackGenerator actionOccurred:atLocation:](self, "actionOccurred:atLocation:", a3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)actionOccurred:(int64_t)a3 atLocation:(CGPoint)a4
{
  -[_UIKeyboardFeedbackGenerator _playFeedbackForActionType:withCustomization:](self, "_playFeedbackForActionType:withCustomization:", a3, 0, a4.x, a4.y);
}

- (float)scaleVolumeSlow:(float)a3 fast:(float)a4 timeSpan:(double)a5
{
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  float result;
  float v16;
  float v17;

  -[_UIKeyboardFeedbackGenerator _keyboardConfiguration](self, "_keyboardConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "slowTypingTime");
  v11 = v10;

  -[_UIKeyboardFeedbackGenerator _keyboardConfiguration](self, "_keyboardConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fastTypingTime");
  v14 = v13;

  result = (a5 - v14) / (v11 - v14) * (float)(a3 - a4) + a4;
  if (a3 >= a4)
    v16 = a4;
  else
    v16 = a3;
  if (a3 >= a4)
    v17 = a3;
  else
    v17 = a4;
  if (v16 >= result)
    result = v16;
  if (v17 <= result)
    return v17;
  return result;
}

- (id)_feedbackWithUpdatedVolume:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double lastTypedKeyTimestamp;
  double v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  double v18;
  double v19;
  float v20;
  float v21;
  double v22;
  double v23;
  float v24;
  float v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  double v31;

  v4 = a3;
  -[_UIKeyboardFeedbackGenerator _keyboardConfiguration](self, "_keyboardConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fastTypingVolumeMultiplier");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v9 = v8;
  lastTypedKeyTimestamp = self->_lastTypedKeyTimestamp;
  if (lastTypedKeyTimestamp > 0.0)
  {
    v11 = v9 - lastTypedKeyTimestamp;
    objc_msgSend(v4, "audioParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "volume");
    v14 = v13;

    objc_msgSend(v4, "hapticParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "volume");
    v17 = v16;

    v18 = v7 * v14;
    *(float *)&v19 = v18;
    *(float *)&v18 = v14;
    -[_UIKeyboardFeedbackGenerator scaleVolumeSlow:fast:timeSpan:](self, "scaleVolumeSlow:fast:timeSpan:", v18, v19, v11);
    v21 = v20;
    v22 = v7 * v17;
    *(float *)&v23 = v22;
    *(float *)&v22 = v17;
    -[_UIKeyboardFeedbackGenerator scaleVolumeSlow:fast:timeSpan:](self, "scaleVolumeSlow:fast:timeSpan:", v22, v23, v11);
    if (v21 != v14 || v24 != v17)
    {
      v26 = v24;
      v27 = (void *)objc_msgSend(v4, "copy");

      objc_msgSend(v27, "audioParameters");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v29 = v21;
      objc_msgSend(v28, "setVolume:", v29);

      objc_msgSend(v27, "hapticParameters");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v31 = v26;
      objc_msgSend(v30, "setVolume:", v31);

      v4 = v27;
    }
  }
  self->_lastTypedKeyTimestamp = v9;
  return v4;
}

- (void)_playFeedbackForActionType:(int64_t)a3 withCustomization:(id)a4
{
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  int v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, uint64_t))a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  -[_UIKeyboardFeedbackGenerator _keyboardConfiguration](self, "_keyboardConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "feedbacks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "_individualFeedbacks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 >= 2)
    {
      +[_UIFeedbackPreferences sharedPreferences](_UIFeedbackPreferences, "sharedPreferences");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "enabledFeedbackTypesForCategory:", 0x1E171F900);

      if ((unint64_t)(v15 - 1) <= 1)
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v11, "_individualFeedbacks", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v27;
          while (2)
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v27 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              if (objc_msgSend(v21, "_effectivePlayableFeedbackTypes") == v15)
              {
                v22 = v21;

                v11 = v22;
                goto LABEL_14;
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
            if (v18)
              continue;
            break;
          }
        }
LABEL_14:

      }
    }
    if (v7)
    {
      v23 = objc_msgSend(v11, "copy");

      v7[2](v7, v23);
    }
    else
    {
      -[_UIKeyboardFeedbackGenerator _keyboardConfiguration](self, "_keyboardConfiguration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "scalingForSpeedEnabled");

      if (!v25)
      {
LABEL_20:
        -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v11, 1.79769313e308, 1.79769313e308);

        goto LABEL_21;
      }
      -[_UIKeyboardFeedbackGenerator _feedbackWithUpdatedVolume:](self, "_feedbackWithUpdatedVolume:", v11);
      v23 = objc_claimAutoreleasedReturnValue();

    }
    v11 = (void *)v23;
    goto LABEL_20;
  }
LABEL_21:

}

- (double)_autoDeactivationTimeout
{
  return 0.0;
}

- (id)_stats_key
{
  return CFSTR("keyboard");
}

- (double)_lastTypedKeyTimestamp
{
  return self->_lastTypedKeyTimestamp;
}

- (void)_setLastTypedKeyTimestamp:(double)a3
{
  self->_lastTypedKeyTimestamp = a3;
}

@end
