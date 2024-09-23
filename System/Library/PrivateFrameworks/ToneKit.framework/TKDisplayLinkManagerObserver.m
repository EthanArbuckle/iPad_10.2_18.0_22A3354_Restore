@implementation TKDisplayLinkManagerObserver

- (TKDisplayLinkManagerObserver)initWithBlock:(id)a3
{
  return -[TKDisplayLinkManagerObserver initWithBlock:frameInterval:](self, "initWithBlock:frameInterval:", a3, 1);
}

- (TKDisplayLinkManagerObserver)initWithBlock:(id)a3 frameInterval:(unint64_t)a4
{
  id v6;
  TKDisplayLinkManagerObserver *v7;
  TKDisplayLinkManagerObserver *v8;
  uint64_t v9;
  id block;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TKDisplayLinkManagerObserver;
  v7 = -[TKDisplayLinkManagerObserver init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    if (v6 && a4)
    {
      v9 = objc_msgSend(v6, "copy");
      block = v8->_block;
      v8->_block = (id)v9;

      v8->_frameInterval = a4;
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  BOOL v5;

  v4 = (id *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_block == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return objc_msgSend(self->_block, "hash");
}

- (void)displayDidRefresh:(id)a3
{
  unint64_t displayDidRefreshCount;

  displayDidRefreshCount = self->_displayDidRefreshCount;
  if (!(displayDidRefreshCount % self->_frameInterval))
    (*((void (**)(void))self->_block + 2))();
  self->_displayDidRefreshCount = displayDidRefreshCount + 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
