@implementation UIFocusRegionMapEntry

void __51___UIFocusRegionMapEntry_visualRepresentationColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[8];

  v9[7] = *MEMORY[0x1E0C80C00];
  +[UIColor greenColor](UIColor, "greenColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor blueColor](UIColor, "blueColor", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v1;
  +[UIColor cyanColor](UIColor, "cyanColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v2;
  +[UIColor magentaColor](UIColor, "magentaColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v3;
  +[UIColor orangeColor](UIColor, "orangeColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v4;
  +[UIColor purpleColor](UIColor, "purpleColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[5] = v5;
  +[UIColor brownColor](UIColor, "brownColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[6] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 7);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_MergedGlobals_23_1;
  _MergedGlobals_23_1 = v7;

}

void __57___UIFocusRegionMapEntry_visualRepresentationPatternType__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECD7B730;
  qword_1ECD7B730 = (uint64_t)&unk_1E1A93440;

}

@end
