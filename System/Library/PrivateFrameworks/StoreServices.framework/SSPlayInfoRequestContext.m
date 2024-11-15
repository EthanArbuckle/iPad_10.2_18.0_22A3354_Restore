@implementation SSPlayInfoRequestContext

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSPlayInfoRequestContext;
  -[SSPlayInfoRequestContext dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5[1] = -[NSNumber copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  v5[2] = -[NSNumber copyWithZone:](self->_contentIdentifier, "copyWithZone:", a3);
  v5[6] = -[NSString copyWithZone:](self->_playbackType, "copyWithZone:", a3);
  v5[3] = -[NSString copyWithZone:](self->_playerGUID, "copyWithZone:", a3);
  v5[4] = -[NSData copyWithZone:](self->_sic, "copyWithZone:", a3);
  v5[5] = -[NSArray copyWithZone:](self->_sinfs, "copyWithZone:", a3);
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_accountIdentifier);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_contentIdentifier);
  SSXPCDictionarySetObject(v3, "5", self->_playbackType);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_playerGUID);
  SSXPCDictionarySetCFObject(v3, "3", (__CFString *)self->_sic);
  SSXPCDictionarySetCFObject(v3, "4", (__CFString *)self->_sinfs);
  return v3;
}

- (SSPlayInfoRequestContext)initWithXPCEncoding:(id)a3
{
  SSPlayInfoRequestContext *v5;
  uint64_t v7;
  objc_super v8;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v8.receiver = self;
    v8.super_class = (Class)SSPlayInfoRequestContext;
    v5 = -[SSPlayInfoRequestContext init](&v8, sel_init);
    if (v5)
    {
      objc_opt_class();
      v5->_accountIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      objc_opt_class();
      v5->_contentIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
      v7 = objc_opt_class();
      v5->_playbackType = (NSString *)SSXPCDictionaryCopyObjectWithClass(a3, "5", v7);
      objc_opt_class();
      v5->_playerGUID = (NSString *)SSXPCDictionaryCopyCFObjectWithClass(a3, "2");
      objc_opt_class();
      v5->_sic = (NSData *)SSXPCDictionaryCopyCFObjectWithClass(a3, "3");
      objc_opt_class();
      v5->_sinfs = (NSArray *)SSXPCDictionaryCopyCFObjectWithClass(a3, "4");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)contentIdentifier
{
  return self->_contentIdentifier;
}

- (void)setContentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)playbackType
{
  return self->_playbackType;
}

- (void)setPlaybackType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)playerGUID
{
  return self->_playerGUID;
}

- (void)setPlayerGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)SICData
{
  return self->_sic;
}

- (void)setSICData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)sinfs
{
  return self->_sinfs;
}

- (void)setSinfs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
