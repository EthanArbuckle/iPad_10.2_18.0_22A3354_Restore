@implementation TCMPSColorControlAugmenter

- (TCMPSColorControlAugmenter)init
{
  TCMPSColorControlAugmenter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TCMPSColorControlAugmenter;
  result = -[TCMPSColorControlAugmenter init](&v3, sel_init);
  if (result)
  {
    *(int64x2_t *)&result->_maxBrightnessDelta = vdupq_n_s64(0x3FA99999A0000000uLL);
    result->_maxSaturationProportion = 0.0500000007;
  }
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x24BDAC8D0];
  v6 = (double (**)(_QWORD, double, double))a4;
  v7 = a3;
  -[TCMPSColorControlAugmenter maxBrightnessDelta](self, "maxBrightnessDelta");
  v8 = 0.0;
  if (v9 > 0.0)
  {
    -[TCMPSColorControlAugmenter maxBrightnessDelta](self, "maxBrightnessDelta");
    v11 = -v10;
    -[TCMPSColorControlAugmenter maxBrightnessDelta](self, "maxBrightnessDelta");
    v8 = v6[2](v6, v11, v12) + 0.0;
  }
  -[TCMPSColorControlAugmenter maxContrastProportion](self, "maxContrastProportion");
  v13 = 1.0;
  v14 = 1.0;
  if (v15 > 0.0)
  {
    -[TCMPSColorControlAugmenter maxContrastProportion](self, "maxContrastProportion");
    v17 = -v16;
    -[TCMPSColorControlAugmenter maxContrastProportion](self, "maxContrastProportion");
    v14 = v6[2](v6, v17, v18) + 1.0;
  }
  -[TCMPSColorControlAugmenter maxSaturationProportion](self, "maxSaturationProportion");
  if (v19 > 0.0)
  {
    -[TCMPSColorControlAugmenter maxSaturationProportion](self, "maxSaturationProportion");
    v21 = -v20;
    -[TCMPSColorControlAugmenter maxSaturationProportion](self, "maxSaturationProportion");
    v13 = v6[2](v6, v21, v22) + 1.0;
  }
  v23 = (void *)objc_opt_new();
  v32[0] = *MEMORY[0x24BDBF930];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v24;
  v32[1] = *MEMORY[0x24BDBF948];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v25;
  v32[2] = *MEMORY[0x24BDBF980];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "image");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorControls"), v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setImage:", v29);

  objc_msgSend(v7, "bounds");
  objc_msgSend(v23, "setBounds:");
  objc_msgSend(v7, "annotations");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setAnnotations:", v30);
  return v23;
}

- (double)maxBrightnessDelta
{
  return self->_maxBrightnessDelta;
}

- (void)setMaxBrightnessDelta:(double)a3
{
  self->_maxBrightnessDelta = a3;
}

- (double)maxContrastProportion
{
  return self->_maxContrastProportion;
}

- (void)setMaxContrastProportion:(double)a3
{
  self->_maxContrastProportion = a3;
}

- (double)maxSaturationProportion
{
  return self->_maxSaturationProportion;
}

- (void)setMaxSaturationProportion:(double)a3
{
  self->_maxSaturationProportion = a3;
}

@end
