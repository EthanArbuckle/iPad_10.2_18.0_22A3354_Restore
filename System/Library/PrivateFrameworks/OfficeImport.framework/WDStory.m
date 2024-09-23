@implementation WDStory

- (WDStory)initWithHead:(id)a3
{
  id v5;
  WDStory *v6;
  WDStory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDStory;
  v6 = -[WDStory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->mHead, a3);

  return v7;
}

- (id)head
{
  return self->mHead;
}

- (id)text
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[OADDrawable clientData](self->mHead, "clientData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textBox");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setOle:(BOOL)a3
{
  self->mOle = a3;
}

- (BOOL)isOle
{
  return self->mOle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHead, 0);
}

@end
