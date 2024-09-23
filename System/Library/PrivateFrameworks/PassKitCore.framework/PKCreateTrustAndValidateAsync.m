@implementation PKCreateTrustAndValidateAsync

void __PKCreateTrustAndValidateAsync_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.passkitcore.createtrust", v2);
  v1 = (void *)qword_1ECF21CD0;
  qword_1ECF21CD0 = (uint64_t)v0;

}

void __PKCreateTrustAndValidateAsync_block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __SecTrust *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10[0] = MEMORY[0x1E0C809B0];
  v4 = *(__SecTrust **)(v3 + 24);
  v10[2] = __PKCreateTrustAndValidateAsync_block_invoke_3;
  v10[3] = &unk_1E2AC1AC8;
  v5 = qword_1ECF21CD0;
  v10[1] = 3221225472;
  v6 = v2;
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v7;
  if (SecTrustEvaluateAsyncWithError(v4, v5, v10))
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, 0, 0);
    v9 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v9)
    {
      CFRelease(v9);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }

}

void __PKCreateTrustAndValidateAsync_block_invoke_3(uint64_t a1, SecTrustRef trust, int a3, __CFError *a4)
{
  BOOL v7;
  BOOL v8;
  const void *v9;
  NSObject *v10;
  uint64_t v11;
  const void *v12;
  NSObject *v13;
  SecTrustResultType result;
  uint8_t buf[4];
  const void *v17;
  __int16 v18;
  __CFError *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  result = kSecTrustResultInvalid;
  if (SecTrustGetTrustResult(trust, &result)
    || (result != kSecTrustResultUnspecified ? (v7 = result == kSecTrustResultProceed) : (v7 = 1),
        v7 ? (v8 = a3 == 0) : (v8 = 1),
        v8))
  {
    v9 = (const void *)SecTrustCopyFailureDescription();
    if (a4)
      a4 = (__CFError *)CFErrorCopyDescription(a4);
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = a4;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Error evaluating trust: %@ - %@.", buf, 0x16u);
    }

    if (v9)
      CFRelease(v9);
    if (a4)
      CFRelease(a4);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Trust validated.", buf, 2u);
    }

  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(void))(v11 + 16))();
  v12 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v12)
  {
    CFRelease(v12);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

@end
