@implementation SSDownloadMonitorItem

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDownloadMonitorItem;
  -[SSDownloadMonitorItem dealloc](&v3, sel_dealloc);
}

- (SSDownloadMonitorItem)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    objc_opt_class();
    self->_clientIdentifier = (NSString *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
    self->_itemState = xpc_dictionary_get_int64(a3, "1");
    objc_opt_class();
    self->_statusString = (NSString *)SSXPCDictionaryCopyCFObjectWithClass(a3, "2");
    objc_opt_class();
    self->_representativeTitle = (NSString *)SSXPCDictionaryCopyCFObjectWithClass(a3, "3");
    self->_totalNumberOfItems = xpc_dictionary_get_int64(a3, "4");
    self->_transferTypes = xpc_dictionary_get_int64(a3, "5");
  }
  else
  {

    return 0;
  }
  return self;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_clientIdentifier);
  xpc_dictionary_set_int64(v3, "1", self->_itemState);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_statusString);
  SSXPCDictionarySetCFObject(v3, "3", (__CFString *)self->_representativeTitle);
  xpc_dictionary_set_int64(v3, "4", self->_totalNumberOfItems);
  xpc_dictionary_set_int64(v3, "5", self->_transferTypes);
  return v3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)itemState
{
  return self->_itemState;
}

- (void)setItemState:(int64_t)a3
{
  self->_itemState = a3;
}

- (NSString)representativeTitle
{
  return self->_representativeTitle;
}

- (void)setRepresentativeTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)statusString
{
  return self->_statusString;
}

- (void)setStatusString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)totalNumberOfItems
{
  return self->_totalNumberOfItems;
}

- (void)setTotalNumberOfItems:(int64_t)a3
{
  self->_totalNumberOfItems = a3;
}

- (unint64_t)transferTypes
{
  return self->_transferTypes;
}

- (void)setTransferTypes:(unint64_t)a3
{
  self->_transferTypes = a3;
}

@end
