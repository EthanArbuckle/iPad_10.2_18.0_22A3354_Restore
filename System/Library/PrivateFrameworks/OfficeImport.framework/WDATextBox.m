@implementation WDATextBox

- (WDATextBox)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDATextBox;
  return -[WDATextBox init](&v3, sel_init);
}

- (void)setOle:(BOOL)a3
{
  self->mOle = a3;
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->mParent, a3);
}

- (void)setDocument:(id)a3
{
  objc_storeWeak((id *)&self->mDocument, a3);
}

- (void)setNextTextBoxId:(unint64_t)a3
{
  self->mNextTextBoxId = a3;
}

- (WDAContent)parent
{
  return (WDAContent *)objc_loadWeakRetained((id *)&self->mParent);
}

- (id)text
{
  return self->mText;
}

- (WDDocument)document
{
  return (WDDocument *)objc_loadWeakRetained((id *)&self->mDocument);
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->mText, a3);
}

- (BOOL)isOle
{
  return self->mOle;
}

- (unint64_t)nextTextBoxId
{
  return self->mNextTextBoxId;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDATextBox;
  -[WDATextBox description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSNumber)flowSequence
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFlowSequence:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSNumber)flowId
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFlowId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)isMultiColumn
{
  return self->_isMultiColumn;
}

- (void)setIsMultiColumn:(BOOL)a3
{
  self->_isMultiColumn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowId, 0);
  objc_storeStrong((id *)&self->_flowSequence, 0);
  objc_destroyWeak((id *)&self->mParent);
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mText, 0);
}

@end
