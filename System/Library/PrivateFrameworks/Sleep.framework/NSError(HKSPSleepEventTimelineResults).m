@implementation NSError(HKSPSleepEventTimelineResults)

+ (id)hksp_validationErrorWithReason:()HKSPSleepEventTimelineResults
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v10[0] = CFSTR("HKSPSleepScheduleValidationErrorReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = CFSTR("HKSPSleepScheduleValidationErrorReasonDescription");
  if ((unint64_t)(a3 - 1) > 2)
    v6 = CFSTR("None");
  else
    v6 = off_1E4E3D190[a3 - 1];
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep"), 3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
