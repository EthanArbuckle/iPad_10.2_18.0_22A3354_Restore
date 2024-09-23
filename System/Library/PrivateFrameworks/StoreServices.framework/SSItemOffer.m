@implementation SSItemOffer

- (SSItemOffer)init
{
  return -[SSItemOffer initWithOfferIdentifier:dictionary:](self, "initWithOfferIdentifier:dictionary:", 0, 0);
}

- (SSItemOffer)initWithOfferIdentifier:(id)a3 dictionary:(id)a4
{
  SSItemOffer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSItemOffer;
  v6 = -[SSItemOffer init](&v8, sel_init);
  if (v6)
  {
    v6->_offerDictionary = (NSMutableDictionary *)objc_msgSend(a4, "mutableCopy");
    v6->_offerIdentifier = (NSString *)objc_msgSend(a3, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSItemOffer;
  -[SSItemOffer dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5[2] = -[NSMutableDictionary mutableCopyWithZone:](self->_offerDictionary, "mutableCopyWithZone:", a3);
  v5[3] = -[NSString copyWithZone:](self->_offerIdentifier, "copyWithZone:", a3);
  v5[4] = -[NSArray copyWithZone:](self->_supportedDevices, "copyWithZone:", a3);
  return v5;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSItemOffer;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: (%@: %@)"), -[SSItemOffer description](&v3, sel_description), -[SSItemOffer offerIdentifier](self, "offerIdentifier"), -[SSItemOffer buyParameters](self, "buyParameters"));
}

- (NSString)actionDisplayName
{
  NSString *v2;

  v2 = -[SSItemOffer valueForProperty:](self, "valueForProperty:", CFSTR("action-display-name"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)allowedToneStyles
{
  id v3;

  v3 = -[SSItemOffer valueForProperty:](self, "valueForProperty:", CFSTR("allowed-tone-styles"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  if (-[SSItemMedia isProtectedMedia](-[SSItemOffer offerMedia](self, "offerMedia"), "isProtectedMedia"))
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("ringtone"));
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("ringtone"), CFSTR("texttone"), 0);
}

- (NSString)buyParameters
{
  NSString *v3;

  if (-[SSItem isRestricted](self->_item, "isRestricted"))
  {
    v3 = 0;
  }
  else
  {
    v3 = -[SSItemOffer valueForProperty:](self, "valueForProperty:", CFSTR("action-params"));
    if (!v3)
      v3 = -[SSItemOffer valueForProperty:](self, "valueForProperty:", CFSTR("buy-params"));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return 0;
}

- (SSDialog)confirmationDialog
{
  return -[SSDialog initWithDialogDictionary:]([SSDialog alloc], "initWithDialogDictionary:", -[NSMutableDictionary objectForKey:](self->_offerDictionary, "objectForKey:", CFSTR("confirmation-dialog")));
}

- (id)documentCannotOpenDialog
{
  return -[SSDialog initWithDialogDictionary:]([SSDialog alloc], "initWithDialogDictionary:", -[NSMutableDictionary objectForKey:](self->_offerDictionary, "objectForKey:", CFSTR("document-cannot-open-dialog")));
}

- (id)documentRequiredHandlers
{
  id v2;

  v2 = -[SSItemOffer valueForProperty:](self, "valueForProperty:", CFSTR("required-document-handlers"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)documentUTI
{
  id v2;

  v2 = -[SSItemOffer valueForProperty:](self, "valueForProperty:", CFSTR("UTI"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (BOOL)isOneTapOffer
{
  id v2;

  v2 = -[SSItemOffer valueForProperty:](self, "valueForProperty:", CFSTR("should-show-confirmation"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue") ^ 1;
  else
    return 0;
}

- (BOOL)isPreorder
{
  id v2;

  v2 = -[SSItemOffer valueForProperty:](self, "valueForProperty:", CFSTR("is-preorder"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (SSNetworkConstraints)networkConstraints
{
  id v2;
  SSNetworkConstraints *v3;

  v2 = -[SSItemOffer valueForProperty:](self, "valueForProperty:", CFSTR("network-constraints"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_alloc_init(SSNetworkConstraints);
    -[SSNetworkConstraints setSizeLimitsWithStoreConstraintDictionary:](v3, "setSizeLimitsWithStoreConstraintDictionary:", v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (SSItemMedia)offerMedia
{
  SSItemMedia *v3;
  SSItem *item;
  uint64_t v5;
  NSString *offerIdentifier;
  NSString *v7;
  NSString *v8;
  __CFString **v9;

  v3 = -[SSItemMedia initWithStoreOfferDictionary:]([SSItemMedia alloc], "initWithStoreOfferDictionary:", self->_offerDictionary);
  item = self->_item;
  if (item)
  {
    v5 = -[SSItem mediaKind](item, "mediaKind");
LABEL_13:
    -[SSItemMedia setMediaKind:](v3, "setMediaKind:", v5);
    return v3;
  }
  offerIdentifier = self->_offerIdentifier;
  if (offerIdentifier)
  {
    if (-[NSString rangeOfString:options:](offerIdentifier, "rangeOfString:options:", CFSTR("video"), 1) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = SSItemMediaKindVideo;
      goto LABEL_12;
    }
    v7 = self->_offerIdentifier;
    if (v7)
    {
      if (-[NSString rangeOfString:options:](v7, "rangeOfString:options:", CFSTR("audio"), 1) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = SSItemMediaKindAudio;
        goto LABEL_12;
      }
      v8 = self->_offerIdentifier;
      if (v8)
      {
        if (-[NSString rangeOfString:options:](v8, "rangeOfString:options:", CFSTR("document"), 1) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v9 = SSItemMediaKindDocument;
LABEL_12:
          v5 = (uint64_t)*v9;
          goto LABEL_13;
        }
      }
    }
  }
  return v3;
}

- (NSString)priceDisplay
{
  NSString *v2;

  v2 = -[SSItemOffer valueForProperty:](self, "valueForProperty:", CFSTR("price-display"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (SSDialog)successDialog
{
  return -[SSDialog initWithDialogDictionary:]([SSDialog alloc], "initWithDialogDictionary:", -[NSMutableDictionary objectForKey:](self->_offerDictionary, "objectForKey:", CFSTR("success-dialog")));
}

- (NSArray)supportedDevices
{
  NSArray *result;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  SSItemOfferDevice *v11;
  SSItemOfferDevice *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  result = self->_supportedDevices;
  if (!result)
  {
    v4 = -[SSItemOffer valueForProperty:](self, "valueForProperty:", CFSTR("supported-device-types"));
    if (!v4)
      v4 = -[SSItemOffer valueForProperty:](self, "valueForProperty:", CFSTR("supported-devices"));
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = -[SSItemOfferDevice initWithOfferDeviceDicitionary:]([SSItemOfferDevice alloc], "initWithOfferDeviceDicitionary:", v10);
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) == 0)
              continue;
            v11 = -[SSItemOfferDevice initWithDeviceIdentifier:]([SSItemOfferDevice alloc], "initWithDeviceIdentifier:", (int)objc_msgSend(v10, "intValue"));
          }
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v5, "addObject:", v11);

          }
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
    self->_supportedDevices = (NSArray *)objc_msgSend(v5, "copy");

    return self->_supportedDevices;
  }
  return result;
}

- (id)valueForProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_offerDictionary, "objectForKey:", a3);
}

- (NSSet)accountIdentifiers
{
  id v2;

  v2 = -[SSItemOffer valueForProperty:](self, "valueForProperty:", CFSTR("ds-ids"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
  else
    return 0;
}

- (NSString)actionType
{
  NSString *v2;

  v2 = -[SSItemOffer valueForProperty:](self, "valueForProperty:", CFSTR("action-type"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return (NSString *)CFSTR("buy");
}

- (int64_t)estimatedDiskSpaceNeeded
{
  SSItemMedia *v2;
  SSItemMedia *v3;
  int64_t v4;

  v2 = -[SSItemOffer offerMedia](self, "offerMedia");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = -[SSItemMedia mediaFileSize](v2, "mediaFileSize");
  if (-[NSString isEqualToString:](-[SSItemMedia mediaKind](v3, "mediaKind"), "isEqualToString:", CFSTR("software")))
    return (uint64_t)((double)v4 * 2.5);
  return v4;
}

- (id)requiredSoftwareCapabilities
{
  id v2;

  v2 = -[SSItemOffer valueForProperty:](self, "valueForProperty:", CFSTR("UIRequiredDeviceCapabilities"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
  }
  return v2;
}

- (void)setActionDisplayName:(id)a3
{
  NSMutableDictionary *offerDictionary;

  offerDictionary = self->_offerDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](offerDictionary, "setObject:forKey:", a3, CFSTR("action-display-name"));
  else
    -[NSMutableDictionary removeObjectForKey:](offerDictionary, "removeObjectForKey:", CFSTR("action-display-name"));
}

- (void)setBuyParameters:(id)a3
{
  NSMutableDictionary *offerDictionary;

  offerDictionary = self->_offerDictionary;
  if (a3)
  {
    -[NSMutableDictionary setObject:forKey:](offerDictionary, "setObject:forKey:", a3, CFSTR("action-params"));
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](offerDictionary, "removeObjectForKey:", CFSTR("action-params"));
    -[NSMutableDictionary removeObjectForKey:](self->_offerDictionary, "removeObjectForKey:", CFSTR("buy-params"));
  }
}

- (void)setOneTapOffer:(BOOL)a3
{
  -[NSMutableDictionary setObject:forKey:](self->_offerDictionary, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !a3), CFSTR("should-show-confirmation"));
}

- (void)setPriceDisplay:(id)a3
{
  NSMutableDictionary *offerDictionary;

  offerDictionary = self->_offerDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](offerDictionary, "setObject:forKey:", a3, CFSTR("price-display"));
  else
    -[NSMutableDictionary removeObjectForKey:](offerDictionary, "removeObjectForKey:", CFSTR("price-display"));
}

- (BOOL)shouldShowPlusIcon
{
  id v2;

  v2 = -[SSItemOffer valueForProperty:](self, "valueForProperty:", CFSTR("plus-icon-badge"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

+ (id)_preferredOfferIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("PLUSPRE"), CFSTR("STDQPRE"), CFSTR("HDPRE"), CFSTR("HQRDL"), CFSTR("PLUS"), CFSTR("STDRDL"), CFSTR("STDQ"), CFSTR("SWUPD"), CFSTR("HDRDL"), CFSTR("SDVOD"), CFSTR("HDVOD"), CFSTR("LCVOD"), CFSTR("HDBUY"), CFSTR("standard-audio"), CFSTR("standard-video"), CFSTR("standard-document"), 0);
}

- (NSString)offerIdentifier
{
  return self->_offerIdentifier;
}

- (SSItem)_offerItem
{
  return self->_item;
}

- (void)_setOfferItem:(id)a3
{
  self->_item = (SSItem *)a3;
}

@end
