@implementation PFDeviceLockScreenApproximateTimeRectNormalized

void __PFDeviceLockScreenApproximateTimeRectNormalized_SBS_block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double *v10;
  void *v11;
  _QWORD v12[4];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
  v10[4] = a2;
  v10[5] = a3;
  v10[6] = a4;
  v10[7] = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(double *)v12 = a2;
    *(double *)&v12[1] = a3;
    *(double *)&v12[2] = a4;
    *(double *)&v12[3] = a5;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v12, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v11;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFDeviceLockScreenApproximateTimeRectNormalized_SBS] Using limited occlusion bounds for time rect: %@", buf, 0xCu);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
