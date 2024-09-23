@implementation PKBlurView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.gaussianBlur.inputRadius")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKBlurView;
    v5 = -[PKBlurView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (BOOL)_shouldAnimatePropertyAdditivelyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.gaussianBlur.inputRadius")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKBlurView;
    v5 = -[PKBlurView _shouldAnimatePropertyAdditivelyWithKey:](&v7, sel__shouldAnimatePropertyAdditivelyWithKey_, v4);
  }

  return v5;
}

- (void)setBlurRadius:(double)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];

  if (self->_blurRadius != a3)
  {
    if (!self->_filter)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __28__PKBlurView_setBlurRadius___block_invoke;
      v7[3] = &unk_1E3E612E8;
      v7[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v7);
    }
    self->_blurRadius = a3;
    -[PKBlurView layer](self, "layer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_blurRadius);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKeyPath:", v5, CFSTR("filters.gaussianBlur.inputRadius"));

  }
}

void __28__PKBlurView_setBlurRadius___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CD2780]);
  v3 = objc_msgSend(v2, "initWithType:", *MEMORY[0x1E0CD2C88]);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 416);
  *(_QWORD *)(v4 + 416) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setValue:forKeyPath:", &unk_1E3FADC48, CFSTR("inputRadius"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setName:", CFSTR("gaussianBlur"));
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilters:", v7);

}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
}

@end
