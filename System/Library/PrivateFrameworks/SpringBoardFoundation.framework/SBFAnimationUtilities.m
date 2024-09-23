@implementation SBFAnimationUtilities

+ (id)matchMoveAnimationForPinningToView:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CD27C0]);
  objc_msgSend(v4, "setSourceLayer:", v3);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 1.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourcePoints:", v9);

  objc_msgSend(v4, "setUsesNormalizedCoordinates:", 1);
  objc_msgSend(v4, "setAppliesX:", 0);
  objc_msgSend(v4, "setAppliesY:", 0);
  objc_msgSend(v4, "setAppliesScale:", 1);
  objc_msgSend(v4, "setAppliesRotation:", 0);
  objc_msgSend(v4, "setDuration:", INFINITY);
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);

  return v4;
}

@end
