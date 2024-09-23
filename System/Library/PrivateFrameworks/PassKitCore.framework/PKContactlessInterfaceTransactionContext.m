@implementation PKContactlessInterfaceTransactionContext

- (PKContactlessInterfaceTransactionContext)initWithPaymentPass:(id)a3 activatedPaymentApplications:(id)a4
{
  id v7;
  id v8;
  PKContactlessInterfaceTransactionContext *v9;
  PKContactlessInterfaceTransactionContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKContactlessInterfaceTransactionContext;
  v9 = -[PKContactlessInterfaceTransactionContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paymentPass, a3);
    objc_storeStrong((id *)&v10->_activatedPaymentApplications, a4);
  }

  return v10;
}

- (PKFelicaAppletHistory)felicaHistory
{
  return (PKFelicaAppletHistory *)-[PKTransitAppletHistory felicaHistory](self->_transitHistory, "felicaHistory");
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)isIncompatible
{
  return self->_incompatible;
}

- (void)setIncompatible:(BOOL)a3
{
  self->_incompatible = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (PKPaymentApplication)paymentApplication
{
  return self->_paymentApplication;
}

- (void)setPaymentApplication:(id)a3
{
  objc_storeStrong((id *)&self->_paymentApplication, a3);
}

- (NSArray)activatedPaymentApplications
{
  return self->_activatedPaymentApplications;
}

- (NSString)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)setAppletIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appletIdentifier, a3);
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_credentialIdentifier, a3);
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (NSArray)valueAddedServicePasses
{
  return self->_valueAddedServicePasses;
}

- (void)setValueAddedServicePasses:(id)a3
{
  objc_storeStrong((id *)&self->_valueAddedServicePasses, a3);
}

- (NSArray)valueAddedServiceTransactions
{
  return self->_valueAddedServiceTransactions;
}

- (void)setValueAddedServiceTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_valueAddedServiceTransactions, a3);
}

- (PKTransitAppletHistory)transitHistory
{
  return self->_transitHistory;
}

- (void)setTransitHistory:(id)a3
{
  objc_storeStrong((id *)&self->_transitHistory, a3);
}

- (PKExpressTransactionState)expressState
{
  return self->_expressState;
}

- (void)setExpressState:(id)a3
{
  objc_storeStrong((id *)&self->_expressState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressState, 0);
  objc_storeStrong((id *)&self->_transitHistory, 0);
  objc_storeStrong((id *)&self->_valueAddedServiceTransactions, 0);
  objc_storeStrong((id *)&self->_valueAddedServicePasses, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
  objc_storeStrong((id *)&self->_activatedPaymentApplications, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
