@implementation CEMSystemRatingsDeclaration

- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  const __CFString *v15;

  v14 = CFSTR("countryCode");
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[CEMSystemRatingsDeclaration payloadRatingRegion](self, "payloadRatingRegion"));
  v8 = (void *)v7;
  v9 = &stru_1000BC2E0;
  if (v7)
    v9 = (const __CFString *)v7;
  v15 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));

  CFPreferencesSetAppValue(CFSTR("SBParentalControlsMCContentRestrictions"), v10, CFSTR("com.apple.springboard"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetProvidersByPayloadIdentifier"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CEMSystemRatingsDeclaration dmf_installSynthesizedProfileRequestWithAssetProviders:error:](self, "dmf_installSynthesizedProfileRequestWithAssetProviders:error:", v11, a4));
  return v12;
}

- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4
{
  return -[CEMSystemRatingsDeclaration dmf_removeSynthesizedProfileRequestWithError:](self, "dmf_removeSynthesizedProfileRequestWithError:", a4);
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  return 0;
}

@end
