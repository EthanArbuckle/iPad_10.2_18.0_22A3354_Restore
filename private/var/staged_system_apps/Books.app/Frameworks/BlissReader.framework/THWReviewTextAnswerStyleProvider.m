@implementation THWReviewTextAnswerStyleProvider

- (THWReviewTextAnswerStyleProvider)initWithIndex:(unint64_t)a3 storage:(id)a4 listLabelStyle:(id)a5
{
  THWReviewTextAnswerStyleProvider *v8;
  THWReviewTextAnswerStyleProvider *v9;
  uint64_t v10;
  id v11;
  TSWPListStyle *v12;
  id v13;
  id v14;
  TSWPListStyle *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)THWReviewTextAnswerStyleProvider;
  v8 = -[THWReviewTextAnswerStyleProvider init](&v17, "init");
  v9 = v8;
  if (v8)
  {
    v8->_index = a3;
    v8->_storage = (TSWPStorage *)a4;
    v10 = objc_opt_class(TSWPListStyle);
    TSUDynamicCast(v10, objc_msgSend(objc_msgSend(a4, "stylesheet"), "styleWithIdentifier:", CFSTR("review-list-style")));
    v12 = (TSWPListStyle *)v11;
    v9->_listStyle = v12;
    if (!v12)
    {
      v13 = +[TSWPListStyle propertyMapForListNumberType:](TSWPListStyle, "propertyMapForListNumberType:", 9);
      v14 = +[TSWPListStyle defaultStyleWithContext:type:](TSWPListStyle, "defaultStyleWithContext:type:", objc_msgSend(a4, "context"), 3);
      objc_msgSend(objc_msgSend(a4, "stylesheet"), "addStyle:", v14);
      v15 = (TSWPListStyle *)objc_msgSend(objc_msgSend(a4, "stylesheet"), "variationOfStyle:propertyMap:", v14, v13);
      v9->_listStyle = v15;
      objc_msgSend(-[TSWPListStyle stylesheet](v15, "stylesheet"), "setIdentifier:ofStyle:", CFSTR("review-list-style"), v9->_listStyle);
    }
    v9->_listLabelStyle = (TSWPParagraphStyle *)a5;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewTextAnswerStyleProvider;
  -[THWReviewTextAnswerStyleProvider dealloc](&v3, "dealloc");
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v7 = +[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap");
  objc_msgSend(v7, "setIntValue:forProperty:", 0, 86);
  HIDWORD(v8) = 1078427648;
  *(float *)&v8 = 47.0;
  objc_msgSend(v7, "setFloatValue:forProperty:", 80, v8);
  *(float *)&v9 = 47.0;
  objc_msgSend(v7, "setFloatValue:forProperty:", 81, v9);
  objc_msgSend(v7, "setBoolValue:forProperty:", 1, 93);
  LODWORD(v10) = 0;
  objc_msgSend(v7, "setFloatValue:forProperty:", 82, v10);
  v11 = objc_msgSend(+[TSWPStorageStyleProvider styleProviderForStorage:](TSWPStorageStyleProvider, "styleProviderForStorage:", self->_storage), "paragraphStyleAtParIndex:effectiveRange:", a3, a4);
  return objc_msgSend(objc_msgSend(v11, "stylesheet"), "variationOfStyle:propertyMap:", v11, v7);
}

- (id)listStyleAtParIndex:(unint64_t)a3
{
  return self->_listStyle;
}

- (unint64_t)listNumberAtParIndex:(unint64_t)a3 numberingData:(id *)a4
{
  unint64_t result;

  if (a3)
  {
    result = 0;
    if (a4)
    {
      a4->var2 = 0;
      a4->var0 = 0;
      a4->var1 = 0;
    }
  }
  else
  {
    if (a4)
    {
      a4->var2 = self->_index != 0;
      a4->var0 = 3;
      a4->var1 = 0;
    }
    return self->_index + 1;
  }
  return result;
}

- (id)listLabelParagraphStyleOverrideAtParIndex:(unint64_t)a3
{
  if (a3)
    return 0;
  else
    return self->_listLabelStyle;
}

- (unint64_t)paragraphLevelAtParIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)index
{
  return self->_index;
}

- (TSWPListStyle)listStyle
{
  return self->_listStyle;
}

- (TSWPParagraphStyle)listLabelStyle
{
  return self->_listLabelStyle;
}

- (TSWPStorage)storage
{
  return self->_storage;
}

@end
