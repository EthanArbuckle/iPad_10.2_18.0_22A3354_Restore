@implementation PNPSqueezeThresholdSliderCell

+ (id)opaqueTouchSenderDescriptor
{
  return (id)objc_msgSend(MEMORY[0x24BE0B6B0], "build:", &__block_literal_global);
}

uint64_t __60__PNPSqueezeThresholdSliderCell_opaqueTouchSenderDescriptor__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPrimaryPage:primaryUsage:", 65376, 4096);
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  char *v4;
  void *v5;
  const double *v6;
  int64_t v7;
  int v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = (char *)a3;
  objc_msgSend(v4, "setTarget:", self);
  *(_QWORD *)&v4[*MEMORY[0x24BE75760]] = sel_setPencilSqueezeThreshold_;
  *(_QWORD *)&v4[*MEMORY[0x24BE75750]] = sel_pencilSqueezeThreshold;
  objc_msgSend(v4, "propertyForKey:", CFSTR("extendedRange"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isExtendedRange = objc_msgSend(v5, "BOOLValue");

  v6 = (const double *)&kExtendedRangeTickValues;
  if (self->_isExtendedRange)
  {
    v7 = 9;
  }
  else
  {
    v8 = _AXSPencilExtendedSqueezeRangeEnabled();
    self->_isExtendedRange = v8 != 0;
    v7 = 5;
    if (v8)
      v7 = 9;
    else
      v6 = (const double *)&kNormalTickValues;
  }
  self->_numTicks = v7;
  self->_tickValues = v6;
  objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75C88]);
  objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75CB0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_numTicks - 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v9, *MEMORY[0x24BE75CA8]);

  objc_msgSend(v4, "setProperty:forKey:", &unk_24F4F5FB0, *MEMORY[0x24BE759B0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_numTicks - 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v10, *MEMORY[0x24BE759A8]);

  objc_msgSend(v4, "setProperty:forKey:", &unk_24F4F5FC8, *MEMORY[0x24BE759E0]);
  v11.receiver = self;
  v11.super_class = (Class)PNPSqueezeThresholdSliderCell;
  -[PSSliderTableCell refreshCellContentsWithSpecifier:](&v11, sel_refreshCellContentsWithSpecifier_, v4);

}

- (id)thresholdToSqueezeThreshold:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;

  if (self->_numTicks)
  {
    v4 = objc_msgSend(a3, "unsignedIntegerValue");
    v5 = self->_numTicks - 1;
    if (v5 >= (v4 & ~(v4 >> 63)))
      v5 = v4 & ~(v4 >> 63);
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = self->_tickValues[v5];
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    +[PNPSqueezeThresholdController defaultThreshold](PNPSqueezeThresholdController, "defaultThreshold", a3);
    v6 = v8;
  }
  objc_msgSend(v6, "numberWithDouble:", v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)squeezeThresholdToThreshold:(id)a3
{
  double v4;
  int64_t numTicks;
  uint64_t v6;
  const double *tickValues;
  double v8;
  uint64_t i;
  double v10;
  void *v11;

  if (self->_numTicks)
  {
    objc_msgSend(a3, "doubleValue");
    numTicks = self->_numTicks;
    if (numTicks < 2)
    {
      v6 = 0;
    }
    else
    {
      v6 = 0;
      tickValues = self->_tickValues;
      v8 = *tickValues - v4;
      if (v8 < 0.0)
        v8 = -v8;
      for (i = 1; i != numTicks; ++i)
      {
        v10 = tickValues[i] - v4;
        if (v10 < 0.0)
          v10 = -v10;
        if (v10 < v8)
        {
          v8 = v10;
          v6 = i;
        }
      }
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)pencilSqueezeThreshold
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[PNPSqueezeThresholdController sharedController](PNPSqueezeThresholdController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "squeezeThreshold");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PNPSqueezeThresholdSliderCell squeezeThresholdToThreshold:](self, "squeezeThresholdToThreshold:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    +[PNPSqueezeThresholdController defaultThreshold](PNPSqueezeThresholdController, "defaultThreshold");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPSqueezeThresholdSliderCell squeezeThresholdToThreshold:](self, "squeezeThresholdToThreshold:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)setPencilSqueezeThreshold:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PNPSqueezeThresholdSliderCell thresholdToSqueezeThreshold:](self, "thresholdToSqueezeThreshold:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_22ACC1000, v6, OS_LOG_TYPE_DEFAULT, "Setting squeze threshold: %@ (index: %@)", (uint8_t *)&v8, 0x16u);
  }

  +[PNPSqueezeThresholdController sharedController](PNPSqueezeThresholdController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSqueezeThreshold:", v5);

}

- (BOOL)isExtendedRange
{
  return self->_isExtendedRange;
}

@end
