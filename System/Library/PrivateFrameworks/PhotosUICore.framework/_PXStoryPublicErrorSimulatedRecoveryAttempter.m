@implementation _PXStoryPublicErrorSimulatedRecoveryAttempter

- (NSArray)recoveryOptions
{
  return (NSArray *)&unk_1E53EA218;
}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  id v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86___PXStoryPublicErrorSimulatedRecoveryAttempter_attemptRecoveryFromError_optionIndex___block_invoke;
  v6[3] = &__block_descriptor_40_e30_v16__0__PXAlertConfiguration_8l;
  v6[4] = a4;
  v4 = +[PXAlert show:](PXAlert, "show:", v6);
  return 1;
}

@end
