@implementation Hc1u6WJuVM53BcQE

- (Hc1u6WJuVM53BcQE)initWithdEyUJuqYjUufZYGN:(id)a3
{
  id v5;
  Hc1u6WJuVM53BcQE *v6;
  Hc1u6WJuVM53BcQE *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Hc1u6WJuVM53BcQE;
  v6 = -[Hc1u6WJuVM53BcQE init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_Po0NnEfbQHpSgzj7, a3);

  return v7;
}

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v12;
  id v13;
  id v14;
  unsigned int var1;
  kjAS9HuCdR1m5txL *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  kjAS9HuCdR1m5txL *v20;
  void *v21;
  const __CFString *v23;
  void *v24;
  _QWORD v25[2];
  const __CFString *v26;
  void *v27;
  _QWORD v28[2];

  v12 = a6;
  v13 = a7;
  v14 = a8;
  var1 = a3->var1;
  if (var1 == 2)
  {
    v20 = (kjAS9HuCdR1m5txL *)objc_claimAutoreleasedReturnValue(-[Hc1u6WJuVM53BcQE cLH5z0XbtucU9RrW:](self, "cLH5z0XbtucU9RrW:", a3));
  }
  else
  {
    if (var1 == 1)
    {
      v16 = [kjAS9HuCdR1m5txL alloc];
      v28[0] = self->_Po0NnEfbQHpSgzj7;
      v26 = CFSTR("v");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var1));
      v27 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
      v28[1] = v18;
      v19 = v28;
    }
    else
    {
      v16 = [kjAS9HuCdR1m5txL alloc];
      v25[0] = self->_Po0NnEfbQHpSgzj7;
      v23 = CFSTR("v");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var1));
      v24 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
      v25[1] = v18;
      v19 = v25;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
    v20 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v16, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v21, 0);

  }
  return v20;
}

- (id)cLH5z0XbtucU9RrW:(_KUwyEjpVZR65eUyl *)a3
{
  char v3;
  id v4;
  void *v5;
  void *v6;
  kjAS9HuCdR1m5txL *v7;
  void *v8;
  void *v9;
  kjAS9HuCdR1m5txL *v10;
  __int16 v12;
  uint64_t var0;
  void *v14;

  var0 = a3->var4.var0.var0;
  v3 = var0;
  v12 = 0;
  sub_10002965C(&var0, &v12);
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  if ((v3 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v12));
    objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("k_m"));

  }
  if ((v3 & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", HIBYTE(v12)));
    objc_msgSend(v4, "setValue:forKey:", v6, CFSTR("a_e"));

  }
  v7 = [kjAS9HuCdR1m5txL alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v4));
  v14 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v10 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v7, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v9, 0);

  return v10;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v6;
  unint64_t v7;

  v6 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  objc_msgSend(v6, "encodeInt64:forKey:", 0x3D0D0285C2C47B97, CFSTR("0x5563"));
  v7 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v6);

  return v7;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set](NSSet, "set", a3, a4);
}

- (NSDictionary)Po0NnEfbQHpSgzj7
{
  return self->_Po0NnEfbQHpSgzj7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Po0NnEfbQHpSgzj7, 0);
}

@end
