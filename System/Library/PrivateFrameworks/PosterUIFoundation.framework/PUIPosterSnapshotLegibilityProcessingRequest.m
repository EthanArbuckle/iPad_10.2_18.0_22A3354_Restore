@implementation PUIPosterSnapshotLegibilityProcessingRequest

+ (id)defaultLegibilityProcessingRequest
{
  return -[PUIPosterSnapshotLegibilityProcessingRequest initWithDesiredLegibilitySettings:determineColorStatistics:]([PUIPosterSnapshotLegibilityProcessingRequest alloc], "initWithDesiredLegibilitySettings:determineColorStatistics:", 0, 1);
}

+ (id)defaultLegibilityProcessingRequestWithDesiredLegibilitySettings:(id)a3 determineColorStatistics:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  PUIPosterSnapshotLegibilityProcessingRequest *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[PUIPosterSnapshotLegibilityProcessingRequest initWithDesiredLegibilitySettings:determineColorStatistics:]([PUIPosterSnapshotLegibilityProcessingRequest alloc], "initWithDesiredLegibilitySettings:determineColorStatistics:", v5, v4);

  return v6;
}

- (PUIPosterSnapshotLegibilityProcessingRequest)initWithDesiredLegibilitySettings:(id)a3 determineColorStatistics:(BOOL)a4
{
  id v6;
  PUIPosterSnapshotLegibilityProcessingRequest *v7;
  uint64_t v8;
  PUIPosterLegibilitySettings *desiredLegibilitySettings;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUIPosterSnapshotLegibilityProcessingRequest;
  v7 = -[PUIPosterSnapshotLegibilityProcessingRequest init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    desiredLegibilitySettings = v7->_desiredLegibilitySettings;
    v7->_desiredLegibilitySettings = (PUIPosterLegibilitySettings *)v8;

    v7->_determineColorStatistics = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_desiredLegibilitySettings);
  v5 = (id)objc_msgSend(v3, "appendBool:", self->_determineColorStatistics);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PUIPosterSnapshotLegibilityProcessingRequest *v4;
  PUIPosterSnapshotLegibilityProcessingRequest *v5;
  BOOL v6;

  v4 = (PUIPosterSnapshotLegibilityProcessingRequest *)a3;
  v5 = v4;
  if (v4)
    v6 = v4 == self
      || -[PUIPosterSnapshotLegibilityProcessingRequest isEqualToSnapshotLegibilityProcessingRequest:](self, "isEqualToSnapshotLegibilityProcessingRequest:", v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)isEqualToSnapshotLegibilityProcessingRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 determineColorStatistics;
  uint64_t v9;
  id v10;
  id v11;
  PUIPosterLegibilitySettings *desiredLegibilitySettings;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE0BE20];
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "builderWithObject:ofExpectedClass:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  determineColorStatistics = self->_determineColorStatistics;
  v9 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __93__PUIPosterSnapshotLegibilityProcessingRequest_isEqualToSnapshotLegibilityProcessingRequest___block_invoke;
  v21[3] = &unk_25154C2D0;
  v10 = v4;
  v22 = v10;
  v11 = (id)objc_msgSend(v7, "appendBool:counterpart:", determineColorStatistics, v21);
  desiredLegibilitySettings = self->_desiredLegibilitySettings;
  v16 = v9;
  v17 = 3221225472;
  v18 = __93__PUIPosterSnapshotLegibilityProcessingRequest_isEqualToSnapshotLegibilityProcessingRequest___block_invoke_2;
  v19 = &unk_25154C2F8;
  v20 = v10;
  v13 = v10;
  v14 = (id)objc_msgSend(v7, "appendObject:counterpart:", desiredLegibilitySettings, &v16);
  LOBYTE(desiredLegibilitySettings) = objc_msgSend(v7, "isEqual", v16, v17, v18, v19);

  return (char)desiredLegibilitySettings;
}

uint64_t __93__PUIPosterSnapshotLegibilityProcessingRequest_isEqualToSnapshotLegibilityProcessingRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "determineColorStatistics");
}

uint64_t __93__PUIPosterSnapshotLegibilityProcessingRequest_isEqualToSnapshotLegibilityProcessingRequest___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "desiredLegibilitySettings");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PUIPosterSnapshotLegibilityProcessingRequest initWithDesiredLegibilitySettings:determineColorStatistics:](+[PUIPosterSnapshotLegibilityProcessingRequest allocWithZone:](PUIPosterSnapshotLegibilityProcessingRequest, "allocWithZone:", a3), "initWithDesiredLegibilitySettings:determineColorStatistics:", self->_desiredLegibilitySettings, self->_determineColorStatistics);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIPosterSnapshotLegibilityProcessingRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PUIPosterSnapshotLegibilityProcessingRequest *v8;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("_desiredLegibilitySettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_determineColorStatistics"));

  v8 = -[PUIPosterSnapshotLegibilityProcessingRequest initWithDesiredLegibilitySettings:determineColorStatistics:](self, "initWithDesiredLegibilitySettings:determineColorStatistics:", v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  PUIPosterLegibilitySettings *desiredLegibilitySettings;
  id v5;

  desiredLegibilitySettings = self->_desiredLegibilitySettings;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", desiredLegibilitySettings, CFSTR("_desiredLegibilitySettings"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_determineColorStatistics, CFSTR("_determineColorStatistics"));

}

- (BOOL)determineColorStatistics
{
  return self->_determineColorStatistics;
}

- (PUIPosterLegibilitySettings)desiredLegibilitySettings
{
  return self->_desiredLegibilitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredLegibilitySettings, 0);
}

@end
