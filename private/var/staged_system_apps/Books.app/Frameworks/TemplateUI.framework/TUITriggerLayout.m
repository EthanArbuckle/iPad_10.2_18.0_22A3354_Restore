@implementation TUITriggerLayout

- (void)computeLayout
{
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", CGSizeZero.width, CGSizeZero.height);
}

- (void)appendAnchorsToSet:(id)a3 inRoot:(id)a4
{
  id v6;
  id v7;
  char *v8;
  double y;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  TUITrigger *v18;
  void *v19;
  void *v20;
  void *v21;
  TUITrigger *v22;

  v6 = a4;
  v7 = a3;
  v8 = (char *)objc_msgSend(v7, "axis");
  -[TUILayout computedTransformInAncestorLayout:](self, "computedTransformInAncestorLayout:", v6);

  y = CGPointZero.y;
  v10 = y * 0.0 + 0.0 * CGPointZero.x;
  v11 = v10 + 0.0;
  v12 = y * 0.0;
  if (v8 == (_BYTE *)&dword_0 + 1)
    v13 = v10 + 0.0;
  else
    v13 = v12 + 0.0 * CGPointZero.x + 0.0;
  if (v8 == (_BYTE *)&dword_0 + 1
    && (char *)-[TUILayout computedLayoutDirection](self, "computedLayoutDirection") == (char *)&dword_0 + 2)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    objc_msgSend(v14, "anchorOffset");
    v16 = v11 - v15;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    objc_msgSend(v14, "anchorOffset");
    v16 = v13 + v17;
  }

  v18 = [TUITrigger alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v22 = -[TUITrigger initWithName:observationMode:](v18, "initWithName:observationMode:", v20, objc_msgSend(v21, "observationMode"));

  objc_msgSend(v7, "appendTriggerAnchorWithOffset:trigger:axis:", v22, objc_msgSend(v7, "axis"), v16);
}

@end
