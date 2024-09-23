@implementation RETextContentProvider

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)contentProviderFromClockKitTextProvider:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  REClockKitWrappedContentProvider *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v19;

  v3 = a3;
  if (!v3)
  {
    v8 = 0;
    goto LABEL_18;
  }
  getCLKDateTextProviderClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "calendarUnits");
    objc_msgSend(v4, "timeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[REDateContentProvider dateContentProviderWithDate:units:timeZone:](REDateContentProvider, "dateContentProviderWithDate:units:timeZone:", v5, v6, v7);
    v8 = (REClockKitWrappedContentProvider *)objc_claimAutoreleasedReturnValue();

LABEL_17:
    goto LABEL_18;
  }
  getCLKRelativeDateTextProviderClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v3;
    v10 = objc_msgSend(v9, "relativeDateStyle");
    if ((unint64_t)(v10 - 1) > 3)
      v11 = 0;
    else
      v11 = qword_2133E4610[v10 - 1];
    objc_msgSend(v9, "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[RERelativeDateContentProvider relativeDateContentProviderWithDate:style:units:](RERelativeDateContentProvider, "relativeDateContentProviderWithDate:style:units:", v13, v11, objc_msgSend(v9, "calendarUnits"));
    v8 = (REClockKitWrappedContentProvider *)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  getCLKSimpleTextProviderClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v3;
    objc_msgSend(v12, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[RESimpleTextContentProvider textContentProviderWithText:](RESimpleTextContentProvider, "textContentProviderWithText:", v5);
    v8 = (REClockKitWrappedContentProvider *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  getCLKTimeIntervalTextProviderClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v3;
    objc_msgSend(v14, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[RETimeIntervalContentProvider timeIntervalContentProviderWithStartDate:endDate:timeZone:](RETimeIntervalContentProvider, "timeIntervalContentProviderWithStartDate:endDate:timeZone:", v5, v15, v16);
    v8 = (REClockKitWrappedContentProvider *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    goto LABEL_17;
  }
  getCLKTimeTextProviderClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v3;
    objc_msgSend(v17, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[RETimeContentProvider timeContentProviderWithDate:timeZone:](RETimeContentProvider, "timeContentProviderWithDate:timeZone:", v5, v15);
    v8 = (REClockKitWrappedContentProvider *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  RELogForDomain(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    +[RETextContentProvider contentProviderFromClockKitTextProvider:].cold.1((uint64_t)v3, v19);

  v8 = -[REClockKitWrappedContentProvider initWithClockKitTextProvider:]([REClockKitWrappedContentProvider alloc], "initWithClockKitTextProvider:", v3);
LABEL_18:

  return v8;
}

+ (id)contentProviderFromAttributedString:(id)a3
{
  if (!a3)
    return 0;
  +[REAttributedTextContentProvider textContentProviderWithAttributedText:](REAttributedTextContentProvider, "textContentProviderWithAttributedText:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)contentEncodedString
{
  return (NSString *)&stru_24CF92178;
}

- (id)attributedStringRepresentation
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1();
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", &stru_24CF92178);
}

- (id)clockKitTextProviderRepresentation
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1();
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (void)encodeWithCoder:(id)a3
{
  OUTLINED_FUNCTION_0_2();
  NSRequestConcreteImplementation();
}

- (RETextContentProvider)initWithCoder:(id)a3
{
  void *v3;
  RETextContentProvider *v4;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1();
  v4 = (RETextContentProvider *)objc_alloc_init((Class)objc_opt_class());

  return v4;
}

+ (void)contentProviderFromClockKitTextProvider:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v4;
  int v5;
  id v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = 138412546;
  v6 = (id)objc_opt_class();
  v7 = 2112;
  v8 = a1;
  v4 = v6;
  _os_log_error_impl(&dword_2132F7000, a2, OS_LOG_TYPE_ERROR, "WARNING: Unknown provider of class %@: %@", (uint8_t *)&v5, 0x16u);

}

@end
