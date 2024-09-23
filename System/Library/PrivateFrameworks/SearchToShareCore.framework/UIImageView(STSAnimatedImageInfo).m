@implementation UIImageView(STSAnimatedImageInfo)

- (void)sts_addAnimationsForSTSAnimatedImageInfo:()STSAnimatedImageInfo
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v4 = a3;
  objc_msgSend(v4, "frames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v4, "duration");
    v8 = v7;
    if (v7 == 0.0)
      v9 = 0.0;
    else
      v9 = v7 / (double)v6 / v7;
    objc_msgSend(v4, "frames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __78__UIImageView_STSAnimatedImageInfo__sts_addAnimationsForSTSAnimatedImageInfo___block_invoke;
    v16[3] = &__block_descriptor_40_e11__24__0_8Q16l;
    *(double *)&v16[4] = v9;
    objc_msgSend(v10, "sts_map:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("contents"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCalculationMode:", *MEMORY[0x24BDE5840]);
    LODWORD(v13) = 2139095040;
    objc_msgSend(v12, "setRepeatCount:", v13);
    objc_msgSend(v4, "frames");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValues:", v14);

    objc_msgSend(v12, "setKeyTimes:", v11);
    objc_msgSend(v12, "setDuration:", v8);
    objc_msgSend(v12, "setRemovedOnCompletion:", 0);
    objc_msgSend(a1, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAnimation:forKey:", v12, CFSTR("contents"));

    objc_msgSend(MEMORY[0x24BDE57D8], "flush");
  }

}

@end
