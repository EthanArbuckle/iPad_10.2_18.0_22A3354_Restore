@implementation FMFAlertAckCommand

- (FMFAlertAckCommand)initWithAlertId:(id)a3
{
  id v4;
  FMFAlertAckCommand *v5;
  FMFAlertAckCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMFAlertAckCommand;
  v5 = -[FMFBaseCmd initWithClientSession:](&v8, "initWithClientSession:", 0);
  v6 = v5;
  if (v5)
    -[FMFAlertAckCommand setAlertId:](v5, "setAlertId:", v4);

  return v6;
}

- (BOOL)ignoreResponseErrors
{
  return 1;
}

- (BOOL)responseContainsFullModelUpdate
{
  return 0;
}

- (id)pathSuffix
{
  return CFSTR("ackAlert");
}

- (id)jsonBodyDictionary
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMFAlertAckCommand;
  v3 = -[FMFBaseCmd jsonBodyDictionary](&v7, "jsonBodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAlertAckCommand alertId](self, "alertId"));
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("alertId"));

  return v4;
}

- (NSString)alertId
{
  return self->_alertId;
}

- (void)setAlertId:(id)a3
{
  objc_storeStrong((id *)&self->_alertId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertId, 0);
}

@end
