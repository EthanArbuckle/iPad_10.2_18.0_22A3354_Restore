@implementation _PXSingleCollectionDataSection

- (_PXSingleCollectionDataSection)initWithDisplayCollection:(id)a3 lockState:(unint64_t)a4
{
  PXDisplayCollection *v7;
  _PXSingleCollectionDataSection *v8;
  _PXSingleCollectionDataSection *v9;
  objc_super v11;

  v7 = (PXDisplayCollection *)a3;
  v11.receiver = self;
  v11.super_class = (Class)_PXSingleCollectionDataSection;
  v8 = -[PXDataSection initWithOutlineObject:](&v11, sel_initWithOutlineObject_, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_displayCollection, a3);
    v9->_collectionArray[0] = v7;
    v9->_lockState = a4;
    v9->_count = v7 != 0;
  }

  return v9;
}

- (_PXSingleCollectionDataSection)initWithDisplayCollection:(id)a3
{
  return -[_PXSingleCollectionDataSection initWithDisplayCollection:lockState:](self, "initWithDisplayCollection:lockState:", a3, 0);
}

- (int64_t)indexOfCollection:(id)a3
{
  if (objc_msgSend(a3, "isEqual:", self->_displayCollection))
    return 0;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)lockStateForCollection:(id)a3
{
  return self->_lockState;
}

- (id)objectAtIndex:(int64_t)a3
{
  PXDisplayCollection *v5;

  if (-[_PXSingleCollectionDataSection count](self, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%p: index (%lu) beyond bounds (%lu)"), self, a3, -[_PXSingleCollectionDataSection count](self, "count"));
    v5 = 0;
  }
  else
  {
    v5 = self->_displayCollection;
  }
  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  unint64_t result;

  var0 = a3->var0;
  if (var0 >= -[_PXSingleCollectionDataSection count](self, "count"))
    return 0;
  result = 1;
  a3->var0 = 1;
  a3->var1 = (id *)self->_collectionArray;
  a3->var2 = &self->_enumerationMutations;
  return result;
}

- (int64_t)count
{
  return self->_count;
}

- (PXDisplayCollection)displayCollection
{
  return self->_displayCollection;
}

- (unint64_t)lockState
{
  return self->_lockState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayCollection, 0);
}

@end
