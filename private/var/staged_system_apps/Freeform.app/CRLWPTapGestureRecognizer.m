@implementation CRLWPTapGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLWPTapGestureRecognizer;
  v6 = a3;
  -[CRLWPTapGestureRecognizer touchesBegan:withEvent:](&v8, "touchesBegan:withEvent:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject", v8.receiver, v8.super_class));

  self->_tapCount = (unint64_t)objc_msgSend(v7, "tapCount");
  -[CRLWPTapGestureRecognizer setInputType:](self, "setInputType:", sub_10033831C((_BOOL8)objc_msgSend(v7, "type")));

}

- (void)reset
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRLWPTapGestureRecognizer;
  -[CRLWPTapGestureRecognizer reset](&v12, "reset");
  self->_tapCount = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTapGestureRecognizer delegate](self, "delegate"));
  v10 = sub_100221DDC(v3, 1, v4, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLGestureDelegate);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  objc_msgSend(v11, "didReset:", self);
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (void)setInputType:(int64_t)a3
{
  self->_inputType = a3;
}

- (unint64_t)tapCount
{
  return self->_tapCount;
}

@end
