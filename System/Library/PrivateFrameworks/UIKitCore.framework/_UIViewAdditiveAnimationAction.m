@implementation _UIViewAdditiveAnimationAction

- (_UIViewAdditiveAnimationAction)initWithPendingAnimation:(id)a3 withAnimationObject:(id)a4 forView:(id)a5
{
  id v9;
  id v10;
  id v11;
  _UIViewAdditiveAnimationAction *v12;
  _UIViewAdditiveAnimationAction *v13;
  _UIViewAdditiveAnimationAction *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_UIViewAdditiveAnimationAction;
  v12 = -[_UIViewAdditiveAnimationAction init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pendingAnimation, a3);
    objc_storeStrong((id *)&v13->_animationObject, a4);
    objc_storeStrong((id *)&v13->_view, a5);
    v14 = v13;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_animationObject, 0);
  objc_storeStrong((id *)&self->_pendingAnimation, 0);
}

- (void)runActionForKey:(id)a3 object:(id)a4 arguments:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  id v14;
  id v15;
  void (**v16)(void *, void *);
  id v17;
  id v18;
  void (**v19)(void *, id, void *, const __CFString *);
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  _QWORD v91[4];
  id v92;
  _UIViewAdditiveAnimationAction *v93;
  id v94;
  _QWORD aBlock[4];
  id v96;
  _UIViewAdditiveAnimationAction *v97;
  id v98;
  char v99;

  v7 = a3;
  v8 = a4;
  -[_UIViewAdditiveAnimationAction animationObject](self, "animationObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)__currentViewAnimationState;
    -[_UIViewAdditiveAnimationAction view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "_shouldAnimateAdditivelyForKey:onLayer:forView:", v7, v8, v11);

  }
  else
  {
    v12 = 1;
  }
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67___UIViewAdditiveAnimationAction_runActionForKey_object_arguments___block_invoke;
  aBlock[3] = &unk_1E16EB128;
  v14 = v8;
  v96 = v14;
  v97 = self;
  v15 = v7;
  v98 = v15;
  v99 = v12;
  v16 = (void (**)(void *, void *))_Block_copy(aBlock);
  v91[0] = v13;
  v91[1] = 3221225472;
  v91[2] = __67___UIViewAdditiveAnimationAction_runActionForKey_object_arguments___block_invoke_2;
  v91[3] = &unk_1E16EB150;
  v17 = v14;
  v92 = v17;
  v93 = self;
  v18 = v15;
  v94 = v18;
  v19 = (void (**)(void *, id, void *, const __CFString *))_Block_copy(v91);
  -[_UIViewAdditiveAnimationAction pendingAnimation](self, "pendingAnimation");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_UIViewAdditiveAnimationAction pendingAnimation](self, "pendingAnimation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "toValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {

    }
    else
    {
      -[_UIViewAdditiveAnimationAction pendingAnimation](self, "pendingAnimation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "keyPath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
        goto LABEL_8;
      -[_UIViewAdditiveAnimationAction animationObject](self, "animationObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = (void *)v25;
        -[_UIViewAdditiveAnimationAction animationObject](self, "animationObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isIntrospectable");

        if (v28)
        {
          -[_UIViewAdditiveAnimationAction pendingAnimation](self, "pendingAnimation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v16[2](v16, v29);

        }
      }
      if (v12)
      {
        -[_UIViewAdditiveAnimationAction animationObject](self, "animationObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30
          && (-[_UIViewAdditiveAnimationAction animationObject](self, "animationObject"),
              v31 = (void *)objc_claimAutoreleasedReturnValue(),
              v32 = objc_msgSend(v31, "_generatePointValueSpringAnimationsForKeyPath:", v18),
              v31,
              v32))
        {
          -[_UIViewAdditiveAnimationAction pendingAnimation](self, "pendingAnimation");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "valueForKeyPath:", v18);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIViewAdditiveAnimationAction animationObject](self, "animationObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "fromValue");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "_setOriginalFromValue:forKey:inLayer:", v36, v18, v17);

          -[_UIViewAdditiveAnimationAction animationObject](self, "animationObject");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "_setOriginalToValue:forKey:inLayer:", v34, v18, v17);

          objc_msgSend(v33, "fromValue");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "CGPointValue");
          v40 = v39;
          v42 = v41;

          objc_msgSend(v34, "CGPointValue");
          v44 = v43;
          v46 = v45;
          v20 = v33;
          -[_UIViewAdditiveAnimationAction animationObject](self, "animationObject");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = v20;
          v90 = v20;
          objc_msgSend(v47, "_springAnimationForXComponent:forYComponent:", &v90, &v89);
          v48 = v90;
          v49 = v89;

          objc_msgSend(v20, "delegate");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setDelegate:", v50);

          objc_msgSend(v20, "timingFunction");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setTimingFunction:", v51);

          objc_msgSend(v20, "fromValue");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setFromValue:", v52);

          objc_msgSend(v20, "fromValue");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setFromValue:", v53);

          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v44, v42);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v19[2](v19, v48, v54, CFSTR(".x"));

          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v40, v46);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v19[2](v19, v49, v55, CFSTR(".y"));

        }
        else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("bounds")) & 1) != 0
               || (objc_msgSend(v18, "isEqualToString:", CFSTR("contentsRect")) & 1) != 0
               || objc_msgSend(v18, "isEqualToString:", CFSTR("contentsCenter")))
        {
          -[_UIViewAdditiveAnimationAction pendingAnimation](self, "pendingAnimation");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "fromValue");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "CGRectValue");
          v71 = v70;
          v73 = v72;
          v75 = v74;
          v77 = v76;

          objc_msgSend(v68, "toValue");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          if (v78)
            objc_msgSend(v68, "toValue");
          else
            objc_msgSend(v17, "valueForKeyPath:", v18);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "CGRectValue");
          v81 = v80;
          v83 = v82;

          v20 = v68;
          v84 = (void *)objc_msgSend(v20, "copy");
          objc_msgSend(v18, "stringByAppendingString:", CFSTR(".size"));
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setKeyPath:", v85);

          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v75, v77);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setFromValue:", v86);

          v19[2](v19, v20, 0, 0);
          if (vabdd_f64(v71, v81) >= 0.0001 || vabdd_f64(v73, v83) >= 0.0001)
          {
            objc_msgSend(v18, "stringByAppendingString:", CFSTR(".origin"));
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "setKeyPath:", v87);

            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v71, v73);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "setFromValue:", v88);

            v19[2](v19, v84, 0, 0);
            objc_msgSend((id)__currentViewAnimationState, "_incrementDidEndCount");
          }

        }
        else
        {
          -[_UIViewAdditiveAnimationAction pendingAnimation](self, "pendingAnimation");
          v20 = (id)objc_claimAutoreleasedReturnValue();
          v19[2](v19, v20, 0, 0);
        }
      }
      else
      {
        -[_UIViewAdditiveAnimationAction pendingAnimation](self, "pendingAnimation");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "keyPath");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "valueForKeyPath:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setToValue:", v57);

        -[_UIViewAdditiveAnimationAction animationObject](self, "animationObject");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "toValue");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "_setOriginalToValue:forKey:inLayer:", v59, v18, v17);

        v60 = v17;
        if (+[UIView _shouldTrackActionWithAnimator:](UIView, "_shouldTrackActionWithAnimator:", v20))
        {
          objc_msgSend(v20, "keyPath");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIViewPropertyAnimator _trackNonAdditiveAnimationWithAnimator:forLayer:forKey:](UIViewPropertyAnimator, "_trackNonAdditiveAnimationWithAnimator:forLayer:forKey:", v20, v60, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "toValue");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "_setOriginalToValue:forKey:inLayer:", v63, v18, v60);

        }
        objc_msgSend(v20, "keyPath");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "addAnimation:forKey:", v20, v64);

        if (+[UIView _isAnimationTracking](UIView, "_isAnimationTracking"))
        {
          v65 = (void *)__currentViewAnimationState;
          objc_msgSend(v20, "keyPath");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "keyPath");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "_trackAnimation:nonAdditiveAnimation:withAnimationKey:forKeyPath:inLayer:", v20, 0, v66, v67, v60);

        }
      }
    }
  }

LABEL_8:
}

- (UIViewPropertyAnimator)animationObject
{
  return self->_animationObject;
}

- (CAAnimation)pendingAnimation
{
  return self->_pendingAnimation;
}

- (UIView)view
{
  return self->_view;
}

@end
