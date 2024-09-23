@implementation LoadedKeySlot

+ (id)withKeySlot:(id)a3 key:(id)a4
{
  id v5;
  id v6;
  LoadedKeySlot *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_opt_new(LoadedKeySlot);
  -[LoadedKeySlot setSlot:](v7, "setSlot:", v6);
  -[LoadedKeySlot setKey:](v7, "setKey:", v5);

  objc_msgSend(v6, "setState:", 3);
  return v7;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  KeySlot *slot;
  PTClassicKey *key;
  objc_super v7;
  uint8_t buf[4];
  KeySlot *v9;
  __int16 v10;
  PTClassicKey *v11;

  v3 = SESDefaultLogObject(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    slot = self->_slot;
    key = self->_key;
    *(_DWORD *)buf = 138412546;
    v9 = slot;
    v10 = 2112;
    v11 = key;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Handle to keySlot %@ with key %@ released", buf, 0x16u);
  }

  if (-[KeySlot state](self->_slot, "state") == 3)
    -[KeySlot setState:](self->_slot, "setState:", 2);
  v7.receiver = self;
  v7.super_class = (Class)LoadedKeySlot;
  -[LoadedKeySlot dealloc](&v7, "dealloc");
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Loaded Key %@ in Slot %@"), self->_key, self->_slot);
}

- (KeySlot)slot
{
  return self->_slot;
}

- (void)setSlot:(id)a3
{
  objc_storeStrong((id *)&self->_slot, a3);
}

- (PTClassicKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_slot, 0);
}

@end
