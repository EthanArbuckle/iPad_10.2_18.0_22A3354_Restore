@implementation THTextWrapCookie

- (THTextWrapCookie)init
{
  THTextWrapCookie *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THTextWrapCookie;
  v2 = -[THTextWrapCookie init](&v4, "init");
  if (v2)
    v2->_floatingWrappables = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THTextWrapCookie;
  -[THTextWrapCookie dealloc](&v3, "dealloc");
}

- (void)addFloatingWrappable:(id)a3
{
  if (objc_msgSend(a3, "wrapType"))
    -[NSMutableArray addObject:](self->_floatingWrappables, "addObject:", a3);
}

- (TSWPColumn)column
{
  return self->_column;
}

- (void)setColumn:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (TSWPLayoutTarget)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  self->_target = (TSWPLayoutTarget *)a3;
}

- (NSArray)floatingWrappables
{
  return &self->_floatingWrappables->super;
}

@end
