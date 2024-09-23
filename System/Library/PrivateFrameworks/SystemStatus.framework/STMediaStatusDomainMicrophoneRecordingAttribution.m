@implementation STMediaStatusDomainMicrophoneRecordingAttribution

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMediaStatusDomainMicrophoneRecordingAttribution activityAttribution](self, "activityAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[STMediaStatusDomainMicrophoneRecordingAttribution maximumHistoryAccessed](self, "maximumHistoryAccessed");
  v6 = (id)objc_msgSend(v3, "appendDouble:");
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (STActivityAttribution)activityAttribution
{
  return self->_activityAttribution;
}

- (double)maximumHistoryAccessed
{
  return self->_maximumHistoryAccessed;
}

- (STMediaStatusDomainMicrophoneRecordingAttribution)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  STMediaStatusDomainMicrophoneRecordingAttribution *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityAttribution"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maximumHistoryAccessed"));
  v7 = v6;

  if (v5)
  {
    self = -[STMediaStatusDomainMicrophoneRecordingAttribution initWithActivityAttribution:maximumHistoryAccessed:](self, "initWithActivityAttribution:maximumHistoryAccessed:", v5, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (STMediaStatusDomainMicrophoneRecordingAttribution)initWithActivityAttribution:(id)a3 maximumHistoryAccessed:(double)a4
{
  id v6;
  STMediaStatusDomainMicrophoneRecordingAttribution *v7;
  uint64_t v8;
  STActivityAttribution *activityAttribution;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STMediaStatusDomainMicrophoneRecordingAttribution;
  v7 = -[STMediaStatusDomainMicrophoneRecordingAttribution init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    activityAttribution = v7->_activityAttribution;
    v7->_activityAttribution = (STActivityAttribution *)v8;

    v7->_maximumHistoryAccessed = a4;
  }

  return v7;
}

- (STMediaStatusDomainMicrophoneRecordingAttribution)initWithActivityAttribution:(id)a3
{
  return -[STMediaStatusDomainMicrophoneRecordingAttribution initWithActivityAttribution:maximumHistoryAccessed:](self, "initWithActivityAttribution:maximumHistoryAccessed:", a3, 0.0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[STMediaStatusDomainMicrophoneRecordingAttribution activityAttribution](self, "activityAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("activityAttribution"));

  -[STMediaStatusDomainMicrophoneRecordingAttribution maximumHistoryAccessed](self, "maximumHistoryAccessed");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("maximumHistoryAccessed"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityAttribution, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  double v10;
  double v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMediaStatusDomainMicrophoneRecordingAttribution activityAttribution](self, "activityAttribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__STMediaStatusDomainMicrophoneRecordingAttribution_isEqual___block_invoke;
  v20[3] = &unk_1E91E4AB0;
  v8 = v4;
  v21 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v20);

  -[STMediaStatusDomainMicrophoneRecordingAttribution maximumHistoryAccessed](self, "maximumHistoryAccessed");
  v11 = v10;
  v15 = v7;
  v16 = 3221225472;
  v17 = __61__STMediaStatusDomainMicrophoneRecordingAttribution_isEqual___block_invoke_2;
  v18 = &unk_1E91E58D8;
  v19 = v8;
  v12 = v8;
  v13 = (id)objc_msgSend(v5, "appendDouble:counterpart:", &v15, v11);
  LOBYTE(v8) = objc_msgSend(v5, "isEqual", v15, v16, v17, v18);

  return (char)v8;
}

uint64_t __61__STMediaStatusDomainMicrophoneRecordingAttribution_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityAttribution");
}

uint64_t __61__STMediaStatusDomainMicrophoneRecordingAttribution_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "maximumHistoryAccessed");
}

- (NSString)description
{
  return (NSString *)-[STMediaStatusDomainMicrophoneRecordingAttribution descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STMediaStatusDomainMicrophoneRecordingAttribution succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STMediaStatusDomainMicrophoneRecordingAttribution descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  STMediaStatusDomainMicrophoneRecordingAttribution *v11;

  v4 = a3;
  -[STMediaStatusDomainMicrophoneRecordingAttribution succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__STMediaStatusDomainMicrophoneRecordingAttribution_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E91E4AD8;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __91__STMediaStatusDomainMicrophoneRecordingAttribution_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "activityAttribution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("activityAttribution"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "maximumHistoryAccessed");
  return (id)objc_msgSend(v5, "appendDouble:withName:decimalPrecision:", CFSTR("maximumHistoryAccessed"), 0x7FFFFFFFFFFFFFFFLL);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
