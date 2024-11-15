@implementation UITextDropRequest

- (UITextDropRequest)initWithPosition:(id)a3 range:(id)a4 inSession:(id)a5
{
  id v9;
  id v10;
  id v11;
  UITextDropRequest *v12;
  UITextDropRequest *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UITextDropRequest;
  v12 = -[UITextDropRequest init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dropPosition, a3);
    objc_storeStrong((id *)&v13->_dropRange, a4);
    objc_storeStrong((id *)&v13->_dropSession, a5);
  }

  return v13;
}

- (UIDropSession)dropSession
{
  return self->_dropSession;
}

- (UITextPosition)dropPosition
{
  return self->_dropPosition;
}

- (UITextRange)dropRange
{
  return self->_dropRange;
}

- (UITextDropProposal)suggestedProposal
{
  return self->_suggestedProposal;
}

- (void)setSuggestedProposal:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedProposal, a3);
}

- (BOOL)isSameView
{
  return self->_sameView;
}

- (void)setSameView:(BOOL)a3
{
  self->_sameView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedProposal, 0);
  objc_storeStrong((id *)&self->_dropRange, 0);
  objc_storeStrong((id *)&self->_dropPosition, 0);
  objc_storeStrong((id *)&self->_dropSession, 0);
}

@end
