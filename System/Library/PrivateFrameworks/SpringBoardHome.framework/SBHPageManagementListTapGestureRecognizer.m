@implementation SBHPageManagementListTapGestureRecognizer

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHPageManagementListTapGestureRecognizer;
  -[SBHPageManagementListTapGestureRecognizer reset](&v3, sel_reset);
  -[SBHPageManagementListTapGestureRecognizer setActiveTouch:](self, "setActiveTouch:", 0);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHPageManagementListTapGestureRecognizer;
  -[SBHPageManagementListTapGestureRecognizer touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, v6, a4);
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    if (!-[SBHPageManagementListTapGestureRecognizer state](self, "state"))
    {
      objc_msgSend(v6, "anyObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHPageManagementListTapGestureRecognizer setActiveTouch:](self, "setActiveTouch:", v7);
      -[SBHPageManagementListTapGestureRecognizer setState:](self, "setState:", 1);

    }
  }
  else
  {
    -[SBHPageManagementListTapGestureRecognizer setState:](self, "setState:", 5);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHPageManagementListTapGestureRecognizer;
  v6 = a3;
  -[SBHPageManagementListTapGestureRecognizer touchesMoved:withEvent:](&v11, sel_touchesMoved_withEvent_, v6, a4);
  objc_msgSend(v6, "anyObject", v11.receiver, v11.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "count");

  if (v8 > 1)
  {
    v10 = 5;
  }
  else
  {
    -[SBHPageManagementListTapGestureRecognizer activeTouch](self, "activeTouch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v9)
      v10 = 2;
    else
      v10 = 5;
  }
  -[SBHPageManagementListTapGestureRecognizer setState:](self, "setState:", v10);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHPageManagementListTapGestureRecognizer;
  v6 = a3;
  -[SBHPageManagementListTapGestureRecognizer touchesEnded:withEvent:](&v11, sel_touchesEnded_withEvent_, v6, a4);
  objc_msgSend(v6, "anyObject", v11.receiver, v11.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "count");

  if (v8 > 1)
  {
    v10 = 5;
  }
  else
  {
    -[SBHPageManagementListTapGestureRecognizer activeTouch](self, "activeTouch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v9)
      v10 = 3;
    else
      v10 = 5;
  }
  -[SBHPageManagementListTapGestureRecognizer setState:](self, "setState:", v10);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHPageManagementListTapGestureRecognizer;
  -[SBHPageManagementListTapGestureRecognizer touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[SBHPageManagementListTapGestureRecognizer setState:](self, "setState:", 4);
}

- (UITouch)activeTouch
{
  return self->_activeTouch;
}

- (void)setActiveTouch:(id)a3
{
  objc_storeStrong((id *)&self->_activeTouch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTouch, 0);
}

@end
