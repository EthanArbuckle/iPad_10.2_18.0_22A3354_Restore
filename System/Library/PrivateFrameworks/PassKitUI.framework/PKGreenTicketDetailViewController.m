@implementation PKGreenTicketDetailViewController

- (PKGreenTicketDetailViewController)initWithFelicaProperty:(id)a3
{
  id v4;
  PKGreenTicketDetailViewController *v5;
  uint64_t v6;
  PKFelicaPassProperties *properties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKGreenTicketDetailViewController;
  v5 = -[PKTransitTicketDetailViewController initWithTransitTicketDetailDataSource:](&v9, sel_initWithTransitTicketDetailDataSource_, self);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    properties = v5->_properties;
    v5->_properties = (PKFelicaPassProperties *)v6;

  }
  return v5;
}

- (unint64_t)numberOfLegs
{
  return 1;
}

- (id)titleForLeg:(unint64_t)a3
{
  return 0;
}

- (int64_t)transitTicketDetailNumberOfRowsForLeg:(unint64_t)a3
{
  return 3;
}

- (id)transitTicketDetailTitleForRow:(unint64_t)a3 leg:(unint64_t)a4
{
  if (a3 > 2)
    return 0;
  PKLocalizedPaymentString(&off_1E3E65058[a3]->isa);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transitTicketDetailValueForRow:(unint64_t)a3 leg:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[PKGreenTicketDetailViewController properties](self, "properties", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "greenCarValidityStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v8, 3, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 1)
    {
      -[PKGreenTicketDetailViewController properties](self, "properties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "greenCarDestinationStation");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3)
      {
        v11 = 0;
        goto LABEL_9;
      }
      -[PKGreenTicketDetailViewController properties](self, "properties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "greenCarOriginStation");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v10;

  }
LABEL_9:

  return v11;
}

- (PKFelicaPassProperties)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
