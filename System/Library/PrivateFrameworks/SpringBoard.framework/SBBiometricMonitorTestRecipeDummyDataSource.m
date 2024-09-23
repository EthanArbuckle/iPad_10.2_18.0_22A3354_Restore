@implementation SBBiometricMonitorTestRecipeDummyDataSource

- (void)addObserver:(id)a3
{
  id v4;
  NSMutableSet *observers;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSMutableSet addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSMutableSet removeObject:](self->_observers, "removeObject:", a3);
}

- (BOOL)presenceDetectRunning
{
  return (self->_state < 4uLL) & (0xEu >> (self->_state & 0xF));
}

- (BOOL)matchRunning
{
  return self->_state == 3;
}

- (void)cycleState
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t n;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t ii;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t jj;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t kk;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  switch(self->_state)
  {
    case 0:
      self->_state = 1;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v3 = (void *)-[NSMutableSet copy](self->_observers, "copy");
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v73 != v6)
              objc_enumerationMutation(v3);
            v8 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v8, "biometricMonitorDataSourcePresenceDetectionStarted:", self);
          }
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
        }
        while (v5);
      }
      goto LABEL_81;
    case 1:
      self->_state = 2;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v3 = (void *)-[NSMutableSet copy](self->_observers, "copy");
      v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v69;
        do
        {
          for (j = 0; j != v10; ++j)
          {
            if (*(_QWORD *)v69 != v11)
              objc_enumerationMutation(v3);
            v13 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v13, "biometricMonitorDataSourcePresenceDetectionSucceeded:", self);
          }
          v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
        }
        while (v10);
      }
      goto LABEL_81;
    case 2:
      self->_state = 3;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v3 = (void *)-[NSMutableSet copy](self->_observers, "copy");
      v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v65;
        do
        {
          for (k = 0; k != v15; ++k)
          {
            if (*(_QWORD *)v65 != v16)
              objc_enumerationMutation(v3);
            v18 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * k);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v18, "biometricMonitorDataSourceMatchingStarted:", self);
          }
          v15 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
        }
        while (v15);
      }
      goto LABEL_81;
    case 3:
      self->_state = 4;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v3 = (void *)-[NSMutableSet copy](self->_observers, "copy");
      v19 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v60, v80, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v61;
        do
        {
          for (m = 0; m != v20; ++m)
          {
            if (*(_QWORD *)v61 != v21)
              objc_enumerationMutation(v3);
            v23 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * m);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v23, "biometricMonitorDataSourceMatchingSucceeded:", self);
          }
          v20 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v60, v80, 16);
        }
        while (v20);
      }
      goto LABEL_81;
    case 4:
      self->_state = 5;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v3 = (void *)-[NSMutableSet copy](self->_observers, "copy");
      v24 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v56, v79, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v57;
        do
        {
          for (n = 0; n != v25; ++n)
          {
            if (*(_QWORD *)v57 != v26)
              objc_enumerationMutation(v3);
            v28 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * n);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v28, "biometricMonitorDataSourceMatchingFailed:", self);
          }
          v25 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v56, v79, 16);
        }
        while (v25);
      }
      goto LABEL_81;
    case 5:
      self->_state = 6;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v3 = (void *)-[NSMutableSet copy](self->_observers, "copy");
      v29 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v52, v78, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v53;
        do
        {
          for (ii = 0; ii != v30; ++ii)
          {
            if (*(_QWORD *)v53 != v31)
              objc_enumerationMutation(v3);
            v33 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * ii);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v33, "biometricMonitorDataSourceMatchingFailed:", self);
          }
          v30 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v52, v78, 16);
        }
        while (v30);
      }
      goto LABEL_81;
    case 6:
      self->_state = 7;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v3 = (void *)-[NSMutableSet copy](self->_observers, "copy");
      v34 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v48, v77, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v49;
        do
        {
          for (jj = 0; jj != v35; ++jj)
          {
            if (*(_QWORD *)v49 != v36)
              objc_enumerationMutation(v3);
            v38 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * jj);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v38, "biometricMonitorDataSourceMatchingEnded:", self);
          }
          v35 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v48, v77, 16);
        }
        while (v35);
      }
      goto LABEL_81;
    case 7:
      self->_state = 0;
      self->_poseIsMarginal ^= 1u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v3 = (void *)-[NSMutableSet copy](self->_observers, "copy", 0);
      v39 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v44, v76, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v45;
        do
        {
          for (kk = 0; kk != v40; ++kk)
          {
            if (*(_QWORD *)v45 != v41)
              objc_enumerationMutation(v3);
            v43 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * kk);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v43, "biometricMonitorDataSourcePoseUpdated:", self);
          }
          v40 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v44, v76, 16);
        }
        while (v40);
      }
LABEL_81:

      break;
    default:
      return;
  }
}

- (BOOL)poseIsMarginal
{
  return self->_poseIsMarginal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
