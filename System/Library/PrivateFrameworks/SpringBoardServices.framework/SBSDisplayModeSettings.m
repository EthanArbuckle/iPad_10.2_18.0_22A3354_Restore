@implementation SBSDisplayModeSettings

- (SBSDisplayModeSettings)initWithSettings:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "scale");
  v6 = objc_msgSend(v4, "overscanCompensation");

  return -[SBSDisplayModeSettings initWithScale:overscanCompensation:](self, "initWithScale:overscanCompensation:", v5, v6);
}

- (BOOL)isEqual:(id)a3
{
  SBSDisplayModeSettings *v4;
  BOOL v5;

  v4 = (SBSDisplayModeSettings *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_scale == v4->_scale
      && self->_overscanCompensation == v4->_overscanCompensation;
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBSDisplayScaleDescription(self->_scale);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("scale"));

  SBSDisplayOverscanCompensationDescription(self->_overscanCompensation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("overscan"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBSDisplayModeSettings initWithSettings:](+[SBSMutableDisplayModeSettings allocWithZone:](SBSMutableDisplayModeSettings, "allocWithZone:", a3), "initWithSettings:", self);
}

- (SBSDisplayModeSettings)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scale"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("overscanCompensation"));

  return -[SBSDisplayModeSettings initWithScale:overscanCompensation:](self, "initWithScale:overscanCompensation:", v5, v6);
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t scale;
  id v5;

  scale = self->_scale;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", scale, CFSTR("scale"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_overscanCompensation, CFSTR("overscanCompensation"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fromDefaultsRepresentation:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("scale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("overscanCompensation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue");
  v9 = 0;
  if (v6 <= 2 && v8 <= 2)
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithScale:overscanCompensation:", v6, v8);
  return v9;
}

- (id)defaultsRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("scale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_scale);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("overscanCompensation");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_overscanCompensation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (SBSDisplayModeSettings)initWithScale:(unint64_t)a3 overscanCompensation:(int64_t)a4
{
  void *v8;
  SBSDisplayModeSettings *result;
  void *v10;
  objc_super v11;

  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSDisplayModeSettings.m"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("SBValidateDisplayScale(scale)"));

  }
  if ((unint64_t)a4 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSDisplayModeSettings.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("SBValidateOverscanCompensation(overscanCompensation)"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBSDisplayModeSettings;
  result = -[SBSDisplayModeSettings init](&v11, sel_init);
  if (result)
  {
    result->_scale = a3;
    result->_overscanCompensation = a4;
  }
  return result;
}

- (unint64_t)scale
{
  return self->_scale;
}

- (int64_t)overscanCompensation
{
  return self->_overscanCompensation;
}

@end
