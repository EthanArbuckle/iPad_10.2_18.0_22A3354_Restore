@implementation PKProtobufPaymentRequest

- (BOOL)hasMerchantIdentifier
{
  return self->_merchantIdentifier != 0;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (BOOL)hasCurrencyCode
{
  return self->_currencyCode != 0;
}

- (void)clearSupportedNetworks
{
  -[NSMutableArray removeAllObjects](self->_supportedNetworks, "removeAllObjects");
}

- (void)addSupportedNetworks:(id)a3
{
  id v4;
  NSMutableArray *supportedNetworks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  supportedNetworks = self->_supportedNetworks;
  v8 = v4;
  if (!supportedNetworks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_supportedNetworks;
    self->_supportedNetworks = v6;

    v4 = v8;
    supportedNetworks = self->_supportedNetworks;
  }
  -[NSMutableArray addObject:](supportedNetworks, "addObject:", v4);

}

- (unint64_t)supportedNetworksCount
{
  return -[NSMutableArray count](self->_supportedNetworks, "count");
}

- (id)supportedNetworksAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_supportedNetworks, "objectAtIndex:", a3);
}

+ (Class)supportedNetworksType
{
  return (Class)objc_opt_class();
}

- (void)setMerchantCapabilities:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_merchantCapabilities = a3;
}

- (void)setHasMerchantCapabilities:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMerchantCapabilities
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRequiredBillingAddressFields:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_requiredBillingAddressFields = a3;
}

- (void)setHasRequiredBillingAddressFields:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRequiredBillingAddressFields
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRequiredShippingAddressFields:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_requiredShippingAddressFields = a3;
}

- (void)setHasRequiredShippingAddressFields:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRequiredShippingAddressFields
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasBillingContact
{
  return self->_billingContact != 0;
}

- (BOOL)hasShippingContact
{
  return self->_shippingContact != 0;
}

- (void)clearSummaryItems
{
  -[NSMutableArray removeAllObjects](self->_summaryItems, "removeAllObjects");
}

- (void)addSummaryItems:(id)a3
{
  id v4;
  NSMutableArray *summaryItems;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  summaryItems = self->_summaryItems;
  v8 = v4;
  if (!summaryItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_summaryItems;
    self->_summaryItems = v6;

    v4 = v8;
    summaryItems = self->_summaryItems;
  }
  -[NSMutableArray addObject:](summaryItems, "addObject:", v4);

}

- (unint64_t)summaryItemsCount
{
  return -[NSMutableArray count](self->_summaryItems, "count");
}

- (id)summaryItemsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_summaryItems, "objectAtIndex:", a3);
}

+ (Class)summaryItemsType
{
  return (Class)objc_opt_class();
}

- (void)clearShippingMethods
{
  -[NSMutableArray removeAllObjects](self->_shippingMethods, "removeAllObjects");
}

- (void)addShippingMethods:(id)a3
{
  id v4;
  NSMutableArray *shippingMethods;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  shippingMethods = self->_shippingMethods;
  v8 = v4;
  if (!shippingMethods)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_shippingMethods;
    self->_shippingMethods = v6;

    v4 = v8;
    shippingMethods = self->_shippingMethods;
  }
  -[NSMutableArray addObject:](shippingMethods, "addObject:", v4);

}

- (unint64_t)shippingMethodsCount
{
  return -[NSMutableArray count](self->_shippingMethods, "count");
}

- (id)shippingMethodsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_shippingMethods, "objectAtIndex:", a3);
}

+ (Class)shippingMethodsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasApplicationData
{
  return self->_applicationData != 0;
}

- (BOOL)hasOriginatingURL
{
  return self->_originatingURL != 0;
}

- (BOOL)hasMerchantSession
{
  return self->_merchantSession != 0;
}

- (void)clearThumbnailURLs
{
  -[NSMutableArray removeAllObjects](self->_thumbnailURLs, "removeAllObjects");
}

- (void)addThumbnailURLs:(id)a3
{
  id v4;
  NSMutableArray *thumbnailURLs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  thumbnailURLs = self->_thumbnailURLs;
  v8 = v4;
  if (!thumbnailURLs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_thumbnailURLs;
    self->_thumbnailURLs = v6;

    v4 = v8;
    thumbnailURLs = self->_thumbnailURLs;
  }
  -[NSMutableArray addObject:](thumbnailURLs, "addObject:", v4);

}

- (unint64_t)thumbnailURLsCount
{
  return -[NSMutableArray count](self->_thumbnailURLs, "count");
}

- (id)thumbnailURLsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_thumbnailURLs, "objectAtIndex:", a3);
}

+ (Class)thumbnailURLsType
{
  return (Class)objc_opt_class();
}

- (void)setExpectsMerchantSession:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_expectsMerchantSession = a3;
}

- (void)setHasExpectsMerchantSession:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasExpectsMerchantSession
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)clearRequiredShippingContactFields
{
  -[NSMutableArray removeAllObjects](self->_requiredShippingContactFields, "removeAllObjects");
}

- (void)addRequiredShippingContactFields:(id)a3
{
  id v4;
  NSMutableArray *requiredShippingContactFields;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  requiredShippingContactFields = self->_requiredShippingContactFields;
  v8 = v4;
  if (!requiredShippingContactFields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_requiredShippingContactFields;
    self->_requiredShippingContactFields = v6;

    v4 = v8;
    requiredShippingContactFields = self->_requiredShippingContactFields;
  }
  -[NSMutableArray addObject:](requiredShippingContactFields, "addObject:", v4);

}

- (unint64_t)requiredShippingContactFieldsCount
{
  return -[NSMutableArray count](self->_requiredShippingContactFields, "count");
}

- (id)requiredShippingContactFieldsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_requiredShippingContactFields, "objectAtIndex:", a3);
}

+ (Class)requiredShippingContactFieldsType
{
  return (Class)objc_opt_class();
}

- (void)clearRequiredBillingContactFields
{
  -[NSMutableArray removeAllObjects](self->_requiredBillingContactFields, "removeAllObjects");
}

- (void)addRequiredBillingContactFields:(id)a3
{
  id v4;
  NSMutableArray *requiredBillingContactFields;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  requiredBillingContactFields = self->_requiredBillingContactFields;
  v8 = v4;
  if (!requiredBillingContactFields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_requiredBillingContactFields;
    self->_requiredBillingContactFields = v6;

    v4 = v8;
    requiredBillingContactFields = self->_requiredBillingContactFields;
  }
  -[NSMutableArray addObject:](requiredBillingContactFields, "addObject:", v4);

}

- (unint64_t)requiredBillingContactFieldsCount
{
  return -[NSMutableArray count](self->_requiredBillingContactFields, "count");
}

- (id)requiredBillingContactFieldsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_requiredBillingContactFields, "objectAtIndex:", a3);
}

+ (Class)requiredBillingContactFieldsType
{
  return (Class)objc_opt_class();
}

- (void)clearSupportedCountries
{
  -[NSMutableArray removeAllObjects](self->_supportedCountries, "removeAllObjects");
}

- (void)addSupportedCountries:(id)a3
{
  id v4;
  NSMutableArray *supportedCountries;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  supportedCountries = self->_supportedCountries;
  v8 = v4;
  if (!supportedCountries)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_supportedCountries;
    self->_supportedCountries = v6;

    v4 = v8;
    supportedCountries = self->_supportedCountries;
  }
  -[NSMutableArray addObject:](supportedCountries, "addObject:", v4);

}

- (unint64_t)supportedCountriesCount
{
  return -[NSMutableArray count](self->_supportedCountries, "count");
}

- (id)supportedCountriesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_supportedCountries, "objectAtIndex:", a3);
}

+ (Class)supportedCountriesType
{
  return (Class)objc_opt_class();
}

- (void)setApiType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_apiType = a3;
}

- (void)setHasApiType:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasApiType
{
  return *(_WORD *)&self->_has & 1;
}

- (void)clearContentItems
{
  -[NSMutableArray removeAllObjects](self->_contentItems, "removeAllObjects");
}

- (void)addContentItems:(id)a3
{
  id v4;
  NSMutableArray *contentItems;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  contentItems = self->_contentItems;
  v8 = v4;
  if (!contentItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_contentItems;
    self->_contentItems = v6;

    v4 = v8;
    contentItems = self->_contentItems;
  }
  -[NSMutableArray addObject:](contentItems, "addObject:", v4);

}

- (unint64_t)contentItemsCount
{
  return -[NSMutableArray count](self->_contentItems, "count");
}

- (id)contentItemsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_contentItems, "objectAtIndex:", a3);
}

+ (Class)contentItemsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLocalizedNavigationTitle
{
  return self->_localizedNavigationTitle != 0;
}

- (BOOL)hasLocalizedSummaryItemsTitle
{
  return self->_localizedSummaryItemsTitle != 0;
}

- (void)setSuppressTotal:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_suppressTotal = a3;
}

- (void)setHasSuppressTotal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSuppressTotal
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSummaryPinned:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_summaryPinned = a3;
}

- (void)setHasSummaryPinned:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSummaryPinned
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (int)requestor
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_requestor;
  else
    return 0;
}

- (void)setRequestor:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_requestor = a3;
}

- (void)setHasRequestor:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRequestor
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)requestorAsString:(int)a3
{
  if (a3 < 6)
    return off_1E2ADA268[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestor:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ITUNES")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_STORE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_MUSIC")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_NEWS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_BOOKS")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)confirmationStyle
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_confirmationStyle;
  else
    return 0;
}

- (void)setConfirmationStyle:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_confirmationStyle = a3;
}

- (void)setHasConfirmationStyle:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConfirmationStyle
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)confirmationStyleAsString:(int)a3
{
  if (a3 < 9)
    return off_1E2ADA298[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsConfirmationStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONFIRM")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GET")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INSTALL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RENT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REDEEM")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUBSCRIBE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SUBSCRIBE_AND_INSTALL")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)requestType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_requestType;
  else
    return 0;
}

- (void)setRequestType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_requestType = a3;
}

- (void)setHasRequestType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRequestType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)requestTypeAsString:(int)a3
{
  if (a3 < 0xB)
    return off_1E2ADA2E0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_PAY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARD_ON_FILE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCOUNT_SERVICE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AMP_ENROLLMENT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHYSICAL_CARD_ACTION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INSTALLMENT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCESSIBILITY_ENROLLMENT")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXTERNAL_CONTEXT_AUTHORIZATION")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SERVICE_PROVIDER")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PEER_PAYMENT")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DISBURSEMENT")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasAvailableShippingMethods
{
  return self->_availableShippingMethods != 0;
}

- (BOOL)hasRecurringPaymentRequest
{
  return self->_recurringPaymentRequest != 0;
}

- (void)clearMultiTokenContexts
{
  -[NSMutableArray removeAllObjects](self->_multiTokenContexts, "removeAllObjects");
}

- (void)addMultiTokenContexts:(id)a3
{
  id v4;
  NSMutableArray *multiTokenContexts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  multiTokenContexts = self->_multiTokenContexts;
  v8 = v4;
  if (!multiTokenContexts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_multiTokenContexts;
    self->_multiTokenContexts = v6;

    v4 = v8;
    multiTokenContexts = self->_multiTokenContexts;
  }
  -[NSMutableArray addObject:](multiTokenContexts, "addObject:", v4);

}

- (unint64_t)multiTokenContextsCount
{
  return -[NSMutableArray count](self->_multiTokenContexts, "count");
}

- (id)multiTokenContextsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_multiTokenContexts, "objectAtIndex:", a3);
}

+ (Class)multiTokenContextsType
{
  return (Class)objc_opt_class();
}

- (void)setRespectSupportedNetworksOrder:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_respectSupportedNetworksOrder = a3;
}

- (void)setHasRespectSupportedNetworksOrder:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasRespectSupportedNetworksOrder
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasAutomaticReloadPaymentRequest
{
  return self->_automaticReloadPaymentRequest != 0;
}

- (int)requestorDeviceType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_requestorDeviceType;
  else
    return 0;
}

- (void)setRequestorDeviceType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_requestorDeviceType = a3;
}

- (void)setHasRequestorDeviceType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRequestorDeviceType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)requestorDeviceTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("DEFAULT");
  if (a3 == 1)
  {
    v3 = CFSTR("TV");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsRequestorDeviceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TV"));

  return v4;
}

- (BOOL)hasDeferredPaymentRequest
{
  return self->_deferredPaymentRequest != 0;
}

- (BOOL)hasUserAgent
{
  return self->_userAgent != 0;
}

- (void)setMerchantCategoryCode:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_merchantCategoryCode = a3;
}

- (void)setHasMerchantCategoryCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMerchantCategoryCode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentRequest;
  -[PKProtobufPaymentRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *merchantIdentifier;
  NSString *countryCode;
  NSString *currencyCode;
  NSMutableArray *supportedNetworks;
  __int16 has;
  void *v10;
  NSData *billingContact;
  NSData *shippingContact;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  NSData *applicationData;
  NSString *originatingURL;
  PKProtobufPaymentMerchantSession *merchantSession;
  void *v30;
  NSMutableArray *thumbnailURLs;
  void *v32;
  NSMutableArray *requiredShippingContactFields;
  NSMutableArray *requiredBillingContactFields;
  NSMutableArray *supportedCountries;
  void *v36;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  NSString *localizedNavigationTitle;
  NSString *localizedSummaryItemsTitle;
  __int16 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t requestor;
  __CFString *v52;
  uint64_t confirmationStyle;
  __CFString *v54;
  uint64_t requestType;
  __CFString *v56;
  PKProtobufShippingMethods *availableShippingMethods;
  void *v58;
  PKProtobufRecurringPaymentRequest *recurringPaymentRequest;
  void *v60;
  void *v61;
  NSMutableArray *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  void *v67;
  void *v68;
  PKProtobufAutomaticReloadPaymentRequest *automaticReloadPaymentRequest;
  void *v70;
  int requestorDeviceType;
  __CFString *v72;
  PKProtobufDeferredPaymentRequest *deferredPaymentRequest;
  void *v74;
  NSString *userAgent;
  void *v76;
  id v77;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  merchantIdentifier = self->_merchantIdentifier;
  if (merchantIdentifier)
    objc_msgSend(v3, "setObject:forKey:", merchantIdentifier, CFSTR("merchantIdentifier"));
  countryCode = self->_countryCode;
  if (countryCode)
    objc_msgSend(v4, "setObject:forKey:", countryCode, CFSTR("countryCode"));
  currencyCode = self->_currencyCode;
  if (currencyCode)
    objc_msgSend(v4, "setObject:forKey:", currencyCode, CFSTR("currencyCode"));
  supportedNetworks = self->_supportedNetworks;
  if (supportedNetworks)
    objc_msgSend(v4, "setObject:forKey:", supportedNetworks, CFSTR("supportedNetworks"));
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_merchantCapabilities);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("merchantCapabilities"));

    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_11:
      if ((has & 0x100) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_requiredBillingAddressFields);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("requiredBillingAddressFields"));

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_requiredShippingAddressFields);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("requiredShippingAddressFields"));

  }
LABEL_13:
  billingContact = self->_billingContact;
  if (billingContact)
    objc_msgSend(v4, "setObject:forKey:", billingContact, CFSTR("billingContact"));
  shippingContact = self->_shippingContact;
  if (shippingContact)
    objc_msgSend(v4, "setObject:forKey:", shippingContact, CFSTR("shippingContact"));
  if (-[NSMutableArray count](self->_summaryItems, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_summaryItems, "count"));
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v14 = self->_summaryItems;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v92 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * i), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("summaryItems"));
  }
  if (-[NSMutableArray count](self->_shippingMethods, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_shippingMethods, "count"));
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v21 = self->_shippingMethods;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v88;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v88 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * j), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
      }
      while (v23);
    }

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("shippingMethods"));
  }
  applicationData = self->_applicationData;
  if (applicationData)
    objc_msgSend(v4, "setObject:forKey:", applicationData, CFSTR("applicationData"));
  originatingURL = self->_originatingURL;
  if (originatingURL)
    objc_msgSend(v4, "setObject:forKey:", originatingURL, CFSTR("originatingURL"));
  merchantSession = self->_merchantSession;
  if (merchantSession)
  {
    -[PKProtobufPaymentMerchantSession dictionaryRepresentation](merchantSession, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("merchantSession"));

  }
  thumbnailURLs = self->_thumbnailURLs;
  if (thumbnailURLs)
    objc_msgSend(v4, "setObject:forKey:", thumbnailURLs, CFSTR("thumbnailURLs"));
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_expectsMerchantSession);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("expectsMerchantSession"));

  }
  requiredShippingContactFields = self->_requiredShippingContactFields;
  if (requiredShippingContactFields)
    objc_msgSend(v4, "setObject:forKey:", requiredShippingContactFields, CFSTR("requiredShippingContactFields"));
  requiredBillingContactFields = self->_requiredBillingContactFields;
  if (requiredBillingContactFields)
    objc_msgSend(v4, "setObject:forKey:", requiredBillingContactFields, CFSTR("requiredBillingContactFields"));
  supportedCountries = self->_supportedCountries;
  if (supportedCountries)
    objc_msgSend(v4, "setObject:forKey:", supportedCountries, CFSTR("supportedCountries"));
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_apiType);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("apiType"));

  }
  if (-[NSMutableArray count](self->_contentItems, "count"))
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_contentItems, "count"));
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v38 = self->_contentItems;
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v84;
      do
      {
        for (k = 0; k != v40; ++k)
        {
          if (*(_QWORD *)v84 != v41)
            objc_enumerationMutation(v38);
          objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * k), "dictionaryRepresentation");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v43);

        }
        v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
      }
      while (v40);
    }

    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("contentItems"));
  }
  localizedNavigationTitle = self->_localizedNavigationTitle;
  if (localizedNavigationTitle)
    objc_msgSend(v4, "setObject:forKey:", localizedNavigationTitle, CFSTR("localizedNavigationTitle"));
  localizedSummaryItemsTitle = self->_localizedSummaryItemsTitle;
  if (localizedSummaryItemsTitle)
    objc_msgSend(v4, "setObject:forKey:", localizedSummaryItemsTitle, CFSTR("localizedSummaryItemsTitle"));
  v46 = (__int16)self->_has;
  if ((v46 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_suppressTotal);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("suppressTotal"));

    v46 = (__int16)self->_has;
    if ((v46 & 0x800) == 0)
    {
LABEL_68:
      if ((v46 & 0x20) == 0)
        goto LABEL_69;
      goto LABEL_77;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_68;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_summaryPinned);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("summaryPinned"));

  v46 = (__int16)self->_has;
  if ((v46 & 0x20) == 0)
  {
LABEL_69:
    if ((v46 & 2) == 0)
      goto LABEL_70;
    goto LABEL_81;
  }
LABEL_77:
  requestor = self->_requestor;
  if (requestor >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_requestor);
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = off_1E2ADA268[requestor];
  }
  objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("requestor"));

  v46 = (__int16)self->_has;
  if ((v46 & 2) == 0)
  {
LABEL_70:
    if ((v46 & 0x10) == 0)
      goto LABEL_89;
    goto LABEL_85;
  }
LABEL_81:
  confirmationStyle = self->_confirmationStyle;
  if (confirmationStyle >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_confirmationStyle);
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v54 = off_1E2ADA298[confirmationStyle];
  }
  objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("confirmationStyle"));

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_85:
    requestType = self->_requestType;
    if (requestType >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_requestType);
      v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v56 = off_1E2ADA2E0[requestType];
    }
    objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("requestType"));

  }
LABEL_89:
  availableShippingMethods = self->_availableShippingMethods;
  if (availableShippingMethods)
  {
    -[PKProtobufShippingMethods dictionaryRepresentation](availableShippingMethods, "dictionaryRepresentation");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("availableShippingMethods"));

  }
  recurringPaymentRequest = self->_recurringPaymentRequest;
  if (recurringPaymentRequest)
  {
    -[PKProtobufRecurringPaymentRequest dictionaryRepresentation](recurringPaymentRequest, "dictionaryRepresentation");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("recurringPaymentRequest"));

  }
  if (-[NSMutableArray count](self->_multiTokenContexts, "count"))
  {
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_multiTokenContexts, "count"));
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v62 = self->_multiTokenContexts;
    v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v80;
      do
      {
        for (m = 0; m != v64; ++m)
        {
          if (*(_QWORD *)v80 != v65)
            objc_enumerationMutation(v62);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * m), "dictionaryRepresentation");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "addObject:", v67);

        }
        v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
      }
      while (v64);
    }

    objc_msgSend(v4, "setObject:forKey:", v61, CFSTR("multiTokenContexts"));
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_respectSupportedNetworksOrder);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v68, CFSTR("respectSupportedNetworksOrder"));

  }
  automaticReloadPaymentRequest = self->_automaticReloadPaymentRequest;
  if (automaticReloadPaymentRequest)
  {
    -[PKProtobufAutomaticReloadPaymentRequest dictionaryRepresentation](automaticReloadPaymentRequest, "dictionaryRepresentation");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v70, CFSTR("automaticReloadPaymentRequest"));

  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    requestorDeviceType = self->_requestorDeviceType;
    if (requestorDeviceType)
    {
      if (requestorDeviceType == 1)
      {
        v72 = CFSTR("TV");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_requestorDeviceType);
        v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v72 = CFSTR("DEFAULT");
    }
    objc_msgSend(v4, "setObject:forKey:", v72, CFSTR("requestorDeviceType"));

  }
  deferredPaymentRequest = self->_deferredPaymentRequest;
  if (deferredPaymentRequest)
  {
    -[PKProtobufDeferredPaymentRequest dictionaryRepresentation](deferredPaymentRequest, "dictionaryRepresentation");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v74, CFSTR("deferredPaymentRequest"));

  }
  userAgent = self->_userAgent;
  if (userAgent)
    objc_msgSend(v4, "setObject:forKey:", userAgent, CFSTR("userAgent"));
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_merchantCategoryCode);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v76, CFSTR("merchantCategoryCode"));

  }
  v77 = v4;

  return v77;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t ii;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t jj;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t kk;
  __int16 v46;
  NSMutableArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t mm;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_merchantIdentifier)
    PBDataWriterWriteStringField();
  if (self->_countryCode)
    PBDataWriterWriteStringField();
  if (self->_currencyCode)
    PBDataWriterWriteStringField();
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v5 = self->_supportedNetworks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v85 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
    }
    while (v7);
  }

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_16:
      if ((has & 0x100) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_17:
    PBDataWriterWriteUint32Field();
LABEL_18:
  if (self->_billingContact)
    PBDataWriterWriteDataField();
  if (self->_shippingContact)
    PBDataWriterWriteDataField();
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v11 = self->_summaryItems;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v81;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v81 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
    }
    while (v13);
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v16 = self->_shippingMethods;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v77;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v77 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
    }
    while (v18);
  }

  if (self->_applicationData)
    PBDataWriterWriteDataField();
  if (self->_originatingURL)
    PBDataWriterWriteStringField();
  if (self->_merchantSession)
    PBDataWriterWriteSubmessage();
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v21 = self->_thumbnailURLs;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v73;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v73 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteStringField();
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
    }
    while (v23);
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
    PBDataWriterWriteBOOLField();
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v26 = self->_requiredShippingContactFields;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v69;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v69 != v29)
          objc_enumerationMutation(v26);
        PBDataWriterWriteStringField();
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
    }
    while (v28);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v31 = self->_requiredBillingContactFields;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v64, v91, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v65;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(_QWORD *)v65 != v34)
          objc_enumerationMutation(v31);
        PBDataWriterWriteStringField();
      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v64, v91, 16);
    }
    while (v33);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v36 = self->_supportedCountries;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v60, v90, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v61;
    do
    {
      for (jj = 0; jj != v38; ++jj)
      {
        if (*(_QWORD *)v61 != v39)
          objc_enumerationMutation(v36);
        PBDataWriterWriteStringField();
      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v60, v90, 16);
    }
    while (v38);
  }

  if ((*(_WORD *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v41 = self->_contentItems;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v56, v89, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v57;
    do
    {
      for (kk = 0; kk != v43; ++kk)
      {
        if (*(_QWORD *)v57 != v44)
          objc_enumerationMutation(v41);
        PBDataWriterWriteSubmessage();
      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v56, v89, 16);
    }
    while (v43);
  }

  if (self->_localizedNavigationTitle)
    PBDataWriterWriteStringField();
  if (self->_localizedSummaryItemsTitle)
    PBDataWriterWriteStringField();
  v46 = (__int16)self->_has;
  if ((v46 & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v46 = (__int16)self->_has;
    if ((v46 & 0x800) == 0)
    {
LABEL_87:
      if ((v46 & 0x20) == 0)
        goto LABEL_88;
      goto LABEL_120;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_87;
  }
  PBDataWriterWriteBOOLField();
  v46 = (__int16)self->_has;
  if ((v46 & 0x20) == 0)
  {
LABEL_88:
    if ((v46 & 2) == 0)
      goto LABEL_89;
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteInt32Field();
  v46 = (__int16)self->_has;
  if ((v46 & 2) == 0)
  {
LABEL_89:
    if ((v46 & 0x10) == 0)
      goto LABEL_91;
    goto LABEL_90;
  }
LABEL_121:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
LABEL_90:
    PBDataWriterWriteInt32Field();
LABEL_91:
  if (self->_availableShippingMethods)
    PBDataWriterWriteSubmessage();
  if (self->_recurringPaymentRequest)
    PBDataWriterWriteSubmessage();
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v47 = self->_multiTokenContexts;
  v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v52, v88, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v53;
    do
    {
      for (mm = 0; mm != v49; ++mm)
      {
        if (*(_QWORD *)v53 != v50)
          objc_enumerationMutation(v47);
        PBDataWriterWriteSubmessage();
      }
      v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v52, v88, 16);
    }
    while (v49);
  }

  if ((*(_WORD *)&self->_has & 0x400) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_automaticReloadPaymentRequest)
    PBDataWriterWriteSubmessage();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_deferredPaymentRequest)
    PBDataWriterWriteSubmessage();
  if (self->_userAgent)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 8) != 0)
    PBDataWriterWriteSint32Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  __int16 has;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t n;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t ii;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t jj;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t kk;
  void *v36;
  _BYTE *v37;
  __int16 v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t mm;
  void *v42;
  _DWORD *v43;
  id v44;

  v44 = a3;
  if (self->_merchantIdentifier)
    objc_msgSend(v44, "setMerchantIdentifier:");
  if (self->_countryCode)
    objc_msgSend(v44, "setCountryCode:");
  if (self->_currencyCode)
    objc_msgSend(v44, "setCurrencyCode:");
  if (-[PKProtobufPaymentRequest supportedNetworksCount](self, "supportedNetworksCount"))
  {
    objc_msgSend(v44, "clearSupportedNetworks");
    v4 = -[PKProtobufPaymentRequest supportedNetworksCount](self, "supportedNetworksCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[PKProtobufPaymentRequest supportedNetworksAtIndex:](self, "supportedNetworksAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addSupportedNetworks:", v7);

      }
    }
  }
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v44 + 26) = self->_merchantCapabilities;
    *((_WORD *)v44 + 126) |= 4u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_13:
      if ((has & 0x100) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v44 + 41) = self->_requiredBillingAddressFields;
  *((_WORD *)v44 + 126) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_14:
    *((_DWORD *)v44 + 44) = self->_requiredShippingAddressFields;
    *((_WORD *)v44 + 126) |= 0x100u;
  }
LABEL_15:
  if (self->_billingContact)
    objc_msgSend(v44, "setBillingContact:");
  if (self->_shippingContact)
    objc_msgSend(v44, "setShippingContact:");
  if (-[PKProtobufPaymentRequest summaryItemsCount](self, "summaryItemsCount"))
  {
    objc_msgSend(v44, "clearSummaryItems");
    v9 = -[PKProtobufPaymentRequest summaryItemsCount](self, "summaryItemsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[PKProtobufPaymentRequest summaryItemsAtIndex:](self, "summaryItemsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addSummaryItems:", v12);

      }
    }
  }
  if (-[PKProtobufPaymentRequest shippingMethodsCount](self, "shippingMethodsCount"))
  {
    objc_msgSend(v44, "clearShippingMethods");
    v13 = -[PKProtobufPaymentRequest shippingMethodsCount](self, "shippingMethodsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[PKProtobufPaymentRequest shippingMethodsAtIndex:](self, "shippingMethodsAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addShippingMethods:", v16);

      }
    }
  }
  if (self->_applicationData)
    objc_msgSend(v44, "setApplicationData:");
  if (self->_originatingURL)
    objc_msgSend(v44, "setOriginatingURL:");
  if (self->_merchantSession)
    objc_msgSend(v44, "setMerchantSession:");
  if (-[PKProtobufPaymentRequest thumbnailURLsCount](self, "thumbnailURLsCount"))
  {
    objc_msgSend(v44, "clearThumbnailURLs");
    v17 = -[PKProtobufPaymentRequest thumbnailURLsCount](self, "thumbnailURLsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[PKProtobufPaymentRequest thumbnailURLsAtIndex:](self, "thumbnailURLsAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addThumbnailURLs:", v20);

      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *((_BYTE *)v44 + 248) = self->_expectsMerchantSession;
    *((_WORD *)v44 + 126) |= 0x200u;
  }
  if (-[PKProtobufPaymentRequest requiredShippingContactFieldsCount](self, "requiredShippingContactFieldsCount"))
  {
    objc_msgSend(v44, "clearRequiredShippingContactFields");
    v21 = -[PKProtobufPaymentRequest requiredShippingContactFieldsCount](self, "requiredShippingContactFieldsCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        -[PKProtobufPaymentRequest requiredShippingContactFieldsAtIndex:](self, "requiredShippingContactFieldsAtIndex:", n);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addRequiredShippingContactFields:", v24);

      }
    }
  }
  if (-[PKProtobufPaymentRequest requiredBillingContactFieldsCount](self, "requiredBillingContactFieldsCount"))
  {
    objc_msgSend(v44, "clearRequiredBillingContactFields");
    v25 = -[PKProtobufPaymentRequest requiredBillingContactFieldsCount](self, "requiredBillingContactFieldsCount");
    if (v25)
    {
      v26 = v25;
      for (ii = 0; ii != v26; ++ii)
      {
        -[PKProtobufPaymentRequest requiredBillingContactFieldsAtIndex:](self, "requiredBillingContactFieldsAtIndex:", ii);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addRequiredBillingContactFields:", v28);

      }
    }
  }
  if (-[PKProtobufPaymentRequest supportedCountriesCount](self, "supportedCountriesCount"))
  {
    objc_msgSend(v44, "clearSupportedCountries");
    v29 = -[PKProtobufPaymentRequest supportedCountriesCount](self, "supportedCountriesCount");
    if (v29)
    {
      v30 = v29;
      for (jj = 0; jj != v30; ++jj)
      {
        -[PKProtobufPaymentRequest supportedCountriesAtIndex:](self, "supportedCountriesAtIndex:", jj);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addSupportedCountries:", v32);

      }
    }
  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v44 + 2) = self->_apiType;
    *((_WORD *)v44 + 126) |= 1u;
  }
  if (-[PKProtobufPaymentRequest contentItemsCount](self, "contentItemsCount"))
  {
    objc_msgSend(v44, "clearContentItems");
    v33 = -[PKProtobufPaymentRequest contentItemsCount](self, "contentItemsCount");
    if (v33)
    {
      v34 = v33;
      for (kk = 0; kk != v34; ++kk)
      {
        -[PKProtobufPaymentRequest contentItemsAtIndex:](self, "contentItemsAtIndex:", kk);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addContentItems:", v36);

      }
    }
  }
  if (self->_localizedNavigationTitle)
    objc_msgSend(v44, "setLocalizedNavigationTitle:");
  v37 = v44;
  if (self->_localizedSummaryItemsTitle)
  {
    objc_msgSend(v44, "setLocalizedSummaryItemsTitle:");
    v37 = v44;
  }
  v38 = (__int16)self->_has;
  if ((v38 & 0x1000) != 0)
  {
    v37[251] = self->_suppressTotal;
    *((_WORD *)v37 + 126) |= 0x1000u;
    v38 = (__int16)self->_has;
    if ((v38 & 0x800) == 0)
    {
LABEL_63:
      if ((v38 & 0x20) == 0)
        goto LABEL_64;
      goto LABEL_93;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_63;
  }
  v37[250] = self->_summaryPinned;
  *((_WORD *)v37 + 126) |= 0x800u;
  v38 = (__int16)self->_has;
  if ((v38 & 0x20) == 0)
  {
LABEL_64:
    if ((v38 & 2) == 0)
      goto LABEL_65;
    goto LABEL_94;
  }
LABEL_93:
  *((_DWORD *)v37 + 39) = self->_requestor;
  *((_WORD *)v37 + 126) |= 0x20u;
  v38 = (__int16)self->_has;
  if ((v38 & 2) == 0)
  {
LABEL_65:
    if ((v38 & 0x10) == 0)
      goto LABEL_67;
    goto LABEL_66;
  }
LABEL_94:
  *((_DWORD *)v37 + 12) = self->_confirmationStyle;
  *((_WORD *)v37 + 126) |= 2u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_66:
    *((_DWORD *)v37 + 38) = self->_requestType;
    *((_WORD *)v37 + 126) |= 0x10u;
  }
LABEL_67:
  if (self->_availableShippingMethods)
    objc_msgSend(v44, "setAvailableShippingMethods:");
  if (self->_recurringPaymentRequest)
    objc_msgSend(v44, "setRecurringPaymentRequest:");
  if (-[PKProtobufPaymentRequest multiTokenContextsCount](self, "multiTokenContextsCount"))
  {
    objc_msgSend(v44, "clearMultiTokenContexts");
    v39 = -[PKProtobufPaymentRequest multiTokenContextsCount](self, "multiTokenContextsCount");
    if (v39)
    {
      v40 = v39;
      for (mm = 0; mm != v40; ++mm)
      {
        -[PKProtobufPaymentRequest multiTokenContextsAtIndex:](self, "multiTokenContextsAtIndex:", mm);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addMultiTokenContexts:", v42);

      }
    }
  }
  v43 = v44;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_BYTE *)v44 + 249) = self->_respectSupportedNetworksOrder;
    *((_WORD *)v44 + 126) |= 0x400u;
  }
  if (self->_automaticReloadPaymentRequest)
  {
    objc_msgSend(v44, "setAutomaticReloadPaymentRequest:");
    v43 = v44;
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    v43[40] = self->_requestorDeviceType;
    *((_WORD *)v43 + 126) |= 0x40u;
  }
  if (self->_deferredPaymentRequest)
  {
    objc_msgSend(v44, "setDeferredPaymentRequest:");
    v43 = v44;
  }
  if (self->_userAgent)
  {
    objc_msgSend(v44, "setUserAgent:");
    v43 = v44;
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v43[27] = self->_merchantCategoryCode;
    *((_WORD *)v43 + 126) |= 8u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int16 has;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  void *v46;
  NSMutableArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t n;
  void *v52;
  NSMutableArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t ii;
  void *v58;
  NSMutableArray *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t jj;
  void *v64;
  NSMutableArray *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t kk;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  __int16 v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  NSMutableArray *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t mm;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  uint64_t v90;
  void *v91;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_merchantIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v6;

  v8 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v8;

  v10 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v10;

  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v12 = self->_supportedNetworks;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v125, v137, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v126;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v126 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSupportedNetworks:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v125, v137, 16);
    }
    while (v14);
  }

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_merchantCapabilities;
    *(_WORD *)(v5 + 252) |= 4u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_10:
      if ((has & 0x100) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 164) = self->_requiredBillingAddressFields;
  *(_WORD *)(v5 + 252) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 176) = self->_requiredShippingAddressFields;
    *(_WORD *)(v5 + 252) |= 0x100u;
  }
LABEL_12:
  v19 = -[NSData copyWithZone:](self->_billingContact, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v19;

  v21 = -[NSData copyWithZone:](self->_shippingContact, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v21;

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v23 = self->_summaryItems;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v121, v136, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v122;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v122 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSummaryItems:", v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v121, v136, 16);
    }
    while (v25);
  }

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v29 = self->_shippingMethods;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v117, v135, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v118;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v118 != v32)
          objc_enumerationMutation(v29);
        v34 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addShippingMethods:", v34);

      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v117, v135, 16);
    }
    while (v31);
  }

  v35 = -[NSData copyWithZone:](self->_applicationData, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v35;

  v37 = -[NSString copyWithZone:](self->_originatingURL, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v37;

  v39 = -[PKProtobufPaymentMerchantSession copyWithZone:](self->_merchantSession, "copyWithZone:", a3);
  v40 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v39;

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v41 = self->_thumbnailURLs;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v113, v134, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v114;
    do
    {
      for (m = 0; m != v43; ++m)
      {
        if (*(_QWORD *)v114 != v44)
          objc_enumerationMutation(v41);
        v46 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addThumbnailURLs:", v46);

      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v113, v134, 16);
    }
    while (v43);
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *(_BYTE *)(v5 + 248) = self->_expectsMerchantSession;
    *(_WORD *)(v5 + 252) |= 0x200u;
  }
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v47 = self->_requiredShippingContactFields;
  v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v109, v133, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v110;
    do
    {
      for (n = 0; n != v49; ++n)
      {
        if (*(_QWORD *)v110 != v50)
          objc_enumerationMutation(v47);
        v52 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRequiredShippingContactFields:", v52);

      }
      v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v109, v133, 16);
    }
    while (v49);
  }

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v53 = self->_requiredBillingContactFields;
  v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v105, v132, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v106;
    do
    {
      for (ii = 0; ii != v55; ++ii)
      {
        if (*(_QWORD *)v106 != v56)
          objc_enumerationMutation(v53);
        v58 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRequiredBillingContactFields:", v58);

      }
      v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v105, v132, 16);
    }
    while (v55);
  }

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v59 = self->_supportedCountries;
  v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v101, v131, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v102;
    do
    {
      for (jj = 0; jj != v61; ++jj)
      {
        if (*(_QWORD *)v102 != v62)
          objc_enumerationMutation(v59);
        v64 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSupportedCountries:", v64);

      }
      v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v101, v131, 16);
    }
    while (v61);
  }

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_apiType;
    *(_WORD *)(v5 + 252) |= 1u;
  }
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v65 = self->_contentItems;
  v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v97, v130, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v98;
    do
    {
      for (kk = 0; kk != v67; ++kk)
      {
        if (*(_QWORD *)v98 != v68)
          objc_enumerationMutation(v65);
        v70 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * kk), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addContentItems:", v70);

      }
      v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v97, v130, 16);
    }
    while (v67);
  }

  v71 = -[NSString copyWithZone:](self->_localizedNavigationTitle, "copyWithZone:", a3);
  v72 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v71;

  v73 = -[NSString copyWithZone:](self->_localizedSummaryItemsTitle, "copyWithZone:", a3);
  v74 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v73;

  v75 = (__int16)self->_has;
  if ((v75 & 0x1000) != 0)
  {
    *(_BYTE *)(v5 + 251) = self->_suppressTotal;
    *(_WORD *)(v5 + 252) |= 0x1000u;
    v75 = (__int16)self->_has;
    if ((v75 & 0x800) == 0)
    {
LABEL_67:
      if ((v75 & 0x20) == 0)
        goto LABEL_68;
      goto LABEL_90;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_67;
  }
  *(_BYTE *)(v5 + 250) = self->_summaryPinned;
  *(_WORD *)(v5 + 252) |= 0x800u;
  v75 = (__int16)self->_has;
  if ((v75 & 0x20) == 0)
  {
LABEL_68:
    if ((v75 & 2) == 0)
      goto LABEL_69;
    goto LABEL_91;
  }
LABEL_90:
  *(_DWORD *)(v5 + 156) = self->_requestor;
  *(_WORD *)(v5 + 252) |= 0x20u;
  v75 = (__int16)self->_has;
  if ((v75 & 2) == 0)
  {
LABEL_69:
    if ((v75 & 0x10) == 0)
      goto LABEL_71;
    goto LABEL_70;
  }
LABEL_91:
  *(_DWORD *)(v5 + 48) = self->_confirmationStyle;
  *(_WORD *)(v5 + 252) |= 2u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_70:
    *(_DWORD *)(v5 + 152) = self->_requestType;
    *(_WORD *)(v5 + 252) |= 0x10u;
  }
LABEL_71:
  v76 = -[PKProtobufShippingMethods copyWithZone:](self->_availableShippingMethods, "copyWithZone:", a3);
  v77 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v76;

  v78 = -[PKProtobufRecurringPaymentRequest copyWithZone:](self->_recurringPaymentRequest, "copyWithZone:", a3);
  v79 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v78;

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v80 = self->_multiTokenContexts;
  v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v93, v129, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v94;
    do
    {
      for (mm = 0; mm != v82; ++mm)
      {
        if (*(_QWORD *)v94 != v83)
          objc_enumerationMutation(v80);
        v85 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * mm), "copyWithZone:", a3, (_QWORD)v93);
        objc_msgSend((id)v5, "addMultiTokenContexts:", v85);

      }
      v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v93, v129, 16);
    }
    while (v82);
  }

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 249) = self->_respectSupportedNetworksOrder;
    *(_WORD *)(v5 + 252) |= 0x400u;
  }
  v86 = -[PKProtobufAutomaticReloadPaymentRequest copyWithZone:](self->_automaticReloadPaymentRequest, "copyWithZone:", a3, (_QWORD)v93);
  v87 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v86;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 160) = self->_requestorDeviceType;
    *(_WORD *)(v5 + 252) |= 0x40u;
  }
  v88 = -[PKProtobufDeferredPaymentRequest copyWithZone:](self->_deferredPaymentRequest, "copyWithZone:", a3);
  v89 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v88;

  v90 = -[NSString copyWithZone:](self->_userAgent, "copyWithZone:", a3);
  v91 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v90;

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_merchantCategoryCode;
    *(_WORD *)(v5 + 252) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *merchantIdentifier;
  NSString *countryCode;
  NSString *currencyCode;
  NSMutableArray *supportedNetworks;
  __int16 has;
  __int16 v10;
  NSData *billingContact;
  NSData *shippingContact;
  NSMutableArray *summaryItems;
  NSMutableArray *shippingMethods;
  NSData *applicationData;
  NSString *originatingURL;
  PKProtobufPaymentMerchantSession *merchantSession;
  NSMutableArray *thumbnailURLs;
  NSMutableArray *requiredShippingContactFields;
  NSMutableArray *requiredBillingContactFields;
  NSMutableArray *supportedCountries;
  __int16 v22;
  NSMutableArray *contentItems;
  NSString *localizedNavigationTitle;
  NSString *localizedSummaryItemsTitle;
  __int16 v26;
  __int16 v27;
  PKProtobufShippingMethods *availableShippingMethods;
  PKProtobufRecurringPaymentRequest *recurringPaymentRequest;
  NSMutableArray *multiTokenContexts;
  __int16 v31;
  __int16 v32;
  PKProtobufAutomaticReloadPaymentRequest *automaticReloadPaymentRequest;
  PKProtobufDeferredPaymentRequest *deferredPaymentRequest;
  NSString *userAgent;
  __int16 v36;
  BOOL v37;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_128;
  merchantIdentifier = self->_merchantIdentifier;
  if ((unint64_t)merchantIdentifier | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](merchantIdentifier, "isEqual:"))
      goto LABEL_128;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:"))
      goto LABEL_128;
  }
  currencyCode = self->_currencyCode;
  if ((unint64_t)currencyCode | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](currencyCode, "isEqual:"))
      goto LABEL_128;
  }
  supportedNetworks = self->_supportedNetworks;
  if ((unint64_t)supportedNetworks | *((_QWORD *)v4 + 28))
  {
    if (!-[NSMutableArray isEqual:](supportedNetworks, "isEqual:"))
      goto LABEL_128;
  }
  has = (__int16)self->_has;
  v10 = *((_WORD *)v4 + 126);
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_merchantCapabilities != *((_DWORD *)v4 + 26))
      goto LABEL_128;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_128;
  }
  if ((has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_requiredBillingAddressFields != *((_DWORD *)v4 + 41))
      goto LABEL_128;
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x100) == 0 || self->_requiredShippingAddressFields != *((_DWORD *)v4 + 44))
      goto LABEL_128;
  }
  else if ((*((_WORD *)v4 + 126) & 0x100) != 0)
  {
    goto LABEL_128;
  }
  billingContact = self->_billingContact;
  if ((unint64_t)billingContact | *((_QWORD *)v4 + 5)
    && !-[NSData isEqual:](billingContact, "isEqual:"))
  {
    goto LABEL_128;
  }
  shippingContact = self->_shippingContact;
  if ((unint64_t)shippingContact | *((_QWORD *)v4 + 24))
  {
    if (!-[NSData isEqual:](shippingContact, "isEqual:"))
      goto LABEL_128;
  }
  summaryItems = self->_summaryItems;
  if ((unint64_t)summaryItems | *((_QWORD *)v4 + 26))
  {
    if (!-[NSMutableArray isEqual:](summaryItems, "isEqual:"))
      goto LABEL_128;
  }
  shippingMethods = self->_shippingMethods;
  if ((unint64_t)shippingMethods | *((_QWORD *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](shippingMethods, "isEqual:"))
      goto LABEL_128;
  }
  applicationData = self->_applicationData;
  if ((unint64_t)applicationData | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](applicationData, "isEqual:"))
      goto LABEL_128;
  }
  originatingURL = self->_originatingURL;
  if ((unint64_t)originatingURL | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](originatingURL, "isEqual:"))
      goto LABEL_128;
  }
  merchantSession = self->_merchantSession;
  if ((unint64_t)merchantSession | *((_QWORD *)v4 + 15))
  {
    if (!-[PKProtobufPaymentMerchantSession isEqual:](merchantSession, "isEqual:"))
      goto LABEL_128;
  }
  thumbnailURLs = self->_thumbnailURLs;
  if ((unint64_t)thumbnailURLs | *((_QWORD *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](thumbnailURLs, "isEqual:"))
      goto LABEL_128;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x200) == 0)
      goto LABEL_128;
    if (self->_expectsMerchantSession)
    {
      if (!*((_BYTE *)v4 + 248))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 248))
    {
      goto LABEL_128;
    }
  }
  else if ((*((_WORD *)v4 + 126) & 0x200) != 0)
  {
    goto LABEL_128;
  }
  requiredShippingContactFields = self->_requiredShippingContactFields;
  if ((unint64_t)requiredShippingContactFields | *((_QWORD *)v4 + 23)
    && !-[NSMutableArray isEqual:](requiredShippingContactFields, "isEqual:"))
  {
    goto LABEL_128;
  }
  requiredBillingContactFields = self->_requiredBillingContactFields;
  if ((unint64_t)requiredBillingContactFields | *((_QWORD *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](requiredBillingContactFields, "isEqual:"))
      goto LABEL_128;
  }
  supportedCountries = self->_supportedCountries;
  if ((unint64_t)supportedCountries | *((_QWORD *)v4 + 27))
  {
    if (!-[NSMutableArray isEqual:](supportedCountries, "isEqual:"))
      goto LABEL_128;
  }
  v22 = *((_WORD *)v4 + 126);
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    if ((v22 & 1) == 0 || self->_apiType != *((_DWORD *)v4 + 2))
      goto LABEL_128;
  }
  else if ((v22 & 1) != 0)
  {
    goto LABEL_128;
  }
  contentItems = self->_contentItems;
  if ((unint64_t)contentItems | *((_QWORD *)v4 + 7)
    && !-[NSMutableArray isEqual:](contentItems, "isEqual:"))
  {
    goto LABEL_128;
  }
  localizedNavigationTitle = self->_localizedNavigationTitle;
  if ((unint64_t)localizedNavigationTitle | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](localizedNavigationTitle, "isEqual:"))
      goto LABEL_128;
  }
  localizedSummaryItemsTitle = self->_localizedSummaryItemsTitle;
  if ((unint64_t)localizedSummaryItemsTitle | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](localizedSummaryItemsTitle, "isEqual:"))
      goto LABEL_128;
  }
  v26 = (__int16)self->_has;
  v27 = *((_WORD *)v4 + 126);
  if ((v26 & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x1000) == 0)
      goto LABEL_128;
    if (self->_suppressTotal)
    {
      if (!*((_BYTE *)v4 + 251))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 251))
    {
      goto LABEL_128;
    }
  }
  else if ((*((_WORD *)v4 + 126) & 0x1000) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x800) == 0)
      goto LABEL_128;
    if (self->_summaryPinned)
    {
      if (!*((_BYTE *)v4 + 250))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 250))
    {
      goto LABEL_128;
    }
  }
  else if ((*((_WORD *)v4 + 126) & 0x800) != 0)
  {
    goto LABEL_128;
  }
  if ((v26 & 0x20) != 0)
  {
    if ((v27 & 0x20) == 0 || self->_requestor != *((_DWORD *)v4 + 39))
      goto LABEL_128;
  }
  else if ((v27 & 0x20) != 0)
  {
    goto LABEL_128;
  }
  if ((v26 & 2) != 0)
  {
    if ((v27 & 2) == 0 || self->_confirmationStyle != *((_DWORD *)v4 + 12))
      goto LABEL_128;
  }
  else if ((v27 & 2) != 0)
  {
    goto LABEL_128;
  }
  if ((v26 & 0x10) != 0)
  {
    if ((v27 & 0x10) == 0 || self->_requestType != *((_DWORD *)v4 + 38))
      goto LABEL_128;
  }
  else if ((v27 & 0x10) != 0)
  {
    goto LABEL_128;
  }
  availableShippingMethods = self->_availableShippingMethods;
  if ((unint64_t)availableShippingMethods | *((_QWORD *)v4 + 4)
    && !-[PKProtobufShippingMethods isEqual:](availableShippingMethods, "isEqual:"))
  {
    goto LABEL_128;
  }
  recurringPaymentRequest = self->_recurringPaymentRequest;
  if ((unint64_t)recurringPaymentRequest | *((_QWORD *)v4 + 18))
  {
    if (!-[PKProtobufRecurringPaymentRequest isEqual:](recurringPaymentRequest, "isEqual:"))
      goto LABEL_128;
  }
  multiTokenContexts = self->_multiTokenContexts;
  if ((unint64_t)multiTokenContexts | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](multiTokenContexts, "isEqual:"))
      goto LABEL_128;
  }
  v31 = (__int16)self->_has;
  v32 = *((_WORD *)v4 + 126);
  if ((v31 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x400) == 0)
      goto LABEL_128;
    if (self->_respectSupportedNetworksOrder)
    {
      if (!*((_BYTE *)v4 + 249))
        goto LABEL_128;
    }
    else if (*((_BYTE *)v4 + 249))
    {
      goto LABEL_128;
    }
  }
  else if ((*((_WORD *)v4 + 126) & 0x400) != 0)
  {
    goto LABEL_128;
  }
  automaticReloadPaymentRequest = self->_automaticReloadPaymentRequest;
  if (!((unint64_t)automaticReloadPaymentRequest | *((_QWORD *)v4 + 3)))
    goto LABEL_114;
  if (!-[PKProtobufAutomaticReloadPaymentRequest isEqual:](automaticReloadPaymentRequest, "isEqual:"))
  {
LABEL_128:
    v37 = 0;
    goto LABEL_129;
  }
  v31 = (__int16)self->_has;
  v32 = *((_WORD *)v4 + 126);
LABEL_114:
  if ((v31 & 0x40) != 0)
  {
    if ((v32 & 0x40) == 0 || self->_requestorDeviceType != *((_DWORD *)v4 + 40))
      goto LABEL_128;
  }
  else if ((v32 & 0x40) != 0)
  {
    goto LABEL_128;
  }
  deferredPaymentRequest = self->_deferredPaymentRequest;
  if ((unint64_t)deferredPaymentRequest | *((_QWORD *)v4 + 10)
    && !-[PKProtobufDeferredPaymentRequest isEqual:](deferredPaymentRequest, "isEqual:"))
  {
    goto LABEL_128;
  }
  userAgent = self->_userAgent;
  if ((unint64_t)userAgent | *((_QWORD *)v4 + 30))
  {
    if (!-[NSString isEqual:](userAgent, "isEqual:"))
      goto LABEL_128;
  }
  v36 = *((_WORD *)v4 + 126);
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    if ((v36 & 8) == 0 || self->_merchantCategoryCode != *((_DWORD *)v4 + 27))
      goto LABEL_128;
    v37 = 1;
  }
  else
  {
    v37 = (v36 & 8) == 0;
  }
LABEL_129:

  return v37;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  NSUInteger v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSUInteger v40;
  NSUInteger v41;
  NSUInteger v42;

  v42 = -[NSString hash](self->_merchantIdentifier, "hash");
  v41 = -[NSString hash](self->_countryCode, "hash");
  v40 = -[NSString hash](self->_currencyCode, "hash");
  v39 = -[NSMutableArray hash](self->_supportedNetworks, "hash");
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
    v38 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_3;
LABEL_6:
    v37 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v38 = 2654435761 * self->_merchantCapabilities;
  if ((has & 0x80) == 0)
    goto LABEL_6;
LABEL_3:
  v37 = 2654435761 * self->_requiredBillingAddressFields;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    v36 = 2654435761 * self->_requiredShippingAddressFields;
    goto LABEL_8;
  }
LABEL_7:
  v36 = 0;
LABEL_8:
  v35 = -[NSData hash](self->_billingContact, "hash");
  v34 = -[NSData hash](self->_shippingContact, "hash");
  v33 = -[NSMutableArray hash](self->_summaryItems, "hash");
  v32 = -[NSMutableArray hash](self->_shippingMethods, "hash");
  v31 = -[NSData hash](self->_applicationData, "hash");
  v30 = -[NSString hash](self->_originatingURL, "hash");
  v29 = -[PKProtobufPaymentMerchantSession hash](self->_merchantSession, "hash");
  v28 = -[NSMutableArray hash](self->_thumbnailURLs, "hash");
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    v27 = 2654435761 * self->_expectsMerchantSession;
  else
    v27 = 0;
  v26 = -[NSMutableArray hash](self->_requiredShippingContactFields, "hash");
  v25 = -[NSMutableArray hash](self->_requiredBillingContactFields, "hash");
  v24 = -[NSMutableArray hash](self->_supportedCountries, "hash");
  if ((*(_WORD *)&self->_has & 1) != 0)
    v23 = 2654435761 * self->_apiType;
  else
    v23 = 0;
  v22 = -[NSMutableArray hash](self->_contentItems, "hash");
  v21 = -[NSString hash](self->_localizedNavigationTitle, "hash");
  v20 = -[NSString hash](self->_localizedSummaryItemsTitle, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 0x1000) != 0)
  {
    v19 = 2654435761 * self->_suppressTotal;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_16:
      v18 = 2654435761 * self->_summaryPinned;
      if ((v4 & 0x20) != 0)
        goto LABEL_17;
      goto LABEL_22;
    }
  }
  else
  {
    v19 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_16;
  }
  v18 = 0;
  if ((v4 & 0x20) != 0)
  {
LABEL_17:
    v17 = 2654435761 * self->_requestor;
    if ((v4 & 2) != 0)
      goto LABEL_18;
LABEL_23:
    v16 = 0;
    if ((v4 & 0x10) != 0)
      goto LABEL_19;
    goto LABEL_24;
  }
LABEL_22:
  v17 = 0;
  if ((v4 & 2) == 0)
    goto LABEL_23;
LABEL_18:
  v16 = 2654435761 * self->_confirmationStyle;
  if ((v4 & 0x10) != 0)
  {
LABEL_19:
    v15 = 2654435761 * self->_requestType;
    goto LABEL_25;
  }
LABEL_24:
  v15 = 0;
LABEL_25:
  v14 = -[PKProtobufShippingMethods hash](self->_availableShippingMethods, "hash");
  v5 = -[PKProtobufRecurringPaymentRequest hash](self->_recurringPaymentRequest, "hash");
  v6 = -[NSMutableArray hash](self->_multiTokenContexts, "hash");
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    v7 = 2654435761 * self->_respectSupportedNetworksOrder;
  else
    v7 = 0;
  v8 = -[PKProtobufAutomaticReloadPaymentRequest hash](self->_automaticReloadPaymentRequest, "hash");
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    v9 = 2654435761 * self->_requestorDeviceType;
  else
    v9 = 0;
  v10 = -[PKProtobufDeferredPaymentRequest hash](self->_deferredPaymentRequest, "hash");
  v11 = -[NSString hash](self->_userAgent, "hash");
  if ((*(_WORD *)&self->_has & 8) != 0)
    v12 = 2654435761 * self->_merchantCategoryCode;
  else
    v12 = 0;
  return v41 ^ v42 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  PKProtobufPaymentMerchantSession *merchantSession;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t n;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t ii;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t jj;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t kk;
  __int16 v48;
  PKProtobufShippingMethods *availableShippingMethods;
  uint64_t v50;
  PKProtobufRecurringPaymentRequest *recurringPaymentRequest;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t mm;
  PKProtobufAutomaticReloadPaymentRequest *automaticReloadPaymentRequest;
  uint64_t v59;
  PKProtobufDeferredPaymentRequest *deferredPaymentRequest;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 14))
    -[PKProtobufPaymentRequest setMerchantIdentifier:](self, "setMerchantIdentifier:");
  if (*((_QWORD *)v4 + 8))
    -[PKProtobufPaymentRequest setCountryCode:](self, "setCountryCode:");
  if (*((_QWORD *)v4 + 9))
    -[PKProtobufPaymentRequest setCurrencyCode:](self, "setCurrencyCode:");
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v5 = *((id *)v4 + 28);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v95 != v8)
          objc_enumerationMutation(v5);
        -[PKProtobufPaymentRequest addSupportedNetworks:](self, "addSupportedNetworks:", *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
    }
    while (v7);
  }

  v10 = *((_WORD *)v4 + 126);
  if ((v10 & 4) != 0)
  {
    self->_merchantCapabilities = *((_DWORD *)v4 + 26);
    *(_WORD *)&self->_has |= 4u;
    v10 = *((_WORD *)v4 + 126);
    if ((v10 & 0x80) == 0)
    {
LABEL_16:
      if ((v10 & 0x100) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v10 & 0x80) == 0)
  {
    goto LABEL_16;
  }
  self->_requiredBillingAddressFields = *((_DWORD *)v4 + 41);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 126) & 0x100) != 0)
  {
LABEL_17:
    self->_requiredShippingAddressFields = *((_DWORD *)v4 + 44);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_18:
  if (*((_QWORD *)v4 + 5))
    -[PKProtobufPaymentRequest setBillingContact:](self, "setBillingContact:");
  if (*((_QWORD *)v4 + 24))
    -[PKProtobufPaymentRequest setShippingContact:](self, "setShippingContact:");
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v11 = *((id *)v4 + 26);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v91;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v91 != v14)
          objc_enumerationMutation(v11);
        -[PKProtobufPaymentRequest addSummaryItems:](self, "addSummaryItems:", *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
    }
    while (v13);
  }

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v16 = *((id *)v4 + 25);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v87;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v87 != v19)
          objc_enumerationMutation(v16);
        -[PKProtobufPaymentRequest addShippingMethods:](self, "addShippingMethods:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
    }
    while (v18);
  }

  if (*((_QWORD *)v4 + 2))
    -[PKProtobufPaymentRequest setApplicationData:](self, "setApplicationData:");
  if (*((_QWORD *)v4 + 17))
    -[PKProtobufPaymentRequest setOriginatingURL:](self, "setOriginatingURL:");
  merchantSession = self->_merchantSession;
  v22 = *((_QWORD *)v4 + 15);
  if (merchantSession)
  {
    if (v22)
      -[PKProtobufPaymentMerchantSession mergeFrom:](merchantSession, "mergeFrom:");
  }
  else if (v22)
  {
    -[PKProtobufPaymentRequest setMerchantSession:](self, "setMerchantSession:");
  }
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v23 = *((id *)v4 + 29);
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v82, v103, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v83;
    do
    {
      for (m = 0; m != v25; ++m)
      {
        if (*(_QWORD *)v83 != v26)
          objc_enumerationMutation(v23);
        -[PKProtobufPaymentRequest addThumbnailURLs:](self, "addThumbnailURLs:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * m));
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v82, v103, 16);
    }
    while (v25);
  }

  if ((*((_WORD *)v4 + 126) & 0x200) != 0)
  {
    self->_expectsMerchantSession = *((_BYTE *)v4 + 248);
    *(_WORD *)&self->_has |= 0x200u;
  }
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v28 = *((id *)v4 + 23);
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v78, v102, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v79;
    do
    {
      for (n = 0; n != v30; ++n)
      {
        if (*(_QWORD *)v79 != v31)
          objc_enumerationMutation(v28);
        -[PKProtobufPaymentRequest addRequiredShippingContactFields:](self, "addRequiredShippingContactFields:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * n));
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v78, v102, 16);
    }
    while (v30);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v33 = *((id *)v4 + 21);
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v74, v101, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v75;
    do
    {
      for (ii = 0; ii != v35; ++ii)
      {
        if (*(_QWORD *)v75 != v36)
          objc_enumerationMutation(v33);
        -[PKProtobufPaymentRequest addRequiredBillingContactFields:](self, "addRequiredBillingContactFields:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * ii));
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v74, v101, 16);
    }
    while (v35);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v38 = *((id *)v4 + 27);
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v100, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v71;
    do
    {
      for (jj = 0; jj != v40; ++jj)
      {
        if (*(_QWORD *)v71 != v41)
          objc_enumerationMutation(v38);
        -[PKProtobufPaymentRequest addSupportedCountries:](self, "addSupportedCountries:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * jj));
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v100, 16);
    }
    while (v40);
  }

  if ((*((_WORD *)v4 + 126) & 1) != 0)
  {
    self->_apiType = *((_DWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 1u;
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v43 = *((id *)v4 + 7);
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v99, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v67;
    do
    {
      for (kk = 0; kk != v45; ++kk)
      {
        if (*(_QWORD *)v67 != v46)
          objc_enumerationMutation(v43);
        -[PKProtobufPaymentRequest addContentItems:](self, "addContentItems:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * kk));
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v99, 16);
    }
    while (v45);
  }

  if (*((_QWORD *)v4 + 11))
    -[PKProtobufPaymentRequest setLocalizedNavigationTitle:](self, "setLocalizedNavigationTitle:");
  if (*((_QWORD *)v4 + 12))
    -[PKProtobufPaymentRequest setLocalizedSummaryItemsTitle:](self, "setLocalizedSummaryItemsTitle:");
  v48 = *((_WORD *)v4 + 126);
  if ((v48 & 0x1000) != 0)
  {
    self->_suppressTotal = *((_BYTE *)v4 + 251);
    *(_WORD *)&self->_has |= 0x1000u;
    v48 = *((_WORD *)v4 + 126);
    if ((v48 & 0x800) == 0)
    {
LABEL_93:
      if ((v48 & 0x20) == 0)
        goto LABEL_94;
      goto LABEL_102;
    }
  }
  else if ((*((_WORD *)v4 + 126) & 0x800) == 0)
  {
    goto LABEL_93;
  }
  self->_summaryPinned = *((_BYTE *)v4 + 250);
  *(_WORD *)&self->_has |= 0x800u;
  v48 = *((_WORD *)v4 + 126);
  if ((v48 & 0x20) == 0)
  {
LABEL_94:
    if ((v48 & 2) == 0)
      goto LABEL_95;
    goto LABEL_103;
  }
LABEL_102:
  self->_requestor = *((_DWORD *)v4 + 39);
  *(_WORD *)&self->_has |= 0x20u;
  v48 = *((_WORD *)v4 + 126);
  if ((v48 & 2) == 0)
  {
LABEL_95:
    if ((v48 & 0x10) == 0)
      goto LABEL_97;
    goto LABEL_96;
  }
LABEL_103:
  self->_confirmationStyle = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 126) & 0x10) != 0)
  {
LABEL_96:
    self->_requestType = *((_DWORD *)v4 + 38);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_97:
  availableShippingMethods = self->_availableShippingMethods;
  v50 = *((_QWORD *)v4 + 4);
  if (availableShippingMethods)
  {
    if (v50)
      -[PKProtobufShippingMethods mergeFrom:](availableShippingMethods, "mergeFrom:");
  }
  else if (v50)
  {
    -[PKProtobufPaymentRequest setAvailableShippingMethods:](self, "setAvailableShippingMethods:");
  }
  recurringPaymentRequest = self->_recurringPaymentRequest;
  v52 = *((_QWORD *)v4 + 18);
  if (recurringPaymentRequest)
  {
    if (v52)
      -[PKProtobufRecurringPaymentRequest mergeFrom:](recurringPaymentRequest, "mergeFrom:");
  }
  else if (v52)
  {
    -[PKProtobufPaymentRequest setRecurringPaymentRequest:](self, "setRecurringPaymentRequest:");
  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v53 = *((id *)v4 + 16);
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v62, v98, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v63;
    do
    {
      for (mm = 0; mm != v55; ++mm)
      {
        if (*(_QWORD *)v63 != v56)
          objc_enumerationMutation(v53);
        -[PKProtobufPaymentRequest addMultiTokenContexts:](self, "addMultiTokenContexts:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * mm), (_QWORD)v62);
      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v62, v98, 16);
    }
    while (v55);
  }

  if ((*((_WORD *)v4 + 126) & 0x400) != 0)
  {
    self->_respectSupportedNetworksOrder = *((_BYTE *)v4 + 249);
    *(_WORD *)&self->_has |= 0x400u;
  }
  automaticReloadPaymentRequest = self->_automaticReloadPaymentRequest;
  v59 = *((_QWORD *)v4 + 3);
  if (automaticReloadPaymentRequest)
  {
    if (v59)
      -[PKProtobufAutomaticReloadPaymentRequest mergeFrom:](automaticReloadPaymentRequest, "mergeFrom:");
  }
  else if (v59)
  {
    -[PKProtobufPaymentRequest setAutomaticReloadPaymentRequest:](self, "setAutomaticReloadPaymentRequest:");
  }
  if ((*((_WORD *)v4 + 126) & 0x40) != 0)
  {
    self->_requestorDeviceType = *((_DWORD *)v4 + 40);
    *(_WORD *)&self->_has |= 0x40u;
  }
  deferredPaymentRequest = self->_deferredPaymentRequest;
  v61 = *((_QWORD *)v4 + 10);
  if (deferredPaymentRequest)
  {
    if (v61)
      -[PKProtobufDeferredPaymentRequest mergeFrom:](deferredPaymentRequest, "mergeFrom:");
  }
  else if (v61)
  {
    -[PKProtobufPaymentRequest setDeferredPaymentRequest:](self, "setDeferredPaymentRequest:");
  }
  if (*((_QWORD *)v4 + 30))
    -[PKProtobufPaymentRequest setUserAgent:](self, "setUserAgent:");
  if ((*((_WORD *)v4 + 126) & 8) != 0)
  {
    self->_merchantCategoryCode = *((_DWORD *)v4 + 27);
    *(_WORD *)&self->_has |= 8u;
  }

}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_merchantIdentifier, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_storeStrong((id *)&self->_currencyCode, a3);
}

- (NSMutableArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (void)setSupportedNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_supportedNetworks, a3);
}

- (unsigned)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (unsigned)requiredBillingAddressFields
{
  return self->_requiredBillingAddressFields;
}

- (unsigned)requiredShippingAddressFields
{
  return self->_requiredShippingAddressFields;
}

- (NSData)billingContact
{
  return self->_billingContact;
}

- (void)setBillingContact:(id)a3
{
  objc_storeStrong((id *)&self->_billingContact, a3);
}

- (NSData)shippingContact
{
  return self->_shippingContact;
}

- (void)setShippingContact:(id)a3
{
  objc_storeStrong((id *)&self->_shippingContact, a3);
}

- (NSMutableArray)summaryItems
{
  return self->_summaryItems;
}

- (void)setSummaryItems:(id)a3
{
  objc_storeStrong((id *)&self->_summaryItems, a3);
}

- (NSMutableArray)shippingMethods
{
  return self->_shippingMethods;
}

- (void)setShippingMethods:(id)a3
{
  objc_storeStrong((id *)&self->_shippingMethods, a3);
}

- (NSData)applicationData
{
  return self->_applicationData;
}

- (void)setApplicationData:(id)a3
{
  objc_storeStrong((id *)&self->_applicationData, a3);
}

- (NSString)originatingURL
{
  return self->_originatingURL;
}

- (void)setOriginatingURL:(id)a3
{
  objc_storeStrong((id *)&self->_originatingURL, a3);
}

- (PKProtobufPaymentMerchantSession)merchantSession
{
  return self->_merchantSession;
}

- (void)setMerchantSession:(id)a3
{
  objc_storeStrong((id *)&self->_merchantSession, a3);
}

- (NSMutableArray)thumbnailURLs
{
  return self->_thumbnailURLs;
}

- (void)setThumbnailURLs:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailURLs, a3);
}

- (BOOL)expectsMerchantSession
{
  return self->_expectsMerchantSession;
}

- (NSMutableArray)requiredShippingContactFields
{
  return self->_requiredShippingContactFields;
}

- (void)setRequiredShippingContactFields:(id)a3
{
  objc_storeStrong((id *)&self->_requiredShippingContactFields, a3);
}

- (NSMutableArray)requiredBillingContactFields
{
  return self->_requiredBillingContactFields;
}

- (void)setRequiredBillingContactFields:(id)a3
{
  objc_storeStrong((id *)&self->_requiredBillingContactFields, a3);
}

- (NSMutableArray)supportedCountries
{
  return self->_supportedCountries;
}

- (void)setSupportedCountries:(id)a3
{
  objc_storeStrong((id *)&self->_supportedCountries, a3);
}

- (unsigned)apiType
{
  return self->_apiType;
}

- (NSMutableArray)contentItems
{
  return self->_contentItems;
}

- (void)setContentItems:(id)a3
{
  objc_storeStrong((id *)&self->_contentItems, a3);
}

- (NSString)localizedNavigationTitle
{
  return self->_localizedNavigationTitle;
}

- (void)setLocalizedNavigationTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedNavigationTitle, a3);
}

- (NSString)localizedSummaryItemsTitle
{
  return self->_localizedSummaryItemsTitle;
}

- (void)setLocalizedSummaryItemsTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedSummaryItemsTitle, a3);
}

- (BOOL)suppressTotal
{
  return self->_suppressTotal;
}

- (BOOL)summaryPinned
{
  return self->_summaryPinned;
}

- (PKProtobufShippingMethods)availableShippingMethods
{
  return self->_availableShippingMethods;
}

- (void)setAvailableShippingMethods:(id)a3
{
  objc_storeStrong((id *)&self->_availableShippingMethods, a3);
}

- (PKProtobufRecurringPaymentRequest)recurringPaymentRequest
{
  return self->_recurringPaymentRequest;
}

- (void)setRecurringPaymentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_recurringPaymentRequest, a3);
}

- (NSMutableArray)multiTokenContexts
{
  return self->_multiTokenContexts;
}

- (void)setMultiTokenContexts:(id)a3
{
  objc_storeStrong((id *)&self->_multiTokenContexts, a3);
}

- (BOOL)respectSupportedNetworksOrder
{
  return self->_respectSupportedNetworksOrder;
}

- (PKProtobufAutomaticReloadPaymentRequest)automaticReloadPaymentRequest
{
  return self->_automaticReloadPaymentRequest;
}

- (void)setAutomaticReloadPaymentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_automaticReloadPaymentRequest, a3);
}

- (PKProtobufDeferredPaymentRequest)deferredPaymentRequest
{
  return self->_deferredPaymentRequest;
}

- (void)setDeferredPaymentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_deferredPaymentRequest, a3);
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_storeStrong((id *)&self->_userAgent, a3);
}

- (int)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_thumbnailURLs, 0);
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_supportedCountries, 0);
  objc_storeStrong((id *)&self->_summaryItems, 0);
  objc_storeStrong((id *)&self->_shippingMethods, 0);
  objc_storeStrong((id *)&self->_shippingContact, 0);
  objc_storeStrong((id *)&self->_requiredShippingContactFields, 0);
  objc_storeStrong((id *)&self->_requiredBillingContactFields, 0);
  objc_storeStrong((id *)&self->_recurringPaymentRequest, 0);
  objc_storeStrong((id *)&self->_originatingURL, 0);
  objc_storeStrong((id *)&self->_multiTokenContexts, 0);
  objc_storeStrong((id *)&self->_merchantSession, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedSummaryItemsTitle, 0);
  objc_storeStrong((id *)&self->_localizedNavigationTitle, 0);
  objc_storeStrong((id *)&self->_deferredPaymentRequest, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_billingContact, 0);
  objc_storeStrong((id *)&self->_availableShippingMethods, 0);
  objc_storeStrong((id *)&self->_automaticReloadPaymentRequest, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
}

@end
