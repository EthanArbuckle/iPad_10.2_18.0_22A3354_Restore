@implementation PKPaymentOffersControllerLoadingDetails

- (id)initWitState:(unint64_t)a3
{
  PKPaymentOffersControllerLoadingDetails *v4;
  PKPaymentOffersControllerLoadingDetails *v5;
  uint64_t v6;
  NSDate *lastUpdated;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentOffersControllerLoadingDetails;
  v4 = -[PKPaymentOffersControllerLoadingDetails init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_state = a3;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v6;

  }
  return v5;
}

- (PKPaymentOffersControllerLoadingDetails)initWithError:(id)a3
{
  id v5;
  id *v6;
  PKPaymentOffersControllerLoadingDetails *v7;

  v5 = a3;
  v6 = -[PKPaymentOffersControllerLoadingDetails initWitState:](self, "initWitState:", 2);
  v7 = (PKPaymentOffersControllerLoadingDetails *)v6;
  if (v6)
    objc_storeStrong(v6 + 3, a3);

  return v7;
}

+ (id)loadingDetailsWithState:(unint64_t)a3
{
  return -[PKPaymentOffersControllerLoadingDetails initWitState:]([PKPaymentOffersControllerLoadingDetails alloc], "initWitState:", a3);
}

+ (id)loadingDetailsWithError:(id)a3
{
  id v3;
  PKPaymentOffersControllerLoadingDetails *v4;

  v3 = a3;
  v4 = -[PKPaymentOffersControllerLoadingDetails initWithError:]([PKPaymentOffersControllerLoadingDetails alloc], "initWithError:", v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOffersControllerLoadingDetails *v4;
  PKPaymentOffersControllerLoadingDetails *v5;
  PKPaymentOffersControllerLoadingDetails *v6;
  NSError *error;
  NSError *v8;
  BOOL v9;
  NSDate *lastUpdated;
  NSDate *v11;

  v4 = (PKPaymentOffersControllerLoadingDetails *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        error = self->_error;
        v8 = v6->_error;
        if (error && v8)
        {
          if ((-[NSError isEqual:](error, "isEqual:") & 1) == 0)
            goto LABEL_16;
        }
        else if (error != v8)
        {
          goto LABEL_16;
        }
        lastUpdated = self->_lastUpdated;
        v11 = v6->_lastUpdated;
        if (lastUpdated && v11)
        {
          if ((-[NSDate isEqual:](lastUpdated, "isEqual:") & 1) != 0)
          {
LABEL_14:
            v9 = self->_state == v6->_state;
LABEL_17:

            goto LABEL_18;
          }
        }
        else if (lastUpdated == v11)
        {
          goto LABEL_14;
        }
LABEL_16:
        v9 = 0;
        goto LABEL_17;
      }
    }
    v9 = 0;
  }
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_error);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdated);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_state - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3;
  unint64_t state;
  const __CFString *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  state = self->_state;
  if (state > 3)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AC9180[state];
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdated: '%@'; "), self->_lastUpdated);
  if (self->_error)
    objc_msgSend(v3, "appendFormat:", CFSTR("error: '%@'; "), self->_error);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
}

@end
