@implementation SWSystemActivityAcquisitionDetails

- (SWSystemActivityAcquisitionDetails)initWithAfterPendingSleepWasAlreadyInitiated:(BOOL)a3 afterFailingToRevertPendingSleep:(BOOL)a4 afterSleepOfNonZeroDuration:(BOOL)a5
{
  SWSystemActivityAcquisitionDetails *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SWSystemActivityAcquisitionDetails;
  result = -[SWSystemActivityAcquisitionDetails init](&v9, sel_init);
  if (result)
  {
    result->_afterPendingSleepWasAlreadyInitiated = a3;
    result->_afterFailingToRevertPendingSleep = a4;
    result->_afterSleepOfNonZeroDuration = a5;
  }
  return result;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_afterPendingSleepWasAlreadyInitiated, CFSTR("afterPendingSleepWasAlreadyInitiated"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_afterFailingToRevertPendingSleep, CFSTR("afterFailingToRevertPendingSleep"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_afterSleepOfNonZeroDuration, CFSTR("afterSleepOfNonZeroDuration"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)afterPendingSleepWasAlreadyInitiated
{
  return self->_afterPendingSleepWasAlreadyInitiated;
}

- (BOOL)afterFailingToRevertPendingSleep
{
  return self->_afterFailingToRevertPendingSleep;
}

- (BOOL)afterSleepOfNonZeroDuration
{
  return self->_afterSleepOfNonZeroDuration;
}

@end
