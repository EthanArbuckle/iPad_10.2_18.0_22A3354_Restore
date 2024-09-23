@implementation _SUAutoInstallOperationModel

- (_SUAutoInstallOperationModel)init
{
  _SUAutoInstallOperationModel *v2;
  _SUAutoInstallOperationModel *v3;
  uint64_t v4;
  NSUUID *id;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SUAutoInstallOperationModel;
  v2 = -[_SUAutoInstallOperationModel init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_agreementStatus = 0;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = objc_claimAutoreleasedReturnValue();
    id = v3->_id;
    v3->_id = (NSUUID *)v4;

  }
  return v3;
}

- (id)description
{
  void *v3;
  SUAutoInstallForecast *forecast;
  uint64_t agreementStatus;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  forecast = self->_forecast;
  agreementStatus = self->_agreementStatus;
  -[NSUUID UUIDString](self->_id, "UUIDString");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (self->_waitingUntilDownloadComplete)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("forecast: %@\n             agreementStatus: %d\n             id: %@             waitingUntilDownloadComplete: %@"), forecast, agreementStatus, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SUAutoInstallOperationModel)initWithCoder:(id)a3
{
  id v4;
  _SUAutoInstallOperationModel *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SUAutoInstallOperationModel;
  v5 = -[_SUAutoInstallOperationModel init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("forecast"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SUAutoInstallOperationModel setForecast:](v5, "setForecast:", v6);

    -[_SUAutoInstallOperationModel setAgreementStatus:](v5, "setAgreementStatus:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("agreementStatus")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SUAutoInstallOperationModel setId:](v5, "setId:", v7);

    -[_SUAutoInstallOperationModel setWaitingUntilDownloadComplete:](v5, "setWaitingUntilDownloadComplete:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("waitingUntilDownloadComplete")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SUAutoInstallOperationModel forecast](self, "forecast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("forecast"));

  objc_msgSend(v6, "encodeInt:forKey:", -[_SUAutoInstallOperationModel agreementStatus](self, "agreementStatus"), CFSTR("agreementStatus"));
  -[_SUAutoInstallOperationModel id](self, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("id"));

  objc_msgSend(v6, "encodeBool:forKey:", -[_SUAutoInstallOperationModel waitingUntilDownloadComplete](self, "waitingUntilDownloadComplete"), CFSTR("waitingUntilDownloadComplete"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _SUAutoInstallOperationModel *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(_SUAutoInstallOperationModel);
  -[_SUAutoInstallOperationModel forecast](self, "forecast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SUAutoInstallOperationModel setForecast:](v4, "setForecast:", v5);

  -[_SUAutoInstallOperationModel setAgreementStatus:](v4, "setAgreementStatus:", -[_SUAutoInstallOperationModel agreementStatus](self, "agreementStatus"));
  -[_SUAutoInstallOperationModel id](self, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SUAutoInstallOperationModel setId:](v4, "setId:", v6);

  -[_SUAutoInstallOperationModel setWaitingUntilDownloadComplete:](v4, "setWaitingUntilDownloadComplete:", -[_SUAutoInstallOperationModel waitingUntilDownloadComplete](self, "waitingUntilDownloadComplete"));
  return v4;
}

- (SUAutoInstallForecast)forecast
{
  return self->_forecast;
}

- (void)setForecast:(id)a3
{
  objc_storeStrong((id *)&self->_forecast, a3);
}

- (int)agreementStatus
{
  return self->_agreementStatus;
}

- (void)setAgreementStatus:(int)a3
{
  self->_agreementStatus = a3;
}

- (NSUUID)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_storeStrong((id *)&self->_id, a3);
}

- (BOOL)waitingUntilDownloadComplete
{
  return self->_waitingUntilDownloadComplete;
}

- (void)setWaitingUntilDownloadComplete:(BOOL)a3
{
  self->_waitingUntilDownloadComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forecast, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
