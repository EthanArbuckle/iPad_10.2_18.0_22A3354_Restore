@implementation BCCardSetScrollingAssertion

- (BCCardSetScrollingAssertion)initWithContent:(id)a3
{
  id v4;
  BCCardSetScrollingAssertion *v5;
  BCCardSetScrollingAssertion *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BCCardSetScrollingAssertion;
  v5 = -[BCCardSetScrollingAssertion init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cardContent, v4);
    objc_msgSend(v4, "setPerformantForScrolling:", 1);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[BCCardSetScrollingAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BCCardSetScrollingAssertion;
  -[BCCardSetScrollingAssertion dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetScrollingAssertion cardContent](self, "cardContent"));
  objc_msgSend(v2, "setPerformantForScrolling:", 0);

}

- (BCCardContent)cardContent
{
  return (BCCardContent *)objc_loadWeakRetained((id *)&self->_cardContent);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cardContent);
}

@end
