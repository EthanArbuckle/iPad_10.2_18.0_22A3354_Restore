@implementation OverlayContainerDimmingController

- (OverlayContainerDimmingController)initWithDimmingBehaviour:(id)a3 customBehaviours:(id)a4
{
  id v7;
  id v8;
  OverlayContainerDimmingController *v9;
  OverlayContainerDimmingController *v10;
  NSMapTable *v11;
  NSMapTable *customBehaviours;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)OverlayContainerDimmingController;
  v9 = -[OverlayContainerDimmingController init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_behaviour, a3);
    v11 = (NSMapTable *)objc_msgSend(v8, "copy");
    customBehaviours = v10->_customBehaviours;
    v10->_customBehaviours = v11;

  }
  return v10;
}

- (double)overlayContainer:(id)a3 dimmingPercentageForCurrentContaineeWithNewHeight:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerDimmingController _dimmingBehaviourForContainee:](self, "_dimmingBehaviourForContainee:", v7));

  objc_msgSend(v8, "overlayContainer:dimmingPercentageForCurrentContaineeWithNewHeight:", v6, a4);
  v10 = v9;

  return v10;
}

- (unint64_t)overlayContainerLayoutForContaineeDimmingDismissal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerDimmingController _dimmingBehaviourForContainee:](self, "_dimmingBehaviourForContainee:", v5));

  v7 = objc_msgSend(v6, "overlayContainerLayoutForContaineeDimmingDismissal:", v4);
  return (unint64_t)v7;
}

- (id)_dimmingBehaviourForContainee:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  objc_class *Superclass;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerDimmingController customBehaviours](self, "customBehaviours"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (v6)
  {
    v7 = v6;
LABEL_8:
    v11 = v7;
    goto LABEL_9;
  }
  v8 = objc_opt_class(v4);
  if (!v8)
  {
LABEL_7:
    v7 = (id)objc_claimAutoreleasedReturnValue(-[OverlayContainerDimmingController behaviour](self, "behaviour"));
    goto LABEL_8;
  }
  Superclass = (objc_class *)v8;
  while (1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerDimmingController customBehaviours](self, "customBehaviours"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", Superclass));

    if (v11)
      break;
    Superclass = class_getSuperclass(Superclass);
    if (!Superclass)
      goto LABEL_7;
  }
LABEL_9:

  return v11;
}

- (DimmingBehaviour)behaviour
{
  return self->_behaviour;
}

- (NSMapTable)customBehaviours
{
  return self->_customBehaviours;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBehaviours, 0);
  objc_storeStrong((id *)&self->_behaviour, 0);
}

@end
