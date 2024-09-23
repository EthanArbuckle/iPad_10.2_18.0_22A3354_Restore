@implementation STUActivityUI

- (STUActivityUI)initWithPrimitives:(id)a3 device:(id)a4
{
  id v5;
  STUActivityUI *v6;
  uint64_t v7;
  STUSystemStatusPrimitives *systemStatusPrimitives;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STUActivityUI;
  v6 = -[STUActivityUI init](&v10, "init");
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "systemStatusPrimitives"));
    systemStatusPrimitives = v6->_systemStatusPrimitives;
    v6->_systemStatusPrimitives = (STUSystemStatusPrimitives *)v7;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)STUActivityUI;
  -[STUActivityUI dealloc](&v2, "dealloc");
}

- (void)showActiveConnectionIndicator
{
  void *v3;
  id v4;

  if (!-[STUActivityUI isActiveConnectionIndicatorVisible](self, "isActiveConnectionIndicatorVisible"))
  {
    -[STUActivityUI setActiveConnectionIndicatorVisible:](self, "setActiveConnectionIndicatorVisible:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue(-[STUActivityUI systemStatusPrimitives](self, "systemStatusPrimitives"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "classroomActivity"));
    -[STUActivityUI setClassroomStatusCancelable:](self, "setClassroomStatusCancelable:", v3);

  }
}

- (void)hideActiveConnectionIndicator
{
  if (-[STUActivityUI isActiveConnectionIndicatorVisible](self, "isActiveConnectionIndicatorVisible"))
  {
    -[STUActivityUI setActiveConnectionIndicatorVisible:](self, "setActiveConnectionIndicatorVisible:", 0);
    -[STUActivityUI setClassroomStatusCancelable:](self, "setClassroomStatusCancelable:", 0);
  }
}

- (void)showScreenObserveIndicator
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!-[STUActivityUI isScreenObserveIndicatorVisible](self, "isScreenObserveIndicatorVisible"))
  {
    -[STUActivityUI setScreenObserveIndicatorVisible:](self, "setScreenObserveIndicatorVisible:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUActivityUI systemStatusPrimitives](self, "systemStatusPrimitives"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "airPlayActivity"));
    -[STUActivityUI setAirplayStatusCancelable:](self, "setAirplayStatusCancelable:", v4);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[STUActivityUI systemStatusPrimitives](self, "systemStatusPrimitives"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screenshareActivity"));
    -[STUActivityUI setScreenshareActivityCancelable:](self, "setScreenshareActivityCancelable:", v5);

  }
}

- (void)hideScreenObserveIndicator
{
  if (-[STUActivityUI isScreenObserveIndicatorVisible](self, "isScreenObserveIndicatorVisible"))
  {
    -[STUActivityUI setScreenObserveIndicatorVisible:](self, "setScreenObserveIndicatorVisible:", 0);
    -[STUActivityUI setAirplayStatusCancelable:](self, "setAirplayStatusCancelable:", 0);
    -[STUActivityUI setScreenshareActivityCancelable:](self, "setScreenshareActivityCancelable:", 0);
  }
}

- (BOOL)isActiveConnectionIndicatorVisible
{
  return self->_activeConnectionIndicatorVisible;
}

- (void)setActiveConnectionIndicatorVisible:(BOOL)a3
{
  self->_activeConnectionIndicatorVisible = a3;
}

- (BOOL)isScreenObserveIndicatorVisible
{
  return self->_screenObserveIndicatorVisible;
}

- (void)setScreenObserveIndicatorVisible:(BOOL)a3
{
  self->_screenObserveIndicatorVisible = a3;
}

- (STUSystemStatusPrimitives)systemStatusPrimitives
{
  return self->_systemStatusPrimitives;
}

- (CRKCancelable)screenshareActivityCancelable
{
  return self->_screenshareActivityCancelable;
}

- (void)setScreenshareActivityCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_screenshareActivityCancelable, a3);
}

- (CRKCancelable)classroomStatusCancelable
{
  return self->_classroomStatusCancelable;
}

- (void)setClassroomStatusCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_classroomStatusCancelable, a3);
}

- (CRKCancelable)airplayStatusCancelable
{
  return self->_airplayStatusCancelable;
}

- (void)setAirplayStatusCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_airplayStatusCancelable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airplayStatusCancelable, 0);
  objc_storeStrong((id *)&self->_classroomStatusCancelable, 0);
  objc_storeStrong((id *)&self->_screenshareActivityCancelable, 0);
  objc_storeStrong((id *)&self->_systemStatusPrimitives, 0);
}

@end
