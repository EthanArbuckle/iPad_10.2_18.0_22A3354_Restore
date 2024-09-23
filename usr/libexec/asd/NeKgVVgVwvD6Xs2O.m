@implementation NeKgVVgVwvD6Xs2O

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  kjAS9HuCdR1m5txL *v15;
  kjAS9HuCdR1m5txL *v16;
  kjAS9HuCdR1m5txL *v17;
  kjAS9HuCdR1m5txL *v18;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v10 = a6;
  v11 = a7;
  v12 = a8;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_10002214C;
  v32 = sub_10002215C;
  v33 = objc_alloc_init((Class)NSMutableArray);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v13 = dispatch_group_create();
  dispatch_group_enter(v13);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100022164;
  v20[3] = &unk_1004CEE68;
  v22 = &v24;
  v14 = v13;
  v21 = v14;
  v23 = &v28;
  +[NEVPNManager loadAllFromPreferencesWithCompletionHandler:](NEVPNManager, "loadAllFromPreferencesWithCompletionHandler:", v20);
  dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  if (v25[3])
  {
    v15 = [kjAS9HuCdR1m5txL alloc];
    v16 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v15, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", &__NSArray0__struct, v25[3]);
  }
  else
  {
    v17 = [kjAS9HuCdR1m5txL alloc];
    v16 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v17, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v29[5], 0);
  }
  v18 = v16;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v18;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v6;
  unint64_t v7;

  v6 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  objc_msgSend(v6, "encodeInt64:forKey:", 0xF61BD3125A00C9C2, CFSTR("0x5563"));
  v7 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v6);

  return v7;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set](NSSet, "set", a3, a4);
}

@end
