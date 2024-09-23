@implementation PKCanMakePaymentsWithMerchantIdentifierDomainAndSourceApplication

void __PKCanMakePaymentsWithMerchantIdentifierDomainAndSourceApplication_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v3, "canMakePayments");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    if ((objc_msgSend(v3, "canMakeRemotePayments") & 1) != 0)
      goto LABEL_7;
    _PKAllNetworks();
    v4 = objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = PKCanMakePaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType(v4, 0, 31, *(void **)(a1 + 32), 0);
  }
  else
  {
    PKLogFacilityTypeGetObject(7uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "canMakePayments(NO): %@", buf, 0xCu);
    }
  }

LABEL_7:
  v5 = *(_QWORD *)(a1 + 72);
  if (*(_BYTE *)(*(_QWORD *)(v5 + 8) + 24))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __PKCanMakePaymentsWithMerchantIdentifierDomainAndSourceApplication_block_invoke_27;
    v10[3] = &unk_1E2AD0040;
    v12 = *(_QWORD *)(a1 + 80);
    v13 = v5;
    v11 = *(id *)(a1 + 64);
    objc_msgSend(v6, "merchantStatusCheck:merchantDomain:sourceApplicationSecondaryIdentifier:completion:", v8, v7, v9, v10);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
  }

}

void __PKCanMakePaymentsWithMerchantIdentifierDomainAndSourceApplication_block_invoke_27(uint64_t a1, char a2, void *a3)
{
  id v6;

  v6 = a3;
  if ((a2 & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __PKCanMakePaymentsWithMerchantIdentifierDomainAndSourceApplication_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t result;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v3 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v3;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v13 = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "PKSanitizedBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("bundle"));
  if (v4)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, CFSTR("merchantIdentifier"));
  if (v5)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("domain"));
  AnalyticsSendEvent();

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  return result;
}

@end
