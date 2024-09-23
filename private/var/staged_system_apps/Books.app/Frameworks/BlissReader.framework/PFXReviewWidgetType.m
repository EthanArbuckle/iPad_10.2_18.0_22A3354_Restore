@implementation PFXReviewWidgetType

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4;
  id v5;
  const xmlChar *v6;
  THWPStorage *v7;

  v4 = objc_msgSend(a3, "currentHtmlStackEntry");
  v5 = objc_msgSend(v4, "currentEntryMediaState");
  v6 = (const xmlChar *)objc_msgSend(v4, "xmlValueForAttribute:", PFXWidgetConstantDataWidgetObjectType[0]);
  if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantReviewObjectValueReviewTitle[0])
    || xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantReviewObjectValueReviewText[0]))
  {
    v7 = -[THWPStorage initWithContext:string:stylesheet:kind:]([THWPStorage alloc], "initWithContext:string:stylesheet:kind:", objc_msgSend(a3, "tspContext"), &stru_43D7D8, objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), 3);
    objc_msgSend(v5, "setOverriddenStorage:", v7);

  }
  return 1;
}

- (void)mapAnswerAttributes:(id)a3 stackEntry:(id)a4 result:(id)a5 orientationState:(id)a6
{
  const xmlChar *v10;
  const char *v11;
  id v12;
  id v13;
  id v14;
  id v15;

  if (a4)
  {
    v10 = (const xmlChar *)objc_msgSend(a4, "xmlValueForAttribute:", PFXWidgetConstantReviewObjectAttributeTargetRegion[0]);
    if (!v10)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!a5 || !a6)
    goto LABEL_18;
  v10 = (const xmlChar *)objc_msgSend(objc_msgSend(a6, "xmlAttributeValueForResult:attributeName:", a5, PFXWidgetConstantReviewObjectAttributeTargetRegion[0]), "xmlString");
  if (v10)
LABEL_3:
    objc_msgSend(a3, "setTargetRegion:", PFXBezierPathWithSvgPath(v10));
LABEL_4:
  if (a4)
  {
    v11 = (const char *)objc_msgSend(a4, "xmlValueForAttribute:", PFXWidgetConstantReviewObjectAttributeAnswerGeometry[0]);
    if (!v11)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_18:
  if (!a5 || !a6)
    goto LABEL_22;
  v11 = (const char *)objc_msgSend(objc_msgSend(a6, "xmlAttributeValueForResult:attributeName:", a5, PFXWidgetConstantReviewObjectAttributeAnswerGeometry[0]), "xmlString");
  if (v11)
LABEL_6:
    objc_msgSend(a3, "setAnswerGeometry:", PFXTSDInfoGeometry(v11));
LABEL_7:
  if (a4)
  {
    v12 = objc_msgSend(a4, "valueForAttribute:", PFXWidgetConstantReviewObjectAttributeAnswerWeight[0]);
    if (!v12)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_22:
  if (!a5 || !a6)
    goto LABEL_26;
  v12 = objc_msgSend(objc_msgSend(a6, "xmlAttributeValueForResult:attributeName:", a5, PFXWidgetConstantReviewObjectAttributeAnswerWeight[0]), "nsString");
  if (v12)
  {
LABEL_9:
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(a3, "setAnswerWeight:");
  }
LABEL_10:
  if (a4)
  {
    v13 = objc_msgSend(a4, "valueForAttribute:", "title");
    if (!objc_msgSend(v13, "length"))
      v13 = objc_msgSend(a4, "valueForAttribute:", "alt");
    v14 = objc_msgSend(a4, "valueForAttribute:", PFXWidgetConstantDataAdditionalAlternate[0]);
LABEL_31:
    v15 = v14;
    goto LABEL_32;
  }
LABEL_26:
  v13 = 0;
  v15 = 0;
  if (a5 && a6)
  {
    v13 = objc_msgSend(objc_msgSend(a6, "xmlAttributeValueForResult:attributeName:", a5, "title"), "nsString");
    if (!objc_msgSend(v13, "length"))
      v13 = objc_msgSend(objc_msgSend(a6, "xmlAttributeValueForResult:attributeName:", a5, "alt"), "nsString");
    v14 = objc_msgSend(objc_msgSend(a6, "xmlAttributeValueForResult:attributeName:", a5, PFXWidgetConstantDataAdditionalAlternate[0]), "nsString");
    goto LABEL_31;
  }
LABEL_32:
  objc_msgSend(a3, "setAccessibilityDescription:", v13);
  objc_msgSend(a3, "setTargetAccessibilityDescription:", v15);
}

- (void)mapEndTextElementWithState:(id)a3
{
  id v4;
  id v5;
  const xmlChar *v6;
  id v7;
  PFXReviewWidgetText2 *v8;

  v4 = objc_msgSend(a3, "currentHtmlStackEntry");
  v5 = objc_msgSend(v4, "currentEntryMediaState");
  v6 = (const xmlChar *)objc_msgSend(v4, "xmlValueForAttribute:", PFXWidgetConstantDataWidgetObjectType[0]);
  v8 = objc_alloc_init(PFXReviewWidgetText2);
  -[PFXReviewWidgetText2 setTextStorage:](v8, "setTextStorage:", objc_msgSend(v5, "storage"));
  -[PFXReviewWidgetText2 setIsTitle:](v8, "setIsTitle:", xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantReviewObjectValueReviewTitle[0]) != 0);
  v7 = objc_msgSend(v4, "valueForAttribute:", PFXWidgetConstantDataGeometry[0]);
  if (v7)
    -[PFXReviewWidgetText2 setTextGeometry:](v8, "setTextGeometry:", PFXTSDInfoGeometry((const char *)objc_msgSend(v7, "UTF8String")));
  -[PFXReviewWidgetType mapAnswerAttributes:stackEntry:result:orientationState:](self, "mapAnswerAttributes:stackEntry:result:orientationState:", v8, v4, 0, 0);
  objc_msgSend(v5, "setResult:", v8);

}

- (int)mapContentRefPlacehment:(id)a3
{
  const xmlChar *v3;

  v3 = (const xmlChar *)objc_msgSend(a3, "xmlString");
  if (xmlStrEqual(v3, (const xmlChar *)"top"))
    return 1;
  if (xmlStrEqual(v3, (const xmlChar *)"bottom"))
    return 3;
  if (xmlStrEqual(v3, (const xmlChar *)"left"))
    return 4;
  return 2 * (xmlStrEqual(v3, (const xmlChar *)"right") != 0);
}

- (void)mapEndQuestionElementWithState:(id)a3
{
  id v4;
  id v5;
  const xmlChar *v6;
  const xmlChar *v7;
  uint64_t v8;
  id v9;
  char *v10;
  char *v11;
  char *i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  PFXReviewWidgetImageAnswer2 *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  PFXReviewWidgetQuestion2 *v23;

  v4 = objc_msgSend(a3, "currentHtmlStackEntry");
  v5 = objc_msgSend(v4, "currentEntryMediaState");
  v6 = (const xmlChar *)objc_msgSend(v4, "xmlValueForAttribute:", PFXWidgetConstantDataWidgetObjectType[0]);
  if (v6)
  {
    v7 = v6;
    if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantReviewObjectValueMultipleChoiceQuestion[0]))
    {
      v8 = 1;
    }
    else
    {
      if (!xmlStrEqual(v7, (const xmlChar *)PFXWidgetConstantReviewObjectValueAssociateQuestion[0]))
        return;
      v8 = 2;
    }
    v9 = objc_alloc_init((Class)NSMutableArray);
    v23 = objc_alloc_init(PFXReviewWidgetQuestion2);
    -[PFXReviewWidgetQuestion2 setAnswers:](v23, "setAnswers:", v9);
    -[PFXReviewWidgetQuestion2 setType:](v23, "setType:", v8);
    -[PFXReviewWidgetQuestion2 setTitleAccessibilityDescription:](v23, "setTitleAccessibilityDescription:", objc_msgSend(v4, "valueForAttribute:", "title"));
    v10 = (char *)objc_msgSend(v5, "childResultCount");
    if (v10)
    {
      v11 = v10;
      for (i = 0; i != v11; ++i)
      {
        v13 = objc_msgSend(v5, "childResultAtIndex:", i);
        v14 = objc_opt_class(TSDImageInfo);
        *(_QWORD *)&v16 = TSUDynamicCast(v14, v13).n128_u64[0];
        if (v15)
        {
          v17 = v15;
          if (objc_msgSend(v5, "xmlAttributeValueForResult:attributeName:", v15, PFXWidgetConstantDataWidgetObjectType[0], v16))
          {
            v18 = objc_alloc_init(PFXReviewWidgetImageAnswer2);
            -[PFXReviewWidgetImageAnswer2 setImageInfo:](v18, "setImageInfo:", v17);
            -[PFXReviewWidgetType mapAnswerAttributes:stackEntry:result:orientationState:](self, "mapAnswerAttributes:stackEntry:result:orientationState:", v18, 0, v17, v5);
            objc_msgSend(v9, "addObject:", v18);

          }
          else
          {
            v21 = objc_msgSend(v5, "xmlAttributeValueForResult:attributeName:", v17, PFXWidgetConstantReviewObjectAttributeDropAreaGeometry[0]);
            if (v21)
              -[PFXReviewWidgetQuestion2 setDropAreaGeometry:](v23, "setDropAreaGeometry:", PFXTSDInfoGeometry((const char *)objc_msgSend(v21, "xmlString")));
            v22 = objc_msgSend(v5, "xmlAttributeValueForResult:attributeName:", v17, PFXWidgetConstantReviewObjectAttributeQuestionAlign[0]);
            if (v22)
              -[PFXReviewWidgetQuestion2 setContentRefPlacement:](v23, "setContentRefPlacement:", -[PFXReviewWidgetType mapContentRefPlacehment:](self, "mapContentRefPlacehment:", v22));
            -[PFXReviewWidgetQuestion2 setImageInfo:](v23, "setImageInfo:", v13);
            -[PFXReviewWidgetQuestion2 setImageAccessibilityDescription:](v23, "setImageAccessibilityDescription:", objc_msgSend(objc_msgSend(v5, "xmlAttributeValueForResult:attributeName:", v17, "alt"), "nsString"));
          }
        }
        else
        {
          v19 = objc_opt_class(PFXReviewWidgetText2);
          if ((objc_opt_isKindOfClass(v13, v19) & 1) != 0 && objc_msgSend(v13, "isTitle"))
          {
            -[PFXReviewWidgetQuestion2 setTitle:](v23, "setTitle:", v13);
          }
          else
          {
            v20 = objc_opt_class(TSWPParagraphStyle);
            if ((objc_opt_isKindOfClass(v13, v20) & 1) != 0)
              -[PFXReviewWidgetQuestion2 setNumberParagraphStyle:](v23, "setNumberParagraphStyle:", v13);
            else
              objc_msgSend(v9, "addObject:", v13);
          }
        }
      }
    }

    objc_msgSend(v5, "setResult:", v23);
  }
}

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  const xmlChar *v6;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = (const xmlChar *)objc_msgSend(v5, "xmlValueForAttribute:", PFXWidgetConstantDataWidgetObjectType[0]);
  if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantReviewObjectValueReviewTitle[0])
    || xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantReviewObjectValueReviewText[0]))
  {
    -[PFXReviewWidgetType mapEndTextElementWithState:](self, "mapEndTextElementWithState:", a3);
  }
  else if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantReviewObjectValueMultipleChoiceQuestion[0])
         || xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantReviewObjectValueAssociateQuestion[0]))
  {
    -[PFXReviewWidgetType mapEndQuestionElementWithState:](self, "mapEndQuestionElementWithState:", a3);
  }
}

@end
