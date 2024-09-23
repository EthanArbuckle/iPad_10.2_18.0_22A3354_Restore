@implementation THWKeynoteInfo

- (THWKeynoteInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 showInfo:(id)a6 adornmentInfo:(id)a7 showTransportControls:(BOOL)a8 autoPlayConfig:(id)a9
{
  _BOOL8 v9;
  THWKeynoteInfo *v12;
  THWKeynoteInfo *v13;
  objc_super v15;

  v9 = a8;
  v15.receiver = self;
  v15.super_class = (Class)THWKeynoteInfo;
  v12 = -[THWKeynoteInfo initWithContext:geometry:](&v15, "initWithContext:geometry:", a3, a4, a5);
  v13 = v12;
  if (v12)
  {
    -[THWKeynoteInfo setShowInfo:](v12, "setShowInfo:", a6);
    -[THWKeynoteInfo setAdornmentInfo:](v13, "setAdornmentInfo:", a7);
    -[THWKeynoteInfo setShowTransportControls:](v13, "setShowTransportControls:", v9);
    -[THWKeynoteInfo setAutoplayConfig:](v13, "setAutoplayConfig:", a9);
    objc_msgSend(a7, "updateParentInfo:", v13);
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteInfo;
  -[THWKeynoteInfo dealloc](&v3, "dealloc");
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THWKeynoteLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THWKeynoteRep, a2);
}

- (id)childInfos
{
  THWWidgetAdornmentInfo *adornmentInfo;
  NSArray *showInfo;

  adornmentInfo = self->_adornmentInfo;
  showInfo = (NSArray *)self->_showInfo;
  if (showInfo)
    showInfo = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:");
  return -[THWWidgetAdornmentInfo interleavedInfosWithInfos:](adornmentInfo, "interleavedInfosWithInfos:", showInfo);
}

- (id)childEnumerator
{
  return objc_msgSend(-[THWKeynoteInfo childInfos](self, "childInfos"), "objectEnumerator");
}

- (NSString)progressKitID
{
  return self->_progressKitID;
}

- (void)setProgressKitID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)progressKitSectionID
{
  return self->_progressKitSectionID;
}

- (void)setProgressKitSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (THWWidgetAdornmentInfo)adornmentInfo
{
  return self->_adornmentInfo;
}

- (void)setAdornmentInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (THWKeynoteShowInfo)showInfo
{
  return self->_showInfo;
}

- (void)setShowInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)showTransportControls
{
  return self->_showTransportControls;
}

- (void)setShowTransportControls:(BOOL)a3
{
  self->_showTransportControls = a3;
}

- (THWAutoplayConfig)autoplayConfig
{
  return self->_autoplayConfig;
}

- (void)setAutoplayConfig:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
