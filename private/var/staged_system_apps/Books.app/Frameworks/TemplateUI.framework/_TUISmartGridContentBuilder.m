@implementation _TUISmartGridContentBuilder

- (void)configureWithChildNode:(id)a3 attributes:(id)a4
{
  uint64_t var0;
  id v6;
  id v7;

  var0 = a3.var0;
  v6 = a4;
  self->_rowSpan = (unint64_t)objc_msgSend(v6, "unsignedIntegerForAttribute:withDefault:node:", 179, 1, var0);
  v7 = objc_msgSend(v6, "unsignedIntegerForAttribute:withDefault:node:", 55, 1, var0);

  self->_columnSpan = (unint64_t)v7;
}

- (BOOL)onlyInstantiateFirstChildPassingConditionForEnumeratorChildren
{
  return 1;
}

- (void)configureCell:(id)a3
{
  unint64_t columnSpan;
  id v5;

  columnSpan = self->_columnSpan;
  v5 = a3;
  objc_msgSend(v5, "setColumnSpan:", columnSpan);
  objc_msgSend(v5, "setRowSpan:", self->_rowSpan);

}

@end
