@implementation TUIAspectLayout

- (double)computeIntrinsicAspectRatio
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v2, "aspectRatio");
  v4 = v3;

  return v4;
}

- (void)computeLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  void *v17;
  id v18;
  double x;
  void *v20;
  unint64_t v21;
  double y;
  id v23;

  -[TUILayout computeWidth](self, "computeWidth");
  v4 = v3;
  -[TUILayout computeHeight](self, "computeHeight");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  objc_msgSend(v23, "setContainingWidth:", v4);
  objc_msgSend(v23, "setContainingHeight:", v6);
  objc_msgSend(v23, "computedWidth");
  if ((v8 & 0x8000000000000) != 0)
    v9 = v4;
  else
    v9 = NAN;
  objc_msgSend(v23, "setFlexedWidth:", v9);
  objc_msgSend(v23, "computedHeight");
  if ((v10 & 0x8000000000000) != 0)
    v11 = v6;
  else
    v11 = NAN;
  objc_msgSend(v23, "setFlexedHeight:", v11);
  objc_msgSend(v23, "validateLayout");
  objc_msgSend(v23, "computedTransformedSize");
  v13 = v12;
  v15 = v14;
  v16 = -[TUILayout computedLayoutDirection](self, "computedLayoutDirection");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "box"));
  v18 = objc_msgSend(v17, "halign");

  switch((unint64_t)v18)
  {
    case 0uLL:
    case 2uLL:
      x = 0.5;
      break;
    case 1uLL:
      if (v16 == 2)
        x = 1.0;
      else
        x = 0.0;
      break;
    case 3uLL:
      if (v16 == 2)
        x = 0.0;
      else
        x = 1.0;
      break;
    default:
      x = CGPointZero.x;
      break;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "box"));
  v21 = (unint64_t)objc_msgSend(v20, "valign");

  if (v21 > 4)
    y = CGPointZero.y;
  else
    y = dbl_22F590[v21];
  objc_msgSend(v23, "setComputedOrigin:", (v4 - v13) * x, (v6 - v15) * y);
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v6);

}

@end
