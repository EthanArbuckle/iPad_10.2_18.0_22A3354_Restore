@implementation PGResolvablePublicEventBusinessItem

- (PGResolvablePublicEventBusinessItem)initWithPublicEventNode:(id)a3 consolidatedAddress:(id)a4 businessItemMuid:(unint64_t)a5
{
  id v9;
  id v10;
  PGResolvablePublicEventBusinessItem *v11;
  PGResolvablePublicEventBusinessItem *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGResolvablePublicEventBusinessItem;
  v11 = -[PGResolvablePublicEventBusinessItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_publicEventNode, a3);
    objc_storeStrong((id *)&v12->_consolidatedAddress, a4);
    v12->_businessItemMuid = a5;
  }

  return v12;
}

- (PGGraphPublicEventNode)publicEventNode
{
  return self->_publicEventNode;
}

- (PGConsolidatedAddress)consolidatedAddress
{
  return self->_consolidatedAddress;
}

- (unint64_t)businessItemMuid
{
  return self->_businessItemMuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consolidatedAddress, 0);
  objc_storeStrong((id *)&self->_publicEventNode, 0);
}

@end
