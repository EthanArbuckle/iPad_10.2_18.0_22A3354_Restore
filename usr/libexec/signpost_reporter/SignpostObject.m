@implementation SignpostObject

- (id)signpostType
{
  return CFSTR("SignpostObject");
}

- (id)coreAnalyticsPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject subsystem](self, "subsystem"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Subsystem"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject category](self, "category"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Category"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject name](self, "name"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject name](self, "name"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Name"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("Name"));
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject string1Name](self, "string1Name"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject string1Name](self, "string1Name"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("String1Name"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject string1Value](self, "string1Value"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("String1Value"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject string2Name](self, "string2Name"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject string2Name](self, "string2Name"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("String2Name"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject string2Value](self, "string2Value"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("String2Value"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject number1Name](self, "number1Name"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject number1Name](self, "number1Name"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("Number1Name"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject number1Value](self, "number1Value"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("Number1Value"));

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject number2Name](self, "number2Name"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject number2Name](self, "number2Name"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("Number2Name"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject number2Value](self, "number2Value"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("Number2Value"));

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject signpostType](self, "signpostType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("IntervalType"));

  -[SignpostObject durationSeconds](self, "durationSeconds");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("DurationInSeconds"));

  return v3;
}

@end
