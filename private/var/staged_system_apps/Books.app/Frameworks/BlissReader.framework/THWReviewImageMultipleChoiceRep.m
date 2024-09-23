@implementation THWReviewImageMultipleChoiceRep

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageMultipleChoiceRep;
  -[THWReviewImageMultipleChoiceRep dealloc](&v3, "dealloc");
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)updateChildrenFromLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageMultipleChoiceRep;
  -[THWReviewImageMultipleChoiceRep updateChildrenFromLayout](&v3, "updateChildrenFromLayout");
  if (!self->_questionState)
    -[THWReviewImageMultipleChoiceRep setQuestionState:](self, "setQuestionState:", objc_msgSend(-[THWReviewImageMultipleChoiceRep p_questionHost](self, "p_questionHost"), "reviewQuestionInitialState:", self));
  -[THWReviewImageMultipleChoiceRep p_updateChoiceStates](self, "p_updateChoiceStates");
}

- (void)p_updateChoiceStates
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  THWReviewImageAnswerChoiceState *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = -[NSArray count](self->_choiceStates, "count");
  if (v3 != objc_msgSend(objc_msgSend(objc_msgSend(-[THWReviewImageMultipleChoiceRep layout](self, "layout"), "question"), "choices"), "count"))
  {

    self->_choiceStates = 0;
    v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = -[THWReviewImageMultipleChoiceRep p_questionHost](self, "p_questionHost");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(objc_msgSend(-[THWReviewImageMultipleChoiceRep layout](self, "layout", 0), "question"), "choices");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = -[THWReviewImageAnswerChoiceState initWithChoice:questionRep:questionHost:]([THWReviewImageAnswerChoiceState alloc], "initWithChoice:questionRep:questionHost:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10), self, v5);
          objc_msgSend(v4, "addObject:", v11);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    self->_choiceStates = (NSArray *)objc_msgSend(v4, "copy");

  }
}

- (void)screenScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageMultipleChoiceRep;
  -[THWReviewImageMultipleChoiceRep screenScaleDidChange](&v3, "screenScaleDidChange");
  if (self->_moreAnswersLayer)
  {
    objc_msgSend(-[THWReviewImageMultipleChoiceRep canvas](self, "canvas"), "contentsScale");
    -[THWReviewMoreAnswersLayer setContentsScale:](self->_moreAnswersLayer, "setContentsScale:");
  }
}

- (id)additionalLayersOverLayer
{
  THWReviewMoreAnswersLayer *moreAnswersLayer;

  if (-[THWReviewImageMultipleChoiceRep questionState](self, "questionState") != 5)
    return 0;
  -[THWReviewImageMultipleChoiceRep p_updateMoreAnswersLayer](self, "p_updateMoreAnswersLayer");
  if (!self->_moreAnswersLayer)
    return 0;
  moreAnswersLayer = self->_moreAnswersLayer;
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &moreAnswersLayer, 1);
}

- (void)p_updateMoreAnswersLayer
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  THWReviewMoreAnswersLayer *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;

  v3 = -[THWReviewImageMultipleChoiceRep canvas](self, "canvas");
  objc_msgSend(v3, "viewScale");
  v5 = v4;
  objc_msgSend(v3, "contentsScale");
  v7 = v6;
  if (!self->_moreAnswersLayer)
  {
    v8 = objc_alloc_init(THWReviewMoreAnswersLayer);
    self->_moreAnswersLayer = v8;
    -[THWReviewMoreAnswersLayer setContentsScale:](v8, "setContentsScale:", v7);
  }
  v17.origin.x = TSDRectWithSize(objc_msgSend(objc_msgSend(objc_msgSend(-[THWReviewImageMultipleChoiceRep parentRep](self, "parentRep"), "layout"), "geometry"), "size"));
  CGRectInset(v17, 0.0, 14.0);
  -[THWReviewMoreAnswersLayer layerSize](self->_moreAnswersLayer, "layerSize");
  v9 = TSDRectWithSizeAlignedToRect(2, 3);
  v11 = TSDMultiplyPointScalar(v9, v10, v5);
  v14 = TSDRoundedPointForScale(v12, v11, v13, v7);
  v16 = v15;
  -[THWReviewMoreAnswersLayer setScale:](self->_moreAnswersLayer, "setScale:", v5);
  -[THWReviewMoreAnswersLayer setPosition:](self->_moreAnswersLayer, "setPosition:", v14, v16);
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  if (!objc_msgSend(a3, "tag"))
  {
    -[THWReviewImageMultipleChoiceRep p_updateChoiceStates](self, "p_updateChoiceStates");
    v7 = objc_opt_class(THWButtonControlRep);
    *(_QWORD *)&v8 = TSUDynamicCast(v7, a4).n128_u64[0];
    v10 = v9;
    v11 = objc_msgSend(a3, "index", v8);
    if (v11 >= (id)-[NSArray count](self->_choiceStates, "count"))
      v12 = 0;
    else
      v12 = -[NSArray objectAtIndex:](self->_choiceStates, "objectAtIndex:", objc_msgSend(a3, "index"));
    objc_msgSend(v10, "setDelegate:", v12);
  }
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  uint64_t v5;
  double v6;
  id v7;

  if (!objc_msgSend(a3, "tag"))
  {
    v5 = objc_opt_class(THWButtonControlRep);
    *(_QWORD *)&v6 = TSUDynamicCast(v5, a4).n128_u64[0];
    objc_msgSend(v7, "setDelegate:", 0, v6);
  }
}

- (int)reviewQuestionStateForChoiceIndex:(unint64_t)a3
{
  id v5;

  if (-[NSArray count](self->_choiceStates, "count") > a3
    && (v5 = -[NSArray objectAtIndex:](self->_choiceStates, "objectAtIndex:", a3)) != 0)
  {
    return objc_msgSend(v5, "choiceState");
  }
  else
  {
    return 0;
  }
}

- (void)reviewQuestionUpdateChoiceIndex:(unint64_t)a3 withState:(int)a4
{
  uint64_t v4;
  id v7;

  v4 = *(_QWORD *)&a4;
  if (-[NSArray count](self->_choiceStates, "count") <= a3)
    v7 = 0;
  else
    v7 = -[NSArray objectAtIndex:](self->_choiceStates, "objectAtIndex:", a3);
  objc_msgSend(v7, "setChoiceState:", v4);
}

- (void)reviewQuestionAnswerUpdated
{
  NSArray *choiceStates;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  choiceStates = self->_choiceStates;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](choiceStates, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(choiceStates);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "updateRadioState");
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](choiceStates, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)setQuestionState:(int)a3
{
  NSArray *choiceStates;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (self->_questionState != a3)
  {
    self->_questionState = a3;
    objc_msgSend(-[THWReviewImageMultipleChoiceRep canvas](self, "canvas"), "invalidateLayers");
    if (self->_questionState <= 2u)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      choiceStates = self->_choiceStates;
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](choiceStates, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v12;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v12 != v8)
              objc_enumerationMutation(choiceStates);
            v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
            if (a3 < 2
              || objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "choiceState") != 1)
            {
              objc_msgSend(v10, "setChoiceState:", 0);
              objc_msgSend(v10, "updateRadioState");
            }
          }
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](choiceStates, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v7);
      }
    }
    objc_msgSend(-[THWReviewImageMultipleChoiceRep p_questionHost](self, "p_questionHost"), "reviewQuestionDidUpdateState:", self);
  }
}

- (id)p_choiceAtIndex:(unint64_t)a3
{
  id v4;

  v4 = objc_msgSend(objc_msgSend(-[THWReviewImageMultipleChoiceRep layout](self, "layout"), "question"), "choices");
  if ((unint64_t)objc_msgSend(v4, "count") <= a3)
    return 0;
  else
    return objc_msgSend(v4, "objectAtIndex:", a3);
}

- (id)p_repForChoiceIndex:(unint64_t)a3
{
  uint64_t v5;
  id result;

  v5 = objc_opt_class(THWButtonControlRep);
  TSUDynamicCast(v5, objc_msgSend(-[THWReviewImageMultipleChoiceRep interactiveCanvasController](self, "interactiveCanvasController"), "repForLayout:", objc_msgSend(-[THWReviewImageMultipleChoiceRep layout](self, "layout"), "layoutForChoiceIndex:", a3)));
  return result;
}

- (id)p_questionHost
{
  return objc_msgSend(-[THWReviewImageMultipleChoiceRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWReviewQuestionHosting);
}

- (int)questionState
{
  return self->_questionState;
}

- (NSArray)choiceStates
{
  return self->_choiceStates;
}

- (THWReviewMoreAnswersLayer)moreAnswersLayer
{
  return self->_moreAnswersLayer;
}

@end
