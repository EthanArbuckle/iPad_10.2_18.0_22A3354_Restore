@implementation STKNotifySessionData

- (STKNotifySessionData)initWithText:(id)a3 simLabel:(id)a4 notifyType:(int64_t)a5
{
  id v9;
  id v10;
  STKNotifySessionData *v11;
  STKNotifySessionData *v12;
  void *v14;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STKNotifySessionData.m"), 18, CFSTR("NotifyType cannot be unknown."));

  }
  v15.receiver = self;
  v15.super_class = (Class)STKNotifySessionData;
  v11 = -[STKTextSessionData initWithText:simLabel:](&v15, sel_initWithText_simLabel_, v9, v10);
  v12 = v11;
  if (v11)
    v11->_notifyType = a5;

  return v12;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STKNotifySessionData;
  v4 = a3;
  -[STKTextSessionData encodeWithXPCDictionary:](&v5, sel_encodeWithXPCDictionary_, v4);
  xpc_dictionary_set_uint64(v4, "_notifyType", self->_notifyType);

}

- (STKNotifySessionData)initWithXPCDictionary:(id)a3
{
  id v4;
  STKNotifySessionData *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STKNotifySessionData;
  v5 = -[STKTextSessionData initWithXPCDictionary:](&v7, sel_initWithXPCDictionary_, v4);
  if (v5)
    v5->_notifyType = xpc_dictionary_get_uint64(v4, "_notifyType");

  return v5;
}

- (int64_t)notifyType
{
  return self->_notifyType;
}

@end
