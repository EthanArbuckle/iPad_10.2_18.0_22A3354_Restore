@implementation SUCellConfiguration

- (void)dealloc
{
  objc_super v3;

  self->_context = 0;
  self->_representedObject = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUCellConfiguration;
  -[SUCellConfiguration dealloc](&v3, sel_dealloc);
}

+ (id)copyDefaultContext
{
  return 0;
}

+ (double)minimumRowHeight
{
  double result;

  objc_msgSend(a1, "rowHeightForContext:representedObject:", 0, 0);
  return result;
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 45.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUCellConfiguration.m"), 44, CFSTR("-[%@ %@] must be implemented by subclasses."), -[SUCellConfiguration superclass](self, "superclass"), NSStringFromSelector(a2));
  return 0;
}

- (id)context
{
  return self->_context;
}

- (CGRect)frameForImageAtIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUCellConfiguration.m"), 65, CFSTR("-[%@ %@] must be implemented by subclasses."), -[SUCellConfiguration superclass](self, "superclass"), NSStringFromSelector(a2));
  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)frameForLabelAtIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUCellConfiguration.m"), 70, CFSTR("-[%@ %@] must be implemented by subclasses."), -[SUCellConfiguration superclass](self, "superclass"), NSStringFromSelector(a2));
  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUCellConfiguration.m"), 75, CFSTR("-[%@ %@] must be implemented by subclasses."), -[SUCellConfiguration superclass](self, "superclass"), NSStringFromSelector(a2));
  return 0;
}

- (BOOL)getShadowColor:(id *)a3 offset:(CGSize *)a4 forLabelAtIndex:(unint64_t)a5 withModifiers:(unint64_t)a6
{
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = *(CGSize *)MEMORY[0x24BDBF148];
  return 0;
}

- (id)imageAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUCellConfiguration.m"), 86, CFSTR("-[%@ %@] must be implemented by subclasses."), -[SUCellConfiguration superclass](self, "superclass"), NSStringFromSelector(a2));
  return 0;
}

- (unint64_t)indexOfLabelForPurchaseAnimation
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (CGSize)layoutSize
{
  SUCellConfigurationView *view;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  view = self->_view;
  if (view)
  {
    -[SUCellConfigurationView bounds](view, "bounds");
    v4 = v3;
    v6 = v5;
  }
  else
  {
    v4 = *MEMORY[0x24BDBF148];
    v6 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  result.height = v6;
  result.width = v4;
  return result;
}

- (BOOL)needsDisplay
{
  return *((_BYTE *)self + 40) & 1;
}

- (unint64_t)numberOfImages
{
  return 0;
}

- (unint64_t)numberOfLabels
{
  return 0;
}

- (BOOL)isDeleteConfirmationVisible
{
  return *((_BYTE *)self + 16) & 1;
}

- (void)setContext:(id)a3
{
  id context;

  context = self->_context;
  if (context != a3)
  {

    self->_context = a3;
    -[SUCellConfiguration setNeedsDisplay:](self, "setNeedsDisplay:", 1);
  }
}

- (void)setNeedsDisplay:(BOOL)a3
{
  *((_BYTE *)self + 40) = *((_BYTE *)self + 40) & 0xFE | a3;
}

- (void)setRepresentedObject:(id)a3
{
  id representedObject;

  representedObject = self->_representedObject;
  if (representedObject != a3)
  {

    self->_representedObject = a3;
    -[SUCellConfiguration setNeedsDisplay:](self, "setNeedsDisplay:", 1);
  }
}

- (id)stringForLabelAtIndex:(unint64_t)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUCellConfiguration.m"), 140, CFSTR("-[%@ %@] must be implemented by subclasses."), -[SUCellConfiguration superclass](self, "superclass"), NSStringFromSelector(a2));
  return 0;
}

- (void)setIsDeleteConfirmationVisible:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)self + 16);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
    *((_BYTE *)self + 16) = v3 & 0xFE | a3;
}

- (int64_t)textAlignmentForLabelAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)representedObject
{
  return self->_representedObject;
}

- (SUCellConfigurationView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  self->_view = (SUCellConfigurationView *)a3;
}

- (void)setLayoutSize:(CGSize)a3
{
  self->_layoutSize = a3;
}

@end
