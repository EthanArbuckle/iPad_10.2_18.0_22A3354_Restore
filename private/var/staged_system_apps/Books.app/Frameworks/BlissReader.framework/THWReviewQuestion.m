@implementation THWReviewQuestion

- (THWReviewQuestion)initWithContext:(id)a3 type:(int)a4 text:(BOOL)a5 numberOfChoices:(unint64_t)a6 titleAccessibilityDescription:(id)a7 imageAccessibilityDescription:(id)a8
{
  THWReviewQuestion *v14;
  THWReviewQuestion *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)THWReviewQuestion;
  v14 = -[THWReviewQuestion init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    v14->_type = a4;
    v14->_text = a5;
    v14->_cardinality = 0;
    v14->_context = (TSPObjectContext *)a3;
    v14->_numberOfChoices = a6;
    v14->_titleAccessibilityDescription = (NSString *)objc_msgSend(a7, "copy");
    v15->_imageAccessibilityDescription = (NSString *)objc_msgSend(a8, "copy");
  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewQuestion;
  -[THWReviewQuestion dealloc](&v3, "dealloc");
}

- (BOOL)p_referenceContentIsImage
{
  NSString *v3;

  v3 = -[THWReviewQuestion referenceContentType](self, "referenceContentType");
  if (-[THWReviewQuestion referenceContent](self, "referenceContent") && v3)
    return -[NSString isEqual:](v3, "isEqual:", TSWReviewQuestionDescriptionReferenceContentTypeImageValue);
  else
    return 0;
}

- (TSDImageInfo)imageInfo
{
  id v3;
  TSDImageInfo *v4;

  if (!self->_imageInfo && -[THWReviewQuestion p_referenceContentIsImage](self, "p_referenceContentIsImage"))
  {
    v3 = objc_msgSend(objc_alloc((Class)TSDMediaStyle), "initWithContext:name:overridePropertyMap:isVariation:", -[THWReviewQuestion context](self, "context"), 0, 0, 0);
    v4 = (TSDImageInfo *)objc_msgSend(objc_alloc((Class)TSDImageInfo), "initWithContext:geometry:style:imageData:originalImageData:", -[THWReviewQuestion context](self, "context"), 0, v3, -[THWReviewQuestion referenceContent](self, "referenceContent"), 0);
    self->_imageInfo = v4;
    -[TSDImageInfo setAccessibilityDescription:](v4, "setAccessibilityDescription:", self->_imageAccessibilityDescription);
    -[TSDImageInfo setLocked:](self->_imageInfo, "setLocked:", 1);

  }
  return self->_imageInfo;
}

- (int)imagePlacement
{
  int result;

  result = -[THWReviewQuestion p_referenceContentIsImage](self, "p_referenceContentIsImage");
  if (result)
    return -[THWReviewQuestion referenceContentPlacement](self, "referenceContentPlacement");
  return result;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  if (-[THWReviewQuestion p_referenceContentIsImage](self, "p_referenceContentIsImage"))
  {
    -[THWReviewQuestion referenceContentSize](self, "referenceContentSize");
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (id)p_defaultListLabelParagraphStyleFromStyle:(id)a3
{
  id v4;
  id v5;
  double v6;

  v4 = objc_msgSend(-[TSWPStorage paragraphStyleAtParIndex:effectiveRange:](self->_prompt, "paragraphStyleAtParIndex:effectiveRange:", 0, 0), "valueForProperty:", 16);
  if (!v4)
    v4 = objc_msgSend(+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 20.0), "fontName");
  v5 = +[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap");
  LODWORD(v6) = 20.0;
  objc_msgSend(v5, "setFloatValue:forProperty:", 17, v6);
  objc_msgSend(v5, "setObject:forProperty:", v4, 16);
  return objc_msgSend(objc_msgSend(a3, "stylesheet"), "variationOfStyle:propertyMap:", a3, v5);
}

- (void)p_ensureChoicesAreValid
{
  THWReviewQuestion *v2;
  id v3;
  NSMutableArray *choices;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  THWReviewQuestion *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  if (self->_type == 1)
  {
    v2 = self;
    v3 = objc_alloc_init((Class)NSMutableArray);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    choices = v2->_choices;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](choices, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v5)
    {
      v6 = v5;
      v20 = v2;
      v7 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(choices);
          v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v12 = objc_msgSend(v11, "contentStorage");
          if (v12)
          {
            v13 = objc_msgSend(v12, "paragraphStyleAtParIndex:effectiveRange:", 0, 0);
            v14 = v13;
            if (!v7)
              v7 = v13;
            v15 = objc_msgSend(v13, "overridePropertyMap");
            if (objc_msgSend(v15, "containsProperty:", 16)
              && (objc_msgSend(v15, "containsProperty:", 17) & 1) != 0)
            {
              if (!v8)
                v8 = v14;
            }
            else
            {
              objc_msgSend(v3, "addObject:", v11);
            }
          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](choices, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v6);
      v2 = v20;
      if (!objc_msgSend(v3, "count"))
        goto LABEL_31;
      if (v8)
        goto LABEL_24;
    }
    else
    {
      if (!objc_msgSend(v3, "count"))
      {
LABEL_31:

        return;
      }
      v7 = 0;
    }
    v8 = -[THWReviewQuestion p_defaultListLabelParagraphStyleFromStyle:](v2, "p_defaultListLabelParagraphStyleFromStyle:", v7);
LABEL_24:
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v16 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v3);
          objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j), "contentStorage"), "setParagraphStyle:atParIndex:undoTransaction:", v8, 0, 0);
        }
        v17 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v17);
    }
    goto LABEL_31;
  }
}

- (void)addChoice:(id)a3
{
  NSMutableArray *choices;

  if (a3)
  {
    choices = self->_choices;
    if (!choices)
    {
      choices = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", self->_numberOfChoices);
      self->_choices = choices;
    }
    -[NSMutableArray addObject:](choices, "addObject:", a3);
    if (-[NSMutableArray count](self->_choices, "count") == (id)self->_numberOfChoices)
      -[THWReviewQuestion p_ensureChoicesAreValid](self, "p_ensureChoicesAreValid");
  }
}

- (unint64_t)indexForChoice:(id)a3
{
  return (unint64_t)-[NSMutableArray indexOfObjectIdenticalTo:](self->_choices, "indexOfObjectIdenticalTo:", a3);
}

- (id)choiceAtIndex:(unint64_t)a3
{
  if ((unint64_t)-[NSMutableArray count](self->_choices, "count") <= a3)
    return 0;
  else
    return -[NSMutableArray objectAtIndex:](self->_choices, "objectAtIndex:", a3);
}

- (void)setQuestionID:(id)a3
{
  NSString *questionID;

  questionID = self->_questionID;
  if (questionID != a3)
  {

    self->_questionID = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (int)cardinality
{
  int result;
  int type;
  NSMutableArray *choices;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *i;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  result = self->_cardinality;
  if (!result)
  {
    type = self->_type;
    if (type == 2)
    {
      result = 3;
    }
    else
    {
      if (type != 1)
        return 0;
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      choices = self->_choices;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](choices, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = 0;
        v9 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(choices);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "fraction");
            if (v11 > 0.0)
              ++v8;
          }
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](choices, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
        if (v8 <= 1)
          result = 1;
        else
          result = 2;
      }
      else
      {
        result = 1;
      }
    }
    self->_cardinality = result;
  }
  return result;
}

- (Class)layoutClass
{
  int type;
  __objc2_class **v3;

  type = self->_type;
  if (type == 2)
  {
    v3 = off_424F20;
    return (Class)objc_opt_class(*v3, a2);
  }
  if (type == 1)
  {
    if (self->_text)
      v3 = &off_424F28;
    else
      v3 = off_424F18;
    return (Class)objc_opt_class(*v3, a2);
  }
  return 0;
}

- (Class)evaluatorClass
{
  int type;
  __objc2_class **v3;

  type = self->_type;
  if (type == 1)
  {
    v3 = off_425440;
    return (Class)objc_opt_class(*v3, a2);
  }
  if (type == 2)
  {
    v3 = &off_425448;
    return (Class)objc_opt_class(*v3, a2);
  }
  return 0;
}

- (int)evaluateAnswerWithResponseController:(id)a3 updateScore:(BOOL)a4 choiceBlock:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  TSWReviewResponseEvaluatorDataSource *v10;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  id v16;
  int v17;
  _QWORD v19[6];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _BYTE v27[128];

  v5 = a4;
  v25[4] = a5;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1646A4;
  v26[3] = &unk_42A380;
  v26[4] = a5;
  v24[4] = a5;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1646BC;
  v25[3] = &unk_42A380;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1646D4;
  v24[3] = &unk_42A380;
  if (a4)
    v8 = 0;
  else
    v8 = objc_msgSend(a3, "newTemporateReviewResponseMOC");
  v9 = objc_msgSend(a3, "responseForQuestionID:temporaryMOC:", -[THWReviewQuestion questionID](self, "questionID"), v8);
  v10 = -[TSWReviewResponseEvaluatorDataSource initWithResponse:]([TSWReviewResponseEvaluatorDataSource alloc], "initWithResponse:", v9);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = -[THWReviewQuestion choices](self, "choices");
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "fraction");
        -[TSWReviewResponseEvaluatorDataSource addFraction:](v10, "addFraction:");
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v13);
  }
  v16 = -[objc_class evaluate:blockIfCorrect:blockIfIncorrect:blockIfMissing:](-[THWReviewQuestion evaluatorClass](self, "evaluatorClass"), "evaluate:blockIfCorrect:blockIfIncorrect:blockIfMissing:", v10, v26, v25, v24);
  if (!objc_msgSend(v16, "correctCount"))
  {
    v17 = 3;
    if (!v5)
      goto LABEL_17;
LABEL_16:
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1646EC;
    v19[3] = &unk_426E28;
    v19[4] = v9;
    v19[5] = v16;
    objc_msgSend(a3, "mutateResponse:block:", v9, v19);
    goto LABEL_17;
  }
  if (objc_msgSend(v16, "incorrectCount"))
  {
    v17 = 4;
    if (!v5)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (objc_msgSend(v16, "missingCount"))
    v17 = 5;
  else
    v17 = 6;
  if (v5)
    goto LABEL_16;
LABEL_17:

  return v17;
}

- (int)type
{
  return self->_type;
}

- (TSWPStorage)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSString)alternatePrompt
{
  return self->_alternatePrompt;
}

- (void)setAlternatePrompt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (TSWPParagraphStyle)choiceNumberStyle
{
  return self->_choiceNumberStyle;
}

- (void)setChoiceNumberStyle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (id)referenceContent
{
  return self->_referenceContent;
}

- (void)setReferenceContent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSString)referenceContentType
{
  return self->_referenceContentType;
}

- (void)setReferenceContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)referenceContentAlternate
{
  return self->_referenceContentAlternate;
}

- (void)setReferenceContentAlternate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (CGSize)referenceContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceContentSize.width;
  height = self->_referenceContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setReferenceContentSize:(CGSize)a3
{
  self->_referenceContentSize = a3;
}

- (int)referenceContentPlacement
{
  return self->_referenceContentPlacement;
}

- (void)setReferenceContentPlacement:(int)a3
{
  self->_referenceContentPlacement = a3;
}

- (NSArray)choices
{
  return &self->_choices->super;
}

- (NSString)questionID
{
  return self->_questionID;
}

- (BOOL)isText
{
  return self->_text;
}

- (TSPObjectContext)context
{
  return self->_context;
}

- (NSString)titleAccessibilityDescription
{
  return self->_titleAccessibilityDescription;
}

- (NSString)imageAccessibilityDescription
{
  return self->_imageAccessibilityDescription;
}

- (unint64_t)numberOfChoices
{
  return self->_numberOfChoices;
}

@end
