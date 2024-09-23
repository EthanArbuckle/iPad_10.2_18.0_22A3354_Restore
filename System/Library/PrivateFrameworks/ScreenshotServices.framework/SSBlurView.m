@implementation SSBlurView

- (SSBlurView)initWithFrame:(CGRect)a3
{
  SSBlurView *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)SSBlurView;
  v3 = -[SSBlurView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_alloc(MEMORY[0x24BDE56B0]);
  v5 = (void *)objc_msgSend(v4, "initWithType:", *MEMORY[0x24BDE5A78]);
  v6 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v5, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("inputHardEdges"));
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("inputNormalizeEdges"));
  objc_msgSend(v5, "setValue:forKey:", &unk_24D073C28, CFSTR("inputRadius"));
  objc_msgSend(v5, "setValue:forKey:", CFSTR("low"), CFSTR("inputQuality"));
  objc_msgSend(v5, "setValue:forKey:", CFSTR("low"), CFSTR("inputIntermediateBitDepth"));
  objc_msgSend(v5, "setName:", CFSTR("gaussianBlur"));
  -[SSBlurView layer](v3, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilters:", v8);

  -[SSBlurView setScale:](v3, "setScale:", 1.0);
  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SSBlurView;
  if (-[SSBlurView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4)
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("filters.gaussianBlur.inputRadius")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("scale"));
  }

  return v5;
}

- (void)setScale:(double)a3
{
  id v4;

  -[SSBlurView _backdropLayer](self, "_backdropLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScale:", a3);

}

- (double)scale
{
  void *v2;
  double v3;
  double v4;

  -[SSBlurView _backdropLayer](self, "_backdropLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

- (void)setBlurRadius:(double)a3
{
  void *v4;
  id v5;

  -[SSBlurView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (double)blurRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SSBlurView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

@end
