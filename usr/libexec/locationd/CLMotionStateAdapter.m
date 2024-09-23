@implementation CLMotionStateAdapter

- (void)queryMotionStatesWithStartTime:(double)a3 endTime:(double)a4 isFromInternalClient:(BOOL)a5 withReply:(id)a6
{
  _BOOL8 v7;
  void *v10;
  char *v11;
  char *v12;
  unint64_t v13;
  NSMutableArray *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  double v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;

  v7 = a5;
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v10 = -[CLMotionStateAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, _BOOL8, char **, double, double))(*(_QWORD *)v10 + 216))(v10, v7, &v35, a3, a4);
  v12 = v35;
  v11 = v36;
  v13 = 0xF0F0F0F0F0F0F0F1 * ((v36 - v35) >> 3);
  v14 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v13);
  if (v11 != v12)
  {
    v15 = 0;
    v16 = v13 - 1;
    if (v13 <= 1)
      v17 = 1;
    else
      v17 = v13;
    do
    {
      v18 = *(_OWORD *)&v35[v15 + 112];
      v32 = *(_OWORD *)&v35[v15 + 96];
      v33 = v18;
      v34 = *(_QWORD *)&v35[v15 + 128];
      v19 = *(_OWORD *)&v35[v15 + 48];
      v28 = *(_OWORD *)&v35[v15 + 32];
      v29 = v19;
      v20 = *(_OWORD *)&v35[v15 + 80];
      v30 = *(_OWORD *)&v35[v15 + 64];
      v31 = v20;
      v21 = *(_OWORD *)&v35[v15 + 16];
      v26 = *(_OWORD *)&v35[v15];
      v27 = v21;
      v22 = a4;
      if (v16)
        v22 = *(double *)&v35[v15 + 216] + -2.22044605e-16;
      v23 = objc_alloc((Class)CMMotionActivity);
      v24 = objc_msgSend(v23, "initWithMotionActivity:endDate:", &v25, +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v22, v26, v27, v28, v29, v30, v31, v32, v33, v34));
      -[NSMutableArray addObject:](v14, "addObject:", v24);

      --v16;
      v15 += 136;
      --v17;
    }
    while (v17);
  }
  (*((void (**)(id, NSMutableArray *))a6 + 2))(a6, v14);
  if (v35)
  {
    v36 = v35;
    operator delete(v35);
  }
}

- (void)adaptee
{
  void *result;

  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result)
  return result;
}

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
  if (qword_102302FB8 != -1)
    dispatch_once(&qword_102302FB8, &stru_102147B90);
  return (id)qword_102302FB0;
}

- (CLMotionStateAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMotionStateAdapter;
  return -[CLMotionStateAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLMotionStateProtocol, &OBJC_PROTOCOL___CLMotionStateClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1005E7CA0((uint64_t)-[CLMotionStateAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_1019016C0();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMotionStateAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMotionStateAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMotionStateAdapter adaptee](self, "adaptee"));
  return 0;
}

@end
