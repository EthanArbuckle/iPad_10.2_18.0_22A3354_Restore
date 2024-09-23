@implementation SESVehicleReport

- (SESVehicleReport)initWithKeyIdentifier:(id)a3 readerIdentifier:(id)a4 supportedFunctions:(id)a5 functionsInProgress:(id)a6 status:(id)a7 proprietaryData:(id)a8
{
  id v15;
  id v16;
  id v17;
  SESVehicleReport *v18;
  SESVehicleReport *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)SESVehicleReport;
  v18 = -[SESVehicleReport init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_keyIdentifier, a3);
    objc_storeStrong((id *)&v19->_readerIdentifier, a4);
    objc_storeStrong((id *)&v19->_supportedFunctions, a5);
    objc_storeStrong((id *)&v19->_functionsInProgress, a6);
    objc_storeStrong((id *)&v19->_status, a7);
    objc_storeStrong((id *)&v19->_proprietaryData, a8);
  }

  return v19;
}

- (BOOL)isRKEFunctionSupported:(id)a3
{
  return -[NSArray containsObject:](self->_supportedFunctions, "containsObject:", a3);
}

- (id)getSupportedRKEFunctions
{
  return self->_supportedFunctions;
}

- (BOOL)isRKEFunctionInProgress:(id)a3
{
  return -[NSArray containsObject:](self->_functionsInProgress, "containsObject:", a3);
}

- (id)getRKEFunctionsInProgress
{
  return self->_functionsInProgress;
}

- (id)getStatusForRKEFunction:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_status, "objectForKeyedSubscript:", a3);
}

- (id)getProprietaryDataForRKEFunction:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_proprietaryData, "objectForKeyedSubscript:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[SESVehicleReport keyIdentifier](self, "keyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("keyIdentifier"));

  -[SESVehicleReport readerIdentifier](self, "readerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("readerIdentifier"));

  -[SESVehicleReport supportedFunctions](self, "supportedFunctions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("supportedFunctions"));

  -[SESVehicleReport functionsInProgress](self, "functionsInProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("functionsInProgress"));

  -[SESVehicleReport status](self, "status");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("status"));

  -[SESVehicleReport proprietaryData](self, "proprietaryData");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("proprietaryData"));

}

- (SESVehicleReport)initWithCoder:(id)a3
{
  id v4;
  SESVehicleReport *v5;
  SESVehicleReport *v6;
  void *v7;
  uint64_t v8;
  NSString *keyIdentifier;
  void *v10;
  uint64_t v11;
  NSString *readerIdentifier;
  void *v13;
  uint64_t v14;
  NSArray *supportedFunctions;
  void *v16;
  uint64_t v17;
  NSArray *functionsInProgress;
  void *v19;
  uint64_t v20;
  NSDictionary *status;
  void *v22;
  uint64_t v23;
  NSDictionary *proprietaryData;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SESVehicleReport;
  v5 = -[SESVehicleReport init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SESVehicleReport keyIdentifier](v5, "keyIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    keyIdentifier = v6->_keyIdentifier;
    v6->_keyIdentifier = (NSString *)v8;

    -[SESVehicleReport readerIdentifier](v6, "readerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    readerIdentifier = v6->_readerIdentifier;
    v6->_readerIdentifier = (NSString *)v11;

    -[SESVehicleReport supportedFunctions](v6, "supportedFunctions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportedFunctions"));
    v14 = objc_claimAutoreleasedReturnValue();
    supportedFunctions = v6->_supportedFunctions;
    v6->_supportedFunctions = (NSArray *)v14;

    -[SESVehicleReport functionsInProgress](v6, "functionsInProgress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("functionsInProgress"));
    v17 = objc_claimAutoreleasedReturnValue();
    functionsInProgress = v6->_functionsInProgress;
    v6->_functionsInProgress = (NSArray *)v17;

    -[SESVehicleReport status](v6, "status");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v20 = objc_claimAutoreleasedReturnValue();
    status = v6->_status;
    v6->_status = (NSDictionary *)v20;

    -[SESVehicleReport proprietaryData](v6, "proprietaryData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proprietaryData"));
    v23 = objc_claimAutoreleasedReturnValue();
    proprietaryData = v6->_proprietaryData;
    v6->_proprietaryData = (NSDictionary *)v23;

  }
  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("KeyID %@; supported %@; in progress %@; status %@"),
               self->_keyIdentifier,
               self->_supportedFunctions,
               self->_functionsInProgress,
               self->_status);
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSString)readerIdentifier
{
  return self->_readerIdentifier;
}

- (NSArray)supportedFunctions
{
  return self->_supportedFunctions;
}

- (void)setSupportedFunctions:(id)a3
{
  objc_storeStrong((id *)&self->_supportedFunctions, a3);
}

- (NSArray)functionsInProgress
{
  return self->_functionsInProgress;
}

- (void)setFunctionsInProgress:(id)a3
{
  objc_storeStrong((id *)&self->_functionsInProgress, a3);
}

- (NSDictionary)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (NSDictionary)proprietaryData
{
  return self->_proprietaryData;
}

- (void)setProprietaryData:(id)a3
{
  objc_storeStrong((id *)&self->_proprietaryData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proprietaryData, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_functionsInProgress, 0);
  objc_storeStrong((id *)&self->_supportedFunctions, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end
