@implementation _UIFluidSliderInteractionConfiguration

+ (id)configurationWithTrackSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat *v5;

  height = a3.height;
  width = a3.width;
  v5 = (CGFloat *)objc_opt_new();
  v5[6] = width;
  v5[7] = height;
  return v5;
}

- (_UIFluidSliderInteractionConfiguration)init
{
  _UIFluidSliderInteractionConfiguration *v2;
  void *v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFluidSliderInteractionConfiguration;
  v2 = -[_UIFluidSliderInteractionConfiguration init](&v6, sel_init);
  if (v2)
  {
    +[_UIFluidSliderSettingsDomain rootSettings](_UIFluidSliderSettingsDomain, "rootSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFluidSliderInteractionConfiguration setPreferredInputMethods:](v2, "setPreferredInputMethods:", 3);
    objc_msgSend(v3, "defaultStretchAmount");
    -[_UIFluidSliderInteractionConfiguration setStretchAmount:](v2, "setStretchAmount:");
    -[_UIFluidSliderInteractionConfiguration setVelocityMultiplier:](v2, "setVelocityMultiplier:", 1.0);
    objc_msgSend(v3, "sliderStepCount");
    -[_UIFluidSliderInteractionConfiguration setStepCount:](v2, "setStepCount:", (unint64_t)v4);

  }
  return v2;
}

- (id)copyWithTrackSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  id result;

  height = a3.height;
  width = a3.width;
  result = (id)-[_UIFluidSliderInteractionConfiguration copy](self, "copy");
  *((CGFloat *)result + 6) = width;
  *((CGFloat *)result + 7) = height;
  return result;
}

- (id)copyWithVelocityMultiplier:(double)a3
{
  id result;

  result = (id)-[_UIFluidSliderInteractionConfiguration copy](self, "copy");
  *((double *)result + 3) = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[_UIFluidSliderInteractionConfiguration trackSize](self, "trackSize");
  v4[6] = v5;
  v4[7] = v6;
  -[_UIFluidSliderInteractionConfiguration stretchAmount](self, "stretchAmount");
  objc_msgSend(v4, "setStretchAmount:");
  -[_UIFluidSliderInteractionConfiguration velocityMultiplier](self, "velocityMultiplier");
  objc_msgSend(v4, "setVelocityMultiplier:");
  objc_msgSend(v4, "setStepCount:", -[_UIFluidSliderInteractionConfiguration stepCount](self, "stepCount"));
  objc_msgSend(v4, "setPreferredInputMethods:", -[_UIFluidSliderInteractionConfiguration preferredInputMethods](self, "preferredInputMethods"));
  -[_UIFluidSliderInteractionConfiguration _customDrivers](self, "_customDrivers");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[1];
  v4[1] = v7;

  return v4;
}

- (void)_setCustomDrivers:(id)a3
{
  id v5;
  NSArray *customDrivers;
  NSArray *v7;
  NSArray *v8;
  char v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;
  void *v13;
  NSArray *v14;

  v5 = a3;
  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0 && (_UIApplicationProcessIsUIKitester() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFluidSliderInteraction.m"), 84, CFSTR("This SPI may only be used by approved clients."));

  }
  customDrivers = self->_customDrivers;
  v14 = (NSArray *)v5;
  v7 = customDrivers;
  if (v7 == v14)
  {

    v11 = v14;
  }
  else
  {
    v8 = v7;
    if (v14 && v7)
    {
      v9 = -[NSArray isEqual:](v14, "isEqual:", v7);

      v10 = v14;
      if ((v9 & 1) != 0)
        goto LABEL_13;
    }
    else
    {

      v10 = v14;
    }
    v12 = v10;
    v11 = self->_customDrivers;
    self->_customDrivers = v12;
  }

  v10 = v14;
LABEL_13:

}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFluidSliderInteractionConfiguration trackSize](self, "trackSize");
  v5 = v4;
  -[_UIFluidSliderInteractionConfiguration trackSize](self, "trackSize");
  objc_msgSend(v3, "appendFormat:", CFSTR("; trackSize = (%g, %g)"), v5, v6);
  -[_UIFluidSliderInteractionConfiguration stretchAmount](self, "stretchAmount");
  objc_msgSend(v3, "appendFormat:", CFSTR("; stretchAmount = %g"), v7);
  -[_UIFluidSliderInteractionConfiguration velocityMultiplier](self, "velocityMultiplier");
  objc_msgSend(v3, "appendFormat:", CFSTR("; velocityMultiplier = %g"), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR("; stepCount = %lu"),
    -[_UIFluidSliderInteractionConfiguration stepCount](self, "stepCount"));
  v9 = -[_UIFluidSliderInteractionConfiguration preferredInputMethods](self, "preferredInputMethods");
  v10 = (void *)objc_opt_new();
  v11 = v10;
  if ((v9 & 1) != 0)
    objc_msgSend(v10, "addObject:", CFSTR("touch"));
  if ((v9 & 2) != 0)
    objc_msgSend(v11, "addObject:", CFSTR("volumeButtons"));
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; inputMethods = (%@)"), v12);

  -[_UIFluidSliderInteractionConfiguration _customDrivers](self, "_customDrivers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v15 = (void *)objc_opt_new();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[_UIFluidSliderInteractionConfiguration _customDrivers](self, "_customDrivers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v20), "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v18);
    }

    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; customDrivers = (%@)"), v22);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));

  return v3;
}

- (NSArray)_customDrivers
{
  return self->_customDrivers;
}

- (CGSize)trackSize
{
  double width;
  double height;
  CGSize result;

  width = self->_trackSize.width;
  height = self->_trackSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)stretchAmount
{
  return self->_stretchAmount;
}

- (void)setStretchAmount:(double)a3
{
  self->_stretchAmount = a3;
}

- (double)velocityMultiplier
{
  return self->_velocityMultiplier;
}

- (void)setVelocityMultiplier:(double)a3
{
  self->_velocityMultiplier = a3;
}

- (unint64_t)stepCount
{
  return self->_stepCount;
}

- (void)setStepCount:(unint64_t)a3
{
  self->_stepCount = a3;
}

- (unint64_t)preferredInputMethods
{
  return self->_preferredInputMethods;
}

- (void)setPreferredInputMethods:(unint64_t)a3
{
  self->_preferredInputMethods = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDrivers, 0);
}

@end
