@implementation SSEHelper

+ (id)performOperationApprovalV3:(id)a3 seid:(id)a4 acl:(id)a5 operation:(id)a6 nonce:(id)a7 error:(id *)a8
{
  const __CFData *v13;
  __CFString *v14;
  const __CFData *v15;
  const __CFData *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFData *v19;
  const __CFData *v20;
  uint64_t v21;
  uint64_t v22;
  __CFData *v23;
  __CFData *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v32[4];
  __CFData *v33;
  __CFData *v34;
  _QWORD v35[4];

  v13 = (const __CFData *)a7;
  v14 = (__CFString *)a6;
  v15 = (const __CFData *)a4;
  v16 = (const __CFData *)a3;
  v35[0] = objc_msgSend(a5, "DERItem");
  v35[1] = v17;
  v35[2] = 0;
  v35[3] = 0;
  v18 = encodeSequenceSpec(v35, &off_1003040C0);
  v19 = (const __CFData *)objc_claimAutoreleasedReturnValue(v18);
  v33 = 0;
  v34 = 0;
  v20 = (const __CFData *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  LODWORD(a5) = SSEEvaluateSecureElementACL(v16, v15, v19, v20, v14, v13, 3u, &v34, &v33);

  v24 = v33;
  v23 = v34;
  if (!(_DWORD)a5 && v34 && v33)
  {
    v32[0] = -[__CFData DERItem](v34, "DERItem");
    v32[1] = v25;
    v32[2] = -[__CFData DERItem](v24, "DERItem");
    v32[3] = v26;
    v27 = encodeSequenceSpec(0xE00000000000000CLL, v32, &off_1003040D0);
    a8 = (id *)objc_claimAutoreleasedReturnValue(v27);
  }
  else if (a8)
  {
    v28 = SESDefaultLogObject(v21, v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = SESCreateAndLogError(0, v29, SESErrorDomain, 0, CFSTR("SSE returned %d (or nil output)"));
    *a8 = (id)objc_claimAutoreleasedReturnValue(v30);

    a8 = 0;
  }

  return a8;
}

@end
