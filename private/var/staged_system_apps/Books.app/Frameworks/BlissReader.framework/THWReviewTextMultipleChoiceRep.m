@implementation THWReviewTextMultipleChoiceRep

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewTextMultipleChoiceRep;
  -[THWReviewTextMultipleChoiceRep dealloc](&v3, "dealloc");
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)updateChildrenFromLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewTextMultipleChoiceRep;
  -[THWReviewTextMultipleChoiceRep updateChildrenFromLayout](&v3, "updateChildrenFromLayout");
  if (!self->_questionState)
  {
    -[THWReviewTextMultipleChoiceRep setQuestionState:](self, "setQuestionState:", objc_msgSend(-[THWReviewTextMultipleChoiceRep p_questionHost](self, "p_questionHost"), "reviewQuestionInitialState:", self));
    -[THWReviewTextMultipleChoiceRep reviewQuestionAnswerUpdated](self, "reviewQuestionAnswerUpdated");
  }
}

- (void)screenScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewTextMultipleChoiceRep;
  -[THWReviewTextMultipleChoiceRep screenScaleDidChange](&v3, "screenScaleDidChange");
  if (self->_moreAnswersLayer)
  {
    objc_msgSend(-[THWReviewTextMultipleChoiceRep canvas](self, "canvas"), "contentsScale");
    -[THWReviewMoreAnswersLayer setContentsScale:](self->_moreAnswersLayer, "setContentsScale:");
  }
}

- (id)additionalLayersOverLayer
{
  THWReviewMoreAnswersLayer *moreAnswersLayer;

  if (-[THWReviewTextMultipleChoiceRep questionState](self, "questionState") != 5)
    return 0;
  -[THWReviewTextMultipleChoiceRep p_updateMoreAnswersLayer](self, "p_updateMoreAnswersLayer");
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

  v3 = -[THWReviewTextMultipleChoiceRep canvas](self, "canvas");
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
  v17.origin.x = TSDRectWithSize(objc_msgSend(objc_msgSend(objc_msgSend(-[THWReviewTextMultipleChoiceRep parentRep](self, "parentRep"), "layout"), "geometry"), "size"));
  CGRectInset(v17, 0.0, 14.0);
  -[THWReviewMoreAnswersLayer layerSize](self->_moreAnswersLayer, "layerSize");
  v9 = TSDRectWithSizeAlignedToRect(2, 3);
  v11 = TSDMultiplyPointScalar(v9, v10, v5);
  v14 = TSDRoundedPointForScale(v12, v11, v13, v7);
  v16 = v15;
  -[THWReviewMoreAnswersLayer setScale:](self->_moreAnswersLayer, "setScale:", v5);
  -[THWReviewMoreAnswersLayer setPosition:](self->_moreAnswersLayer, "setPosition:", v14, v16);
}

- (int)reviewQuestionStateForChoiceIndex:(unint64_t)a3
{
  return objc_msgSend(-[THWReviewTextMultipleChoiceRep p_repForChoiceIndex:](self, "p_repForChoiceIndex:", a3), "state");
}

- (void)reviewQuestionUpdateChoiceIndex:(unint64_t)a3 withState:(int)a4
{
  objc_msgSend(-[THWReviewTextMultipleChoiceRep p_repForChoiceIndex:](self, "p_repForChoiceIndex:", a3), "setState:", *(_QWORD *)&a4);
}

- (void)reviewQuestionAnswerUpdated
{
  char *v3;
  char *v4;
  char *i;

  v3 = (char *)objc_msgSend(objc_msgSend(-[THWReviewQuestionLayout question](-[THWReviewTextMultipleChoiceRep questionLayout](self, "questionLayout"), "question"), "choices"), "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
      objc_msgSend(-[THWReviewTextMultipleChoiceRep p_repForChoiceIndex:](self, "p_repForChoiceIndex:", i), "updateRadioState");
  }
}

- (void)setQuestionState:(int)a3
{
  char *v5;
  char *v6;
  char *i;
  id v8;
  void *v9;

  if (self->_questionState != a3)
  {
    self->_questionState = a3;
    objc_msgSend(-[THWReviewTextMultipleChoiceRep canvas](self, "canvas"), "invalidateLayers");
    if (self->_questionState <= 2u)
    {
      v5 = (char *)objc_msgSend(objc_msgSend(objc_msgSend(-[THWReviewTextMultipleChoiceRep layout](self, "layout"), "question"), "choices"), "count");
      if (v5)
      {
        v6 = v5;
        for (i = 0; i != v6; ++i)
        {
          v8 = -[THWReviewTextMultipleChoiceRep p_repForChoiceIndex:](self, "p_repForChoiceIndex:", i);
          v9 = v8;
          if (a3 < 2 || objc_msgSend(v8, "state") != 1)
          {
            objc_msgSend(v9, "setState:", 0);
            objc_msgSend(v9, "updateRadioState");
          }
        }
      }
    }
    objc_msgSend(-[THWReviewTextMultipleChoiceRep p_questionHost](self, "p_questionHost"), "reviewQuestionDidUpdateState:", self);
  }
}

- (id)p_repForChoiceIndex:(unint64_t)a3
{
  uint64_t v5;
  id result;

  v5 = objc_opt_class(THWReviewTextAnswerRep);
  TSUDynamicCast(v5, objc_msgSend(-[THWReviewTextMultipleChoiceRep interactiveCanvasController](self, "interactiveCanvasController"), "repForLayout:", objc_msgSend(-[THWReviewTextMultipleChoiceRep layout](self, "layout"), "layoutForChoiceIndex:", a3)));
  return result;
}

- (id)p_questionHost
{
  return objc_msgSend(-[THWReviewTextMultipleChoiceRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWReviewQuestionHosting);
}

- (int)questionState
{
  return self->_questionState;
}

- (THWReviewMoreAnswersLayer)moreAnswersLayer
{
  return self->_moreAnswersLayer;
}

@end
