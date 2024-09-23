@implementation BannerItem

- (BannerItem)initWithGuidanceState:(id)a3
{
  id v4;
  BannerItem *v5;
  IPCGuidanceStateReply *v6;
  IPCGuidanceStateReply *guidanceState;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BannerItem;
  v5 = -[BannerItem init](&v9, "init");
  if (v5)
  {
    v6 = (IPCGuidanceStateReply *)objc_msgSend(v4, "copy");
    guidanceState = v5->_guidanceState;
    v5->_guidanceState = v6;

  }
  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p uniqueId:%@>"), objc_opt_class(self), self, self->_uniqueId);
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)updateFromGuidanceState:(id)a3
{
  IPCGuidanceStateReply *v4;
  IPCGuidanceStateReply *guidanceState;
  id v6;
  NSObject *v7;
  int v8;
  BannerItem *v9;

  v4 = (IPCGuidanceStateReply *)objc_msgSend(a3, "copy");
  guidanceState = self->_guidanceState;
  self->_guidanceState = v4;

  v6 = sub_100431C7C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Update existing item: %@", (uint8_t *)&v8, 0xCu);
  }

}

- (IPCGuidanceStateReply)guidanceState
{
  return self->_guidanceState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidanceState, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
}

@end
