@implementation SBSensorActivityAttribution

uint64_t __39__SBSensorActivityAttribution_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sensor");
}

id __35__SBSensorActivityAttribution_hash__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)SBSensorActivityAttribution;
  return objc_msgSendSuper2(&v2, sel_hash);
}

- (SBSensorActivityAttribution)initWithDataAccessAttribution:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SBSensorActivityAttribution *v10;
  SBSensorActivityAttribution *v11;
  objc_super v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "dataAccessType");
  if (v5 == 2)
  {
    objc_msgSend(v4, "locationAttribution");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activityAttribution");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 2;
  }
  else if (v5 == 1)
  {
    objc_msgSend(v4, "cameraCaptureAttribution");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activityAttribution");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 0;
  }
  else if (v5)
  {
    v7 = 0;
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "audioRecordingActivityAttribution");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
  }
  v13.receiver = self;
  v13.super_class = (Class)SBSensorActivityAttribution;
  v10 = -[SBActivityAttribution initWithSTActivityAttribution:](&v13, sel_initWithSTActivityAttribution_, v6);
  v11 = v10;
  if (v10)
  {
    v10->_sensor = v7;
    v10->_usedRecently = objc_msgSend(v4, "isRecent");
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  id v7;
  id v8;
  BOOL v9;
  objc_super v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBSensorActivityAttribution sensor](self, "sensor");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39__SBSensorActivityAttribution_isEqual___block_invoke;
  v12[3] = &unk_1E8EA3AB0;
  v7 = v4;
  v13 = v7;
  v8 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v6, v12);
  if (objc_msgSend(v5, "isEqual"))
  {
    v11.receiver = self;
    v11.super_class = (Class)SBSensorActivityAttribution;
    v9 = -[SBActivityAttribution isEqual:](&v11, sel_isEqual_, v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = 3221225472;
  v8[2] = __35__SBSensorActivityAttribution_hash__block_invoke;
  v8[3] = &unk_1E8E9EAA0;
  v8[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v4 = (id)objc_msgSend(v3, "appendHashingBlocks:", v8, 0);
  v5 = (id)objc_msgSend(v3, "appendInteger:", -[SBSensorActivityAttribution sensor](self, "sensor"));
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (int64_t)sensor
{
  return self->_sensor;
}

- (BOOL)usedRecently
{
  return self->_usedRecently;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSensorActivityAttribution succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSensorActivityAttribution;
  -[SBActivityAttribution succinctDescriptionBuilder](&v7, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSensorActivityAttribution sensor](self, "sensor");
  SBFDescriptionForSensorType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("sensor"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSensorActivityAttribution descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBSensorActivityAttribution *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBSensorActivityAttribution;
  v4 = a3;
  -[SBActivityAttribution descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__SBSensorActivityAttribution_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __69__SBSensorActivityAttribution_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sensor");
  SBFDescriptionForSensorType();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, CFSTR("sensor"));

}

@end
