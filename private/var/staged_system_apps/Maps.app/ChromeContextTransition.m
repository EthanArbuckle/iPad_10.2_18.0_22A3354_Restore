@implementation ChromeContextTransition

- (id)initForTransitionFromContexts:(id)a3 toContexts:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  ChromeContextTransition *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  GroupAnimation *leaveAnimation;
  uint64_t v15;
  GroupAnimation *enterAnimation;
  id v17;
  NSObject *v18;
  ChromeContextTransition *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  _UNKNOWN **v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  const char *v28;
  id v29;
  void *v30;
  void *v31;
  __CFString *v32;
  id v33;
  void *v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  GroupAnimation *v38;
  GroupAnimation *v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  __CFString *v46;
  GroupAnimation *v47;
  GroupAnimation *v48;
  objc_class *v49;
  NSString *v50;
  void *v51;
  void *v52;
  void *v53;
  __CFString *v54;
  __CFString *v56;
  const char *v57;
  void *v58;
  objc_super v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  __CFString *v65;
  __int16 v66;
  __CFString *v67;
  __int16 v68;
  __CFString *v69;
  __int16 v70;
  __CFString *v71;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v59.receiver = self;
  v59.super_class = (Class)ChromeContextTransition;
  v10 = -[ChromeContextTransition init](&v59, "init");
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
    objc_storeWeak((id *)&v10->_previousTopContext, v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
    objc_storeWeak((id *)&v10->_nextTopContext, v12);

    objc_storeStrong((id *)&v10->_pendingContexts, a4);
    v13 = objc_claimAutoreleasedReturnValue(+[GroupAnimation animationForAnimatedFlag:](GroupAnimation, "animationForAnimatedFlag:", v5));
    leaveAnimation = v10->_leaveAnimation;
    v10->_leaveAnimation = (GroupAnimation *)v13;

    v15 = objc_claimAutoreleasedReturnValue(+[GroupAnimation animationForAnimatedFlag:](GroupAnimation, "animationForAnimatedFlag:", v5));
    enterAnimation = v10->_enterAnimation;
    v10->_enterAnimation = (GroupAnimation *)v15;

    v17 = sub_100B1163C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
LABEL_37:

      goto LABEL_38;
    }
    v19 = v10;
    v20 = (objc_class *)objc_opt_class(v19);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = MKPlaceCollectionsLogicController_ptr;
    if ((objc_opt_respondsToSelector(v19, "accessibilityIdentifier") & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeContextTransition performSelector:](v19, "performSelector:", "accessibilityIdentifier"));
      v25 = v24;
      if (v24 && !objc_msgSend(v24, "isEqualToString:", v22))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v22, v19, v25));

        v23 = MKPlaceCollectionsLogicController_ptr;
LABEL_8:

        v27 = v26;
        v28 = "not ";
        if (v5)
          v28 = "";
        v57 = v28;
        v58 = v27;
        v29 = v8;
        v30 = v29;
        if (v29)
        {
          if (objc_msgSend(v29, "count"))
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "componentsJoinedByString:", CFSTR(", ")));
            v32 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23[390], "stringWithFormat:", CFSTR("<%p> [%@]"), v30, v31));

          }
          else
          {
            v32 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23[390], "stringWithFormat:", CFSTR("<%p> (empty)"), v30));
          }
        }
        else
        {
          v32 = CFSTR("<nil>");
        }

        v56 = v32;
        v33 = v9;
        v34 = v33;
        if (v33)
        {
          if (objc_msgSend(v33, "count"))
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "componentsJoinedByString:", CFSTR(", ")));
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23[390], "stringWithFormat:", CFSTR("<%p> [%@]"), v34, v35));

          }
          else
          {
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23[390], "stringWithFormat:", CFSTR("<%p> (empty)"), v34));
          }
        }
        else
        {
          v36 = CFSTR("<nil>");
        }

        v37 = v36;
        v38 = v10->_leaveAnimation;
        v39 = v38;
        if (!v38)
        {
          v45 = CFSTR("<nil>");
LABEL_28:

          v46 = v45;
          v47 = v10->_enterAnimation;
          v48 = v47;
          if (!v47)
          {
            v54 = CFSTR("<nil>");
            goto LABEL_36;
          }
          v49 = (objc_class *)objc_opt_class(v47);
          v50 = NSStringFromClass(v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
          if ((objc_opt_respondsToSelector(v48, "accessibilityIdentifier") & 1) != 0)
          {
            v52 = (void *)objc_claimAutoreleasedReturnValue(-[GroupAnimation performSelector:](v48, "performSelector:", "accessibilityIdentifier"));
            v53 = v52;
            if (v52 && !objc_msgSend(v52, "isEqualToString:", v51))
            {
              v54 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v51, v48, v53));

              goto LABEL_34;
            }

          }
          v54 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v51, v48));
LABEL_34:

LABEL_36:
          *(_DWORD *)buf = 138544642;
          v61 = v58;
          v62 = 2080;
          v63 = v57;
          v64 = 2114;
          v65 = v56;
          v66 = 2114;
          v67 = v37;
          v68 = 2114;
          v69 = v46;
          v70 = 2114;
          v71 = v54;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[%{public}@] Initialising transition (%sanimated)\n\tfrom: %{public}@\n\tto: %{public}@\nleaveAnimation: %{public}@\nenterAnimation: %{public}@", buf, 0x3Eu);

          goto LABEL_37;
        }
        v40 = (objc_class *)objc_opt_class(v38);
        v41 = NSStringFromClass(v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        if ((objc_opt_respondsToSelector(v39, "accessibilityIdentifier") & 1) != 0)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[GroupAnimation performSelector:](v39, "performSelector:", "accessibilityIdentifier"));
          v44 = v43;
          if (v43 && !objc_msgSend(v43, "isEqualToString:", v42))
          {
            v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v42, v39, v44));

            goto LABEL_26;
          }

        }
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v42, v39));
LABEL_26:

        goto LABEL_28;
      }

      v23 = MKPlaceCollectionsLogicController_ptr;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23[390], "stringWithFormat:", CFSTR("%@<%p>"), v22, v19));
    goto LABEL_8;
  }
LABEL_38:

  return v10;
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  GroupAnimation *v5;
  GroupAnimation *v6;
  GroupAnimation *v7;
  id v8;
  id v9;
  NSObject *v10;
  ChromeContextTransition *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;
  _QWORD v22[4];
  GroupAnimation *v23;
  uint8_t buf[4];
  void *v25;

  v4 = a3;
  v5 = self->_leaveAnimation;
  v6 = self->_enterAnimation;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100B1190C;
  v22[3] = &unk_1011AE8F8;
  v7 = v6;
  v23 = v7;
  -[GroupAnimation addCompletion:](v5, "addCompletion:", v22);
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100B11914;
  v18[3] = &unk_1011AE988;
  objc_copyWeak(&v20, &location);
  v8 = v4;
  v19 = v8;
  -[GroupAnimation addCompletion:](v7, "addCompletion:", v18);
  v9 = sub_100B1163C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = self;
    v12 = (objc_class *)objc_opt_class(v11);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeContextTransition performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && (objc_msgSend(v15, "isEqualToString:", v14) & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_7;
      }

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_7:

    *(_DWORD *)buf = 138543362;
    v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}@] Starting transition...", buf, 0xCu);

  }
  -[GroupAnimation runWithCurrentOptions](v5, "runWithCurrentOptions");

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (BOOL)hasStarted
{
  if (-[GroupAnimation hasStarted](self->_leaveAnimation, "hasStarted"))
    return 1;
  else
    return -[GroupAnimation hasStarted](self->_enterAnimation, "hasStarted");
}

- (GroupAnimation)leaveAnimation
{
  return self->_leaveAnimation;
}

- (GroupAnimation)enterAnimation
{
  return self->_enterAnimation;
}

- (ChromeContext)previousTopContext
{
  return (ChromeContext *)objc_loadWeakRetained((id *)&self->_previousTopContext);
}

- (ChromeContext)nextTopContext
{
  return (ChromeContext *)objc_loadWeakRetained((id *)&self->_nextTopContext);
}

- (NSArray)pendingContexts
{
  return self->_pendingContexts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingContexts, 0);
  objc_destroyWeak((id *)&self->_nextTopContext);
  objc_destroyWeak((id *)&self->_previousTopContext);
  objc_storeStrong((id *)&self->_enterAnimation, 0);
  objc_storeStrong((id *)&self->_leaveAnimation, 0);
}

@end
