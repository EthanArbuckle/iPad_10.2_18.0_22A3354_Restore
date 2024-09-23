@implementation PSURLControllerHandler

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  id *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  id WeakRetained;
  char isKindOfClass;
  NSObject *v42;
  objc_class *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  BOOL v77;
  NSObject *v78;
  double v79;
  void *v80;
  NSObject *v81;
  void *v82;
  char v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  NSObject *v90;
  void *v91;
  uint64_t v92;
  NSObject *v93;
  void *v94;
  void *v95;
  void *v96;
  unsigned int v97;
  NSObject *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  int v102;
  NSObject *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  uint64_t v112;
  NSObject *v113;
  void *v114;
  char v115;
  void *v116;
  void *v117;
  int v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  unsigned __int8 v125;
  uint8_t buf[4];
  const char *v127;
  __int16 v128;
  uint64_t v129;
  __int16 v130;
  uint64_t v131;
  __int16 v132;
  _BYTE v133[38];
  int v134;
  __int16 v135;
  _BOOL4 v136;
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PSURLControllerHandler delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446978;
    v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
    v128 = 2160;
    v129 = 1752392040;
    v130 = 2112;
    v131 = (uint64_t)v6;
    v132 = 2112;
    *(_QWORD *)v133 = v9;
    _os_log_impl(&dword_1A3819000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: resourceDictionary: %{mask.hash}@, delegate: %@", buf, 0x2Au);

  }
  if (!_applicationStateProvider)
  {
    PKLogForCategory(5);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
      _os_log_impl(&dword_1A3819000, v11, OS_LOG_TYPE_INFO, "%{public}s: State provider not set, continuing.", buf, 0xCu);
    }
LABEL_12:

    -[PSURLControllerHandler delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      PKLogForCategory(5);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[PSURLControllerHandler delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_handleURL_);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446978;
        v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
        v128 = 2160;
        v129 = 1752392040;
        v130 = 2112;
        v131 = (uint64_t)v18;
        v132 = 2114;
        *(_QWORD *)v133 = v19;
        _os_log_impl(&dword_1A3819000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s: Delegate '%{mask.hash}@' implements %{public}@.", buf, 0x2Au);

      }
      -[PSURLControllerHandler delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleURL:", v6);

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("path"));
    v11 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0C99DE8];
    -[NSObject pathComponents](v11, "pathComponents");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "arrayWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v23, "count"))
    {
      PKLogForCategory(5);
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        -[PSURLControllerHandler delegate](self, "delegate");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446722;
        v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
        v128 = 2160;
        v129 = 1752392040;
        v130 = 2112;
        v131 = (uint64_t)v68;
        _os_log_impl(&dword_1A3819000, v67, OS_LOG_TYPE_DEFAULT, "%{public}s: Delegate '%{mask.hash}@' no path components to process calling completion if set and bailing.", buf, 0x20u);

      }
      -[PSURLControllerHandler _performCompletionAfterActiveTransitionCompletes:](self, "_performCompletionAfterActiveTransitionCompletes:", v7);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pptTestName"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v69)
        goto LABEL_120;
      -[PSURLControllerHandler delegate](self, "delegate");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_opt_respondsToSelector();

      if ((v71 & 1) == 0)
        goto LABEL_120;
      -[PSURLControllerHandler delegate](self, "delegate");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "handleScrollPPTTestName:", v69);
LABEL_119:

LABEL_120:
      goto LABEL_121;
    }
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = 0;
    if ((unint64_t)objc_msgSend(v23, "count") >= 2)
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
      v26 = objc_claimAutoreleasedReturnValue();
      SFObjectAndOffsetForURLPair();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("object"));
      v25 = objc_claimAutoreleasedReturnValue();

    }
    v124 = (void *)v25;
    v122 = (void *)v26;
    objc_msgSend(v23, "removeObjectAtIndex:", 0);
    v121 = (void *)v24;
    SFObjectAndOffsetForURLPair();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", CFSTR("object"));
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", CFSTR("offsetValue"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "floatValue");
    v32 = v31;

    v120 = v28;
    objc_msgSend(v28, "objectForKey:", CFSTR("offsetItem"));
    v123 = objc_claimAutoreleasedReturnValue();
    -[PSURLControllerHandler delegate](self, "delegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = (void *)v29;
    objc_msgSend(v33, "specifierForID:", v29);
    v34 = (id *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("animate"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend(v35, "BOOLValue");

    if (!v34)
      goto LABEL_56;
    objc_msgSend(v34, "propertyForKey:", CFSTR("enabled"));
    v36 = objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = (void *)v36;
      objc_msgSend(v34, "propertyForKey:", CFSTR("enabled"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "BOOLValue");

      if (!v39)
      {
LABEL_56:
        PKLogForCategory(5);
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
          v128 = 2160;
          v129 = 1752392040;
          v130 = 2112;
          v131 = (uint64_t)v34;
          _os_log_impl(&dword_1A3819000, v73, OS_LOG_TYPE_DEFAULT, "%{public}s: Specifier %{mask.hash}@ cannot handle URL (either nil or disabled), calling completion and bailing.", buf, 0x20u);
        }

        objc_opt_class();
        -[PSURLControllerHandler delegate](self, "delegate");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v75 = v74;
        else
          v75 = 0;
        v47 = v75;

        v76 = (void *)v123;
        if (v123)
          v77 = 0;
        else
          v77 = v32 == 0.0;
        if (!v77 && v47)
        {
          PKLogForCategory(5);
          v78 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
            _os_log_impl(&dword_1A3819000, v78, OS_LOG_TYPE_DEFAULT, "%{public}s: delegate has pending scroll/highlight operation to perform.", buf, 0xCu);
          }

          if (v32 == 0.0)
          {
            -[PSURLControllerHandler _performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:](self, "_performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:", v47, 0, v123);
          }
          else
          {
            *(float *)&v79 = v32;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v79);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            -[PSURLControllerHandler _performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:](self, "_performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:", v47, v80, v123);

          }
        }
        -[PSURLControllerHandler _performCompletionAfterActiveTransitionCompletes:](self, "_performCompletionAfterActiveTransitionCompletes:", v7);
        goto LABEL_118;
      }
    }
    WeakRetained = objc_loadWeakRetained(v34 + 1);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      PKLogForCategory(5);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446978;
        v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
        v128 = 2160;
        v129 = 1752392040;
        v130 = 2112;
        v131 = (uint64_t)v34;
        v132 = 2114;
        *(_QWORD *)v133 = v44;
        _os_log_impl(&dword_1A3819000, v42, OS_LOG_TYPE_DEFAULT, "%{public}s: Specifier %{mask.hash}@ has target that is a %{public}@, calling load.", buf, 0x2Au);

      }
      v45 = objc_loadWeakRetained(v34 + 1);
      objc_msgSend(v45, "load");

    }
    -[PSURLControllerHandler delegate](self, "delegate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "selectSpecifier:", v34);
    v47 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "loadViewIfNeeded");
    PKLogForCategory(5);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      -[PSURLControllerHandler delegate](self, "delegate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136447746;
      v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
      v128 = 2160;
      v129 = 1752392040;
      v130 = 2112;
      v131 = (uint64_t)v49;
      v132 = 2160;
      *(_QWORD *)v133 = 1752392040;
      *(_WORD *)&v133[8] = 2112;
      *(_QWORD *)&v133[10] = v47;
      *(_WORD *)&v133[18] = 2160;
      *(_QWORD *)&v133[20] = 1752392040;
      *(_WORD *)&v133[28] = 2112;
      *(_QWORD *)&v133[30] = v34;
      _os_log_impl(&dword_1A3819000, v48, OS_LOG_TYPE_DEFAULT, "%{public}s: Delegate '%{mask.hash}@' returned target controller %{mask.hash}@ for specifier %{mask.hash}@", buf, 0x48u);

    }
    objc_opt_class();
    -[PSURLControllerHandler delegate](self, "delegate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v51 = v50;
    else
      v51 = 0;
    v52 = v51;

    v117 = v52;
    if (objc_msgSend(v52, "isURLHandlingDeferredForViewControllerContainment")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      PKLogForCategory(5);
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        -[PSURLControllerHandler delegate](self, "delegate");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_isURLHandlingDeferredForViewControllerContainment);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136447490;
        v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
        v128 = 2160;
        v129 = 1752392040;
        v130 = 2112;
        v131 = (uint64_t)v111;
        v132 = 2114;
        *(_QWORD *)v133 = v114;
        *(_WORD *)&v133[8] = 2160;
        *(_QWORD *)&v133[10] = 1752392040;
        *(_WORD *)&v133[18] = 2112;
        *(_QWORD *)&v133[20] = v47;
        _os_log_impl(&dword_1A3819000, v53, OS_LOG_TYPE_DEFAULT, "%{public}s: Delegate '%{mask.hash}@' has %{public}@ set, setting on target controller %{mask.hash}@.", buf, 0x3Eu);

      }
      objc_msgSend(v47, "setUrlHandlingDeferredForViewControllerContainment:", objc_msgSend(v52, "isURLHandlingDeferredForViewControllerContainment"));
    }
    if (v47 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v34, "setProperty:forKey:", v6, CFSTR("URLDictionary"));
      objc_opt_class();
      v115 = objc_opt_isKindOfClass();
      if ((v115 & 1) == 0)
      {
        PKLogForCategory(5);
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v112 = objc_opt_class();
          -[PSURLControllerHandler delegate](self, "delegate");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "rootController");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136447490;
          v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
          v128 = 2160;
          v129 = 1752392040;
          v130 = 2112;
          v131 = (uint64_t)v47;
          v132 = 2114;
          *(_QWORD *)v133 = v112;
          *(_WORD *)&v133[8] = 2160;
          *(_QWORD *)&v133[10] = 1752392040;
          *(_WORD *)&v133[18] = 2112;
          *(_QWORD *)&v133[20] = v56;
          _os_log_impl(&dword_1A3819000, v54, OS_LOG_TYPE_DEFAULT, "%{public}s: Target controller %{mask.hash}@ is not a %{public}@, setting rootController to %{mask.hash}@.", buf, 0x3Eu);

        }
        -[PSURLControllerHandler delegate](self, "delegate");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "rootController");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setRootController:", v58);

      }
      -[PSURLControllerHandler delegate](self, "delegate");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_opt_respondsToSelector();

      if ((v60 & 1) != 0)
      {
        PKLogForCategory(5);
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(sel_isShowingSetupController);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[PSURLControllerHandler delegate](self, "delegate");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136447234;
          v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
          v128 = 2114;
          v129 = (uint64_t)v62;
          v130 = 2160;
          v131 = 1752392040;
          v132 = 2112;
          *(_QWORD *)v133 = v63;
          *(_WORD *)&v133[8] = 1024;
          *(_DWORD *)&v133[10] = v115 & 1;
          _os_log_impl(&dword_1A3819000, v61, OS_LOG_TYPE_DEFAULT, "%{public}s: Setting %{public}@ on delegate %{mask.hash}@ to %{BOOL}d.", buf, 0x30u);

        }
        -[PSURLControllerHandler delegate](self, "delegate");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setShowingSetupController:", v115 & 1);

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fromSearch"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v65, "BOOLValue") & 1) != 0)
      {

        goto LABEL_76;
      }
      v83 = objc_msgSend(v47, "canBeShownFromSuspendedState");

      if ((v83 & 1) != 0)
      {
LABEL_76:
        if (v32 == 0.0)
        {
          if (v123)
            v86 = (void *)v123;
          else
            v86 = v124;
          -[PSURLControllerHandler _performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:](self, "_performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:", v47, 0, v86);
        }
        else
        {
          *(float *)&v66 = v32;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v66);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          if (v123)
            v85 = (void *)v123;
          else
            v85 = v124;
          -[PSURLControllerHandler _performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:](self, "_performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:", v47, v84, v85);

        }
        -[PSURLControllerHandler delegate](self, "delegate");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[PSURLControllerHandler delegate](self, "delegate");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = objc_msgSend(v88, "conformsToProtocol:", &unk_1EE6E3CA8);

          if (!v89)
            goto LABEL_91;
          PKLogForCategory(5);
          v90 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
          {
            -[PSURLControllerHandler delegate](self, "delegate");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136447234;
            v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
            v128 = 2160;
            v129 = 1752392040;
            v130 = 2112;
            v131 = (uint64_t)v91;
            v132 = 2160;
            *(_QWORD *)v133 = 1752392040;
            *(_WORD *)&v133[8] = 2112;
            *(_QWORD *)&v133[10] = v47;
            _os_log_impl(&dword_1A3819000, v90, OS_LOG_TYPE_DEFAULT, "%{public}s: Setting delegate %{mask.hash}@ as parentController for target controller %{mask.hash}@.", buf, 0x34u);

          }
          -[PSURLControllerHandler delegate](self, "delegate");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setParentController:", v87);
        }

LABEL_91:
        objc_msgSend(v47, "setSpecifier:", v34);
        objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v23);
        v92 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "setObject:forKey:", v92, CFSTR("path"));
        v125 = 0;
        v113 = v92;
        if (objc_msgSend(v23, "count") && (objc_opt_respondsToSelector() & 1) != 0)
        {
          PKLogForCategory(5);
          v93 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromSelector(sel_prepareHandlingURLForSpecifierID_resourceDictionary_animatePush_);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446978;
            v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
            v128 = 2160;
            v129 = 1752392040;
            v130 = 2112;
            v131 = (uint64_t)v47;
            v132 = 2114;
            *(_QWORD *)v133 = v94;
            _os_log_impl(&dword_1A3819000, v93, OS_LOG_TYPE_DEFAULT, "%{public}s: Target controller %{mask.hash}@ responds to %{public}@", buf, 0x2Au);

          }
          SFObjectAndOffsetForURLPair();
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("object"));
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          if (v96)
          {
            v109 = v96;
            v97 = objc_msgSend(v47, "prepareHandlingURLForSpecifierID:resourceDictionary:animatePush:withCompletion:", v96, v116, &v125, v7) ^ 1;
            PKLogForCategory(5);
            v98 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
            {
              NSStringFromSelector(sel_prepareHandlingURLForSpecifierID_resourceDictionary_animatePush_);
              v99 = v95;
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136447746;
              v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
              v128 = 2160;
              v129 = 1752392040;
              v130 = 2112;
              v131 = (uint64_t)v47;
              v132 = 1024;
              *(_DWORD *)v133 = v97;
              *(_WORD *)&v133[4] = 2114;
              *(_QWORD *)&v133[6] = v100;
              *(_WORD *)&v133[14] = 2160;
              *(_QWORD *)&v133[16] = 1752392040;
              *(_WORD *)&v133[24] = 2112;
              *(_QWORD *)&v133[26] = v109;
              _os_log_impl(&dword_1A3819000, v98, OS_LOG_TYPE_DEFAULT, "%{public}s: Target controller %{mask.hash}@ returned %{BOOL}d from %{public}@ for specifier identifier %{mask.hash}@", buf, 0x44u);

              v95 = v99;
            }

            v96 = v109;
          }
          else
          {
            v97 = 0;
          }

          if (v125)
            v101 = v97;
          else
            v101 = 0;
          v102 = v97;
        }
        else
        {
          v101 = 0;
          v102 = 0;
        }
        if ((v101 & 1) == 0 && ((v118 ^ 1) & 1) == 0)
          v101 = objc_msgSend(v23, "count") == 0;
        PKLogForCategory(5);
        v103 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
        {
          -[PSURLControllerHandler delegate](self, "delegate");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = v102;
          v102 = v125;
          v105 = objc_msgSend(v23, "count");
          *(_DWORD *)buf = 136448514;
          v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
          v128 = 2160;
          v129 = 1752392040;
          v130 = 2112;
          v131 = (uint64_t)v104;
          v132 = 2160;
          *(_QWORD *)v133 = 1752392040;
          *(_WORD *)&v133[8] = 2112;
          *(_QWORD *)&v133[10] = v47;
          *(_WORD *)&v133[18] = 1024;
          *(_DWORD *)&v133[20] = v101;
          *(_WORD *)&v133[24] = 1024;
          *(_DWORD *)&v133[26] = v102;
          LOBYTE(v102) = v110;
          *(_WORD *)&v133[30] = 1024;
          *(_DWORD *)&v133[32] = v110;
          *(_WORD *)&v133[36] = 1024;
          v134 = v118;
          v135 = 1024;
          v136 = v105 == 0;
          _os_log_impl(&dword_1A3819000, v103, OS_LOG_TYPE_DEFAULT, "%{public}s: Requesting delegate %{mask.hash}@ show target controller %{mask.hash}@ with animation resolved to %{BOOL}d ((controllerWantsAnimation: %{BOOL}d && deferHandleURL: %{BOOL}d) || (animate: %{BOOL}d && pathComponents.count == 0: %{BOOL}d))", buf, 0x52u);

        }
        -[PSURLControllerHandler delegate](self, "delegate");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "showController:animate:", v47, v101);

        if ((v102 & 1) == 0)
        {
          PKLogForCategory(5);
          v107 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromSelector(sel_handleURL_withCompletion_);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136447490;
            v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
            v128 = 2114;
            v129 = (uint64_t)v108;
            v130 = 2160;
            v131 = 1752392040;
            v132 = 2112;
            *(_QWORD *)v133 = v47;
            *(_WORD *)&v133[8] = 2160;
            *(_QWORD *)&v133[10] = 1752392040;
            *(_WORD *)&v133[18] = 2112;
            *(_QWORD *)&v133[20] = v116;
            _os_log_impl(&dword_1A3819000, v107, OS_LOG_TYPE_DEFAULT, "%{public}s: Calling %{public}@ on target controller %{mask.hash}@ with new resource dictionary %{mask.hash}@", buf, 0x3Eu);

          }
          objc_msgSend(v47, "handleURL:withCompletion:", v116, v7);
        }

        v11 = v113;
        goto LABEL_117;
      }
      PKLogForCategory(5);
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
        v128 = 2160;
        v129 = 1752392040;
        v130 = 2112;
        v131 = (uint64_t)v47;
        _os_log_impl(&dword_1A3819000, v81, OS_LOG_TYPE_DEFAULT, "%{public}s: Target controller %{mask.hash}@ cannot be shown from suspended state, calling completion if set and bailing.", buf, 0x20u);
      }
    }
    else
    {
      PKLogForCategory(5);
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        -[PSURLControllerHandler delegate](self, "delegate");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136447746;
        v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
        v128 = 2160;
        v129 = 1752392040;
        v130 = 2112;
        v131 = (uint64_t)v82;
        v132 = 2160;
        *(_QWORD *)v133 = 1752392040;
        *(_WORD *)&v133[8] = 2112;
        *(_QWORD *)&v133[10] = v47;
        *(_WORD *)&v133[18] = 2160;
        *(_QWORD *)&v133[20] = 1752392040;
        *(_WORD *)&v133[28] = 2112;
        *(_QWORD *)&v133[30] = v34;
        _os_log_impl(&dword_1A3819000, v81, OS_LOG_TYPE_DEFAULT, "%{public}s: Delegate '%{mask.hash}@' returned %{mask.hash}@ for specifier %{mask.hash}@ which is not a UIViewController class, calling completion if set and bailing.", buf, 0x48u);

      }
    }

    -[PSURLControllerHandler _performCompletionAfterActiveTransitionCompletes:](self, "_performCompletionAfterActiveTransitionCompletes:", v7);
LABEL_117:
    v76 = (void *)v123;

LABEL_118:
    v69 = v121;
    v72 = v122;
    goto LABEL_119;
  }
  v10 = (void *)MEMORY[0x1E0C9AA70];
  if (v6)
    v10 = v6;
  v11 = v10;
  v12 = objc_msgSend((id)_applicationStateProvider, "shouldContinueActiveURLRoutingForURLResourceDictionary:", v11);
  PKLogForCategory(5);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136447234;
      v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
      v128 = 2160;
      v129 = 1752392040;
      v130 = 2112;
      v131 = _applicationStateProvider;
      v132 = 2160;
      *(_QWORD *)v133 = 1752392040;
      *(_WORD *)&v133[8] = 2112;
      *(_QWORD *)&v133[10] = v6;
      _os_log_impl(&dword_1A3819000, v14, OS_LOG_TYPE_INFO, "%{public}s: State provider '%{mask.hash}@' has indicated URL routing should continue for URL resource dictionary %{mask.hash}@.", buf, 0x34u);
    }

    goto LABEL_12;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
    v128 = 2160;
    v129 = 1752392040;
    v130 = 2112;
    v131 = _applicationStateProvider;
    v132 = 2160;
    *(_QWORD *)v133 = 1752392040;
    *(_WORD *)&v133[8] = 2112;
    *(_QWORD *)&v133[10] = v6;
    _os_log_impl(&dword_1A3819000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: State provider '%{mask.hash}@' has indicated URL routing should stop for URL resource dictionary %{mask.hash}@. Calling completion handler if set and bailing.", buf, 0x34u);
  }

  -[PSURLControllerHandler _performCompletionAfterActiveTransitionCompletes:](self, "_performCompletionAfterActiveTransitionCompletes:", v7);
LABEL_121:

}

+ (void)registerApplicationURLStateProvider:(id)a3
{
  objc_storeStrong((id *)&_applicationStateProvider, a3);
}

- (void)_performCompletionAfterActiveTransitionCompletes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  -[PSURLControllerHandler delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__PSURLControllerHandler__performCompletionAfterActiveTransitionCompletes___block_invoke;
  v17[3] = &unk_1E4A65708;
  v9 = v4;
  v18 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x1A8594D10](v17);
  if (v7)
  {
    objc_msgSend(v7, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transitionCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v15[0] = v8;
      v15[1] = 3221225472;
      v15[2] = __75__PSURLControllerHandler__performCompletionAfterActiveTransitionCompletes___block_invoke_3;
      v15[3] = &unk_1E4A66640;
      v16 = v10;
      objc_msgSend(v12, "animateAlongsideTransition:completion:", &__block_literal_global_11, v15);

    }
    else
    {
      PKLogForCategory(5);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[PSURLControllerHandler _performCompletionAfterActiveTransitionCompletes:]";
        _os_log_impl(&dword_1A3819000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: Calling Completion Handler (no active transition).", buf, 0xCu);
      }

      v10[2](v10);
    }

  }
  else
  {
    PKLogForCategory(5);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v20 = "-[PSURLControllerHandler _performCompletionAfterActiveTransitionCompletes:]";
      _os_log_impl(&dword_1A3819000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s: Calling Completion Handler (delegate not a View Controller).", buf, 0xCu);
    }

    v10[2](v10);
  }

}

uint64_t __75__PSURLControllerHandler__performCompletionAfterActiveTransitionCompletes___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __75__PSURLControllerHandler__performCompletionAfterActiveTransitionCompletes___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446210;
    v5 = "-[PSURLControllerHandler _performCompletionAfterActiveTransitionCompletes:]_block_invoke_3";
    _os_log_impl(&dword_1A3819000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: Calling Completion Handler (after transition complete).", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performScrollingAndHighlightingOperationsOnController:(id)a3 withOffset:(id)a4 scrollTargetIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = &unk_1EE6E5C88;
  if (objc_msgSend(v7, "conformsToProtocol:", v10))
    v11 = v7;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    if (v8)
    {
      PKLogForCategory(5);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136446978;
        v21 = "-[PSURLControllerHandler _performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:]";
        v22 = 2114;
        v23 = (uint64_t)v8;
        v24 = 2160;
        v25 = 1752392040;
        v26 = 2112;
        v27 = (uint64_t)v12;
        _os_log_impl(&dword_1A3819000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s: Setting scrollOffset to %{public}@ on Target controller %{mask.hash}@.", (uint8_t *)&v20, 0x2Au);
      }

      objc_msgSend(v8, "floatValue");
      objc_msgSend(v12, "setDesiredVerticalContentOffset:");
    }
    else
    {
      v14 = objc_msgSend(v9, "length");
      PKLogForCategory(5);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v16)
        {
          v20 = 136447234;
          v21 = "-[PSURLControllerHandler _performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:]";
          v22 = 2160;
          v23 = 1752392040;
          v24 = 2112;
          v25 = (uint64_t)v9;
          v26 = 2160;
          v27 = 1752392040;
          v28 = 2112;
          v29 = v12;
          _os_log_impl(&dword_1A3819000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s: Setting scrollTarget to %{mask.hash}@ on Target controller %{mask.hash}@.", (uint8_t *)&v20, 0x34u);
        }

        objc_msgSend(v12, "setDesiredVerticalContentOffsetItemNamed:", v9);
      }
      else
      {
        if (v16)
        {
          v20 = 136446722;
          v21 = "-[PSURLControllerHandler _performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:]";
          v22 = 2160;
          v23 = 1752392040;
          v24 = 2112;
          v25 = (uint64_t)v12;
          _os_log_impl(&dword_1A3819000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s: No offset to set on Target controller %{mask.hash}@.", (uint8_t *)&v20, 0x20u);
        }

      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = objc_msgSend(v9, "length");
    PKLogForCategory(5);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        v20 = 136447234;
        v21 = "-[PSURLControllerHandler _performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:]";
        v22 = 2160;
        v23 = 1752392040;
        v24 = 2112;
        v25 = (uint64_t)v9;
        v26 = 2160;
        v27 = 1752392040;
        v28 = 2112;
        v29 = v7;
        _os_log_impl(&dword_1A3819000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s: Setting highlight target to %{mask.hash}@ on Target controller %{mask.hash}@.", (uint8_t *)&v20, 0x34u);
      }

      objc_msgSend(v7, "highlightSpecifierWithID:", v9);
    }
    else
    {
      if (v19)
      {
        v20 = 136446722;
        v21 = "-[PSURLControllerHandler _performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:]";
        v22 = 2160;
        v23 = 1752392040;
        v24 = 2112;
        v25 = (uint64_t)v7;
        _os_log_impl(&dword_1A3819000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s: No highlight target to set on Target controller %{mask.hash}@.", (uint8_t *)&v20, 0x20u);
      }

    }
  }

}

- (PSURLControllerHandlerDelegate)delegate
{
  return (PSURLControllerHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
