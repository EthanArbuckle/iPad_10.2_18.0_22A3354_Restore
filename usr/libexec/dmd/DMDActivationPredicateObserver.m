@implementation DMDActivationPredicateObserver

- (DMDActivationPredicateObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 predicate:(id)a5
{
  id v8;
  id v9;
  id v10;
  DMDActivationPredicateObserver *v11;
  DMDActivationPredicateObserver *v12;
  void *v13;
  NSString *v14;
  NSString *predicateType;
  NSString *v16;
  NSString *uniqueIdentifier;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DMDActivationPredicateObserver;
  v11 = -[DMDActivationPredicateObserver init](&v19, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    v12->_lastPredicateEvaluationValue = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "payloadType"));
    v14 = (NSString *)objc_msgSend(v13, "copy");
    predicateType = v12->_predicateType;
    v12->_predicateType = v14;

    v16 = (NSString *)objc_msgSend(v9, "copy");
    uniqueIdentifier = v12->_uniqueIdentifier;
    v12->_uniqueIdentifier = v16;

  }
  return v12;
}

- (id)evaluatePredicateWithError:(id *)a3
{
  return 0;
}

- (void)invalidate
{
  -[DMDActivationPredicateObserver setDelegate:](self, "setDelegate:", 0);
}

- (id)metadata
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[2];
  _QWORD v9[2];

  v8[0] = DMFDeclarationStatePredicateTypeKey;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
  v9[0] = v3;
  v8[1] = DMFDeclarationStatePredicateLastEvaluationValueKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue")));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  v6 = objc_msgSend(v5, "mutableCopy");

  return v6;
}

- (void)reportActivationPredicateObserverDidTrigger
{
  void *v3;
  _QWORD v4[4];
  id v5;
  DMDActivationPredicateObserver *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "activationPredicateObserverDidTrigger:") & 1) != 0)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000FF84;
    v4[3] = &unk_1000B9BA8;
    v5 = v3;
    v6 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

  }
}

- (id)calendarForIdentifier:(id)a3
{
  id v3;
  NSString *v4;
  id *v5;
  NSString *v6;
  void *v7;

  v3 = a3;
  v4 = NSCalendarIdentifierGregorian;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("buddhist")) & 1) != 0)
  {
    v5 = (id *)&NSCalendarIdentifierBuddhist;
LABEL_32:
    v6 = (NSString *)*v5;

    v4 = v6;
    goto LABEL_33;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("chinese")) & 1) != 0)
  {
    v5 = (id *)&NSCalendarIdentifierChinese;
    goto LABEL_32;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("coptic")) & 1) != 0)
  {
    v5 = (id *)&NSCalendarIdentifierCoptic;
    goto LABEL_32;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ethiopic-amete-alem")) & 1) != 0)
  {
    v5 = (id *)&NSCalendarIdentifierEthiopicAmeteAlem;
    goto LABEL_32;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ethiopic-amete-mihret")) & 1) != 0)
  {
    v5 = (id *)&NSCalendarIdentifierEthiopicAmeteMihret;
    goto LABEL_32;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("gregorian")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("hebrew")) & 1) != 0)
    {
      v5 = (id *)&NSCalendarIdentifierHebrew;
      goto LABEL_32;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("indian")) & 1) != 0)
    {
      v5 = (id *)&NSCalendarIdentifierIndian;
      goto LABEL_32;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("islamic")) & 1) != 0)
    {
      v5 = (id *)&NSCalendarIdentifierIslamic;
      goto LABEL_32;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("islamic-civil")) & 1) != 0)
    {
      v5 = (id *)&NSCalendarIdentifierIslamicCivil;
      goto LABEL_32;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("islamic-tbla")) & 1) != 0)
    {
      v5 = (id *)&NSCalendarIdentifierIslamicTabular;
      goto LABEL_32;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("islamic-umalqura")) & 1) != 0)
    {
      v5 = (id *)&NSCalendarIdentifierIslamicUmmAlQura;
      goto LABEL_32;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iso8601")) & 1) != 0)
    {
      v5 = (id *)&NSCalendarIdentifierISO8601;
      goto LABEL_32;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("japanese")) & 1) != 0)
    {
      v5 = (id *)&NSCalendarIdentifierJapanese;
      goto LABEL_32;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("persian")) & 1) != 0)
    {
      v5 = (id *)&NSCalendarIdentifierPersian;
      goto LABEL_32;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("roc")))
    {
      v5 = (id *)&NSCalendarIdentifierRepublicOfChina;
      goto LABEL_32;
    }
  }
LABEL_33:
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", v4));

  return v7;
}

- (DMDActivationPredicateObserverDelegate)delegate
{
  return (DMDActivationPredicateObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)lastPredicateEvaluationValue
{
  return self->_lastPredicateEvaluationValue;
}

- (void)setLastPredicateEvaluationValue:(BOOL)a3
{
  self->_lastPredicateEvaluationValue = a3;
}

- (NSString)predicateType
{
  return self->_predicateType;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_predicateType, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
