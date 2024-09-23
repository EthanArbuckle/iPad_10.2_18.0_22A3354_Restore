@implementation UIInputViewPlacementTransition

- (UIInputViewAnimationController)animationController
{
  return self->animationController;
}

- (NSObject)animationContext
{
  return self->animationContext;
}

- (UIInputViewSetNotificationInfo)notificationInfo
{
  return self->notificationInfo;
}

- (UIInputViewAnimationStyle)animationStyle
{
  return self->animationStyle;
}

- (BOOL)didAdvanceAnimationToState:(int)a3
{
  uint64_t v3;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;

  v3 = *(_QWORD *)&a3;
  v5 = !-[UIInputViewPlacementTransition cancelled](self, "cancelled")
    && -[UIInputViewPlacementTransition animationState](self, "animationState") == (_DWORD)v3 - 1;
  -[UIInputViewPlacementTransition fromPlacement](self, "fromPlacement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isInteractive"))
  {
    -[UIInputViewPlacementTransition toPlacement](self, "toPlacement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isInteractive") ^ 1;

  }
  else
  {
    v8 = 0;
  }

  if ((v5 | v8) == 1)
    -[UIInputViewPlacementTransition setAnimationState:](self, "setAnimationState:", v3);
  return v5 | v8;
}

- (UIInputViewSetPlacement)fromPlacement
{
  return self->fromPlacement;
}

- (BOOL)cancelled
{
  return self->cancelled;
}

- (int)animationState
{
  return self->animationState;
}

- (void)setAnimationState:(int)a3
{
  self->animationState = a3;
}

- (unint64_t)notifications
{
  return self->notifications;
}

- (void)setNotifications:(unint64_t)a3
{
  self->notifications = a3;
}

- (void)setNotificationInfo:(id)a3
{
  objc_storeStrong((id *)&self->notificationInfo, a3);
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->animationController, a3);
}

- (void)dealloc
{
  objc_super v3;

  if (self->animationContext)
    -[UIInputViewAnimationController completeAnimationWithHost:context:](self->animationController, "completeAnimationWithHost:context:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIInputViewPlacementTransition;
  -[UIInputViewPlacementTransition dealloc](&v3, sel_dealloc);
}

- (void)setCancelled:(BOOL)a3
{
  self->cancelled = a3;
}

+ (id)transitionFromPlacement:(id)a3 toPlacement:(id)a4 withAnimationStyle:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v10, "setFromPlacement:", v9);

  objc_msgSend(v10, "setToPlacement:", v8);
  objc_msgSend(v10, "setAnimationStyle:", v7);

  return v10;
}

- (void)setAnimationStyle:(id)a3
{
  objc_storeStrong((id *)&self->animationStyle, a3);
}

- (void)setFromPlacement:(id)a3
{
  objc_storeStrong((id *)&self->fromPlacement, a3);
}

- (void)setToPlacement:(id)a3
{
  objc_storeStrong((id *)&self->toPlacement, a3);
}

- (void)setAnimationContext:(id)a3
{
  objc_storeStrong((id *)&self->animationContext, a3);
}

- (UIInputViewSetPlacement)toPlacement
{
  return self->toPlacement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->animationController, 0);
  objc_storeStrong((id *)&self->animationContext, 0);
  objc_storeStrong((id *)&self->notificationInfo, 0);
  objc_storeStrong((id *)&self->animationStyle, 0);
  objc_storeStrong((id *)&self->toPlacement, 0);
  objc_storeStrong((id *)&self->fromPlacement, 0);
}

+ (id)transitionForExistingPlacement:(id)a3 animationStyle:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v7, "setFromPlacement:", v6);
  objc_msgSend(v7, "setToPlacement:", v6);

  objc_msgSend(v7, "setAnimationStyle:", v5);
  return v7;
}

@end
