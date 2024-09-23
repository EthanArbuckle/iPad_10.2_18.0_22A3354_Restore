@implementation PKPaymentOffersControllerSelectedOfferDetails

- (PKPaymentOffersControllerSelectedOfferDetails)initWithUpdateReason:(unint64_t)a3
{
  PKPaymentOffersControllerSelectedOfferDetails *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentOffersControllerSelectedOfferDetails;
  result = -[PKPaymentOffersControllerSelectedOfferDetails init](&v5, sel_init);
  if (result)
    result->_updateReason = a3;
  return result;
}

- (BOOL)updateCurrentSelectedPaymentOffer:(id)a3 updateReason:(unint64_t)a4
{
  PKSelectedPaymentOffer *v7;
  PKSelectedPaymentOffer *selectedPaymentOffer;
  PKSelectedPaymentOffer *v9;
  PKSelectedPaymentOffer **p_previouslySelectedOffer;
  unint64_t updateReason;
  PKSelectedPaymentOffer *v12;
  PKSelectedPaymentOffer *v13;
  BOOL v14;
  NSObject *v15;
  int v17;
  PKPaymentOffersControllerSelectedOfferDetails *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = (PKSelectedPaymentOffer *)a3;
  selectedPaymentOffer = self->_selectedPaymentOffer;
  v9 = selectedPaymentOffer;
  updateReason = self->_updateReason;
  p_previouslySelectedOffer = &self->_previouslySelectedOffer;
  v12 = self->_previouslySelectedOffer;
  objc_storeStrong((id *)&self->_selectedPaymentOffer, a3);
  objc_storeStrong((id *)&self->_previouslySelectedOffer, selectedPaymentOffer);
  self->_updateReason = a4;
  if (v7 && v9)
  {
    if (!-[PKSelectedPaymentOffer isEqual:](v7, "isEqual:", v9))
      goto LABEL_16;
  }
  else if (v9 != v7)
  {
    goto LABEL_16;
  }
  v13 = *p_previouslySelectedOffer;
  if (v12 && v13)
  {
    if (!-[PKSelectedPaymentOffer isEqual:](v13, "isEqual:", v12))
      goto LABEL_16;
  }
  else if (v13 != v12)
  {
    goto LABEL_16;
  }
  if (self->_selectedPaymentOffer)
  {
    if (updateReason == a4)
    {
      v14 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v14 = 0;
    if (!*p_previouslySelectedOffer || updateReason == a4)
      goto LABEL_19;
  }
LABEL_16:
  PKLogFacilityTypeGetObject(6uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = self;
    _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Selected payment offer details changed: %@", (uint8_t *)&v17, 0xCu);
  }

  v14 = 1;
LABEL_19:

  return v14;
}

- (void)clearCurrentSelectedPaymentOfferDetails
{
  NSObject *v3;
  PKSelectedPaymentOffer *selectedPaymentOffer;
  PKSelectedPaymentOffer *previouslySelectedOffer;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Clearing selected payment offer details", v6, 2u);
  }

  selectedPaymentOffer = self->_selectedPaymentOffer;
  self->_selectedPaymentOffer = 0;

  previouslySelectedOffer = self->_previouslySelectedOffer;
  self->_previouslySelectedOffer = 0;

  self->_updateReason = 0;
}

- (BOOL)requiresUserAction
{
  unint64_t updateReason;
  BOOL v3;

  updateReason = self->_updateReason;
  v3 = updateReason < 5 || updateReason == 6;
  return !v3 && updateReason == 5 && self->_previouslySelectedOffer && !self->_selectedPaymentOffer;
}

- (BOOL)updatedSelectedOfferContents
{
  unint64_t updateReason;
  BOOL v3;

  updateReason = self->_updateReason;
  v3 = updateReason < 5 || updateReason == 6;
  return !v3 && updateReason == 5 && self->_previouslySelectedOffer && self->_selectedPaymentOffer;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOffersControllerSelectedOfferDetails *v4;
  PKPaymentOffersControllerSelectedOfferDetails *v5;
  PKPaymentOffersControllerSelectedOfferDetails *v6;
  PKSelectedPaymentOffer *selectedPaymentOffer;
  PKSelectedPaymentOffer *v8;
  BOOL v9;
  PKSelectedPaymentOffer *previouslySelectedOffer;
  PKSelectedPaymentOffer *v11;

  v4 = (PKPaymentOffersControllerSelectedOfferDetails *)a3;
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
        selectedPaymentOffer = self->_selectedPaymentOffer;
        v8 = v6->_selectedPaymentOffer;
        if (selectedPaymentOffer && v8)
        {
          if (!-[PKSelectedPaymentOffer isEqual:](selectedPaymentOffer, "isEqual:"))
            goto LABEL_16;
        }
        else if (selectedPaymentOffer != v8)
        {
          goto LABEL_16;
        }
        previouslySelectedOffer = self->_previouslySelectedOffer;
        v11 = v6->_previouslySelectedOffer;
        if (previouslySelectedOffer && v11)
        {
          if (-[PKSelectedPaymentOffer isEqual:](previouslySelectedOffer, "isEqual:"))
          {
LABEL_14:
            v9 = self->_updateReason == v6->_updateReason;
LABEL_17:

            goto LABEL_18;
          }
        }
        else if (previouslySelectedOffer == v11)
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
  objc_msgSend(v3, "safelyAddObject:", self->_selectedPaymentOffer);
  objc_msgSend(v3, "safelyAddObject:", self->_previouslySelectedOffer);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_updateReason - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3;
  unint64_t v4;
  const __CFString *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v4 = self->_updateReason - 1;
  if (v4 > 5)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AC91A0[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("updateReason: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("selectedPaymentOffer: '%@'; "), self->_selectedPaymentOffer);
  objc_msgSend(v3, "appendFormat:", CFSTR("previouslySelectedOffer: '%@'; "), self->_previouslySelectedOffer);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (PKSelectedPaymentOffer)selectedPaymentOffer
{
  return self->_selectedPaymentOffer;
}

- (PKSelectedPaymentOffer)previouslySelectedOffer
{
  return self->_previouslySelectedOffer;
}

- (unint64_t)updateReason
{
  return self->_updateReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslySelectedOffer, 0);
  objc_storeStrong((id *)&self->_selectedPaymentOffer, 0);
}

@end
