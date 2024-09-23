@implementation RBStateCaptureItem

- (RBStateCaptureItem)initWithTitle:(id)a3 identifier:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  RBStateCaptureItem *v11;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  id block;
  void *v18;
  uint64_t v19;
  RBSInvalidatable *invalidatable;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)RBStateCaptureItem;
  v11 = -[RBStateCaptureItem init](&v22, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    block = v11->_block;
    v11->_block = (id)v16;

    dispatch_get_global_queue(17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _RBLogAddStateCaptureBlockWithTitle(v18, v11->_title, v11->_block);
    v19 = objc_claimAutoreleasedReturnValue();
    invalidatable = v11->_invalidatable;
    v11->_invalidatable = (RBSInvalidatable *)v19;

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[RBSInvalidatable invalidate](self->_invalidatable, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)RBStateCaptureItem;
  -[RBStateCaptureItem dealloc](&v3, sel_dealloc);
}

- (id)block
{
  return self->_block;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_invalidatable, 0);
}

@end
