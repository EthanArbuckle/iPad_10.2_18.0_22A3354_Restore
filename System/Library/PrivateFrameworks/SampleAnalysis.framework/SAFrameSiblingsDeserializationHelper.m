@implementation SAFrameSiblingsDeserializationHelper

- (SAFrameSiblingsDeserializationHelper)initWithFrameHelpers:(id)a3
{
  id v5;
  SAFrameSiblingsDeserializationHelper *v6;
  SAFrameSiblingsDeserializationHelper *v7;
  SAFrameSiblingsDeserializationHelper *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SAFrameSiblingsDeserializationHelper;
  v6 = -[SAFrameSiblingsDeserializationHelper init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_frameHelpers, a3);
    v8 = v7;
  }

  return v7;
}

- (NSArray)frameHelpers
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFrameHelpers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameHelpers, 0);
}

@end
