@implementation STUConcreteSystemStatusPrimitives

- (CRKCancelableServer)classroomStatusItemServer
{
  CRKCancelableServer *classroomStatusItemServer;
  CRKCancelableServer *v4;
  CRKCancelableServer *v5;

  classroomStatusItemServer = self->_classroomStatusItemServer;
  if (!classroomStatusItemServer)
  {
    v4 = (CRKCancelableServer *)objc_msgSend(objc_alloc((Class)CRKCancelableServer), "initWithCancelableGenerator:", &stru_1000CACD0);
    v5 = self->_classroomStatusItemServer;
    self->_classroomStatusItemServer = v4;

    classroomStatusItemServer = self->_classroomStatusItemServer;
  }
  return classroomStatusItemServer;
}

- (CRKCancelableServer)screenshareStatusItemServer
{
  CRKCancelableServer *screenshareStatusItemServer;
  CRKCancelableServer *v4;
  CRKCancelableServer *v5;

  screenshareStatusItemServer = self->_screenshareStatusItemServer;
  if (!screenshareStatusItemServer)
  {
    v4 = (CRKCancelableServer *)objc_msgSend(objc_alloc((Class)CRKCancelableServer), "initWithCancelableGenerator:", &stru_1000CACF0);
    v5 = self->_screenshareStatusItemServer;
    self->_screenshareStatusItemServer = v4;

    screenshareStatusItemServer = self->_screenshareStatusItemServer;
  }
  return screenshareStatusItemServer;
}

- (CRKCancelableServer)airplayStatusItemServer
{
  CRKCancelableServer *airplayStatusItemServer;
  CRKCancelableServer *v4;
  CRKCancelableServer *v5;

  airplayStatusItemServer = self->_airplayStatusItemServer;
  if (!airplayStatusItemServer)
  {
    v4 = (CRKCancelableServer *)objc_msgSend(objc_alloc((Class)CRKCancelableServer), "initWithCancelableGenerator:", &stru_1000CAD10);
    v5 = self->_airplayStatusItemServer;
    self->_airplayStatusItemServer = v4;

    airplayStatusItemServer = self->_airplayStatusItemServer;
  }
  return airplayStatusItemServer;
}

- (id)classroomActivity
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteSystemStatusPrimitives classroomStatusItemServer](self, "classroomStatusItemServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "makeCountedCancelable"));

  return v3;
}

- (id)screenshareActivity
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteSystemStatusPrimitives screenshareStatusItemServer](self, "screenshareStatusItemServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "makeCountedCancelable"));

  return v3;
}

- (id)airPlayActivity
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteSystemStatusPrimitives airplayStatusItemServer](self, "airplayStatusItemServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "makeCountedCancelable"));

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airplayStatusItemServer, 0);
  objc_storeStrong((id *)&self->_screenshareStatusItemServer, 0);
  objc_storeStrong((id *)&self->_classroomStatusItemServer, 0);
}

@end
