@implementation PXEDRGainView

- (PXEDRGainView)initWithFrame:(CGRect)a3
{
  PXEDRGainView *v3;
  PXEDRGainView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXEDRGainView;
  v3 = -[PXEDRGainView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PXEDRGainView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  return v4;
}

- (void)setEdrGain:(double)a3
{
  if (self->_edrGain != a3)
  {
    self->_edrGain = a3;
    -[PXEDRGainView _updateFilter](self, "_updateFilter");
  }
}

- (void)_updateFilter
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, void *);
  void *v30;
  PXEDRGainView *v31;
  id v32;
  SEL v33;

  -[PXEDRGainView edrGain](self, "edrGain");
  v5 = v4;
  -[PXEDRGainView layer](self, "layer");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_EDRFilterName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "filters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v25, "filters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = __30__PXEDRGainView__updateFilter__block_invoke;
    v30 = &unk_2514D0CE8;
    v33 = a2;
    v31 = self;
    v32 = v6;
    v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", &v27);

    if (v5 > 0.0)
    {
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_16:
        objc_msgSend(v25, "filters", v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", v9);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setValue:forKey:", v23, *MEMORY[0x24BDE5AA8]);

        objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v26, "setBackgroundColor:", objc_msgSend(v24, "CGColor"));

        goto LABEL_17;
      }
LABEL_6:
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A68], v25, v27, v28, v29, v30, v31);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forKey:", &unk_2514EB608, *MEMORY[0x24BDE5B38]);
      objc_msgSend(v10, "setValue:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDE5A98]);
      objc_msgSend((id)objc_opt_class(), "_EDRFilterName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setName:", v11);

      objc_msgSend(v25, "filters");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");
      v14 = v13;
      if (v13)
        v15 = v13;
      else
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
      v19 = v15;

      objc_msgSend(v19, "addObject:", v10);
      v9 = objc_msgSend(v19, "count") - 1;
      objc_msgSend(v25, "setFilters:", v19);
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5B98]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setCompositingFilter:", v20);

      goto LABEL_16;
    }
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v25, "filters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "mutableCopy");

      objc_msgSend(v17, "removeObjectAtIndex:", v9);
      if (objc_msgSend(v17, "count"))
        v18 = v17;
      else
        v18 = 0;
      objc_msgSend(v25, "setFilters:", v18, v25, v27, v28, v29, v30, v31);

    }
  }
  else if (v5 > 0.0)
  {
    goto LABEL_6;
  }
  objc_msgSend(v25, "setCompositingFilter:", 0, v25);
  objc_msgSend(v26, "setBackgroundColor:", 0);
LABEL_17:

}

- (double)edrGain
{
  return self->_edrGain;
}

uint64_t __30__PXEDRGainView__updateFilter__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40));

  return v4;
}

+ (id)_EDRFilterName
{
  return CFSTR("PXEDRGainView.filter");
}

@end
