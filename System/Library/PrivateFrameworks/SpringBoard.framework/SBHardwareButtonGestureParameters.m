@implementation SBHardwareButtonGestureParameters

- (id)copyWithZone:(_NSZone *)a3
{
  SBHardwareButtonGestureParameters *v4;
  double v5;
  double v6;

  v4 = -[SBHardwareButtonGestureParameters init](+[SBHardwareButtonGestureParameters allocWithZone:](SBHardwareButtonGestureParameters, "allocWithZone:", a3), "init");
  -[SBHardwareButtonGestureParameters multiplePressTimeInterval](self, "multiplePressTimeInterval");
  v4->_multiplePressTimeInterval = v5;
  -[SBHardwareButtonGestureParameters longPressTimeInterval](self, "longPressTimeInterval");
  v4->_longPressTimeInterval = v6;
  v4->_maximumPressCount = -[SBHardwareButtonGestureParameters maximumPressCount](self, "maximumPressCount");
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SBMutableHardwareButtonGestureParameters *v4;

  v4 = -[SBMutableHardwareButtonGestureParameters init](+[SBMutableHardwareButtonGestureParameters allocWithZone:](SBMutableHardwareButtonGestureParameters, "allocWithZone:", a3), "init");
  -[SBMutableHardwareButtonGestureParameters setMaximumPressCount:](v4, "setMaximumPressCount:", -[SBHardwareButtonGestureParameters maximumPressCount](self, "maximumPressCount"));
  -[SBHardwareButtonGestureParameters longPressTimeInterval](self, "longPressTimeInterval");
  -[SBMutableHardwareButtonGestureParameters setLongPressTimeInterval:](v4, "setLongPressTimeInterval:");
  -[SBHardwareButtonGestureParameters multiplePressTimeInterval](self, "multiplePressTimeInterval");
  -[SBMutableHardwareButtonGestureParameters setMultiplePressTimeInterval:](v4, "setMultiplePressTimeInterval:");
  return v4;
}

- (NSString)description
{
  return (NSString *)-[SBHardwareButtonGestureParameters descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHardwareButtonGestureParameters succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHardwareButtonGestureParameters descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  -[SBHardwareButtonGestureParameters succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBHardwareButtonGestureParameters maximumPressCount](self, "maximumPressCount"), CFSTR("maximumPressCount"));
  -[SBHardwareButtonGestureParameters longPressTimeInterval](self, "longPressTimeInterval");
  v6 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", CFSTR("longPressTimeInterval"), 0);
  -[SBHardwareButtonGestureParameters multiplePressTimeInterval](self, "multiplePressTimeInterval");
  v7 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", CFSTR("multiplePressTimeInterval"), 0);
  return v4;
}

- (int64_t)maximumPressCount
{
  return self->_maximumPressCount;
}

- (double)longPressTimeInterval
{
  return self->_longPressTimeInterval;
}

- (double)multiplePressTimeInterval
{
  return self->_multiplePressTimeInterval;
}

@end
