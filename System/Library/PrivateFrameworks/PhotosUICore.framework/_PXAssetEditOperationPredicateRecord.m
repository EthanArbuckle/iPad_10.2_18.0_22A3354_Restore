@implementation _PXAssetEditOperationPredicateRecord

- (_PXAssetEditOperationPredicateRecord)initWithPerformerClass:(Class)a3 predicate:(id)a4
{
  id v6;
  _PXAssetEditOperationPredicateRecord *v7;
  _PXAssetEditOperationPredicateRecord *v8;
  uint64_t v9;
  id predicate;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PXAssetEditOperationPredicateRecord;
  v7 = -[_PXAssetEditOperationPredicateRecord init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_performerClass, a3);
    v9 = objc_msgSend(v6, "copy");
    predicate = v8->_predicate;
    v8->_predicate = (id)v9;

  }
  return v8;
}

- (Class)performerClass
{
  return self->_performerClass;
}

- (id)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_predicate, 0);
  objc_storeStrong((id *)&self->_performerClass, 0);
}

@end
