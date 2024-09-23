@implementation TCMPSHueAdjustAugmenter

- (TCMPSHueAdjustAugmenter)init
{
  TCMPSHueAdjustAugmenter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TCMPSHueAdjustAugmenter;
  result = -[TCMPSHueAdjustAugmenter init](&v3, sel_init);
  if (result)
    result->_maxHueAdjust = 0.0500000007;
  return result;
}

- (id)imageAugmentedFromImage:(id)a3 generator:(id)a4
{
  double (**v6)(_QWORD, double, double);
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = (double (**)(_QWORD, double, double))a4;
  v7 = a3;
  -[TCMPSHueAdjustAugmenter maxHueAdjust](self, "maxHueAdjust");
  v8 = 0.0;
  if (v9 > 0.0)
  {
    -[TCMPSHueAdjustAugmenter maxHueAdjust](self, "maxHueAdjust");
    v11 = -v10;
    -[TCMPSHueAdjustAugmenter maxHueAdjust](self, "maxHueAdjust");
    v8 = v6[2](v6, v11, v12) * 3.14159265 + 0.0;
  }
  v13 = (void *)objc_opt_new();
  objc_msgSend(v7, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BDBF918];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageByApplyingFilter:withInputParameters:", CFSTR("CIHueAdjust"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v17);

  objc_msgSend(v7, "bounds");
  objc_msgSend(v13, "setBounds:");
  objc_msgSend(v7, "annotations");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setAnnotations:", v18);
  return v13;
}

- (double)maxHueAdjust
{
  return self->_maxHueAdjust;
}

- (void)setMaxHueAdjust:(double)a3
{
  self->_maxHueAdjust = a3;
}

@end
