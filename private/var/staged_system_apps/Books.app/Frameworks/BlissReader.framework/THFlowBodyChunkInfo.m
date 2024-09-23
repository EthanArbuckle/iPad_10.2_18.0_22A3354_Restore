@implementation THFlowBodyChunkInfo

- (THFlowBodyChunkInfo)initWithBodyInfo:(id)a3
{
  THFlowBodyChunkInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THFlowBodyChunkInfo;
  v4 = -[THFlowBodyChunkInfo initWithContext:geometry:](&v6, "initWithContext:geometry:", objc_msgSend(a3, "context"), objc_msgSend(a3, "geometry"));
  if (v4)
    v4->_bodyInfo = (THModelBodyTextInfo *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THFlowBodyChunkInfo;
  -[THModelBodyTextInfo dealloc](&v3, "dealloc");
}

- (BOOL)autosizes
{
  return -[THModelBodyTextInfo autosizes](self->_bodyInfo, "autosizes");
}

- (id)bodyStorage
{
  return -[THModelBodyTextInfo bodyStorage](self->_bodyInfo, "bodyStorage");
}

- (id)columnStyle
{
  return -[THModelBodyTextInfo columnStyle](self->_bodyInfo, "columnStyle");
}

- (id)lineHints
{
  return -[THModelBodyTextInfo lineHints](self->_bodyInfo, "lineHints");
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THFlowBodyLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THFlowBodyRep, a2);
}

- (THModelBodyTextInfo)bodyInfo
{
  return self->_bodyInfo;
}

@end
