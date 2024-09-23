@implementation CRSUIDashboardWidgetWindow

- (void)_maps_safeSetFocusableViews:(id)a3
{
  id v4;
  unsigned int v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  CRSUIDashboardWidgetWindow *v9;

  v4 = a3;
  v5 = -[CRSUIDashboardWidgetWindow invalidated](self, "invalidated");
  if (qword_1014D3C30 != -1)
    dispatch_once(&qword_1014D3C30, &stru_1011DEEB8);
  v6 = (id)qword_1014D3C28;
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 134349056;
      v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Window is invalidated; ignoring -setFocusableViews:",
        (uint8_t *)&v8,
        0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134349056;
      v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Window is valid; calling -setFocusableViews:",
        (uint8_t *)&v8,
        0xCu);
    }

    -[CRSUIDashboardWidgetWindow setFocusableViews:](self, "setFocusableViews:", v4);
  }

}

@end
