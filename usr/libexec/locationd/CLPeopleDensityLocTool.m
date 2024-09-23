@implementation CLPeopleDensityLocTool

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_10230B978 != -1)
    dispatch_once(&qword_10230B978, &stru_1021986E0);
  return (id)qword_10230B970;
}

- (CLPeopleDensityLocTool)init
{
  CLPeopleDensityLocTool *v2;
  id v3;
  objc_super v5;
  _QWORD v6[2];

  v5.receiver = self;
  v5.super_class = (Class)CLPeopleDensityLocTool;
  v2 = -[CLPeopleDensity init](&v5, "init");
  if (v2)
  {
    v3 = +[CLIntersiloInterface sharedInterface](CLIntersiloInterface, "sharedInterface");
    v6[0] = &OBJC_PROTOCOL___CLIntersiloServiceProtocol;
    v6[1] = &OBJC_PROTOCOL___CLIntersiloClientProtocol;
    objc_msgSend(v3, "extendSelectorInfoWithProtocol:bases:", &OBJC_PROTOCOL___CLPeopleDensityLocToolProtocol, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));
  }
  return v2;
}

- (void)registerForBluetoothPowerNotification
{
  NSObject *v3;
  _QWORD *v4;
  const std::locale::facet *v5;
  uint64_t v6;
  _QWORD *v7;
  const std::locale::facet *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id location;
  std::locale v13;

  v3 = dispatch_group_create();
  *(_QWORD *)(&self->super._isBluetoothPoweredOn + 1) = v3;
  dispatch_group_enter(v3);
  v4 = sub_100263F7C(&std::cout, (uint64_t)"CLPeopleDensityLocTool, submitting one-shot query", 49);
  std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(_QWORD *)(*v4 - 24)));
  v5 = std::locale::use_facet(&v13, &std::ctype<char>::id);
  v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 10);
  std::locale::~locale(&v13);
  std::ostream::put(v4, v6);
  std::ostream::flush(v4);
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100FEBBA8;
  v10[3] = &unk_102198708;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  -[CLPeopleDensity isUserCurrentlyAloneWithHints:withReply:](self, "isUserCurrentlyAloneWithHints:withReply:", 0, v10);
  v7 = sub_100263F7C(&std::cout, (uint64_t)"CLPeopleDensityLocTool, submitted one-shot-query", 48);
  std::ios_base::getloc((const std::ios_base *)((char *)v7 + *(_QWORD *)(*v7 - 24)));
  v8 = std::locale::use_facet(&v13, &std::ctype<char>::id);
  v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
  std::locale::~locale(&v13);
  std::ostream::put(v7, v9);
  std::ostream::flush(v7);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)registerTerminatingBlock:(id)a3 onQueue:(id)a4
{
  _QWORD *v7;
  const std::locale::facet *v8;
  uint64_t v9;
  _QWORD *v10;
  const std::locale::facet *v11;
  uint64_t v12;
  _QWORD *v13;
  const std::locale::facet *v14;
  uint64_t v15;
  std::locale v16;

  if (*(_QWORD *)(&self->super._isBluetoothPoweredOn + 1))
  {
    v7 = sub_100263F7C(&std::cout, (uint64_t)"CLPeopleDensityLocTool, submitting terminating block", 52);
    std::ios_base::getloc((const std::ios_base *)((char *)v7 + *(_QWORD *)(*v7 - 24)));
    v8 = std::locale::use_facet(&v16, &std::ctype<char>::id);
    v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
    std::locale::~locale(&v16);
    std::ostream::put(v7, v9);
    std::ostream::flush(v7);
    dispatch_group_notify(*(dispatch_group_t *)(&self->super._isBluetoothPoweredOn + 1), (dispatch_queue_t)a4, a3);
    v10 = sub_100263F7C(&std::cout, (uint64_t)"CLPeopleDensityLocTool, submitted terminating block", 51);
    std::ios_base::getloc((const std::ios_base *)((char *)v10 + *(_QWORD *)(*v10 - 24)));
    v11 = std::locale::use_facet(&v16, &std::ctype<char>::id);
    v12 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 10);
    std::locale::~locale(&v16);
    std::ostream::put(v10, v12);
    std::ostream::flush(v10);
  }
  else
  {
    v13 = sub_100263F7C(&std::cout, (uint64_t)"CLPeopleDensityLocTool, terminating block submitted while service is not established, exiting", 93);
    std::ios_base::getloc((const std::ios_base *)((char *)v13 + *(_QWORD *)(*v13 - 24)));
    v14 = std::locale::use_facet(&v16, &std::ctype<char>::id);
    v15 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v14->__vftable[2].~facet_0)(v14, 10);
    std::locale::~locale(&v16);
    std::ostream::put(v13, v15);
    std::ostream::flush(v13);
    (*((void (**)(id))a3 + 2))(a3);
  }
}

@end
