@implementation _UIHomeAffordanceHostSceneComponent

- (CGRect)homeAffordanceSceneReferenceFrame
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeAffordanceSceneReferenceFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setHomeAffordanceSceneReferenceFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v7;
  _QWORD v8[8];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[FBSSceneComponent hostScene](self, "hostScene");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76___UIHomeAffordanceHostSceneComponent_setHomeAffordanceSceneReferenceFrame___block_invoke;
  v8[3] = &__block_descriptor_64_e69_v16__0__FBSMutableSceneSettings__UIHomeAffordanceHostSceneSettings__8l;
  *(CGFloat *)&v8[4] = x;
  *(CGFloat *)&v8[5] = y;
  *(CGFloat *)&v8[6] = width;
  *(CGFloat *)&v8[7] = height;
  objc_msgSend(v7, "updateSettingsWithBlock:", v8);

}

- (void)doubleTapGestureDidSucceed:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  +[_UIHomeAffordanceDoubleTapGestureActionToClient actionForDoubleTapGestureDidSucceed:](_UIHomeAffordanceDoubleTapGestureActionToClient, "actionForDoubleTapGestureDidSucceed:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSSceneComponent hostScene](self, "hostScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendPrivateActions:", v5);

}

@end
