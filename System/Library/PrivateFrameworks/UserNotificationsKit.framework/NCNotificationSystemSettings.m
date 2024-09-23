@implementation NCNotificationSystemSettings

- (NCNotificationSystemSettings)initWithNotificationSystemSettings:(id)a3
{
  id v4;
  NCNotificationSystemSettings *v5;
  void *v6;
  uint64_t v7;
  NSArray *scheduledDeliveryTimes;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationSystemSettings;
  v5 = -[NCNotificationSystemSettings init](&v10, sel_init);
  if (v5)
  {
    v5->_scheduledDeliveryEnabled = objc_msgSend(v4, "isScheduledDeliveryEnabled");
    v5->_scheduledDeliveryUninitialized = objc_msgSend(v4, "isScheduledDeliveryUninitialized");
    v5->_scheduledDeliveryShowNextSummary = objc_msgSend(v4, "shouldScheduledDeliveryShowNextSummary");
    objc_msgSend(v4, "scheduledDeliveryTimes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    scheduledDeliveryTimes = v5->_scheduledDeliveryTimes;
    v5->_scheduledDeliveryTimes = (NSArray *)v7;

    v5->_listDisplayStyleSetting = objc_msgSend(v4, "listDisplayStyleSetting");
    v5->_summarizationEnabled = objc_msgSend(v4, "isSummarizationEnabled");
    v5->_highlightsEnabled = objc_msgSend(v4, "areHighlightsEnabled");
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  int64_t v13;
  int v14;
  int v15;
  _BOOL4 v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_11;
  v7 = -[NCNotificationSystemSettings isScheduledDeliveryEnabled](self, "isScheduledDeliveryEnabled");
  if (v7 != objc_msgSend(v6, "isScheduledDeliveryEnabled"))
    goto LABEL_11;
  v8 = -[NCNotificationSystemSettings isScheduledDeliveryUninitialized](self, "isScheduledDeliveryUninitialized");
  if (v8 != objc_msgSend(v6, "isScheduledDeliveryUninitialized"))
    goto LABEL_11;
  v9 = -[NCNotificationSystemSettings shouldScheduledDeliveryShowNextSummary](self, "shouldScheduledDeliveryShowNextSummary");
  if (v9 != objc_msgSend(v6, "shouldScheduledDeliveryShowNextSummary"))
    goto LABEL_11;
  -[NCNotificationSystemSettings scheduledDeliveryTimes](self, "scheduledDeliveryTimes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduledDeliveryTimes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToArray:", v11);

  if (!v12)
    goto LABEL_11;
  v13 = -[NCNotificationSystemSettings listDisplayStyleSetting](self, "listDisplayStyleSetting");
  if (v13 == objc_msgSend(v6, "listDisplayStyleSetting")
    && (v14 = -[NCNotificationSystemSettings isSummarizationEnabled](self, "isSummarizationEnabled"),
        v14 == objc_msgSend(v6, "isSummarizationEnabled")))
  {
    v17 = -[NCNotificationSystemSettings areHighlightsEnabled](self, "areHighlightsEnabled");
    v15 = v17 ^ objc_msgSend(v6, "areHighlightsEnabled") ^ 1;
  }
  else
  {
LABEL_11:
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_scheduledDeliveryUninitialized
     + (unint64_t)self->_scheduledDeliveryEnabled
     + self->_scheduledDeliveryShowNextSummary;
  return -[NSArray hash](self->_scheduledDeliveryTimes, "hash")
       + self->_listDisplayStyleSetting
       + v2
       + self->_summarizationEnabled
       + (unint64_t)self->_highlightsEnabled;
}

- (NSString)debugDescription
{
  return (NSString *)-[NCNotificationSystemSettings descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NCNotificationSystemSettings initWithNotificationSystemSettings:]([NCNotificationMutableSystemSettings alloc], "initWithNotificationSystemSettings:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[NCNotificationSystemSettings descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  NCNotificationSystemSettings *v12;

  v4 = (void *)MEMORY[0x24BE0BE08];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__NCNotificationSystemSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_24D270158;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

id __70__NCNotificationSystemSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
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

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isScheduledDeliveryEnabled"), CFSTR("scheduledDeliveryEnabled"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isScheduledDeliveryUninitialized"), CFSTR("scheduledDeliveryUninitialized"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "shouldScheduledDeliveryShowNextSummary"), CFSTR("scheduledDeliveryShowNextSummary"));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "scheduledDeliveryTimes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v6, CFSTR("scheduledDeliveryTimes"), 1);

  v8 = *(void **)(a1 + 32);
  +[NCNotificationSystemSettings stringForNotificationListDisplayStyleSetting:](NCNotificationSystemSettings, "stringForNotificationListDisplayStyleSetting:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:", v9, CFSTR("listDisplayStyle"));

  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSummarizationEnabled"), CFSTR("summarizationEnabled"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "areHighlightsEnabled"), CFSTR("highlightsEnabled"));
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[NCNotificationSystemSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[NCNotificationSystemSettings isScheduledDeliveryEnabled](self, "isScheduledDeliveryEnabled"), CFSTR("scheduledDeliveryEnabled"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[NCNotificationSystemSettings isScheduledDeliveryUninitialized](self, "isScheduledDeliveryUninitialized"), CFSTR("scheduledDeliveryUninitialized"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[NCNotificationSystemSettings shouldScheduledDeliveryShowNextSummary](self, "shouldScheduledDeliveryShowNextSummary"), CFSTR("scheduledDeliveryShowNextSummary"));
  -[NCNotificationSystemSettings scheduledDeliveryTimes](self, "scheduledDeliveryTimes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v7, CFSTR("scheduledDeliveryTimes"), 1);

  +[NCNotificationSystemSettings stringForNotificationListDisplayStyleSetting:](NCNotificationSystemSettings, "stringForNotificationListDisplayStyleSetting:", self->_listDisplayStyleSetting);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("listDisplayStyle"));

  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[NCNotificationSystemSettings isSummarizationEnabled](self, "isSummarizationEnabled"), CFSTR("summarizationEnabled"));
  v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[NCNotificationSystemSettings areHighlightsEnabled](self, "areHighlightsEnabled"), CFSTR("highlightsEnabled"));
  return v3;
}

+ (id)stringForNotificationListDisplayStyleSetting:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("<unknown>");
  else
    return off_24D270178[a3];
}

- (BOOL)isScheduledDeliveryEnabled
{
  return self->_scheduledDeliveryEnabled;
}

- (BOOL)isScheduledDeliveryUninitialized
{
  return self->_scheduledDeliveryUninitialized;
}

- (BOOL)shouldScheduledDeliveryShowNextSummary
{
  return self->_scheduledDeliveryShowNextSummary;
}

- (NSArray)scheduledDeliveryTimes
{
  return self->_scheduledDeliveryTimes;
}

- (int64_t)listDisplayStyleSetting
{
  return self->_listDisplayStyleSetting;
}

- (BOOL)isSummarizationEnabled
{
  return self->_summarizationEnabled;
}

- (BOOL)areHighlightsEnabled
{
  return self->_highlightsEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledDeliveryTimes, 0);
}

@end
