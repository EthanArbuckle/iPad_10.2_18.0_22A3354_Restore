@implementation ZC5UHnWnOtc38V53

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  kjAS9HuCdR1m5txL *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  kjAS9HuCdR1m5txL *v18;
  _QWORD v20[2];
  _QWORD v21[2];
  void *v22;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LARatchetManager sharedInstance](LARatchetManager, "sharedInstance", a3, a4, *(_QWORD *)&a5, a6, a7, a8));
  v9 = objc_msgSend(v8, "isFeatureEnabled");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[LARatchetManager sharedInstance](LARatchetManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ratchetState"));
  v12 = objc_msgSend(v11, "rawValue");

  v13 = [kjAS9HuCdR1m5txL alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9, CFSTR("dto")));
  v20[1] = CFSTR("rs");
  v21[0] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12));
  v21[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
  v22 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  v18 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v13, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v17, 0);

  return v18;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v6;
  unint64_t v7;

  v6 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  objc_msgSend(v6, "encodeInt64:forKey:", 0x97EE7E1D1A32667CLL, CFSTR("0x5563"));
  v7 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v6);

  return v7;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set](NSSet, "set", a3, a4);
}

@end
