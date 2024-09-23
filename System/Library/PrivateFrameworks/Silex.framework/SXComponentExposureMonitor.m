@implementation SXComponentExposureMonitor

- (SXComponentExposureMonitor)initWithViewport:(id)a3 appStateMonitor:(id)a4 componentController:(id)a5 host:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SXComponentExposureMonitor *v15;
  SXComponentExposureMonitor *v16;
  uint64_t v17;
  NSMutableSet *trackingComponents;
  char v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id location;
  objc_super v36;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v36.receiver = self;
  v36.super_class = (Class)SXComponentExposureMonitor;
  v15 = -[SXComponentExposureMonitor init](&v36, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_viewport, a3);
    objc_storeStrong((id *)&v16->_host, a6);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    trackingComponents = v16->_trackingComponents;
    v16->_trackingComponents = (NSMutableSet *)v17;

    objc_msgSend(v11, "addViewportChangeListener:forOptions:", v16, 26);
    objc_initWeak(&location, v16);
    v19 = objc_opt_respondsToSelector();
    v20 = MEMORY[0x24BDAC760];
    if ((v19 & 1) != 0)
    {
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke;
      v33[3] = &unk_24D6873B8;
      objc_copyWeak(&v34, &location);
      objc_msgSend(v12, "performOnApplicationWindowDidBecomeBackground:", v33);
      objc_destroyWeak(&v34);
    }
    v31[0] = v20;
    v31[1] = 3221225472;
    v31[2] = __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke_2;
    v31[3] = &unk_24D6873B8;
    objc_copyWeak(&v32, &location);
    objc_msgSend(v12, "performOnApplicationDidEnterBackground:", v31);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v29[0] = v20;
      v29[1] = 3221225472;
      v29[2] = __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke_3;
      v29[3] = &unk_24D6873B8;
      objc_copyWeak(&v30, &location);
      objc_msgSend(v12, "performOnApplicationWindowDidBecomeForeground:", v29);
      objc_destroyWeak(&v30);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v27[0] = v20;
      v27[1] = 3221225472;
      v27[2] = __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke_4;
      v27[3] = &unk_24D6873B8;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v12, "performOnApplicationWillEnterForeground:", v27);
      objc_destroyWeak(&v28);
    }
    v22 = v20;
    v23 = 3221225472;
    v24 = __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke_5;
    v25 = &unk_24D6873B8;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v12, "performOnApplicationDidBecomeActive:", &v22);
    objc_msgSend(v13, "addObserver:", v16, v22, v23, v24, v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "trackingComponents", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "lastObservedVisibilityState") == 1)
        {
          v9 = objc_loadWeakRetained(v1);
          objc_msgSend(v9, "endExposure:", v8);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

void __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "trackingComponents", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "lastObservedVisibilityState") == 1)
        {
          v9 = objc_loadWeakRetained(v1);
          objc_msgSend(v9, "endExposure:", v8);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

void __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performMonitoring");

}

void __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performMonitoring");

}

void __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performMonitoring");

}

- (void)onExposureOf:(id)a3 then:(id)a4
{
  -[SXComponentExposureMonitor onExposureOf:traits:then:when:](self, "onExposureOf:traits:then:when:", a3, 1, a4, 0);
}

- (void)onExposureOf:(id)a3 traits:(unint64_t)a4 then:(id)a5
{
  -[SXComponentExposureMonitor onExposureOf:traits:then:when:](self, "onExposureOf:traits:then:when:", a3, a4, a5, 0);
}

- (void)onExposureOf:(id)a3 then:(id)a4 when:(id)a5
{
  -[SXComponentExposureMonitor onExposureOf:traits:then:when:](self, "onExposureOf:traits:then:when:", a3, 1, a4, a5);
}

- (void)onExposureOf:(id)a3 traits:(unint64_t)a4 then:(id)a5 when:(id)a6
{
  void *v7;
  id v8;

  +[SXComponentExposureTracking exposureTrackingWithComponent:traits:exposureStateChangeBlock:conditionBlock:](SXComponentExposureTracking, "exposureTrackingWithComponent:traits:exposureStateChangeBlock:conditionBlock:", a3, a4, a5, a6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SXComponentExposureMonitor trackingComponents](self, "trackingComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  -[SXComponentExposureMonitor trackExposureForTracking:](self, "trackExposureForTracking:", v8);
}

- (void)stopTrackingExposureOfComponentView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SXComponentExposureMonitor trackingComponents](self, "trackingComponents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "componentView");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
        {
          -[SXComponentExposureMonitor trackingComponents](self, "trackingComponents");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "componentView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void)performMonitoring
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[SXComponentExposureMonitor viewport](self, "viewport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "appearState");

  if (v4 == 2)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[SXComponentExposureMonitor trackingComponents](self, "trackingComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          -[SXComponentExposureMonitor trackExposureForTracking:](self, "trackExposureForTracking:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v8);
    }
  }
  else
  {
    -[SXComponentExposureMonitor viewport](self, "viewport");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "appearState");

    if (v12)
      return;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[SXComponentExposureMonitor trackingComponents](self, "trackingComponents", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v13, "copy");

    v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v6);
          v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
          if (objc_msgSend(v18, "lastObservedVisibilityState") == 1)
            -[SXComponentExposureMonitor endExposure:](self, "endExposure:", v18);
        }
        v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v15);
    }
  }

}

- (void)trackExposureForTracking:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v25;
  double MinY;
  unsigned int (**v27)(void);
  double v28;
  CGFloat v29;
  CGFloat v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  uint64_t (**v44)(void);
  CGFloat v45;
  CGFloat v46;
  char v47;
  void *v48;
  double v49;
  char v50;
  void *v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  void *v60;
  CGFloat v61;
  CGFloat v62;
  _BOOL4 v63;
  void *v64;
  int v65;
  uint64_t v66;
  char v67;
  id v68;
  CGPoint v69;
  CGPoint v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v68 = a3;
  objc_msgSend(v68, "componentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v68;
  if (!v5)
    goto LABEL_27;
  objc_msgSend(v68, "componentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[SXComponentExposureMonitor viewport](self, "viewport");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dynamicBounds");
  v81.origin.x = v17;
  v81.origin.y = v18;
  v81.size.width = v19;
  v81.size.height = v20;
  v71.origin.x = v9;
  v71.origin.y = v11;
  v71.size.width = v13;
  v71.size.height = v15;
  v72 = CGRectIntersection(v71, v81);
  x = v72.origin.x;
  y = v72.origin.y;
  width = v72.size.width;
  height = v72.size.height;

  -[SXComponentExposureMonitor viewport](self, "viewport");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "dynamicBounds");
  MinY = CGRectGetMinY(v73);
  objc_msgSend(v68, "componentView");
  v27 = (unsigned int (**)(void))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "absoluteFrame");
  v28 = MinY - CGRectGetMinY(v74);

  if (v28 < 0.0)
    v28 = 0.0;
  v75.origin.x = x;
  v75.origin.y = y;
  v75.size.width = width;
  v75.size.height = height;
  v29 = CGRectGetWidth(v75);
  v76.origin.x = x;
  v76.origin.y = y;
  v76.size.width = width;
  v76.size.height = height;
  v30 = CGRectGetHeight(v76);
  v77.origin.x = 0.0;
  v77.origin.y = v28;
  v77.size.width = v29;
  v77.size.height = v30;
  objc_msgSend(v68, "setMinimumVisibleY:", CGRectGetMinY(v77));
  v78.origin.x = 0.0;
  v78.origin.y = v28;
  v78.size.width = v29;
  v78.size.height = v30;
  objc_msgSend(v68, "setMaximumVisibleY:", CGRectGetMaxY(v78));
  v31 = objc_msgSend(v68, "lastObservedVisibilityState");
  v6 = v68;
  if (v31 != 2)
  {
    if (v31 != 1)
    {
      v6 = v68;
      if (v31)
        goto LABEL_27;
      goto LABEL_7;
    }
    objc_msgSend(v68, "visibilityFactor");
    if (v33 < 0.0 || (objc_msgSend(v68, "visibilityFactor"), v34 >= 0.00000011920929))
    {
      objc_msgSend(v68, "conditionBlock");
      v66 = objc_claimAutoreleasedReturnValue();
      v6 = v68;
      if (!v66)
        goto LABEL_27;
      v35 = (void *)v66;
      objc_msgSend(v68, "conditionBlock");
      v44 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
      v47 = v44[2]();
    }
    else
    {
      if ((objc_msgSend(v68, "traits") & 2) == 0)
        goto LABEL_25;
      -[SXComponentExposureMonitor viewport](self, "viewport");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "dynamicBounds");
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v43 = v42;
      objc_msgSend(v68, "componentView");
      v44 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "absoluteFrame");
      v69.x = v45;
      v69.y = v46;
      v79.origin.x = v37;
      v79.origin.y = v39;
      v79.size.width = v41;
      v79.size.height = v43;
      v47 = CGRectContainsPoint(v79, v69);
    }
    v67 = v47;

    v6 = v68;
    if ((v67 & 1) != 0)
      goto LABEL_27;
LABEL_25:
    -[SXComponentExposureMonitor endExposure:](self, "endExposure:", v68);
    goto LABEL_26;
  }
LABEL_7:
  objc_msgSend(v6, "conditionBlock");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32
    && (objc_msgSend(v68, "conditionBlock"), v27 = (unsigned int (**)(void))objc_claimAutoreleasedReturnValue(),
                                             v27[2]()))
  {

    v6 = v68;
  }
  else
  {
    objc_msgSend(v68, "conditionBlock");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {

    }
    v6 = v68;
    if (v48)
      goto LABEL_27;
  }
  objc_msgSend(v6, "visibilityFactor");
  if (v49 >= 0.00000011920929)
    goto LABEL_30;
  v50 = objc_msgSend(v68, "traits");
  v6 = v68;
  if ((v50 & 2) != 0)
  {
    -[SXComponentExposureMonitor viewport](self, "viewport");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "dynamicBounds");
    v53 = v52;
    v55 = v54;
    v57 = v56;
    v59 = v58;
    objc_msgSend(v68, "componentView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "absoluteFrame");
    v70.x = v61;
    v70.y = v62;
    v80.origin.x = v53;
    v80.origin.y = v55;
    v80.size.width = v57;
    v80.size.height = v59;
    v63 = CGRectContainsPoint(v80, v70);

    v6 = v68;
    if (v63)
    {
LABEL_30:
      -[SXComponentExposureMonitor host](self, "host");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "active");

      v6 = v68;
      if (v65)
      {
        -[SXComponentExposureMonitor beginExposure:](self, "beginExposure:", v68);
LABEL_26:
        v6 = v68;
      }
    }
  }
LABEL_27:

}

- (void)beginExposure:(id)a3
{
  id v3;
  void (**v4)(id, uint64_t, double);

  v3 = a3;
  objc_msgSend(v3, "setLastObservedVisibilityState:", 1);
  objc_msgSend(v3, "exposureStateChangeBlock");
  v4 = (void (**)(id, uint64_t, double))objc_claimAutoreleasedReturnValue();

  v4[2](v4, 1, 0.0);
}

- (void)endExposure:(id)a3
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "exposureStateChangeBlock");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastStateChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v3[2](v3, 2);

  objc_msgSend(v6, "setLastObservedVisibilityState:", 2);
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (SXHost)host
{
  return self->_host;
}

- (NSMutableSet)trackingComponents
{
  return self->_trackingComponents;
}

- (void)setTrackingComponents:(id)a3
{
  objc_storeStrong((id *)&self->_trackingComponents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingComponents, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
}

@end
