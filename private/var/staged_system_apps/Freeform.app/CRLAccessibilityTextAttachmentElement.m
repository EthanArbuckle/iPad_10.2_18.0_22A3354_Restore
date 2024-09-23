@implementation CRLAccessibilityTextAttachmentElement

- (CRLAccessibilityTextAttachmentElement)initWithAccessibilityParent:(id)a3 textEquivalent:(id)a4
{
  id v7;
  CRLAccessibilityTextAttachmentElement *v8;
  CRLAccessibilityTextAttachmentElement *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLAccessibilityTextAttachmentElement;
  v8 = -[CRLAccessibilityElement initWithAccessibilityParent:](&v11, "initWithAccessibilityParent:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_textEquivalent, a4);

  return v9;
}

- (id)accessibilityLabel
{
  return -[CRLAccessibilityTextAttachmentElement textEquivalent](self, "textEquivalent");
}

- (NSString)textEquivalent
{
  return self->_textEquivalent;
}

- (void)setTextEquivalent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEquivalent, 0);
}

@end
