@implementation _UIHDRUsageCoordinator

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIHDRUsageCoordinator;
  return -[_UIHDRUsageCoordinator init](&v3, sel_init);
}

+ (id)sharedInstance
{
  objc_opt_self();
  objc_opt_self();
  if (dyld_program_sdk_at_least() && qword_1ECD7E130 != -1)
    dispatch_once(&qword_1ECD7E130, &__block_literal_global_267);
  return (id)qword_1ECD7E128;
}

- (uint64_t)rangeForHeadroom:(uint64_t)a1
{
  uint64_t v2;
  void *v3;

  v2 = 0;
  if (a1 && a2 > 2.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "isLowPowerModeEnabled") ^ 1;

  }
  return v2;
}

- (void)applyRangeForHeadroom:(double)a3 toMutableTraits:
{
  id v5;
  uint64_t v6;
  id v7;

  if (a1)
  {
    v5 = a2;
    v6 = -[_UIHDRUsageCoordinator rangeForHeadroom:](a1, a3);
    objc_opt_self();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNSIntegerValue:forTrait:", v6, v7);

  }
}

- (void)registerForDefaultDynamicRangeChanges:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    objc_getAssociatedObject(v3, &_UIHDRUsageCoordinatorDefaultDynamicRangeRegistrationKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_initWeak(&location, v4);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0CB3048];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __64___UIHDRUsageCoordinator_registerForDefaultDynamicRangeChanges___block_invoke;
      v10[3] = &unk_1E16B22E0;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v8, 0, v7, v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_setAssociatedObject(v4, &_UIHDRUsageCoordinatorDefaultDynamicRangeRegistrationKey, v9, (void *)0x301);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }

  }
}

- (void)applyConstrainedHDROverrideToView:(uint64_t)a1
{
  id v3;
  double v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "_screen");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "potentialEDRHeadroom");
    v5 = -[_UIHDRUsageCoordinator rangeForHeadroom:](a1, v4);
    -[UIView _internalTraitOverrides](v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setImageDynamicRange:", v5);
  }
}

- (void)unregisterForDefaultDynamicRangeChanges:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id object;

  v3 = a2;
  if (a1 && v3)
  {
    object = v3;
    objc_getAssociatedObject(v3, &_UIHDRUsageCoordinatorDefaultDynamicRangeRegistrationKey);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObserver:name:object:", v4, *MEMORY[0x1E0CB3048], 0);

      objc_setAssociatedObject(object, &_UIHDRUsageCoordinatorDefaultDynamicRangeRegistrationKey, 0, (void *)0x301);
    }

    v3 = object;
  }

}

- (void)registerForAndApplyHDRAnimationToView:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_opt_self();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "registerForTraitChanges:withHandler:", v5, &__block_literal_global_9_6);

  }
}

- (id)animationForHDRHeadroomUsage:(void *)a3 layer:
{
  id v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  v5 = a3;
  if (!a1)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isLowPowerModeEnabled") & 1) != 0)
  {

LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  v7 = objc_msgSend(v5, "wantsExtendedDynamicRangeContent");

  if (!v7)
    goto LABEL_10;
  v8 = a2 ? 1.0 : 0.0;
  v9 = _HDRInitialEDRStrength(v5);
  v10 = _HDRAnimationDuration(v9, v8);
  if (v10 <= 0.00833333333)
    goto LABEL_10;
  _HDRSpringAnimation(v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v11;
}

- (void)enableHDRSuppression:(void *)a3 inViewHierarchy:
{
  id v5;
  int shouldSuppressHDR;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  if (a1)
  {
    v9 = v5;
    shouldSuppressHDR = _shouldSuppressHDR(a2);
    -[UIView _internalTraitOverrides](v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (shouldSuppressHDR)
      objc_msgSend(v7, "setNSIntegerValue:forTrait:", 0, v8);
    else
      objc_msgSend(v7, "removeTrait:", v8);

    v5 = v9;
  }

}

- (char)traitCollectionSuppressingHDR:(char *)a1
{
  char *v2;
  void *v3;
  void **v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v2 = a1;
    if (_shouldSuppressHDR(a2))
    {
      v5 = (void *)*((_QWORD *)v2 + 2);
      v4 = (void **)(v2 + 16);
      v3 = v5;
      if (!v5)
      {
        +[UITraitCollection traitCollectionWithTraits:](UITraitCollection, "traitCollectionWithTraits:", &__block_literal_global_13_3);
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
        v8 = *v4;
        *v4 = (void *)v6;

        v3 = *v4;
      }
    }
    else
    {
      v7 = (void *)*((_QWORD *)v2 + 1);
      v4 = (void **)(v2 + 8);
      v3 = v7;
      if (!v7)
      {
        +[UITraitCollection _traitCollectionWithHeadroomUsage:](UITraitCollection, "_traitCollectionWithHeadroomUsage:", 1);
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
    }
    a1 = v3;
  }
  return a1;
}

- (void)prepareSceneForLowPowerModeChange:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  double v5;
  id v6;

  if (a1)
  {
    objc_msgSend(a2, "screen");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "imageDynamicRange");

    objc_msgSend(v6, "potentialEDRHeadroom");
    if (v4 != -[_UIHDRUsageCoordinator rangeForHeadroom:](a1, v5))
      objc_msgSend(v6, "_updateTraits");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableHDRTraitCollection, 0);
  objc_storeStrong((id *)&self->_enableHDRTraitCollection, 0);
}

@end
