@implementation NCNotificationSound

- (NCNotificationSound)initWithNotificationSound:(id)a3
{
  id v4;
  NCNotificationSound *v5;
  void *v6;
  uint64_t v7;
  NSString *ringtoneName;
  void *v9;
  uint64_t v10;
  NSDictionary *vibrationPattern;
  double v12;
  void *v13;
  uint64_t v14;
  NSDictionary *controllerAttributes;
  void *v16;
  uint64_t v17;
  NSString *songPath;
  void *v19;
  uint64_t v20;
  TLAlertConfiguration *alertConfiguration;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NCNotificationSound;
  v5 = -[NCNotificationSound init](&v23, sel_init);
  if (v5)
  {
    v5->_soundType = objc_msgSend(v4, "soundType");
    v5->_systemSoundID = objc_msgSend(v4, "systemSoundID");
    v5->_soundBehavior = objc_msgSend(v4, "soundBehavior");
    objc_msgSend(v4, "ringtoneName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    ringtoneName = v5->_ringtoneName;
    v5->_ringtoneName = (NSString *)v7;

    objc_msgSend(v4, "vibrationPattern");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    vibrationPattern = v5->_vibrationPattern;
    v5->_vibrationPattern = (NSDictionary *)v10;

    v5->_repeats = objc_msgSend(v4, "isRepeating");
    objc_msgSend(v4, "maxDuration");
    v5->_maxDuration = v12;
    objc_msgSend(v4, "controllerAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    controllerAttributes = v5->_controllerAttributes;
    v5->_controllerAttributes = (NSDictionary *)v14;

    objc_msgSend(v4, "songPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    songPath = v5->_songPath;
    v5->_songPath = (NSString *)v17;

    objc_msgSend(v4, "alertConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    alertConfiguration = v5->_alertConfiguration;
    v5->_alertConfiguration = (TLAlertConfiguration *)v20;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  unsigned int v7;
  unint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  char v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
LABEL_15:
      v27 = 0;
      goto LABEL_16;
    }
  }
  v5 = v4;
  if (!v5)
    goto LABEL_15;
  v6 = -[NCNotificationSound soundType](self, "soundType");
  if (v6 != objc_msgSend(v5, "soundType"))
    goto LABEL_15;
  v7 = -[NCNotificationSound systemSoundID](self, "systemSoundID");
  if (v7 != objc_msgSend(v5, "systemSoundID"))
    goto LABEL_15;
  v8 = -[NCNotificationSound soundBehavior](self, "soundBehavior");
  if (v8 != objc_msgSend(v5, "soundBehavior"))
    goto LABEL_15;
  -[NCNotificationSound ringtoneName](self, "ringtoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ringtoneName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = NCIsEqual(v9, v10);

  if (!v11)
    goto LABEL_15;
  -[NCNotificationSound vibrationPattern](self, "vibrationPattern");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vibrationPattern");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = NCIsEqual(v12, v13);

  if (!v14)
    goto LABEL_15;
  v15 = -[NCNotificationSound isRepeating](self, "isRepeating");
  if (v15 != objc_msgSend(v5, "isRepeating"))
    goto LABEL_15;
  -[NCNotificationSound maxDuration](self, "maxDuration");
  v17 = v16;
  objc_msgSend(v5, "maxDuration");
  if (v17 != v18)
    goto LABEL_15;
  -[NCNotificationSound controllerAttributes](self, "controllerAttributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controllerAttributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = NCIsEqual(v19, v20);

  if (!v21)
    goto LABEL_15;
  -[NCNotificationSound songPath](self, "songPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "songPath");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = NCIsEqual(v22, v23);

  if (!v24)
    goto LABEL_15;
  -[NCNotificationSound alertConfiguration](self, "alertConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertConfiguration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = NCIsEqual(v25, v26);

LABEL_16:
  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_ringtoneName, "hash");
  v4 = -[NSDictionary hash](self->_vibrationPattern, "hash") + v3;
  v5 = -[NSDictionary hash](self->_controllerAttributes, "hash");
  v6 = v4 + v5 + -[TLAlertConfiguration hash](self->_alertConfiguration, "hash");
  return v6 + -[NSString hash](self->_songPath, "hash");
}

- (NSString)debugDescription
{
  return (NSString *)-[NCNotificationSound descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NCNotificationSound initWithNotificationSound:]([NCMutableNotificationSound alloc], "initWithNotificationSound:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[NCNotificationSound descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  NCNotificationSound *v12;

  v4 = (void *)MEMORY[0x24BE0BE08];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__NCNotificationSound_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_24D270158;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

void __61__NCNotificationSound_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "soundType"), CFSTR("soundType"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "systemSoundID"), CFSTR("systemSoundID"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "soundBehavior"), CFSTR("soundBehavior"));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "ringtoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v6, CFSTR("ringtoneName"), 1);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "vibrationPattern");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendDictionarySection:withName:skipIfEmpty:", v9, CFSTR("vibrationPattern"), 1);

  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isRepeating"), CFSTR("isRepeating"));
  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "maxDuration");
  v12 = (id)objc_msgSend(v11, "appendTimeInterval:withName:decomposeUnits:", CFSTR("maxDuration"), 0);
  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "controllerAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendDictionarySection:withName:skipIfEmpty:", v14, CFSTR("controllerAttributes"), 1);

  v15 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alertConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v15, "appendObject:withName:skipIfNil:", v16, CFSTR("alertConfiguration"), 1);

  v18 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "songPath");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "appendObject:withName:skipIfNil:", v20, CFSTR("songPath"), 1);

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[NCNotificationSound succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), -[NCNotificationSound soundType](self, "soundType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("soundType"));

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), -[NCNotificationSound systemSoundID](self, "systemSoundID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("systemSoundID"), 1);

  -[NCNotificationSound ringtoneName](self, "ringtoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v8, CFSTR("ringtoneName"), 1);

  -[NCNotificationSound alertConfiguration](self, "alertConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v10, CFSTR("alertConfiguration"), 1);

  -[NCNotificationSound songPath](self, "songPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v12, CFSTR("songPath"), 1);

  return v3;
}

- (int64_t)soundType
{
  return self->_soundType;
}

- (unsigned)systemSoundID
{
  return self->_systemSoundID;
}

- (unint64_t)soundBehavior
{
  return self->_soundBehavior;
}

- (NSString)ringtoneName
{
  return self->_ringtoneName;
}

- (NSDictionary)vibrationPattern
{
  return self->_vibrationPattern;
}

- (BOOL)isRepeating
{
  return self->_repeats;
}

- (double)maxDuration
{
  return self->_maxDuration;
}

- (NSDictionary)controllerAttributes
{
  return self->_controllerAttributes;
}

- (NSString)songPath
{
  return self->_songPath;
}

- (TLAlertConfiguration)alertConfiguration
{
  return self->_alertConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertConfiguration, 0);
  objc_storeStrong((id *)&self->_songPath, 0);
  objc_storeStrong((id *)&self->_controllerAttributes, 0);
  objc_storeStrong((id *)&self->_vibrationPattern, 0);
  objc_storeStrong((id *)&self->_ringtoneName, 0);
}

@end
