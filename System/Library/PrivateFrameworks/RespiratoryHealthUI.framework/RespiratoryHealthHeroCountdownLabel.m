@implementation RespiratoryHealthHeroCountdownLabel

- (RespiratoryHealthHeroCountdownLabel)initWithFrame:(CGRect)a3
{
  RespiratoryHealthHeroCountdownLabel *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RespiratoryHealthHeroCountdownLabel;
  v3 = -[RespiratoryHealthHeroCountdownLabel initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RespiratoryHealthHeroCountdownLabel setTextColor:](v3, "setTextColor:", v4);

    -[RespiratoryHealthHeroCountdownLabel countdownStringForScaleFactor:](v3, "countdownStringForScaleFactor:", 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RespiratoryHealthHeroCountdownLabel setAttributedText:](v3, "setAttributedText:", v5);

  }
  return v3;
}

- (void)setScaleFactor:(double)a3
{
  id v4;

  -[RespiratoryHealthHeroCountdownLabel countdownStringForScaleFactor:](self, "countdownStringForScaleFactor:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RespiratoryHealthHeroCountdownLabel setAttributedText:](self, "setAttributedText:", v4);

}

- (id)countdownStringForScaleFactor:(double)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v5, "setSecond:", 14);
  v6 = objc_alloc_init(MEMORY[0x24BDD14F8]);
  objc_msgSend(v6, "setUnitsStyle:", 2);
  objc_msgSend(v6, "stringFromDateComponents:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDD1688]);
    v9 = *MEMORY[0x24BDF65F8];
    v22 = *MEMORY[0x24BDF65F8];
    -[RespiratoryHealthHeroCountdownLabel _makeUnitLabelFontWithSize:](self, "_makeUnitLabelFontWithSize:", a3 * 15.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithString:attributes:", v7, v11);

    objc_msgSend(v6, "setUnitsStyle:", 0);
    objc_msgSend(v6, "stringFromDateComponents:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = objc_msgSend(v7, "rangeOfString:", v13);
      v16 = v15;
      v20 = v9;
      -[RespiratoryHealthHeroCountdownLabel _makeValueLabelFontWithSize:](self, "_makeValueLabelFontWithSize:", a3 * 20.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAttributes:range:", v18, v14, v16);

    }
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", &stru_24EF4CAB8);
  }

  return v12;
}

- (id)_makeValueLabelFontWithSize:(double)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6A70], "hk_roundedSystemFontWithSize:weight:", a3, *MEMORY[0x24BDF7880]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDF7778];
  v11[0] = *MEMORY[0x24BDF7780];
  v11[1] = v6;
  v12[0] = &unk_24EF4E248;
  v12[1] = &unk_24EF4E260;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorByAddingAttributes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_makeUnitLabelFontWithSize:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "hk_roundedSystemFontWithSize:weight:", a3, *MEMORY[0x24BDF7880]);
}

@end
