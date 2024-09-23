@implementation THWAnchoredWidgetWPStyleProvider

- (THWAnchoredWidgetWPStyleProvider)initWithStorage:(id)a3
{
  THWAnchoredWidgetWPStyleProvider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWAnchoredWidgetWPStyleProvider;
  v4 = -[THWAnchoredWidgetWPStyleProvider init](&v6, "init");
  if (v4)
    v4->_storage = (TSWPStorage *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWAnchoredWidgetWPStyleProvider;
  -[THWAnchoredWidgetWPStyleProvider dealloc](&v3, "dealloc");
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return -[TSWPStorage paragraphStyleAtParIndex:effectiveRange:](self->_storage, "paragraphStyleAtParIndex:effectiveRange:", a3, a4);
}

- (id)coreTextPropertiesFilterDelegateAtParIndex:(unint64_t)a3
{
  return -[THWAnchoredWidgetWPStyleProvider filterDelegate](self, "filterDelegate", a3);
}

- (TSWPStorage)storage
{
  return self->_storage;
}

- (THWPCoreTextPropertiesFilterDelegate)filterDelegate
{
  return self->_filterDelegate;
}

- (void)setFilterDelegate:(id)a3
{
  self->_filterDelegate = (THWPCoreTextPropertiesFilterDelegate *)a3;
}

@end
