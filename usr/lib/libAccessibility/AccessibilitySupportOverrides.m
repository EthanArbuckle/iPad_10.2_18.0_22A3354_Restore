@implementation AccessibilitySupportOverrides

- (NSNumber)grayscale
{
  return self->_grayscale;
}

- (NSNumber)differentiateWithoutColor
{
  return self->_differentiateWithoutColor;
}

- (NSNumber)buttonShapes
{
  return self->_buttonShapes;
}

- (NSNumber)reduceTransparency
{
  return self->_reduceTransparency;
}

- (NSNumber)reduceMotion
{
  return self->_reduceMotion;
}

- (NSNumber)smartInvert
{
  return self->_smartInvert;
}

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global);
  return (id)shared_Shared;
}

- (NSNumber)increaseContrast
{
  return self->_increaseContrast;
}

- (NSNumber)boldText
{
  return self->_boldText;
}

void __39__AccessibilitySupportOverrides_shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)shared_Shared;
  shared_Shared = v0;

}

- (NSNumber)onOffLabels
{
  return self->_onOffLabels;
}

- (void)setBoldText:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__AccessibilitySupportOverrides_setBoldText___block_invoke;
  v6[3] = &unk_1E2937940;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __45__AccessibilitySupportOverrides_setBoldText___block_invoke(uint64_t a1)
{
  id v1;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", kAXSEnhanceTextLegibilityChangedNotification[0], 0);

}

- (void)setReduceMotion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__AccessibilitySupportOverrides_setReduceMotion___block_invoke;
  v6[3] = &unk_1E2937940;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __49__AccessibilitySupportOverrides_setReduceMotion___block_invoke(uint64_t a1)
{
  id v1;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", kAXSReduceMotionChangedNotification[0], 0);

}

- (void)setReduceTransparency:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__AccessibilitySupportOverrides_setReduceTransparency___block_invoke;
  v6[3] = &unk_1E2937940;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __55__AccessibilitySupportOverrides_setReduceTransparency___block_invoke(uint64_t a1)
{
  id v1;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", kAXSEnhanceBackgroundContrastChangedNotification[0], 0);

}

- (void)setIncreaseContrast:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__AccessibilitySupportOverrides_setIncreaseContrast___block_invoke;
  v6[3] = &unk_1E2937940;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __53__AccessibilitySupportOverrides_setIncreaseContrast___block_invoke(uint64_t a1)
{
  id v1;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", kAXSDarkenSystemColorsEnabledNotification[0], 0);

}

- (void)setOnOffLabels:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__AccessibilitySupportOverrides_setOnOffLabels___block_invoke;
  v6[3] = &unk_1E2937940;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __48__AccessibilitySupportOverrides_setOnOffLabels___block_invoke(uint64_t a1)
{
  id v1;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", kAXSIncreaseButtonLegibilityNotification[0], 0);

}

- (void)setGrayscale:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__AccessibilitySupportOverrides_setGrayscale___block_invoke;
  v6[3] = &unk_1E2937940;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __46__AccessibilitySupportOverrides_setGrayscale___block_invoke(uint64_t a1)
{
  id v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_installGrayscaleFilter");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", kAXSGrayscaleEnabledNotification[0], 0);

}

- (void)setSmartInvert:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__AccessibilitySupportOverrides_setSmartInvert___block_invoke;
  v6[3] = &unk_1E2937940;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __48__AccessibilitySupportOverrides_setSmartInvert___block_invoke(uint64_t a1)
{
  id v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_installInvertColorsFilter");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", kAXSInvertColorsEnabledNotification[0], 0);

}

- (void)setButtonShapes:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__AccessibilitySupportOverrides_setButtonShapes___block_invoke;
  v6[3] = &unk_1E2937940;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __49__AccessibilitySupportOverrides_setButtonShapes___block_invoke(uint64_t a1)
{
  id v1;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", kAXSButtonShapesEnabledNotification[0], 0);

}

- (void)setDifferentiateWithoutColor:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__AccessibilitySupportOverrides_setDifferentiateWithoutColor___block_invoke;
  v6[3] = &unk_1E2937940;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __62__AccessibilitySupportOverrides_setDifferentiateWithoutColor___block_invoke(uint64_t a1)
{
  id v1;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", kAXSDifferentiateWithoutColorChangedNotification[0], 0);

}

- (void)_addFilter:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  -[objc_class sharedApplication](NSClassFromString(CFSTR("UIApplication")), "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "filters");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __44__AccessibilitySupportOverrides__addFilter___block_invoke;
    v11[3] = &unk_1E2937968;
    v9 = v3;
    v12 = v9;
    if (objc_msgSend(v8, "indexOfObjectPassingTest:", v11) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v8, "arrayByAddingObject:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }

  }
  else
  {
    v13[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("filters"));

}

uint64_t __44__AccessibilitySupportOverrides__addFilter___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)_removeFilterWithName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a3;
  -[objc_class sharedApplication](NSClassFromString(CFSTR("UIApplication")), "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__AccessibilitySupportOverrides__removeFilterWithName___block_invoke;
    v11[3] = &unk_1E2937968;
    v12 = v10;
    v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v11);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = v7;
      v9 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v9, "removeObjectAtIndex:", v8);
      objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("filters"));

    }
  }

}

uint64_t __55__AccessibilitySupportOverrides__removeFilterWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_installInvertColorsFilter
{
  void *v3;
  int v4;
  id v5;

  -[AccessibilitySupportOverrides smartInvert](self, "smartInvert");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    -[objc_class filterWithType:](NSClassFromString(CFSTR("CAFilter")), "filterWithType:", CFSTR("colorInvert"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", CFSTR("colorInvert"));
    objc_msgSend(v5, "setAccessibility:", 1);
    -[AccessibilitySupportOverrides _addFilter:](self, "_addFilter:", v5);

  }
  else
  {
    -[AccessibilitySupportOverrides _removeFilterWithName:](self, "_removeFilterWithName:", CFSTR("colorInvert"));
  }
}

- (void)_installGrayscaleFilter
{
  void *v3;
  int v4;
  id v5;

  -[AccessibilitySupportOverrides grayscale](self, "grayscale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    -[objc_class filterWithType:](NSClassFromString(CFSTR("CAFilter")), "filterWithType:", CFSTR("colorMonochrome"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", CFSTR("colorMonochrome"));
    objc_msgSend(v5, "setAccessibility:", 1);
    -[AccessibilitySupportOverrides _addFilter:](self, "_addFilter:", v5);

  }
  else
  {
    -[AccessibilitySupportOverrides _removeFilterWithName:](self, "_removeFilterWithName:", CFSTR("colorMonochrome"));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_differentiateWithoutColor, 0);
  objc_storeStrong((id *)&self->_smartInvert, 0);
  objc_storeStrong((id *)&self->_grayscale, 0);
  objc_storeStrong((id *)&self->_buttonShapes, 0);
  objc_storeStrong((id *)&self->_onOffLabels, 0);
  objc_storeStrong((id *)&self->_reduceMotion, 0);
  objc_storeStrong((id *)&self->_reduceTransparency, 0);
  objc_storeStrong((id *)&self->_increaseContrast, 0);
  objc_storeStrong((id *)&self->_boldText, 0);
}

@end
