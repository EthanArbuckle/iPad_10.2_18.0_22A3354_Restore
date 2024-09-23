@implementation SBSMutableDisplayModeSettings

- (void)setScale:(unint64_t)a3
{
  void *v6;

  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSDisplayModeSettings.m"), 223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scale == SBSDisplayScaleStandard || scale == SBSDisplayScaleLargerText || scale == SBSDisplayScaleMoreSpace"));

  }
  self->super._scale = a3;
}

- (void)setOverscanCompensation:(int64_t)a3
{
  void *v6;

  if ((unint64_t)a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSDisplayModeSettings.m"), 229, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("overscanCompensation == SBSDisplayOverscanCompensationNone || overscanCompensation == SBSDisplayOverscanCompensationInsetBounds || overscanCompensation == SBSDisplayOverscanCompensationScaleContent"));

  }
  self->super._overscanCompensation = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBSDisplayModeSettings initWithSettings:]([SBSDisplayModeSettings alloc], "initWithSettings:", self);
}

@end
