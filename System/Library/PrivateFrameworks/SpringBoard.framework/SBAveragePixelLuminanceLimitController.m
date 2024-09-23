@implementation SBAveragePixelLuminanceLimitController

- (void)setAplLimitsEnabled:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  if (self->_aplLimitsEnabled != a3)
  {
    self->_aplLimitsEnabled = a3;
    -[SBAveragePixelLuminanceLimitController _targetLayer](self, "_targetLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = CACurrentMediaTime();
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CEABB0], "inheritedAnimationDuration");
      v7 = v6;
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.averagePixelLuminanceLimit.inputScale"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTimingFunction:", v9);

      objc_msgSend(v4, "convertTime:fromLayer:", 0, v5);
      objc_msgSend(v8, "setBeginTime:");
      objc_msgSend(v8, "setDuration:", v7);
      objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B50]);
      if (self->_aplLimitsEnabled)
      {
        -[SBAveragePixelLuminanceLimitController _addFilter](self, "_addFilter");
        objc_msgSend(v4, "setValue:forKeyPath:", &unk_1E91CF8D8, CFSTR("filters.averagePixelLuminanceLimit.inputScale"));
        objc_msgSend(v8, "setFromValue:", &unk_1E91CF8E8);
        objc_msgSend(v8, "setToValue:", &unk_1E91CF8D8);
      }
      else
      {
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __62__SBAveragePixelLuminanceLimitController_setAplLimitsEnabled___block_invoke;
        v12[3] = &unk_1E8E9DED8;
        v12[4] = self;
        v10 = (void *)MEMORY[0x1D17E5550](v12);
        objc_msgSend(v4, "setValue:forKeyPath:", &unk_1E91CF8E8, CFSTR("filters.averagePixelLuminanceLimit.inputScale"));
        objc_msgSend(v8, "setFromValue:", &unk_1E91CF8D8);
        objc_msgSend(v8, "setToValue:", &unk_1E91CF8E8);
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v8, "setValue:forKey:", v11, CFSTR("SBAPLFilterAnimationCompletionKey"));

        objc_msgSend(v8, "setDelegate:", self);
      }
      objc_msgSend(v4, "removeAnimationForKey:", CFSTR("aplFilter"));
      objc_msgSend(v4, "addAnimation:forKey:", v8, CFSTR("aplFilter"));
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

    }
  }
}

uint64_t __62__SBAveragePixelLuminanceLimitController_setAplLimitsEnabled___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "areAplLimitsEnabled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_removeFilter");
  return result;
}

- (id)_targetLayer
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[SBAveragePixelLuminanceLimitController targetView](self, "targetView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAveragePixelLuminanceLimitController isGlobalFilter](self, "isGlobalFilter"))
  {
    objc_msgSend(v4, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (void)_addFilter
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SBAveragePixelLuminanceLimitController _targetLayer](self, "_targetLayer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueForKeyPath:", CFSTR("filters.averagePixelLuminanceLimit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqual:", v3),
        v4,
        v5))
  {
    +[SBAlwaysOnDomain rootSettings](SBAlwaysOnDomain, "rootSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "aplSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2DE8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setName:", CFSTR("averagePixelLuminanceLimit"));
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "overallAPLLimit");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKeyPath:", v10, *MEMORY[0x1E0CD2CB8]);

    objc_msgSend(v8, "setAccessibility:", -[SBAveragePixelLuminanceLimitController isGlobalFilter](self, "isGlobalFilter"));
    objc_msgSend(v14, "filters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
      v11 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v11, "arrayByAddingObject:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFilters:", v13);

  }
}

- (void)_removeFilter
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[SBAveragePixelLuminanceLimitController _targetLayer](self, "_targetLayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKeyPath:", CFSTR("filters.averagePixelLuminanceLimit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqual:", v2);

    if ((v4 & 1) == 0)
    {
      objc_msgSend(v6, "mutableArrayValueForKeyPath:", CFSTR("filters"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObject:", v2);

    }
  }

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void (**v4)(void);
  void (**v5)(void);

  objc_msgSend(a3, "valueForKey:", CFSTR("SBAPLFilterAnimationCompletionKey"), a4);
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v4[2]();
    v4 = v5;
  }

}

- (BOOL)isGlobalFilter
{
  return self->_globalFilter;
}

- (void)setGlobalFilter:(BOOL)a3
{
  self->_globalFilter = a3;
}

- (UIView)targetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_targetView);
}

- (void)setTargetView:(id)a3
{
  objc_storeWeak((id *)&self->_targetView, a3);
}

- (BOOL)areAplLimitsEnabled
{
  return self->_aplLimitsEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetView);
}

@end
