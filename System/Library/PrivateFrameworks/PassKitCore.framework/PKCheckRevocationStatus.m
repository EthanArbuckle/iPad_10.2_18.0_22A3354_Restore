@implementation PKCheckRevocationStatus

void __PKCheckRevocationStatus_block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD v5[4];
  id v6;
  _QWORD block[4];
  id v8;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    dispatch_get_global_queue(0, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = MEMORY[0x1E0C809B0];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __PKCheckRevocationStatus_block_invoke_2;
    v5[3] = &unk_1E2ABD9A0;
    v6 = v1;
    v4 = v5;
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_5;
    block[3] = &unk_1E2ABD9A0;
    v8 = v4;
    dispatch_async(v2, block);

  }
}

uint64_t __PKCheckRevocationStatus_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __PKCheckRevocationStatus_block_invoke_63(uint64_t a1)
{
  _BOOL4 v2;
  OSStatus TrustResult;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void *v9;
  NSObject *v10;
  SecTrustResultType result;
  uint8_t buf[4];
  _BYTE v13[18];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = SecTrustEvaluateWithError(*(SecTrustRef *)(a1 + 40), 0);
  TrustResult = 0;
  result = kSecTrustResultInvalid;
  if (!v2 || (TrustResult = SecTrustGetTrustResult(*(SecTrustRef *)(a1 + 40), &result)) != 0)
  {
    if (PKDeveloperLoggingEnabled() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v13 = v2;
      *(_WORD *)&v13[4] = 2048;
      *(_QWORD *)&v13[6] = TrustResult;
      _os_log_error_impl(&dword_18FC92000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Revocation check failed with result %d status %ld", buf, 0x12u);
    }
    PKLogFacilityTypeGetObject(5uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v13 = v2;
      *(_WORD *)&v13[4] = 2048;
      *(_QWORD *)&v13[6] = TrustResult;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Revocation check failed with result %d status %ld", buf, 0x12u);
    }

    v5 = 0;
    goto LABEL_9;
  }
  v5 = 1;
  if (result > kSecTrustResultFatalTrustFailure || ((1 << result) & 0x68) == 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v9 = (const void *)SecTrustCopyFailureDescription();
  if (PKDeveloperLoggingEnabled() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)v13 = result;
    *(_WORD *)&v13[8] = 2112;
    *(_QWORD *)&v13[10] = v9;
    _os_log_error_impl(&dword_18FC92000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Pass is revoked! (result type %ld: %@)", buf, 0x16u);
  }
  PKLogFacilityTypeGetObject(5uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)v13 = result;
    *(_WORD *)&v13[8] = 2112;
    *(_QWORD *)&v13[10] = v9;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Pass is revoked! (result type %ld: %@)", buf, 0x16u);
  }

  if (v9)
    CFRelease(v9);
  v5 = 1;
  v6 = 1;
LABEL_10:
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v5, v6);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
