@implementation SROSmartRepliesMessage

- (SROSmartRepliesMessage)init
{
  SROSmartRepliesMessage *v2;
  _TtC12SmartReplies21SRSmartRepliesMessage *v3;
  _TtC12SmartReplies21SRSmartRepliesMessage *underlyingMessage;
  SROSmartRepliesMessage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SROSmartRepliesMessage;
  v2 = -[SROSmartRepliesMessage init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC12SmartReplies21SRSmartRepliesMessage);
    underlyingMessage = v2->_underlyingMessage;
    v2->_underlyingMessage = v3;

    v5 = v2;
  }

  return v2;
}

- (NSString)title
{
  return -[SRSmartRepliesMessage title](self->_underlyingMessage, "title");
}

- (void)setTitle:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[SRSmartRepliesMessage setTitle:](self->_underlyingMessage, "setTitle:", v4);

}

- (NSString)senderIdentifier
{
  return -[SRSmartRepliesMessage senderIdentifier](self->_underlyingMessage, "senderIdentifier");
}

- (void)setSenderIdentifier:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[SRSmartRepliesMessage setSenderIdentifier:](self->_underlyingMessage, "setSenderIdentifier:", v4);

}

- (NSString)summary
{
  return -[SRSmartRepliesMessage summary](self->_underlyingMessage, "summary");
}

- (void)setSummary:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[SRSmartRepliesMessage setSummary:](self->_underlyingMessage, "setSummary:", v4);

}

- (BOOL)isTapBack
{
  return -[SRSmartRepliesMessage isTapBack](self->_underlyingMessage, "isTapBack");
}

- (void)setTapBack:(BOOL)a3
{
  -[SRSmartRepliesMessage setIsTapBack:](self->_underlyingMessage, "setIsTapBack:", a3);
}

- (BOOL)isEmote
{
  return -[SRSmartRepliesMessage isEmote](self->_underlyingMessage, "isEmote");
}

- (void)setEmote:(BOOL)a3
{
  -[SRSmartRepliesMessage setIsEmote:](self->_underlyingMessage, "setIsEmote:", a3);
}

- (BOOL)isRead
{
  return -[SRSmartRepliesMessage isRead](self->_underlyingMessage, "isRead");
}

- (void)setRead:(BOOL)a3
{
  -[SRSmartRepliesMessage setIsRead:](self->_underlyingMessage, "setIsRead:", a3);
}

- (NSDate)dateSent
{
  return -[SRSmartRepliesMessage dateSent](self->_underlyingMessage, "dateSent");
}

- (void)setDateSent:(id)a3
{
  -[SRSmartRepliesMessage setDateSent:](self->_underlyingMessage, "setDateSent:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingMessage, 0);
}

@end
