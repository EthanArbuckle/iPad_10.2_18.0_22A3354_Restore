@implementation TUIColumnLayout

- (void)computeLayout
{
  void *v3;
  char v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  if (v3)
  {
    do
    {
      v4 = objc_opt_respondsToSelector(v3, "columnLayoutProviderWidthForColumnSpan:");
      if ((v4 & 1) != 0)
        break;
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutAncestor"));

      v3 = (void *)v5;
    }
    while (v5);
    v6 = v4 ^ 1;
  }
  else
  {
    v6 = 1;
  }
  v20 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "columnSpan"));
  v9 = objc_msgSend(v20, "columnLayoutProviderColumnSpanForColumnSpan:", v8);

  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if ((v6 & 1) == 0)
      goto LABEL_11;
LABEL_10:
    v11 = NAN;
    goto LABEL_18;
  }
  if ((v6 & 1) != 0)
    goto LABEL_10;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v10, "containerFraction");
  v9 = objc_msgSend(v20, "columnLayoutProviderColumnsForContainerFraction:");

LABEL_11:
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL || v9 == 0)
    v13 = 1;
  else
    v13 = (uint64_t)v9;
  objc_msgSend(v20, "columnLayoutProviderWidthForColumnSpan:", v13);
  v11 = v14;
LABEL_18:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));

  objc_msgSend(v16, "setContainingWidth:", v11);
  objc_msgSend(v16, "validateLayout");
  objc_msgSend(v16, "computedTransformedSize");
  v18 = v17;
  objc_msgSend(v16, "setComputedOrigin:", (v11 - v19) * 0.5, 0.0);
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v11, v18);

}

@end
