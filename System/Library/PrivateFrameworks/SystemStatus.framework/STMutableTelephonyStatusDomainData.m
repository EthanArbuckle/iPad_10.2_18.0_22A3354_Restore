@implementation STMutableTelephonyStatusDomainData

- (void)updateSIMTwoInfoWithBlock:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;

  if (a3)
  {
    v4 = (void (**)(id, id))a3;
    -[STTelephonyStatusDomainData SIMTwoInfo](self, "SIMTwoInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "mutableCopyWithZone:", 0);

    v4[2](v4, v6);
    -[STMutableTelephonyStatusDomainData setSIMTwoInfo:](self, "setSIMTwoInfo:", v6);

  }
}

- (void)updateSIMOneInfoWithBlock:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;

  if (a3)
  {
    v4 = (void (**)(id, id))a3;
    -[STTelephonyStatusDomainData SIMOneInfo](self, "SIMOneInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "mutableCopyWithZone:", 0);

    v4[2](v4, v6);
    -[STMutableTelephonyStatusDomainData setSIMOneInfo:](self, "setSIMOneInfo:", v6);

  }
}

- (void)setSIMTwoInfo:(id)a3
{
  STTelephonyStatusDomainSIMInfo *v4;
  STTelephonyStatusDomainSIMInfo *SIMTwoInfo;
  id v6;

  v6 = a3;
  if (!-[STTelephonyStatusDomainSIMInfo isEqual:](self->super._SIMTwoInfo, "isEqual:"))
  {
    v4 = (STTelephonyStatusDomainSIMInfo *)objc_msgSend(v6, "copy");
    SIMTwoInfo = self->super._SIMTwoInfo;
    self->super._SIMTwoInfo = v4;

  }
}

- (void)setSIMOneInfo:(id)a3
{
  STTelephonyStatusDomainSIMInfo *v4;
  STTelephonyStatusDomainSIMInfo *SIMOneInfo;
  id v6;

  v6 = a3;
  if (!-[STTelephonyStatusDomainSIMInfo isEqual:](self->super._SIMOneInfo, "isEqual:"))
  {
    v4 = (STTelephonyStatusDomainSIMInfo *)objc_msgSend(v6, "copy");
    SIMOneInfo = self->super._SIMOneInfo;
    self->super._SIMOneInfo = v4;

  }
}

- (void)setRadioModuleDead:(BOOL)a3
{
  if (self->super._radioModuleDead != a3)
    self->super._radioModuleDead = a3;
}

- (void)setDualSIMEnabled:(BOOL)a3
{
  if (self->super._dualSIMEnabled != a3)
    self->super._dualSIMEnabled = a3;
}

- (void)setCellularRadioCapabilityEnabled:(BOOL)a3
{
  if (self->super._cellularRadioCapabilityEnabled != a3)
    self->super._cellularRadioCapabilityEnabled = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[STTelephonyStatusDomainData initWithData:](+[STTelephonyStatusDomainData allocWithZone:](STTelephonyStatusDomainData, "allocWithZone:", a3), self);
}

- (BOOL)applyDiff:(id)a3
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v4, "applyToMutableData:", self);

  return isKindOfClass & 1;
}

- (void)setUsingStewieForSOS:(BOOL)a3
{
  if (self->super._usingStewieForSOS != a3)
    self->super._usingStewieForSOS = a3;
}

- (void)setInactiveSOSEnabled:(BOOL)a3
{
  if (self->super._inactiveSOSEnabled != a3)
    self->super._inactiveSOSEnabled = a3;
}

- (void)setUsingStewieConnection:(BOOL)a3
{
  if (self->super._usingStewieConnection != a3)
    self->super._usingStewieConnection = a3;
}

@end
