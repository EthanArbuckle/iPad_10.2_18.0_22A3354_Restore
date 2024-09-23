@implementation _AnnounceHandlingTask

- (_AnnounceHandlingTask)initWithData:(id)a3 recordIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  _AnnounceHandlingTask *v9;
  _AnnounceHandlingTask *v10;
  _AnnounceHandlingTask *v11;
  id v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)GEOAnnouncement), "initWithData:", v6);
  if (v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)_AnnounceHandlingTask;
    v9 = -[NotificationHandlingTask initWithData:recordIdentifier:](&v15, "initWithData:recordIdentifier:", v6, v7);
    v10 = v9;
    if (v9)
      objc_storeStrong((id *)&v9->_announcement, v8);
    self = v10;
    v11 = self;
  }
  else
  {
    v12 = sub_100431A4C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "_AnnounceHandlingTask GEOAnnouncement nil with data", buf, 2u);
    }

    v11 = 0;
  }

  return v11;
}

- (void)performTask
{
  id v3;
  NSObject *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  PresentFlyoverAction *v8;
  PresentAnnouncementAction *v9;
  PresentAnnouncementAction *v10;
  RichMapsActivity *v11;
  uint64_t v12;

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  if ((-[GEOAnnouncement displayDestinations](self->_announcement, "displayDestinations") & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAnnouncement buttonOneAppURI](self->_announcement, "buttonOneAppURI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v6));

    if (objc_msgSend(v7, "scanString:intoString:", CFSTR("flyover:"), 0))
    {
      v12 = 0;
      if (!objc_msgSend(v7, "scanUnsignedLongLong:", &v12))
      {
LABEL_10:
        -[NotificationHandlingTask _clearBulletin](self, "_clearBulletin");

        return;
      }
      v8 = [PresentFlyoverAction alloc];
      v9 = -[PresentFlyoverAction initWithAnnouncement:muid:](v8, "initWithAnnouncement:muid:", self->_announcement, v12);
    }
    else
    {
      v9 = -[PresentAnnouncementAction initWithAnnouncement:]([PresentAnnouncementAction alloc], "initWithAnnouncement:", self->_announcement);
    }
    v10 = v9;
    v11 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v9);
    -[RichMapsActivityCreatingTaskImpl taskFinished:](self, "taskFinished:", v11);

    goto LABEL_10;
  }
  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = -[GEOAnnouncement displayDestinations](self->_announcement, "displayDestinations");
    LODWORD(v12) = 67109120;
    HIDWORD(v12) = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "_AnnounceHandlingTask performTask AnnouncementDestination %u not ANNOUNCEMENT_APPLICATION", (uint8_t *)&v12, 8u);
  }

  -[RichMapsActivityCreatingTaskImpl taskFailed](self, "taskFailed");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_announcement, 0);
}

@end
