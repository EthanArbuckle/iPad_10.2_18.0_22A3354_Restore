@implementation UIView(SBUtilities)

- (uint64_t)sb_setBoundsAndPositionFromFrame:()SBUtilities
{
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  objc_msgSend(a1, "bounds");
  objc_msgSend(a1, "setBounds:");
  objc_msgSend(a1, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anchorPoint");
  v12 = v11;
  v14 = v13;

  return objc_msgSend(a1, "setCenter:", a2 + v12 * a4, a3 + v14 * a5);
}

- (void)sb_setPresentationBoundsAndPositionFromFrame:()SBUtilities
{
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  objc_msgSend(a1, "bounds");
  v11 = v10;
  v13 = v12;
  objc_msgSend(a1, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anchorPoint");
  v16 = v15;
  v18 = v17;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", a2 + v16 * a4, a3 + v18 * a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setPresentationValue:forKey:", v19, CFSTR("position"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v11, v13, a4, a5);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setPresentationValue:forKey:", v20, CFSTR("bounds"));

}

@end
