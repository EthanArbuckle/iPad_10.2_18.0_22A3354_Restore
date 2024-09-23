@implementation UIUpdateInfo

- (double)initWithUpdateParameters:(void *)a1
{
  double *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)UIUpdateInfo;
  v3 = (double *)objc_msgSendSuper2(&v5, sel_init);
  if (v3)
  {
    v3[3] = _UIMediaTimeForMachTime(*(_QWORD *)a2);
    v3[4] = _UIMediaTimeForMachTime(*(_QWORD *)(a2 + 16));
    v3[5] = _UIMediaTimeForMachTime(*(_QWORD *)(a2 + 24));
    *((_BYTE *)v3 + 18) = *(_BYTE *)(a2 + 32);
    *((_BYTE *)v3 + 16) = *(_BYTE *)(a2 + 33);
    v3[1] = *(double *)(a2 + 40);
  }
  return v3;
}

- (double)modelTime
{
  return self->_modelTime;
}

- (double)completionDeadlineTime
{
  return self->_completionDeadlineTime;
}

- (double)estimatedPresentationTime
{
  return self->_estimatedPresentationTime;
}

- (BOOL)isImmediatePresentationExpected
{
  return self->_immediatePresentationExpected;
}

- (BOOL)isLowLatencyEventDispatchConfirmed
{
  return self->_lowLatencyEventDispatchConfirmed;
}

- (BOOL)isPerformingLowLatencyPhases
{
  return self->_performingLowLatencyPhases;
}

@end
