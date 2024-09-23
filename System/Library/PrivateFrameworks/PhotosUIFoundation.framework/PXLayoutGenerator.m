@implementation PXLayoutGenerator

- (unint64_t)itemCount
{
  return self->_itemCount;
}

- (PXLayoutMetrics)metrics
{
  return self->_metrics;
}

- (unint64_t)keyItemIndex
{
  return self->_keyItemIndex;
}

- (void)setItemCount:(unint64_t)a3
{
  if (self->_itemCount != a3)
  {
    self->_itemCount = a3;
    -[PXLayoutGenerator invalidate](self, "invalidate");
  }
}

- (id)itemLayoutInfoBlock
{
  return self->_itemLayoutInfoBlock;
}

- (void)setKeyItemIndex:(unint64_t)a3
{
  if (self->_keyItemIndex != a3)
  {
    self->_keyItemIndex = a3;
    -[PXLayoutGenerator invalidate](self, "invalidate");
  }
}

- (void)setItemLayoutInfoBlock:(id)a3
{
  void *v4;
  id itemLayoutInfoBlock;

  if (self->_itemLayoutInfoBlock != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    itemLayoutInfoBlock = self->_itemLayoutInfoBlock;
    self->_itemLayoutInfoBlock = v4;

    -[PXLayoutGenerator invalidate](self, "invalidate");
  }
}

- (PXLayoutGenerator)initWithMetrics:(id)a3
{
  id v4;
  PXLayoutGenerator *v5;
  uint64_t v6;
  PXLayoutMetrics *metrics;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXLayoutGenerator;
  v5 = -[PXLayoutGenerator init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    metrics = v5->_metrics;
    v5->_metrics = (PXLayoutMetrics *)v6;

    v5->_keyItemIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (PXLayoutGenerator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLayoutGenerator.m"), 50, CFSTR("%s is not available as initializer"), "-[PXLayoutGenerator init]");

  abort();
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMetrics:", self->_metrics);
  v4[2] = self->_itemCount;
  v5 = objc_msgSend(self->_itemLayoutInfoBlock, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  v4[3] = self->_keyItemIndex;
  return v4;
}

- (void)setMetrics:(id)a3
{
  PXLayoutMetrics *v4;
  BOOL v5;
  PXLayoutMetrics *v6;
  PXLayoutMetrics *metrics;
  PXLayoutMetrics *v8;

  v8 = (PXLayoutMetrics *)a3;
  v4 = self->_metrics;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXLayoutMetrics isEqual:](v8, "isEqual:", v4);

    if (!v5)
    {
      v6 = (PXLayoutMetrics *)-[PXLayoutMetrics copy](v8, "copy");
      metrics = self->_metrics;
      self->_metrics = v6;

      -[PXLayoutGenerator invalidate](self, "invalidate");
    }
  }

}

- (CGSize)estimatedSize
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLayoutGenerator.m"), 107, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXLayoutGenerator estimatedSize]", v6);

  abort();
}

- (CGSize)size
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLayoutGenerator.m"), 111, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXLayoutGenerator size]", v6);

  abort();
}

- (NSIndexSet)geometryKinds
{
  if (geometryKinds_onceToken != -1)
    dispatch_once(&geometryKinds_onceToken, &__block_literal_global_351);
  return (NSIndexSet *)(id)geometryKinds_kinds;
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  void *v7;
  objc_class *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4.location, a4.length, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLayoutGenerator.m"), 128, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXLayoutGenerator getGeometries:inRange:withKind:]", v9);

  abort();
}

- (NSString)diagnosticDescription
{
  unint64_t v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  CGSize v16;

  v3 = -[PXLayoutGenerator itemCount](self, "itemCount");
  v4 = objc_alloc(MEMORY[0x24BDD16A8]);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@: %p; count=%lu, key=%lu\n"),
                 v6,
                 self,
                 v3,
                 -[PXLayoutGenerator keyItemIndex](self, "keyItemIndex"));

  -[PXLayoutGenerator metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "diagnosticDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\tmetrics={%@}\n"), v9);

  -[PXLayoutGenerator itemLayoutInfoBlock](self, "itemLayoutInfoBlock");
  v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      v10[2](v10, i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "size");
      NSStringFromCGSize(v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "weight");
      objc_msgSend(v7, "appendFormat:", CFSTR("\t%li size=%@ weight=%f\n"), i, v13, v14);

    }
  }
  objc_msgSend(v7, "appendString:", CFSTR(">"));

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemLayoutInfoBlock, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

void __34__PXLayoutGenerator_geometryKinds__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)geometryKinds_kinds;
  geometryKinds_kinds = v0;

}

@end
