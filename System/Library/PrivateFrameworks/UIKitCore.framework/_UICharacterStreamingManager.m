@implementation _UICharacterStreamingManager

- (_UICharacterStreamingManager)initWithTextView:(id)a3
{
  id v4;
  _UICharacterStreamingManager *v5;
  _UICharacterStreamingManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UICharacterStreamingManager;
  v5 = -[_UICharacterStreamingManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_textView, v4);
    *(_OWORD *)&v6->_streamingCharacterInsertionRate = xmmword_186684A60;
  }

  return v6;
}

- (void)commitFinalResults
{
  self->_committingFinalResults = 1;
  if (!self->_streamingAnimationActive)
  {
    -[_UICharacterStreamingManager setTargetHypothesis:](self, "setTargetHypothesis:", 0);
    -[_UICharacterStreamingManager setLastHypothesis:](self, "setLastHypothesis:", 0);
    -[_UICharacterStreamingManager setPendingEdits:](self, "setPendingEdits:", 0);
  }
}

- (void)setWords:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  self->_committingFinalResults = 0;
  objc_msgSend(a3, "componentsJoinedByString:", &stru_1E16EDF20);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_UICharacterStreamingManager previousHypothesis](self, "previousHypothesis");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        -[_UICharacterStreamingManager previousHypothesis](self, "previousHypothesis"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v8, "isEqualToString:", v6),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    -[_UICharacterStreamingManager setupToInsertResultForNewHypothesis:](self, "setupToInsertResultForNewHypothesis:", v8);
    -[_UICharacterStreamingManager setPreviousHypothesis:](self, "setPreviousHypothesis:", v8);
  }

}

- (void)_stopStreamingAnimation
{
  CADisplayLink *streamingAnimationDisplayLink;

  -[CADisplayLink invalidate](self->_streamingAnimationDisplayLink, "invalidate");
  streamingAnimationDisplayLink = self->_streamingAnimationDisplayLink;
  self->_streamingAnimationDisplayLink = 0;

  self->_streamingAnimationActive = 0;
  if (self->_committingFinalResults)
  {
    -[_UICharacterStreamingManager setTargetHypothesis:](self, "setTargetHypothesis:", 0);
    -[_UICharacterStreamingManager setLastHypothesis:](self, "setLastHypothesis:", 0);
    -[_UICharacterStreamingManager setPendingEdits:](self, "setPendingEdits:", 0);
  }
}

- (void)_startStreamingAnimations
{
  void *v3;
  CADisplayLink *v4;
  CADisplayLink *streamingAnimationDisplayLink;
  CADisplayLink *v6;
  void *v7;
  CADisplayLink *v8;
  void *v9;

  if (!self->_streamingAnimationActive)
  {
    self->_streamingAnimationActive = 1;
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
    v4 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    streamingAnimationDisplayLink = self->_streamingAnimationDisplayLink;
    self->_streamingAnimationDisplayLink = v4;

    v6 = self->_streamingAnimationDisplayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v6, "addToRunLoop:forMode:", v7, *MEMORY[0x1E0C99860]);

    v8 = self->_streamingAnimationDisplayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v8, "addToRunLoop:forMode:", v9, CFSTR("UITrackingRunLoopMode"));

    self->_lastAnimationUpdateTimeStamp = CACurrentMediaTime();
  }
}

- (void)_displayLinkFired:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  unint64_t v46;
  void *v47;
  double minDurationBetweenHypotheses;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id obj;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!self->_streamingAnimationActive)
    goto LABEL_37;
  objc_msgSend(v5, "timestamp");
  v8 = v7 - self->_lastAnimationUpdateTimeStamp;
  -[_UICharacterStreamingManager pendingEdits](self, "pendingEdits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {
    -[_UICharacterStreamingManager lastHypothesis](self, "lastHypothesis");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v47, "length"))
    {
      minDurationBetweenHypotheses = self->_minDurationBetweenHypotheses;

      if (v8 < minDurationBetweenHypotheses)
        goto LABEL_37;
      goto LABEL_4;
    }

  }
LABEL_4:
  -[_UICharacterStreamingManager targetHypothesis](self, "targetHypothesis");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICharacterStreamingManager lastHypothesis](self, "lastHypothesis");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
  {
    -[_UICharacterStreamingManager pendingEdits](self, "pendingEdits");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
    {
      -[_UICharacterStreamingManager _stopStreamingAnimation](self, "_stopStreamingAnimation");
      goto LABEL_37;
    }
  }
  else
  {

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "selectedTextRange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "start");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICharacterStreamingManager lastHypothesis](self, "lastHypothesis");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "positionFromPosition:offset:", v16, -objc_msgSend(v17, "length"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(WeakRetained, "beginningOfDocument");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v18 && v16)
  {
    objc_msgSend(WeakRetained, "textRangeFromPosition:toPosition:", v18, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isEmpty") & 1) != 0)
    {
      v60 = v19;
      -[_UICharacterStreamingManager pendingEdits](self, "pendingEdits");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (!v21)
      {
        -[_UICharacterStreamingManager lastHypothesis](self, "lastHypothesis");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UICharacterStreamingManager targetHypothesis](self, "targetHypothesis");
        v23 = v18;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[_EditScriptRanged editScriptFromString:toString:chunkSize:orderAtomsAscending:operationPrecedence:options:](_EditScriptRanged, "editScriptFromString:toString:chunkSize:orderAtomsAscending:operationPrecedence:options:", v22, v24, 0, 1, -1, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "script");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v26, "mutableCopy");

        -[_UICharacterStreamingManager setPendingEdits:](self, "setPendingEdits:", v27);
        v18 = v23;

      }
      -[_UICharacterStreamingManager pendingEdits](self, "pendingEdits");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");

      if (!v29)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UICharacterStreamingManager lastHypothesis](self, "lastHypothesis");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UICharacterStreamingManager targetHypothesis](self, "targetHypothesis");
        v53 = v18;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextView.m"), 356, CFSTR("Ran out of edits but we're still not done yet\n%@\n%@"), v52, v54);

        v18 = v53;
      }
      v30 = (unint64_t)(v8 * self->_streamingCharacterInsertionRate);
      v19 = v60;
      if (v30)
      {
        v58 = v18;
        v59 = v6;
        objc_msgSend(v6, "timestamp");
        self->_lastAnimationUpdateTimeStamp = v31;
        -[_UICharacterStreamingManager lastHypothesis](self, "lastHypothesis");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v32, "mutableCopy");

        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        -[_UICharacterStreamingManager pendingEdits](self, "pendingEdits");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
        if (v34)
        {
          v35 = v34;
          v55 = v16;
          v56 = v15;
          v57 = WeakRetained;
          v36 = 0;
          v37 = *(_QWORD *)v63;
LABEL_20:
          v38 = 0;
          v39 = v36;
          while (1)
          {
            v40 = v38;
            if (*(_QWORD *)v63 != v37)
              objc_enumerationMutation(obj);
            v41 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v38);
            v42 = objc_msgSend(v41, "editRange");
            v44 = v43;
            objc_msgSend(v41, "replacementText");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "replaceCharactersInRange:withString:", v42, v44, v45);

            v46 = v39 + v40 + 1;
            if (v46 >= v30)
              break;
            v38 = v40 + 1;
            if (v35 == v40 + 1)
            {
              v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
              v36 = v39 + v38;
              if (v35)
                goto LABEL_20;
              v46 = v39 + v40 + 1;
              break;
            }
          }
          v15 = v56;
          WeakRetained = v57;
          v16 = v55;
          v19 = v60;
        }
        else
        {
          v46 = 0;
        }

        -[_UICharacterStreamingManager pendingEdits](self, "pendingEdits");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "removeObjectsInRange:", 0, v46);

        objc_msgSend(WeakRetained, "replaceRange:withText:", v19, v33);
        -[_UICharacterStreamingManager setLastHypothesis:](self, "setLastHypothesis:", v33);

        v18 = v58;
        v6 = v59;
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "replaceRange:withText:", v15, &stru_1E16EDF20);
      objc_msgSend(WeakRetained, "textRangeFromPosition:toPosition:", v16, v16);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setSelectedTextRange:", v49);

    }
  }

LABEL_37:
}

- (void)setupToInsertResultForNewHypothesis:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_streamingAnimationActive)
  {
    -[_UICharacterStreamingManager setTargetHypothesis:](self, "setTargetHypothesis:", v4);
  }
  else
  {
    -[_UICharacterStreamingManager lastHypothesis](self, "lastHypothesis");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[_UICharacterStreamingManager setLastHypothesis:](self, "setLastHypothesis:", &stru_1E16EDF20);
    -[_UICharacterStreamingManager setTargetHypothesis:](self, "setTargetHypothesis:", v6);
    -[_UICharacterStreamingManager _startStreamingAnimations](self, "_startStreamingAnimations");
  }

}

- (NSString)previousHypothesis
{
  return self->_previousHypothesis;
}

- (void)setPreviousHypothesis:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)lastHypothesis
{
  return self->_lastHypothesis;
}

- (void)setLastHypothesis:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)targetHypothesis
{
  return self->_targetHypothesis;
}

- (void)setTargetHypothesis:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSMutableArray)pendingEdits
{
  return self->_pendingEdits;
}

- (void)setPendingEdits:(id)a3
{
  objc_storeStrong((id *)&self->_pendingEdits, a3);
}

- (double)streamingCharacterInsertionRate
{
  return self->_streamingCharacterInsertionRate;
}

- (void)setStreamingCharacterInsertionRate:(double)a3
{
  self->_streamingCharacterInsertionRate = a3;
}

- (double)minDurationBetweenHypotheses
{
  return self->_minDurationBetweenHypotheses;
}

- (void)setMinDurationBetweenHypotheses:(double)a3
{
  self->_minDurationBetweenHypotheses = a3;
}

- (BOOL)discardNextHypothesis
{
  return self->_discardNextHypothesis;
}

- (void)setDiscardNextHypothesis:(BOOL)a3
{
  self->_discardNextHypothesis = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEdits, 0);
  objc_storeStrong((id *)&self->_targetHypothesis, 0);
  objc_storeStrong((id *)&self->_lastHypothesis, 0);
  objc_storeStrong((id *)&self->_previousHypothesis, 0);
  objc_storeStrong((id *)&self->_streamingAnimationDisplayLink, 0);
  objc_destroyWeak((id *)&self->_textView);
}

@end
