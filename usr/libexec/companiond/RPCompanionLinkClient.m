@implementation RPCompanionLinkClient

- (void)cad_registerRequestID:(id)a3 options:(id)a4 requireOwnerDevice:(BOOL)a5 handler:(id)a6
{
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100011FF8;
  v10[3] = &unk_100030E70;
  v12 = a5;
  v11 = a6;
  v9 = v11;
  -[RPCompanionLinkClient registerRequestID:options:handler:](self, "registerRequestID:options:handler:", a3, a4, v10);

}

- (void)cad_registerEventID:(id)a3 options:(id)a4 requireOwnerDevice:(BOOL)a5 handler:(id)a6
{
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000121F8;
  v10[3] = &unk_100030E98;
  v12 = a5;
  v11 = a6;
  v9 = v11;
  -[RPCompanionLinkClient registerEventID:options:handler:](self, "registerEventID:options:handler:", a3, a4, v10);

}

@end
