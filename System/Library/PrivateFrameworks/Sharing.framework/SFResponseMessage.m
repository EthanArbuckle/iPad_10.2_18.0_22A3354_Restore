@implementation SFResponseMessage

- (SFResponseMessage)initWithRequestMessage:(id)a3
{
  id v4;
  SFResponseMessage *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  SFDevice *peerDevice;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFResponseMessage;
  v5 = -[SFResponseMessage init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->super._identifier;
    v5->super._identifier = (NSUUID *)v6;

    objc_msgSend(v4, "peerDevice");
    v8 = objc_claimAutoreleasedReturnValue();
    peerDevice = v5->super._peerDevice;
    v5->super._peerDevice = (SFDevice *)v8;

  }
  return v5;
}

@end
