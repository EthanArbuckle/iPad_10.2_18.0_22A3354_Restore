@implementation PLURIArrayWithHashes

- (PLURIArrayWithHashes)init
{
  return (PLURIArrayWithHashes *)-[PLURIArrayWithHashes initForUpdates:](self, "initForUpdates:", 0);
}

- (id)initForUpdates:(BOOL)a3
{
  _BOOL4 v3;
  PLURIArrayWithHashes *v4;
  NSMutableArray *v5;
  NSMutableArray *attributeValues;
  NSMutableArray *v7;
  NSMutableArray *relationshipValues;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLURIArrayWithHashes;
  v4 = -[PLURIArrayWithHashes init](&v10, sel_init);
  if (v4)
  {
    v4->_uris = CFArrayCreateMutable(0, 1000, &initForUpdates__uriArrayCallbacks);
    v4->_hashes = CFArrayCreateMutable(0, 1000, &initForUpdates__hashesArrayCallbacks);
    if (v3)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      attributeValues = v4->_attributeValues;
      v4->_attributeValues = v5;

      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      relationshipValues = v4->_relationshipValues;
      v4->_relationshipValues = v7;

    }
  }
  return v4;
}

- (id)description
{
  return (id)(id)CFCopyDescription(self->_uris);
}

- (unint64_t)count
{
  return CFArrayGetCount(self->_uris);
}

- (BOOL)isUpdate
{
  return self->_attributeValues && self->_relationshipValues != 0;
}

- (__CFArray)uris
{
  return self->_uris;
}

- (void)setUris:(__CFArray *)a3
{
  self->_uris = a3;
}

- (__CFArray)hashes
{
  return self->_hashes;
}

- (void)setHashes:(__CFArray *)a3
{
  self->_hashes = a3;
}

- (NSMutableArray)attributeValues
{
  return self->_attributeValues;
}

- (void)setAttributeValues:(id)a3
{
  objc_storeStrong((id *)&self->_attributeValues, a3);
}

- (NSMutableArray)relationshipValues
{
  return self->_relationshipValues;
}

- (void)setRelationshipValues:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipValues, 0);
  objc_storeStrong((id *)&self->_attributeValues, 0);
}

@end
