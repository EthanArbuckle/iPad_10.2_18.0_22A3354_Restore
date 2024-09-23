@implementation TVViewElement

- (TVViewElement)initWithViewElement:(id)a3
{
  id v4;
  TVViewElement *v5;
  TVViewElement *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TVViewElement;
  v5 = -[TVViewElement init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_element, v4);

  return v6;
}

- (NSDictionary)elementData
{
  void *v2;
  void *v3;

  -[TVViewElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSString)elementIdentifier
{
  void *v2;
  void *v3;

  -[TVViewElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)elementName
{
  void *v2;
  void *v3;

  -[TVViewElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (TVViewElement)parentViewElement
{
  void *v2;
  void *v3;
  void *v4;

  -[TVViewElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tv_associatedViewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (TVViewElement *)v4;
}

- (NSArray)childViewElements
{
  void *v2;
  void *v3;
  void *v4;

  -[TVViewElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("tv_associatedViewElement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSDictionary)attributes
{
  void *v2;
  void *v3;

  -[TVViewElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (TVViewElementStyle)style
{
  void *v2;
  void *v3;
  void *v4;

  -[TVViewElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tv_associatedViewElementStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (TVViewElementStyle *)v4;
}

- (NSString)autoHighlightIdentifier
{
  void *v2;
  void *v3;

  -[TVViewElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autoHighlightIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isDisabled
{
  void *v2;
  char v3;

  -[TVViewElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (int64_t)semanticContentAttribute
{
  void *v2;
  int64_t v3;

  -[TVViewElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tv_semanticContentAttribute");

  return v3;
}

- (int64_t)updateType
{
  int v3;
  void *v4;
  uint64_t v5;
  int64_t result;
  BOOL v7;
  int64_t v8;

  v3 = dyld_program_sdk_at_least();
  -[TVViewElement element](self, "element");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "updateType");

  switch(v5)
  {
    case 1:
      result = 1;
      break;
    case 2:
      if (v3)
        result = 2;
      else
        result = 4;
      break;
    case 3:
      v7 = v3 == 0;
      v8 = 2;
      goto LABEL_9;
    case 4:
      v7 = v3 == 0;
      v8 = 3;
LABEL_9:
      if (v7)
        result = v8;
      else
        result = v8 + 1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)resetProperty:(int64_t)a3
{
  uint64_t v3;
  id v4;

  if (a3)
    v3 = 2 * (a3 == 1);
  else
    v3 = 1;
  -[TVViewElement element](self, "element");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetProperty:", v3);

}

- (void)dispatchEventOfType:(int64_t)a3 canBubble:(BOOL)a4 cancellable:(BOOL)a5 extraInfo:(id)a6 completion:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v8 = a5;
  v9 = a4;
  if ((unint64_t)(a3 - 1) > 4)
    v11 = 0;
  else
    v11 = qword_222E77490[a3 - 1];
  v12 = a7;
  v13 = a6;
  -[TVViewElement element](self, "element");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", v11, v9, v8, v13, v12);

}

- (void)dispatchEventWithName:(id)a3 canBubble:(BOOL)a4 cancellable:(BOOL)a5 extraInfo:(id)a6 completion:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;

  v8 = a5;
  v9 = a4;
  v12 = a7;
  v13 = a6;
  v14 = a3;
  -[TVViewElement element](self, "element");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", v14, 0, v9, v8, v13, v12);

}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (IKViewElement)element
{
  return (IKViewElement *)objc_loadWeakRetained((id *)&self->_element);
}

- (BOOL)isParsedOnce
{
  return self->_parsedOnce;
}

- (void)setParsedOnce:(BOOL)a3
{
  self->_parsedOnce = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_element);
}

@end
