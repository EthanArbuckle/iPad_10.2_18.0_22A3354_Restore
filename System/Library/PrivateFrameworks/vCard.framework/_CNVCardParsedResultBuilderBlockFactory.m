@implementation _CNVCardParsedResultBuilderBlockFactory

- (_CNVCardParsedResultBuilderBlockFactory)initWithBlock:(id)a3
{
  id v4;
  _CNVCardParsedResultBuilderBlockFactory *v5;
  uint64_t v6;
  id block;
  _CNVCardParsedResultBuilderBlockFactory *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNVCardParsedResultBuilderBlockFactory;
  v5 = -[_CNVCardParsedResultBuilderBlockFactory init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (id)makeBuilder
{
  return (id)(*((uint64_t (**)(void))self->_block + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
