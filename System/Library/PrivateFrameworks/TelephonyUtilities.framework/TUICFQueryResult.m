@implementation TUICFQueryResult

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" fromBlockList=%d"), -[TUICFQueryResult isFromBlockList](self, "isFromBlockList"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" allowCallForDestinationID=%d"), -[TUICFQueryResult allowCallForDestinationID](self, "allowCallForDestinationID"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)allowCallForDestinationID
{
  return self->_allowCallForDestinationID;
}

- (void)setAllowCallForDestinationID:(BOOL)a3
{
  self->_allowCallForDestinationID = a3;
}

- (BOOL)isFromBlockList
{
  return self->_fromBlockList;
}

- (void)setFromBlockList:(BOOL)a3
{
  self->_fromBlockList = a3;
}

@end
