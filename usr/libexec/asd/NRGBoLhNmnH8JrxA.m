@implementation NRGBoLhNmnH8JrxA

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  kjAS9HuCdR1m5txL *v15;
  kjAS9HuCdR1m5txL *v16;
  NSObject *v17;
  NSObject *v18;
  unsigned int var0;
  unsigned int var1;
  _DWORD v22[2];
  __int16 v23;
  unsigned int v24;

  v11 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v12 = (id)qword_1005185E0;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v22[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "jdf", "enableTelemetry=YES", (uint8_t *)v22, 2u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRGBoLhNmnH8JrxA bagIDForDF:](self, "bagIDForDF:", a3));
  if (v14)
    v15 = (kjAS9HuCdR1m5txL *)objc_claimAutoreleasedReturnValue(-[NRGBoLhNmnH8JrxA processServerJSONDataframeForBagWithID:](self, "processServerJSONDataframeForBagWithID:", v14));
  else
    v15 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:]([kjAS9HuCdR1m5txL alloc], "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", &__NSArray0__struct, 165022);
  v16 = v15;
  v17 = (id)qword_1005185E0;
  v18 = v17;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    var0 = a4->var0;
    var1 = a4->var1;
    v22[0] = 67240448;
    v22[1] = var0;
    v23 = 1026;
    v24 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v11, "jdf", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", (uint8_t *)v22, 0xEu);
  }

  return v16;
}

- (id)bagIDForDF:(_KUwyEjpVZR65eUyl *)a3
{
  unsigned int var1;
  id v4;

  var1 = a3->var1;
  if (var1 == 2)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &a3->var4);
  }
  else if (var1 == 1)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[RavioliConstants ravioliUUID](_TtC3asd16RavioliConstants, "ravioliUUID"));
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)processServerJSONDataframeForBagWithID:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  kjAS9HuCdR1m5txL *v11;
  kjAS9HuCdR1m5txL *v12;
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_10001772C;
  v22 = sub_10001773C;
  v23 = 0;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RavioliManagerObjC shared](_TtC3asd18RavioliManagerObjC, "shared"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100017744;
  v15[3] = &unk_1004CEB98;
  v17 = &v18;
  v6 = v4;
  v16 = v6;
  objc_msgSend(v5, "fetchRavioliDataFromStoreFor:completion:", v3, v15);

  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = v19[5];
  if (v7)
  {
    v14 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v7, 0, &v14));
    v9 = v14;
    v10 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
      v11 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:]([kjAS9HuCdR1m5txL alloc], "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v8, 0);
    else
      v11 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:]([kjAS9HuCdR1m5txL alloc], "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", &__NSArray0__struct, 165020);
    v12 = v11;
  }
  else
  {
    v12 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:]([kjAS9HuCdR1m5txL alloc], "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", &__NSArray0__struct, 165021);
    v9 = (id)objc_claimAutoreleasedReturnValue(+[RavioliManagerObjC shared](_TtC3asd18RavioliManagerObjC, "shared"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[DefinedRavioliNotificationIds missingBag](_TtC3asd29DefinedRavioliNotificationIds, "missingBag"));
    objc_msgSend(v9, "requestRavioliFetchWithProbabiliticThrottleWithBagID:notificationId:", v3, v8);
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v7;
  unint64_t v8;

  v7 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  objc_msgSend(v7, "encodeInt64:forKey:", 0x569FF933A7589E17, CFSTR("0x5563"));
  objc_msgSend(v7, "encodeInt:forKey:", a3->var1, CFSTR("0x6595"));
  if (a3->var1 == 2)
    objc_msgSend(v7, "encodeBytes:length:", &a3->var4, 16);
  v8 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v7);

  return v8;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set](NSSet, "set", a3, a4);
}

@end
