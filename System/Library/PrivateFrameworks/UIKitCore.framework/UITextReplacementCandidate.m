@implementation UITextReplacementCandidate

+ (id)textReplacementCandidateForTextReplacement:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[UITextReplacementCandidate _initWithTextReplacement:]([UITextReplacementCandidate alloc], "_initWithTextReplacement:", v3);

  return v4;
}

- (id)_initWithTextReplacement:(id)a3
{
  id v5;
  UITextReplacementCandidate *v6;
  UITextReplacementCandidate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITextReplacementCandidate;
  v6 = -[UITextReplacementCandidate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_replacement, a3);

  return v7;
}

- (id)label
{
  return -[UITextReplacement menuTitle](self->_replacement, "menuTitle");
}

- (UITextReplacement)replacement
{
  return self->_replacement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacement, 0);
}

@end
