@implementation PUTilingViewTransitionHelper

+ (void)unregisterTransitionEndPoint:(id)a3 forViewController:(id)a4
{
  objc_msgSend((id)PURegisteredTilingViewTransitionEndPoints, "removeObjectForKey:", a4);
}

+ (void)registerTransitionEndPoint:(id)a3 forViewController:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = (void *)PURegisteredTilingViewTransitionEndPoints;
  if (!PURegisteredTilingViewTransitionEndPoints)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)PURegisteredTilingViewTransitionEndPoints;
    PURegisteredTilingViewTransitionEndPoints = v7;

    v6 = (void *)PURegisteredTilingViewTransitionEndPoints;
  }
  objc_msgSend(v6, "setObject:forKey:", v9, v5);

}

- (PUTilingViewTransitionHelper)init
{
  return -[PUTilingViewTransitionHelper initWithPresentationDuration:dismissalDuration:endPoint:](self, "initWithPresentationDuration:dismissalDuration:endPoint:", 0, 0.0, 0.0);
}

- (PUTilingViewTransitionHelper)initWithPresentationDuration:(double)a3 dismissalDuration:(double)a4 endPoint:(id)a5
{
  id v9;
  PUTilingViewTransitionHelper *v10;
  PUTilingViewTransitionHelper *v11;
  void *v13;
  void *v14;
  objc_super v15;

  v9 = a5;
  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingViewControllerTransition.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationDuration > 0.0"));

  }
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingViewControllerTransition.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dismissalDuration > 0.0"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PUTilingViewTransitionHelper;
  v10 = -[PUTilingViewTransitionHelper init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_presentationDuration = a3;
    v10->_dismissalDuration = a4;
    objc_storeWeak((id *)&v10->_endPoint, v9);
  }

  return v11;
}

- (void)pauseTransition
{
  -[PUTilingViewTransitionHelper pauseTransitionWithOptions:](self, "pauseTransitionWithOptions:", 0);
}

- (void)pauseTransitionWithOptions:(unint64_t)a3
{
  PUMaximumChangeRateValueFilter *v5;
  PUMaximumChangeRateValueFilter *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  _BYTE buf[12];
  __int16 v15;
  PUMaximumChangeRateValueFilter *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[PUTilingViewTransitionHelper isTransitionPaused](self, "isTransitionPaused"))
  {
    -[PUTilingViewTransitionHelper _setTransitionPaused:](self, "_setTransitionPaused:", 1);
    -[PUTilingViewTransitionHelper _setInteractionOptions:](self, "_setInteractionOptions:", a3);
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTilingViewTransitionHelper setTransitionPausingCall:](self, "setTransitionPausingCall:", v7);

    v13 = 0.0;
    *(_QWORD *)buf = 0;
    v12 = 0.0;
    -[PUTilingViewTransitionHelper _getTransitionProgress:backgroundProgress:chromeProgress:](self, "_getTransitionProgress:backgroundProgress:chromeProgress:", buf, &v13, &v12);
    v5 = 0;
    if ((a3 & 1) != 0)
    {
      v5 = objc_alloc_init(PUMaximumChangeRateValueFilter);
      +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "transitionDuration");
      -[PUMaximumChangeRateValueFilter setMaximumChangeRate:](v5, "setMaximumChangeRate:", 1.0 / v9);

      -[PUDynamicValueFilter setInputValue:](v5, "setInputValue:", *(double *)buf);
    }
    if ((a3 & 2) != 0)
    {
      v6 = objc_alloc_init(PUMaximumChangeRateValueFilter);
      +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "transitionDuration");
      -[PUMaximumChangeRateValueFilter setMaximumChangeRate:](v6, "setMaximumChangeRate:", 1.0 / v11);

      -[PUDynamicValueFilter setInputValue:](v6, "setInputValue:", v12);
    }
    else
    {
      v6 = 0;
    }
    -[PUTilingViewTransitionHelper _setProgressSpeed:](self, "_setProgressSpeed:", 0.0);
    -[PUTilingViewTransitionHelper _setTransitionProgressOffset:](self, "_setTransitionProgressOffset:", *(double *)buf);
    -[PUTilingViewTransitionHelper _setBackgroundProgressOffset:](self, "_setBackgroundProgressOffset:", v13);
    -[PUTilingViewTransitionHelper _setTransitionProgressValueFilter:](self, "_setTransitionProgressValueFilter:", v5);
    -[PUTilingViewTransitionHelper _setChromeProgressValueFilter:](self, "_setChromeProgressValueFilter:", v6);
    goto LABEL_10;
  }
  PXAssertGetLog();
  v5 = (PUMaximumChangeRateValueFilter *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v5->super.super.super, OS_LOG_TYPE_FAULT))
  {
    -[PUTilingViewTransitionHelper transitionPausingCall](self, "transitionPausingCall");
    v6 = (PUMaximumChangeRateValueFilter *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = self;
    v15 = 2112;
    v16 = v6;
    _os_log_fault_impl(&dword_1AAB61000, &v5->super.super.super, OS_LOG_TYPE_FAULT, "tiling view transition %p already paused from %@", buf, 0x16u);
LABEL_10:

  }
}

- (void)updatePausedTransitionWithProgress:(double)a3 interactionProgress:(double)a4
{
  double v8;
  void *v9;
  void *v10;

  if (!-[PUTilingViewTransitionHelper isTransitionPaused](self, "isTransitionPaused"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingViewControllerTransition.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self isTransitionPaused]"));

  }
  -[PUTilingViewTransitionHelper _progressSpeed](self, "_progressSpeed");
  if (v8 != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingViewControllerTransition.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _progressSpeed] == 0.0"));

  }
  -[PUTilingViewTransitionHelper _setTransitionProgressOffset:](self, "_setTransitionProgressOffset:", a3);
  -[PUTilingViewTransitionHelper _setBackgroundProgressOffset:](self, "_setBackgroundProgressOffset:", a4);
}

- (void)resumeTransition:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  double v6;
  double v7;
  float v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  PUTilingViewTransitionHelper *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  PLOneUpGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134218240;
    v14 = self;
    v15 = 1024;
    v16 = v3;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "%p resuming transition %i", (uint8_t *)&v13, 0x12u);
  }

  if (-[PUTilingViewTransitionHelper isTransitionPaused](self, "isTransitionPaused"))
  {
    -[PUTilingViewTransitionHelper _setTransitionPaused:](self, "_setTransitionPaused:", 0);
    -[PUTilingViewTransitionHelper setTransitionPausingCall:](self, "setTransitionPausingCall:", 0);
    if ((-[PUTilingViewTransitionHelper _currentOperation](self, "_currentOperation") != 1) == v3)
      -[PUTilingViewTransitionHelper dismissalDuration](self, "dismissalDuration");
    else
      -[PUTilingViewTransitionHelper presentationDuration](self, "presentationDuration");
    v7 = v6;
    UIAnimationDragCoefficient();
    v9 = v7 * v8;
    v10 = -1.0;
    if (v3)
      v10 = 1.0;
    v11 = v10 / v9;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[PUTilingViewTransitionHelper _setStartTime:](self, "_setStartTime:");
    -[PUTilingViewTransitionHelper _setProgressSpeed:](self, "_setProgressSpeed:", v11);
    if (-[PUTilingViewTransitionHelper hasStarted](self, "hasStarted"))
    {
      if (v3)
        -[PUTilingViewTransitionHelper _toEndPoint](self, "_toEndPoint");
      else
        -[PUTilingViewTransitionHelper _fromEndPoint](self, "_fromEndPoint");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTilingViewTransitionHelper _setEndPointOwningTilingView:](self, "_setEndPointOwningTilingView:", v12);

    }
  }
}

- (void)_getTransitionProgress:(double *)a3 backgroundProgress:(double *)a4 chromeProgress:(double *)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  int64_t v25;
  double v26;
  _BOOL4 v27;
  double v29;
  void *v30;
  void *v31;
  double v32;
  id v33;

  v9 = 0.0;
  if (-[PUTilingViewTransitionHelper hasStarted](self, "hasStarted"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v11 = v10;
    -[PUTilingViewTransitionHelper _startTime](self, "_startTime");
    v9 = v11 - v12;
    if (v9 < 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      -[PUTilingViewTransitionHelper _setStartTime:](self, "_setStartTime:");
      v9 = 0.0;
    }
  }
  -[PUTilingViewTransitionHelper _progressSpeed](self, "_progressSpeed");
  v14 = v13;
  v15 = v9 * v13;
  -[PUTilingViewTransitionHelper _transitionProgressOffset](self, "_transitionProgressOffset");
  v17 = v15 + v16;
  -[PUTilingViewTransitionHelper _backgroundProgressOffset](self, "_backgroundProgressOffset");
  v19 = v18;
  -[PUTilingViewTransitionHelper _transitionProgressValueFilter](self, "_transitionProgressValueFilter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v20;
  if (v20)
  {
    objc_msgSend(v20, "setInputValue:", v17);
    objc_msgSend(v33, "outputValue");
    v17 = v21;
  }
  if ((-[PUTilingViewTransitionHelper _interactionOptions](self, "_interactionOptions") & 4) != 0)
  {
    v27 = -[PUTilingViewTransitionHelper isTransitionPaused](self, "isTransitionPaused");
    if (v14 < 0.0 || v27)
      v29 = 0.0;
    else
      v29 = 1.0;
  }
  else
  {
    +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "transitionChromeDelay");
    v24 = v23;

    v25 = -[PUTilingViewTransitionHelper _currentOperation](self, "_currentOperation");
    if (v25 == 2)
    {
      v26 = v17 / (1.0 - v24);
    }
    else
    {
      v26 = v17;
      if (v25 == 1)
        v26 = (v17 + -1.0) / (1.0 - v24) + 1.0;
    }
    if (v26 < 0.0)
      v26 = 0.0;
    v29 = fmin(v26, 1.0);
  }
  -[PUTilingViewTransitionHelper _chromeProgressValueFilter](self, "_chromeProgressValueFilter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    objc_msgSend(v30, "setInputValue:", v29);
    objc_msgSend(v31, "outputValue");
    v29 = v32;
  }
  if (a3)
    *a3 = v17;
  if (a4)
    *a4 = v15 + v19;
  if (a5)
    *a5 = v29;

}

- (void)animateTransitionWithOperation:(int64_t)a3 startedInteractively:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v8;
  void *v9;
  void *v10;
  PUTilingViewTransitionHelper *v11;
  PUTilingViewTransitionHelper *v12;
  uint64_t v13;
  PUTilingViewTransitionHelper *v14;
  NSObject *v15;
  PUTilingViewTransitionHelper *v16;
  NSObject *v17;
  PUTilingViewTransitionHelper *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  double v37;
  double v38;
  void *v39;
  NSObject *v40;
  void *v41;
  double v42;
  PUTilingViewTransitionHelper *v43;
  PUTilingViewTransitionHelper *v44;
  _BOOL4 v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  double v61;
  void *v62;
  float v63;
  void *v64;
  double v65;
  id v66;
  void *v67;
  void *v68;
  float v69;
  PUTilingViewTransitionHelper *v70;
  PUTilingViewTransitionHelper *v71;
  id v72;
  id v73;
  PUTilingViewTransitionHelper *v74;
  id v75;
  PUDisplayLink *v76;
  NSObject *v77;
  PUDisplayLink *v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  PUDisplayLink *v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  PUTilingViewTransitionHelper *v91;
  void *v92;
  PUTilingViewTransitionHelper *v93;
  char v94;
  id v95;
  PUTilingViewTransitionHelper *v96;
  void *v97;
  PUTilingViewTransitionHelper *v98;
  void *v99;
  _BOOL4 v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  SEL v107;
  void *v108;
  int64_t v109;
  void *v110;
  id v111;
  PUTilingViewTransitionHelper *v112;
  id v113;
  PUTilingViewTransitionHelper *v114;
  void *v115;
  id v116;
  PUTilingViewTransitionHelper *v117;
  _QWORD v118[5];
  PUTilingViewTransitionHelper *v119;
  PUTilingViewTransitionHelper *v120;
  id v121;
  id v122;
  id v123;
  PUDisplayLink *v124;
  _QWORD v125[4];
  PUTilingViewTransitionHelper *v126;
  PUTilingViewTransitionHelper *v127;
  id v128;
  id v129;
  id v130;
  id v131;
  PUTilingViewTransitionHelper *v132;
  id v133;
  PUTilingViewTransitionHelper *v134;
  PUTilingViewTransitionHelper *v135;
  id v136;
  id v137;
  id v138;
  char v139;
  _QWORD v140[5];
  id v141;
  PUTilingViewTransitionHelper *v142;
  PUTilingViewTransitionHelper *v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  double v149;
  _QWORD v150[4];
  id v151;
  _QWORD v152[4];
  id v153;
  int64x2_t v154;
  uint64_t v155;
  uint64_t v156;
  _QWORD v157[4];
  id v158;
  id v159;
  _QWORD v160[4];
  id v161;
  double v162;
  double v163;
  double v164;
  _QWORD v165[4];
  PUTilingViewTransitionHelper *v166;
  PUTilingViewTransitionHelper *v167;
  id v168;
  _QWORD aBlock[4];
  id v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  uint8_t v175[128];
  uint8_t buf[4];
  PUTilingViewTransitionHelper *v177;
  __int16 v178;
  int64_t v179;
  __int16 v180;
  PUTilingViewTransitionHelper *v181;
  __int16 v182;
  PUTilingViewTransitionHelper *v183;
  __int16 v184;
  PUTilingViewTransitionHelper *v185;
  uint64_t v186;

  v4 = a4;
  v186 = *MEMORY[0x1E0C80C00];
  PLOneUpGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v177 = self;
    v178 = 2048;
    v179 = a3;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "[animateTransition] %p animate transition with operation %li", buf, 0x16u);
  }

  v109 = a3;
  -[PUTilingViewTransitionHelper _setCurrentOperation:](self, "_setCurrentOperation:", a3);
  -[PUTilingViewTransitionHelper transition](self, "transition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fromViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "toViewController");
  v11 = (PUTilingViewTransitionHelper *)objc_claimAutoreleasedReturnValue();
  -[PUTilingViewTransitionHelper endPoint](self, "endPoint");
  v12 = (PUTilingViewTransitionHelper *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend((id)objc_opt_class(), "typeOfEndPoint:forTransitionFromViewController:toViewController:", v12, v10, v11);
  v107 = a2;
  if (!v13)
  {
    PLOneUpGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v177 = v12;
      v178 = 2112;
      v179 = (int64_t)v10;
      v180 = 2112;
      v181 = v11;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "[animateTransition] Couldn't find type of end point %@ for transition from %@ to %@", buf, 0x20u);
    }

    goto LABEL_11;
  }
  if (v13 != 2)
  {
    if (v13 == 1)
    {
      v14 = v12;
      goto LABEL_12;
    }
LABEL_11:
    v14 = 0;
LABEL_12:
    objc_msgSend((id)objc_opt_class(), "_transitionEndPointWithViewController:", v11);
    v16 = (PUTilingViewTransitionHelper *)objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_14;
    goto LABEL_13;
  }
  v16 = v12;
  if (!v16)
    goto LABEL_11;
LABEL_13:
  objc_msgSend((id)objc_opt_class(), "_transitionEndPointWithViewController:", v10);
  v14 = (PUTilingViewTransitionHelper *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  if (-[PUTilingViewTransitionHelper _validateTransitionFromEndPoint:toEndPoint:](self, "_validateTransitionFromEndPoint:toEndPoint:", v14, v16))
  {
    -[PUTilingViewTransitionHelper _setFromEndPoint:](self, "_setFromEndPoint:", v14);
    -[PUTilingViewTransitionHelper _setToEndPoint:](self, "_setToEndPoint:", v16);
    PLOneUpGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219010;
      v177 = self;
      v178 = 2112;
      v179 = (int64_t)v10;
      v180 = 2112;
      v181 = v14;
      v182 = 2112;
      v183 = v11;
      v184 = 2112;
      v185 = v16;
      _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_DEFAULT, "[animateTransition] %p fromVC: %@, fromEndPoint: %@, toVC: %@, toEndPoint: %@", buf, 0x34u);
    }

    objc_msgSend(v10, "navigationController");
    v18 = (PUTilingViewTransitionHelper *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (v18 = v10) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v18 = v11;
        else
          v18 = 0;
      }
    }
    v100 = v4;
    objc_msgSend(v10, "tabBarController");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = -[PUTilingViewTransitionHelper _useStandardStatusBarHeight](v18, "_useStandardStatusBarHeight");
    v19 = objc_msgSend(v10, "prefersStatusBarHidden");
    if (v19 != -[PUTilingViewTransitionHelper prefersStatusBarHidden](v11, "prefersStatusBarHidden"))
      -[PUTilingViewTransitionHelper _setUseStandardStatusBarHeight:](v18, "_setUseStandardStatusBarHeight:", 1);
    objc_msgSend(v9, "containerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "subviews");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transitionContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "viewForKey:", *MEMORY[0x1E0DC55C0]);
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "transitionContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "viewForKey:", *MEMORY[0x1E0DC55D0]);
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUTilingViewTransitionHelper presentedViewController](v11, "presentedViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v18;
    v97 = v23;
    if (v23)
    {
      objc_msgSend(v23, "presentationController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "containerView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v25, "isDescendantOfView:", v20) & 1) == 0)
      {
        v26 = v25;

        v115 = v26;
      }

    }
    v117 = v16;
    v98 = v12;
    v114 = v11;
    objc_msgSend(v9, "finalToViewFrame");
    v27 = v115;
    objc_msgSend(v115, "setFrame:");
    if (v115)
      objc_msgSend(v20, "addSubview:", v115);
    objc_msgSend(v20, "superview");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v20;
    if (v28 != v20)
    {
      v173 = 0u;
      v174 = 0u;
      v171 = 0u;
      v172 = 0u;
      v29 = v103;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v171, v175, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v172;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v172 != v32)
              objc_enumerationMutation(v29);
            objc_msgSend(*(id *)(*((_QWORD *)&v171 + 1) + 8 * i), "px_transferToSuperview:", v28);
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v171, v175, 16);
        }
        while (v31);
      }

      v27 = v115;
      objc_msgSend(v115, "px_transferToSuperview:", v28);
    }
    v99 = v10;
    -[PUTilingViewTransitionHelper tilingViewControllerTransition:tilingViewToTransferToEndPoint:](v14, "tilingViewControllerTransition:tilingViewToTransferToEndPoint:", v9, v117);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    PLOneUpGetLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v177 = self;
      v178 = 2112;
      v179 = (int64_t)v34;
      _os_log_impl(&dword_1AAB61000, v35, OS_LOG_TYPE_DEFAULT, "[animateTransition] %p tilingView: %@", buf, 0x16u);
    }

    -[PUTilingViewTransitionHelper _setTilingView:](self, "_setTilingView:", v34);
    objc_msgSend(v34, "tileAnimator");
    v36 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "px_transferToSuperview:", v28);
    v89 = (void *)v36;
    if (v109 == 2)
    {
      v41 = v102;
      if (!v102)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "handleFailureInMethod:object:file:lineNumber:description:", v107, self, CFSTR("PUTilingViewControllerTransition.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromView != nil"));

        v41 = 0;
      }
      objc_msgSend(v28, "bringSubviewToFront:", v41);
      v165[0] = MEMORY[0x1E0C809B0];
      v165[1] = 3221225472;
      v165[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_2;
      v165[3] = &unk_1E58A98C0;
      v166 = v14;
      v167 = self;
      v168 = v41;
      v106 = _Block_copy(v165);
      -[PUTilingViewTransitionHelper dismissalDuration](self, "dismissalDuration");
      v38 = v42;
      objc_msgSend((id)objc_opt_class(), "concatenatedProgressBlockForTilingView:transitionOperation:", v34, 2);
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      v105 = 0;
      v39 = v166;
    }
    else if (v109 == 1)
    {
      if (!v27)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", v107, self, CFSTR("PUTilingViewControllerTransition.m"), 314, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toView != nil"));

      }
      objc_msgSend(v28, "bringSubviewToFront:", v27);
      objc_msgSend(v27, "setAlpha:", 0.0);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke;
      aBlock[3] = &unk_1E58AA448;
      v170 = v27;
      v106 = _Block_copy(aBlock);
      -[PUTilingViewTransitionHelper presentationDuration](self, "presentationDuration");
      v38 = v37;
      objc_msgSend((id)objc_opt_class(), "concatenatedProgressBlockForTilingView:transitionOperation:", v34, 1);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = 0;
      v39 = v170;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", v107, self, CFSTR("PUTilingViewControllerTransition.m"), 341, CFSTR("unexpected operation"));
      v105 = 0;
      v106 = 0;
      v83 = 0;
      v38 = 0.0;
    }

    v43 = v14;
    if (-[PUTilingViewTransitionHelper _endPointUsesTransientTilingView:](self, "_endPointUsesTransientTilingView:", v14)|| (v43 = v117, -[PUTilingViewTransitionHelper _endPointUsesTransientTilingView:](self, "_endPointUsesTransientTilingView:", v117)))
    {
      v44 = v43;
      v45 = 0;
      if (!v44 || !v100)
        goto LABEL_61;
      if ((-[PUTilingViewTransitionHelper _interactionOptions](self, "_interactionOptions") & 0x10) == 0)
      {
        +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "transitionProgressBehavior");

        v45 = (unint64_t)(v47 - 1) < 2;
LABEL_61:
        PLOneUpGetLog();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v177) = v45;
          _os_log_impl(&dword_1AAB61000, v48, OS_LOG_TYPE_DEFAULT, "[animateTransition] shouldAnimateTilingViewBackground: %d", buf, 8u);
        }

        v91 = v44;
        if (v45)
        {
          if (-[PUTilingViewTransitionHelper _barStyleForEndPoint:](self, "_barStyleForEndPoint:", v44) == 1)
            v49 = 0.0;
          else
            v49 = 1.0;
          +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "interactiveTransitionBackgroundDimming");
          v52 = v51;

          if (v44 == v14)
            v53 = 0.0;
          else
            v53 = v52;
          if (v44 == v14)
            v54 = v52;
          else
            v54 = 0.0;
          v55 = MEMORY[0x1E0C809B0];
          v160[0] = MEMORY[0x1E0C809B0];
          v160[1] = 3221225472;
          v160[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_23;
          v160[3] = &unk_1E58A98E8;
          v162 = v53;
          v163 = v54;
          v56 = v34;
          v161 = v56;
          v164 = v49;
          v108 = _Block_copy(v160);
          objc_msgSend(v56, "backgroundColor");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = (void *)objc_msgSend(v57, "copy");

          v59 = v55;
          v157[0] = v55;
          v157[1] = 3221225472;
          v157[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_2_25;
          v157[3] = &unk_1E58ABCA8;
          v158 = v56;
          v159 = v58;
          v60 = v58;
          v88 = _Block_copy(v157);

        }
        else
        {
          v108 = 0;
          v88 = 0;
          v59 = MEMORY[0x1E0C809B0];
        }
        v61 = 0.0;
        v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", -1.79769313e308, -1.79769313e308, 0.0, 0.0);
        objc_msgSend(v28, "addSubview:", v62);
        UIAnimationDragCoefficient();
        v64 = (void *)MEMORY[0x1E0DC3F10];
        v152[0] = v59;
        v152[1] = 3221225472;
        v152[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_3;
        v152[3] = &unk_1E58AACA0;
        v65 = v38 / v63;
        v153 = v62;
        v154 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
        v156 = 0;
        v155 = 0;
        v150[0] = v59;
        v150[1] = 3221225472;
        v150[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_4;
        v150[3] = &unk_1E58A9910;
        v151 = v153;
        v66 = v153;
        objc_msgSend(v64, "animateWithDuration:animations:completion:", v152, v150, v65);

        -[PUTilingViewTransitionHelper navigationBar](v112, "navigationBar");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "setUserInteractionEnabled:", 0);

        objc_msgSend(v110, "tabBar");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setUserInteractionEnabled:", 0);

        -[PUTilingViewTransitionHelper _setTransitionProgressOffset:](self, "_setTransitionProgressOffset:", 0.0);
        -[PUTilingViewTransitionHelper _setBackgroundProgressOffset:](self, "_setBackgroundProgressOffset:", 0.0);
        if (!-[PUTilingViewTransitionHelper isTransitionPaused](self, "isTransitionPaused"))
        {
          UIAnimationDragCoefficient();
          v65 = v65 * v69;
          v61 = 1.0 / v65;
        }
        -[PUTilingViewTransitionHelper _setProgressSpeed:](self, "_setProgressSpeed:", v61);
        v84 = [PUDisplayLink alloc];
        v140[0] = v59;
        v140[1] = 3221225472;
        v140[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_5;
        v140[3] = &unk_1E58A9960;
        v140[4] = self;
        v141 = v34;
        v149 = v65;
        v142 = v117;
        v96 = v14;
        v143 = v14;
        v145 = v108;
        v146 = v106;
        v147 = v105;
        v148 = v83;
        v101 = v9;
        v144 = v9;
        v125[0] = v59;
        v125[1] = 3221225472;
        v125[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_7;
        v125[3] = &unk_1E58A9988;
        v126 = v112;
        v127 = self;
        v86 = v144;
        v128 = v86;
        v129 = v103;
        v130 = v92;
        v131 = v115;
        v132 = v114;
        v85 = v89;
        v133 = v85;
        v138 = v88;
        v70 = v142;
        v134 = v70;
        v71 = v143;
        v135 = v71;
        v72 = v141;
        v136 = v72;
        v137 = v110;
        v139 = v94;
        v87 = v110;
        v111 = v88;
        v116 = v115;
        v95 = v92;
        v104 = v103;
        v93 = v112;
        v90 = v83;
        v73 = v105;
        v74 = v127;
        v113 = v106;
        v75 = v108;
        v76 = -[PUDisplayLink initWithUpdateHandler:completionHandler:](v84, "initWithUpdateHandler:completionHandler:", v140, v125);
        PLOneUpGetLog();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v177 = v74;
          v178 = 2112;
          v179 = (int64_t)v70;
          _os_log_impl(&dword_1AAB61000, v77, OS_LOG_TYPE_DEFAULT, "[animateTransition] %p waiting to start transition to end point %@", buf, 0x16u);
        }

        v118[0] = MEMORY[0x1E0C809B0];
        v118[1] = 3221225472;
        v118[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_36;
        v118[3] = &unk_1E58A99D8;
        v118[4] = v74;
        v119 = v70;
        v120 = v71;
        v121 = v86;
        v122 = v72;
        v123 = v85;
        v124 = v76;
        v78 = v76;
        v79 = v85;
        v80 = v72;
        -[PUTilingViewTransitionHelper _performWhenToEndPoint:isReadyToAdoptTilingView:fromEndPoint:action:](v74, "_performWhenToEndPoint:isReadyToAdoptTilingView:fromEndPoint:action:", v119, v80, v120, v118);

        v10 = v99;
        v9 = v101;
        v11 = v114;
        v12 = v98;
        v16 = v117;
        v14 = v96;
        goto LABEL_80;
      }
    }
    else
    {
      v44 = 0;
    }
    v45 = 0;
    goto LABEL_61;
  }
  PLOneUpGetLog();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v177 = v14;
    v178 = 2112;
    v179 = (int64_t)v16;
    _os_log_impl(&dword_1AAB61000, v40, OS_LOG_TYPE_ERROR, "[animateTransition] Failed to validate fromEndPoint: %@ toEndPoint: %@", buf, 0x16u);
  }

  objc_msgSend(v9, "finishInteractiveTransition");
  objc_msgSend(v9, "completeTransition:", 1);
LABEL_80:

}

- (void)_performWhenToEndPoint:(id)a3 isReadyToAdoptTilingView:(id)a4 fromEndPoint:(id)a5 action:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __100__PUTilingViewTransitionHelper__performWhenToEndPoint_isReadyToAdoptTilingView_fromEndPoint_action___block_invoke;
  v19[3] = &unk_1E58A9A90;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v24 = v14;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], v19);

}

- (void)_performWhenToEndPoint:(id)a3 isReadyToAdoptTilingView:(id)a4 fromEndPoint:(id)a5 retryCount:(int64_t)a6 startTime:(double)a7 action:(id)a8
{
  PUTilingViewTransitionHelper *v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  double v18;
  double v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint32_t v24;
  NSObject *v25;
  _QWORD block[5];
  PUTilingViewTransitionHelper *v27;
  id v28;
  id v29;
  void (**v30)(_QWORD);
  int64_t v31;
  double v32;
  uint8_t buf[4];
  PUTilingViewTransitionHelper *v34;
  __int16 v35;
  PUTilingViewTransitionHelper *v36;
  __int16 v37;
  int64_t v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v14 = (PUTilingViewTransitionHelper *)a3;
  v15 = a4;
  v16 = a5;
  v17 = (void (**)(_QWORD))a8;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v19 = v18 - a7;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || -[PUTilingViewTransitionHelper isReadyToAdoptTilingView:fromEndPoint:](v14, "isReadyToAdoptTilingView:fromEndPoint:", v15, v16))
  {
    PLOneUpGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:

      v17[2](v17);
      goto LABEL_7;
    }
    *(_DWORD *)buf = 134218754;
    v34 = self;
    v35 = 2112;
    v36 = v14;
    v37 = 2048;
    v38 = a6;
    v39 = 2048;
    v40 = v19;
    v21 = "[animateTransition] %p end point %@ ready after retries: %ti delay: %0.3f s";
    v22 = v20;
    v23 = OS_LOG_TYPE_DEFAULT;
    v24 = 42;
LABEL_5:
    _os_log_impl(&dword_1AAB61000, v22, v23, v21, buf, v24);
    goto LABEL_6;
  }
  PLOneUpGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  v20 = v25;
  if (a6 > 99 || v19 >= 1.0)
  {
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      goto LABEL_6;
    *(_DWORD *)buf = 138412290;
    v34 = v14;
    v21 = "End point not ready to adopt tiling view %@. Failing gracefully, but animation might be glitchy.";
    v22 = v20;
    v23 = OS_LOG_TYPE_FAULT;
    v24 = 12;
    goto LABEL_5;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v34 = self;
    v35 = 2112;
    v36 = v14;
    _os_log_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_DEBUG, "[animateTransition] %p end point %@ not ready yet", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __121__PUTilingViewTransitionHelper__performWhenToEndPoint_isReadyToAdoptTilingView_fromEndPoint_retryCount_startTime_action___block_invoke;
  block[3] = &unk_1E58A9AB8;
  block[4] = self;
  v27 = v14;
  v28 = v15;
  v29 = v16;
  v31 = a6;
  v32 = a7;
  v30 = v17;
  dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_7:
}

- (BOOL)_validateTransitionFromEndPoint:(id)a3 toEndPoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  PUTilingViewTransitionHelper *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  v10 = !v9;
  if (v9)
  {
    -[PUTilingViewTransitionHelper transition](self, "transition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75__PUTilingViewTransitionHelper__validateTransitionFromEndPoint_toEndPoint___block_invoke;
    v14[3] = &unk_1E58A9AE0;
    v15 = v11;
    v16 = v6;
    v17 = self;
    v18 = v8;
    v12 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], v14);

  }
  return v10;
}

- (BOOL)_endPointUsesTransientTilingView:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "tilingViewControllerTransitionUsesTransientTilingView:", self);
  else
    v5 = 0;

  return v5;
}

- (int64_t)_barStyleForEndPoint:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "tilingViewControllerTransitionPreferredBarStyle:", self);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = objc_msgSend(v4, "pu_preferredBarStyle");
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (void)_setEndPointOwningTilingView:(id)a3
{
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__endPointOwningTilingView);

  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->__endPointOwningTilingView);
    objc_storeWeak((id *)&self->__endPointOwningTilingView, obj);
    -[PUTilingViewTransitionHelper transition](self, "transition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tilingViewControllerTransition:tilingViewToTransferToEndPoint:", v7, obj);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTilingViewTransitionHelper _tilingView](self, "_tilingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTilingViewTransitionHelper _tilingView](self, "_tilingView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingViewControllerTransition.m"), 724, CFSTR("tiling view %@ to transfer from %@ to %@ isn't the transition's tiling view %@"), v8, v6, obj, v13);

    }
    objc_msgSend(v6, "tilingViewControllerTransition:abandonTilingView:toEndPoint:", v7, v8, obj);
    -[PUTilingViewTransitionHelper _fromEndPoint](self, "_fromEndPoint");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10 == obj;

    objc_msgSend(obj, "tilingViewControllerTransition:adoptTilingView:fromEndPoint:isCancelingTransition:animationSetupCompletionHandler:", v7, v8, v6, v11, 0);
  }

}

- (double)presentationDuration
{
  return self->_presentationDuration;
}

- (double)dismissalDuration
{
  return self->_dismissalDuration;
}

- (PUTilingViewControllerTransition)transition
{
  return (PUTilingViewControllerTransition *)objc_loadWeakRetained((id *)&self->_transition);
}

- (void)setTransition:(id)a3
{
  objc_storeWeak((id *)&self->_transition, a3);
}

- (BOOL)isTransitionPaused
{
  return self->_transitionPaused;
}

- (void)_setTransitionPaused:(BOOL)a3
{
  self->_transitionPaused = a3;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)_setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (int64_t)_currentOperation
{
  return self->__currentOperation;
}

- (void)_setCurrentOperation:(int64_t)a3
{
  self->__currentOperation = a3;
}

- (double)_startTime
{
  return self->__startTime;
}

- (void)_setStartTime:(double)a3
{
  self->__startTime = a3;
}

- (double)_progressSpeed
{
  return self->__progressSpeed;
}

- (void)_setProgressSpeed:(double)a3
{
  self->__progressSpeed = a3;
}

- (double)_transitionProgressOffset
{
  return self->__transitionProgressOffset;
}

- (void)_setTransitionProgressOffset:(double)a3
{
  self->__transitionProgressOffset = a3;
}

- (double)_backgroundProgressOffset
{
  return self->__backgroundProgressOffset;
}

- (void)_setBackgroundProgressOffset:(double)a3
{
  self->__backgroundProgressOffset = a3;
}

- (PUMaximumChangeRateValueFilter)_transitionProgressValueFilter
{
  return self->__transitionProgressValueFilter;
}

- (void)_setTransitionProgressValueFilter:(id)a3
{
  objc_storeStrong((id *)&self->__transitionProgressValueFilter, a3);
}

- (PUMaximumChangeRateValueFilter)_chromeProgressValueFilter
{
  return self->__chromeProgressValueFilter;
}

- (void)_setChromeProgressValueFilter:(id)a3
{
  objc_storeStrong((id *)&self->__chromeProgressValueFilter, a3);
}

- (PUAnimationGroup)_tilingViewAnimationGroup
{
  return self->__tilingViewAnimationGroup;
}

- (void)_setTilingViewAnimationGroup:(id)a3
{
  objc_storeStrong((id *)&self->__tilingViewAnimationGroup, a3);
}

- (PUTilingView)_tilingView
{
  return (PUTilingView *)objc_loadWeakRetained((id *)&self->__tilingView);
}

- (void)_setTilingView:(id)a3
{
  objc_storeWeak((id *)&self->__tilingView, a3);
}

- (PUTilingViewControllerTransitionEndPoint)_fromEndPoint
{
  return (PUTilingViewControllerTransitionEndPoint *)objc_loadWeakRetained((id *)&self->__fromEndPoint);
}

- (void)_setFromEndPoint:(id)a3
{
  objc_storeWeak((id *)&self->__fromEndPoint, a3);
}

- (PUTilingViewControllerTransitionEndPoint)_toEndPoint
{
  return (PUTilingViewControllerTransitionEndPoint *)objc_loadWeakRetained((id *)&self->__toEndPoint);
}

- (void)_setToEndPoint:(id)a3
{
  objc_storeWeak((id *)&self->__toEndPoint, a3);
}

- (PUTilingViewControllerTransitionEndPoint)_endPointOwningTilingView
{
  return (PUTilingViewControllerTransitionEndPoint *)objc_loadWeakRetained((id *)&self->__endPointOwningTilingView);
}

- (unint64_t)_interactionOptions
{
  return self->__interactionOptions;
}

- (void)_setInteractionOptions:(unint64_t)a3
{
  self->__interactionOptions = a3;
}

- (NSArray)transitionPausingCall
{
  return self->_transitionPausingCall;
}

- (void)setTransitionPausingCall:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (PUTilingViewControllerTransitionEndPoint)endPoint
{
  return (PUTilingViewControllerTransitionEndPoint *)objc_loadWeakRetained((id *)&self->_endPoint);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_endPoint);
  objc_storeStrong((id *)&self->_transitionPausingCall, 0);
  objc_destroyWeak((id *)&self->__endPointOwningTilingView);
  objc_destroyWeak((id *)&self->__toEndPoint);
  objc_destroyWeak((id *)&self->__fromEndPoint);
  objc_destroyWeak((id *)&self->__tilingView);
  objc_storeStrong((id *)&self->__tilingViewAnimationGroup, 0);
  objc_storeStrong((id *)&self->__chromeProgressValueFilter, 0);
  objc_storeStrong((id *)&self->__transitionProgressValueFilter, 0);
  objc_destroyWeak((id *)&self->_transition);
}

uint64_t __75__PUTilingViewTransitionHelper__validateTransitionFromEndPoint_toEndPoint___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "cancelInteractiveTransition");
  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "tilingViewControllerTransitionWasAborted:", *(_QWORD *)(a1 + 48));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 56), "tilingViewControllerTransitionWasAborted:", *(_QWORD *)(a1 + 48));
  return result;
}

uint64_t __121__PUTilingViewTransitionHelper__performWhenToEndPoint_isReadyToAdoptTilingView_fromEndPoint_retryCount_startTime_action___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performWhenToEndPoint:isReadyToAdoptTilingView:fromEndPoint:retryCount:startTime:action:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72) + 1, *(_QWORD *)(a1 + 64), *(double *)(a1 + 80));
}

uint64_t __100__PUTilingViewTransitionHelper__performWhenToEndPoint_isReadyToAdoptTilingView_fromEndPoint_action___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performWhenToEndPoint:isReadyToAdoptTilingView:fromEndPoint:retryCount:startTime:action:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:");
}

uint64_t __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_2(uint64_t a1, double a2)
{
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "tilingViewControllerTransitionProgressAtWhichChromeIsFullyFadedOut:", *(_QWORD *)(a1 + 40));
  if (v4 == 0.0)
    v4 = 1.0;
  return objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 1.0 - a2 / v4);
}

void __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_23(uint64_t a1, double a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", *(double *)(a1 + 56), *(double *)(a1 + 48) * a2 + (1.0 - a2) * *(double *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

}

uint64_t __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_2_25(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

uint64_t __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_3(uint64_t a1)
{
  void *v1;
  CGRect v3;

  v1 = *(void **)(a1 + 32);
  v3 = CGRectOffset(*(CGRect *)(a1 + 40), 1.0, 1.0);
  return objc_msgSend(v1, "setFrame:", v3.origin.x, v3.origin.y, v3.size.width, v3.size.height);
}

uint64_t __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_5(uint64_t a1, char *a2)
{
  double v4;
  double v5;
  BOOL v8;
  char v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  double v23;
  double v24;
  double v25;

  v24 = 0.0;
  v25 = 0.0;
  v23 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "_getTransitionProgress:backgroundProgress:chromeProgress:", &v25, &v24, &v23);
  objc_msgSend(*(id *)(a1 + 32), "_progressSpeed");
  v5 = v25;
  v8 = v4 <= 0.0 || v25 < 1.0 || v24 < 1.0 || v23 < 1.0;
  if (!v8 || v25 <= 0.0 && v24 <= 0.0 && v4 < 0.0)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v9 = 1;
    v22 = 1;
    if (v4 < 0.0)
    {
      v10 = *(void **)(a1 + 40);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_6;
      v18[3] = &unk_1E58A9938;
      v18[4] = &v19;
      objc_msgSend(v10, "enumerateAllTileControllersUsingBlock:", v18);
      v9 = *((_BYTE *)v20 + 24);
    }
    *a2 = v9;
    _Block_object_dispose(&v19, 8);
    v5 = v25;
  }
  v11 = v5 * *(double *)(a1 + 104);
  objc_msgSend(*(id *)(a1 + 32), "_tilingViewAnimationGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setElapsedTime:", v11);

  if ((objc_msgSend(*(id *)(a1 + 32), "_interactionOptions") & 8) != 0)
  {
    v13 = 56;
    if (v25 > 0.0)
      v13 = 48;
    objc_msgSend(*(id *)(a1 + 32), "_setEndPointOwningTilingView:", *(_QWORD *)(a1 + v13), v25);
  }
  v14 = *(_QWORD *)(a1 + 72);
  if (v14)
  {
    v15 = v24;
    (*(void (**)(double))(v14 + 16))(v24);
  }
  else
  {
    v15 = v23;
  }
  v16 = *(_QWORD *)(a1 + 80);
  if (v16)
    (*(void (**)(double))(v16 + 16))(v23);
  if (*(_QWORD *)(a1 + 88))
  {
    PXClamp();
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }
  if (*(_QWORD *)(a1 + 96))
  {
    PXClamp();
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
  }
  return objc_msgSend(*(id *)(a1 + 64), "updateInteractiveTransitionProgress:visibleTransitionProgress:", v23, v15);
}

void __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_7(uint64_t a1)
{
  double v2;
  double v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  uint64_t v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "ppt_notifyTransitionAnimationDidComplete");
  objc_msgSend(*(id *)(a1 + 40), "_progressSpeed");
  v3 = v2;
  PLOneUpGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v46) = v3 >= 0.0;
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "[animateTransition] didFinishTransition: %d", buf, 8u);
  }

  if (v3 < 0.0)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v15 = *(id *)(a1 + 56);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "px_transferToSuperview:", *(_QWORD *)(a1 + 64), (_QWORD)v37);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v17);
    }

    objc_msgSend(*(id *)(a1 + 72), "removeFromSuperview");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "transitionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewForKey:", *MEMORY[0x1E0DC55C0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewForKey:", *MEMORY[0x1E0DC55D0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v8 = *(id *)(a1 + 56);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v42 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          if ((objc_msgSend(v13, "isDescendantOfView:", v6) & 1) == 0)
            objc_msgSend(v13, "px_transferToSuperview:", *(_QWORD *)(a1 + 64));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(a1 + 72), "px_transferToSuperview:", *(_QWORD *)(a1 + 64));
    v14 = *(void **)(a1 + 72);
    if (v14 && (objc_msgSend(v14, "isDescendantOfView:", v7) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 64), "insertSubview:belowSubview:", v7, *(_QWORD *)(a1 + 72));

  }
  objc_msgSend(*(id *)(a1 + 40), "_tilingViewAnimationGroup", (_QWORD)v37);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPaused:", 0);

  objc_msgSend(*(id *)(a1 + 40), "_setTilingViewAnimationGroup:", 0);
  v21 = *(void **)(a1 + 48);
  if (v3 < 0.0)
    objc_msgSend(v21, "cancelInteractiveTransition");
  else
    objc_msgSend(v21, "finishInteractiveTransition");
  objc_msgSend(*(id *)(a1 + 80), "presentedViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v22, "searchResultsUpdater");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v23, "collectionView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "collectionViewLayout");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "invalidateLayout");
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 80), "collectionViewLayout");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "invalidateLayout");

  }
  objc_msgSend(*(id *)(a1 + 48), "completeTransition:", v3 >= 0.0);
  objc_msgSend(*(id *)(a1 + 88), "transition:didComplete:", *(_QWORD *)(a1 + 48), v3 >= 0.0);
  v27 = *(_QWORD *)(a1 + 128);
  if (v27)
    (*(void (**)(void))(v27 + 16))();
  objc_msgSend(*(id *)(a1 + 40), "_setHasStarted:", 0);
  v28 = 104;
  if (v3 >= 0.0)
    v28 = 96;
  objc_msgSend(*(id *)(a1 + v28), "tilingViewControllerTransitionTilingViewHostView:", *(_QWORD *)(a1 + 40));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 112), "setAutoresizingMask:", 18);
  objc_msgSend(*(id *)(a1 + 112), "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  objc_msgSend(*(id *)(a1 + 112), "superview");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
    objc_msgSend(*(id *)(a1 + 112), "px_transferToSuperview:", v29);
  v31 = *(void **)(a1 + 40);
  if (v3 < 0.0)
    objc_msgSend(v31, "_fromEndPoint");
  else
    objc_msgSend(v31, "_toEndPoint");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_setEndPointOwningTilingView:", v32);

  objc_msgSend(*(id *)(a1 + 32), "navigationBar");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 120), "tabBar");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "_setUseStandardStatusBarHeight:", *(unsigned __int8 *)(a1 + 136));
  objc_msgSend(*(id *)(a1 + 40), "_setProgressSpeed:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "_setTransitionProgressOffset:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "_setBackgroundProgressOffset:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "_setTransitionProgressValueFilter:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_setChromeProgressValueFilter:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_setInteractionOptions:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_setFromEndPoint:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_setToEndPoint:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_setTilingView:", 0);
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 128), 0);
  PLOneUpGetLog();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134217984;
    v46 = v36;
    _os_log_impl(&dword_1AAB61000, v35, OS_LOG_TYPE_DEFAULT, "[animateTransition] %p completed", buf, 0xCu);
  }

}

void __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_36(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  PLOneUpGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v17 = v3;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "[animateTransition] %p start transition to end point %@", buf, 0x16u);
  }

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "tilingViewControllerTransition:abandonTilingView:toEndPoint:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 72), "transitionWillBeginAnimation:", *(_QWORD *)(a1 + 56));
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_37;
  v11[3] = &unk_1E58A99B0;
  v12 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 32);
  v13 = v9;
  v14 = v10;
  v15 = *(id *)(a1 + 80);
  objc_msgSend(v7, "tilingViewControllerTransition:adoptTilingView:fromEndPoint:isCancelingTransition:animationSetupCompletionHandler:", v5, v6, v8, 0, v11);

}

void __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "transitionDidBeginAnimation:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 48), "isTransitionPaused")
    && (objc_msgSend(*(id *)(a1 + 48), "_interactionOptions") & 8) == 0)
  {
    objc_msgSend(v3, "setPaused:", 1);
    objc_msgSend(*(id *)(a1 + 48), "_setTilingViewAnimationGroup:", v3);
  }
  v4 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "_setStartTime:");
  objc_msgSend(*(id *)(a1 + 48), "_setHasStarted:", 1);
  PLOneUpGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 134217984;
    v8 = v6;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "[animateTransition] %p started", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 56), "start");
}

void __84__PUTilingViewTransitionHelper_animateTransitionWithOperation_startedInteractively___block_invoke_6(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "isActive"))
  {
    objc_msgSend(v10, "layoutInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tileKind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", PUTileKindBackground);

    if (v7)
    {
      objc_msgSend(v10, "presentationLayoutInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "alpha");
      if (v9 != 0.0 && v9 != 1.0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
        *a3 = 1;
      }

    }
  }

}

+ (id)concatenatedProgressBlockForTilingView:(id)a3 transitionOperation:(int64_t)a4
{
  id v5;
  void *v6;
  const void *v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *(*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__95860;
    v14 = __Block_byref_object_dispose__95861;
    v15 = &__block_literal_global_95862;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __91__PUTilingViewTransitionHelper_concatenatedProgressBlockForTilingView_transitionOperation___block_invoke_2;
    v9[3] = &unk_1E58A9A68;
    v9[5] = &v16;
    v9[6] = a4;
    v9[4] = &v10;
    objc_msgSend(v5, "enumerateAllTileControllersUsingBlock:", v9);
    if (*((_BYTE *)v17 + 24))
      v7 = (const void *)v11[5];
    else
      v7 = 0;
    a4 = (int64_t)_Block_copy(v7);
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(&v16, 8);
  }

  return (id)a4;
}

+ (int64_t)typeOfEndPoint:(id)a3 forTransitionFromViewController:(id)a4 toViewController:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int64_t v10;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "tilingViewControllerTransitionEndPointHostViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "px_isDescendantOfOrPresentedByViewController:", v8) & 1) == 0)
  {
    if ((objc_msgSend(v9, "px_isDescendantOfOrPresentedByViewController:", v7) & 1) != 0
      || objc_msgSend(v7, "px_isDescendantOfOrPresentedByViewController:", v9)
      && (objc_msgSend(v8, "px_isDescendantOfOrPresentedByViewController:", v7) & 1) != 0)
    {
      v10 = 1;
      goto LABEL_10;
    }
    if (!objc_msgSend(v8, "px_isDescendantOfOrPresentedByViewController:", v9)
      || (objc_msgSend(v7, "px_isDescendantOfOrPresentedByViewController:", v8) & 1) == 0)
    {
      v10 = 0;
      goto LABEL_10;
    }
  }
  v10 = 2;
LABEL_10:

  return v10;
}

+ (id)_transitionEndPointWithViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v4)
  {
    objc_msgSend(v4, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "modalPresentationStyle");

    if (v8 == 3)
    {
      objc_msgSend(v4, "presentedViewController");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v10 = (id)v9;
      objc_msgSend(a1, "_transitionEndPointWithViewController:", v9);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v12 = (id)v11;
LABEL_11:

      goto LABEL_12;
    }
  }
  else
  {

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "topViewController");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "selectedViewController");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "style"))
  {
    v10 = v4;
    if (!objc_msgSend(v10, "isCollapsed")
      || objc_msgSend(v10, "style") != 2
      || (objc_msgSend(v10, "viewControllerForColumn:", 1), (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v10, "viewControllerForColumn:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        objc_msgSend(v10, "viewControllerForColumn:", 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    objc_msgSend(a1, "_transitionEndPointWithViewController:", v14);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = v4;
    goto LABEL_12;
  }
  objc_msgSend((id)PURegisteredTilingViewTransitionEndPoints, "objectForKey:", v4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_12;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "childViewControllers", 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
LABEL_26:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v17)
        objc_enumerationMutation(v10);
      objc_msgSend(a1, "_transitionEndPointWithViewController:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18));
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
        goto LABEL_10;
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
        if (v16)
          goto LABEL_26;
        break;
      }
    }
  }

  PLUIGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "couldn't find tiling view controller transition end point for %@", buf, 0xCu);
  }

  v12 = 0;
LABEL_12:

  return v12;
}

void __91__PUTilingViewTransitionHelper_concatenatedProgressBlockForTilingView_transitionOperation___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  if (objc_msgSend(v3, "isActive"))
  {
    if (a1[6] == 1)
      objc_msgSend(v3, "presentationProgressBlock");
    else
      objc_msgSend(v3, "dismissalProgressBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _Block_copy(v4);

    if (v5)
    {
      v6 = _Block_copy(*(const void **)(*(_QWORD *)(a1[4] + 8) + 40));
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __91__PUTilingViewTransitionHelper_concatenatedProgressBlockForTilingView_transitionOperation___block_invoke_3;
      v11[3] = &unk_1E58A9A40;
      v12 = v6;
      v13 = v5;
      v7 = v6;
      v8 = _Block_copy(v11);
      v9 = *(_QWORD *)(a1[4] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    }

  }
}

uint64_t __91__PUTilingViewTransitionHelper_concatenatedProgressBlockForTilingView_transitionOperation___block_invoke_3(uint64_t a1, double a2)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 40) + 16))(a2);
}

@end
