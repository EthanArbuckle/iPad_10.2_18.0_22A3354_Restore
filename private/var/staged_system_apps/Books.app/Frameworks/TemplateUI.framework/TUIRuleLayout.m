@implementation TUIRuleLayout

- (void)computeLayout
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v3 = objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  if (v3)
  {
    while (1)
    {
      v16 = (id)v3;
      if ((objc_opt_respondsToSelector(v3, "ruleLayoutAxis") & 1) != 0)
        break;
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layoutAncestor"));

      v3 = v4;
      if (!v4)
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    v16 = 0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v6 = (char *)objc_msgSend(v5, "axis");

  if (!v6)
  {
    v6 = (char *)objc_msgSend(v16, "ruleLayoutAxis");
    if (!v6)
    {
      -[TUILayout computeWidth](self, "computeWidth");
      v8 = v12;
      -[TUILayout computeHeight](self, "computeHeight");
      v7 = v13;
      goto LABEL_13;
    }
  }
  if (v6 == (_BYTE *)&dword_0 + 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
    objc_msgSend(v10, "contentsScale");
    v8 = 1.0 / v14;
    -[TUILayout computeHeight](self, "computeHeight");
    v7 = v15;
    goto LABEL_12;
  }
  v7 = 0.0;
  v8 = 0.0;
  if (v6 == (_BYTE *)&dword_0 + 1)
  {
    -[TUILayout computeWidth](self, "computeWidth");
    v8 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
    objc_msgSend(v10, "contentsScale");
    v7 = 1.0 / v11;
LABEL_12:

  }
LABEL_13:
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v8, v7);

}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v5;
  _TUIRuleLayerConfig *v6;
  void *v7;
  void *v8;
  _TUIRuleLayerConfig *v9;
  TUIRenderModelLayer *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v5 = a4;
  v6 = [_TUIRuleLayerConfig alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "color"));
  v9 = -[_TUIRuleLayerConfig initWithColor:](v6, "initWithColor:", v8);

  v10 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", 0, v9, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  -[TUIRenderModelLayer setIdentifier:](v10, "setIdentifier:", v12);

  -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v5);
  v14 = v13;
  v16 = v15;

  -[TUIRenderModelLayer setSize:](v10, "setSize:", v14, v16);
  return v10;
}

@end
