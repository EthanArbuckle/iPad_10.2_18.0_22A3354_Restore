@implementation SBHViewDarkeningHelper

- (SBHViewDarkeningHelper)initWithView:(id)a3
{
  id v4;
  SBHViewDarkeningHelper *v5;
  SBHViewDarkeningHelper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHViewDarkeningHelper;
  v5 = -[SBHViewDarkeningHelper init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    v6->_brightness = 1.0;
  }

  return v6;
}

- (void)setBrightness:(double)a3
{
  void *v4;
  double brightness;
  CAFilter *multiplyFilter;
  CAFilter *v7;
  CAFilter *v8;
  CAFilter *v9;
  id v10;

  if (self->_brightness != a3)
  {
    self->_brightness = a3;
    -[SBHViewDarkeningHelper view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    brightness = self->_brightness;
    multiplyFilter = self->_multiplyFilter;
    if (brightness >= 1.0)
    {
      if (!multiplyFilter)
      {
LABEL_10:

        return;
      }
      objc_msgSend(v10, "sbh_removeFilterWithName:", CFSTR("SBHViewDarkening"));
      v9 = self->_multiplyFilter;
      self->_multiplyFilter = 0;
    }
    else
    {
      if (!multiplyFilter)
      {
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
        v7 = (CAFilter *)objc_claimAutoreleasedReturnValue();
        v8 = self->_multiplyFilter;
        self->_multiplyFilter = v7;

        -[CAFilter setName:](self->_multiplyFilter, "setName:", CFSTR("SBHViewDarkening"));
        objc_msgSend(v10, "sbh_addFilter:", self->_multiplyFilter);
        multiplyFilter = self->_multiplyFilter;
        brightness = self->_brightness;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", brightness, 1.0);
      v9 = (CAFilter *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAFilter setValue:forKey:](multiplyFilter, "setValue:forKey:", -[CAFilter CGColor](v9, "CGColor"), CFSTR("inputColor"));
    }

    goto LABEL_10;
  }
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SBHViewDarkeningHelper *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __37__SBHViewDarkeningHelper_description__block_invoke;
  v10 = &unk_1E8D84EF0;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __37__SBHViewDarkeningHelper_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  -[SBHViewDarkeningHelper view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v7, "appendObject:withName:", v4, CFSTR("view"));

  -[SBHViewDarkeningHelper brightness](self, "brightness");
  v6 = (id)objc_msgSend(v7, "appendFloat:withName:", CFSTR("brightness"));

}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (double)brightness
{
  return self->_brightness;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_multiplyFilter, 0);
}

@end
