@implementation PBDataTransferRequest

- (NSString)typeIdentifier
{
  return -[PBItemRepresentation typeIdentifier](self->_repr, "typeIdentifier");
}

- (PBItemCollection)itemCollection
{
  return self->_itemCollection;
}

- (void)setItemCollection:(id)a3
{
  objc_storeStrong((id *)&self->_itemCollection, a3);
}

- (PBItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (PBItemRepresentation)repr
{
  return self->_repr;
}

- (void)setRepr:(id)a3
{
  objc_storeStrong((id *)&self->_repr, a3);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_repr, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_itemCollection, 0);
}

@end
