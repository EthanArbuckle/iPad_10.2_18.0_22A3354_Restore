@implementation UIEditMenuCollectionView

void __50___UIEditMenuCollectionView_contentOffsetForPage___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (*(_QWORD *)(a1 + 40) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    v5 = a2;
    objc_msgSend(v5, "width");
    v7 = v6;
    objc_msgSend(v5, "overlapWidth");
    v9 = v8;

    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v7
                                                                - v9
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 32);
  }
}

void __56___UIEditMenuCollectionView_scrollToTargetPageAnimated___block_invoke()
{
  uint64_t v0;
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  v8 = 0.0;
  v9 = 0.0;
  v7 = 0.0;
  +[UISpringTimingParameters _convertDampingRatio:response:toMass:stiffness:damping:](UISpringTimingParameters, "_convertDampingRatio:response:toMass:stiffness:damping:", &v9, &v8, &v7, 1.0, 0.3);
  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_1_16;
  _MergedGlobals_1_16 = v0;

  objc_msgSend((id)_MergedGlobals_1_16, "setMass:", v9);
  objc_msgSend((id)_MergedGlobals_1_16, "setStiffness:", v8);
  objc_msgSend((id)_MergedGlobals_1_16, "setDamping:", v7);
  objc_msgSend((id)_MergedGlobals_1_16, "durationForEpsilon:", 1.17549435e-38);
  objc_msgSend((id)_MergedGlobals_1_16, "setDuration:");
  LODWORD(v2) = 1045220557;
  LODWORD(v3) = 0;
  LODWORD(v4) = 1.0;
  LODWORD(v5) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v3, v2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_1_16, "setTimingFunction:", v6);

}

@end
