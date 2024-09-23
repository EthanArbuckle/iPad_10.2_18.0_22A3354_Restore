@implementation PTEffectReactionProvider

- (BOOL)runGestureDetectionForTimeStamp:(id *)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  float v7;
  float gestureDetectionFPS;
  float v9;
  BOOL v10;
  float v11;
  $95D729B680665BEAEFA1D6FCA8238556 lastFrameTimeStamp;
  CMTime lhs;
  CMTime time;

  if ((a3->var2 & 1) == 0)
  {
    _PTLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[PTEffectReactionProvider runGestureDetectionForTimeStamp:].cold.1(v3, v4, v5);

    return 1;
  }
  if ((self->_lastFrameTimeStamp.flags & 1) == 0)
    return 1;
  lhs = *(CMTime *)a3;
  lastFrameTimeStamp = self->_lastFrameTimeStamp;
  CMTimeSubtract(&time, &lhs, (CMTime *)&lastFrameTimeStamp);
  v7 = CMTimeGetSeconds(&time) * 1000.0;
  gestureDetectionFPS = self->_gestureDetectionFPS;
  if (gestureDetectionFPS < 0.01)
    gestureDetectionFPS = 0.01;
  v9 = 1000.0 / gestureDetectionFPS;
  v10 = gestureDetectionFPS < 30.0;
  v11 = 33.333;
  if (v10)
    v11 = v9;
  return v11 <= v7;
}

- (NSArray)latestReactions
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (PTEffectReactionProvider)initWithFrameSize:(CGSize)a3 sharedResources:(id)a4 asyncInitQueue:(id)a5 externalHandDetectionsEnabled:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  id v11;
  id v12;
  PTEffectReactionProvider *v13;
  PTEffectReactionProvider *v14;
  uint64_t v15;
  NSMutableDictionary *personIdentifierToPerson;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  PTHandGestureDetector *gestureDetector;
  PTHandGestureDetector *v26;
  PTHandGestureDetector *v27;
  uint64_t v28;
  PTEffectReactionProvider *v29;
  objc_super v31;

  v6 = a6;
  height = a3.height;
  width = a3.width;
  v11 = a4;
  v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)PTEffectReactionProvider;
  v13 = -[PTEffectReactionProvider init](&v31, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_gestureDetectionFPS = 5.0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    personIdentifierToPerson = v14->_personIdentifierToPerson;
    v14->_personIdentifierToPerson = (NSMutableDictionary *)v15;

    v14->_globalTriggerID = 0;
    objc_msgSend(v11, "handGestureDetector");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(v11, "handGestureDetector");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frameSize");
      if (v20 == width)
      {
        objc_msgSend(v11, "handGestureDetector");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "frameSize");
        v23 = v22;

        if (v23 == height)
        {
          objc_msgSend(v11, "handGestureDetector");
          v24 = objc_claimAutoreleasedReturnValue();
          gestureDetector = v14->_gestureDetector;
          v14->_gestureDetector = (PTHandGestureDetector *)v24;

LABEL_8:
          -[PTHandGestureDetector setDelegate:](v14->_gestureDetector, "setDelegate:", v14);
          v28 = MEMORY[0x1E0CA2E18];
          *(_OWORD *)&v14->_lastFrameTimeStamp.value = *MEMORY[0x1E0CA2E18];
          v14->_lastFrameTimeStamp.epoch = *(_QWORD *)(v28 + 16);
          v29 = v14;
          goto LABEL_9;
        }
      }
      else
      {

      }
    }
    v26 = -[PTHandGestureDetector initWithFrameSize:asyncInitQueue:externalHandDetectionsEnabled:]([PTHandGestureDetector alloc], "initWithFrameSize:asyncInitQueue:externalHandDetectionsEnabled:", v12, v6, width, height);
    v27 = v14->_gestureDetector;
    v14->_gestureDetector = v26;

    objc_msgSend(v11, "setHandGestureDetector:", v14->_gestureDetector);
    goto LABEL_8;
  }
LABEL_9:

  return v14;
}

- (void)updateWithFrame:(__CVBuffer *)a3 withTimeStamp:(id *)a4 withRotationDegrees:(int)a5 withDetectedHands:(id)a6 withDetectedFaces:(id)a7 asyncWork:(id)a8
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  PTHandGestureDetector *gestureDetector;
  __int128 v18;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19;

  v10 = *(_QWORD *)&a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v19 = *a4;
  if (-[PTEffectReactionProvider runGestureDetectionForTimeStamp:](self, "runGestureDetectionForTimeStamp:", &v19))
  {
    gestureDetector = self->_gestureDetector;
    v19 = *a4;
    if (-[PTHandGestureDetector detectGesturesFromBuffer:timeStamp:withRotationDegrees:withDetectedHands:withDetectedFaces:asyncWork:](gestureDetector, "detectGesturesFromBuffer:timeStamp:withRotationDegrees:withDetectedHands:withDetectedFaces:asyncWork:", a3, &v19, v10, v14, v15, v16))
    {
      v18 = *(_OWORD *)&a4->var0;
      self->_lastFrameTimeStamp.epoch = a4->var3;
      *(_OWORD *)&self->_lastFrameTimeStamp.value = v18;
    }
  }

}

- (void)gesturesAvailable:(id)a3 forTimeStamp:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  PTEffectReactionProvider *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  NSMutableDictionary *personIdentifierToPerson;
  void *v20;
  void *v21;
  PTPersonWithReactions *v22;
  PTPersonWithReactions *v23;
  void *v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  NSObject *v41;
  void *v42;
  int v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  void *v65;
  PTEffectReactionProvider *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77;
  char v78[15];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  uint8_t v84[128];
  uint8_t buf[16];
  int64_t var3;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PTEffectReactionProvider setLatestGestures:](self, "setLatestGestures:", v5);
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v67 = self;
  -[NSMutableDictionary allValues](self->_personIdentifierToPerson, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v80 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "setNumFramesInactive:", objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "numFramesInactive") + 1);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
    }
    while (v8);
  }

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  if (objc_msgSend(v5, "count"))
  {
    v12 = 0;
    v13 = MEMORY[0x1E0C9AAA0];
    do
    {
      objc_msgSend(v11, "addObject:", v13);
      ++v12;
    }
    while (objc_msgSend(v5, "count") > v12);
  }
  v14 = v67;
  v68 = v11;
  if (objc_msgSend(v5, "count"))
  {
    v15 = 0;
    v16 = 1;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "intValue");

      if (v18)
      {
        ++v15;
      }
      else
      {
        personIdentifierToPerson = v14->_personIdentifierToPerson;
        objc_msgSend(v5, "objectAtIndexedSubscript:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "personID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](personIdentifierToPerson, "objectForKeyedSubscript:", v21);
        v22 = (PTPersonWithReactions *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          -[PTPersonWithReactions setNumFramesInactive:](v22, "setNumFramesInactive:", 0);
        }
        else
        {
          v23 = [PTPersonWithReactions alloc];
          objc_msgSend(v5, "objectAtIndexedSubscript:", v15);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "personID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[PTPersonWithReactions initWithIdentifier:](v23, "initWithIdentifier:", v25);

          -[PTPersonWithReactions setReactionTriggerID:](v22, "setReactionTriggerID:", &v67->_globalTriggerID);
          v26 = v14->_personIdentifierToPerson;
          -[PTPersonWithReactions identifier](v22, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v22, v27);

          _PTLogSystem();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            -[PTPersonWithReactions identifier](v22, "identifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "intValue");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v30;
            _os_log_impl(&dword_1C9281000, v28, OS_LOG_TYPE_INFO, "ReactionProvider: Created person %i", buf, 8u);

          }
        }
        v31 = 0;
        if (objc_msgSend(v5, "count") > v15 + 1)
        {
          v32 = v16;
          do
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "personID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectAtIndexedSubscript:", v15);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "personID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34 == v36)
            {
              objc_msgSend(v5, "objectAtIndexedSubscript:", v32);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              v38 = objc_msgSend(v37, "handChirality");
              objc_msgSend(v5, "objectAtIndexedSubscript:", v15);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v39, "handChirality");

              if (v38 == v40)
              {
                _PTLogSystem();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                  -[PTEffectReactionProvider gesturesAvailable:forTimeStamp:].cold.1(&v77, v78, v41);

              }
              objc_msgSend(v68, "setObject:atIndexedSubscript:", MEMORY[0x1E0C9AAB0], v32);
              v31 = v37;
            }
            ++v32;
          }
          while (objc_msgSend(v5, "count") > v32);
        }
        objc_msgSend(v5, "objectAtIndexedSubscript:", v15);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "handChirality");

        if (v43 == 1)
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v15);
          v44 = (id)objc_claimAutoreleasedReturnValue();
          v45 = v31;
        }
        else
        {
          v44 = v31;
          objc_msgSend(v5, "objectAtIndexedSubscript:", v15);
          v45 = (id)objc_claimAutoreleasedReturnValue();
        }
        v46 = v45;
        ++v15;
        *(_OWORD *)buf = *(_OWORD *)&a4->var0;
        var3 = a4->var3;
        -[PTPersonWithReactions updateWithLeftHand:rightHand:timeStamp:](v22, "updateWithLeftHand:rightHand:timeStamp:", v44, v45, buf);

        v14 = v67;
        v11 = v68;
      }
      ++v16;
    }
    while (objc_msgSend(v5, "count") > v15);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[NSMutableDictionary allValues](v14->_personIdentifierToPerson, "allValues");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v50; ++j)
      {
        if (*(_QWORD *)v74 != v51)
          objc_enumerationMutation(v48);
        v53 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
        if ((int)objc_msgSend(v53, "numFramesInactive") >= 3)
        {
          objc_msgSend(v53, "identifier");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObject:", v54);

          _PTLogSystem();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v53, "identifier");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v56, "intValue");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v57;
            _os_log_impl(&dword_1C9281000, v55, OS_LOG_TYPE_INFO, "ReactionProvider: Removed person %i", buf, 8u);

          }
        }
      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
    }
    while (v50);
  }

  if (objc_msgSend(v47, "count"))
    -[NSMutableDictionary removeObjectsForKeys:](v67->_personIdentifierToPerson, "removeObjectsForKeys:", v47);
  v58 = -[NSMutableDictionary count](v67->_personIdentifierToPerson, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3 * v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  -[NSMutableDictionary allValues](v67->_personIdentifierToPerson, "allValues");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v70;
    do
    {
      for (k = 0; k != v62; ++k)
      {
        if (*(_QWORD *)v70 != v63)
          objc_enumerationMutation(v60);
        objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * k), "reactions");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "addObjectsFromArray:", v65);

      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
    }
    while (v62);
  }

  -[PTEffectReactionProvider setLatestReactions:](v67, "setLatestReactions:", v59);
}

- (float)gestureDetectionFPS
{
  return self->_gestureDetectionFPS;
}

- (void)setGestureDetectionFPS:(float)a3
{
  self->_gestureDetectionFPS = a3;
}

- (NSArray)latestGestures
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLatestGestures:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setLatestReactions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestReactions, 0);
  objc_storeStrong((id *)&self->_latestGestures, 0);
  objc_storeStrong((id *)&self->_gestureDetector, 0);
  objc_storeStrong((id *)&self->_personIdentifierToPerson, 0);
}

- (void)runGestureDetectionForTimeStamp:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_2_0(&dword_1C9281000, a1, a3, "Invalid timestamp", v3);
}

- (void)gesturesAvailable:(NSObject *)a3 forTimeStamp:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_2_0(&dword_1C9281000, a3, (uint64_t)a3, "Both hands of current person have the same chirality!", a1);
}

@end
