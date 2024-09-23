@implementation SXOfferUpsellScenarioConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "offerUpsellScenario") != 1)
  {
    if (objc_msgSend(v5, "offerUpsellScenario"))
    {
      if (objc_msgSend(v5, "offerUpsellScenario") == 4)
      {
        if (objc_msgSend(v6, "offerUpsellScenario") == 5
          || objc_msgSend(v6, "offerUpsellScenario") == 6
          || objc_msgSend(v6, "offerUpsellScenario") == 9
          || objc_msgSend(v6, "offerUpsellScenario") == 8)
        {
          goto LABEL_9;
        }
        v8 = objc_msgSend(v6, "offerUpsellScenario");
        v9 = 7;
      }
      else
      {
        v8 = objc_msgSend(v5, "offerUpsellScenario");
        v9 = objc_msgSend(v6, "offerUpsellScenario");
      }
      v7 = v8 == v9;
      goto LABEL_12;
    }
LABEL_9:
    v7 = 1;
    goto LABEL_12;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

@end
