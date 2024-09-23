@implementation UIWebTextPlaceholder

+ (UIWebTextPlaceholder)placeholderWithWebDocumentView:(id)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)a1);
  v4[7] = a3;
  return (UIWebTextPlaceholder *)v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_webDocumentView = 0;

  v3.receiver = self;
  v3.super_class = (Class)UIWebTextPlaceholder;
  -[UIWebTextPlaceholder dealloc](&v3, sel_dealloc);
}

- (id)rects
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  -[UIWebDocumentView frameForDictationResultPlaceholder:](self->_webDocumentView, "frameForDictationResultPlaceholder:", self->_element);
  v3[0] = +[UISimpleSelectionRect rectWithCGRect:](UISimpleSelectionRect, "rectWithCGRect:");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (DOMElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
