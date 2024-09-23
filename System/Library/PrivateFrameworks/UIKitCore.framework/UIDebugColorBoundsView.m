@implementation UIDebugColorBoundsView

void __37___UIDebugColorBoundsView__nextColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[9];

  v10[8] = *MEMORY[0x1E0C80C00];
  +[UIColor redColor](UIColor, "redColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v0;
  +[UIColor greenColor](UIColor, "greenColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v1;
  +[UIColor blueColor](UIColor, "blueColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v2;
  +[UIColor cyanColor](UIColor, "cyanColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v3;
  +[UIColor magentaColor](UIColor, "magentaColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v4;
  +[UIColor orangeColor](UIColor, "orangeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v5;
  +[UIColor purpleColor](UIColor, "purpleColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[6] = v6;
  +[UIColor brownColor](UIColor, "brownColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[7] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 8);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)_MergedGlobals_1281;
  _MergedGlobals_1281 = v8;

}

@end
