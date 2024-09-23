@implementation SBCoverSheetPanelBackgroundContainerView

- (void)_setPresentationValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("position")))
  {
    objc_msgSend(v8, "CGPointValue");
    v11 = v10;
    v13 = v12;
    -[SBCoverSheetPanelBackgroundContainerView bounds](self, "bounds");
    if (v13 >= v14 * 0.5)
      v15 = v14 * 0.5;
    else
      v15 = v13;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v11, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16.receiver = self;
  v16.super_class = (Class)SBCoverSheetPanelBackgroundContainerView;
  -[SBCoverSheetPanelBackgroundContainerView _setPresentationValue:forKey:](&v16, sel__setPresentationValue_forKey_, v9, v7);

}

@end
