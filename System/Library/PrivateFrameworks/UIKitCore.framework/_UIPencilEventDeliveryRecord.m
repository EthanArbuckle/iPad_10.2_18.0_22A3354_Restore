@implementation _UIPencilEventDeliveryRecord

- (_UIPencilEventDeliveryRecord)init
{
  _UIPencilEventDeliveryRecord *v2;
  uint64_t v3;
  NSMutableSet *mutableInteractions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPencilEventDeliveryRecord;
  v2 = -[_UIPencilEventDeliveryRecord init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mutableInteractions = v2->_mutableInteractions;
    v2->_mutableInteractions = (NSMutableSet *)v3;

  }
  return v2;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableInteractions, 0);
}

@end
