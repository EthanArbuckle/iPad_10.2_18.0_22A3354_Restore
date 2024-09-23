@implementation NCNotificationSummaryBuilder

- (NCNotificationSummaryBuilder)init
{
  return -[NCNotificationSummaryBuilder initWithStyle:](self, "initWithStyle:", 0);
}

- (NCNotificationSummaryBuilder)initWithStyle:(unint64_t)a3
{
  NCNotificationSummaryBuilder *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSummaryBuilder;
  result = -[NCNotificationSummaryBuilder init](&v5, sel_init);
  if (result)
    result->_style = a3;
  return result;
}

- (void)updateWithNotificationRequests:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *notificationRequests;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *formatStrings;
  NSMutableDictionary *v9;
  NSMutableDictionary *formatStringsCounts;
  NSMutableOrderedSet *v11;
  NSMutableOrderedSet *arguments;
  NSMutableDictionary *v13;
  NSMutableDictionary *argumentsCounts;
  NSString *summaryText;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NCNotificationRequest *leadingNotificationRequest;
  NCNotificationRequest *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSMutableArray *)objc_opt_new();
  notificationRequests = self->_notificationRequests;
  self->_notificationRequests = v5;

  v7 = (NSMutableOrderedSet *)objc_opt_new();
  formatStrings = self->_formatStrings;
  self->_formatStrings = v7;

  v9 = (NSMutableDictionary *)objc_opt_new();
  formatStringsCounts = self->_formatStringsCounts;
  self->_formatStringsCounts = v9;

  v11 = (NSMutableOrderedSet *)objc_opt_new();
  arguments = self->_arguments;
  self->_arguments = v11;

  v13 = (NSMutableDictionary *)objc_opt_new();
  argumentsCounts = self->_argumentsCounts;
  self->_argumentsCounts = v13;

  self->_defaultFormatsCount = 0;
  self->_emptyArgumentsCount = 0;
  summaryText = self->_summaryText;
  self->_summaryText = 0;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = v4;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        -[NCNotificationSummaryBuilder _addNotificationRequest:](self, "_addNotificationRequest:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20++), (_QWORD)v23);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }

  if (-[NCNotificationSummaryBuilder _includeLeadingNotificationRequest](self, "_includeLeadingNotificationRequest"))
  {
    leadingNotificationRequest = self->_leadingNotificationRequest;
    self->_leadingNotificationRequest = 0;
  }
  else
  {
    objc_msgSend(v16, "firstObject");
    v22 = (NCNotificationRequest *)objc_claimAutoreleasedReturnValue();
    leadingNotificationRequest = self->_leadingNotificationRequest;
    self->_leadingNotificationRequest = v22;
  }

  -[NCNotificationSummaryBuilder _updateSummaryText](self, "_updateSummaryText");
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  NCNotificationSummaryBuilder *v14;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSummaryBuilder summaryText](self, "summaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("summaryText"));

  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMutableArray count](self->_notificationRequests, "count"), CFSTR("notificationRequests"));
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __43__NCNotificationSummaryBuilder_description__block_invoke;
  v12 = &unk_1E8D1B3A0;
  v13 = v3;
  v14 = self;
  v6 = v3;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, &v9);
  objc_msgSend(v6, "build", v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __43__NCNotificationSummaryBuilder_description__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendArraySection:withName:skipIfEmpty:", v5, CFSTR("formatStrings"), 0);

  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v7, "count"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectsAtIndexes:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendArraySection:withName:skipIfEmpty:", v8, CFSTR("arguments"), 0);

}

- (void)_addNotificationRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NSMutableArray addObject:](self->_notificationRequests, "addObject:", v8);
  objc_msgSend(v8, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categorySummaryFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
    ++self->_defaultFormatsCount;
  -[NCNotificationSummaryBuilder _insertString:intoSequence:withCounters:](self, "_insertString:intoSequence:withCounters:", v5, self->_formatStrings, self->_formatStringsCounts);
  objc_msgSend(v8, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "summaryArgument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "length"))
    ++self->_emptyArgumentsCount;
  -[NCNotificationSummaryBuilder _insertString:intoSequence:withCounters:](self, "_insertString:intoSequence:withCounters:", v7, self->_arguments, self->_argumentsCounts);

}

- (void)_updateSummaryText
{
  NSString *v3;
  NSString *summaryText;

  -[NCNotificationSummaryBuilder _buildSummaryText](self, "_buildSummaryText");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  summaryText = self->_summaryText;
  self->_summaryText = v3;

}

- (id)_buildSummaryText
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSMutableOrderedSet *formatStrings;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = -[NCNotificationSummaryBuilder _summaryNotificationsCount](self, "_summaryNotificationsCount");
  if (v3)
  {
    v4 = v3;
    v5 = self->_defaultFormatsCount + -[NSMutableOrderedSet count](self->_formatStrings, "count");
    formatStrings = self->_formatStrings;
    if (v5 == 1)
    {
      -[NSMutableOrderedSet firstObject](formatStrings, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationSummaryBuilder _localizedSummaryWithFormat:notificationsCount:arguments:](self, "_localizedSummaryWithFormat:notificationsCount:arguments:", v7, v4, self->_arguments);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (self->_defaultFormatsCount + -[NSMutableOrderedSet count](formatStrings, "count") < 2
        || -[NSMutableDictionary count](self->_argumentsCounts, "count"))
      {
        if (-[NSMutableOrderedSet count](self->_arguments, "count") && !self->_emptyArgumentsCount)
        {
          -[NCNotificationSummaryBuilder _defaultLocalizedSummaryWithNotificationsCount:arguments:](self, "_defaultLocalizedSummaryWithNotificationsCount:arguments:", v4, self->_arguments);
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[NCNotificationSummaryBuilder _defaultLocalizedSummaryWithNotificationsCount:](self, "_defaultLocalizedSummaryWithNotificationsCount:", v4);
          v9 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        -[NCNotificationSummaryBuilder _localizedSummaryWithFormats:andCounts:](self, "_localizedSummaryWithFormats:andCounts:", self->_formatStrings, self->_formatStringsCounts);
        v9 = objc_claimAutoreleasedReturnValue();
      }
      v8 = (void *)v9;
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)_includeLeadingNotificationRequest
{
  return self->_style != 0;
}

- (unint64_t)_summaryNotificationsCount
{
  NSMutableArray *notificationRequests;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  notificationRequests = self->_notificationRequests;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__NCNotificationSummaryBuilder__summaryNotificationsCount__block_invoke;
  v5[3] = &unk_1E8D1E050;
  v5[4] = self;
  v5[5] = &v6;
  -[NSMutableArray bs_each:](notificationRequests, "bs_each:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __58__NCNotificationSummaryBuilder__summaryNotificationsCount__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  uint64_t v5;

  if (*(void **)(*(_QWORD *)(a1 + 32) + 8) != a2)
  {
    objc_msgSend(a2, "content");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "summaryArgumentCount");

    if (v4 <= 1)
      v5 = 1;
    else
      v5 = v4;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v5;
  }
}

- (id)_defaultLocalizedSummaryWithNotificationsCount:(unint64_t)a3
{
  unint64_t style;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  style = self->_style;
  if (style == 1)
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("DEFAULT_PRIORITY_CATEGORY_SUMMARY_FORMAT");
  }
  else
  {
    if (style)
    {
      v9 = 0;
      goto LABEL_7;
    }
    NCUserNotificationsUIKitFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("DEFAULT_CATEGORY_SUMMARY_FORMAT");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E8D21F60, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  -[NCNotificationSummaryBuilder _localizedSummaryWithFormat:notificationsCount:arguments:](self, "_localizedSummaryWithFormat:notificationsCount:arguments:", v9, a3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_defaultLocalizedSummaryWithNotificationsCount:(unint64_t)a3 arguments:(id)a4
{
  id v6;
  unint64_t style;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v6 = a4;
  style = self->_style;
  if (style == 1)
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("DEFAULT_PRIORITY_CATEGORY_SUMMARY_FORMAT_WITH_ARGUMENTS");
  }
  else
  {
    if (style)
    {
      v11 = 0;
      goto LABEL_7;
    }
    NCUserNotificationsUIKitFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("DEFAULT_CATEGORY_SUMMARY_FORMAT_WITH_ARGUMENTS");
  }
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E8D21F60, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  -[NCNotificationSummaryBuilder _localizedSummaryWithFormat:notificationsCount:arguments:](self, "_localizedSummaryWithFormat:notificationsCount:arguments:", v11, a3, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_localizedSummaryWithFormats:(id)a3 andCounts:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unint64_t defaultFormatsCount;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "unsignedIntegerValue");

        if (!-[NCNotificationSummaryBuilder _includeLeadingNotificationRequest](self, "_includeLeadingNotificationRequest"))
        {
          -[NCNotificationRequest content](self->_leadingNotificationRequest, "content");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "categorySummaryFormat");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v12, "isEqualToString:", v16);

          v14 -= v17;
        }
        if (v14)
        {
          -[NCNotificationSummaryBuilder _localizedSummaryWithFormat:notificationsCount:arguments:](self, "_localizedSummaryWithFormat:notificationsCount:arguments:", v12, v14, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v18);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v9);
  }

  defaultFormatsCount = self->_defaultFormatsCount;
  if (defaultFormatsCount)
  {
    if (!-[NCNotificationSummaryBuilder _includeLeadingNotificationRequest](self, "_includeLeadingNotificationRequest"))
    {
      -[NCNotificationRequest content](self->_leadingNotificationRequest, "content");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "categorySummaryFormat");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length") == 0;

      defaultFormatsCount -= v22;
    }
    -[NCNotificationSummaryBuilder _defaultLocalizedSummaryWithNotificationsCount:](self, "_defaultLocalizedSummaryWithNotificationsCount:", defaultFormatsCount);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v23);

  }
  -[NCNotificationSummaryBuilder _formatListWithArguments:](self, "_formatListWithArguments:", v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_localizedSummaryWithFormat:(id)a3 notificationsCount:(unint64_t)a4 arguments:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v42;
  uint8_t buf[16];
  id v44;
  id v45;

  v8 = a3;
  v9 = a5;
  if (!v8)
  {
    v12 = 0;
    v10 = 0;
    goto LABEL_9;
  }
  v45 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%u"), &v45, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v45;
  v12 = v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 0;
  v14 = v10;
  if (!v13)
  {
LABEL_9:
    if (objc_msgSend(v9, "count") && self->_emptyArgumentsCount)
    {
      v15 = *MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CFC3D000, v15, OS_LOG_TYPE_INFO, "Ignoring category format because the group contains mixed notifications with and without arguments", buf, 2u);
      }
      -[NCNotificationSummaryBuilder _defaultLocalizedSummaryWithNotificationsCount:](self, "_defaultLocalizedSummaryWithNotificationsCount:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    -[NCNotificationSummaryBuilder _filteredArgumentsArrayWithArguments:](self, "_filteredArgumentsArrayWithArguments:", v9);
    v16 = objc_claimAutoreleasedReturnValue();
    -[NCNotificationSummaryBuilder _formatListWithArguments:](self, "_formatListWithArguments:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v44 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%u%@"), &v44, a4, v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v44;

      if (!v14)
        goto LABEL_23;
    }
    else
    {
      v18 = 0;
      v14 = v10;
      if (!v10)
        goto LABEL_23;
    }
    if (!v18)
    {
      if (!objc_msgSend(v9, "count"))
      {
        v19 = *MEMORY[0x1E0DC5F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
          -[NCNotificationSummaryBuilder _localizedSummaryWithFormat:notificationsCount:arguments:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);
        -[NCNotificationSummaryBuilder _defaultLocalizedSummaryWithNotificationsCount:](self, "_defaultLocalizedSummaryWithNotificationsCount:", a4);
        v27 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v17;
        v12 = (void *)v16;
        v14 = (void *)v27;
        goto LABEL_36;
      }
      goto LABEL_35;
    }
LABEL_23:
    *(_QWORD *)buf = 0;
    -[NCNotificationSummaryBuilder _formatListWithArguments:truncated:truncatedArgumentsCount:](self, "_formatListWithArguments:truncated:truncatedArgumentsCount:", v16, 1, buf);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v42 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%u%@%u"), &v42, a4, v28, *(_QWORD *)buf);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v42;

      v14 = (void *)v29;
      if (!v29)
        goto LABEL_31;
    }
    else
    {
      v30 = 0;
      if (!v14)
        goto LABEL_31;
    }
    if (!v30)
    {
      if (objc_msgSend(v9, "count"))
      {
LABEL_34:

LABEL_35:
        v10 = (void *)v17;
        v12 = (void *)v16;
LABEL_36:

        goto LABEL_37;
      }
      v31 = *MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
        -[NCNotificationSummaryBuilder _localizedSummaryWithFormat:notificationsCount:arguments:].cold.2(v31, v32, v33, v34, v35, v36, v37, v38);
LABEL_33:
      -[NCNotificationSummaryBuilder _defaultLocalizedSummaryWithNotificationsCount:](self, "_defaultLocalizedSummaryWithNotificationsCount:", a4);
      v40 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v40;
      goto LABEL_34;
    }
LABEL_31:
    v39 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
      -[NCNotificationSummaryBuilder _localizedSummaryWithFormat:notificationsCount:arguments:].cold.1((uint64_t)v8, v39, v30);
    goto LABEL_33;
  }
LABEL_37:

  return v14;
}

- (id)_formatListWithArguments:(id)a3
{
  return -[NCNotificationSummaryBuilder _formatListWithArguments:truncated:truncatedArgumentsCount:](self, "_formatListWithArguments:truncated:truncatedArgumentsCount:", a3, 0, 0);
}

- (id)_formatListWithArguments:(id)a3 truncated:(BOOL)a4 truncatedArgumentsCount:(unint64_t *)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[2];

  v6 = a4;
  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (a5)
    *a5 = 0;
  if (objc_msgSend(v7, "count"))
  {
    if (objc_msgSend(v8, "count") == 1)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v8, "count") == 2)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        NCUserNotificationsUIKitFrameworkBundle();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CATEGORY_SUMMARY_LIST_TWO_ELEMENTS_FORMAT"), &stru_1E8D21F60, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringWithFormat:", v12, v13, v14, 0);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (!v6 || (unint64_t)objc_msgSend(v8, "count") < 5)
        {
          objc_msgSend(v8, "lastObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = v18;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "arrayByExcludingObjectsInArray:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          NCUserNotificationsUIKitFrameworkBundle();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CATEGORY_SUMMARY_LIST_SEPARATOR"), &stru_1E8D21F60, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "componentsJoinedByString:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          NCUserNotificationsUIKitFrameworkBundle();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CATEGORY_SUMMARY_LIST_SEPARATOR_LAST_ELEMENT"), &stru_1E8D21F60, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringByAppendingFormat:", v25, v18);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
        objc_msgSend(v8, "subarrayWithRange:", 0, 3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (a5)
        {
          v15 = objc_msgSend(v8, "count");
          *a5 = v15 - objc_msgSend(v11, "count");
        }
        NCUserNotificationsUIKitFrameworkBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CATEGORY_SUMMARY_LIST_SEPARATOR"), &stru_1E8D21F60, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsJoinedByString:", v17);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    v9 = &stru_1E8D21F60;
  }
LABEL_16:

  return v9;
}

- (id)_filteredArgumentsArrayWithArguments:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v4 = (void *)MEMORY[0x1E0CB36B8];
  v5 = a3;
  objc_msgSend(v4, "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__NCNotificationSummaryBuilder__filteredArgumentsArrayWithArguments___block_invoke;
  v10[3] = &unk_1E8D1DF40;
  v10[4] = self;
  objc_msgSend(v7, "bs_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __69__NCNotificationSummaryBuilder__filteredArgumentsArrayWithArguments___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  objc_msgSend(v3, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summaryArgument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "integerValue");
  if (v9 == 1)
    return v7 ^ 1u;
  else
    return 1;
}

- (void)_insertString:(id)a3 intoSequence:(id)a4 withCounters:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v12, "length"))
  {
    if (objc_msgSend(v7, "containsObject:", v12))
      objc_msgSend(v7, "removeObject:", v12);
    objc_msgSend(v7, "addObject:", v12);
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, v12);

  }
}

- (unint64_t)style
{
  return self->_style;
}

- (NSString)summaryText
{
  return self->_summaryText;
}

- (NSArray)notificationRequests
{
  return &self->_notificationRequests->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryText, 0);
  objc_storeStrong((id *)&self->_argumentsCounts, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_formatStringsCounts, 0);
  objc_storeStrong((id *)&self->_formatStrings, 0);
  objc_storeStrong((id *)&self->_notificationRequests, 0);
  objc_storeStrong((id *)&self->_leadingNotificationRequest, 0);
}

- (void)_localizedSummaryWithFormat:(uint64_t)a1 notificationsCount:(void *)a2 arguments:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_ERROR, "Ignoring invalid category summary format: \"%{public}@\": %@", (uint8_t *)&v7, 0x16u);

}

- (void)_localizedSummaryWithFormat:(uint64_t)a3 notificationsCount:(uint64_t)a4 arguments:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1CFC3D000, a1, a3, "Ignoring category summary format because arguments were expected but none were provided", a5, a6, a7, a8, 0);
}

@end
