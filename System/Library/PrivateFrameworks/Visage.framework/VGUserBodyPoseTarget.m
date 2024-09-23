@implementation VGUserBodyPoseTarget

+ (id)targetWithIdentifier:(unint64_t)a3 targetDescription:(id)a4 targetMin:(float)a5 targetMax:(float)a6 marginMin:(float)a7 marginMax:(float)a8 feedbackTooSmall:(unint64_t)a9 feedbackTooLarge:(unint64_t)a10 rejectionReasonTooSmall:(int)a11 rejectionReasonTooLarge:(int)a12
{
  id v21;
  uint64_t v22;
  void *v23;

  v21 = a4;
  v22 = objc_opt_new();
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 32) = a3;
  *(_QWORD *)(v22 + 40) = v21;

  *(float *)(v22 + 8) = a5;
  *(float *)(v22 + 12) = a6;
  *(float *)(v22 + 16) = a7;
  *(float *)(v22 + 20) = a8;
  *(_QWORD *)(v22 + 48) = a9;
  *(_QWORD *)(v22 + 56) = a10;
  *(_DWORD *)(v22 + 24) = a11;
  *(_DWORD *)(v22 + 28) = a12;
  return (id)v22;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSString)targetDescription
{
  return self->_targetDescription;
}

- (float)targetMin
{
  return self->_targetMin;
}

- (float)targetMax
{
  return self->_targetMax;
}

- (float)marginMin
{
  return self->_marginMin;
}

- (float)marginMax
{
  return self->_marginMax;
}

- (unint64_t)feedbackTooSmall
{
  return self->_feedbackTooSmall;
}

- (unint64_t)feedbackTooLarge
{
  return self->_feedbackTooLarge;
}

- (int)rejectionReasonTooSmall
{
  return self->_rejectionReasonTooSmall;
}

- (int)rejectionReasonTooLarge
{
  return self->_rejectionReasonTooLarge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDescription, 0);
}

@end
